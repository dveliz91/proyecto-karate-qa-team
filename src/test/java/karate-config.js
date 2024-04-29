function fn() {
  var env = karate.env;

  var config = {
    env: env,
    urlBase: 'https://api-ventas.synnexaconsulting.com',
    urlLogin: '/api/login',
    urlRegister: '/api/register',
    urlProducto: '/api/v1/producto'
  }

  return config;
}