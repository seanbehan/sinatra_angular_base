require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||='postgresql://localhost/sinatra_angular_base')

class ActiveRecord::Base
  before_save :generate_uuid

  def generate_uuid
    self.uuid ||= SecureRandom.uuid if respond_to?(:uuid)
  end

  def url
    [nil, self.class.name.underscore, to_param].join('/')
  end

  def to_param
    uuid
  end
end

class User < ActiveRecord::Base
end
