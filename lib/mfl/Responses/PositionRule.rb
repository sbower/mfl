module Mfl
  
  class PositionRule
    attr_accessor :event
    attr_accessor :range
    attr_accessor :points
    attr_accessor :threshold_points
    
    def initialize(parseddata="")
      setPositionRule(parseddata)
    end
    
    def setPositionRule(parseddata)
      if not parseddata.eql?("") then
        @event = parseddata['event'][0] if !parseddata['event'].nil?
        @range = parseddata['range'][0] if !parseddata['range'].nil?
        @points = parseddata['points'][0] if !parseddata['points'].nil?
        @threshold_points = parseddata['thresholdPoints'][0] if !parseddata['thresholdPoints'].nil?
      end
    end
  end

end