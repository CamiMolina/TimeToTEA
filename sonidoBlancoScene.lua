local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
local audio = require("audio")

local controlSheet = graphics.newImageSheet("controls.png", { width = 28, height = 28, numFrames = 5, sheetContentWidth = 140, sheetContentHeight = 28 })

local centX = display.contentCenterX
local centY = display.contentCenterY

local function handleButton(event)
    local parentGroup = event.target.parent

    if (event.target.id == "play") then
        if (parentGroup.audioHandle) then
            local options = {}
            options.loops = 0
            if (parentGroup.currentChannel ~= nil and audio.isChannelPaused(parentGroup.currentChannel) == true) then
                audio.resume(parentGroup.currentChannel)
            else
                parentGroup.currentChannel = audio.play(parentGroup.audioHandle, options)
            end

            parentGroup.stopButton:setEnabled(true)
            parentGroup.stopButton.alpha = 1
            parentGroup.playButton:setEnabled(false)
            parentGroup.playButton.alpha = 0.4
        end
    elseif (event.target.id == "stop") then
        if (parentGroup.currentChannel ~= nil) then
            audio.stop(parentGroup.currentChannel)
            audio.rewind(parentGroup.audioHandle)
            parentGroup.currentChannel = nil
            parentGroup.stopButton:setEnabled(false)
            parentGroup.stopButton.alpha = 0.4
            parentGroup.playButton:setEnabled(true)
            parentGroup.playButton.alpha = 1
        end
    end
end

local function createAudioGroup(fileName)
    local audioGroup = display.newGroup()
    scene.view:insert(audioGroup)  -- Utilizamos scene.view en lugar de composer.getScene("current").view

    audioGroup.audioHandle = audio.loadStream(fileName)

    local playButton = widget.newButton(
        {
            x = centX,
            y = centY,
            width = 28,
            height = 28,
            id = "play",
            sheet = controlSheet,
            defaultFrame = 3,
            overFrame = 3,
            label = "",
            onRelease = handleButton
        })
    audioGroup:insert(playButton)
    audioGroup.playButton = playButton

    local stopButton = widget.newButton(
        {
            x = centX + 40,
            y = centY,
            width = 28,
            height = 28,
            id = "stop",
            sheet = controlSheet,
            defaultFrame = 1,
            overFrame = 1,
            label = "",
            onRelease = handleButton
        })
    audioGroup:insert(stopButton)
    audioGroup.stopButton = stopButton
    stopButton:setEnabled(false)
    stopButton.alpha = 0.4
end

function scene:create(event)
    local sceneGroup = self.view

    local background = display.newRect(sceneGroup, centX, centY, display.actualContentWidth, display.actualContentHeight)
    background:setFillColor(0.5, 0.5, 0.5)

    createAudioGroup("WhiteNoise.mp3")
end

scene:addEventListener("create", scene)

return scene
