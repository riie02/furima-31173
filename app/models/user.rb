class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname,            presence: true
  validates :family_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana,    presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :first_name_kana,     presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birth_day,           presence: true

  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
  
end
