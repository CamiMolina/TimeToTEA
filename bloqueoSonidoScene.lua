local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local sonidosAmbienteBtn, sonidoBlancoBtn, volverMenuBtn

local function onSonidosAmbienteBtnRelease()
    print("Sonidos de ambiente button pressed")
    composer.gotoScene("sonidoBlancoScene", "fromRight", 500)
    return true
end

local function onSonidoBlancoBtnRelease()
    print("Sonido blanco button pressed")
    composer.gotoScene("sonidosAmbienteScene", "fromRight", 500)
    return true
end

local function onVolverMenuBtnRelease()
    composer.gotoScene("menu", "fromLeft", 500)
    return true 
end

function scene:create(event)
    local sceneGroup = self.view
    local background = display.newImageRect("background.jpg", display.actualContentWidth, display.actualContentHeight)
    background.anchorX = 0
    background.anchorY = 0
    background.x = 0 + display.screenOriginX
    background.y = 0 + display.screenOriginY
    local titleText = display.newText("Menu de Bloqueo de Sonido", display.contentCenterX, 50, native.systemFont, 20)
    titleText:setFillColor(1, 1, 1)

    sonidosAmbienteBtn = widget.newButton{
        label = "Sonidos de Ambiente",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 250,
        height = 40,
        onRelease = onSonidosAmbienteBtnRelease 
    }
    sonidosAmbienteBtn.x = display.contentCenterX
    sonidosAmbienteBtn.y = display.contentHeight - 150

    sonidoBlancoBtn = widget.newButton{
        label = "Sonido Blanco",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 250,
        height = 40,
        onRelease = onSonidoBlancoBtnRelease 
    }
    sonidoBlancoBtn.x = display.contentCenterX
    sonidoBlancoBtn.y = display.contentHeight - 100

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

    sceneGroup:insert(background)
    sceneGroup:insert(titleText)
    sceneGroup:insert(sonidosAmbienteBtn)
    sceneGroup:insert(sonidoBlancoBtn)
    sceneGroup:insert(volverMenuBtn)
end

scene:addEventListener("create", scene)

return scene
