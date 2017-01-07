class Timeline < ActiveRecord::Base
    belongs_to :user
    
    validates :message, presence: true, allow_blank: false
    
end
