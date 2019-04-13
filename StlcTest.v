Set Warnings "-notation-overridden,-parsing".
From Coq Require Export String.
From PLF Require Import Stlc.
Parameter MISSING: Type. 

Module Check. 

Ltac check_type A B := 
match type of A with 
| context[MISSING] => idtac "Missing:" A  
| ?T => first [unify T B; idtac "Type: ok" | idtac "Type: wrong - should be (" B ")"] 
end. 

Ltac print_manual_grade A := 
match eval compute in A with 
| Some (pair ?S ?C) => 
idtac "Score:"  S; 
match eval compute in C with  
| ""%string => idtac "Comment: None"  
| _ => idtac "Comment:" C 
end 
| None => 
idtac "Score: Ungraded"; 
idtac "Comment: None" 
end. 

End Check.

From PLF Require Import Stlc.
Import Check.

Goal True.

idtac "-------------------  substi_correct  --------------------".
idtac " ".

idtac "#> STLC.substi_correct".
idtac "Possible points: 3".
check_type @STLC.substi_correct (
(forall (s : STLC.tm) (x : String.string) (t t' : STLC.tm),
 STLC.subst x s t = t' <-> STLC.substi s x t t')).
idtac "Assumptions:".
Abort.
Print Assumptions STLC.substi_correct.
Goal True.
idtac " ".

idtac "-------------------  step_example5  --------------------".
idtac " ".

idtac "#> STLC.step_example5".
idtac "Possible points: 2".
check_type @STLC.step_example5 (
(STLC.multistep (STLC.tapp (STLC.tapp STLC.idBBBB STLC.idBB) STLC.idB)
   STLC.idB)).
idtac "Assumptions:".
Abort.
Print Assumptions STLC.step_example5.
Goal True.
idtac " ".

idtac "-------------------  typing_example_3  --------------------".
idtac " ".

idtac "#> STLC.typing_example_3".
idtac "Possible points: 2".
check_type @STLC.typing_example_3 (
(exists T : STLC.ty,
   STLC.has_type (@Maps.empty STLC.ty)
     (STLC.tabs STLC.x (STLC.TArrow STLC.TBool STLC.TBool)
        (STLC.tabs STLC.y (STLC.TArrow STLC.TBool STLC.TBool)
           (STLC.tabs STLC.z STLC.TBool
              (STLC.tapp (STLC.tvar STLC.y)
                 (STLC.tapp (STLC.tvar STLC.x) (STLC.tvar STLC.z)))))) T)).
idtac "Assumptions:".
Abort.
Print Assumptions STLC.typing_example_3.
Goal True.
idtac " ".

idtac " ".

idtac "Max points - standard: 7".
idtac "Max points - advanced: 7".
Abort.
