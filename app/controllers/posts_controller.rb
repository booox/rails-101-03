class PostsController < ApplicationController
    before_filter :authenticate_user!, :only => [:new, :create]

    # new
    def new
        @group = Group.find(params[:group_id])
        @post = Post.new
    end

    # create
    def create
        @group = Group.find(params[:group_id])
        @post = Post.create(post_params)
        @post.group = @group
        @post.user = current_user

        if @post.save
            redirect_to group_path(@group)
        else
            render :new
        end
    end


    private

    def post_params
        params.require(:post).permit(:content)
    end
end
