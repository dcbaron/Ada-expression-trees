--------------------------------------------------------------------------------
-- CSCI 241, Assignment 1: Expression Tree
-- Tree_Expression.ads
-- Spec file for building and processing expression trees
--------------------------------------------------------------------------------
with Gen_Tree;

with Ada.Numerics, ada.numerics.generic_elementary_functions,
		Ada.text_io,ada.integer_text_io;
use ada.text_io;
use ada.integer_text_io;
PACKAGE Tree_Expression IS

	bad_input : exception;

   String_Size : Natural := 20;
   SUBTYPE Tree_String IS String (1 .. String_Size);
   function To_String (Input : Tree_String) return String; -- instantiate the To_String with Tree_String, and implement it in the tree_expression body file

   package io_int is new integer_io(integer);
   package Binary_Expression_Tree is new Gen_Tree(Tree_String, To_String);
   package Float_Functions is new Ada.Numerics.Generic_Elementary_Functions
     (Float_Type => Float);
   	use Binary_Expression_Tree;
   	use Float_Functions;
   	use io_int;

   subtype Expression_Node_Ptr is Binary_Expression_Tree.Node_Ptr;

   function Construct_ExpressionTree (Math_String : String; First, Last : Natural) return Expression_Node_Ptr;

   function Evaluate_Expression (Node : Expression_Node_Ptr) return Float;

   function Infix_Notation (Node : Expression_Node_Ptr) return String;
   function Prefix_Notation (Node : Expression_Node_Ptr) return String;
   function Postfix_Notation (Node : Expression_Node_Ptr) return String;

end Tree_Expression;
