class ContactShare < ActiveRecord::Base
  belongs_to :contact
  belongs_to :user
end
