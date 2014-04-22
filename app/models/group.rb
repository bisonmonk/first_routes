class Group < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  has_many :group_contacts
  has_many :contacts, through: :group_contacts, source: :contact
end
