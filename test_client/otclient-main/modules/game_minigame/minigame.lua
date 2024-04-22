miniGameButton = nil
miniGameStartButton = nil
miniGameWindow = nil
miniGameOn = false

function init()
    g_ui.importStyle('minigamewindow')
    miniGameButton = modules.client_topmenu.addLeftGameButton('miniGameButton', tr('MiniGame'),
                                                              '/images/topbuttons/options', toggle)
    miniGameWindow = g_ui.createWidget('MiniGameWindow', rootWidget)
    miniGameWindow:hide()

end

function terminate()

    miniGameButton:destroy()
    miniGameWindow:destroy()

    miniGameButton = nil
    miniGameWindow = nil

end

function show()
    miniGameWindow:show()
    miniGameOn = false; 
end

function hide()
    miniGameWindow:hide()
    miniGameOn = false;
end

function toggle()
    if not miniGameWindow:isVisible() then
        show()
    else
        hide()
    end
end

function start()

end

function cancel()
    miniGameWindow:hide()
    miniGameOn = false;
end

