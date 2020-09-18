require 'sinatra'
require_relative 'app'

get '/' do
  result = App.new.call(request['number'])
  "Result for number #{request['number']} is #{result}"
end

