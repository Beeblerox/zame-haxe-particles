package org.zamedev.particles.renderers;

import openfl.display.OpenGLView;

class DefaultParticleRenderer {
    public static function createInstance():ParticleSystemRenderer {
        #if (html5 && dom)
            if (OpenGLView.isSupported) {
                return new GLViewParticleRenderer();
            } else {
                return new DrawTilesParticleRenderer();
            }
        #elseif flash
            return new SpritesParticleRenderer();
        #else
            return new DrawTilesParticleRenderer();
        #end
    }
}
