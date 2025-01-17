% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auto_commit.R
\name{auto_commit}
\alias{auto_commit}
\alias{check_clean_tree}
\title{Automatically commit changes}
\usage{
auto_commit(after_code = NULL, ...)

check_clean_tree(code = NULL, path = getwd(), before_code = NULL)
}
\arguments{
\item{after_code}{\code{[character(1)]} Giving what happens when the working tree is \emph{unclean after}  \code{code} is evaluated:
\itemize{
\item \code{NULL} to throw an error or
\item \code{"commit"} to commit the changes.
Defaults to \code{NULL}, which just thinly wraps \code{\link[=check_clean_tree]{check_clean_tree()}}.
}}

\item{...}{Arguments passed on to \code{check_clean_tree}
\describe{
  \item{code}{The code to execute.
Defaults to \code{NULL}.}
  \item{path}{The directory in which to execute the code.
Defaults to \code{\link[=getwd]{getwd()}}.}
  \item{before_code}{\code{[character(1)]} Giving what happens when the working tree is \emph{already unclean} before \code{code} is evaluated:
\itemize{
\item \code{NULL} (\emph{recommended} default), in which case if \code{is.act()}, then \code{"commit"}, otherwise throw an error.
\item \code{"stash"} to \code{git stash push} all changes before, and \code{git stash pop} them after \code{code} is run (\emph{not recommended}).
\item \code{"commit"} to \code{git add .; git commit -m "commit to cleanup"} all changes before \code{code}is run and \code{ git reset HEAD} them after \code{code} is run (\emph{not recommended}).
}}
}}

\item{code}{The code to execute.
Defaults to \code{NULL}.}

\item{path}{The directory in which to execute the code.
Defaults to \code{\link[=getwd]{getwd()}}.}

\item{before_code}{\code{[character(1)]} Giving what happens when the working tree is \emph{already unclean} before \code{code} is evaluated:
\itemize{
\item \code{NULL} (\emph{recommended} default), in which case if \code{is.act()}, then \code{"commit"}, otherwise throw an error.
\item \code{"stash"} to \code{git stash push} all changes before, and \code{git stash pop} them after \code{code} is run (\emph{not recommended}).
\item \code{"commit"} to \code{git add .; git commit -m "commit to cleanup"} all changes before \code{code}is run and \code{ git reset HEAD} them after \code{code} is run (\emph{not recommended}).
}}
}
\value{
\code{[list()]} of lists of git command feedback or \code{[NULL]} when there were no changes (invisible).

\code{[character(1)]} The \code{git status} results or \code{TRUE} if no diffs.
}
\description{
Automatically commit any changes made be development helper packages.

Check whether some code will cause changes to \code{git status} in the working directory.
}
\details{
This function will commit all changes caused by \code{code} to the repository.
Running this in CI/CD can save some time, but can also cause unexpected behavior and pollute the commit history with derivative changes.

The contents of \code{path} will be copied to a temporary directory, where a git repository will be initiated and the \code{code} will be executed.
There will never be any changes to \code{path}.
If \code{path} or its subdirectories contain a \code{.gitignore}, it will be respected.

This function is modelled \href{https://mllg.github.io/checkmate/articles/checkmate.html}{checkmate}.
}
\keyword{internal}
