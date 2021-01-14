class User < ApplicationRecord
  
  attr_accessor :remember_token
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :micropost
  
  mount_uploader :user_image, ImageUploader
  
  enum sex: { unanswered: 0, male: 1, female: 2 }
  
  scope :search, -> (search_params) do      
    return if search_params.blank?      
    
    name_like(search_params[:name])
      .sex(search_params[:sex])
  end
  
  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }  
  scope :sex, -> (sex) { where(sex: sex) if sex.present? }
  
  
  has_secure_password validations: false

  validates :name, presence: { message: 'は入力必須です。' }, 
  length: { maximum: 50 ,message: 'は50文字以内で入力してください。'}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: { message: 'は入力必須です。'}, 
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX ,message: 'は正しい形式で入力してください。'},
            uniqueness: { case_sensitive: false ,message: 'は既に登録されています。'}
            
  validates :password, presence: { message: 'は入力必須です。'}, 
            length: { minimum: 6 ,message: 'は6文字以上入力してください。'},
            confirmation: { message: 'とパスワードが一致しません。'}, 
            on: :create

            
  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def to_param
    user_id
  end
  
end
