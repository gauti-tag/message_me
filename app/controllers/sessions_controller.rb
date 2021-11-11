class SessionsController < ApplicationController
    
    def new 
    end
    
    def create
        
       user = User.find_by(username: params[:session][:username])
       
       if user && user.authenticate(params[:session][:password])
           
           session[:user_id] = user.id
           flash[:success] = "You have successfully log in"
           redirect_to root_path
           
       else
           
           #flash.now[:error] = "there was something wrong with your information" / does not work may be because of ruby version
           flash[:error] = "there was something wrong with your information"
           render 'new'
           
       end
    end
    
    
    def destroy
        
        session[:user_id] = nil
        flash[:success] = "you have successfully log out"
        redirect_to login_path
        
    end
end