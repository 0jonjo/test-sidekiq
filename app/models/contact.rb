require 'prawn'

class Contact < ApplicationRecord
  
  def self.printer
    @contacts = Contact.all
    @pdf = generate_pdf(@contacts)
  end

  def self.generate_pdf(contacts)
    Prawn::Document.generate('Contatos.pdf') do
      formatted_text [ { :text=>"Lista de Contatos", :styles => [:bold], :size => 20 } ]
      move_down 10
      #@contact = Contact.all
      contacts.each do |contact|
        formatted_text [ { :text=>contact.name, :styles => [:bold], :size => 10 } ]
        move_down 2
        formatted_text [ { :text=>"Telefone: #{contact.phone}", :size => 10 } ]
        move_down 2
        formatted_text [ { :text=>"Email: #{contact.email}", :size => 10 } ]
        move_down 6
      end
    end
  end

  private
    
end
