path = File.expand_path '../../', __FILE__
PATH = path
APP = "estemporary"

Encoding.default_internal = Encoding::UTF_8
Encoding.default_external = Encoding::UTF_8


require "bundler/setup"
Bundler.require :default

Oj.default_options = { mode: :compat }

module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

env = ENV["RACK_ENV"] || "development"
# DataMapper.setup :default, "mysql://localhost/estemporary_#{env}"
require_all "#{path}/models"
# DataMapper.finalize
