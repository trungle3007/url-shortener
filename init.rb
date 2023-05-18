require 'sequel'

if Sinatra::Application.environment.to_s != 'test'
  DB = Sequel.connect(ENV['POSTGRES_URL'])
end

%w[model helper command].each do |dir|
  Dir.glob("./#{dir}/*.rb", &method(:require))
end
