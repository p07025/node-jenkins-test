(function(){
  function foo(a){
    a == null && (a = 0);
    return -a;
  }
  if ((typeof module != 'undefined' && module !== null) && module.exports != null) {
    module.exports = foo;
  }
}).call(this);
