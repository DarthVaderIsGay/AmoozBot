local function do_keyboard_teacher()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '📝امتحانات', callback_data = '!exams'},
			},
			{
			{text = '✏️دانش آموزان✏️', callback_data = '!students'},
			},
			{
			{text = '❓راهنما', callback_data = '!help'},
			},
			{
	    {text = '🔙', callback_data = '!home'},
	    }
    }
    return keyboard
end
local function do_keyboard_owners()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '● AmirHo3inF ●', url = 'http://telegram.me/amirho3inf'},},
			{{text = '● FasT ReaCtoR ●', url = 'http://telegram.me/fastreactor'},},
			{{text = '● NariMan Master ●', url = 'http://telegram.me/Nawr_i_man'},},
			{{text = '🔙', callback_data = '!aboutus'},
	    }
    }
    return keyboard
end
local function do_keyboard_members()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
			{text = '● Amir SbsS ●' , url = 'telegram.me/amir_h'},
			{text = '● Mr Jan123 ●', url = 'telegram.me/i_am_jan123'},
			},
			{
			{text = '● MehdiHS ●', url = 'telegram.me/mehdihs'},
			{text = '● ThisisAmirh ●' , url = 'telegram.me/mr_amirh'},
			{text = '● M.G.Z ●' , url = 'telegram.me/M_G_Z'},
			},
			{
			{text = '● MrHaliX ●' , url = 'telegram.me/mrhalix'},
			{text = '● The PoKeR ●', url = 'telegram.me/UnFriendlly'},
			},
			{
			{text = '● AmircC ●', url = 'telegram.me/Amircc_CreeD'},
			{text = '● PuKeR ●', url = 'telegram.me/pukers'},
			{text = '● PediW ●', url = 'telegram.me/pediw'},
			},
			{
			{text = '● IDeaCtiVe ●', url = 'telegram.me/Ideactive'},
			{text = '● YellowHat ●', url = 'telegram.me/yellowhat'},
			},
			{
	    {text = '🔙', callback_data = '!aboutus'},
        }
    }
    return keyboard
end
local function do_keyboard_friends()
    local keyboard = {}
    keyboard.inline_keyboard = {
	        {
			{text = '● ShabGarD ●', url = 'telegram.me/night_011'},
			},
			{
			{text = '● Empix ●', url = 'telegram.me/empix'},
			{text = '● CreeD ●' , url = 'telegram.me/mute_all'},
			},
			{
						{text = '● ReZaHextor ●', url = 'telegram.me/hextor_admin'},
},
			{
	    {text = '🔙', callback_data = '!aboutus'},
        }
    }
    return keyboard
end
local action = function(msg,blocks)
local msg_id = msg.message_id
local chat = msg.chat.id
local query = blocks[1]
    if msg.cb then
	if query == 'aboutus' then
		local keyboard = do_keyboard_aboutus()
		local text = [[_Please select an option ..._]]
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	if query == 'owners' then
		local keyboard = do_keyboard_owners()
		local text = [[*BeatBotTeam owners 🤓 :*]]
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	if query == 'members' then
		local keyboard = do_keyboard_members()
		local text = [[*BeatBotTeam admins 👥 :*]]
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	if query == 'friends' then
		local keyboard = do_keyboard_friends()
		local text = [[*BeatBotTeam friends 🌹 :*]]
		api.editMessageText(chat, msg_id, text, keyboard, true)
    end
	end
	end
return {
  action = action,
triggers = {
	    '^###cb:!(aboutus)',
	    '^###cb:!(owners)',
	    '^###cb:!(members)',
      '^###cb:!(friends)',
	    '^###cb:!(teach)(.*)',
	    '^###cb:!(school)(.*)',
	}
}
