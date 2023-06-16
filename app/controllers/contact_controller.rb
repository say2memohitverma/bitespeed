class ContactController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    contact = Contact.create(phoneNumber: params[:phoneNumber], email: params[:email])
    @contacts = Contact.where(linkedId: contact.linkedId)
  end
end
