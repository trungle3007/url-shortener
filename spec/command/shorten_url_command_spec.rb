require_relative '../spec_helper'
require 'faker'

describe 'ShortenURLCommand' do
  let (:valid_url) { Faker::Internet.url }
  let (:invalid_url) { Faker::Alphanumeric.alpha(number: 10) }

  context 'encode valid url' do
    it 'should return encoded string' do
      encoded = ShortenUrlCommand.perform(valid_url)
      expect(encoded).to be_a(String)
    end
  end

  context 'encode invalid url' do
    it 'should raise Exception::InvalidURLError' do
      begin
        ShortenUrlCommand.perform(invalid_url)
      rescue StandardError => e
        expect(e).to be_a(Exception::InvalidURLError)
      end
    end
  end
end
