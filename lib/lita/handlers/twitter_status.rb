require 'twitter'

module Lita
  module Handlers
    class TwitterStatus < Handler
      config :consumer_key
      config :consumer_secret
      config :access_token
      config :access_token_secret

      attr_writer :twitter

      def twitter
        if @twitter.nil?
          @twitter = Twitter::REST::Client.new do |c|
            c.consumer_key        = config.consumer_key
            c.consumer_secret     = config.consumer_secret
            c.access_token        = config.access_token
            c.access_token_secret = config.access_token_secret
          end
        end
        @twitter
      end

      route(/(twitter|lasttweet)\s+(\S+)\s?(\d?)/i, :status, command: true)

      def status(response)
        username = response.match_data[2]
        count = "1"
        count = response.match_data[3] unless response.match_data[3].empty?

        log.debug "username: #{username}"
        log.debug "count: #{count}"

        tweets = get_tweets(username, count)

        log.debug tweets.inspect

        response.reply tweets.last.text
      end

      def get_tweets(username, count)
        options = {
          count: count,
          include_rts: false,
          exclude_replies: true
        }
        twitter.user_timeline(username, options)
      end

      Lita.register_handler(TwitterStatus)
    end
  end
end
