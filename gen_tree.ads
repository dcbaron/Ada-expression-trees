--------------------------------------------------------------------------------
-- CSCI 241, Assignment 1: Expression Tree
-- gen_tree.ads
-- Spec file for generic Binary Trees
--------------------------------------------------------------------------------

generic
   type Item_Type is private;
   with Function To_String(Item: Item_Type) return String; -- a generic function that takes a generic type as a parameter
package Gen_Tree is
   type Node_Type is limited private;
   type Node_Ptr is access Node_Type;

   function Create_Node(Data : Item_Type; Left_Child, Right_Child : Node_Ptr) return Node_Ptr;

   function Get_Data (Node : Node_Ptr) return Item_Type;
   procedure Set_Data (Node : in out Node_Ptr; Item :in Item_Type);

   function Get_Left_Child (Node : Node_Ptr) return Node_Ptr;
   procedure Set_Left_Child (Node : in out Node_Ptr; Left_Child : in Node_Ptr);

   function Get_Right_Child (Node : Node_Ptr) return Node_Ptr;
   procedure Set_Right_Child (Node : in out Node_Ptr; Right_Child : in Node_Ptr);

   function Inorder_Traversal (Node : Node_Ptr) return String;
   function Preorder_Traversal (Node : Node_Ptr) return String;
   function Postorder_Traversal (Node : Node_Ptr) return String;
private
   type Node_Type is record
      Data        : Item_Type;
      Left_Child  : Node_Ptr := null;
      Right_Child : Node_Ptr := null;
   end record;
end Gen_Tree;
