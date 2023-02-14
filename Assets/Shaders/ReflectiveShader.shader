Shader "Custom/ReflectiveShader"
{
   Properties
	{
		_myColor("Sample Color", Color) = (1,1,1,1)
		_myRange("Sample Range", Range(0, 5)) = 1
		_myTex("Sample Texture", 2D) = "white" {}
		_myCube("Sample Cube", CUBE) = "" {}
	}

		SubShader
		{
			CGPROGRAM
			#pragma surface surf Lambert

			fixed4 _myColor;
			half _myRange;
			sampler2D _myTex;
			samplerCUBE _myCube;

			struct Input
			{
				float2 uv_myTex;
				float3 worldRefl; // world space reflection vector
			};

			void surf(Input IN, inout SurfaceOutput o)
			{
				o.Albedo = (tex2D(_myTex, IN.uv_myTex) * _myRange).rgb; // sample the texture
				o.Emission = texCUBE(_myCube, IN.worldRefl).rgb; // sample the cube
			}

			ENDCG
		}
			FallBack "Diffuse"
}
