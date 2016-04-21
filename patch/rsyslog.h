/*  musl patches for alpine */
#define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO)
#define GLOB_BRACE 0
#ifndef WAIT_ANY
#define WAIT_ANY (-1)
#endif
