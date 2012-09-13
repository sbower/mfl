module Mfl
  
  class MFLRestInterface
    include Mfl
    
    def rest_call (path, verb = "get", post_data = "")
      ret_val = ""            
      http = Net::HTTP.new("football19.myfantasyleague.com", 80)
      
      path = "/#{@year}/export?" + path
      path = URI.escape(path)
           
      result = http.start { |http|
        response = (verb.eql?(:post) ? http.post(path, encode_params(post_data)) : http.request_get(path))
        if response.code.eql?("200") 
          ret_val = response.body
        end
        ret_val
      }
    end
    
    protected
    def encode_params(param_hash)
      param_hash
    end  
            
  end
  
end