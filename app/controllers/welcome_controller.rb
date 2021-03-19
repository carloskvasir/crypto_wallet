# frozen_string_literal: true
class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby =)[🍪 - Cookie]"
    session[:curso] = "Curso de Ruby =)[⚙️  - session]"
  end

  def inicio; end
end
