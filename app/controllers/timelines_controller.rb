class TimelinesController < ApplicationController
    def index
        @input_message = params[:id] ? Timeline.find(params[:id]) : Timeline.new
        @timeline = Timeline.includes(:user).order('updated_at DESC')
    end

    def create
        timeline = Timeline.new
        timeline.attributes = input_message_param
        timeline.user_id = current_user.id
        if timeline.valid?
            timeline.save!
        else
            flash[:alert] = timeline.errors.full_messages
        end
        redirect_to action: :index
    end
    
    def update
        timeline = Timeline.find(params[:id])
        timeline.attributes = input_message_param
        if timeline.valid?
            timeline.save
        else
            flash[:alert] = timeline.errors.full_messages
        end
        redirect_to action: :index
    end

    private
    def input_message_param
        params.require(:timeline).permit(:message)
    end
    
end
