Delphi Endianness
===

Simple unit for Delphi to handle endianness conversions.
This unit use `jedi.inc` file from the [Jedi JCL](https://github.com/project-jedi/jcl) project.

It support all integer types and TBytes arrays. Doesn't support float numbers, but it can be easly added using `procedure Swap(const Value: PByte; const Length: Integer);`.

How to
---

Just copy `Endians.pas` and `jedi.inc` to your project and... that's it.
