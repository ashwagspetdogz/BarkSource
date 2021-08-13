local arr = {
    ["0"] = "😳",
    ["1"] = "🍆",
    ["2"] = "🍑",
    ["3"] = "😔",
    ["4"] = "🤔",
    ["5"] = "👀",
    ["6"] = "😎",
    ["7"] = "🔥",
    ["8"] = "😩",
    ["9"] = "😮",
    ["\\"] = "💩",
}
local emojiv2= {}
function bytecode(bc)
    return bc:gsub(".", function(bb) return "\\" .. bb:byte() end)
end
emojiv2.encode = function(st)
    return bytecode(st):gsub(".",function(bb) return arr[bb] end)
end
emojiv2.decode = function(st)
    for a,b in pairs (arr) do
        st = st:gsub(b,function(pp)return a end)
    end
    local ost = st
    st = ""
    for i,v in pairs (ost:split("\\")) do
        if #v > 0 then
            st = st .. string.char(tonumber(v))
        end
    end
    return st
end
return emojiv2
