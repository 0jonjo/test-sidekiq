class MyJob < ActiveJob::Base
 
  HardWorker.perform_async('bob', 5)

end
