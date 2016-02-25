# ConcurrentAcceptance

To run concurrent acceptance tests with selenium:

  * Install dependencies with `mix deps.get` and `npm install`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start selenium with `./node_modules/.bin/selenium &`
  * Run `mix test`
