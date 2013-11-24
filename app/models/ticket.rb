class Ticket < ActiveRecord::Base
  attr_accessible :problem, :response, :summary
end
