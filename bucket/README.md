# Bucket Lua/PHP

## Goal:
My goal with this project was to create a pastebin-like clone for ComputerCraft computers in Minecraft. Why?
Well, since sharing code on servers are quite common and pastebin has a cooldown after 25 `pastebin put` executions.  
Why not use X or Y insted? My reply to that would be, what's the fun in that? I could, user X or Y, but that's not fun.

## Requirements:
To host this your self you will need:
* A VPS (Or local machine with port 80/443 open)
* A Web Server running on that VPS
* MySQL (MariaDB works as well)
* PHP (fpm/cgi depending on your web server)

## How to set it up?
1. Create an MySQL account so that PHP can connect to it.
2. Import db.sql
3. Rename server.php to something that makes sense.
4. Change the credentials in server.php.
5. Change the settings in bucket.lua to match the ones in server.php
6. Save and you're done.

## How to use it?
It's more or less the same as the pastebin command.

Upload a file: `bucket put <file>`  
Download a file: `bucket get <file> <file-to-save-to>`

## Discalimer:
I am NOT responsible for any mistakes YOU make. Be careful and always make sure you're as secure as possible. This is PHP and MySQL after all ;)
