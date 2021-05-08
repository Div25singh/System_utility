 ****** ***************************** Top of Data ******************************
 000001 /*rexx*/                                                                
 000002 b.1=hello                                                               
 000003 b.2= 'Hello students! Its time to get to know this mainframe.....'      
 000004 b.3= ' -------------------------------------------------------------'   
 000005 b.4= 'The report was created by user:'userid()                          
 000006 /* location of member*/                                                 
 000007 b.5= ' -------------------------------------------------------------'   
 000008 b.6= 'This is a Syslog Parsing report'                                  
 000009 b.7= ' -------------------------------------------------------------'   
 000010 b.8= 'The location of this report is :'                                 
 000011 parse source a                                                          
 000012 b.9= a                                                                  
 000013 /* version of rexx*/                                                    
 000014 b.10= ' -------------------------------------------------------------'  
 000015 b.11= 'This report has been created by the rexx version:'               
 000016 parse version b                                                         
 000017 b.12= b                                                                 
 000018 b.13= ' -------------------------------------------------------------'  
 000019 b.14= 'Reading syslog and displaying parsed data'                       
 000020 b.15= '                                                             '   
 000021 b.16= 'Parsing output is written in z00008.p3.output(#15) member'       
 000022 /* read syslog*/                                                        
 000023 address tso "alloc f(dd5) da('z00008.p3.output(#14)') shr"              
 000024 "execio 30 diskr dd5(finis stem a."                                     
 000025 do i=1 to 30 by 1                                                       
 000026 str1=a.i                                                                
 000027 parse var str1 . . w1 .                                                 
 000028 if substr(w1,1,6)="STATUS" then                                         
 000029 do                                                                      
 000030 b.17= substr(w1,1,23)                                                   
 000031 b.18= substr(w1,25,9)                                                   
 000032 end                                                                     
 000033 end                                                                     
 000034 parse var a.1 w7 w8 .                                                   
 000035 b.19= "Date is: " w7                                                    
 000036 b.20= "Time is: " w8                                                    
 000037 b.21= 'The information displayed above from syslog for user'            
 000038 b.22= '-------------------------------------------------------------'   
 000039 /* address tso "alloc f(dd4) da('z00008.p3.output(#18)') old" */        
 000040 address tso "alloc f(dd4) da('z00008.p3.OUTPUT(#15)') old"              
 000041 "execio * diskw dd4(stem b."                                            
 000042 "execio 0 diskr dd4(finis"                                              
 000043 "free f(dd5)"                                                           
 000044 "free f(dd4)"                                                           
 000045 do i=1 to 22 by 1                                                       
 000046 say b.i                                                                 
 000047 end                                                                     
 000048 exit                                                                    
 ****** **************************** Bottom of Data ****************************