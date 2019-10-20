class Link < ApplicationRecord
  belongs_to :user, required: true
  has_many :clicks, dependent: :destroy

  before_validation :add_url_protocol

  validates :short_url, uniqueness: true
  validates :long_url, uniqueness: true

  private

  def add_url_protocol
    unless self.long_url[/\Ahttp:\/\//] || self.long_url[/\Ahttps:\/\//]
      self.long_url = "http://#{self.long_url}"
    end
  end
end
