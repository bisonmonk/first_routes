class ContactsController < ApplicationController
  def index
    render text: Contact.contacts_for_user_id(params[:user_id]).map(&:as_json)
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    render json: 'Contact has been destroyed.'
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
