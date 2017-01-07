class Timeline < ActiveRecord::Base
    belongs_to :user
    
    validates :message, presence: true, allow_blank: false
    
    scope :user_filter, -> user_id do
        where(user_id: user_id) if user_id.present?
    end
    
end
