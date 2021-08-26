class ShiftsController < ApplicationController
    def index
        
    end

    def create 
        @shift = Shift.create!(shift_params)
        redirect_to root_path
    end

    private 
    def shift_params 
        params.permit(:user_id, :shift_date, :start, :end )
    end
end
