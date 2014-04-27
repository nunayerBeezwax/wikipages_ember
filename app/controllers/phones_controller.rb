class PhonesController < ApplicationController

	def new
		contact = Contact.find(params[:contact_id])
		@phone = contact.phones.new
		render('phones/new.html.erb')
	end
end