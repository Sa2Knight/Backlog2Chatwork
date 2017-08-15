require 'sinatra/base'
require 'json'
require 'pp'
require_relative 'chatwork'

class App < Sinatra::Base

  post '/' do
    params = JSON.parse request.body.read
    issue = {
      key:     "#{params['project']['projectKey']}-#{params['content']['key_id']}",
      summary: params['content']['summary'],
      creator: params['createdUser']['name'],
    }
    Chatwork.new.sendMessage(makeChatworkMessage(issue))
    return true
  end

  private
  def makeChatworkMessage(issue)
    message =  "[info][title]#{issue[:creator]}さんが課題を作成しました[/title]"
    message += "[#{issue[:key]}] #{issue[:summary]}\n"
    message += "https://saknight.backlog.jp/view/#{issue[:key]}[/info]"
  end

end
