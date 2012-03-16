require './boot'

class Api < Goliath::API

  def response(env)
    results = fetch('test', 5) do
      logger.debug('cache missed')
      'hello world'
    end

    [ 200, { 'Content-Type' => 'text/plain' }, results ]
  end

  private

  def fetch(key, ttl=nil, options=nil, &block)
    config['memcached-connection-pool'].execute(false) do |connection|
      connection.fetch(key, ttl, options, &block)
    end
  end

end
