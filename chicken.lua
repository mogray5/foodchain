
-- Chicken by JK Murray

foodchain:register_mob("foodchain:chicken", {
	type = "animal",
	passive = true,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.3, -0.75, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	mesh = "mobs_chicken.x",
	-- seems a lot of textures but this fixes the problem with the model
	textures = {
		"mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png",
		"mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png",
		"mobs_chicken_black.png", "mobs_chicken_black.png", "mobs_chicken_black.png", "mobs_chicken_black.png",
		"mobs_chicken_black.png", "mobs_chicken_black.png", "mobs_chicken_black.png", "mobs_chicken_black.png", "mobs_chicken_black.png"
	},
	child_texture = {
		{"mobs_chick.png", "mobs_chick.png", "mobs_chick.png", "mobs_chick.png",
		"mobs_chick.png", "mobs_chick.png", "mobs_chick.png", "mobs_chick.png", "mobs_chick.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_chicken",
	},
	walk_velocity = 1,
	jump = true,
	drops = {
		{name = "foodchain:chicken_raw",
		chance = 1, min = 2, max = 2},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -8,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 1, -- 20
		walk_start = 20,
		walk_end = 40,
	},
	follow = {"farming:seed_wheat", "farming:seed_cotton"},
	view_range = 5,
	replace_rate = 8000,
	replace_what = {"air"},
	replace_with = "foodchain:egg",
	on_rightclick = function(self, clicker)
		foodchain:feed_tame(self, clicker, 8, true)
		foodchain:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,
	hunger = 1,
  horny = false,
  npc_food_types = {
    type_4 = true
  },
  biome_food_types = {"default:dirt_with_grass", "trunks:twig_5", "trunks:twig_7", "trunks:twig_8", 
                    "trunks:twig_9", "trunks:twig_10", "trunks:twig_11","trunks:moss_fungus"}
})

foodchain:register_spawn("foodchain:chicken", {"default:dirt_with_grass", "ethereal:bamboo_dirt","ethereal:green_dirt"}, 20, 10, 15000, 1, 31000)

foodchain:register_egg("foodchain:chicken", "Chicken", "mobs_chicken_inv.png", 0)

-- egg
minetest.register_node("foodchain:egg", {
	description = "Chicken Egg",
	tiles = {"mobs_chicken_egg.png"},
	inventory_image  = "mobs_chicken_egg.png",
	visual_scale = 0.7,
	drawtype = "plantlike",
	wield_image = "mobs_chicken_egg.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {snappy=2, dig_immediate=3},
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "foodchain:egg", param2 = 1})
		end
	end
})

-- fried egg
minetest.register_craftitem("foodchain:chicken_egg_fried", {
description = "Fried Egg",
	inventory_image = "mobs_chicken_egg_fried.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "foodchain:egg",
	output = "foodchain:chicken_egg_fried",
})

-- raw chicken
minetest.register_craftitem("foodchain:chicken_raw", {
description = "Raw Chicken",
	inventory_image = "mobs_chicken_raw.png",
	on_use = minetest.item_eat(2),
})

-- cooked chicken
minetest.register_craftitem("foodchain:chicken_cooked", {
description = "Cooked Chicken",
	inventory_image = "mobs_chicken_cooked.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "foodchain:chicken_raw",
	output = "foodchain:chicken_cooked",
})