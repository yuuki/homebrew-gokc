class Gokc < Formula
  gokc_version = '0.4.1'
  homepage 'https://github.com/yuuki/gokc'
  version gokc_version

  url "https://github.com/yuuki/gokc/releases/download/v#{gokc_version}/gokc_darwin_amd64.zip"
  sha256 'a1e6217bdd0a07ff8ae2c06e00fccd6b0e9078fb6fa1c369aae5c753c5cda276'

  head do
    url 'https://github.com/yuuki/gokc.git'
    depends_on 'go' => :build
    depends_on 'git' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath/'.go'
      mkdir_p buildpath/'.go/src/github.com/yuuki'
      ln_s buildpath, buildpath/'.go/src/github.com/yuuki/gokc'
      system 'make', 'build'
    end
    bin.install 'gokc'
  end

  test do
    system 'gokc', '-v'
  end
end
