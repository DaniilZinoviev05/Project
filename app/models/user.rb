class User < ApplicationRecord
	before_save {  email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 20, message: "должен содержать не больше 20 символов." } 
	validates :email, presence: true, length: { maximum: 100, message: "должна быть не больше 100 символов." }, 
						format: { with: VALID_EMAIL_REGEX, message: "имеет неверный формат."},
						uniqueness: { case_sensetive: false, message: "уже используется."} 
	validates :password, length: { minimum: 3, message: "должен содержать минимум 3 символа." }, confirmation: true
	has_secure_password
end
