
function Character() {
}

Character.prototype.changeStats = function(newStats) {

    this.maxHp = 2 * newStats[VITALITY];
    this.maxMp = newStats[INTELLIGENCE];
};

Character.prototype.die = function(attacker) {

    if (!this.invokeTrigger("ondie", attacker)) {
        return;
    }

    this.send("You died.", Color.Red);

    var room = this.currentRoom;
    var myName = this.definiteName(room.characters, Options.Capitalized);

    var others = room.characters;
    others.removeOne(this);
    others.send("%1 died.".arg(myName), Color.Teal);

    if (!this.inventory.isEmpty() || this.gold > 0.0) {
        var droppedItemsDescription;

        if (!this.inventory.isEmpty()) {
            this.inventory.forEach(function(item) {
                room.addItem(item);
            });

            droppedItemsDescription = inventory.joinFancy();

            this.inventory = [];
        }

        if (this.gold > 0.0) {
            room.addGold(this.gold);

            if (!droppedItemsDescription.isEmpty()) {
                droppedItemsDescription += " and ";
            }
            droppedItemsDescription += "$%1 worth of gold".arg(this.gold);

            this.gold = 0.0;
        }

        others.send("%1 was carrying %2.".arg(myName, droppedItemsDescription), Color.Teal);
    }

    for (var i = 0, length = others.length; i < length; i++) {
        others[i].invokeTrigger("oncharacterdied", this, attacker);
    };

    this.killAllTimers();

    room.removeCharacter(this);

    if (this.isPlayer()) {
        LogUtil.countPlayerDeath(room.toString());

        this.enter(this.race.startingRoom);

        this.hp = 1;
        this.stun(5000);
    } else {
        if (this.respawnTime) {
            var respawnTime = this.respawnTime + randomInt(0, this.respawnTimeVariation);
            this.setTimeout(function() {
                this.hp = this.maxHp;
                this.mp = this.maxMp;

                this.enter(this.currentRoom);

                this.invokeTrigger("onspawn");
            }, respawnTime);
        } else {
            this.setDeleted();
        }
    }
};

Character.prototype.kill = function(character) {

    if (this.secondsStunned() > 0) {
        this.send("Please wait %1 seconds.".arg(this.secondsStunned()), Color.Olive);
        return;
    }

    if (!character.invokeTrigger("onattack", this)) {
        return;
    }

    var room = this.currentRoom;

    var others = room.characters;
    others.removeOne(this);
    others.removeOne(character);

    var invoked = false;
    if (room.hasTrigger("oncombat")) {
        invoked = room.invokeTrigger("oncombat", this, character, others);
    }
    if (!invoked) {
        Realm.invokeTrigger("oncombat", this, character, others);
    }

    for (var i = 0, length = others.length; i < length; i++) {
        others[i].invokeTrigger("oncharacterattacked", this, character);
    }

    if (character.hp === 0) {
        character.die(this);
    }
};

Character.prototype.lookAtBy = function(character) {

    var pool = this.currentRoom.characters;

    var text;
    if (character.id === this.id) {
        text = "You look at yourself.\n";
    } else if (this.isPlayer()) {
        text = "You look at %1, a %2 %3.\n"
               .arg(this.definiteName(pool), this.race.adjective, this.characterClass.name);
    } else {
        text = "You look at %1.\n".arg(this.definiteName(pool));
    }

    if (!this.description.isEmpty()) {
        text += this.description + "\n";
    }

    var wieldedItems = [];
    if (this.weapon) {
        wieldedItems.append(this.weapon);
    }
    if (this.secondaryWeapon) {
        wieldedItems.append(this.secondaryWeapon);
    }
    if (this.shield) {
        wieldedItems.append(this.shield);
    }
    if (!wieldedItems.isEmpty()) {
        text += "%1 is wielding %2.\n".arg(this.subjectPronoun.capitalized())
                                      .arg(wieldedItems.joinFancy());
    }

    if (character.id !== this.id) {
        var observerStatsTotal = character.stats.total();
        if (character.weapon) {
            observerStatsTotal += character.weapon.stats.total();
        }
        var characterStatsTotal = this.stats.total();
        if (this.weapon) {
            characterStatsTotal += this.weapon.stats.total();
        }
        var statsDiff = observerStatsTotal - characterStatsTotal;

        if (statsDiff > 25) {
            if (character.race.name === "giant" && this.race.name !== "giant") {
                text += "You should be careful not to accidentally step on %1.\n"
                        .arg(this.objectPronoun);
            } else if (character.race.name === "goblin" && this.race.name !== "goblin") {
                text += "%1 should be thankful if you don't kill %2.\n"
                        .arg(this.subjectPronoun.capitalized(), this.objectPronoun);
            } else {
                text += "If it came to a fight with %1, %2'd better get %3 friends first.\n"
                        .arg(this.objectPronoun, this.subjectPronoun, this.possessiveAdjective);
            }
        } else if (statsDiff > 15) {
            text += "%1 is not much of a match for you.\n".arg(this.subjectPronoun.capitalized());
        } else if (statsDiff > 5) {
            text += "You appear to be a bit stronger than %1.\n".arg(this.objectPronoun);
        } else if (statsDiff < -25) {
            text += "%1 could kill you with a needle.\n".arg(this.subjectPronoun.capitalized());
        } else if (statsDiff < -15) {
            text += "%1 appears like %2 could put up one hell of a fight.\n"
                    .arg(this.subjectPronoun.capitalized(), this.subjectPronoun);
        } else if (statsDiff < -5) {
            text += "You should think twice before attacking %2.\n".arg(this.objectPronoun);
        } else {
            text += "%1 appears to be about as strong as you are.\n"
                    .arg(this.subjectPronoun.capitalized());
        }
    }

    return text;
};

Character.prototype.maxInventoryWeight = function() {

    return 20 + this.stats[STRENGTH] + Math.floor(this.stats[ENDURANCE] / 2);
};

Character.prototype.regenerate = function() {

    this.hp += max(Math.floor(this.stats[VITALITY] / 15), 1);
};

Character.prototype.take = function(items) {

    var room = this.currentRoom;

    var takenItems = [];
    for (var i = 0, length = items.length; i < length; i++) {
        var item = items[i];
        if (item.name.endsWith("worth of gold")) {
            this.gold += item.cost;
            room.removeItem(item);
            takenItems.append(item);
        } else if (item.portable) {
            if (this.inventoryWeight() + item.weight <= this.maxInventoryWeight()) {
                this.addInventoryItem(item);
                room.removeItem(item);
                takenItems.append(item);
            } else {
                this.send("You can't take %1, because it's too heavy."
                          .arg(item.definiteName(room.items)));
            }
        } else {
            this.send("You can't take %1.".arg(item.definiteName(room.items)));
        }
    }

    if (!takenItems.isEmpty()) {
        var description = takenItems.joinFancy(Options.DefiniteArticles);
        this.send("You take %2.".arg(description));

        var others = room.characters;
        others.removeOne(this);
        others.send("%1 takes %3.".arg(this.definiteName(room.characters, Options.Capitalized),
                                       description));
    }
};
