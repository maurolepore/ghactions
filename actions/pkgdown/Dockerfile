ARG BASE_VERSION=latest
FROM maxheld83/ghactions:${BASE_VERSION}

LABEL "name"="pkgdown"
LABEL "version"="0.1.1.9000"
LABEL "maintainer"="Maximilian Held <info@maxheld.de>"
LABEL "repository"="http://github.com/r-lib/ghactions"
LABEL "homepage"="http://github.com/r-lib/ghactions"

LABEL "com.github.actions.name"="Create Documentation Website"
LABEL "com.github.actions.description"="Create website for rstats packages with pkgdown."
LABEL "com.github.actions.icon"="layout"
LABEL "com.github.actions.color"="blue"

COPY entrypoint.R /entrypoint.R
ENTRYPOINT ["/entrypoint.R"]
