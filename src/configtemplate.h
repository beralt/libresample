/* Run configure to generate config.h automatically on any
   system supported by GNU autoconf.  For all other systems,
   use this file as a template to create config.h
*/

#ifdef LIBRESAMPLE_LIBRARY
#define HAVE_INTTYPES_H
#else
#cmakedefine HAVE_INTTYPES_H
#endif

