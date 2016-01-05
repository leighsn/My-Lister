require 'bundler/setup'
require 'json'
Bundler.require

$: << "."

Dir['app/controllers/*.rb'].each {|f| require f}
Dir['app/models/*.rb'].each {|f| require f}


ENV['SINATRA_ENV'] ||= "development"

Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
