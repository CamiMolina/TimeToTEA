local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local desarrolloVerbalBtn, desarrolloMotorBtn, mejoraSocialBtn, volverMenuBtn

local function onDesarrolloVerbalBtnRelease()
    print("Desarrollo de Comunicación Verbal button pressed")
    composer.gotoScene("desarrolloVerbalScene", "fromRight", 500)
    return true
end

local function onDesarrolloMotorBtnRelease()
    print("Desarrollo de Habilidades Motoras button pressed") 
    composer.gotoScene("desarrolloMotorScene", "fromRight", 500)
    return true
end

local function onMejoraSocialBtnRelease()
    print("Mejora de Interacción Social button pressed")
    composer.gotoScene("mejoraSocialScene", "fromRight", 500)
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
    local titleText = display.newText("Menu de Actividades de Aprendizaje", display.contentCenterX, 50, native.systemFont, 20)
    titleText:setFillColor(1, 1, 1)
    desarrolloVerbalBtn = widget.newButton{
        label = "Desarrollo de Comunicación Verbal",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 250,
        height = 40,
        onRelease = onDesarrolloVerbalBtnRelease 
    }
    desarrolloVerbalBtn.x = display.contentCenterX
    desarrolloVerbalBtn.y = display.contentHeight - 200

    desarrolloMotorBtn = widget.newButton{
        label = "Desarrollo de Habilidades Motoras",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 250,
        height = 40,
        onRelease = onDesarrolloMotorBtnRelease 
    }
    desarrolloMotorBtn.x = display.contentCenterX
    desarrolloMotorBtn.y = display.contentHeight - 150

    mejoraSocialBtn = widget.newButton{
        label = "Mejora de Interacción Social",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 250,
        height = 40,
        onRelease = onMejoraSocialBtnRelease
    }
    mejoraSocialBtn.x = display.contentCenterX
    mejoraSocialBtn.y = display.contentHeight - 100

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
    sceneGroup:insert(desarrolloVerbalBtn)
    sceneGroup:insert(desarrolloMotorBtn)
    sceneGroup:insert(mejoraSocialBtn)
    sceneGroup:insert(volverMenuBtn)
end

scene:addEventListener("create", scene)

return scene
