# frozen_string_literal: true

module ApplicationHelper

  def active_link?(active_link)
    'active' if controller_name == active_link
  end
end
