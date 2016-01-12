require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||='postgresql://localhost/sinatra_angular_base')

class ActiveRecord::Base
  before_save :generate_uuid

  def generate_uuid
    self.uuid ||= SecureRandom.uuid if respond_to?(:uuid)
  end

  def resource_name
    self.class.name.underscore.pluralize
  end

  def url
    [nil, resource_name, to_param].join('/')
  end

  def to_param
    uuid
  end
end

class User < ActiveRecord::Base
  validates :name, presence: true
end
