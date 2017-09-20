### TASK
Write a function that will flatten an array of arbitrarily nested arrays of integers into a flat array of integers. e.g. [[1,2,[3]],4] → [1,2,3,4]. If the language you're using has a function to flatten arrays, you should pretend it doesn't ex

### SOLUTION
I created simple array utilis class `ArrayUtils` with one class method `flattener` that accepts one parameter.
If parameter is array it will return flatten array in other case it will return given object.

#### Runing
i.e. `ArrayUtils.flatten([1, 2, [3,4,[5,6]]])`

Best way to try it live is following:
* Position in intercom/task_1 folder
* Open interactive ruby shell and require file
`irb -I . -r inviter.rb`
* run i.e. `ArrayUtils.flatten([1, 2, [3,4,[5,6]]])`


#### Runing test
* Position in intercom/task_1 folder
* run `rspec spec/array_utils_spec.rb`
