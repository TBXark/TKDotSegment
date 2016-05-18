## TKDotSegment

TKDotSegment is a segment with dot animation

TKDotSegment 是一个带有圆点动画的 segment, 之前有写过这个效果但是没有封装, 今天刚好顺手封装一下.两百多行代码, 初学者可以拿来当封装控件的参考.可以自定义圆点数量,颜色,和形状.

![image](https://raw.githubusercontent.com/TBXark/TKDotSegment/master/demo.gif)

|变量名|描述|Description|
|---|---|---|
|titles|选项标题|segment title|
|numOfDot|圆点数目| dot count|
|dotDiameter|圆点直径|dot diameter|
|dotSpace|圆点间距(负数则自动计算)|dot space(automatic calculation when value is a positive number)|
|dotColor|圆点颜色|dot color|
|selectTitleColor|标题被选中时的颜色|The color of the title is selected|
|unSelectTitleColor|标题未被选中时的颜色|The color of the title is not selected|
|titleFont|标题字体|The  font of the title |
|PLDot|圆点(可重写drawRect来自定义形状)|Override drawRect to customize shape|


---
1 . 改变 Index (change index)

```
    func changeSelectedIndex(index: Int, animate: Bool = true) 
```

2 . 接受 Index 变化事件 (index value change event)

```
TKDotSegmentAction = (index: Int,  internaliFlag: Bool) -> Void

```

`index` 被选择的 index (selected index)

`internaliFlag` 是否内部点击触发的标志位 (event by click flag)

3 . 自定义圆点形状(Custom dot shape)

重写`PLDot` 的 `drawRect` 方法就可以了

Overwrite the ` drawRect`  of ` PLDot ` 



## CooaPod

` pod 'TKDotSegment', '~> 1.0.0'`
