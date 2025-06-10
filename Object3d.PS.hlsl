struct Material
{
    float32_t4 color;
};

ConstantBuffer<Material> gMatterial : register(b0);

struct PixelShaderOutput
{
    float32_t4 color : SV_Target0;
};

PixelShaderOutput main()
{
    PixelShaderOutput output;
    output.color = gMatterial.color;
	return output;
}