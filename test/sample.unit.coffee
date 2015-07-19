require 'should'
 
foo = require('../lib/sample')
 
describe 'foo()', ->
    it 'は引数ありなら正負を逆にした値を返す', ->
        foo(9).should.equal -9
        foo(-3).should.equal 3
    it 'は0なら0を返す', ->
        foo(0).should.equal 0
    it 'は引数なしなら0を返す', ->
        foo().should.equal 0

