% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/actions.R
\name{rscript_byod}
\alias{rscript_byod}
\title{Create \href{https://github.com/maxheld83/ghactions/tree/master/Rscript-byod}{Rscript-byod action} to run arbitrary R expressions}
\usage{
rscript_byod(IDENTIFIER, needs, options = c("--verbose", "--echo"),
  expr = NULL, file = NULL, args = NULL)
}
\arguments{
\item{IDENTIFIER}{\code{[character(1)]}
giving the name of the action or workflow block.

Used:
\itemize{
\item as an informative label on GitHub.com,
\item in the \code{needs} fields of other \emph{action blocks} to model the workflow graph,
\item in the \code{resolves} fields of other \emph{workflow blocks} to model the workflow graph.
}}

\item{needs}{\code{[character()]}
giving the actions (by their \code{IDENTIFIER}s) that must complete successfully before this action will be invoked.
Defaults to \code{NULL} for no upstream dependencies.}

\item{options}{a list of options, all beginning with \samp{--}.  These
    can be any of the options of the standard \R front-end, and also those
    described in the details.}

\item{expr}{any syntactically valid R expression.}

\item{file}{the name of a file containing \R commands.  \samp{-}
    indicates \file{stdin}.}

\item{args}{arguments to be passed to the script in \code{file}.}

\item{...}{arguments passed on to other methods, not currently used.}
}
\description{
Thin wrapper around GitHub actions.
}
\details{
\code{expr} here accepts R expressions (say, \code{1+1}) for your convenience, \emph{not} quoted expressions (say, \code{"1+1"}) as in the original \link{Rscript}.
\code{expr} is best used for very few lines; if you have more code, consider placing it in a separate R script for \code{file}.

\code{args} differs from the generic \code{args} in other GitHub actions:
It only gets appended to the \code{Rscript} call when a \code{file} is provided.

You can only provide \code{expr} \emph{or} \code{file}.

These functions are for \strong{advanced users} knowledgeable about GitHub actions.
Novice users may be better served by the complete templates in workflows.

These functions provide very thin wrappers around existing GitHub actions, including actions from other repositories.
Essentially, they just create lists ready to be ingested by \code{\link[=make_action_block]{make_action_block()}}, which then turns these R lists into valid GitHub actions syntax blocks.

For documentation on these actions, consult their respective \code{README.md}s linked in the below.
Some variants of these action wrappers include sensible defaults for frequent uses in R.

The \code{uses} field is \emph{always} hardcoded to a particular commit or tag of the underlying github action to ensure compatibility.

To render an action block completely from scratch, you can always use the templating function \code{\link[=make_action_block]{make_action_block()}}.
}
\section{Docker}{

This action \strong{requires a Docker image called \emph{literally} \code{repo:latest} in \code{github/workspace}.}
See \href{https://www.maxheld.de/ghactions/articles/ghactions.html}{vignette} for details.
Use \code{\link[=build_image]{build_image()}} to create one in a prior action.

This action or workflow requires that you \emph{bring-your-own-dockerfile} (byod).
There has to be a \code{Dockerfile} at the root of your repository.
It's easy to set one up using \code{\link[=use_dockerfile]{use_dockerfile()}}.
To learn more, consider the \href{https://www.maxheld.de/ghactions/articles/ghactions.html}{vignette}.
}

\seealso{
Other actions: \code{\link{docker_cli}},
  \code{\link{document}}, \code{\link{filter}},
  \code{\link{firebase}}, \code{\link{ghpages}},
  \code{\link{install_deps}}, \code{\link{netlify}},
  \code{\link{rsync}}

Other byod: \code{\link{website}}
}
\concept{actions}
\concept{byod}
