# Description:
#   Shut.
#
# Commands:
#   hubot shut <handle> - Provides a gentle suggestion for what <handle> should do.

module.exports = (robot) ->
  robot.respond /(shut|.. shut) (.*)$/i, (msg) ->
    handle = msg.match[2]

    robot.http("http://dotdotshut.herokuapp.com/shut")
      .query({handle: handle})
      .post() (err, res, body) ->
        data = JSON.parse(body)
        url  = data.url

        msg.send url
