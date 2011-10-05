C*GREXEC -- PGPLOT device handler dispatch routine
C+
      SUBROUTINE GREXEC(IDEV,IFUNC,RBUF,NBUF,CHR,LCHR)
      INTEGER IDEV, IFUNC, NBUF, LCHR
      REAL    RBUF(*)
      CHARACTER*(*) CHR
C---
      INTEGER NDEV
      PARAMETER (NDEV=10)
      CHARACTER*10 MSG
C---
      GOTO(1,2,3,4,5,6,7,8,9,10) IDEV
      IF (IDEV.EQ.0) THEN
          RBUF(1) = NDEV
          NBUF = 1
      ELSE
          WRITE (MSG,'(I10)') IDEV
          CALL GRWARN('Unknown device code in GREXEC: '//MSG)
      END IF
      RETURN
C---
1     CALL CGDRIV(IFUNC,RBUF,NBUF,CHR,LCHR,1)
      RETURN
2     CALL CGDRIV(IFUNC,RBUF,NBUF,CHR,LCHR,2)
      RETURN
3     CALL NUDRIV(IFUNC,RBUF,NBUF,CHR,LCHR)
      RETURN
4     CALL PGDRIV(IFUNC,RBUF,NBUF,CHR,LCHR)
      RETURN
5     CALL PSDRIV(IFUNC,RBUF,NBUF,CHR,LCHR,1)
      RETURN
6     CALL PSDRIV(IFUNC,RBUF,NBUF,CHR,LCHR,2)
      RETURN
7     CALL PSDRIV(IFUNC,RBUF,NBUF,CHR,LCHR,3)
      RETURN
8     CALL PSDRIV(IFUNC,RBUF,NBUF,CHR,LCHR,4)
      RETURN
9     CALL XWDRIV(IFUNC,RBUF,NBUF,CHR,LCHR,1)
      RETURN
10    CALL XWDRIV(IFUNC,RBUF,NBUF,CHR,LCHR,2)
      RETURN
C
      END
