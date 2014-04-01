class SandboxController < ApplicationController
  def index
    @re = params[:re]
    render @re
  end
end
