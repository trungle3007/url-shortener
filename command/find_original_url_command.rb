class FindOriginalUrlCommand
  def self.perform(key)
    serv = BaseNEncode.new
    id = serv.decode(key)
    origin_url = OriginalUrl.where(id: id).first
    raise(Exception::OriginalURLNotFoundError) unless origin_url

    origin_url
  end
end
