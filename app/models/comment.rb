class Comment < ActiveRecord::Base
  validates :comment, :user_id, presence: true

  # Make a Comment model that belongs_to either a user or a contact. A user
  # should be able to comment on a contact, shared contact, or on another user
  belongs_to :commentable, polymorphic: true

end
