class ContactsController < ApplicationController

	def index
		@contacts = Contact.all
		
		respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
	end

	def show
		@contact = Contact.find(params[:id])

		respond_to do |format|
			format.html
			format.json { render json: @contact}
		end
	end

	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      flash[:notice] = "Contact created."
      redirect_to contacts_path
    else
      render 'new'
    end
	end

	def edit
		@contact = Contact.find(params[:id])

	end

	def update
		@contact = Contact.find(params[:id])
		if @contact.update(params[:contact])
			flash[:notice] = "Contact updated."
			redirect_to contact_path(@contact)
		else
			render 'edit'
		end
	end

	def destroy
		@contact = contact.find(params[:id])
		@contact.destroy

		respond_to do |format|
			format.html do
				flash[:notice] = "Contact deleted"
				redirect_to contacts_path
			end
			format.json { head :no_content }
		end
	end
end



