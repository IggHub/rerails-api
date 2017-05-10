# API component of React-Rails Todo App

*If you like it, give this project some love by giving it a star!*

Overall this is a simple todo-app that uses **Rails backend** and **React frontend.** Perfect to learn how to communicate between two different projects.

I used [this](https://www.fullstackreact.com/articles/how-to-get-create-react-app-to-work-with-your-rails-api/) as my reference to get started. This part will cover the API part. To see the frontend/ client part, check out the [ *rerails-client*](https://github.com/IggHub/rerails-client) repo.


## How to setup Rails as API provider for React (or other frontend frameworks)

1. Set up a basic Rails App without views by adding `--api` in the end of new command. `rails new AppName --api` (I am using Rails 5.0.0+)

2. Create the todos controller and basic CRUD methods. `rails generate controller Todos index show create destroy` (Ok, maybe CRD since I didn't have `Update`. I will maybe add `Update` method later). The methods are pretty simple. Feel free to peek at my `todos_controller.rb` to see what I have. The only thing that is different is that it is now rendering only `json` instead of `html`.

3. Don't forget the route! `resources :todos, only: [:index, :show, :create, :destroy]`. In my case, I used `api` namescope. Check my `routes.rb` for more info.

4. We need to create a simple todo model in database. Let's do so: `rails generate model Todo description:string`, then `rails db:migrate`

5. Right now we have a simple Rails api running. You can run `rails server` and go to `localhost:3000/api/todos`. If you do it right, you should see all your todos that you have made in `json` format. You can create them from `rails console` or seed them (copy my `seeds.rb` then run `rails db:seed`, then restart the server).

6. This is a good time to switch to [client side](https://github.com/IggHub/rerails-client) and set up components to display todos using `GET` request. Both fetch's `POST` and `DELETE` methods are left as an exercise. Feel free to take a look at the rerails-client repo for hints.

7. Once we get the basic React setup and proxied to 3001, we will setup [foreman gem](https://github.com/ddollar/foreman). Follow the instruction to install foreman on Rails.

8. Create a `Procfile` to run the following commands: `web: cd ../rerails-client && npm run start` and `api: rails server -p 3001`. The former line tells API to go to client-app and run the React app. The directory path may be changed to suit your directory. The latter tells rails to run rails server proxied to `localhost:3001`, the location where React app was set to proxy to. In short, Rails will run on `localhost:3001` while React will run on `localhost:3000` *and* React will look at `localhost:3001` to get its data from.

9. Finally, run `foreman start -p 3000`. If you go to `localhost:3000`, you will see the client app. If you go to `localhost:3001`, you will see the rails app. These two will be running simultaneously.

That's it! Now you have two apps running at the same time. If you have any question, feel free to let me know!
