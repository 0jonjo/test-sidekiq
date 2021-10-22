require 'sidekiq/api'

class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  Sidekiq::Queue.new("infinity").clear
  Sidekiq::RetrySet.new.clear
  Sidekiq::ScheduledSet.new.clear

  def perform
    #Contact.generate_pdf
    contact = Contact.all
    contact.printer
    puts("PDF gerado")
  end
    
end
