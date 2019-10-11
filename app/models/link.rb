class Link < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :long_url, uniqueness: true
end
