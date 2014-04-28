class ContactsController < ApplicationController

	def index
		@contacts = Contact.all
    render json: @contacts
	end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      render json: @contact, status: 201
    else
      render json: @contact.errors, status: 422
	end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
    end
  end

	def update
		@contact = Contact.find(params[:id])
		if @contact.update(params[:contact])
			head :no_content
		else
			render jason: @contact.errors, status: 422
		end
	end

	def destroy
		@contact = contact.find(params[:id])
		@contact.destroy
    head :no_content
	end
end



