class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    puts args
  end
end
