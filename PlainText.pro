include(environment.pri)

TARGET = PlainText

TEMPLATE = app

LIBS += -lz

SOURCES += \
    src/main.cpp \
    src/engine/application.cpp \
    src/engine/characterstats.cpp \
    src/engine/commandinterpreter.cpp \
    src/engine/commandregistry.cpp \
    src/engine/conversionutil.cpp \
    src/engine/diskutil.cpp \
    src/engine/effect.cpp \
    src/engine/engine.cpp \
    src/engine/gameeventmultipliermap.cpp \
    src/engine/gameexception.cpp \
    src/engine/gameobjectptr.cpp \
    src/engine/gameobjectsyncthread.cpp \
    src/engine/gamethread.cpp \
    src/engine/logthread.cpp \
    src/engine/logutil.cpp \
    src/engine/metatyperegistry.cpp \
    src/engine/modifier.cpp \
    src/engine/point3d.cpp \
    src/engine/scriptengine.cpp \
    src/engine/scriptfunction.cpp \
    src/engine/scriptfunctionmap.cpp \
    src/engine/session.cpp \
    src/engine/triggerregistry.cpp \
    src/engine/util.cpp \
    src/engine/vector3d.cpp \
    src/engine/commands/command.cpp \
    src/engine/commands/scriptcommand.cpp \
    src/engine/commands/admin/admincommand.cpp \
    src/engine/commands/admin/copyitemcommand.cpp \
    src/engine/commands/admin/copytriggerscommand.cpp \
    src/engine/commands/admin/execscriptcommand.cpp \
    src/engine/commands/admin/getpropcommand.cpp \
    src/engine/commands/admin/gettriggercommand.cpp \
    src/engine/commands/admin/listmethodscommand.cpp \
    src/engine/commands/admin/listpropscommand.cpp \
    src/engine/commands/admin/reloadscriptscommand.cpp \
    src/engine/commands/admin/removeitemcommand.cpp \
    src/engine/commands/admin/setclasscommand.cpp \
    src/engine/commands/admin/setpropcommand.cpp \
    src/engine/commands/admin/setracecommand.cpp \
    src/engine/commands/admin/settriggercommand.cpp \
    src/engine/commands/admin/stopservercommand.cpp \
    src/engine/commands/admin/unsettriggercommand.cpp \
    src/engine/commands/api/apicommand.cpp \
    src/engine/commands/api/datagetcommand.cpp \
    src/engine/commands/api/datasetcommand.cpp \
    src/engine/commands/api/logretrievecommand.cpp \
    src/engine/commands/api/objectdeletecommand.cpp \
    src/engine/commands/api/objectsetcommand.cpp \
    src/engine/commands/api/objectslistcommand.cpp \
    src/engine/commands/api/portalsetcommand.cpp \
    src/engine/commands/api/propertygetcommand.cpp \
    src/engine/commands/api/propertysetcommand.cpp \
    src/engine/commands/api/triggergetcommand.cpp \
    src/engine/commands/api/triggersetcommand.cpp \
    src/engine/commands/api/triggerslistcommand.cpp \
    src/engine/events/asyncreplyevent.cpp \
    src/engine/events/commandevent.cpp \
    src/engine/events/deleteobjectevent.cpp \
    src/engine/events/event.cpp \
    src/engine/events/signinevent.cpp \
    src/engine/events/timerevent.cpp \
    src/engine/gameevents/areaevent.cpp \
    src/engine/gameevents/floodevent.cpp \
    src/engine/gameevents/gameevent.cpp \
    src/engine/gameevents/movementsoundevent.cpp \
    src/engine/gameevents/movementvisualevent.cpp \
    src/engine/gameevents/soundevent.cpp \
    src/engine/gameevents/speechevent.cpp \
    src/engine/gameevents/visualevent.cpp \
    src/engine/gameobjects/area.cpp \
    src/engine/gameobjects/character.cpp \
    src/engine/gameobjects/class.cpp \
    src/engine/gameobjects/container.cpp \
    src/engine/gameobjects/gameeventobject.cpp \
    src/engine/gameobjects/gameobject.cpp \
    src/engine/gameobjects/group.cpp \
    src/engine/gameobjects/item.cpp \
    src/engine/gameobjects/player.cpp \
    src/engine/gameobjects/portal.cpp \
    src/engine/gameobjects/race.cpp \
    src/engine/gameobjects/realm.cpp \
    src/engine/gameobjects/room.cpp \
    src/engine/gameobjects/shield.cpp \
    src/engine/gameobjects/statsitem.cpp \
    src/engine/gameobjects/weapon.cpp \
    src/engine/logmessages/commandlogmessage.cpp \
    src/engine/logmessages/errorlogmessage.cpp \
    src/engine/logmessages/logmessage.cpp \
    src/engine/logmessages/npctalklogmessage.cpp \
    src/engine/logmessages/playerdeathstatslogmessage.cpp \
    src/engine/logmessages/retrievestatslogmessage.cpp \
    src/engine/logmessages/roomvisitstatslogmessage.cpp \
    src/engine/logmessages/sessionlogmessage.cpp \
    src/interface/httpserver.cpp \
    src/interface/telnetserver.cpp \
    src/interface/websocketserver.cpp \
    3rdparty/qjson/json_driver.cpp \
    3rdparty/qjson/json_parser.cpp \
    3rdparty/qjson/json_scanner.cpp \
    3rdparty/qtiocompressor/qtiocompressor.cpp \
    3rdparty/qtwebsocket/QtWebSocket/QWsServer.cpp \
    3rdparty/qtwebsocket/QtWebSocket/QWsSocket.cpp \

