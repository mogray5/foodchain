
-- Dirt Monster by PilzAdam

foodchain:register_mob("foodchain:dirt_monster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	damage = 2,
	hp_min = 3,
	hp_max = 27,
	armor = 100,
	collisionbox = {-0.4, -1, -0.4, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "mobs_stone_monster.b3d",
	textures = {"mobs_dirt_monster.png"
	},
	blood_texture = "default_dirt.png",
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dirtmonster",
	},
	view_range = 15,
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	drops = {
		{name = "default:dirt",
		chance = 1, min = 3, max = 5},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 2,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 14,
		walk_start = 15,
		walk_end = 38,
		run_start = 40,
		run_end = 63,
		punch_start = 40,
		punch_end = 63,
	},
})

foodchain:register_spawn("foodchain:dirt_monster", {"default:dirt_with_grass", "ethereal:gray_dirt"}, 5, 0, 7000, 1, 31000)

foodchain:register_egg("foodchain:dirt_monster", "Dirt Monster", "default_dirt.png", 1)