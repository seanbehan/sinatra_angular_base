module Helpers
  def data
    @data ||= JSON.parse(request.body.read)
  end
end
