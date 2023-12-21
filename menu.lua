local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local aprenderBtn, bloqueoSonidoBtn, juegosDistraccionesBtn, salirBtn

local function onAprenderBtnRelease()
    composer.gotoScene("aprenderScene", "fromRight", 500)
    return true
end

local function onBloqueoSonidoBtnRelease()
    composer.gotoScene("bloqueoSonidoScene", "fromRight", 500)
    return true
end

local function onJuegosDistraccionesBtnRelease()
    composer.gotoScene("juegosDistraccionesScene", "fromRight", 500)
    return true 
end

local function onSalirBtnRelease()
    if system.getInfo("platform") == "android" or system.getInfo("platform") == "ios" then
        native.requestExit()
    else
        os.exit()
    end
    return true
end

function scene:create(event)
    local sceneGroup = self.view
    local background = display.newImageRect("background.jpg", display.actualContentWidth, display.actualContentHeight)
    background.anchorX = 0
    background.anchorY = 0
    background.x = 0 + display.screenOriginX
    background.y = 0 + display.screenOriginY
    local titleLogo = display.newImageRect("TimeToTEA.jpg", 300, 200)
    titleLogo.x = display.contentCenterX
    titleLogo.y = 100
    aprenderBtn = widget.newButton{
        label = "Aprender",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 154,
        height = 40,
        onRelease = onAprenderBtnRelease
    }
    aprenderBtn.x = display.contentCenterX
    aprenderBtn.y = display.contentHeight - 200

    bloqueoSonidoBtn = widget.newButton{
        label = "Bloqueo de Sonido",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 154,
        height = 40,
        onRelease = onBloqueoSonidoBtnRelease
    }
    bloqueoSonidoBtn.x = display.contentCenterX
    bloqueoSonidoBtn.y = display.contentHeight - 150

    juegosDistraccionesBtn = widget.newButton{
        label = "Juegos y Distracciones",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 154,
        height = 40,
        onRelease = onJuegosDistraccionesBtnRelease 
    }
    juegosDistraccionesBtn.x = display.contentCenterX
    juegosDistraccionesBtn.y = display.contentHeight - 100

    salirBtn = widget.newButton{
        label = "Salir",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 154,
        height = 40,
        onRelease = onSalirBtnRelease 
    }
    salirBtn.x = display.contentCenterX
    salirBtn.y = display.contentHeight - 50

    sceneGroup:insert(background)
    sceneGroup:insert(titleLogo)
    sceneGroup:insert(aprenderBtn)
    sceneGroup:insert(bloqueoSonidoBtn)
    sceneGroup:insert(juegosDistraccionesBtn)
    sceneGroup:insert(salirBtn)
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
    elseif phase == "did" then
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
    elseif phase == "did" then
    end
end

function scene:destroy(event)
    local sceneGroup = self.view
    if aprenderBtn then
        aprenderBtn:removeSelf() 
        aprenderBtn = nil
    end

    if bloqueoSonidoBtn then
        bloqueoSonidoBtn:removeSelf() 
        bloqueoSonidoBtn = nil
    end

    if juegosDistraccionesBtn then
        juegosDistraccionesBtn:removeSelf() 
        juegosDistraccionesBtn = nil
    end

    if salirBtn then
        salirBtn:removeSelf() 
        salirBtn = nil
    end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
