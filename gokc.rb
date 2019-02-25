class Gokc < Formula
  gokc_version = '0.4.1'
  homepage 'https://github.com/yuuki/gokc'
  version gokc_version

  url "https://github.com/yuuki/gokc/releases/download/v#{gokc_version}/gokc_darwin_amd64.zip"
  sha256 '682635d9a582367151024714f87b7c098638e7248b01d64b93c1a75b3a9228e5'

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
