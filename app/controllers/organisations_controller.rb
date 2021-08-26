class OrganisationsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_organisation, only: [:edit, :update, :destroy]

    def index
        @organisations = Organisation.all
        @organisation = Organisation.new

        @shifts = @organisation.shifts.all
    end

    def create 
        @organisation = Organisation.new(organisation_params)
        @organisation.save 
        current_user.update({organisation_id: @organisation.id})

        redirect_to index
    end

    def edit

    end

    def update
        @organisation.update(organisation_params)
        redirect_to index
    end

    def destroy
        @organisation.destroy
        redirect_to index
    end


    def join
        current_user.update({organisation_id: params[:id]})
        redirect_to index
    end

    private 

    def find_organisation 
        @organisation = Organisation.find(params[:id])
    end
    def organisation_params
        params.require(:organisation).permit(:name, :hourly_rate)
    end
end
