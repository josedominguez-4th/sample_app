module SessionsHelper

  def authenticate
    deny_access unless signed_in?
  end

  def current_user?(user)
    user == current_user
  end

  def deny_access
    store_location
    flash[:notice] = "Please sign in to access this page."
    redirect_to signin_path
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user
  end

  def followed_in? (user)
    current_user != user 
  end

  def is_follow? (user)
    @follow = current_user.followings.find_by_followed_id(user)
    !@follow.nil?
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    current_user = nil
  end

  private
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
    def authUserInPopEmailServer(user,password)
	begin
		Net::POP3.auth_only('pop.4thsource.com',110,user,password)
		return true
	rescue Net::POPAuthenticationError => popAuthErr
		return false
	end
    end
    def validateEmail4thSource(email)
	email_regex = %r{
	       ^               
		[0-9a-z]+   
		[\.]            
		[0-9a-z]+   
		@              
		4thsource   
		[\.]            
		com           
		$               
        }xi                    
	return true if email =~ email_regex
       	return false	
  end
end
