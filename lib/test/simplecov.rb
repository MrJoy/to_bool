BASE_DIR = File.expand_path(File.join(__FILE__, '../../..'))
def expand_path(p)
  return File.expand_path(File.join(BASE_DIR, p))
end
TEST_PATHS=[
  expand_path("features"),
  expand_path("spec")
]
CODE_PATHS=[
  expand_path("lib"),
]

require 'simplecov'
SimpleCov.start do
  add_group "Test" do |src_file|
    TEST_PATHS.map { |p| src_file.filename.start_with?(p) }.select { |tf| tf }.count != 0
  end
  add_group "Code" do |src_file|
    (CODE_PATHS.map { |p| src_file.filename.start_with?(p) }.select { |tf| tf }.count != 0)
  end
end
