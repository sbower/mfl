module Mfl
  
  class RosterPlayer
    attr_accessor :id
    attr_accessor :status
    attr_accessor :contractStatus
    attr_accessor :contractYear
    attr_accessor :salary
    
    def initialize(parseddata="")
      setRosterPlayer(parseddata)
    end
    
    def setRosterPlayer(parseddata)
      if not parseddata.eql?("") then
        @id = parseddata['id'] if !parseddata['id'].nil?
        @status = parseddata['status'] if !parseddata['status'].nil?
        @contractStatus = parseddata['contractStatus'] if !parseddata['contractStatus'].nil?
        @contractYear = parseddata['contractYear'] if !parseddata['contractYear'].nil?
        @salary = parseddata['salary'] if !parseddata['salary'].nil?
      end
    end
  end

end