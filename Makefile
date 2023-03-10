#############################################################################
# FILENAME:     Makefile
#
# PURPOSE:      Makefile for GQ GMC driver and sample program.
#
# AUTHOR:       Phil Gillaspy
#
# UPDATE:       05-10-2012
#
#############################################################################

include Defines.mk

LIBRARIES    = $(LIBS)/libGQGMC.a
PROGRAMS     = $(BIN)/gqgmc 

include Targets.mk

gq_source = gqgmc.cc

# replace .cc with .o (object)
gq_object = $(gq_source:%.cc=$(OBJ)/%.o)


$(BASE)/libs/libGQGMC.a .LIBRARY : $(gq_object)
        ar ruv $@ $?
        ranlib $@

# generate MOC file

$(BIN)/gqgmc:  $(OBJ)/main.o $(LIBRARIES)
        $(LDCPP) $(LDFLAGS) -o $@ $(OBJ)/main.o $(LIBS_LNK)


all: xmoc xobj libs bin

###############################################################################
# File dependencies:

include Patterns.mk

# Generate Makefile dependencies:
dep:
        makedep -I$(INC)

# Make dependencies: (Do not modify this line--makedep depends on it!)
#       CAVEAT: The following dependencies were generated by the "makedep"
#       program.  Any changes made beyond this point may be lost.
#       Last "makedep" performed Jun 06, 1997 by gillaspy@Sirius.

$(OBJ)/main.o: ./gqgmc.hh
$(OBJ)/gqgmc.o:  ./gqgmc.cc ./gqgmc.hh


###############################################################################