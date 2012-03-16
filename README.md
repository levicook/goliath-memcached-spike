
This project is a proof of concept designed to confirm the viability of
accessing [Memcached][1] from [Goliath][2], in a non-blocking fashion.

In particular, I'm interested in seeing if I can get the [Dalli][3] gem
connected to [Couchbase Server][4].

Seems to be working fine, but it's a little harder to test this one.
Memcached is generally fast enough, that blocking operations are hard(er)
to find.

[1]: http://memcached.org/
[2]: http://postrank-labs.github.com/goliath
[3]: https://github.com/mperham/dalli 
[4]: http://www.couchbase.com/couchbase-server/overview

### Results on Api#fetch

    [20659:DEBUG] 2012-03-15 23:20:38 :: cache missed
    [20659:INFO] 2012-03-15 23:20:38 :: Status: 200, Content-Length: 11, Response Time: 5.40ms
    [20659:INFO] 2012-03-15 23:20:39 :: Status: 200, Content-Length: 11, Response Time: 5.31ms
    [20659:INFO] 2012-03-15 23:20:39 :: Status: 200, Content-Length: 11, Response Time: 4.25ms
    [20659:INFO] 2012-03-15 23:20:40 :: Status: 200, Content-Length: 11, Response Time: 5.03ms
    [20659:INFO] 2012-03-15 23:20:41 :: Status: 200, Content-Length: 11, Response Time: 4.18ms
    [20659:INFO] 2012-03-15 23:20:41 :: Status: 200, Content-Length: 11, Response Time: 4.77ms
    [20659:DEBUG] 2012-03-15 23:20:44 :: cache missed
    [20659:INFO] 2012-03-15 23:20:44 :: Status: 200, Content-Length: 11, Response Time: 5.45ms
    [20659:INFO] 2012-03-15 23:20:45 :: Status: 200, Content-Length: 11, Response Time: 3.20ms
    [20659:INFO] 2012-03-15 23:20:46 :: Status: 200, Content-Length: 11, Response Time: 4.86ms
