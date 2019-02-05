class User < ApplicationRecord
  acts_as_messageable

  with_options presence: true, uniqueness: true do
    validates :name
    validates :email
  end


  def mailboxer_email(objext)
    email
  end
end
