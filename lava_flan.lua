
-- Lava Flan by Zeg9

foodchain:register_mob("foodchain:lava_flan", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 3,
	hp_min = 10,
	hp_max = 35,
	armor = 80,
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 1.5, 0.5},
	visual = "mesh",
	mesh = "zmobs_lava_flan.x",
	textures = {
	     "zmobs_lava_flan.png"
	},
	blood_texture = "fire_basic_flame.png",
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_lavaflan",
		war_cry = "mobs_lavaflan",
	},
	walk_velocity = 0.5,
	run_velocity = 2,
	jump = true,
	view_range = 10,
	floats = 0,
	drops = {
		{name = "foodchain:lava_orb",
		chance = 15, min = 1, max = 1},
	},
	water_damage = 5,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 8,
		walk_start = 10,
		walk_end = 18,
		run_start = 20,
		run_end = 28,
		punch_start = 20,
		punch_end = 28,
	},
	on_die = function(self, pos)
		minetest.set_node(pos, {name = "fire:basic_flame"})
	end,
})

foodchain:register_spawn("foodchain:lava_flan", {"default:lava_source"}, 15, 0, 1000, 3, 0)

foodchain:register_egg("foodchain:lava_flan", "Lava Flan", "default_lava.png", 1)

-- lava orb
minetest.register_craftitem("foodchain:lava_orb", {
	description = "Lava orb",
	inventory_image = "zmobs_lava_orb.png",
})

minetest.register_alias("zfoodchain:lava_orb", "foodchain:lava_orb")