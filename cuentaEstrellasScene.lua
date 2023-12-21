local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local function onVolverMenuBtnRelease()
    composer.gotoScene("menu", "fromLeft", 500)
    return true
end


function scene:create(event)
    local sceneGroup = self.view

    local titleText = display.newText(sceneGroup, "Cuenta las Estrellas", display.contentCenterX, 50, native.systemFontBold, 20)

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
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is still off-screen and is about to move on screen
    elseif phase == "did" then
        -- Called when the scene is now on screen
        -- Agrega aquí la lógica para comenzar el juego de contar estrellas
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then=
    elseif phase == "did" then
    end
end

function scene:destroy(event)
    local sceneGroup = self.view

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
