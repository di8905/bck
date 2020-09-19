require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/finder'

finder = Finder.new

get '/' do
  # result = finder.call(request['number'])
  # "Result for number #{request['number']} is #{result}"
  @result = finder.call(request['number'])

  erb :app
end

