class PostsController < ApplicationController
  before_action :authenticate_user!
    def index
      if params[:search] == nil
        @posts= Post.all
      elsif params[:search] == ''
        @posts= Post.all
      else
        #部分検索
        @posts = Post.where("name LIKE ?",'%' + params[:search] + '%')
      end
      #ここまで
  
    end
    def new
      @post = Post.new
    end

    def create
      post = Post.new(post_params)
      post.user_id = current_user.id
      if post.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end
  
    def period
      @periods = Post.where(category:"期間限定") 
    end
  
    def frappu
      @frappus = Post.where(category:"フラペチーノ") 
    end
  
    def coffe
      @coffes = Post.where(category:"コーヒー") 
    end

    def other
      @others = Post.where(category:"その他") #ここがポイント！categoryのバリューがhadakadebanezumiの投稿を取得！
    end

    def tea
      @teas = Post.where(category:"ティー") #ここがポイント！categoryのバリューがhadakadebanezumiの投稿を取得！
    end

    def espresso
      @espressos = Post.where(category:"エスプレッソ") #ここがポイント！categoryのバリューがhadakadebanezumiの投稿を取得！
    end
  
    



    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      post = Post.find(params[:id])
      if post.update(post_params)
        redirect_to :action => "show", :id => post.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: :index
    end


    
    private
    def post_params
     params.require(:post).permit(:name, :category, :about, :image, :custom1, :custom2)
    end
end
