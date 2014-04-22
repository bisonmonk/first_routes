class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :contacts
  has_many :contact_shares
  has_many :shared_contacts, through: :contact_shares, source: :contact

  has_many :authored_comments, as: :commentable, foreign_key: :author_id
  has_many :comments, foreign_key: :commentable_id

  def favorite_contacts
    Contact
    .joins("LEFT OUTER JOIN contact_shares ON contact_shares.contact_id = contacts.id")
    .where("(contact_shares.user_id = ? OR contacts.user_id = ?)
        AND (contacts.favorite = TRUE OR contact_shares.favorite = TRUE)", self.id, self.id)
  end
end