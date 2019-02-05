class User < ApplicationRecord
  acts_as_messageable

  def mailboxer_email(object)
    email
  end
end
