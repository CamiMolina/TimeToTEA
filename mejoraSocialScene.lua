local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local function onVolverMenuBtnRelease()
    composer.gotoScene("menu", "fromLeft", 500)
    return true
end

function scene:create(event)
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
end

scene:addEventListener("create", scene)

return scene
