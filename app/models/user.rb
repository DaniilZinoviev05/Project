class User < ApplicationRecord
	attr_accessor :remember_token, :activation_token
	before_save :downcase_email
	before_create :create_activation_digest

	before_save {  email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 20, message: "должен содержать не больше 20 символов." } 
	validates :email, presence: true, length: { maximum: 100, message: "должна быть не больше 100 символов." }, 
						format: { with: VALID_EMAIL_REGEX, message: "имеет неверный формат."},
						uniqueness: { case_sensetive: false, message: "уже используется."} 
	validates :password, length: { minimum: 3, message: "должен содержать минимум 3 символа." }, confirmation: true
	has_secure_password
	has_many :microposts, dependent: :destroy

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ?
		BCrypt::Engine::MIN_COST :
		BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def feed
		Micropost.where("user_id = ?", id)
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	private

		def downcase_email
			self.email = email.downcase
		end

		def create_activation_digest
			self.activation_token = User.new_token
			self.activation_digest = User.digest(activation_token)
		end 
		
end
