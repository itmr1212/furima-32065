class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true ,format: {with: /\A([ァ-ン]|ー)+$+\z/} do
  validates :first_name2
  validates :last_name2
  end
  
  with_options presence: true ,format: {with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    validates :first_name1
    validates :last_name1
  end

  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/}
end
