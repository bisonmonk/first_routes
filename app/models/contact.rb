class Contact < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :contact_shares

  has_many :shared_users, through: :contact_shares, source: :user
  has_many :comments, foreign_key: :commentable_id

  has_many :group_contacts
  has_many :groups, through: :group_contacts, source: :group

  def self.contacts_for_user_id(user_id)
    Contact
    .joins("LEFT OUTER JOIN contact_shares ON contact_shares.contact_id = contacts.id")
    .where("contact_shares.user_id = ? OR contacts.user_id = ?", user_id, user_id)
  end
end