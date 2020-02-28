# Practice

## Basics

* `arr[::-1]` uses `start:end:step`  to return the array in reverse order
* `range(start, stop, hop)`
* `list [:]` creates a copy
* `map(lambda x: str(x), arr)`  Output: `['1','2','3']`
* `float(“inf”)` and `float(“-inf”)` for initializing a far bigger and smaller value
* String formatting https://pyformat.info/

## How to use stuff

### List as queue
```
arr = [1,2,3]
arr.append(x) # queue.push(x)
arr.pop(0) #queue.pop()
arr[0] #queue.peek()
```

### List as stack
```
arr = [1,2,3]
arr.append(x) #stack.push(x)
arr.pop() # stack.pop()
arr[-1] # stack.peek()
```

### Use Namedtuples:
```
Point = namedtuple('Point', ['x', 'y'])
p = Point(11, y=22)
x, y = p 
p[0] + p[1]  # 33
p.x + p.y  # 33
p  # Point(x=11, y=22)
```

### Use defaultdict 
from collections for saving some time initializing values for new keys.
`s = [('yellow', 1), ('blue', 2), ('yellow', 3), ('blue', 4), ('red', 1)]`

### Defaultdict use:
```
d = defaultdict(list)
for k, v in s:
    d[k].append(v)
d.items()  # [('blue', [2, 4]), ('red', [1]), ('yellow', [1, 3])]
```

### Normal dict use:
```
d = {}
for k, v in s:
    d.setdefault(k, []).append(v)
d.items()  # [('blue', [2, 4]), ('red', [1]), ('yellow', [1, 3])]
```
Useful for:
```
s = 'mississippi'
d = defaultdict(int)
for k in s:
    d[k] += 1
d.items()  # [('i', 4), ('p', 2), ('s', 4), ('m', 1)]
```

### `else` after loops
Python has a cute else statement after the loop, which executes if you finish the loop normally (say, without a break). 
This can be very useful for shorthand coding, but to an outside obersver it looks like part of a faulty if-else at first glance.
```
counter = 0
while counter <= 5:
  print counter,
  counter += 1
else:
  print "loop exited normally"
# Output: 0 1 2 3 4 5 loop exited normally

for i in range(5):
  print i,
  if i > 3:
   break
else:
  print "loop exited normally"
# Output: 0 1 2 3 4
```

### pickle 
-> write to string for storing in file

### `map(fun, iter)`
returns a list of the results after applying the given function to each item of a given iterable (list, tuple etc.) 

### `numpy.argsort()`
returns the indices of the elements in sorted order

## Advanced

### Set Property
set property of a class with  `property(fget, fset, fdel, doc)`
https://www.geeksforgeeks.org/python-property-function/


# Theory
## Key features of python:
- interpreted
- dynamically typed
- OOP
- writing code quick, runing code slow
- "glue" code

## Python Objects
All Python objects have three things: a value, a type, and an identity. 

## Mutability
### Immutable objects
"An object with a fixed value. includes numbers, strings and tuples. Such an object cannot be altered. A new object has to be created if a different value has to be stored."

Integers (and floats, Booleans, strings, frozen sets, and bytes) are immutable; their value doesn't change.

### Mutable Objects
"Mutable objects can change their value but keep their id()."

Lists (and dictionaries, sets, arrays, and bytearrays), are mutable. 

## `==` vs `is`
The == equality operator compares values, while the is operator compares identities. 

You can consider `x is y` to be shorthand for `id(x) == id(y)`

## Hashability
"An object is hashable if it has a hash value which never changes during its lifetime" Immutable objects can be hashable, mutable objects can't be hashable. 
(only hashable objects can be used as keys in a dictionary or as items in a set.)

A hash is an integer that depends on an object's value, and objects with the same value always have the same hash. 
(Objects with different values will occasionally have the same hash too. This is called a hash collision.) 

While id() will return an integer based on an object's identity, the hash() function will return an integer (the object's hash) based on the hashable object's value. 
Since hashes are based on values and only immutable objects can be hashable, this means that hashes will never change during the object's lifetime.

Corner case: a tuple (which should be immutable) that contains a mutable list cannot be hashed.
A tuple is immutable: it always contains the same identities(objects) in the same order. 
However, if one of those objects is mutable, the value of that object can be changed (but not it's identity). 
Which is why immutable objects (ints, strings, bools, ...) in a tuple can not be changed (as it would require a new identity).

## range vs xrange 
xrange generates numbers as they are used, not in advance.

## monkey patching: 
modifying methods of class after definition

## Decoarators
Using decorators, you can wrap a class or function method call so that a piece of code can be executed before or after the execution of the original code.



