class Gokc < Formula
  gokc_version = '0.2.0'
  homepage 'https://github.com/yuuki1/gokc'
  version gokc_version

  if Hardware.is_64_bit?
    url "https://github.com/yuuki1/gokc/releases/download/v#{gokc_version}/gokc_darwin_amd64.zip"
    sha256 'cce10f5b8e4073bad423688a0d46871e1e4816d44be54329be444378b8f0f4ba'
  else
    url "https://github.com/yuuki1/gokc/releases/download/v#{gokc_version}/gokc_darwin_386.zip"
    sha256 '92bab62a5dcac6dde40df08fb8e652e252c93c82f9cdb6fef26f0f5f622390e6'
  end

  head do
    url 'https://github.com/yuuki1/gokc.git'
    depends_on 'go' => :build
    depends_on 'git' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath/'.go'
      mkdir_p buildpath/'.go/src/github.com/yuuki1'
      ln_s buildpath, buildpath/'.go/src/github.com/yuuki1/gokc'
      system 'make', 'build'
    end
    bin.install 'gokc'
  end

  test do
    system 'gokc', '-v'
  end
end
