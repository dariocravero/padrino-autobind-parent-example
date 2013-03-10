# Auto-magically bind parent objects on routes

This is a proof of concept that we can auto-magically bind a parent object to route's scope.

## Why could this be useful?

Say you have the following controllers structure:

* Foo
  * Bar
* Baz
  * Qux

If you happen to have models called Foo and Baz (which is generally the case) you may find yourself doing something like many times:

```
before do
  @foo = Foo.find(params[:foo_id])
end
```

So you can then access it from your route directly:

```
get :index do
  @foo.id
  @foo.bars.id
end
```

This lib automatically binds parent objects (Foo, Baz) into your nested controller routes (like index in Bar or Qux).

*Might prove handy :)*

Thanks to @postmodern for asking if this would be possible... Now it is! :)

Thoughts?

## Presenting the amazing `padrino_route_added` hook! 

We have to document these hooks better! They're so useful!.. :)

Will try to draft something soon.
