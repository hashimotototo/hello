class DiscoversController < ApplicationController
    
        def index
        end
      
        def new
          @discover = Discover.new
        end
      
        def show
          @discover = Discover.find_by(id: params[:id])
        end
      
        def create
          @discover = Discover.new(discover_params)
          params[:discover][:question] ? @discover.question = params[:discover][:question].join("") : false
          if @discover.save
              flash[:notice] = "診断が完了しました"
              redirect_to discover_path(@discover.id)
          else
              redirect_to :action => "new"
          end
        end
      
      private
        def discover_params
            params.require(:discover).permit(:id, question: [])
        end
     
      
end
