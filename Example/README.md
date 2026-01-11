# FavIcon Example

这个示例项目展示了如何使用 FavIcon 库。

## 设置步骤

1. 确保已安装 CocoaPods：
   ```bash
   sudo gem install cocoapods
   ```

2. 在 Example 目录中运行：
   ```bash
   cd Example
   pod install
   ```

3. 打开生成的 `Example.xcworkspace` 文件（不是 .xcodeproj）：
   ```bash
   open Example.xcworkspace
   ```

4. 在 Xcode 中构建并运行项目

## 注意事项

- 必须使用 `.xcworkspace` 文件而不是 `.xcodeproj` 文件
- 确保使用的是 Xcode 16 兼容的配置
- 如果遇到模块找不到的错误，请清理项目并重新构建