--------------------------------------------------------------------------------
-- CSCI 241, Assignment 1: Expression Tree
-- gen_tree.adb
-- Body file for generic Binary Trees
--------------------------------------------------------------------------------
 
with Ada.Text_IO, Gen_Tree;
package body Gen_Tree is
 
   function Create_Node(Data : Item_Type; Left_Child, Right_Child : Node_Ptr) return Node_Ptr is
   begin
      return new Node_Type'(Data, Left_Child, Right_Child);
   end Create_Node;
 
   function Get_Data (Node : Node_Ptr) return Item_Type is
   begin
      return Node.Data;
   end Get_Data;
 
   procedure Set_Data (Node : in out Node_Ptr; Item : in Item_Type) is
   begin
      Node.Data := Item;
   end Set_Data;
 
   function Get_Left_Child (Node : Node_Ptr) return Node_Ptr is
   begin
    return Node.Left_Child;
   end Get_Left_Child;
 
   procedure Set_Left_Child (Node : in out Node_Ptr; Left_Child : in Node_Ptr) is
   begin
    Node.Left_Child := Left_child;
   end Set_Left_Child;
 
   function Get_Right_Child (Node : Node_Ptr) return Node_Ptr is
   begin
    return Node.Right_Child;
   end Get_Right_Child;
 
   procedure Set_Right_Child (Node : in out Node_Ptr; Right_Child : in Node_Ptr) is
   begin
    Node.Right_Child := Right_child;
   end Set_Right_Child;
 
   function Inorder_Traversal (Node : Node_Ptr) return String is
   begin
      if Node = null then
         return "";
      end if;
      return Inorder_Traversal (Node.Left_Child) & To_String (Node.Data) & " " & Inorder_Traversal (Node.Right_Child);
   end Inorder_Traversal;
 
   function Preorder_Traversal (Node : Node_Ptr) return String is
   begin
    if Node = null then
        return "";
    end if;
    return To_String(Node.Data) & " " & Preorder_Traversal(Node.Left_Child) & Preorder_Traversal(Node.Right_Child);
   end Preorder_Traversal;
 
   function Postorder_Traversal (Node : Node_Ptr) return String is
   BEGIN
    if Node = null then
        return "";
    end if;
    return Postorder_Traversal(Node.Left_Child) & Postorder_Traversal(Node.Right_Child) & To_String(Node.Data);
   end Postorder_Traversal;
 
end Gen_Tree;
