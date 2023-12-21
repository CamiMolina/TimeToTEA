-- desarrolloMotorScene.lua

local composer = require("composer")
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require("widget")

-- 'onRelease' event listener for buttons
local function onVolverMenuBtnRelease()
    -- Vuelve al menú principal
    composer.gotoScene("menu", "fromLeft", 500)
    return true -- indica un toque exitoso
end

function scene:create(event)
    local sceneGroup = self.view

    -- Agrega aquí la lógica específica para la actividad de desarrollo motor

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

    -- insertar todos los objetos de visualización en el grupo de escena
    sceneGroup:insert(volverMenuBtn)
end

-- Aquí puedes incluir los métodos de show, hide y destroy si los necesitas

-- Listener setup
scene:addEventListener("create", scene)

return scene
