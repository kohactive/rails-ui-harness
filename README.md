#Rails-Ui-Harness
---

## Problem

Sometimes we want to give UI/Frontend the developers the ability to easily test and develop Views that have already been "wired up". Often "wired up" views have specific requirements, in terms of application state, that must be met in order to test parts of a view that are being developed.

> e.g. A user having a specific flag set, or payments exisiting on an order


## Goals

- Allow the easy rendering of views in a rails project via a generic test controller. 
- Facilitate setting very specific application state / conditions.
- Require little controller setup and no knowledge of application state
- Provide easy fallbacks for instance variable properties and helper methods
- Allow instance variable properties to be set to custom values
- Allow helper methods to be easily stubbed to return custom values


## Getting Stated

add

```
gem rails-ui-harness, github: "kohactive/rails-ui-harness"
```

to your Gemfile.

### Create a test controller

```ruby
class TestController < ActionController::Base

  include RailsUiHarness::HarnessHelper

  stub_method :testing_stub, "Hello world" # < Stub a helper method

  def test
    @order = RailsUiHarness::Harness.new < Create a Harness / Proxy object
    @order.number = "R101010101" < Set a property on the instance object
    render "orders/show"
  end
end
```

### Add a route

```ruby
	get '/test_harness' => "test#test"

```
