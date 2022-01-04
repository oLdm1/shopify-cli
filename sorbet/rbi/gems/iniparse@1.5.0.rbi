# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `iniparse` gem.
# Please instead update this file by running `bin/tapioca gem iniparse`.

module IniParse
  private

  def gen(&blk); end
  def open(path); end
  def parse(source); end

  class << self
    def gen(&blk); end
    def open(path); end
    def parse(source); end
  end
end

class IniParse::Document
  include ::Enumerable

  def initialize(path = T.unsafe(nil)); end

  def [](key); end
  def delete(*args); end
  def each(*args, &blk); end
  def has_section?(key); end
  def inspect; end
  def lines; end
  def path; end
  def path=(_arg0); end
  def save(path = T.unsafe(nil)); end
  def section(key); end
  def to_h; end
  def to_hash; end
  def to_ini; end
  def to_s; end
end

class IniParse::Generator
  def initialize(opts = T.unsafe(nil)); end

  def blank; end
  def comment(comment, opts = T.unsafe(nil)); end
  def context; end
  def document; end
  def gen; end
  def method_missing(name, *args, &blk); end
  def option(key, value, opts = T.unsafe(nil)); end
  def section(name, opts = T.unsafe(nil)); end
  def with_options(opts = T.unsafe(nil)); end

  private

  def line_options(given_opts); end

  class << self
    def gen(opts = T.unsafe(nil), &blk); end
  end
end

class IniParse::IniParseError < ::StandardError; end

module IniParse::LineCollection
  include ::Enumerable

  def initialize; end

  def <<(line); end
  def [](key); end
  def []=(key, value); end
  def delete(key); end
  def each(include_blank = T.unsafe(nil)); end
  def has_key?(*args); end
  def keys; end
  def push(line); end
  def to_a; end
  def to_h; end
  def to_hash; end
end

class IniParse::LineNotAllowed < ::IniParse::IniParseError; end
module IniParse::Lines; end

class IniParse::Lines::AnonymousSection < ::IniParse::Lines::Section
  def initialize; end

  def to_ini; end

  private

  def line_contents; end
end

class IniParse::Lines::Blank
  include ::IniParse::Lines::Line

  def blank?; end

  class << self
    def parse(line, opts); end
  end
end

class IniParse::Lines::Comment < ::IniParse::Lines::Blank
  def comment; end
  def has_comment?; end
end

module IniParse::Lines::Line
  def initialize(opts = T.unsafe(nil)); end

  def blank?; end
  def comment; end
  def has_comment?; end
  def line_contents; end
  def options; end
  def to_ini; end
end

class IniParse::Lines::Option
  include ::IniParse::Lines::Line

  def initialize(key, value, opts = T.unsafe(nil)); end

  def key; end
  def key=(_arg0); end
  def value; end
  def value=(_arg0); end

  private

  def line_contents; end

  class << self
    def parse(line, opts); end
    def typecast(value); end
  end
end

class IniParse::Lines::Section
  include ::IniParse::Lines::Line
  include ::Enumerable

  def initialize(key, opts = T.unsafe(nil)); end

  def [](key); end
  def []=(key, value); end
  def delete(*args); end
  def each(*args, &blk); end
  def has_option?(key); end
  def key; end
  def key=(_arg0); end
  def lines; end
  def merge!(other); end
  def option(key); end
  def to_ini; end

  private

  def line_contents; end

  class << self
    def parse(line, opts); end
  end
end

class IniParse::NoSectionError < ::IniParse::ParseError; end

class IniParse::OptionCollection
  include ::Enumerable
  include ::IniParse::LineCollection

  def <<(line); end
  def each(*args); end
  def keys; end
end

class IniParse::ParseError < ::IniParse::IniParseError; end

class IniParse::Parser
  def initialize(source); end

  def parse; end

  class << self
    def parse_line(line); end
    def parse_types; end
    def parse_types=(types); end

    private

    def strip_comment(line, opts); end
    def strip_indent(line, opts); end
  end
end

class IniParse::SectionCollection
  include ::Enumerable
  include ::IniParse::LineCollection

  def <<(line); end
end

IniParse::VERSION = T.let(T.unsafe(nil), String)