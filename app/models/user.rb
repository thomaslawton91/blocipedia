class User < ActiveRecord::Base
  has_many :wikis, through: :showings
  has_many :collaborators
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.role ||= :standard }

  enum role: {standard: 0, premium: 1, admin: 2}

  USERS = User.all
end
