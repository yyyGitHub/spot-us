class UiController < ApplicationController
  before_filter :ensure_page_exists, :only => "show"
  layout :home_layout

  def index

  end

  def show
    render :template => "ui/#{params[:id]}"
  end

  private

  def home_layout
    return 'bare' if params[:action] == 'index'
    return 'test' if params[:id] == 'test'
    return 'application'
  end

  def ensure_page_exists
    unless template_exists?("ui/#{params[:id]}")
      render :nothing => true, :status => 404 and return false
    end
  end
end

