module Mfl
  
  class MFLRestInterface
    include Mfl
    
    def getLeague(league_id = @league)
      League.new(rest_call("TYPE=league&L=#{league_id}"))
    end
  end
  
end