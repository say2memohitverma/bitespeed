class ContactController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    if Contact.where(phoneNumber: params[:phoneNumber], linkedId: nil).first and Contact.where(email: params[:email], linkedId: nil).first
      first_contact = Contact.where(phoneNumber: params[:phoneNumber]).first
      second_contact = Contact.where(email: params[:email]).first
      if first_contact.id < second_contact.id
        second_contact.linkPrecedence = "secondary"
        second_contact.linkedId = first_contact.id
        second_contact.save!
        contact = first_contact
      else
        first_contact.linkPrecedence = "secondary"
        first_contact.linkedId = second_contact.id
        first_contact.save!
        contact = second_contact
      end
    else
      contact = Contact.create(phoneNumber: params[:phoneNumber], email: params[:email])
    end
    @contacts = Contact.where(linkedId: contact.linkedId).or(Contact.where(id: contact.linkedId))
  end
end