HEADERS += \
    src/engine/application.h \
    src/engine/characterstats.h \
    src/engine/commandinterpreter.h \
    src/engine/commandregistry.h \
    src/engine/constants.h \
    src/engine/conversionutil.h \
    src/engine/diskutil.h \
    src/engine/effect.h \
    src/engine/engine.h \
    src/engine/foreach.h \
    src/engine/gameeventmultipliermap.h \
    src/engine/gameexception.h \
    src/engine/gameobjectptr.h \
    src/engine/gameobjectsyncthread.h \
    src/engine/gamethread.h \
    src/engine/logthread.h \
    src/engine/logutil.h \
    src/engine/metatyperegistry.h \
    src/engine/modifier.h \
    src/engine/point3d.h \
    src/engine/scriptengine.h \
    src/engine/scriptfunction.h \
    src/engine/scriptfunctionmap.h \
    src/engine/session.h \
    src/engine/triggerregistry.h \
    src/engine/util.h \
    src/engine/vector3d.h \
    src/engine/commands/command.h \
    src/engine/commands/scriptcommand.h \
    src/engine/commands/admin/admincommand.h \
    src/engine/commands/admin/copyitemcommand.h \
    src/engine/commands/admin/copytriggerscommand.h \
    src/engine/commands/admin/execscriptcommand.h \
    src/engine/commands/admin/getpropcommand.h \
    src/engine/commands/admin/gettriggercommand.h \
    src/engine/commands/admin/listmethodscommand.h \
    src/engine/commands/admin/listpropscommand.h \
    src/engine/commands/admin/reloadscriptscommand.h \
    src/engine/commands/admin/removeitemcommand.h \
    src/engine/commands/admin/setclasscommand.h \
    src/engine/commands/admin/setpropcommand.h \
    src/engine/commands/admin/setracecommand.h \
    src/engine/commands/admin/settriggercommand.h \
    src/engine/commands/admin/stopservercommand.h \
    src/engine/commands/admin/unsettriggercommand.h \
    src/engine/commands/api/apicommand.h \
    src/engine/commands/api/datagetcommand.h \
    src/engine/commands/api/datasetcommand.h \
    src/engine/commands/api/logretrievecommand.h \
    src/engine/commands/api/objectdeletecommand.h \
    src/engine/commands/api/objectsetcommand.h \
    src/engine/commands/api/objectslistcommand.h \
    src/engine/commands/api/portalsetcommand.h \
    src/engine/commands/api/propertygetcommand.h \
    src/engine/commands/api/propertysetcommand.h \
    src/engine/commands/api/triggergetcommand.h \
    src/engine/commands/api/triggersetcommand.h \
    src/engine/commands/api/triggerslistcommand.h \
    src/engine/events/asyncreplyevent.h \
    src/engine/events/commandevent.h \
    src/engine/events/deleteobjectevent.h \
    src/engine/events/event.h \
    src/engine/events/signinevent.h \
    src/engine/events/timerevent.h \
    src/engine/gameevents/areaevent.h \
    src/engine/gameevents/floodevent.h \
    src/engine/gameevents/gameevent.h \
    src/engine/gameevents/movementsoundevent.h \
    src/engine/gameevents/movementvisualevent.h \
    src/engine/gameevents/soundevent.h \
    src/engine/gameevents/speechevent.h \
    src/engine/gameevents/visualevent.h \
    src/engine/gameobjects/area.h \
    src/engine/gameobjects/character.h \
    src/engine/gameobjects/class.h \
    src/engine/gameobjects/container.h \
    src/engine/gameobjects/gameeventobject.h \
    src/engine/gameobjects/gameobject.h \
    src/engine/gameobjects/group.h \
    src/engine/gameobjects/item.h \
    src/engine/gameobjects/player.h \
    src/engine/gameobjects/portal.h \
    src/engine/gameobjects/race.h \
    src/engine/gameobjects/realm.h \
    src/engine/gameobjects/room.h \
    src/engine/gameobjects/shield.h \
    src/engine/gameobjects/statsitem.h \
    src/engine/gameobjects/weapon.h \
    src/engine/logmessages/commandlogmessage.h \
    src/engine/logmessages/errorlogmessage.h \
    src/engine/logmessages/logmessage.h \
    src/engine/logmessages/npctalklogmessage.h \
    src/engine/logmessages/playerdeathstatslogmessage.h \
    src/engine/logmessages/retrievestatslogmessage.h \
    src/engine/logmessages/roomvisitstatslogmessage.h \
    src/engine/logmessages/sessionlogmessage.h \
    src/interface/httpserver.h \
    src/interface/telnetserver.h \
    src/interface/websocketserver.h \
    3rdparty/qjson/json_parser.hh \
    3rdparty/qjson/json_driver.hh \
    3rdparty/qjson/json_scanner.h \
    3rdparty/qtiocompressor/qtiocompressor.h \
    3rdparty/qtwebsocket/QtWebSocket/QWsServer.h \
    3rdparty/qtwebsocket/QtWebSocket/QWsSocket.h \

