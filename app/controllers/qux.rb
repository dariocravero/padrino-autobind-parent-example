AutobindParentObject::App.controllers :qux, parent: :baz do
  get :index do
    "I'm index @ qux and baz is #{@baz.id}"
  end
end
