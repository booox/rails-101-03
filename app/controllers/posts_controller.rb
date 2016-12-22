class PostsController < ApplicationController
    before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

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

    # edit
    def edit
        @group = Group.find(params[:group_id])
        @post = Post.find(params[:id])
    end

    # update
    def update
        @group = Group.find(params[:group_id])
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to account_posts_path, notice: "Post Updated."
        else
            render :edit
        end
    end
    
    # delete
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to account_posts_path, alert: "Post Deleted."
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end
end
