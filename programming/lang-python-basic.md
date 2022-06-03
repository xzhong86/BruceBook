# Python常用语法

> 这里记录了一些会用到又没有烂熟于心的语法。

## 表达式
- 真值判定： `False None 0 "" () [] {}` 被视为假
- 单行if： `if expr : print 'something'`
- 三目运算： `x = 1 if expr else 2` 等同C `x = expr ? 1 : 2`

## 语法
### For 循环
```python
for x in seq:
  do something
  if expr: break
else:
  # no break until end of 'for'
```
这里的else 是比较特别的语法

```python
for key,val in dict.items():
    print(key, val)
d.keys()  # get keys
d.values() # get values
```
遍历字典

## 正则表达式
```ruby
exp = re.compile("(\w+)=(\w+)")
m = exp.match(" a=1 ")
m.group(1)  # 'a'
m.group(2)  # '1'
m = re.match("(\w+)=(\w+)", " a=1 ")  # same as above
```

## 自助
```python
v = 1
dir(v)  # check member/function of v (int)
type(v)  # <class 'int'>
help(type)  # 各种帮助，查看文档
type(v).__base__  # 查看基类
os.__file__  # 定位库所在的文件、路径
```

### 简单推导(Comprehensions)
[Python/Comprehensions](https://python-3-patterns-idioms-test.readthedocs.io/en/latest/Comprehensions.html)
```python
[ x*2 for x in range(1,4) ] #=> [2,4,6]
[ [x,x*2] for x in range(1,4) ] #=> [ [1,2], [2,4], [3,6] ]
{ x: x*2 for x in range(1,4) } #=> { 1: 2, 2: 4, 3: 6 }
( x*2 for x in range(1,4) ) #=> generator of (2,4,6)
```
可使用简单推导生成列表、字典、元组（生成器）
![完整语法](https://upload-images.jianshu.io/upload_images/3934566-1d6ff13df5abc6fe.gif?imageMogr2/auto-orient/strip)

## 生成器
```python
def mygen(max):
    for x in range(1,max):
        yield x

for v in mygen(5):
    print(v)   #=> print 1 2 3 4
```
python特有语法， 使用yield关键字

## 多脚本
```python
sys.path.append(os.path_realpath(__file__ + '/../pylib'))
import mytool
from mytool import MyTool
```
目前只找到通过添加加载path的方式加载自己的其他脚本

## 其他小技巧

 * 判断脚本是否为独立执行： `if __name__ == '__main__'`
