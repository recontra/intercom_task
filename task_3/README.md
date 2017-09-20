### TASK
We have some customer records in a text file (customers.json) -- one customer per line, JSON-encoded. We want to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

### SOLUTION
For this task we first need to calculate distance betwen HQ and user. For that I created simple geodistance calculator `geodistance.rb` with one method that retun distance in kilometers between two points given as class initialize params.
`Geodistance.new(point1, point2).distance_in_km`.
Second part of task was creating method that will read privided text document with users, calculate distance and return ids and names of user within radius.
This is solved in `inviter.rb` which have simple `Inviter` class with one instance method `invite`.
Class initializer and method din't require params (defaults are ones from task) but for easier testing initializer accepts path to file with data, and `invite` method accepts radius for invite.

#### Runing
simple case from task
`Inviter.new.invite`
we can also call it with different data and radius
`Inviter.new("path to data").invite(radius_in_km)`

Best way to try it live is following:
* Position in intercom/task_3 folder
* Open interactive ruby shell and require file
`irb -I . -r inviter.rb`
* run i.e. `Inviter.new.invite`


#### Runing test
* Position in intercom/task_3 folder
* run `rspec spec/inviter_spec.rb`
* run `rspec spec/geocoder_spec.rb`
