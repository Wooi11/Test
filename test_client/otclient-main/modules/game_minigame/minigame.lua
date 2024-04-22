miniGameButton = nil
miniGameStartButton = nil
miniGameWindow = nil
startButton = nil
jumpButton = nil
oldPos = nil

function init()
    g_ui.importStyle('minigamewindow')
    miniGameButton = modules.client_topmenu.addLeftGameButton('miniGameButton', tr('MiniGame'),
                                                              '/images/topbuttons/options', toggle)
    miniGameWindow = g_ui.createWidget('MiniGameWindow', rootWidget)
    miniGameWindow:hide()

    startButton = miniGameWindow:getChildById("startButton")

    jumpButton = miniGameWindow:getChildById("jumpButton")
    jumpButton:hide()

end

function terminate()

    miniGameButton:destroy()
    miniGameWindow:destroy()
    startButton:destroy()
    jumpButton:destroy()
    startButton = nil
    miniGameButton = nil
    miniGameWindow = nil

end

function show()
    miniGameWindow:show()
    jumpButton:hide()
    startButton:show()
end

function hide()
    miniGameWindow:hide()
    jumpButton:hide();
    startButton:hide();
end

function toggle()
    if not miniGameWindow:isVisible() then
        show()
    else
        hide()
    end
end

function start()
    addEvent(buttonMove)
    jumpButton:show()
    startButton:hide()
end

function cancel()
    miniGameWindow:hide()
    jumpButton:hide()
    startButton:show()
end


function buttonMove()
    if jumpButton:isVisible() then
        jumpButton:show()
        addEvent(buttonMove, 1000)
        windowPos = miniGameWindow:getPosition()
        oldPos = jumpButton:getPosition()

        local pos = oldPos
        local rand = math.random(50, 400)
        
        pos.x = oldPos.x -1
        if pos.x <= windowPos.x then
            pos.x = windowPos.x + 400
            pos.y = windowPos.y + rand
        end
        jumpButton:setPosition(pos)
    end
end

function jump()
    windowPos = miniGameWindow:getPosition()
    local pos = windowPos
    local rand = math.random(50, 400)
    pos.x = windowPos.x + 400
    pos.y = windowPos.y + rand
    jumpButton:setPosition(pos)
end

