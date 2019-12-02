#' @import purrr
#' @importFrom magrittr %>%
#' @include utils.R
instruction_of <- function(opcode) {
  name <- opcode_name_of(opcode)
  if (!is.null(name)) instruction_set[[name]]
}

instruction <- function(name, opcode, arity) {
  structure(list(name = name, opcode = opcode, arity = arity), class = "instruction")
}

instruction_set <- list(instruction("ldc", 18, 1),
                        instruction("getstatic", 178, 2))

instruction_set_name <- instruction_set %>%
  map_chr(~ .$name)

names(instruction_set) <- instruction_set_name

opcodes <- instruction_set %>%
  map_dbl(~ .$opcode)
names(opcodes) <- instruction_set_name

opcode_name_of <- name_lookup(opcodes)