# DevOps assignment

Minimal environment with `keycloak` and a custom `python` app behind
`nginx`, in `docker`, orchestrated with `docker-compose`.

## Development

Start the environment: `docker-compose up -d`

Create a new user in the `keycloak` admin: http://localhost/keycloak/admin

**_Tip_**: add credentials for `keycloak` and `postgres` in a `.env` file.

### Endpoints

1. http://localhost/: "Hello world!" index page
1. http://localhost/login: redirects to `keycloak` auth
1. http://localhost/auth/callback: `keycloak` callback after login

### Known issues

1. The `python` app builds correctly but does not work in production mode
only in development mode.
1. The app's `login` is broken.
1. Connections to the `keycloak` endpoints fail with "502 Bad Gateway".
1. The `python` app's `Dockerfile` does not follow best practices.

### Notes

1. Any `git` commits should follow the
[conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
specifications.
1. `git` formatted patches are preferred.

### Fixed broken app 

1. Fixed `app.py` by mispelled route `loogin` to login 
2. Rewrite `dockerfile` to follow best practice 
3. Adding `gunicorn` to requirements.txt
4. Fixed `nginx.conf` to  match docker-compose.yml for `keycloak port 8080 instead of 8090 which produce error 502 Bad Gateway` .
5. I logged in app and created user . After I logged in with user created redirect to Logged in page
6. Created .env file for keycloak passwd and postgres passwd . 

## In order to run this in production we must set up a kubernetes cluster and write Helm charts for deploying to k8s cluster . Also we must use secret in kubernetes to avoid to put sensitive information in docker-compose file .  

