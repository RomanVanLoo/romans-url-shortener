class Link < ApplicationRecord
  before_validation :smart_add_url_protocol
  validates :short_url, uniqueness: true
  validates :long_url, uniqueness: true

  private

  def smart_add_url_protocol
    print "checking long url"
    unless self.long_url[/\Ahttp:\/\//] || self.long_url[/\Ahttps:\/\//]
      self.long_url = "http://#{self.long_url}"
    end
  end
end
