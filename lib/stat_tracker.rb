require './lib/game.rb'
require './lib/team.rb'
require './lib/game_teams.rb'

class StatTracker

  def self.from_csv(locations)
    Team.load_csv(locations[:teams])
    Game.load_csv(locations[:games])
    GameTeams.load_csv(locations[:game_teams])
    StatTracker.new(Game.all, Team.all, GameTeams.all)
  end

  attr_reader :games_data,
              :teams_data,
              :game_teams_data

  def initialize(games_data, teams_data, game_teams_data)
    @games_data = games_data
    @teams_data = teams_data
    @game_teams_data = game_teams_data
  end

  def highest_total_score
    Game.all.max_by { |game| game.total_score}.total_score
  end

  def lowest_total_score
    Game.all.min_by { |game| game.total_score}.total_score
  end

  def biggest_blowout
    Game.all.max_by { |game| game.margin_of_victory }.margin_of_victory
  end

  def percentage_home_wins
    num = Game.all.select{ |game| game.home_goals > game.away_goals}.length
    denom = Game.all.length
    (num.to_f / denom * 100).round(2)
  end

  def percentage_visitor_wins
    num = Game.all.select{ |game| game.away_goals > game.home_goals}.length
    denom = Game.all.length
    (num.to_f / denom * 100).round(2)
  end

  def percentage_ties
    num = Game.all.select{ |game| game.margin_of_victory == 0}.length
    denom = Game.all.length
    (num.to_f / denom * 100).round(2)
  end

  def count_of_games_by_season
    Game.all.reduce({}) do |games_count, game|
      if !games_count[game.season.to_s]
        games_count[game.season.to_s] = 1
      else
        games_count[game.season.to_s] += 1
      end
      games_count
    end
  end

  def average_goals_per_game
    num = Game.all.sum { |game| game.away_goals + game.home_goals}
    denom = Game.all.length
    require "pry"; binding.pry
    (num.to_f / denom).round(2)
  end

end
