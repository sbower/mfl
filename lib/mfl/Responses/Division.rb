module Mfl
  
  class Division
    attr_accessor :id
    attr_accessor :name
    
    def initialize(parseddata="")
      setDivision(parseddata)
    end
    
    def setDivision(parseddata)
      if not parseddata.eql?("") then
        @id = parseddata['id'] if !parseddata['id'].nil?
        @name = parseddata['name'] if !parseddata['name'].nil?
      end
    end
  end

end