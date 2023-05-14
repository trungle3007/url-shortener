class ShortenUrlCommand
  def self.perform(url)
    unless /(https|http)?:\/\/[\S]+/.match?(url)
      raise(Exception::InvalidURLError)
    end

    original_url = OriginalUrl.new(url: url)
    raise(Exception::SaveOriginalUrlError) unless original_url.save

    serv = BaseNEncode.new
    serv.encode(original_url.id)
  end
end
