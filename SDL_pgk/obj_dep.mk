# <sdlOwner name='David Russak' email='david.russak@sdl.usu.edu' />
C_OBJS := $(C_SRC:.c=.o)
CPP_OBJS := $(CPP_SRC:.cpp=.o)
C_DEPENDS := $(C_SRC:.c=.d)
CPP_DEPENDS := $(CPP_SRC:.cpp=.dpp)

# Test source, object and dependancy files.
C_TST_OBJS := $(C_TST_SRC:.c=.o)
CPP_TST_OBJS := $(CPP_TST_SRC:.cpp=.o)
C_TST_DEPENDS := $(C_TST_SRC:.c=.d)
CPP_TST_DEPENDS := $(CPP_TST_SRC:.cpp=.dpp)
