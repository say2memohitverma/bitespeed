class ContactController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    Contact.create(phoneNumber: params[:phoneNumber], email: params[:email])
    @contacts = Contact.where(phoneNumber: params[:phoneNumber]).or(Contact.where(email: params[:email]))
  end
end
