## 翻译《Programing iOS9》- Autolayout篇（一）

> Autolayout各个名词的解释 <br >
> 来自：《Programing.iOS.9.2015.11》59-61页

### Autolayout
AutoLayout对于每一个单独的view层次上是一个可选的技术。一个view可以在以下三种方式下选择Autolayout。
- 你在代码中给一个view添加Autolayout约束。在这个约束下的view使用Autolayout。
- 你的app加载一个“Use Auto Layout”勾选的nib，每一个通过nib实例的view都使用了autolayout。
- 一个在interface下的view，而且它是你自定义的UIView的子类，在这个类方法`requiresConstraintBasedLayout`返回true，这个view也使用了Autolayout。

  你通过第三种方式选择Autolayout的原因可能是你想要将Autolayout转换，来在代码中使用Autolayout constraints，一个通常的在代码中创建contraints的方式是在一个view的updateContraints的实现里面。但是如果Autolayout没有Switched，updateContraints不会被调用。所以说`requiresConstraintBasedLayout`提供了一种Switching on的方式。

一个同胞view可以使用autolayout，但是另一个同胞view可以不使用，一个superview可以使用Autolayout，但是一些或者他所有的子view可以不使用。
但是Autolayout被应用到整个superview链，所以说如果一个view使用了Autolayout，
然后就自动应用到他的整个superviews，同时如果其中的view之一是控制器的main view的话，控制器
会收到自动布局相关的事件，否则的话就不会收到。

> 你不可以对一个view的一部分关闭Autolayout。或者所有的来自nib实例化的view
使用了Autolayout，或者他们都使用了autoresizing。为了生成不同部分的interface来自
不同的nibs，其中一部分使用了autoresizing，另一部分使用了Autolayout，并且把这些不同的
部分分开到不同的nib（或者不同的Storyboard），然后在runtime里加载，编译。

#### Contraints
Autolayout contraint， 或者说简单的contraint，是一个NSLayoutContraint实例，
它描述了一个view的绝对width和height，或者是一个view的属性和另一个view的属性关系。
在后一种情况下，这种属性并不一定是相同的属性，同时这两个view也不一定是同胞关系或者父和子的关系。
唯一的要求就是他们来自同一个祖先view。

这里有一些NSLayoutContraint主要的属性：
- `firstItem`, `firstAttribute`, `secondItem`, `secondAfttribute`
这两个view和他们各自的属性（NSLaoyoutContraint）都和这个contraint有联系。
如果这个contraint描述了一个view的height或者width，另一个view可能是nil，另一个属性可能是
`.NotAnAttribute`。其他的NSLayoutContraint有：
    - `.Top`, `.Bottom`
    - `.Left`, `.Right`, `.Leading`, `.Trailing`
    - `.Width`, `.Height`
    - `.CenterX`, `.CenterY`
    - `.FirstBaseline`, `LastBaseline`

    `.FirstBaseline`主要应用于多个label之间，而且底部距离label的顶部有一定的距离。
    `.LastBaseline`指的是顶部距离底部有一定的距离。

    其他的属性的含义是显而易见的，除了有可能想知道“leading”和“trailing”的含义，
    他们就相当于“left”“right”，而且他们会自动反向他们的含义是“right-to-left”。
    在新的iOS9上，全部的interface已经在系统上自动地反向了--但是这仅仅是当你使用了“leading”和“trailing”约束的时候。

-  `multiplier`, `constant`

  这两个属性会被应用到第二个属性值，然后他来决定第一个属性值。`multiplier`用来乘上第二个属性值，`constant`被添加到这个积数中。
第一属性被用来设置结果*The first attribute is set to the result.（这句话我也不懂是啥意思）*，（constant是一个非常有限的选择范围，因为这个值并不是一个常数。）
从根本上来讲，你写了一个等式：a1=m*a2+c,其中a1和a2就是两个属性值，m和c是multiplier和constant。最坏的情况是
当第一属性值等于第二属性值，其中multiplier等于1， constant等于0。如果你想要绝对的描述一个view的width和height，multiplier等于1，同时constant等于width或者height的值。

