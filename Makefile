# SDL_mixer-VITA port by enrique.somolinos

TARGET_LIB = libSDL2_mixer.a
OBJS= dynamic_flac.o \
      dynamic_fluidsynth.o \
      dynamic_mod.o \
      dynamic_modplug.o \
      dynamic_mp3.o \
      dynamic_ogg.o \
      effect_position.o \
      effect_stereoreverse.o \
      effects_internal.o \
      fluidsynth.o \
      load_aiff.o \
      load_flac.o \
      load_ogg.o \
      load_voc.o \
      mixer.o \
	  music.o \
	  music_cmd.o \
	  music_flac.o \
	  music_mad.o \
	  music_mod.o \
	  music_modplug.o \
      music_ogg.o  \
	  playmus.o \
	  playwave.o \
	  wavestream.o 

PREFIX  = arm-vita-eabi
CC      = $(PREFIX)-gcc
AR      = $(PREFIX)-gcc-ar
CFLAGS  = -Wl,-q -Wall -O3 -Iinclude
ASFLAGS = $(CFLAGS)

LIBS +=  -lSDL2  

$(TARGET_LIB): $(OBJS)
	$(AR) rcs $@ $^ 

clean:
	@rm -rf $(TARGET_LIB) $(OBJS)

install: $(TARGET_LIB)
	@cp  $(TARGET_LIB) $(VITASDK)/arm-vita-eabi/lib
	@mkdir -p "$(VITASDK)/arm-vita-eabi/include/SDL2_mixer"
	@cp *.h "$(VITASDK)/arm-vita-eabi/include/SDL2_mixer"
	@echo "Installed!"

