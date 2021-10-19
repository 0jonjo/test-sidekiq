require 'prawn'

class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    HardWorker.perform_async('teste dentro dos contatos')
  end

  def print
    @contacts = Contact.all
    # pdf = Prawn::Document.new
    # pdf.text("Prawn Rocks")
    # pdf.render_file('prawn.pdf')
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
