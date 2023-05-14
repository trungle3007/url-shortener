require 'sequel'

DB = Sequel.connect(ENV['POSTGRES_URL'])

%w[model helper command].each do |dir|
  Dir.glob("./#{dir}/*.rb", &method(:require))
end
