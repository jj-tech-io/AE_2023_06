ґ
��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.10.12v2.10.0-76-gfdfc646704c8��
~
encoder_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameencoder_output/bias
w
'encoder_output/bias/Read/ReadVariableOpReadVariableOpencoder_output/bias*
_output_shapes
:*
dtype0
�
encoder_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:K*&
shared_nameencoder_output/kernel

)encoder_output/kernel/Read/ReadVariableOpReadVariableOpencoder_output/kernel*
_output_shapes

:K*
dtype0
�
decoder_dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:K*%
shared_namedecoder_dense_2/bias
y
(decoder_dense_2/bias/Read/ReadVariableOpReadVariableOpdecoder_dense_2/bias*
_output_shapes
:K*
dtype0
�
decoder_dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:KK*'
shared_namedecoder_dense_2/kernel
�
*decoder_dense_2/kernel/Read/ReadVariableOpReadVariableOpdecoder_dense_2/kernel*
_output_shapes

:KK*
dtype0
�
decoder_dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:K*%
shared_namedecoder_dense_1/bias
y
(decoder_dense_1/bias/Read/ReadVariableOpReadVariableOpdecoder_dense_1/bias*
_output_shapes
:K*
dtype0
�
decoder_dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:K*'
shared_namedecoder_dense_1/kernel
�
*decoder_dense_1/kernel/Read/ReadVariableOpReadVariableOpdecoder_dense_1/kernel*
_output_shapes

:K*
dtype0
�
serving_default_decoder_inputPlaceholder*'
_output_shapes
:���������*
dtype0*
shape:���������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_decoder_inputdecoder_dense_1/kerneldecoder_dense_1/biasdecoder_dense_2/kerneldecoder_dense_2/biasencoder_output/kernelencoder_output/bias*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8� *-
f(R&
$__inference_signature_wrapper_280841

NoOpNoOp
�
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�
value�B� B�
�
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
	variables
trainable_variables
regularization_losses
	keras_api
	__call__
*
&call_and_return_all_conditional_losses
_default_save_signature

signatures*
* 
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias*
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias*
�
	variables
trainable_variables
regularization_losses
 	keras_api
!__call__
*"&call_and_return_all_conditional_losses

#kernel
$bias*
.
0
1
2
3
#4
$5*
* 
* 
�
%non_trainable_variables

&layers
'metrics
(layer_regularization_losses
)layer_metrics
	variables
trainable_variables
regularization_losses
	__call__
_default_save_signature
*
&call_and_return_all_conditional_losses
&
"call_and_return_conditional_losses*
6
*trace_0
+trace_1
,trace_2
-trace_3* 
6
.trace_0
/trace_1
0trace_2
1trace_3* 
* 

2serving_default* 

0
1*
* 
* 
�
3non_trainable_variables

4layers
5metrics
6layer_regularization_losses
7layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

8trace_0* 

9trace_0* 
f`
VARIABLE_VALUEdecoder_dense_1/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEdecoder_dense_1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE*

0
1*
* 
* 
�
:non_trainable_variables

;layers
<metrics
=layer_regularization_losses
>layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

?trace_0* 

@trace_0* 
f`
VARIABLE_VALUEdecoder_dense_2/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
b\
VARIABLE_VALUEdecoder_dense_2/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*

#0
$1*
* 
* 
�
Anon_trainable_variables

Blayers
Cmetrics
Dlayer_regularization_losses
Elayer_metrics
	variables
trainable_variables
regularization_losses
!__call__
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses*

Ftrace_0* 

Gtrace_0* 
e_
VARIABLE_VALUEencoder_output/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
a[
VARIABLE_VALUEencoder_output/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*
.
0
1
2
3
#4
$5*
 
0
1
2
3*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 

#0
$1*
* 
* 
* 
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename*decoder_dense_1/kernel/Read/ReadVariableOp(decoder_dense_1/bias/Read/ReadVariableOp*decoder_dense_2/kernel/Read/ReadVariableOp(decoder_dense_2/bias/Read/ReadVariableOp)encoder_output/kernel/Read/ReadVariableOp'encoder_output/bias/Read/ReadVariableOpConst*
Tin

2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *(
f#R!
__inference__traced_save_281023
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedecoder_dense_1/kerneldecoder_dense_1/biasdecoder_dense_2/kerneldecoder_dense_2/biasencoder_output/kernelencoder_output/bias*
Tin
	2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8� *+
f&R$
"__inference__traced_restore_281051��
�
�
C__inference_decoder_layer_call_and_return_conditional_losses_280923

inputs@
.decoder_dense_1_matmul_readvariableop_resource:K=
/decoder_dense_1_biasadd_readvariableop_resource:K@
.decoder_dense_2_matmul_readvariableop_resource:KK=
/decoder_dense_2_biasadd_readvariableop_resource:K?
-encoder_output_matmul_readvariableop_resource:K<
.encoder_output_biasadd_readvariableop_resource:
identity��&decoder_dense_1/BiasAdd/ReadVariableOp�%decoder_dense_1/MatMul/ReadVariableOp�&decoder_dense_2/BiasAdd/ReadVariableOp�%decoder_dense_2/MatMul/ReadVariableOp�%encoder_output/BiasAdd/ReadVariableOp�$encoder_output/MatMul/ReadVariableOp�
%decoder_dense_1/MatMul/ReadVariableOpReadVariableOp.decoder_dense_1_matmul_readvariableop_resource*
_output_shapes

:K*
dtype0�
decoder_dense_1/MatMulMatMulinputs-decoder_dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������K�
&decoder_dense_1/BiasAdd/ReadVariableOpReadVariableOp/decoder_dense_1_biasadd_readvariableop_resource*
_output_shapes
:K*
dtype0�
decoder_dense_1/BiasAddBiasAdd decoder_dense_1/MatMul:product:0.decoder_dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Kp
decoder_dense_1/ReluRelu decoder_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:���������K�
%decoder_dense_2/MatMul/ReadVariableOpReadVariableOp.decoder_dense_2_matmul_readvariableop_resource*
_output_shapes

:KK*
dtype0�
decoder_dense_2/MatMulMatMul"decoder_dense_1/Relu:activations:0-decoder_dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������K�
&decoder_dense_2/BiasAdd/ReadVariableOpReadVariableOp/decoder_dense_2_biasadd_readvariableop_resource*
_output_shapes
:K*
dtype0�
decoder_dense_2/BiasAddBiasAdd decoder_dense_2/MatMul:product:0.decoder_dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Kp
decoder_dense_2/ReluRelu decoder_dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:���������K�
$encoder_output/MatMul/ReadVariableOpReadVariableOp-encoder_output_matmul_readvariableop_resource*
_output_shapes

:K*
dtype0�
encoder_output/MatMulMatMul"decoder_dense_2/Relu:activations:0,encoder_output/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
%encoder_output/BiasAdd/ReadVariableOpReadVariableOp.encoder_output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
encoder_output/BiasAddBiasAddencoder_output/MatMul:product:0-encoder_output/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������n
IdentityIdentityencoder_output/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp'^decoder_dense_1/BiasAdd/ReadVariableOp&^decoder_dense_1/MatMul/ReadVariableOp'^decoder_dense_2/BiasAdd/ReadVariableOp&^decoder_dense_2/MatMul/ReadVariableOp&^encoder_output/BiasAdd/ReadVariableOp%^encoder_output/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 2P
&decoder_dense_1/BiasAdd/ReadVariableOp&decoder_dense_1/BiasAdd/ReadVariableOp2N
%decoder_dense_1/MatMul/ReadVariableOp%decoder_dense_1/MatMul/ReadVariableOp2P
&decoder_dense_2/BiasAdd/ReadVariableOp&decoder_dense_2/BiasAdd/ReadVariableOp2N
%decoder_dense_2/MatMul/ReadVariableOp%decoder_dense_2/MatMul/ReadVariableOp2N
%encoder_output/BiasAdd/ReadVariableOp%encoder_output/BiasAdd/ReadVariableOp2L
$encoder_output/MatMul/ReadVariableOp$encoder_output/MatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
(__inference_decoder_layer_call_fn_280784
decoder_input
unknown:K
	unknown_0:K
	unknown_1:KK
	unknown_2:K
	unknown_3:K
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCalldecoder_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8� *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_280752o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namedecoder_input
�
�
C__inference_decoder_layer_call_and_return_conditional_losses_280803
decoder_input(
decoder_dense_1_280787:K$
decoder_dense_1_280789:K(
decoder_dense_2_280792:KK$
decoder_dense_2_280794:K'
encoder_output_280797:K#
encoder_output_280799:
identity��'decoder_dense_1/StatefulPartitionedCall�'decoder_dense_2/StatefulPartitionedCall�&encoder_output/StatefulPartitionedCall�
'decoder_dense_1/StatefulPartitionedCallStatefulPartitionedCalldecoder_inputdecoder_dense_1_280787decoder_dense_1_280789*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280629�
'decoder_dense_2/StatefulPartitionedCallStatefulPartitionedCall0decoder_dense_1/StatefulPartitionedCall:output:0decoder_dense_2_280792decoder_dense_2_280794*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280646�
&encoder_output/StatefulPartitionedCallStatefulPartitionedCall0decoder_dense_2/StatefulPartitionedCall:output:0encoder_output_280797encoder_output_280799*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *S
fNRL
J__inference_encoder_output_layer_call_and_return_conditional_losses_280662~
IdentityIdentity/encoder_output/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp(^decoder_dense_1/StatefulPartitionedCall(^decoder_dense_2/StatefulPartitionedCall'^encoder_output/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 2R
'decoder_dense_1/StatefulPartitionedCall'decoder_dense_1/StatefulPartitionedCall2R
'decoder_dense_2/StatefulPartitionedCall'decoder_dense_2/StatefulPartitionedCall2P
&encoder_output/StatefulPartitionedCall&encoder_output/StatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namedecoder_input
�
�
C__inference_decoder_layer_call_and_return_conditional_losses_280899

inputs@
.decoder_dense_1_matmul_readvariableop_resource:K=
/decoder_dense_1_biasadd_readvariableop_resource:K@
.decoder_dense_2_matmul_readvariableop_resource:KK=
/decoder_dense_2_biasadd_readvariableop_resource:K?
-encoder_output_matmul_readvariableop_resource:K<
.encoder_output_biasadd_readvariableop_resource:
identity��&decoder_dense_1/BiasAdd/ReadVariableOp�%decoder_dense_1/MatMul/ReadVariableOp�&decoder_dense_2/BiasAdd/ReadVariableOp�%decoder_dense_2/MatMul/ReadVariableOp�%encoder_output/BiasAdd/ReadVariableOp�$encoder_output/MatMul/ReadVariableOp�
%decoder_dense_1/MatMul/ReadVariableOpReadVariableOp.decoder_dense_1_matmul_readvariableop_resource*
_output_shapes

:K*
dtype0�
decoder_dense_1/MatMulMatMulinputs-decoder_dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������K�
&decoder_dense_1/BiasAdd/ReadVariableOpReadVariableOp/decoder_dense_1_biasadd_readvariableop_resource*
_output_shapes
:K*
dtype0�
decoder_dense_1/BiasAddBiasAdd decoder_dense_1/MatMul:product:0.decoder_dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Kp
decoder_dense_1/ReluRelu decoder_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:���������K�
%decoder_dense_2/MatMul/ReadVariableOpReadVariableOp.decoder_dense_2_matmul_readvariableop_resource*
_output_shapes

:KK*
dtype0�
decoder_dense_2/MatMulMatMul"decoder_dense_1/Relu:activations:0-decoder_dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������K�
&decoder_dense_2/BiasAdd/ReadVariableOpReadVariableOp/decoder_dense_2_biasadd_readvariableop_resource*
_output_shapes
:K*
dtype0�
decoder_dense_2/BiasAddBiasAdd decoder_dense_2/MatMul:product:0.decoder_dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Kp
decoder_dense_2/ReluRelu decoder_dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:���������K�
$encoder_output/MatMul/ReadVariableOpReadVariableOp-encoder_output_matmul_readvariableop_resource*
_output_shapes

:K*
dtype0�
encoder_output/MatMulMatMul"decoder_dense_2/Relu:activations:0,encoder_output/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
%encoder_output/BiasAdd/ReadVariableOpReadVariableOp.encoder_output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
encoder_output/BiasAddBiasAddencoder_output/MatMul:product:0-encoder_output/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������n
IdentityIdentityencoder_output/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp'^decoder_dense_1/BiasAdd/ReadVariableOp&^decoder_dense_1/MatMul/ReadVariableOp'^decoder_dense_2/BiasAdd/ReadVariableOp&^decoder_dense_2/MatMul/ReadVariableOp&^encoder_output/BiasAdd/ReadVariableOp%^encoder_output/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 2P
&decoder_dense_1/BiasAdd/ReadVariableOp&decoder_dense_1/BiasAdd/ReadVariableOp2N
%decoder_dense_1/MatMul/ReadVariableOp%decoder_dense_1/MatMul/ReadVariableOp2P
&decoder_dense_2/BiasAdd/ReadVariableOp&decoder_dense_2/BiasAdd/ReadVariableOp2N
%decoder_dense_2/MatMul/ReadVariableOp%decoder_dense_2/MatMul/ReadVariableOp2N
%encoder_output/BiasAdd/ReadVariableOp%encoder_output/BiasAdd/ReadVariableOp2L
$encoder_output/MatMul/ReadVariableOp$encoder_output/MatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280963

inputs0
matmul_readvariableop_resource:KK-
biasadd_readvariableop_resource:K
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:KK*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Kr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:K*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������KP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������Ka
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������Kw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������K: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������K
 
_user_specified_nameinputs
�
�
C__inference_decoder_layer_call_and_return_conditional_losses_280752

inputs(
decoder_dense_1_280736:K$
decoder_dense_1_280738:K(
decoder_dense_2_280741:KK$
decoder_dense_2_280743:K'
encoder_output_280746:K#
encoder_output_280748:
identity��'decoder_dense_1/StatefulPartitionedCall�'decoder_dense_2/StatefulPartitionedCall�&encoder_output/StatefulPartitionedCall�
'decoder_dense_1/StatefulPartitionedCallStatefulPartitionedCallinputsdecoder_dense_1_280736decoder_dense_1_280738*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280629�
'decoder_dense_2/StatefulPartitionedCallStatefulPartitionedCall0decoder_dense_1/StatefulPartitionedCall:output:0decoder_dense_2_280741decoder_dense_2_280743*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280646�
&encoder_output/StatefulPartitionedCallStatefulPartitionedCall0decoder_dense_2/StatefulPartitionedCall:output:0encoder_output_280746encoder_output_280748*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *S
fNRL
J__inference_encoder_output_layer_call_and_return_conditional_losses_280662~
IdentityIdentity/encoder_output/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp(^decoder_dense_1/StatefulPartitionedCall(^decoder_dense_2/StatefulPartitionedCall'^encoder_output/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 2R
'decoder_dense_1/StatefulPartitionedCall'decoder_dense_1/StatefulPartitionedCall2R
'decoder_dense_2/StatefulPartitionedCall'decoder_dense_2/StatefulPartitionedCall2P
&encoder_output/StatefulPartitionedCall&encoder_output/StatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
0__inference_decoder_dense_2_layer_call_fn_280952

inputs
unknown:KK
	unknown_0:K
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280646o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������K`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������K: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������K
 
_user_specified_nameinputs
�

�
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280646

inputs0
matmul_readvariableop_resource:KK-
biasadd_readvariableop_resource:K
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:KK*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Kr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:K*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������KP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������Ka
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������Kw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������K: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������K
 
_user_specified_nameinputs
�

�
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280943

inputs0
matmul_readvariableop_resource:K-
biasadd_readvariableop_resource:K
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:K*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Kr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:K*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������KP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������Ka
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������Kw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�

�
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280629

inputs0
matmul_readvariableop_resource:K-
biasadd_readvariableop_resource:K
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:K*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������Kr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:K*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������KP
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������Ka
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������Kw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
/__inference_encoder_output_layer_call_fn_280972

inputs
unknown:K
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *S
fNRL
J__inference_encoder_output_layer_call_and_return_conditional_losses_280662o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������K: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������K
 
_user_specified_nameinputs
�
�
__inference__traced_save_281023
file_prefix5
1savev2_decoder_dense_1_kernel_read_readvariableop3
/savev2_decoder_dense_1_bias_read_readvariableop5
1savev2_decoder_dense_2_kernel_read_readvariableop3
/savev2_decoder_dense_2_bias_read_readvariableop4
0savev2_encoder_output_kernel_read_readvariableop2
.savev2_encoder_output_bias_read_readvariableop
savev2_const

identity_1��MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH{
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*!
valueBB B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:01savev2_decoder_dense_1_kernel_read_readvariableop/savev2_decoder_dense_1_bias_read_readvariableop1savev2_decoder_dense_2_kernel_read_readvariableop/savev2_decoder_dense_2_bias_read_readvariableop0savev2_encoder_output_kernel_read_readvariableop.savev2_encoder_output_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
	2�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*G
_input_shapes6
4: :K:K:KK:K:K:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:$ 

_output_shapes

:K: 

_output_shapes
:K:$ 

_output_shapes

:KK: 

_output_shapes
:K:$ 

_output_shapes

:K: 

_output_shapes
::

_output_shapes
: 
�
�
C__inference_decoder_layer_call_and_return_conditional_losses_280669

inputs(
decoder_dense_1_280630:K$
decoder_dense_1_280632:K(
decoder_dense_2_280647:KK$
decoder_dense_2_280649:K'
encoder_output_280663:K#
encoder_output_280665:
identity��'decoder_dense_1/StatefulPartitionedCall�'decoder_dense_2/StatefulPartitionedCall�&encoder_output/StatefulPartitionedCall�
'decoder_dense_1/StatefulPartitionedCallStatefulPartitionedCallinputsdecoder_dense_1_280630decoder_dense_1_280632*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280629�
'decoder_dense_2/StatefulPartitionedCallStatefulPartitionedCall0decoder_dense_1/StatefulPartitionedCall:output:0decoder_dense_2_280647decoder_dense_2_280649*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280646�
&encoder_output/StatefulPartitionedCallStatefulPartitionedCall0decoder_dense_2/StatefulPartitionedCall:output:0encoder_output_280663encoder_output_280665*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *S
fNRL
J__inference_encoder_output_layer_call_and_return_conditional_losses_280662~
IdentityIdentity/encoder_output/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp(^decoder_dense_1/StatefulPartitionedCall(^decoder_dense_2/StatefulPartitionedCall'^encoder_output/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 2R
'decoder_dense_1/StatefulPartitionedCall'decoder_dense_1/StatefulPartitionedCall2R
'decoder_dense_2/StatefulPartitionedCall'decoder_dense_2/StatefulPartitionedCall2P
&encoder_output/StatefulPartitionedCall&encoder_output/StatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
$__inference_signature_wrapper_280841
decoder_input
unknown:K
	unknown_0:K
	unknown_1:KK
	unknown_2:K
	unknown_3:K
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCalldecoder_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8� **
f%R#
!__inference__wrapped_model_280611o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namedecoder_input
�	
�
J__inference_encoder_output_layer_call_and_return_conditional_losses_280982

inputs0
matmul_readvariableop_resource:K-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:K*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������K: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������K
 
_user_specified_nameinputs
�
�
(__inference_decoder_layer_call_fn_280875

inputs
unknown:K
	unknown_0:K
	unknown_1:KK
	unknown_2:K
	unknown_3:K
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8� *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_280752o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
0__inference_decoder_dense_1_layer_call_fn_280932

inputs
unknown:K
	unknown_0:K
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280629o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������K`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
"__inference__traced_restore_281051
file_prefix9
'assignvariableop_decoder_dense_1_kernel:K5
'assignvariableop_1_decoder_dense_1_bias:K;
)assignvariableop_2_decoder_dense_2_kernel:KK5
'assignvariableop_3_decoder_dense_2_bias:K:
(assignvariableop_4_encoder_output_kernel:K4
&assignvariableop_5_encoder_output_bias:

identity_7��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_2�AssignVariableOp_3�AssignVariableOp_4�AssignVariableOp_5�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH~
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*!
valueBB B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*0
_output_shapes
:::::::*
dtypes
	2[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOp'assignvariableop_decoder_dense_1_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOp'assignvariableop_1_decoder_dense_1_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp)assignvariableop_2_decoder_dense_2_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp'assignvariableop_3_decoder_dense_2_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp(assignvariableop_4_encoder_output_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_5AssignVariableOp&assignvariableop_5_encoder_output_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 �

Identity_6Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^NoOp"/device:CPU:0*
T0*
_output_shapes
: U

Identity_7IdentityIdentity_6:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5*"
_acd_function_control_output(*
_output_shapes
 "!

identity_7Identity_7:output:0*!
_input_shapes
: : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_5:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�	
�
J__inference_encoder_output_layer_call_and_return_conditional_losses_280662

inputs0
matmul_readvariableop_resource:K-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:K*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������K: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������K
 
_user_specified_nameinputs
�
�
C__inference_decoder_layer_call_and_return_conditional_losses_280822
decoder_input(
decoder_dense_1_280806:K$
decoder_dense_1_280808:K(
decoder_dense_2_280811:KK$
decoder_dense_2_280813:K'
encoder_output_280816:K#
encoder_output_280818:
identity��'decoder_dense_1/StatefulPartitionedCall�'decoder_dense_2/StatefulPartitionedCall�&encoder_output/StatefulPartitionedCall�
'decoder_dense_1/StatefulPartitionedCallStatefulPartitionedCalldecoder_inputdecoder_dense_1_280806decoder_dense_1_280808*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280629�
'decoder_dense_2/StatefulPartitionedCallStatefulPartitionedCall0decoder_dense_1/StatefulPartitionedCall:output:0decoder_dense_2_280811decoder_dense_2_280813*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������K*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *T
fORM
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280646�
&encoder_output/StatefulPartitionedCallStatefulPartitionedCall0decoder_dense_2/StatefulPartitionedCall:output:0encoder_output_280816encoder_output_280818*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8� *S
fNRL
J__inference_encoder_output_layer_call_and_return_conditional_losses_280662~
IdentityIdentity/encoder_output/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp(^decoder_dense_1/StatefulPartitionedCall(^decoder_dense_2/StatefulPartitionedCall'^encoder_output/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 2R
'decoder_dense_1/StatefulPartitionedCall'decoder_dense_1/StatefulPartitionedCall2R
'decoder_dense_2/StatefulPartitionedCall'decoder_dense_2/StatefulPartitionedCall2P
&encoder_output/StatefulPartitionedCall&encoder_output/StatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namedecoder_input
�"
�
!__inference__wrapped_model_280611
decoder_inputH
6decoder_decoder_dense_1_matmul_readvariableop_resource:KE
7decoder_decoder_dense_1_biasadd_readvariableop_resource:KH
6decoder_decoder_dense_2_matmul_readvariableop_resource:KKE
7decoder_decoder_dense_2_biasadd_readvariableop_resource:KG
5decoder_encoder_output_matmul_readvariableop_resource:KD
6decoder_encoder_output_biasadd_readvariableop_resource:
identity��.decoder/decoder_dense_1/BiasAdd/ReadVariableOp�-decoder/decoder_dense_1/MatMul/ReadVariableOp�.decoder/decoder_dense_2/BiasAdd/ReadVariableOp�-decoder/decoder_dense_2/MatMul/ReadVariableOp�-decoder/encoder_output/BiasAdd/ReadVariableOp�,decoder/encoder_output/MatMul/ReadVariableOp�
-decoder/decoder_dense_1/MatMul/ReadVariableOpReadVariableOp6decoder_decoder_dense_1_matmul_readvariableop_resource*
_output_shapes

:K*
dtype0�
decoder/decoder_dense_1/MatMulMatMuldecoder_input5decoder/decoder_dense_1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������K�
.decoder/decoder_dense_1/BiasAdd/ReadVariableOpReadVariableOp7decoder_decoder_dense_1_biasadd_readvariableop_resource*
_output_shapes
:K*
dtype0�
decoder/decoder_dense_1/BiasAddBiasAdd(decoder/decoder_dense_1/MatMul:product:06decoder/decoder_dense_1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������K�
decoder/decoder_dense_1/ReluRelu(decoder/decoder_dense_1/BiasAdd:output:0*
T0*'
_output_shapes
:���������K�
-decoder/decoder_dense_2/MatMul/ReadVariableOpReadVariableOp6decoder_decoder_dense_2_matmul_readvariableop_resource*
_output_shapes

:KK*
dtype0�
decoder/decoder_dense_2/MatMulMatMul*decoder/decoder_dense_1/Relu:activations:05decoder/decoder_dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������K�
.decoder/decoder_dense_2/BiasAdd/ReadVariableOpReadVariableOp7decoder_decoder_dense_2_biasadd_readvariableop_resource*
_output_shapes
:K*
dtype0�
decoder/decoder_dense_2/BiasAddBiasAdd(decoder/decoder_dense_2/MatMul:product:06decoder/decoder_dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������K�
decoder/decoder_dense_2/ReluRelu(decoder/decoder_dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:���������K�
,decoder/encoder_output/MatMul/ReadVariableOpReadVariableOp5decoder_encoder_output_matmul_readvariableop_resource*
_output_shapes

:K*
dtype0�
decoder/encoder_output/MatMulMatMul*decoder/decoder_dense_2/Relu:activations:04decoder/encoder_output/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
-decoder/encoder_output/BiasAdd/ReadVariableOpReadVariableOp6decoder_encoder_output_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
decoder/encoder_output/BiasAddBiasAdd'decoder/encoder_output/MatMul:product:05decoder/encoder_output/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������v
IdentityIdentity'decoder/encoder_output/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp/^decoder/decoder_dense_1/BiasAdd/ReadVariableOp.^decoder/decoder_dense_1/MatMul/ReadVariableOp/^decoder/decoder_dense_2/BiasAdd/ReadVariableOp.^decoder/decoder_dense_2/MatMul/ReadVariableOp.^decoder/encoder_output/BiasAdd/ReadVariableOp-^decoder/encoder_output/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 2`
.decoder/decoder_dense_1/BiasAdd/ReadVariableOp.decoder/decoder_dense_1/BiasAdd/ReadVariableOp2^
-decoder/decoder_dense_1/MatMul/ReadVariableOp-decoder/decoder_dense_1/MatMul/ReadVariableOp2`
.decoder/decoder_dense_2/BiasAdd/ReadVariableOp.decoder/decoder_dense_2/BiasAdd/ReadVariableOp2^
-decoder/decoder_dense_2/MatMul/ReadVariableOp-decoder/decoder_dense_2/MatMul/ReadVariableOp2^
-decoder/encoder_output/BiasAdd/ReadVariableOp-decoder/encoder_output/BiasAdd/ReadVariableOp2\
,decoder/encoder_output/MatMul/ReadVariableOp,decoder/encoder_output/MatMul/ReadVariableOp:V R
'
_output_shapes
:���������
'
_user_specified_namedecoder_input
�
�
(__inference_decoder_layer_call_fn_280858

inputs
unknown:K
	unknown_0:K
	unknown_1:KK
	unknown_2:K
	unknown_3:K
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8� *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_280669o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
(__inference_decoder_layer_call_fn_280684
decoder_input
unknown:K
	unknown_0:K
	unknown_1:KK
	unknown_2:K
	unknown_3:K
	unknown_4:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCalldecoder_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*(
_read_only_resource_inputs

*0
config_proto 

CPU

GPU2*0J 8� *L
fGRE
C__inference_decoder_layer_call_and_return_conditional_losses_280669o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:���������: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:V R
'
_output_shapes
:���������
'
_user_specified_namedecoder_input"�	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
G
decoder_input6
serving_default_decoder_input:0���������B
encoder_output0
StatefulPartitionedCall:0���������tensorflow/serving/predict:�e
�
layer-0
layer_with_weights-0
layer-1
layer_with_weights-1
layer-2
layer_with_weights-2
layer-3
	variables
trainable_variables
regularization_losses
	keras_api
	__call__
*
&call_and_return_all_conditional_losses
_default_save_signature

signatures"
_tf_keras_network
"
_tf_keras_input_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
�
	variables
trainable_variables
regularization_losses
 	keras_api
!__call__
*"&call_and_return_all_conditional_losses

#kernel
$bias"
_tf_keras_layer
J
0
1
2
3
#4
$5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
%non_trainable_variables

&layers
'metrics
(layer_regularization_losses
)layer_metrics
	variables
trainable_variables
regularization_losses
	__call__
_default_save_signature
*
&call_and_return_all_conditional_losses
&
"call_and_return_conditional_losses"
_generic_user_object
�
*trace_0
+trace_1
,trace_2
-trace_32�
(__inference_decoder_layer_call_fn_280684
(__inference_decoder_layer_call_fn_280858
(__inference_decoder_layer_call_fn_280875
(__inference_decoder_layer_call_fn_280784�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z*trace_0z+trace_1z,trace_2z-trace_3
�
.trace_0
/trace_1
0trace_2
1trace_32�
C__inference_decoder_layer_call_and_return_conditional_losses_280899
C__inference_decoder_layer_call_and_return_conditional_losses_280923
C__inference_decoder_layer_call_and_return_conditional_losses_280803
C__inference_decoder_layer_call_and_return_conditional_losses_280822�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z.trace_0z/trace_1z0trace_2z1trace_3
�B�
!__inference__wrapped_model_280611decoder_input"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
,
2serving_default"
signature_map
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
3non_trainable_variables

4layers
5metrics
6layer_regularization_losses
7layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
8trace_02�
0__inference_decoder_dense_1_layer_call_fn_280932�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z8trace_0
�
9trace_02�
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280943�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z9trace_0
(:&K2decoder_dense_1/kernel
": K2decoder_dense_1/bias
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
:non_trainable_variables

;layers
<metrics
=layer_regularization_losses
>layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
?trace_02�
0__inference_decoder_dense_2_layer_call_fn_280952�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z?trace_0
�
@trace_02�
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280963�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z@trace_0
(:&KK2decoder_dense_2/kernel
": K2decoder_dense_2/bias
.
#0
$1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
Anon_trainable_variables

Blayers
Cmetrics
Dlayer_regularization_losses
Elayer_metrics
	variables
trainable_variables
regularization_losses
!__call__
*"&call_and_return_all_conditional_losses
&""call_and_return_conditional_losses"
_generic_user_object
�
Ftrace_02�
/__inference_encoder_output_layer_call_fn_280972�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zFtrace_0
�
Gtrace_02�
J__inference_encoder_output_layer_call_and_return_conditional_losses_280982�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zGtrace_0
':%K2encoder_output/kernel
!:2encoder_output/bias
J
0
1
2
3
#4
$5"
trackable_list_wrapper
<
0
1
2
3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
(__inference_decoder_layer_call_fn_280684decoder_input"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
(__inference_decoder_layer_call_fn_280858inputs"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
(__inference_decoder_layer_call_fn_280875inputs"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
(__inference_decoder_layer_call_fn_280784decoder_input"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_decoder_layer_call_and_return_conditional_losses_280899inputs"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_decoder_layer_call_and_return_conditional_losses_280923inputs"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_decoder_layer_call_and_return_conditional_losses_280803decoder_input"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_decoder_layer_call_and_return_conditional_losses_280822decoder_input"�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
$__inference_signature_wrapper_280841decoder_input"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_decoder_dense_1_layer_call_fn_280932inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280943inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
0__inference_decoder_dense_2_layer_call_fn_280952inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280963inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
.
#0
$1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
/__inference_encoder_output_layer_call_fn_280972inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
J__inference_encoder_output_layer_call_and_return_conditional_losses_280982inputs"�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 �
!__inference__wrapped_model_280611�#$6�3
,�)
'�$
decoder_input���������
� "?�<
:
encoder_output(�%
encoder_output����������
K__inference_decoder_dense_1_layer_call_and_return_conditional_losses_280943\/�,
%�"
 �
inputs���������
� "%�"
�
0���������K
� �
0__inference_decoder_dense_1_layer_call_fn_280932O/�,
%�"
 �
inputs���������
� "����������K�
K__inference_decoder_dense_2_layer_call_and_return_conditional_losses_280963\/�,
%�"
 �
inputs���������K
� "%�"
�
0���������K
� �
0__inference_decoder_dense_2_layer_call_fn_280952O/�,
%�"
 �
inputs���������K
� "����������K�
C__inference_decoder_layer_call_and_return_conditional_losses_280803o#$>�;
4�1
'�$
decoder_input���������
p 

 
� "%�"
�
0���������
� �
C__inference_decoder_layer_call_and_return_conditional_losses_280822o#$>�;
4�1
'�$
decoder_input���������
p

 
� "%�"
�
0���������
� �
C__inference_decoder_layer_call_and_return_conditional_losses_280899h#$7�4
-�*
 �
inputs���������
p 

 
� "%�"
�
0���������
� �
C__inference_decoder_layer_call_and_return_conditional_losses_280923h#$7�4
-�*
 �
inputs���������
p

 
� "%�"
�
0���������
� �
(__inference_decoder_layer_call_fn_280684b#$>�;
4�1
'�$
decoder_input���������
p 

 
� "�����������
(__inference_decoder_layer_call_fn_280784b#$>�;
4�1
'�$
decoder_input���������
p

 
� "�����������
(__inference_decoder_layer_call_fn_280858[#$7�4
-�*
 �
inputs���������
p 

 
� "�����������
(__inference_decoder_layer_call_fn_280875[#$7�4
-�*
 �
inputs���������
p

 
� "�����������
J__inference_encoder_output_layer_call_and_return_conditional_losses_280982\#$/�,
%�"
 �
inputs���������K
� "%�"
�
0���������
� �
/__inference_encoder_output_layer_call_fn_280972O#$/�,
%�"
 �
inputs���������K
� "�����������
$__inference_signature_wrapper_280841�#$G�D
� 
=�:
8
decoder_input'�$
decoder_input���������"?�<
:
encoder_output(�%
encoder_output���������