require_relative './spec_helper'
require_relative '../app'
require 'faker'
require 'json'

describe 'App' do
  let(:app) { App.new }

  context 'POST /api/shorten' do
    let(:response) { post '/api/shorten', JSON.generate('url' => Faker::Internet.url), 'CONTENT_TYPE' => 'application/json' }

    it 'should return status 201' do
      expect(response.status).to eq(201)
    end

    it 'should return a shortened url' do
      body = JSON.parse(response.body)
      expect(body).to have_key('shortened_url')
    end
  end

  context 'POST /api/shorten with invalid URL' do
    let(:response) { post '/api/shorten', JSON.generate('url' => Faker::Alphanumeric.alpha(number: 10)), 'CONTENT_TYPE' => 'application/json' }

    it 'should return status 400' do
      expect(response.status).to eq(400)
    end

    it 'should return an error' do
      body = JSON.parse(response.body)
      expect(body).to have_key('error')
      expect(body['error']).to eq('The original URL is invalid')
    end
  end

  context 'GET /:key' do
    let (:valid_url) { Faker::Internet.url }

    it 'should return status 301' do
      encoded = ShortenUrlCommand.perform(valid_url)
      response = get "/#{encoded}"
      expect(response.status).to eq(301)
    end
  end
end