OTHER_FILES += \
    DESIGN.txt \
    README.md \
    TODO.txt \
    data/commands/buycommand.js \
    data/commands/closecommand.js \
    data/commands/descriptioncommand.js \
    data/commands/directioncommand.js \
    data/commands/disbandcommand.js \
    data/commands/dropcommand.js \
    data/commands/drinkcommand.js \
    data/commands/eatcommand.js \
    data/commands/equipmentcommand.js \
    data/commands/followcommand.js \
    data/commands/getcommand.js \
    data/commands/givecommand.js \
    data/commands/gocommand.js \
    data/commands/groupcommand.js \
    data/commands/gtalkcommand.js \
    data/commands/helpcommand.js \
    data/commands/inventorycommand.js \
    data/commands/killcommand.js \
    data/commands/lookcommand.js \
    data/commands/losecommand.js \
    data/commands/opencommand.js \
    data/commands/putcommand.js \
    data/commands/quitcommand.js \
    data/commands/removecommand.js \
    data/commands/replycommand.js \
    data/commands/saycommand.js \
    data/commands/searchcommand.js \
    data/commands/shoutcommand.js \
    data/commands/slashmecommand.js \
    data/commands/statscommand.js \
    data/commands/talkcommand.js \
    data/commands/tellcommand.js \
    data/commands/turncommand.js \
    data/commands/usecommand.js \
    data/commands/wieldcommand.js \
    data/commands/whocommand.js \
    data/commands/admin/addcharactercommand.js \
    data/commands/admin/addcontainercommand.js \
    data/commands/admin/additemcommand.js \
    data/commands/admin/addportalcommand.js \
    data/commands/admin/addshieldcommand.js \
    data/commands/admin/addweaponcommand.js \
    data/commands/admin/enterroomcommand.js \
    data/scripts/combat.js \
    data/scripts/sessionhandler.js \
    data/scripts/stats.js \
    data/scripts/visualutil.js \
    data/scripts/gameobjects/character.js \
    data/scripts/gameobjects/container.js \
    data/scripts/gameobjects/gameobject.js \
    data/scripts/gameobjects/group.js \
    data/scripts/gameobjects/item.js \
    data/scripts/gameobjects/player.js \
    data/scripts/gameobjects/portal.js \
    data/scripts/gameobjects/room.js \
    data/scripts/gameobjects/statsitem.js \
    data/scripts/lib/underscore.js \
    src/engine/util.js \
    src/engine/commands/command.js \
    src/engine/commands/admin/admincommand.js \
    web/admin.js \
    web/controller.js \
    web/Gruntfile.js \
    web/index.html \
    web/main.css \
    web/main.js \
    web/notifications.js \
    web/require.js \
    web/util.js \
    web/areaseditor/areadeletedialog.html \
    web/areaseditor/areadeletedialog.js \
    web/areaseditor/areaseditor.css \
    web/areaseditor/areaseditor.html \
    web/areaseditor/areaseditor.js \
    web/dialog/dialog.css \
    web/lib/fabric.js \
    web/lib/hogan.js \
    web/lib/laces.js \
    web/lib/laces.tie.js \
    web/lib/zepto.js \
    web/lib/codemirror/codemirror.css \
    web/lib/codemirror/codemirror.js \
    web/lib/codemirror/javascript.js \
    web/lib/codemirror/util/javascript-hint.js \
    web/lib/codemirror/util/simple-hint.css \
    web/lib/codemirror/util/simple-hint.js \
    web/loadingwidget/loading.css \
    web/loadingwidget/loading.html \
    web/loadingwidget/loading.js \
    web/mapeditor/areaselectiondialog.css \
    web/mapeditor/areaselectiondialog.html \
    web/mapeditor/areaselectiondialog.js \
    web/mapeditor/areasmenu.html \
    web/mapeditor/mapeditor.css \
    web/mapeditor/mapeditor.html \
    web/mapeditor/mapeditor.js \
    web/mapeditor/mapview.js \
    web/mapmodel/model.js \
    web/portaleditor/portaldeletedialog.html \
    web/portaleditor/portaldeletedialog.js \
    web/portaleditor/portaleditor.css \
    web/portaleditor/portaleditor.html \
    web/portaleditor/portaleditor.js \
    web/propertyeditor/propertyeditor.css \
    web/propertyeditor/propertyeditor.html \
    web/propertyeditor/propertyeditor.js \
    web/sliderwidget/slider.css \
    web/sliderwidget/slider.js

INCLUDEPATH += \
    src/engine \
    src/engine/commands \
    src/engine/commands/admin \
    src/engine/commands/api \
    src/engine/events \
    src/engine/gameevents \
    src/engine/gameobjects \
    src/engine/logmessages \
    src/interface \
    3rdparty \
    3rdparty/qtiocompressor \
    3rdparty/qtwebsocket/QtWebSocket \
