require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)

knuckleheads = Game.new('Knuckleheads')
knuckleheads.load_players(ARGV.shift || "players.csv")

klutz = ClumsyPlayer.new("klutz", 105)
knuckleheads.add_player(klutz)

berserker = BerserkPlayer.new("berserker", 50)
knuckleheads.add_player(berserker)

loop do
  puts "How many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    knuckleheads.save_high_scores
    break
  else
    puts "Please enter a number or 'quit'."
  end

end

# knuckleheads.play(10) do
#   knuckleheads.total_points >= 2000
# end

# knuckleheads.print_stats
