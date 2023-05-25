--[[
I see you looking in this file. IDK why, all you'll see is horrible code...

Anyways, this handler was made by @GuglioIs2Stupid
--]]
input = {}

input.keyList = {}

function input.loadKey(key)
    local self = {}

    self.key = key
    self.pressed = false
    self.released = false
    self.down = false

    return self
end

function input.new(config)
    -- config is given as a table like
    --[[
        {
            name = keycode,
            name2 = keycode2
        }
    --]]
    input.config = config

    input.keys = {}

    for name, key in pairs(config) do
        input.keys[name] = input.loadKey(key)
        table.insert(input.keyList, name)
    end

    function input.update()
        for i, name in ipairs(input.keyList) do
            input.keys[name].pressed = false
            input.keys[name].released = false
        end
    end

    input.key_pressed = function(key)
        -- the thing given is the scan code
        for i, name in ipairs(input.keyList) do
            if input.keys[name].key == key and not input.keys[name].down then
                input.keys[name].pressed = true
                input.keys[name].down = true
            end
        end
    end

    input.key_released = function(key)
        for i, name in ipairs(input.keyList) do
            if input.keys[name].key == key and not input.keys[name].released then
                input.keys[name].released = true
                input.keys[name].down = false
            end
        end
    end

    input.pressed = function(name)
        return input.keys[name].pressed
    end

    input.released = function(name)
        return input.keys[name].released
    end

    input.down = function(name)
        return input.keys[name].down
    end

    consolePrint("input loaded")
end
