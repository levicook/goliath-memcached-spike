config['memcached-connection-pool'] = EM::Synchrony::ConnectionPool.new(size: 5) do
  Dalli::Client.new(nil, async: true)
end
