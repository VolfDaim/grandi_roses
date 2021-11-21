#version 430

out  vec4 fragColor;

uniform vec2 resolution;
uniform float time;

uniform float count_l;

void main() {
    float k = 0.2;
    float x = 0;
    float y = 0;
    float r = 0;
    vec2 uv = (gl_FragCoord.xy - 0.5*resolution.xy)/resolution.y;
    vec3 col = vec3(0.0);

    float a = 0;
    for (float a=0.0;a<15.0;a+=0.1){
        float change = (sin(time)*0.5+0.5)+0.3;
        a+=change;
        r = 2*sin(count_l*a);
        x = r*k*cos(a);
        y = r*k*sin(a);

        col+=0.001/length(uv-vec2(x, y));
    }

    fragColor = vec4(col, 1.0);
}
