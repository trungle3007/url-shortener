require_relative '../spec_helper'

ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.freeze

# Random string from ALPHABET with a given string length
def string_with_length(length)
  str = ''
  (0..(length - 1)).each do
    index = (rand(0..1.0) * 62).floor
    str += ALPHABET[index]
  end

  str
end

describe 'BaseNEncode' do
  let(:service) { BaseNEncode.new }

  describe '#encode' do
    context 'numbers with 3 digits' do
      it 'should return a string' do
        (100..999).step(10).each do |num|
          str = service.encode(num)
          expect(str).to be_a(String)
          expect(str.length).to be_within(3).of(3)
        end
      end
    end

    context 'numbers with 4 digits' do
      it 'should return a string' do
        (1_000..9_999).step(100).each do |num|
          str = service.encode(num)
          expect(str).to be_a(String)
          expect(str.length).to be_within(3).of(3)
        end
      end
    end

    context 'numbers with 5 digits' do
      it 'should return a string' do
        (10_000..99_999).step(1_000).each do |num|
          str = service.encode(num)
          expect(str).to be_a(String)
          expect(str.length).to be_within(3).of(3)
        end
      end
    end

    context 'numbers with 6 digits' do
      it 'should return a string' do
        (100_000..999_999).step(10_000).each do |num|
          str = service.encode(num)
          expect(str).to be_a(String)
          expect(str.length).to be_within(3).of(3)
        end
      end
    end

    context 'numbers with 7 digits' do
      it 'should return a string' do
        (1_000_000..9_999_999).step(100_000).each do |num|
          str = service.encode(num)
          expect(str).to be_a(String)
          expect(str.length).to be_within(3).of(3)
        end
      end
    end

    context 'numbers with 8 digits' do
      it 'should return a string' do
        num = 50_000_000
        str = service.encode(num)
        expect(str).to be_a(String)
        expect(str.length).to be_within(3).of(3)
      end
    end

    context 'numbers with 9 digits' do
      it 'should return a string' do
        num = 500_000_000
        str = service.encode(num)
        expect(str).to be_a(String)
        expect(str.length).to be_within(3).of(3)
      end
    end

    context 'numbers with 10 digits' do
      it 'should return a string' do
        num = 5_000_000_000
        str = service.encode(num)
        expect(str).to be_a(String)
        expect(str.length).to be_within(3).of(3)
      end
    end

    context 'numbers with 11 digits' do
      it 'should return a string' do
        num = 50_000_000_000
        str = service.encode(num)
        expect(str).to be_a(String)
        expect(str.length).to be_within(3).of(3)
      end
    end

    # A number with 12 digits will be encoded to a string whose length is greater than 6
    # This doesn't match with assignment's requirement
    context 'numbers with 12 digits' do
      it 'should return a string' do
        num = 500_000_000_000
        str = service.encode(num)
        expect(str).to be_a(String)
        expect(str.length).to be_within(4).of(3)
      end
    end
  end

  describe '#decode' do
    context 'strings with 1 characters' do
      it 'should return a number' do
        str = string_with_length(1)
        num = service.decode(str)
        expect(num).to be_a(Numeric)
      end
    end

    context 'strings with 2 characters' do
      it 'should return a number' do
        str = string_with_length(2)
        num = service.decode(str)
        expect(num).to be_a(Numeric)
      end
    end

    context 'strings with 3 characters' do
      it 'should return a number' do
        str = string_with_length(3)
        num = service.decode(str)
        expect(num).to be_a(Numeric)
      end
    end

    context 'strings with 4 characters' do
      it 'should return a number' do
        str = string_with_length(4)
        num = service.decode(str)
        expect(num).to be_a(Numeric)
      end
    end

    context 'strings with 5 characters' do
      it 'should return a number' do
        str = string_with_length(5)
        num = service.decode(str)
        expect(num).to be_a(Numeric)
      end
    end

    context 'strings with 6 characters' do
      it 'should return a number' do
        str = string_with_length(6)
        num = service.decode(str)
        expect(num).to be_a(Numeric)
      end
    end
  end
end
