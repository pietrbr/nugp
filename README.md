# nugp

A small Python utility for fetching a GlobalProtect prelogin cookie from  
[Northeastern University's VPN](https://vpn.northeastern.edu) using a GTK4 + WebKit webview.

## Installation

Install the script to your local bin directory:

```bash
install -m 755 nugp ~/.local/bin/
```

Make sure `~/.local/bin` is in your PATH.

## Usage

```bash
nugp
```

This will open a small login window. Once you complete the SSO flow, the script
will print the prelogin cookie to stdout.

You can then pass it to openconnect or other tools:

```bash
nugp | sudo openconnect --protocol=gp --usergroup=portal:prelogin-cookie \
  -u=YOUR_USERNAME vpn.northeastern.edu
```

## Dependencies

- Python 3.x
- GTK 4
- WebKitGTK 6.0
- GObject Introspection bindings for Python (`python-gobject`)

## How It Works

The script performs the following steps:

1. Makes a prelogin request to Northeastern University's GlobalProtect VPN endpoint
2. Extracts the SAML authentication URL from the response
3. Opens a GTK4 webview window for SSO authentication
4. Captures the authentication callback containing the prelogin cookie
5. Outputs the cookie to stdout for use with OpenConnect

## Autofill

The script can also autofill your email and password.
To specify your email you can provide it as follows `nugp -u squarepants.s@northeastern.edu`
The password can be provided the same way `nugp -p supersecretpassword`
But to avoid just typing it in you can provide it over stdin from a password manager or something.

Here is an example for what that might look like for Patrick Star if he uses the pass password store
```Bash
pass show northeastern | nugp -u star.p@northeastern.edu | sudo openconnect --protocol=gp --usergroup=portal:prelogin-cookie --passwd-on-stdin vpn.northeastern.edu -u "star.p" --interface nutun
```
If you do not provide the flag `-p` but pipe things into `nugp` then it assumes the input is a password and autofills it anyway
Otherwise if you do not provide flags then you will have to log in manually

## License

MIT License - see [LICENSE](LICENSE) for details.
