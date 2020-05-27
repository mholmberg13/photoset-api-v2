class WelcomeController < ApplicationController
    def index
        render json: { status: 200, message: "photoset API" }
      end
end
