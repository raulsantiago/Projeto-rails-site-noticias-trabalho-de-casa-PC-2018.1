# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

require 'carrierwave'
require 'carrierwave/orm/activerecord'



run Rails.application
