require 'sinatra'
require 'sinatra/json'

require './init'

class App < Sinatra::Application
  get '/:key' do
    original_url = FindOriginalUrlCommand.perform(params[:key])
    redirect(original_url.url)
  rescue Exception::OriginalURLNotFoundError
    halt(404, 'The URL that you are visiting does not exist.')
  end

  before do
    content_type :json
  end

  post '/api/shorten' do
    params = JSON.parse(request.env["rack.input"].read)
    key = ShortenUrlCommand.perform(params['url'])
    shortened_url = "#{ENV['BASE_URL']}/#{key}"
    status(201)
    json(shortened_url: shortened_url)
  rescue Exception::InvalidURLError
    error = { error: 'The original URL is invalid' }
    halt(400, error.to_json)
  rescue Exception::SaveOriginalUrlError
    error = 'Failed to shorten the URL'
    halt(400, error.to_json)
  end
end
