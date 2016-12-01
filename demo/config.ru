require 'bundler'
Bundler.require

run Opal::Server.new { |server|
  server.main = 'main.rb'
  server.append_path 'app'
  server.index_path = 'index.html.erb'
}
