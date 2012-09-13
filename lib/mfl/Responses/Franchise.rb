module Mfl
  
  class Franchise
    attr_accessor :id
    attr_accessor :name
    attr_accessor :icon
    attr_accessor :division
    attr_accessor :iscommish
    attr_accessor :logo
    attr_accessor :bbidAvailableBalance
    attr_accessor :salaryCapAmount
    
    def initialize(parseddata="")
      setFranchise(parseddata)
    end
    
    def setFranchise(parseddata)
      if not parseddata.eql?("") then
        @id = parseddata['id'] if !parseddata['id'].nil?
        @name = parseddata['name'] if !parseddata['name'].nil?
        @icon = parseddata['icon'] if !parseddata['icon'].nil?
        @division = parseddata['division'] if !parseddata['division'].nil?
        @iscommish = parseddata['iscommish'] if !parseddata['iscommish'].nil?
        @logo = parseddata['logo'] if !parseddata['logo'].nil?
        @bbidAvailableBalance = parseddata['bbidAvailableBalance'] if !parseddata['bbidAvailableBalance'].nil?
        @salaryCapAmount = parseddata['salaryCapAmount'] if !parseddata['salaryCapAmount'].nil?
      end
    end
  end

end