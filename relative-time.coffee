RelativeTime = 
  from: (time, interval = undefined) ->
    diff = TimeSync.serverTime(undefined, interval) - time.valueOf()

    seconds = Math.abs(diff) / 1000
    minutes = seconds / 60
    hours = minutes / 60
    days = hours / 24

    # console.log [days, hours, minutes, seconds].join(", ")

    if seconds < 25
      "just now"
    else if seconds < 120
      "a minute ago"
    else if minutes < 60
      "#{Math.floor(minutes)} minutes ago"
    else if minutes < 120
      "an hour ago"
    else if hours < 3
      "#{Math.floor(hours)} hours ago"
    else if moment(time).format("DD MM YYYY") is moment(TimeSync.serverTime()).format("DD MM YYYY")
      "today at #{moment(time).format('h:mma').toLowerCase()}"
    else if moment(time).format("DD MM YYYY") is moment(TimeSync.serverTime()).subtract(1, "days").format("DD MM YYYY")
      "yesterday at #{moment(time).format('h:mma').toLowerCase()}"
    else if days < 90
      moment(time).format('MMM D') + " at " + moment(time).format('h:mm a')
    else
      moment(time).format('MMM D, YYYY') + " at " + moment(time).format('h:mm a')

  microFrom: (time, interval = undefined) ->
    diff = TimeSync.serverTime(undefined, interval) - time.valueOf()

    seconds = Math.abs(diff) / 1000
    minutes = seconds / 60
    hours = minutes / 60
    days = hours / 24
    months = days / 30
    years = months / 12

    if seconds < 60
      "#{Math.floor(seconds)}s"
    else if minutes < 60
      "#{Math.floor(minutes)}m"
    else if hours < 24
      "#{Math.floor(hours)}h"
    else if days < 30
      "#{Math.floor(days)}d"
    else if months < 12
      "#{Math.floor(months)}mo"
    else
      "#{Math.floor(years)}y"

UI.registerHelper "relativeTime", RelativeTime.from
UI.registerHelper "relativeTimeMicro", RelativeTime.microFrom