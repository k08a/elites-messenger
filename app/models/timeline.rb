class Timeline < ActiveRecord::Base
    belongs_to :user
    has_many :replies, class_name: 'Timeline', foreign_key: 'reply_id'
    validates :message, presence: true, allow_blank: false
    
    scope :user_filter, -> user_id do
        where(user_id: user_id) if user_id.present?
    end
    
    scope :not_reply, -> do
        where(reply_id: nil)
    end
    
end
