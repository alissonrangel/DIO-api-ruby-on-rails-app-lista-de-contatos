class ContactsController < ApplicationController
  def index
      @contacts = Contact.all
      render json: @contacts
  end

  def show
    @contact = Contact.find_by(id: params[:id])

    if @contact != nil
      render json: {                
        id: @contact.id
        name: @contact.name
        phone: @contact.phone
      }
    else
      render json: { error: 'Não foi possível encontrar o contato' }
    end
  end

  def create
      @contact = Contact.new(post_params)

      if @contact.save 
        render json: {                
          id: @contact.id
        }
      else
        render json: { error: 'Não foi possível criar o contato' }
      end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])

    if @contact != nil
      @contact.destroy
      render json: { error: 'Contato deletado com sucesso' }
    else
      render json: { error: 'Contato não encontrado' }
    end
  end

  private
  def post_params
      params.permit(:name, :phone)
  end
end