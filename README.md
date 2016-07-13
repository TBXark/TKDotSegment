# TKDotSegment
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/TBXark/TKDotSegment/master/LICENSE)
[![CocoaPods](http://img.shields.io/cocoapods/v/TKDotSegment.svg?style=flat)](http://cocoapods.org/?q= TKDotSegment)
[![CocoaPods](http://img.shields.io/cocoapods/p/TKDotSegment.svg?style=flat)](http://cocoapods.org/?q= TKDotSegment)
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)

---

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


## License

The MIT License (MIT)

Copyright (c) 2015 TBXark

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


