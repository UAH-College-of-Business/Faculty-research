library(tidyverse)
library(openxlsx)

setwd("C:/Users/kaley/OneDrive/Documents/COB Analytics/Exhibit 8A and 8B (for Dr. Greene)")

# Read SCImago data
scimago <- read.csv2(
  "scimagojr 2025.csv",
  header = TRUE,
  stringsAsFactors = FALSE,
  check.names = FALSE
)

# Make duplicate names unique
names(scimago) <- make.unique(names(scimago))

# Create clean table
scimago_clean <- scimago %>%
  select(
    Rank,
    Title,
    Type,
    Issn,
    SJR,
    `SJR Best Quartile`,
    `H index`,
    `Total Docs. (2025)`,
    `Total Docs. (3years)`,
    `Total Refs.`,
    `Total Citations (3years)`,
    `Citable Docs. (3years)`,
    `Citations / Doc. (2years)`,
    `Ref. / Doc.`,
    `%Female`,
    Country,
    Coverage,
    Categories,
    Areas
  ) %>%
  rename(
    ISSN = Issn,
    Quartile = `SJR Best Quartile`,
    `H Index` = `H index`,
    `Total Docs (2025)` = `Total Docs. (2025)`,
    `Total Docs (3 Years)` = `Total Docs. (3years)`,
    `Total Refs` = `Total Refs.`,
    `Total Citations (3 Years)` = `Total Citations (3years)`,
    `Citable Docs (3 Years)` = `Citable Docs. (3years)`,
    `Citations / Doc (2 Years)` = `Citations / Doc. (2years)`,
    `Refs / Doc` = `Ref. / Doc.`,
    `% Female` = `%Female`
  )

# Export to Excel
write.xlsx(
  scimago_clean,
  "SCImago_2025_Clean.xlsx",
  overwrite = TRUE
)