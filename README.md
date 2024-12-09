# ArcBlockTest
ArcBlockTest

## ENV
```
mac os 15+
xcode 16+
Cocoapods 1.16.2
```

## Build && Run
```
1. open: Terminal app
2. cd project root directory
3. run: pod install
4. open project root directory in Finder, double click project ArcBock.xcworkspace
5. click the button Run
```
## 目录结构
```
项目根目录/
├── ArcBock/
│   └── Assets.xcassets         // 图片资源
│   └── Common/                 // 公共代码
│       ├── Components/         // 组件目录
│       └── ArcConstant.swift 
├── Modules/                    // 页面模块目录
│   ├── xxModuleName/           // 具体的页面模块
│       ├── Model/              // model 数据
│       ├── ViewModel/          // viewModel 处理数据：网络请求、数据处理 等
│       └── xxPageSwiftUI.swift // SwiftUI 页面UI绘制、和viewModel的数据绑定
├── NetRequest/                 // 网络api请求处理
├── ArcBockTests/               // Unit test
└── Podfile                     // Cocoapod 三方依赖库管理
```
## 技术框架设计

```
采用MVVM架构进行设计：
  a. SwftUI布局
  b. 使用Combine 进行与swftui的响应式数据绑定
  c. model 进行数据解析映射
  d. 使用Alamofire进行网络请求，可直接将json数据解析映射到model
```