type
  vector* {. header: "vector", importcpp: "std::vector" .}[T] = object

proc constructVector*[T](): vector[T] {. importcpp: "std::vector<'*0>(@)" .}
proc push_back*[T](this: vector[T], x: T) {. importcpp: "#.push_back(@)" .}
proc size*[T](this: vector[T]): csize {. importcpp: "#.size()" .}
proc clear*[T](this: vector[T]) {. importcpp: "#.clear()" .}
proc `[]`*[T](this: vector[T], i: csize): T {. importcpp: "#[@]" .}
