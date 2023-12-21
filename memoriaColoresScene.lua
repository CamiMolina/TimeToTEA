local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local function onVolverMenuBtnRelease()
    composer.gotoScene("menu", "fromLeft", 500)
    return true
end

-- Puedes agregar aquí cualquier módulo adicional que necesites

function scene:create(event)
    local sceneGroup = self.view

    -- Crea aquí los objetos visuales y elementos de la escena para la memoria de colores

    local titleText = display.newText(sceneGroup, "Juego de Memoria de Colores", display.contentCenterX, 50, native.systemFontBold, 20)


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
    -- Agrega cualquier otro elemento visual necesario, como botones, cajas, etc.

    -- Agrega aquí la lógica específica para el juego de memoria de colores
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is still off-screen and is about to move on screen
    elseif phase == "did" then
        -- Called when the scene is now on screen
        -- Puedes agregar aquí la lógica para comenzar el juego de memoria de colores
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is on screen and is about to move off screen
        -- Puedes agregar aquí la lógica para pausar o detener el juego de memoria de colores
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
