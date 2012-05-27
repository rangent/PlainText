#ifndef CHARACTER_H
#define CHARACTER_H

#include "characterstats.h"
#include "item.h"
#include "gameobjectptr.h"

#include <QString>


class Character : public Item {

    Q_OBJECT

    public:
        explicit Character(uint id, Options options = NoOptions);
        virtual ~Character();

        virtual void setName(const QString &newName);

        const GameObjectPtr &currentArea() const { return m_currentArea; }
        virtual void setCurrentArea(const GameObjectPtr &currentArea);
        Q_PROPERTY(GameObjectPtr currentArea READ currentArea WRITE setCurrentArea)

        const GameObjectPtrList &inventory() const { return m_inventory; }
        Q_INVOKABLE virtual void addInventoryItem(const GameObjectPtr &item);
        Q_INVOKABLE virtual void removeInventoryItem(const GameObjectPtr &item);
        virtual void setInventory(const GameObjectPtrList &inventory);
        Q_PROPERTY(GameObjectPtrList inventory READ inventory WRITE setInventory)

        const GameObjectPtr &race() const { return m_race; }
        virtual void setRace(const GameObjectPtr &race);
        Q_PROPERTY(GameObjectPtr race READ race WRITE setRace)

        const GameObjectPtr &characterClass() const { return m_class; }
        virtual void setClass(const GameObjectPtr &characterClass);
        Q_PROPERTY(GameObjectPtr characterClass READ characterClass WRITE setClass)

        const QString &gender() const { return m_gender; }
        virtual void setGender(const QString &gender);
        Q_PROPERTY(QString gender READ gender WRITE setGender)

        const CharacterStats &stats() const { return m_stats; }
        virtual void setStats(const CharacterStats &stats);
        Q_PROPERTY(CharacterStats stats READ stats WRITE setStats)

        int hp() const { return m_hp; }
        virtual void adjustHp(int delta);
        virtual void setHp(int hp);
        Q_PROPERTY(int hp READ hp WRITE setHp)

        int maxHp() const { return m_maxHp; }
        virtual void setMaxHp(int maxHp);
        Q_PROPERTY(int maxHp READ maxHp WRITE setMaxHp)

        int mp() const { return m_mp; }
        virtual void adjustMp(int delta);
        virtual void setMp(int mp);
        Q_PROPERTY(int mp READ mp WRITE setMp)

        int maxMp() const { return m_maxMp; }
        virtual void setMaxMp(int maxMp);
        Q_PROPERTY(int maxMp READ maxMp WRITE setMaxMp)

        int sp() const { return m_sp; }
        virtual void adjustSp(int delta);
        virtual void setSp(int sp);
        Q_PROPERTY(int sp READ sp WRITE setSp)

        int maxSp() const { return m_maxSp; }
        virtual void setMaxSp(int maxSp);
        Q_PROPERTY(int maxSp READ maxSp WRITE setMaxSp)

        int gold() const { return m_gold; }
        virtual void adjustGold(int delta);
        virtual void setGold(int gold);
        Q_PROPERTY(int gold READ gold WRITE setGold)

        Q_INVOKABLE virtual void open(const GameObjectPtr &exit);
        Q_INVOKABLE virtual void close(const GameObjectPtr &exit);
        Q_INVOKABLE virtual void go(const GameObjectPtr &exit);

        virtual void enter(const GameObjectPtr &area);
        virtual void leave(const GameObjectPtr &area, const QString &exitName = QString());

        Q_INVOKABLE virtual void say(const QString &message);
        Q_INVOKABLE virtual void shout(const QString &message);
        Q_INVOKABLE virtual void talk(const GameObjectPtr &character, const QString &message);
        Q_INVOKABLE virtual void tell(const GameObjectPtr &player, const QString &message);

    protected:
        explicit Character(const char *objectType, uint id, Options options = NoOptions);

    private:
        GameObjectPtr m_currentArea;

        GameObjectPtrList m_inventory;

        GameObjectPtr m_race;
        GameObjectPtr m_class;
        QString m_gender;

        CharacterStats m_stats;

        int m_hp;
        int m_maxHp;

        int m_mp;
        int m_maxMp;

        int m_sp;
        int m_maxSp;

        int m_gold;
};

#endif // CHARACTER_H
