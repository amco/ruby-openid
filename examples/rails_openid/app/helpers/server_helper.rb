
module ServerHelper

  def url_for_user
    server_user_page_url(username: session[:username])
  end

end

