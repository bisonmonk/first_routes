class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :contacts
  has_many :contact_shares
  has_many :shared_contacts, through: :contact_shares, source: :contact

  has_many :authored_comments, as: :commentable, foreign_key: :author_id
  has_many :comments, foreign_key: :commentable_id
end
