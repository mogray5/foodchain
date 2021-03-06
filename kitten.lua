
-- Kitten by Jordach / BFD

foodchain:register_mob("foodchain:kitten", {
	type = "animal",
	passive = true,
	hp_min = 5,
	hp_max = 10,
	armor = 200,
	collisionbox = {-0.3, -0.3, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	visual_size = {x = 0.5, y = 0.5},
	mesh = "mobs_kitten.b3d",
	textures = {
	   "mobs_kitten_striped.png",
		"mobs_kitten_splotchy.png",
		"mobs_kitten_ginger.png",
		"mobs_kitten_sandy.png"
	},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_kitten",
	},
	walk_velocity = 0.6,
	jump = false,
	drops = {
		{name = "farming:string",
		chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	animation = {
		speed_normal = 42,
		stand_start = 97,
		stand_end = 192,
		walk_start = 0,
		walk_end = 96,
	},
	follow = {"foodchain:rat", "ethereal:fish_raw"},
	view_range = 10,
	on_rightclick = function(self, clicker)
		foodchain:feed_tame(self, clicker, 4, true)
		foodchain:capture_mob(self, clicker, 50, 50, 90, false, nil)
	end,
	hunger = 1,
  horny = false,
  npc_food_types = {
    type_2 = true,
   },
  biome_food_types = {"foodchain:egg", "foodchain:rat"}
})

foodchain:register_spawn("foodchain:kitten", {"default:dirt_with_grass", "ethereal:grove_dirt", "woodsoils:dirt_with_leaves_1", "woodsoils:dirt_with_leaves_2"}, 20, 10, 15000, 1, 31000)

foodchain:register_egg("foodchain:kitten", "Kitten", "mobs_kitten_inv.png", 0)