-- -----------------------------------------------------------------------
--                         ** Something Global **                       --
-- -----------------------------------------------------------------------
-- Uncomment this following line if you don't wish to see animations
-- hs.window.animationDuration = 0

-- -----------------------------------------------------------------------
--                            ** Requires **                            --
-- -----------------------------------------------------------------------

require "window-management"
require "key-binding"
-- require "vim-binding"

-- -----------------------------------------------------------------------

--- A closure function
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- quick open applications
-- hs.hotkey.bind("", "F18", open("Finder")) -- set to left alt button
-- hs.hotkey.bind("", "F17", open("Google Chrome")) -- set to right gui in Karabiner.json 
-- -- hs.hotkey.bind("", "F13", open("Messages"))  -- set to left control in Karabiner.json 
-- hs.hotkey.bind("", "F14", open("iTerm"))  -- set to left gui in Karabiner.json 
-- hs.hotkey.bind("", "F15", open("Notes"))  -- set to left alt in Karabiner.json 
-- hs.hotkey.bind("", "F16", open("Private Internet Access"))  -- set to left alt in Karabiner.json 
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "A", open("Music"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "B", open("Books"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "C", open("Calendar"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "E", open("karabiner-EventViewer"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "F", open("FireFox"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "I", open("IntelliJ IDEA CE"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "K", open("karabiner-Elements"))
-- -- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "M", open("Messages"))
-- -- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "N", open("Notes"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "O", open("obinsKit"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "P", open("Preview"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "Q", open("qbittorrent"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "R", open("Reminders"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "S", open("System Preferences"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "V", open("Visual Studio Code"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "W", open("Cisco Web Meetings"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "X", open("Xcode"))
-- hs.hotkey.bind({"cmd", "alt", "shift", "ctrl"}, "Z", open("Zoom.us"))

---Fancy configuration reloading confirmation
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- Quick switch Chrome users, or open incognito mode

-- function chrome_switch_to(ppl)
--     return function()
--         hs.application.launchOrFocus("Google Chrome")
--         local chrome = hs.appfinder.appFromName("Google Chrome")
--         local str_menu_item
--         if ppl == "Incognito" then
--             str_menu_item = {"File", "New Incognito Window"}
--         else
--             str_menu_item = {"People", ppl}
--         end
--         local menu_item = chrome:findMenuItem(str_menu_item)
--         if (menu_item) then
--             chrome:selectMenuItem(str_menu_item)
--         end
--     end
-- end
-- 
-- --- open different Chrome users
-- hs.hotkey.bind({"alt"}, "1", chrome_switch_to("Gmail"))
-- hs.hotkey.bind({"alt"}, "2", chrome_switch_to("Outlook"))
-- hs.hotkey.bind({"alt"}, "`", chrome_switch_to("Incognito"))

-- Open a certain Chrome tabe with alt + ?
function chrome_active_tab_with_name(name)
    return function()
        hs.osascript.javascript([[
            // below is javascript code
            var chrome = Application('Google Chrome');
            chrome.activate();
            var wins = chrome.windows;

            // loop tabs to find a web page with a title of <name>
            function main() {
                for (var i = 0; i < wins.length; i++) {
                    var win = wins.at(i);
                    var tabs = win.tabs;
                    for (var j = 0; j < tabs.length; j++) {
                    var tab = tabs.at(j);
                    tab.title(); j;
                    if (tab.title().indexOf(']] .. name .. [[') > -1) {
                            win.activeTabIndex = j + 1;
                            return;
                        }
                    }
                }
            }
            main();
            // end of javascript
        ]])
    end
end

--- Use
hs.hotkey.bind({"alt"}, "G", chrome_active_tab_with_name("Gmail"))
hs.hotkey.bind({"alt"}, "O", chrome_active_tab_with_name("Outlook"))
hs.hotkey.bind({"alt"}, "U", chrome_active_tab_with_name("Udacity"))

--------------------------------------------------------------------------------
-- jason randolph's init keyboard set up
-- trying these on for size

local log = hs.logger.new('init.lua', 'debug')

-- Use Control+` to reload Hammerspoon config
hs.hotkey.bind({'ctrl'}, '`', nil, function()
  hs.reload()
end)

--keyUpDown = function(modifiers, key)
--  -- Un-comment & reload config to log each keystroke that we're triggering
--  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)

--  hs.eventtap.keyStroke(modifiers, key, 0)
--end

---- Subscribe to the necessary events on the given window filter such that the
---- given hotkey is enabled for windows that match the window filter and disabled
---- for windows that don't match the window filter.
----
---- windowFilter - An hs.window.filter object describing the windows for which
----                the hotkey should be enabled.
---- hotkey       - The hs.hotkey object to enable/disable.
----
---- Returns nothing.
--enableHotkeyForWindowsMatchingFilter = function(windowFilter, hotkey)
--  windowFilter:subscribe(hs.window.filter.windowFocused, function()
--    hotkey:enable()
--  end)

--  windowFilter:subscribe(hs.window.filter.windowUnfocused, function()
--    hotkey:disable()
--  end)
--end

-- require('keyboard/control-escape')
-- require('keyboard/delete-words')
-- require('keyboard/hyper')
-- require('keyboard/markdown')
-- require('keyboard/microphone')
--require('keyboard/panes')
require('windows')
require('windows-bindings-defaults')

hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤘'}):send()

hs.urlevent.bind("moveUpRight", function(eventName, params)
    hs.window.upRight(hs.window.focusedWindow())
end)

hs.urlevent.bind("moveDownRight", function(eventName, params)
    hs.window.downRight(hs.window.focusedWindow())
end)

hs.urlevent.bind("moveDownLeft", function(eventName, params)
    hs.window.downLeft(hs.window.focusedWindow())
end)

hs.urlevent.bind("moveUpLeft", function(eventName, params)
    hs.window.upLeft(hs.window.focusedWindow())
end)

hs.urlevent.bind("moveToNextScreen", function(eventName, params)
    hs.window.nextScreen(hs.window.focusedWindow())
end)

hs.urlevent.bind("someAlert", function(eventName, params)
    hs.alert.show("Received someAlert")
end)

function leftDoubleClick(modifiers)
   local pos=hs.mouse.getAbsolutePosition() -- <1>
   hs.eventtap.event.newMouseEvent(
     hs.eventtap.event.types.leftMouseDown, pos, modifiers) -- <2>
      :setProperty(hs.eventtap.event.properties.mouseEventClickState, 2)
      :post() -- <3>
   hs.eventtap.event.newMouseEvent( -- <4>
     hs.eventtap.event.types.leftMouseUp, pos, modifiers):post()
end

--------------------------------------------------------------------------------
-- to make the finder windows pop to front whenever selected
-- (stolen from the "getting started documentation")

function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "Finder") then
            -- Bring all Finder windows forward when one gets activated
            appObject:selectMenuItem({"Window", "Bring All to Front"})
        end
    end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
