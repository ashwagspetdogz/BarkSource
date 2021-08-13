local bconsole = {}

if not rconsoleprint then return false end
function bconsole:title(st)
    rconsolename(tostring(st))
end
local ccolor = "WHITE"
function bconsole:color(st)
    ccolor = tostring(st):upper()
    rconsoleprint("@@"..tostring(st):upper().."@@")
end
function bconsole:print(st)
    rconsoleprint(tostring(st).."\n")
end
function bconsole:printcolor(st,color)
    local oclr = ccolor
    bconsole:color(color)
    bconsole:print(st)
    bconsole:color(oclr)
end
function bconsole:readline()
    return rconsoleinput()
end
function bconsole:sendcolors()
    bconsole:print("bconsole colors:\nblack\nblue\ngreen\ncyan\nred\nmagenta\nbrown\light_gray\ndark_gray\nlight_blue\nlight_green\nlight_cyan\nlight_red\nlight_magenta\nyellow\nwhite")
end
function bconsole:clear()
    rconsoleclear()
end
function bconsole:hook(func)
    hookfunction(func, function(str)
        bconsole:print(str)
    end)
end

return bconsole
