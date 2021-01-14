class Micropost < ApplicationRecord

  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_many :likes
  has_many :users, through: :likes
  has_many :liked_users, through: :likes, source: :user
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
  def user
   return User.find_by(id: self.user_id)
  end
  
end
