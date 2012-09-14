module Mfl
  
  class Rosters
    attr_accessor :franchises
    attr_accessor :roster_player
    
    def initialize(xmldata="")
      setRosters(xmldata)
    end
    
    def setRosters(xmldata)
       @franchises = Hash.new
       
      if not xmldata.eql?("") then
        parseddata = XmlSimple.xml_in(xmldata)

        parseddata['franchise'].each do |franchise|
          franchise_id = franchise['id']
          @franchises[franchise_id] = Array.new
          
          franchise['player'].each do |player|
            @franchises[franchise_id].push(RosterPlayer.new(player))
          end
        end
      end
    end
  end
end