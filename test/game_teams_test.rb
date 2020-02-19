require './test/test_helper'
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
      powerplayopportunities: '3',
      powerplaygoals: '0',
      faceoffwinpercentage: '44.8',
      giveaways: '17',
      takeaways: '7'
    }
    @game_team = GameTeams.new(params)
    GameTeams.load_csv('./data/game_teams_sample.csv')
    @new_data = GameTeams.all[0]
  end

  def test_it_exists
    assert_instance_of GameTeams, @game_team
  end

  def test_it_has_attributes
    assert_equal 2012030221, @game_team.game_id
    assert_equal 3, @game_team.team_id
    assert_equal "away", @game_team.hoa
    assert_equal "LOSS", @game_team.result
    assert_equal "OT", @game_team.settled_in
    assert_equal "John Tortorella", @game_team.head_coach
    assert_equal 2, @game_team.goals
    assert_equal 8, @game_team.shots
    assert_equal 44, @game_team.tackles
    assert_equal 8, @game_team.pim
    assert_equal 3, @game_team.powerplayopportunities
    assert_equal 0, @game_team.powerplaygoals
    assert_equal 44.8, @game_team.faceoffwinpercentage
    assert_equal 17, @game_team.giveaways
    assert_equal 7, @game_team.takeaways
  end

  def test_it_can_create_game_team_data_objects_from_csv
    assert_instance_of GameTeams, @new_data
    assert_equal 2012030111, @new_data.game_id
    assert_equal 2, @new_data.team_id
    assert_equal "away", @new_data.hoa
    assert_equal "LOSS", @new_data.result
    assert_equal "REG", @new_data.settled_in
    assert_equal "Jack Capuano", @new_data.head_coach
    assert_equal 0, @new_data.goals
    assert_equal 6, @new_data.shots
    assert_equal 41, @new_data.tackles
    assert_equal 51, @new_data.pim
    assert_equal 4, @new_data.powerplayopportunities
    assert_equal 0, @new_data.powerplaygoals
    assert_equal 51.6, @new_data.faceoffwinpercentage
    assert_equal 4, @new_data.giveaways
    assert_equal 3, @new_data.takeaways
  end

  def test_it_contains_all_game_team_data_objects
    assert_instance_of GameTeams, GameTeams.all.sample
    assert_equal 945, GameTeams.all.size
  end

end