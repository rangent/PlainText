#include "speechevent.h"

#include "character.h"
#include "gameexception.h"
#include "logutil.h"
#include "room.h"
#include "util.h"


#define super SoundEvent

SpeechEvent::SpeechEvent(Room *origin, double strength) :
    super(GameEventType::Speech, origin, strength),
    m_speaker(nullptr),
    m_isShout(strength > 2.0) {
}

SpeechEvent::~SpeechEvent() {
}

void SpeechEvent::setSpeaker(const GameObjectPtr &speaker) {

    try {
        m_speaker = speaker.cast<Character *>();
    } catch (GameException &exception) {
        LogUtil::logError("Exception in SpeechEvent::setSpeaker(): %1", exception.what());
    }
}

void SpeechEvent::setMessage(const QString &message) {

    m_message = message;
}

void SpeechEvent::setTarget(const GameObjectPtr &target) {

    m_target = target;
}

QString SpeechEvent::descriptionForStrengthAndCharacterInRoom(double strength, Character *character,
                                                              Room *room) const {

    Q_UNUSED(character)
    if (!m_speaker) {
        LogUtil::logDebug("No speaker set for SpeechEvent.");
        return "";
    }

    if (strength >= 0.8) {
        QString description;
        if (m_isShout) {
            description = QString(".!?").contains(m_message.right(1)) ?
                          "%1 shouts, \"%2\"" : "%1 shouts, \"%2!\"";
        } else if (m_message.endsWith("?")) {
            if (m_target.isNull()) {
                description = "%1 asks, \"%2\"";
            } else {
                GameObjectPtrList pool = originRoom()->characters();
                description = QString("%2 asks %1, \"%3\"").arg(m_target->definiteName(pool));
            }
        } else {
            if (m_target.isNull()) {
                description = (m_message.endsWith(".") || m_message.endsWith("!")) ?
                              "%1 says, \"%2\"" : "%1 says, \"%2.\"";
            } else {
                GameObjectPtrList pool = originRoom()->characters();
                description = QString((m_message.endsWith(".") || m_message.endsWith("!")) ?
                                      "%2 says to %1, \"%3\"" : "%2 says to %1, \"%3.\"")
                              .arg(m_target->definiteName(pool));
            }
        }
        return description.arg(m_speaker->definiteName(originRoom()->characters(), Capitalized),
                               Util::capitalize(m_message));
    } else if (strength >= 0.5) {
        QStringList garbledWords;
        QString word;
        int numHeardWords = 0;
        for (const QChar &character : m_message) {
            if (character == ' ') {
                if (qrand() % 100 < 150.0 * (strength - 0.2)) {
                    garbledWords.append(word);
                    numHeardWords++;
                } else {
                    garbledWords.append(QString(word.length(), '.'));
                }
                word.clear();
            } else if (character.isLetterOrNumber()) {
                word.append(character);
            }
        }
        if (qrand() % 100 < 150.0 * (strength - 0.2)) {
            garbledWords.append(word);
            numHeardWords++;
        } else {
            garbledWords.append(QString(word.length(), '.'));
        }
        QString garbledMessage;
        if (numHeardWords == 0) {
            garbledMessage = " something, but you cannot make out a word of it.";
        } else {
            garbledMessage = QString(", \"%1\"").arg(garbledWords.join(" "));
        }

        QString direction = Util::directionForVector(originRoom()->position() - room->position());
        return QString("You hear a " + QString(m_speaker->gender() == "male" ? "man " : "woman ") +
                       (direction == "up" ? "from above " : (direction == "down" ? "from below " :
                                                            QString("to the " + direction + " "))) +
                       (m_isShout ? "shouting" : "saying") +
                       garbledMessage);
    } else {
        QString what = m_isShout ? "shout" : "mutter";
        if (strength >= (m_speaker->gender() == "male" ? 0.4 : 0.3)) {
            QString direction = Util::directionForVector(originRoom()->position() -
                                                         room->position());
            if (direction == "up") {
                return QString("You hear a distant %1 from above.").arg(what);
            } else if (direction == "down") {
                return QString("You hear a distant %1 from below.").arg(what);
            } else {
                return QString("You hear a distant %1 from the %2.").arg(what, direction);
            }
        } else {
            return QString("You hear a distant %1.").arg(what);
        }
    }
}
