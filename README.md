A simple script that encodes a payload in various encodings. Then it double encodes the payload, and mixes different types of encodings. 

Example usage:

$ sh ./boomXSS.sh -payload "<script>alert`1`</script>"


You may need to backslash encode some special characters, to avoid your string being terminated unenxpectedly, e.g:

$ sh ./boomXSS.sh --payload "\"<script>alert`1`</script>"
