require 'sinatra/base'
require 'json'
require 'pp'
require_relative 'chatwork'

class App < Sinatra::Base

  post '/' do
    params = JSON.parse request.body.read
    @issue = {
      key:     "#{params['project']['projectKey']}-#{params['content']['key_id']}",
      summary: params['content']['summary'],
      creator: params['createdUser']['name'],
    }
    return true
  end

end
