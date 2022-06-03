# Ruby常用语法

> Ruby语法简单一致，只用明白几个基本概念，其他的看手册随查随用。[Ruby-Doc](http://ruby-doc.org)

## 一些要点
 - Ruby 中变量、表达式 值的真假： nil/false 为假，其他为真， 这点与很多语言不同，与lisp一致。**重点：整数0为真**
 - Ruby很多地方的（）是可以省略的，但是有的地方不能省略（会报错，不会以意外的方式运行）。表示代码块时 do/end 类似 {} ，但是不完全一样。

## Switch 语法
```ruby
case "str"
when /^s/, "abc"
  puts "match one"
when /r$/ then puts "one line statement"
else
  puts "otherwise"
end
```
[Ruby-Doc/syntax/control_expressions](http://ruby-doc.org/core-2.6.3/doc/syntax/control_expressions_rdoc.html)

## 遍历
遍历 数组、哈希、Range
```ruby
arr = [ 1, 2, 3 ]
hash = { a: 1, b: 2, c: 3 }
arr.each { |v| puts v }   # 遍历数组
hash.each { |k,v|  puts k, v }  # 遍历hash
hash.keys.each { |k| puts k }  # 遍历hash keys
```

## Map Reduce
```ruby
(1..5).map{ |v| v*v }.reduce(:+)  # 1 + 4 + 9 + 16 + 25
(1..5).select{ |v| v % 2 == 0 }.reduce(:*)  # 2 * 4
```

## 函数参数
```ruby
# 简单的参数情况， 带默认值
def func(a, b, c = 1)    p a, b, c   end

# keyword 参数
def func(a, b = 0, c: 1, d: 2)   p a, b, c, d end
func(1,2,d:5) #=> 1 2 1 5
func(1,d:5)  #=> 1 0 1 5

# 参数收集, 第一个参数给了a，最后一个给了f，中间的给args
def func(a, *args , f)   p a, args, f end
func(1,2,3,4,5)  #=> 1 [2,3,4] 5
func(1,2)  #=> 1 [] 2
# 参数个数少于2报错
```

## 猴子补丁
不懂猴子补丁的google一下
```ruby
class Integer
  def power(n)
    n.times.reduce(1){ |s| s *= self }
  end
end
5.power(3)  # 5*5*5 = 125
```

## Ruby 闭包（匿名函数）
最喜欢的是Ruby的闭包（匿名函数/lambda），从上面的例子可以看出，Ruby里面闭包无处不在。Swift的风格也是这样的， 用起来很方便。
 * 比如，找出年纪大于20、身高在160-180的男性职员：
   `staffs.select{ |m| m.male }.select{ |m| m.age > 20 }.select{ |m| (160..180).include? m.height }`，
   可以串起来写，也可以把条件写在一个block里面。
 * 打印身高最高的职员的名字： `puts staffs.max_by{ |m| m.height }.name`
 * 计算身高大于170男性职员的数量：`staffs.select{ |m| m.male }.count{ |m| m.height > 160 }`
 * 统计男性职员的平均年龄：`staffs.select{ |m| m.male }.map{ |m| m.age }.average`, 
   可是数组没有average方法啊？ 参考"猴子补丁"添加一个average方法就行啦

## 对比Python
Ruby 有block界定词（then/do/end;{}; .etc），使得单行代码成为可能，就像 c 一样， 如： 
`if a > b then a-=1; b += 1 end`
`case a when 1 then a + 1 when 2 then a - 1 end`
当然什么代码都往一行写就让人像抽死他了。大量简单语句各写一行（而不是三行）还是很方便的。

Python 使用缩进界定代码块，除了强制要求了编码风格外，也减少的结尾界定符（end,}),也就减少了代码的行数。 这一点有利有弊吧。

我写代码的时候很喜欢敲自动缩进快捷键，每次自动缩进之后，发现代码对齐的位置不对了，我就知道某个地方缺少了")}"，这是写C/C++养成的习惯，所以写python的时候就很不习惯。不过还好，写多了就意识到自己再写python，自然就不去按tab了。

### 简单推导
对比python的简单推导，ruby更加简单直观，更面向对象
```python
[ x*2 for x in range(1,4) ] #=> [2,4,6]
[ [x,x*2] for x in range(1,4) ] #=> [ [1,2], [2,4], [3,6] ]
{ x: x*2 for x in range(1,4) } #=> { 1: 2, 2: 4, 3: 6 }
( x*2 for x in range(1,4) ) #=> generator of (2,4,6)
```
```ruby
(1..3).map{ |v| v*2 }  # => [2,4,6]
(1..3).map{ |v| [v,v*2] }  # => [[1,2],[2,4],[3,6]]
(1..3).map{ |v| [v,v*2] }.to_h  # => {1=>2, 2=>4,3=>6}
(1..3).map{ |v| v*2 }.each # Enumerator of [2,4,6]
```


## 引用其他脚本
多脚本组成的工具时用得上。
```ruby
require File.expand_path('../another', __FILE__) 
require File.join(File.dirname(__FILE__), 'another')
require_relative('another')  # recommanded

load File.expand_path('../rblib/mytool.rb', __FILE__)
```
require 能更好的处理重复加载的情况，使用require的时候可以忽略.rb 后缀。

## 其他小技巧

 * 判断脚本是否为独立执行： `if $0 == __FILE__`
