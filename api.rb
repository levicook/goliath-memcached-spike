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

  def connection_pool
    config['memcached-connection-pool'].execute(false) { |c| yield c }
  end

  def fetch(key, ttl=nil, options=nil, &block)
    connection_pool { |c| c.fetch(key, ttl, options, &block) }
  end

end
