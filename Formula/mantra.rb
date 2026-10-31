# ==============================================================================
# Homebrew Formula for Mantra Programming Language Toolchain
# Tap: solotrontech/tap
# Formula: mantra.rb
#
# Usage:
#   brew tap solotrontech/tap
#   brew install solotrontech/tap/mantra
#   mantra --version
# ==============================================================================

class Mantra < Formula
  desc "Mantra programming language toolchain — Compiler, MDK, LSP, and Runtime"
  homepage "https://solotrondigital.github.io/mantra_website"
  version "0.7.0"
  license "MIT OR GPL-3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.7.0/Mantra-0.7.0-macOS.dmg"
      sha256 "88324ad94e52d5edca37824fc4e7a5ff2284e2059f8532e2f15de9614ac52e39"
    else
      url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.7.0/Mantra-0.7.0-macOS.dmg"
      sha256 "88324ad94e52d5edca37824fc4e7a5ff2284e2059f8532e2f15de9614ac52e39"
    end
  end

  on_linux do
    url "https://github.com/solotrondigital/mantra_programming_language/releases/download/v0.7.0/mantra-0.7.0-linux.tar.gz"
    sha256 "52015077f2525d5a2079479bd8ae16179806eca1e3ddac39c7f60d5608b693df"
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
