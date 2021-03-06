
-- Bee by KrupnoPavel

foodchain:register_mob("foodchain:bee", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 2,
	armor = 200,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "mobs_bee.x",
	textures = {"mobs_bee.png"},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_bee",
	},	
	walk_velocity = 1,
	jump = true,
	drops = {
		{name = "foodchain:honey",
		chance = 1, min = 1, max = 2},
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -3,
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 30,
		walk_start = 35,
		walk_end = 65,
	},
	on_rightclick = function(self, clicker)
		foodchain:capture_mob(self, clicker, 25, 80, 0, true, nil)
	end,
	hunger = 1,
  horny = false,
  biome_food_types = {"foodchain:honey","trunks:moss", "trunks:moss_fungus"}
})

foodchain:register_spawn("foodchain:bee", {"group:flower"}, 20, 10, 9000, 1, 31000)

foodchain:register_egg("foodchain:bee", "Bee", "mobs_bee_inv.png", 0)

-- honey
minetest.register_craftitem("foodchain:honey", {
	description = "Honey",
	inventory_image = "mobs_honey_inv.png",
	on_use = minetest.item_eat(6),
})

-- beehive (when placed spawns bee)
minetest.register_node("foodchain:beehive", {
	description = "Beehive",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"mobs_beehive.png"},
	inventory_image = "mobs_beehive.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = true,
	groups = {fleshy = 3, dig_immediate = 3},
	sounds = default.node_sound_defaults(),
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "foodchain:beehive", param2 = 1})
			minetest.add_entity(pos, "foodchain:bee")
		end
	end,
	
})

minetest.register_craft({
	output = "foodchain:beehive",
	recipe = {
		{"foodchain:bee","foodchain:bee","foodchain:bee"},
	}
})

-- honey block
minetest.register_node("foodchain:honey_block", {
	description = "Honey Block",
	tiles = {"mobs_honey_block.png"},
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_craft({
	output = "foodchain:honey_block",
	recipe = {
		{"foodchain:honey", "foodchain:honey", "foodchain:honey"},
		{"foodchain:honey", "foodchain:honey", "foodchain:honey"},
		{"foodchain:honey", "foodchain:honey", "foodchain:honey"},
	}
})

minetest.register_craft({
	output = "foodchain:honey 9",
	recipe = {
		{"foodchain:honey_block"},
	}
})