Package.describe({
  name: "stratogee:relative-time",
  summary: "Nice relative time-ago based on Trello's algorithm",
  version: "1.0.0",
  git: "https://github.com/stratogee/relative-time"
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.3');

  api.use([
    'coffeescript',
    'deps',
    'underscore',
    'templating',
    'ui',
    'momentjs:moment'
  ], 'client');

  api.use(['mizzao:timesync@0.3.1'], ['client', 'server']);

  api.addFiles(['relative-time.coffee'], 'client');
  api.export('RelativeTime', ['client']);

});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('stratogee:relative-time');
  api.addFiles('relative-time-tests.js');
});


