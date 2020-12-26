
--Mirdain

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "8"
MacroBook = "4"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('TP')

--Enable JobMode for UI
UI_Name = 'DPS'

--Modes for specific to Corsair
state.JobMode = M{['description']='Warrior Damage Mode'}
state.JobMode:options('Chango','Savage Blade','Decimation', 'Aeolian Edge')
state.JobMode:set('Chango')


function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Chango'] = {
		main="Chango",
		sub="Utu Grip",
	}
	sets.Weapons['Savage Blade'] = {
		main="Naegling",
		sub="Zantetsuken",
	}
	sets.Weapons['Decimation'] = {
		main="Dolichenus",
		sub={ name="Digirbalag", augments={'"Dbl.Atk."+4','Accuracy+11','Attack+8',}},
	}
	sets.Weapons['Aeolian Edge'] = {
	    main="Tauret",
		sub="Naegling",
	}
	sets.Weapons.Shield = {
		sub="Blurred Shield +1",
	}

	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		ammo="Staunch Tathlum +1",
		head="Volte Salade",
		body="Sacro Breastplate",
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Sulev. Leggings +2",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Tuisto Earring",
		right_ear="Tuisto Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }
	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {
		feet="Hermes' Sandals",
	}
	sets.Precast = {}
	-- Used for Magic Spells
	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		neck="Voltsurge Torque",
		left_ring="Prolix Ring",
	}
	sets.Precast.Enmity = {
	    ammo="Sapience Orb", -- 2
	    left_ear="Cryptic Earring", -- 4
		right_ear="Friomisi Earring", --2
		left_ring="Petrov Ring", -- 4
	    back="Phalangite Mantle", -- 5
	}
	sets.Midcast = {}
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {
	    ammo="Staunch Tathlum +1", --11
		legs={ name="Founder's Hose", augments={'MND+7','Mag. Acc.+10','Attack+10',}}, --30
		feet={ name="Odyssean Greaves", augments={'Attack+1','"Fast Cast"+6',}}, --20
		neck="Moonbeam Necklace", --10
		left_ear="Magnetic Earring", --8
		right_ear="Halasz Earring", --5
		left_ring="Evanescence Ring", --5
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Spell interruption rate down -4%',}}, --4
	}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {
		waist="Siegel Sash",
	}
	sets.JA = {}
	sets.JA["Mighty Strikes"] = {}
	sets.JA["Berserk"] = {body="Pumm. Lorica +2"}
	sets.JA["Warcry"] = {head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}}}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Tomahawk"] = {}
	sets.JA["Retaliation"] = {}
	sets.JA["Restraint"] = {}
	sets.JA["Blood Rage"] = {}
	sets.JA["Brazen Rush"] = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {
	    ammo="Ginsen",
		head="Hjarrandi Helm",
		body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}},
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Cessance Earring",
		right_ear="Digni. Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Cichol's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = {
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		neck="War. Beads +2",
		waist="Tempus Fugit",
	}
	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = {

	}
	--This set is used when sub job is NIN/THF/DNC and Enaged (Augments the TP base set)
	sets.DualWield = {
		body={ name="Emicho Haubert +1", augments={'HP+65','DEX+12','Accuracy+20',}}, --9
		hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
		left_ear="Suppanomimi",
	}
	--Default WS set base
	sets.WS = {
		ammo="Knobkierrie",
		head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
		body="Hjarrandi Breast.",
		hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +4%','STR+13',}},
		legs={ name="Odyssean Cuisses", augments={'Attack+30','"Avatar perpetuation cost" -4','Weapon skill damage +7%',}},
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {
		ammo="Knobkierrie",
		head={ name="Agoge Mask +3", augments={'Enhances "Savagery" effect',}},
		body="Hjarrandi Breast.",
		hands={ name="Valorous Mitts", augments={'Accuracy+21 Attack+21','Weapon skill damage +4%','STR+13',}},
		legs={ name="Odyssean Cuisses", augments={'Attack+30','"Avatar perpetuation cost" -4','Weapon skill damage +7%',}},
		feet="Sulev. Leggings +2",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Karieyh Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	sets.WS.CRIT = {
	    ammo="Yetshila +1",
		head={ name="Valorous Mask", augments={'Accuracy+17 Attack+17','Weapon skill damage +4%','STR+9','Accuracy+8',}},
		body="Hjarrandi Breast.",
		hands="Sulev. Gauntlets +2",
		legs="Pumm. Cuisses +3",
		feet="Pumm. Calligae +3",
		neck="War. Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Brutal Earring",
		right_ear="Cessance Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Hetairoi Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	--Axe WS
	sets.WS["Ragin Axe"] = {}
	sets.WS["Smash Axe"] = {}
	sets.WS["Gale Axe"] = {}
	sets.WS["Avalanche Axe"] = {}
	sets.WS["Spinning Axe"] = {}
	sets.WS["Rampage"] = {}
	sets.WS["Calamity"] = {}
	sets.WS["Mistral Axe"] = {}
	sets.WS["Decimation"] = sets.WS.CRIT
	sets.WS["Bora Axe"] = {}
	sets.WS["Cloudsplitter"] = {}

	--Sword WS
	sets.WS["Fast Blade"] = {}
	sets.WS["Burning Blade"] = {}
	sets.WS["Red Lotus Blade"] = {}
	sets.WS["Flat Blade"] = {}
	sets.WS["Shining Blade"] = {}
	sets.WS["Seraph Blade"] = {}
	sets.WS["Circle Blade"] = {}
	sets.WS["Spirits Within"] = {}
	sets.WS["Vorpal Blade"] = {}
	sets.WS["Savage Blade"] = sets.WS.WSD
	sets.WS["Sanguine Blade"] = {}
	sets.WS["Requiescat"] = {}

	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {
	    hands={ name="Valorous Mitts", augments={'MND+8','Pet: Accuracy+15 Pet: Rng. Acc.+15','"Treasure Hunter"+2','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
	    feet={ name="Valorous Greaves", augments={'Pet: STR+14','AGI+5','"Treasure Hunter"+1','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
		waist="Chaac Belt",
	}

	organizer_items  = {		
		item1 = "Echo Drops",
		item2 = "Remedy",
		item3 = "Holy Water",
	}	
	jobsetup (LockStylePallet,MacroBook,MacroSet)
end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
	-- Typically used for Macro pallet changing
end

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}

	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}

	return Weapon_Check(equipSet)
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}

	return Weapon_Check(equipSet)
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}

	return Weapon_Check(equipSet)
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}

	return Weapon_Check(equipSet)
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return Weapon_Check(equipSet)
end
--Function is called when a self command is issued
function self_command_custom(command)

end

function user_file_unload()
	
end

function check_buff_JA()
	buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()
	if player.sub_job == 'WAR' then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

function Weapon_Check(equipSet)
	equipSet = set_combine(equipSet,sets.Weapons[state.JobMode.value])
	if DualWield == false then
		equipSet = set_combine(equipSet,sets.Weapons.Shield)
	end
	return equipSet
end

function Elemental_check(equipSet, spell)
	-- This function swaps in the Orpheus or Hachirin as needed
	if elemental_ws:contains(spell.name) then
		-- Matching double weather (w/o day conflict).
		if spell.element == world.weather_element and world.weather_intensity == 2 then
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
			windower.add_to_chat(8,'Weather is Double ['.. world.weather_element .. '] - using Hachirin-no-Obi')
		-- Matching day and weather.
		elseif spell.element == world.day_element and spell.element == world.weather_element then
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
			windower.add_to_chat(8,'[' ..world.day_element.. '] day and weather is ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			-- Target distance less than 6 yalms
		elseif spell.target.distance < (6 + spell.target.model_size) then
			equipSet = set_combine(equipSet, {waist="Orpheus's Sash",})
			windower.add_to_chat(8,'Distance is ['.. round(spell.target.distance,2) .. '] using Orpheus Sash')
		-- Match day or weather.
		elseif spell.element == world.day_element or spell.element == world.weather_element then
			windower.add_to_chat(8,'[' ..world.day_element.. '] day and weather is ['.. world.weather_element .. '] - using Hachirin-no-Obi')
			equipSet = set_combine(equipSet, {waist="Hachirin-no-Obi",})
		end
	end
	return equipSet
end

function round(num, numDecimalPlaces)
	if num ~= nil then
	  local mult = 10^(numDecimalPlaces or 0)
	  return math.floor(num * mult + 0.5) / mult
	end
end