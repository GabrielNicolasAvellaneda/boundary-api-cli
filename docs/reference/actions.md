## Actions

Commands to administer actions in a Boundary account.

### action-installed

**API Documentation**

[http://premium-documentation.boundary.com/v1/get/actions/installed](http://premium-documentation.boundary.com/v1/get/actions/installed)

**Usage**

```
usage: action-installed [-h] [-l {debug,info,warning,error,critical}]
                        [-a api_host] [-e e_mail] [-t api_token]

Returns the actions configured within a Boundary account

optional arguments:
  -h, --help            show this help message and exit
  -l {debug,info,warning,error,critical}, --log-level {debug,info,warning,error,critical}
                        Sets logging level to one of
                        debug,info,warning,error,critical.Default is logging
                        is disabled
  -a api_host, --api-host api_host
                        Boundary API host endpoint
  -e e_mail, --email e_mail
                        e-mail that has access to the Boundary account
  -t api_token, --api-token api_token
                        API token for given e-mail that has access to the
                        Boundary account
```

**Examples**

```bash
$ action-installed
{
  "result": [
    {
      "name": "boundary-enterprise",
  ...
```


### action-types

**API Documentation**

[http://premium-documentation.boundary.com/v1/get/actions](http://premium-documentation.boundary.com/v1/get/actions)

**Usage**

```
usage: action-types [-h] [-l {debug,info,warning,error,critical}]
                    [-a api_host] [-e e_mail] [-t api_token]

List action types associated with the Boundary account

optional arguments:
  -h, --help            show this help message and exit
  -l {debug,info,warning,error,critical}, --log-level {debug,info,warning,error,critical}
                        Sets logging level to one of
                        debug,info,warning,error,critical.Default is logging
                        is disabled
  -a api_host, --api-host api_host
                        Boundary API host endpoint
  -e e_mail, --email e_mail
                        e-mail that has access to the Boundary account
  -t api_token, --api-token api_token
                        API token for given e-mail that has access to the
                        Boundary account
```

**Examples**

```bash
$ action-types
{
  "result": [
    {
      "name": "boundary-enterprise",
    ...
```

