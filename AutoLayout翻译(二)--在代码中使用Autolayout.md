> 前言：继上篇--翻译[《Programing iOS9》- Autolayout篇（一）](http://qiuncheng.com/2016/04/04/35-Autolayout-translate-01/)
> 上篇中只翻译了与Autolayout有关的词的含义。
> 这篇翻译“Create constraints in code”

### Create constraints in code
我们已经准备好了用代码来写约束。我会在这里通过`NSLayoutConstraint`初始化方法`init(item:attribute:relateBy:toItem:attribute:multiplier:constant)`开始，同时设置好每一个约束的属性值，下面我也会描述他们的含义。（除了priority，它的初始值是1000，但是可以在后来设 置如果需要的话）<br >
接下来我会生成相同的view、subviews、布局行为像**图1-12**和**图1-13**那样，但是在这里应用constraints。注意到我不会想之前创建那样给subviews v2和v3确定的frames，因为constraints会给他们布局，与此同时，我记得设置他们的`translatesAutoresizingMaskIntoConstraints`属性为false：
```javascript
// 代码在这里显示，不过现在工程文件里使用了之后再来这里
      let v1 = UIView(frame: CGRect(x: 100, y: 111, width: 132, height: 194))
       v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 1, alpha: 1)
       let v2 = UIView()
       v2.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0, alpha: 1)
       let v3 = UIView()
       v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
       view.addSubview(v1)
       v1.addSubview(v2)
       v1.addSubview(v3)
       v2.translatesAutoresizingMaskIntoConstraints = false
       v3.translatesAutoresizingMaskIntoConstraints = false
       v1.addConstraint(NSLayoutConstraint(item: v2,
           attribute: .Leading,
           relatedBy: .Equal,
           toItem: v1,
           attribute: .Leading,
           multiplier: 1,
           constant: 0))

       v1.addConstraint(NSLayoutConstraint(item: v2,
           attribute: .Trailing,
           relatedBy: .Equal,
           toItem: v1,
           attribute: .Trailing,
           multiplier: 1,
           constant: 0))

       v1.addConstraint(NSLayoutConstraint(item: v2,
           attribute: .Top,
           relatedBy: .Equal,
           toItem: v1,
           attribute: .Top,
           multiplier: 1,
           constant: 0))

       v2.addConstraint(NSLayoutConstraint(item: v2,
           attribute: .Height,
           relatedBy: .Equal,
           toItem: nil,
           attribute: .NotAnAttribute,
           multiplier: 1,
           constant: 10))

       v3.addConstraint(NSLayoutConstraint(item: v3,
           attribute: .Width,
           relatedBy: .Equal,
           toItem: nil,
           attribute: .NotAnAttribute,
           multiplier: 1,
           constant: 20))


       v3.addConstraint(NSLayoutConstraint(item: v3,
           attribute: .Height,
           relatedBy: .Equal,
           toItem: nil,
           attribute: .NotAnAttribute,
           multiplier: 1,
           constant: 20))

       v1.addConstraint(NSLayoutConstraint(item: v3,
           attribute: .Trailing,
           relatedBy: .Equal,
           toItem: v1,
           attribute: .Trailing,
           multiplier: 1,
           constant: 0))

       v1.addConstraint(NSLayoutConstraint(item: v3,
           attribute: .Bottom,
           relatedBy: .Equal,
           toItem: v1,
           attribute: .Bottom,
           multiplier: 1,
           constant: 0))
```
> 附件：
<center>![上面代码对应的结果，代码注释在github上](http://7xk67j.com1.z0.glb.clouddn.com/QQ20160406-2.png)</center>

现在，我知道你在想什么😂。你一定在想：“你在干嘛，你这个疯子？那可是一大堆（boat）代码！”（除非你可能想要使用其他的四个词语而不是“boat”）但是这里有一些假象，我一会儿会证明我们刚刚做的比之前我们使用确定的frames和autoresizing创建的这个界面**简单**很多。
> 译者注：直译的话真的很搞笑，但还是直译吧。😂

毕竟，我们很少使用8个简单的代码创建8个`contraints`。(我会已经把每一行代码分成了多行，但那仅仅是格式的问题。)他们是冗长的，但是他们都是一些简单的代码与不同的参数的重复，所以创建他们仅仅是**复制/粘贴**。此外，我们创建的八个`contraints`确定了两个子view的position、size和layout行为，所以我们获得了直接的一跃。

更能说明问题的是，那些contraints相比设置frame和autoresizing是一种对将要达到的效果更加清晰的表达。子view的position只被描述了一次，同时所有的字view都会随着superview的改变而改变。这段描述是意味声长的,我们不用使用任意数学，就像我们之前调用那样：
```
let v3 = UIView(frame:CGRectMake(v1.bounds.width - 20,
v1.bounds.height - 20, 20, 20))
```
这样做比较麻烦的是需要用superview的width和height减去该view的width和height才可以得到该view的position，这样做也是容易困惑和出错的。用了contraints之后，我们可以直接地说，constraints是清晰简单明了的，“v3宽为20points，高为20points，而且与v1的右下部齐平。”

初次之外，contraints可以做很多autoresizing不能做的事情。举个例子，除了给v2一个绝对的高度，我们还可以要求其高度为v1高度10分之一，而不管v1的size怎么变化。如果我们想做到那样而不用constraints的话，我们不得不继承layoutSubviews，在代码里手动完成。
>OVER
下一篇：Anchor notation<br >
上一篇：[Autolayout各个名词的解释](http://qiuncheng.com/2016/04/04/35-Autolayout-translate-01/)