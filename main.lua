
-- 0=default, 1=input, 2=calculating, 3=result
mode = 0
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
    if mode == 0 or mode == 3 then
        mode = 1
        number = 0
        platform.window:invalidate()
        return
    end

    if mode == 1 then
        mode = 2
        platform.window:invalidate()
        number_is_prime = is_prime(number)
        mode = 3
        platform.window:invalidate()
    end
end

function on.backspaceKey()
    number = number - (number % 10)
    platform.window:invalidate()
end

function on.charIn(char)
    if mode ~= 1 then return end
    if char == '0' then number = (10 * number) + 0 end
    if char == '1' then number = (10 * number) + 1 end
    if char == '2' then number = (10 * number) + 2 end
    if char == '3' then number = (10 * number) + 3 end
    if char == '4' then number = (10 * number) + 4 end
    if char == '5' then number = (10 * number) + 5 end
    if char == '6' then number = (10 * number) + 6 end
    if char == '7' then number = (10 * number) + 7 end
    if char == '8' then number = (10 * number) + 8 end
    if char == '9' then number = (10 * number) + 9 end
    platform.window:invalidate()
end

function on.paint(gc)
    -- heading
    gc:setFont("sansserif", "b", 12)
    gc:drawString("prime checker", 0, 0, "top")
    gc:setFont("sansserif", "r", 12)

    -- draw status
    if mode == 0 then
        gc:drawString("press enter to input the number", 0, 20, "top")
    elseif mode == 1 then
        gc:setColorRGB(0, 0, 255)
        gc:drawString("press enter to check your number", 0, 20, "top")
        gc:setColorRGB(0, 0, 0)
    elseif mode == 2 then
        gc:drawString("checking your number...", 0, 20, "top")
    elseif mode == 3 then
        gc:setColorRGB(0, 255, 0)
        gc:drawString("result is there. press enter to check another", 0, 20, "top")
        gc:setColorRGB(0, 0, 0)
    end

    -- the number itself
    local to_draw = "_"
    if number ~= 0 then
        to_draw = tostring(number)
    end
    gc:drawString(to_draw, 0, 40, "top")

    -- result
    if mode == 3 then
        if number == 0 then
            gc:setColorRGB(255, 0, 0)
            gc:drawString("number is zero", 0, 60, "top")
        elseif number_is_prime then
            gc:setColorRGB(0, 255, 0)
            gc:drawString("number IS prime", 0, 60, "top")
        else
            gc:setColorRGB(255, 0, 0)
            gc:drawString("number is NOT prime", 0, 60, "top")
        end
        gc:setColorRGB(0, 0, 0)
    end

    -- link
    gc:setFont("sansserif", "r", 10)
    gc:drawString("for more info, please check", 40, 170, "top")
    gc:setColorRGB(0, 0, 255)
    gc:drawString("https://github.com/alexcoder04/prime-checker", 40, 180, "top")
end

