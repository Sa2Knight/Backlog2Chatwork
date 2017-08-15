require 'sinatra/base'
require 'json'
require 'pp'

class App < Sinatra::Base

  post '/' do
    pp JSON.parse request.body.read
    return true
  end

end
