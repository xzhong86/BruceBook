# Csh常用语法

> 任何时候写代码带上空格都是好习惯，不同语言对空格的处理可能不一样，但是良好的空格是所有语言都支持的

## 变量与环境变量
设置、删除基本变量 `set var = 1`， `unset var`
设置、删除环境变量 `setenv NAME VALUE`， `unsetenv ENVNAME`
数组（列表）变量 `set arr = ( a b ) # ('ls') (*.c)`

## 基本语法(if while foreach)
### 基本表达式 expr
- 条件表达式
比较运算： `(a < b)`, 比较运算支持 '< <= == >= >'， 适用于整数和字符串
字符串匹配： `(a =~ *.c)`, 不匹配 `!~`
逻辑运算： `&& || !` (与或非)
文件测试： `( -f/e/d file )`

### if 语法
```csh
if (expr) command  # one line statement
if (a < b) then    # multi line statement
  command
endif
if { command } then ... endif
```
| 常用 if 条件 | 表达式 |
| --- | --- |
| 数组检查 | `if ($#arr < 3)` |
| 文件检查 | `if ( -f/e/d $file )` or `if { -f/e/d $file }`(test command) |

### foreach 语法
```csh
foreach item (list)
    if (expr) break
    if (expr) continue
end
```
### while 语法
```csh
while (expr)
  if (expr) break # or continue
end
```
### Switch 语法
```csh
switch (var)
  case 1:   # case "str", *.c
    # commands
    breaksw
  default:
    breaksw
endsw
```
### Alias 语法
Csh没有提供函数，只能通过alias实现函数的功能
```csh
alias do_fun1 'echo \!:1 \!:2 \!:*'
```
alias 参数处理： 第一个参数 `!:1`，最后一个参数 `!$`， 所有参数 `!*`
字符串中的 ! 是特殊字符（执行历史命令）， 所以需要加上 \ 使用。

## 参数处理
bash 兼容： `$0 $1-9 $* ; shift`， 参数个数 `$#`
argv列表： `$argv[1-N]`, `shift argv`, 参数个数 `$#argv`

## 其他
-  Csh脚本默认会先source $HOME/.cshrc 再执行，`#!/bin/csh -f` -f 参数可以避免该问题
- 重定向： `cmd > out.log ; cmd >& out.log`
- 获取脚本位置：`readlink -f $0 | xargs dirname` 适用所有shell脚本 
