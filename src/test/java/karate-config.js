function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'qa';
  }
  var config = {
    env: env,
    access_token: 'Bearer 996f2855416d2873b25f0d8721b0bc675fa7c118ad92180566456d73c8509a3b',
    base_url: 'yyygyy',
    content_type:  'application/json'
}
  /*if (env == 'qa') {
    config.base_url = 'https://reqres.in/api'
  } else if (env == 'uat') {
    // customize
    config.base_url = 'https://reqrs.in/api'
  }*/
  return config;
}