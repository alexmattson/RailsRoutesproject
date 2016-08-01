class ContactsController < ApplicationController
  def index
    @contacts = Contact.find_by(user_id: params[:user_id])
    @shared_contacts = User.find_by(id: params[:user_id]).shared_contacts
    con_arr = [@contacts]
    @shared_contacts.each {|c| con_arr << c}
    render json: con_arr
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    contact = Contact.find_by(id: params[:id])
    if contact
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    if contact.destroy
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params).save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