- `relation`

  一个NSLayoutContraint说明了这两个属性值和另外一个属性值之间的关系，就像被
  multiplier和constant所修改的那样。这就是在前一段中我在等号左右的操作。（`.Equal`）
  但是不平等（iindequality）也是允许的。（`.LessThanOrEqual`, `.GreaterThanOrEqual`）

- `priority`

  优先级值的范围是从1000到1，同时确定标准的行为有标准的优先级。约束可以有不同的优先级，来确定他们使用的顺序。

一个约束属于一个view，同时一个view也可以有很多的约束。一个UIView添加一个约束属性可以有一下几种实例方法：<br />
  `.addConstraint:`, `addConstraints:`  <br >
  `.removeConstraint:`, `removeConstraints:` <br >
存在的问题是约束属于哪一个view。答案是：最接近参与约束的两个视图层次结构的视图。
如果可能的话，那应该是这些view其中之一。举个例子来说，如果一个view讲述了一个view的width，
那它就属于这个view，如果它设置了这个view顶部的距离到他的父view顶部的距离的话，它就属于父view，
如果他校准了两个同胞view，那这个约束就属于他们共同的父view。<br >

从iOS8开始，除了给一个特定的view添加明确的约束，你可以触发约束使用`NSLayoutContraint`类方法`activateContraints:`
这个方法会取得所有约束的数组。被触发的约束也会被自动地添加到正确的view上。还有一个方法`deactivateContraints:`，他会移除该view所有的
约束。约束有一个活跃的属性，你可以设置它来触发或者是关闭一个单独的约束，同时再加上它可以告诉你
一个给定的约束是否为一个interface的一部分。<br >
> 说明：一旦你对一个view的position和size使用了明确的约束，随后不要设置他的frame（或者bounds和center）
只需要使用contraints就OK。否则的话，当`layoutSubviews`这个方法被调用的时候，这个视图会跳回到原来他约束规定位置。
（除非你在`layoutSubviews`里设置一个view的frame，我会在以后介绍。）

#### Autoresizing contraints
这个机制让其中选择了Autolayout的view可以在Autolayout层次上突然影响其他view，即使其他的view之前没有使用Autolayout。
所以说存在一种方式，当一个view在Autolayout上被影响的同时来通过constraints来保证它的position和layout在之前通过frame和autoresizingMask确定那样。
这种方式就是runtime，它将view的frame和autoresizingMask转换成约束。结果就是一些内在的来自`NSAutoresizingMasklayoutConstraint`的约束，影响这个view（当然他还可能和其他的view有联系）。
多亏了这个隐含的约束，被这个view的autoresizingMask描述的布局才可以继续工作。<br >

比如:加入我有一个UILabel，它的frame为(20.0, 20.0, 42.0, 22.0), 然后它的autoresingMask为.None。如果这个label突然*使用*了Autolayout，
然后它的superview可能需要四个隐含的约束也就是设置它的width为42， height为22，它的centerX为41，它的centerY为31。<br >

这个结果仅仅在这个view的`translatesAutoresizingMaskIntoConstraints`属性设置为true的时候。
如果这个view已经用代码实现了或者是一个nib的实例化当然nib的“Use Auto Layout”没有被勾选的话，上面就是默认的。
上面的假设的条件是一个view使用其他的方式创建，如果他被涉及到Autolayout你想要它的frame和autoresizingMask像constraints一样。

这是个合理的规则，但是也意味着如果你打算给你的view应用明确的约束，你可能需要记住通过设置view的translatesAutoresizingMaskIntoConstraints为false来关闭自动的行为。
如果你没有这样做，结果就是你的view中将包含隐含的约束和明确的约束，这不可能是你想要的。
按照传统来讲，这种情况往往会导致约束之间的冲突，（我会在下面解释的）。实际上，我们经常会发生不记得去设置view的translatesAutoresizingMaskIntoConstraints属性为false，
通常也是在我们得到一个约束之间冲突的时候被提醒到的。

> 下一篇：Create contraints in code
