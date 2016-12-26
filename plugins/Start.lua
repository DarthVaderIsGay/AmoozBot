local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '📌دانش آموز', callback_data = '!school'}}, {{text = '📌آموزگار', callback_data = '!teach'}}}
    return keyboard
end

local function do_keyboard_school()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '🎓دوره متوسطه اول', callback_data = '!school1'}}, {{text = '🎓دوره متوسطه دوم', callback_data = '!school2'}}}
    return keyboard
end

local function do_keyboard_teach()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '🎓دوره متوسطه اول', callback_data = '!teach1'}}, {{text = '🎓دوره متوسطه دوم', callback_data = '!teach2'}}}
    return keyboard
end

local function do_keyboard_school1()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '📚هفتم', callback_data = '!school7'}},
	{{text = '📚هشتم', url = '!school8'}},
        {{text = '📚نهم', url = '!school9'}},
        {{text = '🔙', callback_data = '!home'}}
    }
    return keyboard
end

local function do_keyboard_school2()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '📚دهم', callback_data = '!school10'}},
	{{text = '📚یازدهم', url = '!school11'}},
        {{text = '📚دوازدهم', url = '!school12'}},
        {{text = '🔙', callback_data = '!home'}}
    }
    return keyboard
end

local function do_keyboard_teach1()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '📚هفتم', callback_data = '!teach7'}},
	{{text = '📚هشتم', url = '!teach8'}},
        {{text = '📚نهم', url = '!teach9'}},
        {{text = '🔙', callback_data = '!home'}}
    }
    return keyboard
end

local function do_keyboard_teach2()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '📚دهم', callback_data = '!teach10'}},
	{{text = '📚یازدهم', url = '!teach11'}},
        {{text = '📚دوازدهم', url = '!teach12'}},
        {{text = '🔙', callback_data = '!home'}}
    }
    return keyboard
end
local action = function(msg, blocks, ln)
    if blocks[1] == 'start' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = "👋سلام "..msg.from.print_name.."!\nدوره تحصیلی خود را انتخاب کنید:"
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
        return
    end

    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
if query == 'home' then
            local text = "👋سلام "..msg.from.print_name.."!\nلطفا نوع کاربری خود را انتخاب کنید:"
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
		if query == 'school' then
            local text = "دوره تحصیلی خود را انتخاب کنید:"
            local keyboard = do_keyboard_school()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
	       if query == 'teach' then
            local text = "دوره تدریسی خود را انتخاب کنید:"
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
    end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)$',
	    '^/(restart)$',
	    '^###cb:!(home)',
	    '^###cb:!(teach1)',
	    '^###cb:!(teach2)',
	    '^###cb:!(school1)',
	    '^###cb:!(school2)',
	    '^###cb:!(teach)',
	    '^###cb:!(school)',
		
}}
