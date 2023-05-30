class Contact < ApplicationRecord
  before_save :id_autoincrement, :set_linkPrecedence

  def id_autoincrement
    id = Contact.maximum(:id)
    self.id = id.to_i + 1
  end

  def set_linkPrecedence
    contact = Contact.where(phoneNumber: self.phoneNumber).first
    if contact.nil?
      self.linkPrecedence = "primary"
    else
      self.linkPrecedence = "secondary"
      self.linkedId = contact.id
    end
  end

end
