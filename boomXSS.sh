#!/bin/bash

# boomXSS - Payload Encoder

if [ $# -eq 0 ]; then

    echo "Usage: $0 --payload <payload>"
    exit 1
fi

payload="$2"

echo "boomXSS - payload encoder v0.01 - @doesnotcompute\n"


echo "Original Payload: $payload"
echo "\nEncoded Payloads:"

# Single Encodings
echo "html entity encoded: $(echo -n "$payload" | perl -MHTML::Entities -ne 'print encode_entities($_)')"
echo "url encoded: $(echo -n "$payload" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')"
echo "unicode encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "unicode decimal encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge')"
echo "unicode hex encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge')"
echo "\n"

# Double Encodings
double_html_entity_encoded=$(echo -n "$payload" | perl -MHTML::Entities -ne 'print encode_entities($_)' | perl -MHTML::Entities -ne 'print encode_entities($_)')
double_url_encoded=$(echo -n "$payload" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g' | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')
double_unicode_encoded=$(echo -n "$payload" | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')
double_unicode_decimal_encoded=$(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge' | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge')
double_unicode_hex_encoded=$(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge' | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge')

echo "\ndouble html entity encoded: $double_html_entity_encoded"
echo "double url encoded: $double_url_encoded"
echo "double unicode encoded: $double_unicode_encoded"
echo "double unicode decimal encoded: $double_unicode_decimal_encoded"
echo "double unicode hex encoded: $double_unicode_hex_encoded"

# Combined Encodings
echo "\nhtml encoded, then url encoded: $(echo -n "$payload" | perl -MHTML::Entities -ne 'print encode_entities($_)' | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')"
echo "html encoded, then unicode encoded: $(echo -n "$payload" | perl -MHTML::Entities -ne 'print encode_entities($_)' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "html encoded, then unicode decimal encoded: $(echo -n "$payload" | perl -MHTML::Entities -ne 'print encode_entities($_)' | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge')"
echo "html encoded, then unicode hex encoded: $(echo -n "$payload" | perl -MHTML::Entities -ne 'print encode_entities($_)' | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge')"
echo "\n"

# URL encodings combined with other encodings
echo "\nurl encoded, then html entity encoded: $(echo -n "$payload" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g' | perl -MHTML::Entities -ne 'print encode_entities($_)')"
echo "\nurl encoded, then unicode encoded: $(echo -n "$payload" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "url encoded, then unicode decimal encoded: $(echo -n "$payload" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g' | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge')"
echo "url encoded, then unicode hex encoded: $(echo -n "$payload" | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g' | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge')"
echo "\n"

# Unicode encodings combined with other encodings
echo "\nunicode encoded, then html entity encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge' | perl -MHTML::Entities -ne 'print encode_entities($_)')"
echo "unicode encoded, then url encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge' | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')"
echo "unicode encoded, then unicode decimal encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "unicode encoded, then unicode hex encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "\n"

# Unicode Decimal encodings combined with other encodings
echo "\nunicode decimal encoded, then html entity encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge' | perl -MHTML::Entities -ne 'print encode_entities($_)')"
echo "unicode decimal encoded, then url encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge' | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')"
echo "unicode decimal encoded, then unicode encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "unicode decimal encoded, then unicode hex encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "\n"

# Unicode Hex encodings combined with other encodings
echo "\nunicode hex encoded, then html entity encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge' | perl -MHTML::Entities -ne 'print encode_entities($_)')"
echo "unicode hex encoded, then url encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge' | xxd -plain | tr -d '\n' | sed 's/\(..\)/%\1/g')"
echo "unicode hex encoded, then unicode encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#x%x;", ord($1))/ge' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "unicode hex encoded, then unicode decimal encoded: $(echo -n "$payload" | perl -pe 's/(.)/sprintf("&#%d;", ord($1))/ge' | perl -pe 's/(.)/sprintf("\\u%04x", ord($1))/ge')"
echo "\n"

