#include "Object3d.hlsli"

struct TransformMatrix
{
    float32_t4x4 WVP;
    float32_t4x4 World;
};
ConstantBuffer<TransformMatrix> gTransformMatrix : register(b0);

struct VertexShaderInput
{
    float32_t4 position : POSITION0;
    float32_t2 texcord : TEXCOORD0;
    float32_t3 normal : NORMAL0;
};

VertexShaderOutput main(VertexShaderInput input)
{
    VertexShaderOutput output;
    output.position = mul(input.position, gTransformMatrix.WVP);
    output.texcord = input.texcord;
	return output;
}


