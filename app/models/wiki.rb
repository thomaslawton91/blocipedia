class Wiki < ActiveRecord::Base
  has_many :users, through: :showings
  has_many :collaborators
end
