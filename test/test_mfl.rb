require 'helper'

class TestMfl < Test::Unit::TestCase
  def setup 
    @mfl = Mfl::MFLRestInterface.new
  end
  
  should "create object" do
    assert_not_nil @mfl
  end
  
  should "get league basic league info" do
    league = @mfl.getLeague()
    
    assert_equal "14564", league.id
    assert_equal "Denny's Dynasty ", league.name
    assert_equal "35", league.rosterSize
    assert_equal "2", league.injuredReserve
    assert_equal "LEAGUE", league.playerLimitUnit
    assert_equal "1", league.startWeek
    assert_equal "17", league.endWeek
    assert_equal "13", league.lastRegularSeasonWeek
    assert_equal "2", league.precision
    assert_equal "YES", league.h2h
    assert_equal "0:15", league.draftLimitHours
    assert_equal "PCT,PTS,OPP_PTS,PWR,", league.standingsSort
    assert_equal "100", league.salaryCapAmount
    assert_equal "live_draft", league.loadRosters
    assert_equal "3", league.division_count
    
    assert_equal "QB", league.starters[0][:name]
    assert_equal "1", league.starters[0][:limit]
    
    assert_equal "00", league.divisions[0].id
    assert_equal "Black", league.divisions[0].name
    
    assert_equal "01", league.divisions[1].id
    assert_equal "Blue", league.divisions[1].name
    
    assert_equal "02", league.divisions[2].id
    assert_equal "Gold", league.divisions[2].name
    
    assert_equal "12", league.franchise_count
    
    assert_equal "0001", league.franchises[0].id
    assert_equal "Hellfish", league.franchises[0].name
    assert_equal "http://www16.myfantasyleague.com/fflnetdynamic2009/39427_franchise_icon0001.jpg", league.franchises[0].icon
    assert_equal "01", league.franchises[0].division
    assert_equal "1", league.franchises[0].iscommish
    assert_equal "http://farm5.static.flickr.com/4123/4872048064_9ee2f1bb85.jpg", league.franchises[0].logo
    assert_equal "3", league.franchises[0].bbidAvailableBalance
    assert_equal "102", league.franchises[0].salaryCapAmount
    
    assert_equal "2012", league.history[0][:year]
    assert_equal "http://football19.myfantasyleague.com/2012/home/14564", league.history[0][:url]
      
  end
  
  should "get rules" do
    rules = @mfl.getRules()
    
    assert_equal "SF", rules.positionrules['Def'][0].event
    assert_equal "0-10", rules.positionrules['Def'][0].range
    assert_equal "*2", rules.positionrules['Def'][0].points
    assert_nil rules.positionrules['Def'][0].threshold_points
    
    assert_equal "P2", rules.positionrules['QB|RB|WR|TE|PK'][1].event
    assert_equal "1-99", rules.positionrules['QB|RB|WR|TE|PK'][1].range
    assert_equal "*2", rules.positionrules['QB|RB|WR|TE|PK'][1].points
    assert_nil rules.positionrules['Def'][0].threshold_points
    
    assert_equal "FL", rules.positionrules['QB|RB|WR|TE|PK'][9].event
    assert_equal "1-10", rules.positionrules['QB|RB|WR|TE|PK'][9].range
    assert_equal "-2/1", rules.positionrules['QB|RB|WR|TE|PK'][9].points
    assert_equal "-2", rules.positionrules['QB|RB|WR|TE|PK'][9].threshold_points
    
  end
  
  should "get rosters" do
    rosters = @mfl.getRosters()
        
    assert_equal "9099", rosters.franchises['0001'][0].id
    assert_equal "ROSTER", rosters.franchises['0001'][0].status
    assert_equal "rookie", rosters.franchises['0001'][0].contractStatus
    assert_equal "2", rosters.franchises['0001'][0].contractYear
    assert_equal "3.00", rosters.franchises['0001'][0].salary
    
    assert_equal "9078", rosters.franchises['0005'][2].id
    assert_equal "ROSTER", rosters.franchises['0005'][2].status
    assert_equal "rookie", rosters.franchises['0005'][2].contractStatus
    assert_equal "4", rosters.franchises['0005'][2].contractYear
    assert_equal "4.00", rosters.franchises['0005'][2].salary
    
  end
end
