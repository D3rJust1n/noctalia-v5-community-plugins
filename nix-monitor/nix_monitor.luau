
function tr(key)
    return noctalia.tr(key)
end

function barCfg(key)
    return barWidget.getConfig(key)
end

function getState(key)
    return noctalia.state.get(key)
end

function displayWidget(glyph: string, text: string, color: string?)
    if color == nil then
        color = "on_surface"
    end

    if barCfg("colorize_text") then
        barWidget.setColor(color)
    end

    if barCfg("colorize_glyph") then
        barWidget.setGlyphColor(color)
    end

    if barCfg("show_glyph") then
        barWidget.setGlyph(glyph)
    end

    if barCfg("show_text") then
        barWidget.setText(text)
    end
end

function update()
    if getState("isRunning") then
        displayWidget(barCfg("checking_glyph"), tr("bar.checking"), barCfg("checking_color"))
    else
        if getState("isUpdateAvailable") then
            displayWidget(barCfg("update_available_glyph"), tr("bar.update_available"), barCfg("update_available_color"))
        else
            if getState("localHash") == "n/a" or getState("remoteHash") == "n/a" then
                displayWidget(barCfg("unknown_glyph"), tr("bar.unknown"), barCfg("unknown_color"))
            else
                displayWidget(barCfg("up_to_date_glyph"), tr("bar.up_to_date"), barCfg("up_to_date_color"))
            end
        end
    end

end

function onClick()
    noctalia.togglePanel("avivbintangaringga/nix-monitor:panel")
end
