
-- Warthog by KrupnoPavel

foodchain:register_mob("foodchain:pumba", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	damage = 2,
	hp_min = 5,
	hp_max = 15,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "mobs_pumba.x",
	textures = {
		"mobs_pumba.png"
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_pig",
		attack = "mobs_pig_angry",
	},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	follow = {"default:apple", "farming:potato"},
	view_range = 10,
	drops = {
		{name = "foodchain:pork_raw",
		chance = 1, min = 2, max = 3},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		stand_start = 25,
		stand_end = 55,
		walk_start = 70,
		walk_end = 100,
		punch_start = 70,
		punch_end = 100,
	},
	on_rightclick = function(self, clicker)
		foodchain:feed_tame(self, clicker, 8, true)
		foodchain:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
	hunger = 1,
  horny = false,
  npc_food_types = {
    type_2 = true,
    type_3 = true,
   },
  biome_food_types = {"foodchain:egg", "farming:pumpkin_8","farming_plus:tomato","farming:coffee_5",
                      "farming:rhubarb_3", "farming_plus:rhubarb", "farming_plus:carrot",
                      "mushroom_fertile_brown", "mushroom_fertile_red",
                      "farming_plus:carrot", "farming_plus:orange",
                      "farming:raspberry_4", "flowers:sunflower"}
})

foodchain:register_spawn("foodchain:pumba", {"ethereal:mushroom_dirt", "default:dirt_with_grass","default:dirt", "ethereal:green_dirt"}, 20, 10, 15000, 1, 31000)

foodchain:register_egg("foodchain:pumba", "Warthog", "wool_pink.png", 1)

-- raw porkchop
minetest.register_craftitem("foodchain:pork_raw", {
	description = "Raw Porkchop",
	inventory_image = "mobs_pork_raw.png",
	on_use = minetest.item_eat(4),
})

-- cooked porkchop
minetest.register_craftitem("foodchain:pork_cooked", {
	description = "Cooked Porkchop",
	inventory_image = "mobs_pork_cooked.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "foodchain:pork_cooked",
	recipe = "foodchain:pork_raw",
	cooktime = 5,
})