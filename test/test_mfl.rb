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
end
