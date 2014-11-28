# Zype Rails Template App

This is a boilerplate Rails App using the Zype Platform and Zype Gem.

## Setup

1. You will need your Zype API and Player keys. You can find these [in the Zype Platform](https://admin.zype.com/settings/api).

2. Clone the repo

3. Run 'bundle install' to install dependencies.

4. Run 'rake db:create' to create the database.

5. This application uses [dot-env](https://github.com/bkeepers/dotenv) to store keys. Create a .env file at the root of the app and set the following environment variables:

- SECRET_KEY_BASE: Run 'rake secret' to create a key.
- ZYPE_API_KEY: Your Zype API Key
- ZYPE_PLAYER_KEY: Your Zype Player Key
