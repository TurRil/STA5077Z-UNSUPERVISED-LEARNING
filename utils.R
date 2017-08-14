#suppressMessages(library(cluster))
#suppressMessages(library(MASS))
#suppressMessages(library(smacof))


suppressMessages(library(kohonen))
suppressMessages(library(tidyverse))
suppressMessages(library(formattable))
suppressMessages(library(ggbiplot))

clear <- function(){  
  rm(list = ls())
}

inline_hook <- function(x) {
  if (is.numeric(x)) {
    format(x, digits = 5)
  } else x
}


part1.CreateDataSet <- function() {

  # Leukemia dataset
  ld.data <- read.csv(file = "data/leukemia_array.txt", sep = "\t")
  
  # Transposed dataset
  ld.tdata <- t(ld.data)
  ld.tstd <- scale(ld.tdata)
  
  # save as .RData
  save(ld.data, ld.tdata, ld.tstd, file="data/part1.RData")
  
  part1.LoadDataSet()
}

part1.LoadDataSet <- function() {

  if (file.exists("data/part1.RData")) {
    load("data/part1.RData", envir = .GlobalEnv)
    
    ld.data <- as.tibble(ld.data)
    ld.tdata <- as.tibble(ld.tdata)
    ld.tstd <- as.tibble(ld.tstd)
  }
}

part1.LoadDataSet()

# ld.data <- as.tibble(ld.data)
# ld.tdata <- as.tibble(ld.tdata)