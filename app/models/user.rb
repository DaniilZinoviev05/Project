class User < ApplicationRecord
	before_save {  email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 20, message: "Логин должен содержать не больше 20 символов." } 
	validates :email, presence: true, length: { maximum: 100, message: "Длина почты должна быть не больше 100 символов." }, 
						format: { with: VALID_EMAIL_REGEX, message: "Неверный формат."},
						uniqueness: { case_sensetive: false, message: "Почта уже используется."} 
	validates :password, length: { minimum: 6, message: "Пароль должен содержать минимум 6 символов." }, password: true, confirmation: { message: 'Пароль и подтверждение пароля не совпадают' }

	has_secure_password
end
