      PROGRAM COMBINEQ  
C
C     For the time being, just set up a protocol where we set the names of the 
C     files so this will be hard coded 
C
      IMPLICIT NONE
C      include 'mpif.h' 
      CHARACTER(80) :: GRIDNAME,TITLE
      INTEGER :: NI,NJ,NK,NL,NQ,I,J,K,N,NJT,NKT,NLT,NGRID,MGRID,
     &           JS,JE,KS,KE,KSG  
      REAL(KIND=8), DIMENSION(:,:,:), ALLOCATABLE :: Q,QOUT
      REAL(KIND=8) :: REY,ALFA,INCON,OUTCON,AR,LBT,FTH
C 
C     
      NQ = 6
C 
      OPEN(1, FILE='REV', FORM='UNFORMATTED')
      READ(1) NJ,NK,NL
      ALLOCATE( QOUT(NJ,NK,NQ) ) 
      ALLOCATE( Q(NJ,NK,NL) ) 
C
      READ(1) Q        
C
      QOUT(:,:,1) = Q(:,:,2)
      CLOSE(1)
C
C       
      OPEN(2, FILE='RETC', FORM='UNFORMATTED')
      READ(2) NJT,NKT,NLT
      IF (NJT .ne. NJ .or. NKT .ne. NK .or.
     &    NLT .ne. NL) THEN 
         GOTO 100 
         WRITE(*,*) 'Dimension Mismatch (RETC)'
      END IF 
      READ(2) Q 
C 
      QOUT(:,:,2) = Q(:,:,2)
      CLOSE(2) 
C      
C
      OPEN(3, FILE='FONSET1', FORM='UNFORMATTED')
      READ(3) NJT,NKT,NLT
      IF (NJT .ne. NJ .or. NKT .ne. NK .or.
     &    NLT .ne. NL) THEN 
         GOTO 100 
         WRITE(*,*) 'Dimension Mismatch (FONSET1)'
      END IF 
      READ(3) Q 
C 
      QOUT(:,:,3) = Q(:,:,2) 
      CLOSE(3)           
C
C
      OPEN(3, FILE='FONSET2', FORM='UNFORMATTED')
      READ(3) NJT,NKT,NLT
      IF (NJT .ne. NJ .or. NKT .ne. NK .or.
     &    NLT .ne. NL) THEN 
         GOTO 100 
         WRITE(*,*) 'Dimension Mismatch (FONSET2)'
      END IF 
      READ(3) Q 
C 
      QOUT(:,:,4) = Q(:,:,2) 
      CLOSE(3)           
C
C
      OPEN(3, FILE='FONSET3', FORM='UNFORMATTED')
      READ(3) NJT,NKT,NLT
      IF (NJT .ne. NJ .or. NKT .ne. NK .or.
     &    NLT .ne. NL) THEN 
         GOTO 100 
         WRITE(*,*) 'Dimension Mismatch (FONSET3)'
      END IF 
      READ(3) Q 
C 
      QOUT(:,:,5) = Q(:,:,2) 
      CLOSE(3)           
C
C
      OPEN(3, FILE='FONSET', FORM='UNFORMATTED')
      READ(3) NJT,NKT,NLT
      IF (NJT .ne. NJ .or. NKT .ne. NK .or.
     &    NLT .ne. NL) THEN 
         GOTO 100 
         WRITE(*,*) 'Dimension Mismatch (FONSET)'
      END IF 
      READ(3) Q 
C 
      QOUT(:,:,6) = Q(:,:,2) 
      CLOSE(3)           
C
C
C     Actually write out QOUT array
C                
      OPEN(5,FILE='LM_quant',STATUS='REPLACE',FORM='UNFORMATTED') 
      WRITE(5) NJ,NK,NQ 
      WRITE(5) QOUT 
      CLOSE(5) 
C
C
C
 100  CONTINUE
      END      

