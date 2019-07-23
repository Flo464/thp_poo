class Player

	attr_accessor :name, :life_points

	def initialize (name)
		@name = name
		@life_points = 10
	end

	def show_state
		puts "#{name} a #{life_points} points de vie"
	end 

	def get_damage(damage)
		@life_points -= damage
			if @life_points < 0 ? @life_points = 0 : @life_points
			elsif@life_points == 0 
				return "Noooooon ! Le joueur #{name} a été tué !"
			else 
				return @life_points
			end 
	end 

	def attacks(target) 
		puts "Le joueur #{name} attaque le joueur #{target.name}"
		hit = compute_damage
		target.get_damage(hit)
		puts "Il lui inflige #{hit} points de dégats"
	end 

	 def compute_damage
    return rand(1..6)
  end		

end 


class HumanPlayer < Player

	attr_accessor :weapon_level

	def initialize(name)
		@name = name
		@life_points = 100
		@weapon_level = 1
	end 

	def show_state
		return "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end 

	def search_weapon
		found_weapon = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{found_weapon}"
		if found_weapon > @weapon_level
			@weapon_level = found_weapon
			puts "Tu as trouvé une arme plus puissante que la tienne ! Bravo, tu peux la garder !"
		else 
			puts "Bordel de merde, cette arme est moins puissante que la tienne ! Poubelle !"
		end 
	end 

	def search_health_pack
		item = rand(1..6)
		if item  == 1
			puts "Tu n'as rien trouvé..."
		elsif item == (2..5)
			@life_points += 50
			@life_points > 100 ? @life_points = 100 : @life_points
			puts "Tu as trouvé une potion, +50 PV !"
		else 
			@life_points += 80
			@life_points > 100 ? @life_points = 100 : @life_points
			puts "Tu as trouvé une super potion, +80 PV !"
		end 
	end 

end 