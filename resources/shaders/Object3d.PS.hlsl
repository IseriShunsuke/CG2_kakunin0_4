#include "Object3d.hlsli"

struct Material
{
    float32_t4 color;
};

Texture2D<float32_t4> gtexture : register(t0);

SamplerState gsampler : register(s0);

ConstantBuffer<Material> gMatterial : register(b0);

struct PixelShaderOutput
{
    float32_t4 color : SV_Target0;
};

PixelShaderOutput main(VertexShaderOutput input)
{
    float32_t4 textureColor = gtexture.Sample(gsampler, input.texcord);
    PixelShaderOutput output;
    output.color = gMatterial.color * textureColor;
	return output;
}