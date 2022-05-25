
function setColor(color, gc)
    if color == "black" then gc:setColorRGB(0, 0, 0) return end
    if color == "red" then gc:setColorRGB(220, 0, 0) return end
    if color == "green" then gc:setColorRGB(0, 220, 0) return end
    if color == "blue" then gc:setColorRGB(0, 0, 220) return end
end

function resetFont(gc)
    setColor("black", gc)
    gc:setFont("sansserif", "r", 12)
end


function drawHeading(gc)
    gc:setFont("sansserif", "b", 12)
    gc:drawString("Lua prime checker for TI-nspire", 0, 0, "top")
end

function drawLink(gc)
    gc:setFont("sansserif", "r", 10)
    gc:drawString("for more info, please check", 20, 170, "top")
    setColor("blue", gc)
    gc:drawString("https://github.com/alexcoder04/prime-checker", 20, 180, "top")
end

