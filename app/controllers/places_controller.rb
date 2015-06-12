class PlacesController < ApplicationController
      before_action :set_place, :only => [ :show, :edit, :update, :destroy]



      def index
            @places = Place.all
            @places = Place.page(params[:page]).per(30)
      end
      def new
            @place = Place.new

      end
      def create
              @place = Place.new(place_params)

              if @place.save
                    redirect_to :action => :index
                    flash[:notice] = "event was successfully created"
              else
                  render :action => :new
            end
      end
      def show
            # @place = Place.find(params[:id])
            @page_title = @place.name
      end
      def edit
            # @place = Place.find(params[:id])
            @page_title = "Edit " + @place.name

      end
      def update
            # @place = Place.find(params[:id])
            if @place.update(place_params)
                  redirect_to :action => :show, :id => @place
                  flash[:notice] = "event was successfully updated"
            else
                  render :action => :edit
            end
      end
      def destroy
            # @place = Place.find(params[:id])
            @place.destroy
            flash[:notice] = "event was DELETED"
            redirect_to :action => :index

      end


      private

            def  place_params
                  params.require(:place).permit(:name, :description, :address, :is_open, :capacity)

            end
            def set_place
                   @place = Place.find(params[:id])
            end

end
