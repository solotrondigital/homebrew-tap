class Mantra < Formula
  desc "Mantra programming language toolchain — Compiler, MDK, LSP, and Runtime"
  homepage "https://solotrondigital.github.io/mantra_website"
  version "0.8.0"
  license "MIT OR GPL-3.0"

  on_macos do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.8.0/Mantra-0.8.0-macOS.dmg"
    sha256 "677111ed0284536fb2bf2ba980e8e2b6f0995ef8f0d2c184ea0bede7ebd865b3"
  end

  on_linux do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.8.0/mantra-0.8.0-linux.tar.gz"
    sha256 "e6c09499a0143c6872c7485e0820503b97a18e372802cd1a212647ee1e2d8007"
  end

  depends_on "llvm" => :recommended

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"] if File.directory?("lib")
    include.install Dir["include/*"] if File.directory?("include")
    share.install Dir["share/*"] if File.directory?("share")
  end

  test do
    system bin/"mantra", "--version"
    system bin/"mantrac", "--help"
  end
end
