#require 'prawn'

class ContactsController < ApplicationController
  helper_method :printer

  def index
    @contacts = Contact.all
  end

  def print
    HardWorker.perform_async
    redirect_to root_path
  end

  def showpdf(pdf)
    send_data(pdf, :filename => "Contacts.pdf", :type => "application/pdf") 
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact
    else
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :phone, :email)
    end
end