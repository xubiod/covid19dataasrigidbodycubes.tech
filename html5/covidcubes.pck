GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�N      �      &�y���ڞu;>��.p   res://APIKey.gd.remap   @a      !       %YD ӿ�\�)VK�   res://APIKey.gdc      9      �S^�����'/$�Y'jO   res://CubeArea.tscn P      �      ��Ɋ���d�[���    res://CubeAreaCamera.gd.remap   pa      )       ���O�Sd�p6��t   res://CubeAreaCamera.gdc�      7      �g���]F�9Bu��$   res://RepresentationCube.gd.remap   �a      -       J��a՘�	!2���#   res://RepresentationCube.gdc0&      b      3�du�r�=`�Z�+�r    res://RepresentationCube.tscn   �.      	      �g�IT�všj�E!B   res://Spawner.gd.remap  �a      "       N�m�Į���Rڄ���   res://Spawner.gdc   �0      J      `oɒ�9��@�A<'6$�   res://Sword.gd.remap b              ����\�9�,�QF��g   res://Sword.gdc  J      �      �W.H5�f��:T!N    res://default_env.tres   L      �      ?�����K�Q��
�   res://icon.png   b      �      G1?��z�c��vN��   res://icon.png.import   pT      �      ��fe��6�B��^ U�   res://noise_texture.tres W      �       ����[K��,��>�_J   res://project.binaryo      4      ���k��ߗN�N�}   res://rep_active.tres    X      |      �a��q"L�ᰚ�.��   res://rep_critical.tres �Y      �      �O-H�����?�   res://rep_dead.tres 0[      }      �a�$îU�͡��V�&   res://rep_recovered.tres�\      |      q^x$�,�6]H�[���   res://rep_tests.tres0^      |      G4@\��l�θ��֝   res://rep_total.tres�_      �      N�x���#�H�j�        GDSC            G      ���Ӷ���   �������������϶�      caa       l         Rz        a         z         tbms      h         In        Z         0ne       iE        D2        LS        jL        p11       g         8Doj      sn        9         q         SM        zO        G         X3        T         H                            E      3YY0�  PQX�  V�  .�  �  �  �  �  �  �  �  �	  �  �
  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  SY`       [gd_scene load_steps=8 format=2]

[ext_resource path="res://Spawner.gd" type="Script" id=1]
[ext_resource path="res://RepresentationCube.tscn" type="PackedScene" id=2]
[ext_resource path="res://CubeAreaCamera.gd" type="Script" id=3]
[ext_resource path="res://Sword.gd" type="Script" id=4]

[sub_resource type="PlaneMesh" id=1]
size = Vector2( 16, 16 )

[sub_resource type="BoxShape" id=2]
extents = Vector3( 8, 0.05, 8 )

[sub_resource type="CylinderShape" id=3]
radius = 0.0998693
height = 42.8788

[node name="CubeArea" type="Spatial"]

[node name="Spawner" type="Spatial" parent="."]
script = ExtResource( 1 )
ui_option_path = NodePath("../UI/HBoxContainer/UIOption")
ui_subset_path = NodePath("../UI/HBoxContainer/SubsetOption")
ui_label_path = NodePath("../UI/UILabel")
ui_updated_path = NodePath("../UI/LastUpdated")
cubes_to_spawn = ExtResource( 2 )
attract_point_path = NodePath("../AttractionPoint")

[node name="PlaneInstance" type="MeshInstance" parent="."]
transform = Transform( 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0 )
mesh = SubResource( 1 )
material/0 = null

[node name="PlaneRigidBody" type="RigidBody" parent="PlaneInstance"]
mode = 1

[node name="PlaneShape" type="CollisionShape" parent="PlaneInstance/PlaneRigidBody"]
shape = SubResource( 2 )

[node name="UI" type="Control" parent="."]
anchor_right = 1.0
anchor_bottom = 1.0

[node name="Background" type="ColorRect" parent="UI"]
anchor_right = 1.0
margin_bottom = 89.0
color = Color( 0, 0, 0, 0.498039 )

[node name="UILabel" type="Label" parent="UI"]
margin_left = 16.0
margin_top = 47.0
margin_right = 56.0
margin_bottom = 61.0
text = "One cube = ?"

[node name="LastUpdated" type="Label" parent="UI"]
anchor_left = 1.0
anchor_right = 1.0
margin_left = -56.0
margin_top = 16.0
margin_right = -16.0
margin_bottom = 30.0
grow_horizontal = 0
grow_vertical = 0
text = "Last updated: ???"
align = 2

[node name="HBoxContainer" type="HBoxContainer" parent="UI"]
anchor_right = 1.0
margin_left = 16.0
margin_top = 16.0
margin_right = -16.0
margin_bottom = 20.0

[node name="UIOption" type="OptionButton" parent="UI/HBoxContainer"]
margin_right = 160.0
margin_bottom = 20.0
rect_min_size = Vector2( 160, 0 )
focus_mode = 0
text = "Loading..."

[node name="VSeparator" type="VSeparator" parent="UI/HBoxContainer"]
margin_left = 164.0
margin_right = 168.0
margin_bottom = 20.0

[node name="SubsetOption" type="OptionButton" parent="UI/HBoxContainer"]
margin_left = 172.0
margin_right = 273.0
margin_bottom = 20.0
focus_mode = 0
enabled_focus_mode = 0
text = "Total Cases"
items = [ "Total Cases", null, false, 0, null, "Total Deaths", null, false, 1, null, "Total Tests", null, false, 2, null, "Recovered", null, false, 3, null, "Critical", null, false, 4, null, "Active", null, false, 5, null ]
selected = 0

[node name="AttractionPoint" type="Spatial" parent="."]
transform = Transform( 1, 0, 0, 0, 0.926397, 0.376548, 0, -0.376548, 0.926397, 0, 5.555, 0 )

[node name="CSGSphere" type="CSGSphere" parent="AttractionPoint"]
transform = Transform( 0.340503, 0, 0, 0, 0.340503, 7.45058e-09, 0, -7.45058e-09, 0.340503, 0, 0, 0 )

[node name="CubeAreaCamera" type="Camera" parent="."]
transform = Transform( 1, 0, 0, 0, 0.926397, 0.376548, 0, -0.376548, 0.926397, 0, 8.88955, 19.2035 )
script = ExtResource( 3 )

[node name="RayCast" type="RayCast" parent="CubeAreaCamera"]
visible = false
cast_to = Vector3( 0, 0, -100 )

[node name="Sword" type="RigidBody" parent="CubeAreaCamera"]
transform = Transform( 1, 0, 0, 0, 0.999308, -0.0371844, 0, 0.0371844, 0.999308, 0, -0.886105, 0 )
collision_mask = 0
mode = 3
script = ExtResource( 4 )

[node name="CollisionShape" type="CollisionShape" parent="CubeAreaCamera/Sword"]
transform = Transform( 1, 0, 0, 0, -2.98023e-08, 1, 0, -1, -2.98023e-08, 0, 1.43051e-06, -21.5121 )
shape = SubResource( 3 )

[node name="CSGCylinder" type="CSGCylinder" parent="CubeAreaCamera/Sword/CollisionShape"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -0.866309, -2.38419e-07 )
radius = 0.103478
height = 43.8692

[connection signal="item_selected" from="UI/HBoxContainer/UIOption" to="Spawner" method="_on_UIOption_item_selected"]
[connection signal="item_selected" from="UI/HBoxContainer/SubsetOption" to="Spawner" method="_on_UIOption_item_selected"]
      GDSC   )      \   �     �����׶�   ����������Ӷ   ����������������ض��   ������������Ķ��   ����Ӷ��   �����Ŷ�   ���������¶�   �����Ѷ�   ���������������ض���   ���������������ض���   ����Ҷ��   ��������¶��   ��������Ŷ��   �����϶�   ���������������Ŷ���   ����������ض   �������ض���   �����������¶���   �������Ŷ���   �����׶�   ����¶��   ���������������������Ҷ�   ����Ӷ��   �����������������ض�   ���Ӷ���   �����Ӷ�   ζ��   ϶��   ̶��   ������������������޶   �����������������Ӷ�   ����¶��   �������Ŷ���   �����Ӷ�   �����¶�   ����������������������Ҷ   ���������Ӷ�   ���������������������ڶ�   �������������Ӷ�   ��������������������   ������������������         �������?         �������?      toggle_camera_mode                         �?      reset_camera      ?      camera_backwards      camera_forwards       camera_left       camera_right      camera_rotate_ccw         camera_rotate_cw      camera_speed_up       camera_speed_down     �������?  ������	@   
         move_camera                                                     	   '   
   -      .      6      7      =      C      D      J      K      O      U      V      ^      c      h      m      n      u      w      x      y      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /     0     1   "  2   '  3   *  4   5  5   A  6   M  7   N  8   R  9   b  :   q  ;   �  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K     L     M   &  N   D  O   E  P   N  Q   T  R   X  S   _  T   h  U   o  V   �  W   �  X   �  Y   �  Z   �  [   �  \   3YY;�  V�  SYY;�  V�  SY;�  �  SYY;�  V�  SY;�  V�  SY;�  SYY;�  V�  �  SYY;�  V�  SY;�	  V�  SYY;�
  �  SYY;�  SY;�  V�  SYY0�  PQX=V�  �  �  S�  �  �  S�  �	  �  SY�  �  �  PQS�  -YYY0�  P�  V�  QX=V�  &�  T�  P�  QV�  &�  V�  �  �  S�  (V�  �  SY�  /�  V�  V�  ;�  �  PQT�  PQS�  �  �  PQT�  SY�  ;�  �  PP�  T�  �  Q�  T�  RP�  T�  �  Q�  T�  QS�  �  T�  �  S�  �  T�  �  S�  �  T�  P�  �  Q�  S�  �  T�  �  P�  �  Q�  SY�  �  �  P�  T�  �  T�  R�  T�  �  T�  R�  T�  QS�  �  �  S�  �  V�  &�  T�  P�	  QV�  �  �  T�  P�  R�
  QS�  �  �  T�  P�	  R�
  QSY�  &�  V�  ;�  V�  �  T�   P�  R�  QS�  ;�!  V�  �  T�   P�  R�  QS�  ;�"  V�  �  T�   P�  R�  QSY�  &�  T�#  P�  QV�  �
  �  S�  '�  T�#  P�  QV�  �
  �  SY�  �
  �5  P�
  R�  R�  QSY�  ;�  �  T�  PQS�  �  �  T�  SY�  ;�  �  P�  P�  T�  �  Q�  T�  R�  P�  T�  �  Q�  T�  R�"  QS�  �  T�  �  �  S�  �  T�  �  �  S�  �  T�  �
  S�  �  T�$  P�  P�  P�  T�  �  QR�  P�  T�  �  QQQSY�  �%  P�  P�!  �
  RR�  �
  QQS�  �  �  P�  T�  �  T�  R�  T�  �  T�  R�  T�  �  T�  QSY�  &�  T�  P�  QV�  �  �  S�  &�  V�  �  �  PQS�  �  �  T�  PQS�  �  �  T�  S�  �  T�$  P�  P�  T�  �  R�  T�  �  QQS�  �  T�&  P�  T�'  QS�  (V�  �  T�$  P�  QS�  �  T�&  P�  T�(  QS�  -Y`         GDSC         A   �     ��������϶��   �����������Ŷ���   ������������Ķ��   �������������Ӷ�   ������������¶��   ������ڶ   �������������϶�   ����������������ڶ��   �����϶�   ����������ض   �������Ŷ���   �����׶�   ����¶��   ����������������Ҷ��   ��������������������Ӷ��   �����������ٶ���   ���������������������Ҷ�   �����ն�   ζ��   ϶��   ̶��   ������Ӷ   ��������������϶   ��������   ���������������϶���   �������Ѷ���   ���Ӷ���   ����������   ������������   ������������Ӷ��   ����������ٶ   2      �        push_zup   	   push_away            {�G�z�?            reset                freeze              sword         zero_gravity        �������?                       	                        "      (   	   )   
   1      6      8      9      D      M      Z      [      d      p      �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '     (     )     *     +     ,     -     .      /   )  0   .  1   /  2   8  3   >  4   C  5   F  6   K  7   L  8   T  9   Y  :   ^  ;   _  <   e  =   r  >   w  ?   |  @   ~  A   3YY;�  V�  SY;�  SY;�  �  SY;�  V�  SY;�  V�  SY;�  V�  SYY0�  PQX=V�  �  �	  S�  -YY0�
  P�  V�  QX=V�  &�  T�  P�  QV�  �  P�	  T�  P�  T�	  QQSY�  &�  T�  P�  QV�  ;�  P�	  �  T�	  QS�  &�  T�  �  V�  T�  �(  P�  R�  QS�  &�  T�  �  V�  T�  �(  P�  R�  QS�  &�  T�  �  V�  T�  �(  P�  R�  QS�  �  �  �  T�  PQSYYY�  �  P�  QSY�  &�  T�  P�  QV�  �  �  T�  S�  �  �  T�  S�  �	  �  S�  �  �  SY�  &�  T�  P�	  QV�  &P�  �  QV�  �  �  S�  �  �
  S�  �  �  S�  �  �  S�  (V�  �  �  S�  �  �  S�  �  �  S�  �  �  SY�  &�  T�  P�  QV�  �  �  SY�  &�  T�  P�  QV�  &�  �  V�  �  �  S�  (V�  �  �  SY�  &�	  T�  	�  V�  �	  �  S�  �  �  SY�  &�  �  V�  &�	  T�  P�  T�	  Q�  V�  �	  �  S�  �  �  S�  -Y`              [gd_scene load_steps=4 format=2]

[ext_resource path="res://rep_total.tres" type="Material" id=1]
[ext_resource path="res://RepresentationCube.gd" type="Script" id=2]

[sub_resource type="BoxShape" id=1]
extents = Vector3( 0.25, 0.25, 0.25 )

[node name="RepresentationCube" type="RigidBody"]
script = ExtResource( 2 )

[node name="VisibleBox" type="CSGBox" parent="."]
width = 0.5
height = 0.5
depth = 0.5
material = ExtResource( 1 )

[node name="CollisionBox" type="CollisionShape" parent="."]
shape = SubResource( 1 )
       GDSC   [   B   �   �     ������ڶ   ���������ض�   ���������¶�   ���׶���   �������������޶�   ��������ض��   �������Ӷ���   �����������ض���   �������������޶�   ��������¶��   ������������޶��   �������ڶ���   ����ڶ��   ��������������޶   ���������Ҷ�   �������������ض�   ����������Ӷ   �����������������޶�   ��������������ض   ����������׶   �����϶�   ����   ��Ķ   ��������������¶   ����   ���������Ŷ�   ����������������񶶶   ���������������񶶶�   ���ڶ���   �����Ӷ�   ������������ƶ��   �����϶�   �����϶�   �������������϶�   ������Ŷ   ������¶   ���������ⶶ   ����������������񶶶   �����������Ӷ���   �����������   ����ݶ��   �����������������������ݶ���   ���Ӷ���   ���������¶�   ��������������¶   ��������   ����Ӷ��   ��������������������߶��   �����¶�   �������Ӷ���   ����������۶   �����Ķ�   ��ܶ   ��Ŷ   �������۶���   �������Ҷ���   ���¶���   ������Ŷ   ��������Ŷ��   �������������������������Ҷ�   ����ζ��   ����Ҷ��   �����������ض���   ���������Ӷ�   �������׶���   ����������Ŷ   ��������Ҷ��   �������ڶ���   �����Ӷ�   ����ڶ��   ��������������¶   ����������������Զ��   ��������ƶ��   �������ض���   ������Ķ   �������Ӷ���   ������������¶��   ��������Ҷ��   �����ζ�   �������ڶ���   ����������ض   ��������Ҷ��   �����Ķ�   �����Ѷ�   ��Ҷ   �����޶�   ��Ŷ   ߶��   �������������Ѷ�   ׶��   Զ��      covid-193.p.rapidapi.com   �              Connection polling     
   idle_frame     )   x-rapidapi-host: covid-193.p.rapidapi.com         x-rapidapi-key:       /statistics       Request polling       Data polling             No response       sort_ascending        country    	   continent             ,               Done. Pick a country      cases         deaths        tests      	   recovered         critical      active        res://rep_total.tres      res://rep_dead.tres       res://rep_tests.tres      res://rep_recovered.tres      res://rep_critical.tres       res://rep_active.tres                           Last updated:         time   "   No data is supplied for that combo      ��   �       One cube = 400K    ���    �$       One cube = 75K     �%&    P�        One cube = 50K      �    X        One cube = 7K      �     �        One cube = 1K      �     d         One cube = 100        One cube = 1      
Total cases =         instances, approx. into           cubes                      ffffff�?             ,                             	                  $      +      7   	   >   
   J      Q      ]      d      e      l      x      y      }      ~      �      �      �      �      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   
  (     )     *   #  +   $  ,   ,  -   8  .   ?  /   E  0   O  1   Y  2   e  3   h  4   o  5   r  6   x  7   y  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F     G     H   '  I   (  J   3  K   :  L   B  M   M  N   X  O   \  P   ]  Q   e  R   r  S   z  T   �  U   �  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h      i     j     k     l     m     n   $  o   )  p   0  q   6  r   ;  s   B  t   H  u   M  v   T  w   W  x   \  y   c  z   x  {   y  |     }   �  ~   �     �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �     �   (  �   ,  �   3  �   4  �   7  �   8  �   <  �   F  �   V  �   l  �   p  �   |  �   �  �   �  �   3YY;�  V�  SY;�  �  PQSY8;�  V�  SY5;�  �  P�  Q<�  SY8;�  V�  SY5;�	  �  P�  Q<�  SY8;�
  V�  SY5;�  �  P�
  Q<�  SY8;�  V�  SY5;�  �  P�  Q<�  SY8;�  V�  SYY8;�  V�  SY5;�  �  P�  Q<SYY;�  SYY0�  PQX=VY�  �  �  T�  PQS�  ;�  �  T�  PR�  R�  QS�  @P�  �  QSY�  *�  T�  PQ�  T�  �  T�  PQ�  T�  V�  �  T�  PQ�  �?  P�  Q�  AP�  T�  PQR�  QY�  �  �  ;�  �   T�!  PQS�  Y�  ;�"  L�  R�  �  MS�  �  T�#  P�  T�$  R�  R�"  QSY�  *�  T�  PQ�  T�%  V�  �  T�  PQS�  �?  P�  QS�  AP�  T�  PQR�  QSY�  &�  T�&  PQV�  *�  T�  PQ�  T�'  V�  �  T�  PQS�  �?  P�	  QS�  ;�(  �  T�)  PQS�  &�(  T�*  PQ�
  V�  AP�  T�  PQR�  QS�  (V�  �  �  �(  S�  (V�  �?  P�  QSY�  ;�+  V�,  �-  T�.  P�  T�/  PQQS�  �  �+  T�0  T�1  S�  �  T�2  P�3  R�  QS�  )�4  �  V�  &P�4  T�5  P�  QQV�  &�4  T�5  P�  Q�4  L�  M�  V�  �  T�6  P�4  L�  M�  �4  L�  MQS�  (V�  �  T�6  P�4  L�  MQSY�  �  T�7  �  S�  �  T�8  �  �  -YY:�9  L�  R�  R�  R�  R�  R�  MSY;�:  L�L  P�  QR�L  P�  QR�L  P�  QR�L  P�  QR�  �L  P�  QR�L  P�  QMSYY0�;  P�<  V�  QX=V�  �<  �  T�7  S�  )�=  �>  PQV�  P�=  <QT�?  PQS�  ;�@  V�  �  L�<  MS�  ;�A  SY�  &�	  T�7  �  V�  �A  �@  L�9  L�
  MMT�B  S�  '�	  T�7  �   V�  �A  �@  L�9  L�
  MMT�C  S�  '�	  T�7  �!  V�  �A  �@  L�9  L�
  MMT�D  S�  (V�  �A  �@  L�9  L�	  T�7  MMT�E  SY�  �  T�8  �"  �@  L�#  MSY�  &�A  �  V�  �A  �
  S�  �  T�8  �$  S�  .SY�  �  ;�F  V�  P�A  QS�  ;�G  V�  P�A  QSY�  &�F  �%  V�  �F  �&  S�  �  T�8  �'  S�  '�F  �(  V�  �F  �)  S�  �  T�8  �*  S�  '�F  �+  V�  �F  �,  S�  �  T�8  �-  S�  '�F  �.  V�  �F  �/  S�  �  T�8  �0  S�  '�F  �1  V�  �F  �2  S�  �  T�8  �3  S�  '�F  �4  V�  �F  �5  S�  �  T�8  �6  S�  (V�  �F  �  S�  �  T�8  �7  S�  �  T�8  �8  �H  P�G  Q�9  �H  P�F  Q�:  SY�  ;�=  VS�  ;�I  V�  S�  )�J  �K  P�F  QV�  �=  �  T�K  PQS�  �=  T�L  �  S�  P�=  T�M  P�
  Q<�N  QT�O  �:  L�	  T�7  MS�  �I  �  PP�J  �;  Q�<  RPPP�J  �;  Q�;  Q�;  �=  QRP�J  �;  Q�;  �<  QS�  �=  T�P  �I  �>  S�  �Q  P�=  QS�  -YY0�H  P�R  QV�  ;�S  �>  P�R  Q�  ;�T  �S  T�U  PQ�  �  ;�V  �?  Y�  )�W  �K  P�
  R�S  T�U  PQQV�  &�W  �
  �W  �  �T  V�  �V  �@  �  �V  �S  L�W  MY�  .�V  YY1�3  V�  70�X  P�Y  R�Z  QV�  &�Y  L�  M�  �Z  L�  M�  V�  &�Y  L�  M	�Z  L�  M�Y  L�  M	�Z  L�  MV�  .�  S�  &�Y  L�  M	�Z  L�  MV�  .�  S�  .�A  SY`      GDSC   
         O      ��������϶��   �����϶�   ������Ӷ   ����������������������¶   �������Ŷ���   �����׶�   �����¶�   ����¶��   ���������¶�   ����������������Ҷ��                    sword                                                    &   	   .   
   0      1      <      E      K      M      3YY0�  PQX=V�  �  S�  �  P�  R�  QS�  -YY0�  P�  V�  QX=V�  �  P�  R�  QS�  -YY0�  P�  V�  QX=V�  &�  T�	  P�  QV�  �  �  S�  -Y`        [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]
sky_top_color = Color( 0.941176, 0.6, 0.533333, 1 )
sky_horizon_color = Color( 0.980392, 0.929412, 0.839216, 1 )
sky_curve = 0.122944
sky_energy = 0.76
ground_curve = 0.0585636
sun_curve = 0.0353553
texture_size = 0

[resource]
background_mode = 2
background_sky = SubResource( 1 )
tonemap_mode = 2
ss_reflections_enabled = true
ss_reflections_max_steps = 32
dof_blur_far_enabled = true
dof_blur_far_distance = 45.0
dof_blur_far_transition = 20.0
dof_blur_far_quality = 0
dof_blur_near_enabled = true
dof_blur_near_quality = 0
glow_bloom = 1.0
               GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              [gd_resource type="NoiseTexture" load_steps=2 format=2]

[sub_resource type="OpenSimplexNoise" id=1]
seed = 104
octaves = 4

[resource]
width = 128
height = 128
seamless = true
as_normalmap = true
bump_strength = 16.4
noise = SubResource( 1 )
             [gd_resource type="SpatialMaterial" load_steps=2 format=2]

[ext_resource path="res://noise_texture.tres" type="Texture" id=1]

[resource]
albedo_color = Color( 1, 0.117647, 0, 1 )
metallic = 1.0
metallic_specular = 1.0
roughness = 0.84
roughness_texture = ExtResource( 1 )
rim_enabled = true
rim = 1.0
rim_tint = 1.0
subsurf_scatter_enabled = true
subsurf_scatter_strength = 0.4
    [gd_resource type="SpatialMaterial" load_steps=2 format=2]

[ext_resource path="res://noise_texture.tres" type="Texture" id=1]

[resource]
albedo_color = Color( 0.996078, 0.909804, 0, 1 )
metallic = 1.0
metallic_specular = 1.0
roughness = 0.84
roughness_texture = ExtResource( 1 )
rim_enabled = true
rim = 1.0
rim_tint = 1.0
subsurf_scatter_enabled = true
subsurf_scatter_strength = 0.4
             [gd_resource type="SpatialMaterial" load_steps=2 format=2]

[ext_resource path="res://noise_texture.tres" type="Texture" id=1]

[resource]
albedo_color = Color( 0.0156863, 0, 0, 1 )
metallic = 1.0
metallic_specular = 1.0
roughness = 0.84
roughness_texture = ExtResource( 1 )
rim_enabled = true
rim = 1.0
rim_tint = 1.0
subsurf_scatter_enabled = true
subsurf_scatter_strength = 0.4
   [gd_resource type="SpatialMaterial" load_steps=2 format=2]

[ext_resource path="res://noise_texture.tres" type="Texture" id=1]

[resource]
albedo_color = Color( 0.172549, 1, 0, 1 )
metallic = 1.0
metallic_specular = 1.0
roughness = 0.84
roughness_texture = ExtResource( 1 )
rim_enabled = true
rim = 1.0
rim_tint = 1.0
subsurf_scatter_enabled = true
subsurf_scatter_strength = 0.4
    [gd_resource type="SpatialMaterial" load_steps=2 format=2]

[ext_resource path="res://noise_texture.tres" type="Texture" id=1]

[resource]
albedo_color = Color( 0, 0.976471, 1, 1 )
metallic = 1.0
metallic_specular = 1.0
roughness = 0.84
roughness_texture = ExtResource( 1 )
rim_enabled = true
rim = 1.0
rim_tint = 1.0
subsurf_scatter_enabled = true
subsurf_scatter_strength = 0.4
    [gd_resource type="SpatialMaterial" load_steps=2 format=2]

[ext_resource path="res://noise_texture.tres" type="Texture" id=1]

[resource]
albedo_color = Color( 0.615686, 0.615686, 0.615686, 1 )
metallic = 1.0
metallic_specular = 1.0
roughness = 0.84
roughness_texture = ExtResource( 1 )
rim_enabled = true
rim = 1.0
rim_tint = 1.0
subsurf_scatter_enabled = true
subsurf_scatter_strength = 0.4
      [remap]

path="res://APIKey.gdc"
               [remap]

path="res://CubeAreaCamera.gdc"
       [remap]

path="res://RepresentationCube.gdc"
   [remap]

path="res://Spawner.gdc"
              [remap]

path="res://Sword.gdc"
�PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         datavisualization      application/run/main_scene         res://CubeArea.tscn    application/config/icon         res://icon.png     autoload/ApiKey         *res://APIKey.gd   input/push_zup�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode             unicode           echo          script         input/push_away�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      B      unicode           echo          script         input/freeze�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      F      unicode           echo          script         input/reset�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      R      unicode           echo          script         input/sword�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      X      unicode           echo          script         input/zero_gravity�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      Z      unicode           echo          script            deadzone      ?   input/reset_camera�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      T      unicode           echo          script            deadzone      ?   input/camera_forwards�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      W      unicode           echo          script            deadzone      ?   input/camera_backwards�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      S      unicode           echo          script            deadzone      ?   input/camera_left�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      A      unicode           echo          script            deadzone      ?   input/camera_right�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      D      unicode           echo          script            deadzone      ?   input/camera_rotate_ccw�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      Q      unicode           echo          script            deadzone      ?   input/camera_rotate_cw�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      E      unicode           echo          script            deadzone      ?   input/camera_speed_up�              events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script            deadzone      ?   input/camera_speed_down�              events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script            deadzone      ?   input/move_camera�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      M      unicode           echo          script            deadzone      ?   input/toggle_camera_mode�              events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode      C      unicode           echo          script            deadzone      ?)   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres              