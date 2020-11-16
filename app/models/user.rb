class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :family_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name_kana, format: { with: /\A([ァ-ン]|ー)+\z/ }
    validates :first_name_kana,  format: { with: /\A([ァ-ン]|ー)+\z/ }
    validates :birth_day
  end

  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
end
