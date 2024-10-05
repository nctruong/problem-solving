# Ruby
```bash
bundle init
bundle add rspec
bundle exec rspec --init # for normal command line 
ruby filename.js
bundle exec rspec compare_two_arrays.rb
```
## Special for rails
```bash
bundle add rspec-rails
rails generate rspec:install 
bundle add factory_bot_rails
```
application.rb
```ruby 
config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: "spec/factories", fixture: false
      g.view_specs false
      g.helper_specs false
      g.routing_specs false
      g.controller_specs false
    end
```
rails_helper.rb
```ruby
config.include Devise::Test::ControllerHelpers, type: :controller # sign_in(user)
config.include Devise::Test::IntegrationHelpers, type: :request # for request specs
config.include FactoryBot::Syntax::Methods # create(:user)
```
# Node
Test filename must be *.test.js
```bash
npm init
npm install --save-dev jest
node filename.js
npm test 
```

