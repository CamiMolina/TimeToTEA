local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

function scene:create(event)
    local sceneGroup = self.view

    local titleText = display.newText(sceneGroup, "Juegos y Distracciones", display.contentCenterX, 50, native.systemFontBold, 20)

    local memoriaColoresBtn = widget.newButton{
        label = "Juego de Memoria de Colores",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 200,
        height = 40,
        onRelease = onMemoriaColoresBtnRelease
    }
    memoriaColoresBtn.x = display.contentCenterX
    memoriaColoresBtn.y = 100
    sceneGroup:insert(memoriaColoresBtn)

    local colorOcultoBtn = widget.newButton{
        label = "Encuentra el Color Oculto",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 200,
        height = 40,
        onRelease = onColorOcultoBtnRelease
    }
    colorOcultoBtn.x = display.contentCenterX
    colorOcultoBtn.y = 150
    sceneGroup:insert(colorOcultoBtn)

    local formaGeometricaBtn = widget.newButton{
        label = "Encuentra la Forma Geométrica Correcta",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 200,
        height = 40,
        onRelease = onFormaGeometricaBtnRelease
    }
    formaGeometricaBtn.x = display.contentCenterX
    formaGeometricaBtn.y = 200
    sceneGroup:insert(formaGeometricaBtn)

    local cuentaEstrellasBtn = widget.newButton{
        label = "Cuenta las Estrellas",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 200,
        height = 40,
        onRelease = onCuentaEstrellasBtnRelease
    }
    cuentaEstrellasBtn.x = display.contentCenterX
    cuentaEstrellasBtn.y = 250
    sceneGroup:insert(cuentaEstrellasBtn)

    local volverBtn = widget.newButton{
        label = "Volver al Menú Principal",
        labelColor = {default = {1.0}, over = {0.5}},
        defaultFile = "button.png",
        overFile = "button-over.png",
        width = 200,
        height = 40,
        onRelease = onVolverBtnRelease
    }
    volverBtn.x = display.contentCenterX
    volverBtn.y = 300
    sceneGroup:insert(volverBtn)
end

function onMemoriaColoresBtnRelease()
    print("Memoria de Colores button pressed")
    composer.gotoScene("memoriaColoresScene", "fromRight", 500) -- Reemplaza "memoriaColoresScene" con el nombre correcto de tu escena
    return true
end

function onColorOcultoBtnRelease()
    print("Color Oculto button pressed")
    composer.gotoScene("colorOcultoScene", "fromRight", 500) -- Reemplaza "colorOcultoScene" con el nombre correcto de tu escena
    return true
end

function onFormaGeometricaBtnRelease()
    print("Forma Geométrica button pressed")
    composer.gotoScene("formaGeometricaScene", "fromRight", 500) -- Reemplaza "formaGeometricaScene" con el nombre correcto de tu escena
    return true
end

function onCuentaEstrellasBtnRelease()
    print("Cuenta las Estrellas button pressed")
    composer.gotoScene("cuentaEstrellasScene", "fromRight", 500) -- Reemplaza "cuentaEstrellasScene" con el nombre correcto de tu escena
    return true
end

function onVolverBtnRelease()
    print("Volver al Menú Principal button pressed")
    composer.gotoScene("menuScene", "fromLeft",500) -- Reemplaza "menuScene" con el nombre correcto de tu escena
    return true
end

function scene:show(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Lógica de preparación cuando la escena está fuera de la pantalla y está a punto de pasar a la pantalla
    elseif phase == "did" then
        -- Lógica cuando la escena está ahora en pantalla
    end
end

function scene:hide(event)
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Lógica cuando la escena está en pantalla y está a punto de pasar fuera de la pantalla
    elseif phase == "did" then
        -- Lógica cuando la escena está ahora fuera de pantalla
    end
end

function scene:destroy(event)
    local sceneGroup = self.view

    -- Lógica de limpieza al destruir la escena
end

-- Configuración de listener
scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
