require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/game_teams'

class GameTeamsTest < Minitest::Test
  def setup
    params = {
      game_id: "2012030221",
      team_id: "3",
      hoa: "away",
      result: "LOSS",
      settled_in: "OT",
      head_coach: "John Tortorella",
      goals: '2',
      shots: '8',
      tackles: '44',
      pim: '8',
      powerPlayOpportunities: '3',
      powerPlayGoals: '0',
      faceOffWinPercentage: '44.8',
      giveaways: '17',
      takeaways: '7'
    }

    @game_team = GameTeams.new(params)
  end

  def test_it_exists
    assert_instance_of GameTeams, @game_team
  end

  def test_it_has_attributes
    assert_equal "2012030221", @game_team.game_id
    assert_equal "3", @game_team.team_id
    assert_equal "away", @game_team.hoa
    assert_equal "LOSS", @game_team.result
    assert_equal "OT", @game_team.settled_in
    assert_equal "John Tortorella", @game_team.head_coach
    assert_equal '2', @game_team.goals
    assert_equal '8', @game_team.shots
    assert_equal '44', @game_team.tackles
    assert_equal '8', @game_team.pim
    assert_equal '3', @game_team.powerPlayOpportunities
    assert_equal '0', @game_team.powerPlayGoals
    assert_equal '44.8', @game_team.faceOffWinPercentage
    assert_equal '17', @game_team.giveaways
    assert_equal '7', @game_team.takeaways
  end
end
