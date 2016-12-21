local function do_keyboard_robot()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = 'Share Robot Contact 🤖🤘🏾', callback_data = '!share'},
    					},
    					{
    		    		{text = 'Buy Group 💸', callback_data = '!buygroup'},
    		    		{text = 'Support 👥', url = 'https://telegram.me/joinchat/BvytAD9KL7J2PE2u0ek3ZA'},
	    },
	    {
	    {text = '🔙', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_buygroup()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'Iranians', url = 'http://salam.im/buy/ecgvlup3ld'},
    		    		{text = 'Other countries', url = 'https://telegram.me/joinchat/BvytAD9KL7J2PE2u0ek3ZA'},
	    },
	    {
	    {text = '🔙', callback_data = '!robot'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '🎓دوره متوسطه اول', callback_data = '!school1'},},{{text = '🎓دوره متوسطه دوم', callback_data = '!school2'},}}
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🙃👉 اینجا کلیک کنید! 👈🙃', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end
local function do_keyboard_school1()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '📚هفتم', callback_data = '!school7'},},
	{{text = '📚هشتم', url = '!school8'},},
        {{text = '📚نهم', url = '!school9'},},
        {{text = '🔙', callback_data = '!home'},}
    }
    return keyboard
end

local function do_keyboard_school2()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{{text = '📚دهم', callback_data = '!school10'},},
	{{text = '📚یازدهم', url = '!school11'},},
        {{text = '📚دوازدهم', url = '!school12'},},
        {{text = '🔙', callback_data = '!home'},}
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = "👋سلام "..msg.from.print_name.."!\nدوره تحصیلی خود را انتخاب کنید:"
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, '' ,do_keyboard_startme(), true)
        end
        return
    end

    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
        if query == 'channel' then
            local text = '📡 *BeatBotTeam Channels :*'
            local keyboard = do_keyboard_channel()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'robot' then
            local text = [[🔸*BeatBotTG*🔹
🚩 _An advanced robot for entertainment group manager and anti-spam_]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'buygroup' then
            local text = [[_Please wait after payment_ 
_We will be call to you_]]
            local keyboard = do_keyboard_buygroup()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = "👋سلام "..msg.from.print_name.."!\nدوره تحصیلی خود را انتخاب کنید:"
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '+639380063518', '🔸ßελτ ßΘτ🔹 [ Use ! ]')
end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)@BeatBotTeamBot$',
	    '^/(start)$',
	    '^/(help)$',
	    '^###cb:!(home)',
		'^###cb:!(buygroup)',
	    '^###cb:!(channel)',
	    '^###cb:!(robot)',
	    '^###cb:!(share)',
}}
