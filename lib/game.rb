require 'bundler'
Bundler.require

require_relative 'player.rb'

@@all_enemies = []

class Game
	attr_accessor :human_player, :enemies

	def initialize(title)
		player1.to_s = Player.new("Yvon") 
		player2.to_s = Player.new("José") 
		player3.to_s = Player.new("Jean") 
		player4.to_s = Player.new("Marie")
		@@all_enemies << self
		@human_player = HumanPlayer.new("#{title}")
	end 

	def self.kill_player(player_killed)
		@@all_enemies.delete(player_killed)
	end 

	def is_still_ongoing
		if @human_player.life_points > 0 && @enemies != nil
			return true 
		else return false
		end
	end 


	


end 

binding.pry
puts "What the fuck Felix ?!"