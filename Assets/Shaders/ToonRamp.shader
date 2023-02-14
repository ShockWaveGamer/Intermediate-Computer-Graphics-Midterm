Shader "Custom/ToonRamp"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _RampTex("Ramp Texture", 2D) = "white" {}
		_MainTex("Main Texture", 2D) = "white" {}
		_Range("Ramp Intensity", Range(0, 1)) = 1
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf ToonRamp

        float4 _Color;
        sampler2D _RampTex;
		sampler2D _MainTex;
        float _Range;
		
        float4 LightingToonRamp(SurfaceOutput s, float3 lightDir, float atten) {
            float diff = dot(s.Normal, lightDir); // dot product of the light direction and the view direction
            float h = diff * 0.5 + 0.5; 
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb; //sets the ramp to the ramp texture at the position of the modified dot product

            float4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * ramp * _Range; //sets the toonRamp reflection (_Range) intensity. How bright does the effect appear.
            c.a = s.Alpha; 
            return c;
        }

        struct Input {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * _Color.rgb; // sets the albedo to the main texture
        }

        ENDCG
    }
    FallBack "Diffuse"
}