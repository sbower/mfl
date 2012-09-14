module Mfl
  
  class Rules
    attr_accessor :positionrules
    
    def initialize(xmldata="")
      setRule(xmldata)
    end
    
    def setRule(xmldata)
       @positionrules = Hash.new
       
      if not xmldata.eql?("") then
        parseddata = XmlSimple.xml_in(xmldata)

        parseddata['positionRules'].each do |posrules|
          positions = posrules['positions']
          @positionrules[positions] = Array.new
          
          posrules['rule'].each do |rule|
            @positionrules[positions].push(PositionRule.new(rule))
          end
        end
      end
    end
  end
end