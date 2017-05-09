# frozen_string_literal: true
class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  respond_to :json, :html

  rescue_from RailsParam::Param::InvalidParameterError do |exception|
    render json: { errors: exception }, status: 422
  end

  def default_serializer_options
    { root: false }
  end
end
