class ContactsController < ApplicationController
  def index
      @contacts = Contact.all
      render json: @contacts
  end
  def create
      @contact = Contact.new(post_params)

      if @contact.save 
        render json: {                
          id: @contact.id
        }
      else
        render json: { error: 'Não foi possível criar o anúncio' }
      end
  end
  private
  def post_params
      params.permit(:name, :phone)
  end
end