class AuthenticationController < ApplicationController
  skip_before_action  :verify_authenticity_token
  def sign_in
    @data = { success: 0, message: "Invalid request!" }


    username = params["username"]
    password = Digest::MD5.hexdigest(params["password"])
    validLogin = false

    logger.debug(username)
    logger.debug(password)

    User.all.each do |user|
      if user.password == password && user.username == username
        validLogin = true

      end
    end

    if validLogin
      @data = { success: 1, message: "Welcome " + username }

    else
      @data = { success: 0, message: "Invalid username or password" }
    end

    respond_to do |format|
      format.json { render json: @data}
      format.js
    end
  end


end
