# InputHandler-Avg4k

I made an input handler 🥺 

You can do 
```lua
  input.new(
        {
            w = 119,
            a = 97,
            s = 115,
            d = 100,
        }
    )
```
 to load a new input
```lua
function key_pressed(key)
    input.key_pressed(key)
end
```
```lua
function key_released(key)
    input.key_released(key)
end
```
And at the end of update put input.update()

For use with Average4K lol

E.g. (all input code should go in update)
```lua
if input.down("name") then
  consolePrint("name is down")
end
```
