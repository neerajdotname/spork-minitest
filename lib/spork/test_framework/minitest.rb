class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  HELPER_FILE = File.join(Dir.pwd, "spec/spec_helper.rb")

  def run_tests(argv, stderr, stdout)
    $LOAD_PATH << "spec" << "."
    ::MiniTest::Unit.output = stdout

    paths, opts = parse_options(argv)

    paths.each do |path|
      load path
    end

    ::MiniTest::Unit.new.run(opts)
  end

  def parse_options(argv)
    paths, opts = argv.slice_before("--").to_a
    paths ||= []
    opts ||= []
    opts.shift
    [paths, opts]
  end
end
