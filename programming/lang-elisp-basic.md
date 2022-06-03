# Elisp基本语法

> Lisp 是一个对解释器友好，对程序员不友好的语言，几乎和Ruby相反，如果可能，不要学习。不过也正因为如此，lisp能给你一个新的编程视角。
> 我是出于对Emacs更高可定制需求而学习的。 Lisp解释机制和Tcl/Tk很像。

## 变量
`(set 'var 123)` `(setq var 123)` 都可以设置变量，而且是全局变量
`(defvar  var 123 "XXX")`  能更好的定义全局变量，带文档说明，并不会覆盖之前的值
`(let VARLIST BODY...)` 声明局部变量，并带着局部变量对应的代码块BODY（顺序执行的一组表达式）。VARLIST 可以是变量名列表，或者变量名和值成一对，如`(VarName (VarName Value) VarName...)`

## 基本语法
`(progn BODY ...)` 用来执行连续的多个表达式。（没错，Lisp需要特殊命令来执行多条语句）
`(let VARLIST BODY...)` 局部变量代码块，同上。
`(if COND THEN ELSE...)` THEN是条件成立执行的列表，ELSE可以有多个列表。
`(while TEST BODY...)` 没有break/continue，需要借助catch/throw 实现，如
```lisp
(setq x 0 total 0)
(catch 'break
  (while t
    (incf total x)
    (if (> (incf x) 10)
        (throw 'break total))))
```

### 参考

 * [ELisp 简明教程](http://smacs.github.io/elisp/)
 * [ELisp 简明教程:基础知识](http://smacs.github.io/elisp/02-elisp-basic.html)
