class UsdzsimplifyAT100 < Formula # 类名必须为 UsdzsimplifyAT100
  desc "A Swift-powered tool for simplifying USDZ models" # 工具描述
  homepage "https://github.com/cqj1558/USDZSimplifySPM" # 项目主页
  url "https://github.com/cqj1558/USDZSimplifySPM/archive/refs/tags/1.0.0.tar.gz" # 指向 v1.0.0 标签的源码压缩包
  sha256 "47c8f15b4400029d7df4f423b8b2b42a1ab2fb2696336791185e8e8660167e4f" # 此处需要替换为正确的SHA256值，详见下一步
  license "MIT" # 根据你的项目实际许可证修改

  depends_on "swift" => :build # 声明构建依赖为 Swift

  def install
    # 使用 swift build 命令编译项目
    system "swift", "build", "-c", "release", "--disable-sandbox", "--product", "usdzutil" # 确保 "--product" 后的名称与你的 Package.swift 中定义的可执行目标名称一致
    # 将编译好的二进制文件安装到 Homebrew 的 bin 目录
    # 假设生成的可执行文件名为 "usdzsimplify"，请根据实际情况修改
    bin.install ".build/release/usdzutil"
  end

  test do
    # 简单的测试，验证工具是否能运行并输出版本信息
    # 如果你的工具支持 `--version` 参数，可以这样测试
    assert_match "1.0.0", shell_output("#{bin}/usdzsimplify --version", 2)
  end
end

