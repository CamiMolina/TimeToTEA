local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local function onVolverMenuBtnRelease()
    composer.gotoScene("menu", "fromLeft", 500)
    return true
end


function scene:create(event)
    local sceneGroup = self.view

    local titleText = display.newText(sceneGroup, "Encuentra el Color Oculto", display.contentCenterX, 50, native.systemFontBold, 20)

     local sceneGroup = self.view

    volverMenuBtn = widget.newButton{
        label = "Volver al Menú Principal",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 250,
        height = 40,
        onRelease = onVolverMenuBtnRelease
    }
    volverMenuBtn.x = display.contentCenterX
    volverMenuBtn.y = display.contentHeight - 50

    sceneGroup:insert(volverMenuBtn)
    -- Agrega cualquier otro elemento visual necesario

    -- Agrega aquí la lógica específica para el juego de color oculto
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is still off-screen and is about to move on screen
    elseif phase == "did" then
        -- Called when the scene is now on screen
        -- Agrega aquí la lógica para comenzar el juego de color oculto
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is on screen and is about to move off screen
        -- Agrega aquí la lógica para pausar o detener el juego de color oculto
    elseif phase == "did" then
        -- Called when the scene is now off screen
    end
end

function scene:destroy(event)
    local sceneGroup = self.view

    -- Limpia cualquier objeto o variable que no se necesite más al destruir la escena
end

-- Listener setup
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
