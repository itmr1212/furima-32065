class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name1, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name1, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :first_name2, presence: true, format: {with: /\A([ァ-ン]|ー)+$+\z/}
  validates :last_name2, presence: true, format: {with: /\A([ァ-ン]|ー)+$+\z/}
  validates :birthday, presence: true
  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/}
  
end
