require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " \t ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n Bienvenue sur ''Ils veulent tous ma POO'' \n \t Qui sera le dernier survivant ? \n \t ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

puts "Quel est ton prénom ?"
firstname = gets.chomp.to_s

user = HumanPlayer.new("#{firstname}")
player1 = Player.new("Josiane")
player2 = Player.new("José")

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
	
	puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n Voici l'état de #{user.name} : \n#{user.show_state} \n ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	gets.chomp
	puts "Quelle action veux-tu effectuer ? \n\n a - chercher une meilleure arme \n s - chercher une potion de soin \n\n Attaquer un joueur en vue \n\n 0 - #{player2.name} a #{player2.life_points} PV \n 1 - #{player1.name} a #{player1.life_points} PV"
	action = gets.chomp

	if action == "a" 
		user.search_weapon
	elsif action == "s" 
		user.search_health_pack
	elsif action == "0"
		user.attacks(player2)
	elsif action == "1"
		user.attacks(player1)
	else
		puts "Tu passe ton tour, essaie d'entrer une commande valide"
	end 

	puts "Attention ! Les ennemis t'attaquent !"

	enemies = [player1, player2]

	enemies.each do |enemy|
		if enemy.life_points > 0
			enemy.attacks(user)
		else 
			puts "#{enemy.name} est mort, il ne peut pas attaquer !"	
		end 
	end

end 

puts "\n~~ La partie est finie ~~\n "

if user.life_points > 0
	puts "~~ BRAVO ! Tu as gagné ~~"
else 
	puts "~~ Bouh ! Tu as perdu ! ~~"
end 

binding.pry
p "What the fuck Felix ?!"