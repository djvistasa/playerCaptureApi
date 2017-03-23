class HomeController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def index

  end

  def create_player
    @data = { success: 0, message: "Invalid request!" }

    player = Player.create(
        name: params['name'],
        surname: params['surname'],
        age: params['age'],
        sport: params['sport'],
        team: params['team'],
        position: params['position'],
        #nationality: ['nationality'],
        height: params['height'],
        weight: params['weight'],
        #avatar: params['avatar']
    )

    @players = Player.all

    if player.save
      @data = {
          message: "player created succesfully",
          success: 1
      }

    else
      @data[:message] = client.errors.full_messages

    end

    respond_to do |format|
      format.json { render json: @data}
      format.js
    end
  end

  def get_players
    @data = { success: 0, message: "Invalid request!" }

    @players = Player.all
    logger.debug(@players)
    @data = {
        message: "players retrieved succesfully",
        success: 1,
        players: @players
    }
    logger.debug(@data)
    respond_to do |format|
      format.json { render json: @data}
      format.js
    end
  end
end
