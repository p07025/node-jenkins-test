# base
gulp = require 'gulp'
gutil = require 'gulp-util'

# misc
cond  = require 'gulp-if'
clean = require 'gulp-clean'
 
# compilers
uglify = require 'gulp-uglify'
lsc    = require 'gulp-livescript'
coffee = require 'gulp-coffee'

# test tools
mocha = require 'gulp-mocha' 

# coverage tools
istanbul = require 'gulp-istanbul'

# coffeelint
coffeelint = require 'gulp-coffeelint'

isRelease = gutil.env.release?
 
 
gulp.task 'script', ->
  gulp.src 'src/**/*.ls'
    .pipe lsc() .on 'error', gutil.log
    .pipe cond isRelease, uglify()
    .pipe gulp.dest 'lib'
 
 
gulp.task 'watch', ->
  gulp.watch 'src/**/*.ls', ['script']
 
 
gulp.task 'clean', ->
  gulp.src 'lib/*.js', {read:false}
    .pipe clean()
 
 
gulp.task 'default', ['script', 'watch']

gulp.task 'test', ['script'], ->
   gulp.src ['lib/*.js', 'test/*.coffee']
     .pipe mocha {reporter: 'xunit-file'}


gulp.task 'cover', ->
  gulp.src ['lib/*.js']
    .pipe istanbul()
    .on 'end', ->
      gulp.src ['lib/*.js', 'test/*.coffee']
        .pipe mocha()
        .pipe istanbul.writeReports 'coverage'


gulp.task 'lint', ->
  gulp.src ['./test/*.coffee']
    .pipe coffeelint()
    .pipe coffeelint.reporter()



