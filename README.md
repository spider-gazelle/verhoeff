# verhoeff

An implementation of the [verhoeff algorithm](https://en.wikibooks.org/wiki/Algorithm_Implementation/Checksums/Verhoeff_Algorithm) for crystal lang

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     verhoeff:
       github: spider-gazelle/verhoeff
   ```

2. Run `shards install`

## Usage

```crystal
require "verhoeff"

puts Verhoeff.generate_checksum(1234)  # => 0
puts Verhoeff.validate(12340)          # => true

puts Verhoeff.generate_checksum("1234")  # => 0
puts Verhoeff.validate("12340")          # => true
```

## Contributors

- [Stephen von Takach](https://github.com/stakach) - creator and maintainer
