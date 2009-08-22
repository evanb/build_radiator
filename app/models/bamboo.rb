require 'rest_client'
require 'hpricot'

class Bamboo

  API_SERVER_PREFIX = "http://ci:8085/api/rest"

  attr_reader :authentication_token

  def login username, password

    result = RestClient.get "#{API_SERVER_PREFIX}/login.action?username=#{username}&password=#{password}"
    doc = Hpricot(result)
    @authentication_token = (doc/:response/:auth).inner_html

    raise "authentication failed" unless @authentication_token


  end

end