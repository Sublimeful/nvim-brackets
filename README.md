Some auto pair plugins do this annoying thing

==============================

| = cursor

if(condition) {|}

**ENTER KEY IS PRESSED**

if(condition) {
|}

==============================

Personally, I don't really like that.
My plugin serves to prevent that by checking both the left and right
characters to see if the cursor is between valid pairs, and properly
indenting the brackets if they are.

==============================

| = cursor

if(condition) {|}

**ENTER KEY IS PRESSED**

if(condition) {
    |
}

==============================
