class Exam < ActiveRecord::Base
 validates :content, length: { in: 1..140 }, presence: true    
end
