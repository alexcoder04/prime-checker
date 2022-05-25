
mode = 0 -- 0=default, 1=input, 2=result
number = 0
number_is_prime = false

function is_prime(n)
    if n <= 3 then
        return n > 1
    end

    if n % 2 == 0 or n % 3 == 0 then
        return false
    end

    local i = 5
    while i ^ 2 <= n do
        if n % i == 0 or n % (i + 2) == 0 then
            return false
        end
        i = i + 6
    end

    return true
end

function on.enterKey()
    -- switch to input mode
    if mode == 0 or mode == 2 then
        mode = 1
        number = 0
        platform.window:invalidate()
        return
    end

    -- calculate
    number_is_prime = is_prime(number)
    mode = 2
    platform.window:invalidate()
end

function on.backspaceKey()
    -- delete last number
    if mode == 1 then
        number = (number - (number % 10)) / 10
        platform.window:invalidate()
        return
    end

    -- reset
    mode = 1
    number = 0
    platform.window:invalidate()
    return
end

function appendDigit(n, d)
    return (10 * n) + d
end

function on.charIn(char)
    if mode ~= 1 then return end
    if char == '0' then number = appendDigit(number, 0) end
    if char == '1' then number = appendDigit(number, 1) end
    if char == '2' then number = appendDigit(number, 2) end
    if char == '3' then number = appendDigit(number, 3) end
    if char == '4' then number = appendDigit(number, 4) end
    if char == '5' then number = appendDigit(number, 5) end
    if char == '6' then number = appendDigit(number, 6) end
    if char == '7' then number = appendDigit(number, 7) end
    if char == '8' then number = appendDigit(number, 8) end
    if char == '9' then number = appendDigit(number, 9) end
    platform.window:invalidate()
end

function on.paint(gc)
    -- static stuff
    drawHeading(gc)
    drawLink(gc)

    resetFont(gc)

    -- status
    if mode == 0 then
        gc:drawString("press enter to input the number", 0, 20, "top")
    elseif mode == 1 then
        setColor("blue", gc)
        gc:drawString("press enter to check your number", 0, 20, "top")
    elseif mode == 2 then
        setColor("green", gc)
        gc:drawString("press enter to check another number", 0, 20, "top")
    end
    resetFont(gc)

    -- the number itself
    local to_draw = "_"
    if number ~= 0 then
        to_draw = tostring(number)
        if mode == 1 then to_draw = to_draw .. "_" end
    end
    gc:drawString(to_draw, 0, 40, "top")

    -- result
    if mode == 2 then
        if number == 0 or number == 1 then
            setColor("red", gc)
            gc:drawString("number is zero/one", 0, 60, "top")
        elseif number_is_prime then
            setColor("green", gc)
            gc:drawString("number IS prime", 0, 60, "top")
        else
            setColor("red", gc)
            gc:drawString("number is NOT prime", 0, 60, "top")
        end
    end
end

