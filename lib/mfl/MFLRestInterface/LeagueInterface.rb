module Mfl
  
  class MFLRestInterface
    include Mfl
    
    def getLeague(league_id = @league)
      League.new(rest_call("TYPE=league&L=#{league_id}"))
    end
    
    def getRules(league_id = @league)
      Rules.new(rest_call("TYPE=rules&L=#{league_id}"))
    end
    
    def getRosters(league_id = @league)
       Rosters.new(rest_call("TYPE=rosters&L=#{league_id}"))
    end
  end
  
end