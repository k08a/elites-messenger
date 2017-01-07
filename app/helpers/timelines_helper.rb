module TimelinesHelper
    
    def mypost?(timeline)
        timeline.user.id == current_user.id
    end
end
