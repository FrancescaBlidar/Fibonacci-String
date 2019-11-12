*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description: Displays x numbers from the Fibonacci string.
*-----------------------------------------------------------
        ORG    $1000
START:                  ; first instruction of program
            
        MOVE.B  #13,D0  ;Display display_string
        LEA     display_string,A1
        TRAP    #15
        
        MOVE.B  #4,D0   ;Get user input. The number entered by the user signifies the number of terms that will be displayed
        TRAP    #15
        
        MOVE.B  D1,D2   ;Move contents from D1 into D2 because D1 is used in this case for I/O operations
    
        MOVE.B  #$1,D3  ;Move 1 into D3 t1=1. t1 is the first term of the string
        MOVE.B  #$1,D4  ;Move 1 into D4 t2=1. t2 is the second term of the string
    
        MOVE.B  D3,D1   ;Move D3 into D1. Step needed because D1 is used for I/O operations
        MOVE.B  #3,D0   ;Task number 3 displays t1
        TRAP    #15
    
        MOVE.B  D4,D1   ;Move D4 into D1
        MOVE.B  #3,D0   ;Task number 3 displays t2
        TRAP    #15
    
        MOVE.B  #$3,D5  ;Move 3 in D5. Since we already have 2 terms in our string (t1 and t2) we set the value that will be incremented later at 3.
         
        MOVE.B #$1,D7   ;Move 1 in D7. 1 Represents the value of the first 2 terms multiplied (1*1)
    
nxtnr:  CMP.B    D5,D2  ;Compare the value from D5 with the value from D2
        BLT     finish  ;Branch to finish subroutine if the value from D2 is lower than the value from D5s
     
        MOVE.B   D4,D6  ;Moves the value from D4 into D6 (t3=t2)
        ADD.B   D3,D6   ;Adds the value from D3 into D6 (t3=t1)
        
        MOVE.B  D6,D1   ;Moves the value from D6 into D1
        MOVE.B  #3,D0   ;Task number 3 displays the value from D6
        TRAP    #15
        
        MOVE.B  D4,D3   ;Move contents of D3 into D4 t1=t2
        MOVE.B  D6,D4   ;Move contents of D4 into D6 t2=t3
        
        mulu.w D6,D7    ;Multiply the value from D6 with the value from D7
        
        ADD.B   #$1,D5  ;Adds 1 into D5
        BRA     nxtnr   ;Branch always to nxtnr subroutine

finish: TRAP    #9      ;halt the simulator. I used task number 9 because if I was using task number 15 the last number from the string was displayed twice.

* Put variables and constants here

display_string: dc.b    'Enter the number of elements from the Fibonacci string',0 ;We are defining a constant. We must put 0 to terminate the string


        END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
