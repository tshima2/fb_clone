class Article < ApplicationRecord
  validates :content, presence: true
  validates :content, length: {in: 1..400}
  validates :user_id, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
end
