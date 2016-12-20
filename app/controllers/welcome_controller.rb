class WelcomeController < ApplicationController
    def index
        flash[:notice] = "早安！你好！"
        flash[:alert] = "晚安！该睡了！"
        flash[:warning] = "This is a warning info!"
    end
end
