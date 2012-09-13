module Mfl
  
  class League
    attr_accessor :id
    attr_accessor :name
    attr_accessor :rosterSize
    attr_accessor :injuredReserve
    attr_accessor :taxiSquad
    attr_accessor :rostersPerPlayer
    attr_accessor :playerLimitUnit
    attr_accessor :startWeek
    attr_accessor :endWeek
    attr_accessor :lastRegularSeasonWeek
    attr_accessor :precision
    attr_accessor :h2h
    attr_accessor :lockout
    attr_accessor :draftLimitHours
    attr_accessor :standingsSort
    attr_accessor :salaryCapAmount
    attr_accessor :loadRosters
    attr_accessor :division_count
    attr_accessor :divisions
    attr_accessor :franchise_count
    attr_accessor :franchises
    attr_accessor :history
    
    def initialize(xmldata="")
      setLeague(xmldata)
    end
    
    def setLeague(xmldata)
       @divisions = Array.new
       @franchises = Array.new
       @history = Array.new
       
      if not xmldata.eql?("") then
        parseddata = XmlSimple.xml_in(xmldata)
        
        @id = parseddata['id'] if !parseddata['id'].nil?
        @name = parseddata['name'] if !parseddata['name'].nil?
        @rosterSize = parseddata['rosterSize'] if !parseddata['rosterSize'].nil?
        @injuredReserve = parseddata['injuredReserve'] if !parseddata['injuredReserve'].nil?
        @taxiSquad = parseddata['taxiSquad'] if !parseddata['taxiSquad'].nil?
        @rostersPerPlayer = parseddata['rostersPerPlayer'] if !parseddata['rostersPerPlayer'].nil?
        @playerLimitUnit = parseddata['playerLimitUnit'] if !parseddata['playerLimitUnit'].nil?
        @startWeek = parseddata['startWeek'] if !parseddata['startWeek'].nil?
        @endWeek = parseddata['endWeek'] if !parseddata['endWeek'].nil?
        @lastRegularSeasonWeek = parseddata['lastRegularSeasonWeek'] if !parseddata['lastRegularSeasonWeek'].nil?
        @precision = parseddata['precision'] if !parseddata['precision'].nil?
        @h2h = parseddata['h2h'] if !parseddata['h2h'].nil?
        @lockout = parseddata['lockout'] if !parseddata['lockout'].nil?
        @draftLimitHours = parseddata['draftLimitHours'] if !parseddata['draftLimitHours'].nil?
        @standingsSort = parseddata['standingsSort'] if !parseddata['standingsSort'].nil?
        @salaryCapAmount = parseddata['salaryCapAmount'] if !parseddata['salaryCapAmount'].nil?
        @loadRosters = parseddata['loadRosters'] if !parseddata['loadRosters'].nil?
        
        @division_count = parseddata['divisions'][0]['count'] if !parseddata['divisions'][0]['count'].nil?
        parseddata['divisions'][0]['division'].each do |division|
           @divisions.push(Division.new(division))
        end
        
        @franchise_count = parseddata['franchises'][0]['count'] if !parseddata['franchises'][0]['count'].nil?
        parseddata['franchises'][0]['franchise'].each do |franchise|
           @franchises.push(Franchise.new(franchise))
        end
        
        parseddata['history'][0]['league'].each do |old_league|
          old_league_hash = Hash.new
          old_league_hash[:year] = old_league['year'] if !old_league['year'].nil?
          old_league_hash[:url] = old_league['url'] if !old_league['url'].nil?
          @history.push(old_league_hash)
        end
        
      end
    end
  end

end