
-- Cow by Krupnovpavel

foodchain:register_mob("foodchain:cow", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	damage = 4,
	hp_min = 5,
	hp_max = 20,
	armor = 200,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	mesh = "mobs_cow.x",
	textures = {"mobs_cow.png"},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_cow",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	drops = {
		{name = "foodchain:meat_raw",
		chance = 1, min = 5, max = 10},
		{name = "foodchain:leather",
		chance = 1, min = 0, max = 3},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 30,
		walk_start = 35,
		walk_end = 65,
		run_start = 105,
		run_end = 135,
		punch_start = 70,
		punch_end = 100,
	},
	follow = "farming:wheat",
	view_range = 7,
	replace_rate = 50,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "farming:wheat_8"},
	replace_with = "air",
	on_rightclick = function(self, clicker)
		if not foodchain:feed_tame(self, clicker, 8, true) then
			local tool = clicker:get_wielded_item()

			-- milk cow with empty bucket
			if tool:get_name() == "bucket:bucket_empty" then
				if self.gotten == true
				or self.child == true then
					return
				end
				local inv = clicker:get_inventory()
				inv:remove_item("main", "bucket:bucket_empty")
				if inv:room_for_item("main", {name = "foodchain:bucket_milk"}) then
					clicker:get_inventory():add_item("main", "foodchain:bucket_milk")
				else
					local pos = self.object:getpos()
					pos.y = pos.y + 0.5
					minetest.add_item(pos, {name = "foodchain:bucket_milk"})
				end
				self.gotten = true -- milked
				return
			end
		end	
		foodchain:capture_mob(self, clicker, 0, 5, 60, false, nil)
	end,
	hunger = 1,
  horny = false,
	biome_food_types = {"default:dirt_with_grass", "default:grass_2","default:grass_4","default:grass_5", "ethereal:green_dirt"},
})

foodchain:register_spawn("foodchain:cow", {"default:dirt_with_grass", "ethereal:green_dirt"}, 20, 10, 15000, 1, 31000)

foodchain:register_egg("foodchain:cow", "Cow", "default_grass.png", 1)

-- bucket of milk
minetest.register_craftitem("foodchain:bucket_milk", {
	description = "Bucket of Milk",
	inventory_image = "mobs_bucket_milk.png",
	stack_max = 1,
	on_use = minetest.item_eat(8, 'bucket:bucket_empty'),
})

-- cheese wedge
minetest.register_craftitem("foodchain:cheese", {
	description = "Cheese",
	inventory_image = "mobs_cheese.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	output = "foodchain:cheese",
	recipe = "foodchain:bucket_milk",
	cooktime = 5,
	replacements = {{ "foodchain:bucket_milk", "bucket:bucket_empty"}}
})

-- cheese block
minetest.register_node("foodchain:cheeseblock", {
	description = "Cheese Block",
	tiles = {"mobs_cheeseblock.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_craft({
	output = "foodchain:cheeseblock",
	recipe = {
		{'foodchain:cheese', 'foodchain:cheese', 'foodchain:cheese'},
		{'foodchain:cheese', 'foodchain:cheese', 'foodchain:cheese'},
		{'foodchain:cheese', 'foodchain:cheese', 'foodchain:cheese'},
	}
})

minetest.register_craft({
	output = "foodchain:cheese 9",
	recipe = {
		{'foodchain:cheeseblock'},
	}
})