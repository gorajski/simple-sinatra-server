# install sinatra with no docs: gem install sinatra --no-rdoc --no-ri
# install shotgun for automatic reloading: gem install shotgun
# Set up dependencies: bundle install

# to run: bundle exec shotgun app.rb

require 'sinatra'
require 'json'

get '/' do
  content_type :json
  { thekey: "thing" }.to_json
end

get '/a_json_file' do
  file_contents = File.read("json_file.json")
  json_string = JSON.parse(file_contents)

  content_type :json
  json_string.to_json
end

get '/data' do
  <<~HEREDOC
  <form method='POST' action='/data'>
    First name:<br><input type='text' name='firstname'><br>
    Last name:<br><input type='text' name='lastname'><br>
    <input type='submit'>
  </form>
  HEREDOC
end

post '/data' do
  "#{params}"
end