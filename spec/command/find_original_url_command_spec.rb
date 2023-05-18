require_relative '../spec_helper'
require 'faker'

describe 'FindOriginalUrlCommand' do
  let(:valid_url) { Faker::Internet.url }
  let(:random_alphanumeric) { Faker::Alphanumeric.alpha(number: 3) }

  context 'existing original url in database' do
    it 'should return an original url' do
      key = ShortenUrlCommand.perform(valid_url)
      origin_url = FindOriginalUrlCommand.perform(key)
      expect(origin_url).to be_a(OriginalUrl)

      is_url = /(https|http)?:\/\/[\S]+/.match?(origin_url.url)
      expect(is_url).to be(true)
    end
  end

  context 'non-existing original url in database' do
    it 'should raise Exception::OriginalURLNotFoundError' do
      begin
        FindOriginalUrlCommand.perform(random_alphanumeric)
      rescue StandardError => e
        expect(e).to be_a(Exception::OriginalURLNotFoundError)
      end
    end
  end
end
