class Micropost < ApplicationRecord

  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_many :likes
  has_many :users, through: :likes
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
end
