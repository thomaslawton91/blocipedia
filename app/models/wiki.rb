class Wiki < ActiveRecord::Base
  has_many :users, through: :showings
  has_many :collaborators

  def collab_users
    collaborators.collect(&:user)
  end

  def possible_collaborators
    User.all.reject{ |u| u.id == user_id || collab_users.include?(u) }  
  end
end
