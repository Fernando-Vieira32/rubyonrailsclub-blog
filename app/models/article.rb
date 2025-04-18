# frozen_string_literal: true

class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_one_attached :cover_image do |attachable| # this is use  image processing
    attachable.variant :thumb, resize_to_limit: [325, 205]
    attachable.variant :cover, resize_to_limit: [200, 200]
  end
end
