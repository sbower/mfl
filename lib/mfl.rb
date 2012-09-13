require 'net/http'
require 'net/https'

# openssl is required to support signed_request
require 'openssl'

require 'rubygems'
require 'xmlsimple'

def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

module Mfl
  
  attr_accessor :league
  attr_accessor :year
  
  def initialize(league = "14564", year = "2012")
    @league = league
    @year = year
    @url = "football19.myfantasyleague.com"
    @headers = ""
  end
  
end

require_local("/Mfl/MFLRestInterface")
require_local("/Mfl/Responses")