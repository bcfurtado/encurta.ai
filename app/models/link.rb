class Link < ActiveRecord::Base
  require 'uri'

  before_create :set_key

  validates :url, presence: true, format: { with: URI.regexp }

  private
  def generate_key(length = 5)
    chars = [*('A'..'Z'), *('a'..'z'), *(0..9)]
    (1..length).map {chars.sample}.join
  end

  def set_key
    self.key = generate_key
  end

end