.data
num: .word 0,2,1,5,3,4
numSize: .word 6
.text
main:
    la a1,num          #get num's address
    la a2,numSize      #get numSize's address
    lw a2,0(a2)        #a2=6
    addi a2,a2,-1      #because matrix is start at 0,so a2 must minus 1
    addi a3,zero,0     #set i=0
    j end.L2
end.L1:
    slli t0,a3,2       #calculate num[i] address
    add t0,t0,a1       #calculate num[i] address
    lw t1,0(t0)        #load num[i] to t1
    slli t1,t1,2       #calculate num[numn[i]] address
    add,t1,t1,a1       #calculate num[numn[i]] address
    lw t2,0(t1)        #load num[numn[i]] to t2
    slli t3,a3,2       #calculate p[i] address
    add t3,a4,t3       #calculate p[i] address
    sw t2,0(t3)        #let p[i] = num[mum[i]]
    addi a3,a3,1       #i++
end.L2:
    ble a3,a2,end.L1   #if i<a2,jump to L1
    addi a3,zero,0     #set i=0
    j print
print:
    slli t3,a3,2       #calculate p[i] address
    add t3,a4,t3       #calculate p[i] address
    lw a0,0(t3)        #load p[i] to a0
    li a7, 1           #system call print
    ecall              #execute system call
    addi a3,a3,1       #i++
    ble a3,a2,print    #if i<a2,jump to print
    j exit
exit:
    li a7, 10          # system call exit
    ecall              #execute system call
