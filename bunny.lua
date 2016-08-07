
-- Bunny by ExeterDad

foodchain:register_mob("foodchain:bunny", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 4,
	armor = 200,
	collisionbox = {-0.268, -0.5, -0.268,  0.268, 0.167, 0.268},
	visual = "mesh",
	mesh = "mobs_bunny.b3d",
	drawtype = "front",
	textures = {"mobs_bunny_grey.png",
	     "mobs_bunny_brown.png",
	     "mobs_bunny_white.png"
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	drops = {
		{name = "foodchain:meat_raw",
		chance = 1, min = 1, max = 2},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		stand_start = 1,
		stand_end = 15,
		walk_start = 16,
		walk_end = 24,
		punch_start = 16,
		punch_end = 24,
	},
	follow = {"farming:carrot", "farming_plus:carrot_item"},
	view_range = 10,
	replace_rate = 80,
	replace_what = {"farming:carrot_7", "farming:carrot_8", "farming_plus:carrot"},
	replace_with = "air",
	on_rightclick = function(self, clicker)
		if not foodchain:feed_tame(self, clicker, 4, true) then
			-- Monty Python tribute
			local item = clicker:get_wielded_item()
			if item:get_name() == "foodchain:lava_orb" then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.object:set_properties({
					textures = {"mobs_bunny_evil.png"},
				})
				self.type = "monster"
				self.state = "attack"
				self.object:set_hp(20)
				return
			end
		end

		foodchain:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,
	attack_type = "dogfight",
	damage = 5,
})

foodchain:register_spawn("foodchain:bunny", {"default:dirt_with_grass", "ethereal:prairie_dirt"}, 20, 10, 15000, 1, 31000)

foodchain:register_egg("foodchain:bunny", "Bunny", "mobs_bunny_inv.png", 0)