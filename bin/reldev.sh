#!/bin/bash


if [ "_$1" = "_REL" ] ; then

        rm ios/taudio-waa_native/libtaudio_waa_native.a
        ln -s ../../rust/target/universal/release/libtaudio_waa_native.a ios/taudio-waa_native/libtaudio_waa_native.a

        exit 0

#========================================================================================================================================================================================================


elif [ "_$1" = "_DEV" ]; then

        rm ios/taudio-waa_native/libtaudio_waa_native.a
        ln -s ../../rust/target/universal/debug/libtaudio_waa_native.a ios/taudio-waa_native/libtaudio_waa_native.a

        exit 0

else
        echo "Correct syntax is $0 [REL | DEV]"
        exit -1
fi
echo "Done"
exit 0

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if [ "_$1" = "_REL" ] ; then


        gsed -i  "s/^ *implementation project(':flutter_sound_core')$/    \/\/ implementation project(':flutter_sound_core')/" flutter_sound/example/android/app/build.gradle


        gsed -i  "s/^ *project(':flutter_sound_core').projectDir\(.*\)$/\/\/ project(':flutter_sound_core').projectDir\1/" flutter_sound/example/android/settings.gradle

        gsed -i  "s/^ *include 'flutter_sound_core'$/\/\/ include 'flutter_sound_core'/" flutter_sound/example/android/settings.gradle

        gsed -i  "s/^ *project(':flutter_sound_core').projectDir = /\/\/project(':flutter_sound_core').projectDir = /" flutter_sound/android/settings.gradle

        gsed -i  "s/^ *\(implementation project(':flutter_sound_core'\)/    \/\/\1/" flutter_sound/android/build.gradle

         gsed -i  "s/^ *\/\/ *implementation 'com.github.canardoux:flutter_sound_core:/    implementation 'com.github.canardoux:flutter_sound_core:/"  flutter_sound/android/build.gradle






        gsed -i  "s/^ *pod 'flutter_sound_core',\(.*\)$/# pod 'flutter_sound_core',\1/"  flutter_sound/example/ios/Podfile

        gsed -i  "s/^\(<\!-- static\) -->$/\1/" flutter_sound/example/web/index.html
        gsed -i  "s/^\(<\!-- dynamic\)$/\1 -->/" flutter_sound/example/web/index.html

# flutter_sound_web/pubspec.yaml
#-------------------------------
        gsed -i  "s/^ *flutter_sound_platform_interface: *#* *\(.*\)$/  flutter_sound_platform_interface: \1/"                                                          flutter_sound_web/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/flutter_sound_platform_interface # Flutter Sound Dir$/#    path: \.\.\/flutter_sound_platform_interface # Flutter Sound Dir/"            flutter_sound_web/pubspec.yaml

# ---

        gsed -i  "s/^ *flauto_platform_interface: *#* *\(.*\)$/  flauto_platform_interface: \1/"                                                                        flutter_sound_web/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/flauto_platform_interface # Flutter Sound Dir$/#    path: \.\.\/flauto_platform_interface # Flutter Sound Dir/"                      flutter_sound_web/pubspec.yaml



# flutter_sound/pubspec.yaml
#---------------------------
        gsed -i  "s/^ *flutter_sound_platform_interface: *#* *\(.*\)$/  flutter_sound_platform_interface: \1/"                                                          flutter_sound/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/flutter_sound_platform_interface # Flutter Sound Dir$/#    path: \.\.\/flutter_sound_platform_interface # Flutter Sound Dir/"        flutter_sound/pubspec.yaml
        gsed -i  "s/^ *flutter_sound_web: *#* *\(.*\)$/  flutter_sound_web: \1/"                                                                                        flutter_sound/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/flutter_sound_web # Flutter Sound Dir$/#    path: \.\.\/flutter_sound_web # Flutter Sound Dir/"                                       flutter_sound/pubspec.yaml


# ---
        gsed -i  "s/^ *flauto_platform_interface: *#* *\(.*\)$/  flauto_platform_interface: \1/"                                                                        flutter_sound/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/flauto_platform_interface # Flutter Sound Dir$/#    path: \.\.\/flauto_platform_interface # Flutter Sound Dir/"                      flutter_sound/pubspec.yaml
        gsed -i  "s/^ *flauto_web: *#* *\(.*\)$/  flauto_web: \1/"                                                                                                      flutter_sound/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/flauto_web # Flutter Sound Dir$/#    path: \.\.\/flauto_web # Flutter Sound Dir/"                                                    flutter_sound/pubspec.yaml




# flutter_sound/example/pubspec.yaml
#-----------------------------------
        gsed -i  "s/^ *flutter_sound: *#* *\(.*\)$/  flutter_sound: \1/"                                                                                                flutter_sound/example/pubspec.yaml
        gsed -i  "s/^ *flutter_sound_lite: *#* *\(.*\)$/  flutter_sound_lite: \1/"                                                                                      flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *path: \.\.\/ # Flutter Sound Dir$/#    path: \.\.\/ # Flutter Sound Dir/"                                                                        flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *#* *flutter_sound_platform_interface: *#* *\(.*\)$/#  flutter_sound_platform_interface: \1/"                                                     flutter_sound/example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/flutter_sound_platform_interface # flutter_sound_platform_interface Dir$/#    path: \.\.\/\.\.\/flutter_sound_platform_interface # flutter_sound_platform_interface Dir/" flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *#* *flutter_sound_web: *#* *\(.*\)$/#  flutter_sound_web: \1/"                                                                                   flutter_sound/example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/flutter_sound_web # flutter_sound_web Dir$/#    path: \.\.\/\.\.\/flutter_sound_web # flutter_sound_web Dir/"                  flutter_sound/example/pubspec.yaml

# ---

        gsed -i  "s/^ *flauto: *#* *\(.*\)$/  flauto: \1/"                                                                                                flutter_sound/example/pubspec.yaml
        gsed -i  "s/^ *flauto_lite: *#* *\(.*\)$/  flauto_lite: \1/"                                                                                      flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *#* *flauto_platform_interface: *#* *\(.*\)$/#  flauto_platform_interface: \1/"                                                     flutter_sound/example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/flauto_platform_interface # flauto_platform_interface Dir$/#    path: \.\.\/\.\.\/flauto_platform_interface # flauto_platform_interface Dir/" flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *#* *flauto_web: *#* *\(.*\)$/#  flauto_web: \1/"                                                                                   flutter_sound/example/pubspec.yaml
        gsed -i  "s/^ *path: \.\.\/\.\.\/flauto_web # flutter_sound_web Dir$/#    path: \.\.\/\.\.\/flauto_web # flutter_sound_web Dir/"                  flutter_sound/example/pubspec.yaml


        exit 0

#========================================================================================================================================================================================================


elif [ "_$1" = "_DEV" ]; then
        echo 'DEV mode'
        echo '--------'




        gsed -i  "s/^ *\/\/ implementation project(':flutter_sound_core')$/    implementation project(':flutter_sound_core')/" flutter_sound/example/android/app/build.gradle


        gsed -i  "s/^ *\/\/ *project(':flutter_sound_core').projectDir\(.*\)$/   project(':flutter_sound_core').projectDir\1/" flutter_sound/example/android/settings.gradle

        gsed -i  "s/^ *\/\/ *include 'flutter_sound_core'$/   include 'flutter_sound_core'/" flutter_sound/example/android/settings.gradle

        gsed -i  "s/^ *\/\/ *project(':flutter_sound_core').projectDir = /    project(':flutter_sound_core').projectDir = /" flutter_sound/android/settings.gradle


        gsed -i  "s/^\( *implementation [^\/]*\/\/ Tau Core\)$/\/\/\1/"  flutter_sound/android/build.gradle



        gsed -i  "s/^ *\/\/ *\(implementation project(':flutter_sound_core'\)/    \1/" flutter_sound/android/build.gradle



         gsed -i  "s/^ *implementation 'xyz.canardoux:flutter_sound_core:/    \/\/implementation 'xyz.canardoux:flutter_sound_core:/"  flutter_sound/android/build.gradle





        gsed -i  "s/^ *# pod 'flutter_sound_core',\(.*\)$/pod 'flutter_sound_core',\1/" flutter_sound/example/ios/Podfile

        gsed -i  "s/^\( *<\!-- dynamic\) -->$/\1/" flutter_sound/example/web/index.html
        gsed -i  "s/^\( *<\!-- static\)$/\1 -->/" flutter_sound/example/web/index.html

# flutter_sound_web/pubspec.yaml
#-------------------------------
        gsed -i  "s/^ *flutter_sound_platform_interface: *#* *\(.*\)$/  flutter_sound_platform_interface: # \1/"                                                         flutter_sound_web/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/flutter_sound_platform_interface # Flutter Sound Dir$/    path: \.\.\/flutter_sound_platform_interface # Flutter Sound Dir/"            flutter_sound_web/pubspec.yaml

# ---

        gsed -i  "s/^ *flauto_platform_interface: *#* *\(.*\)$/  flauto_platform_interface: # \1/"                                                         flutter_sound_web/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/flauto_platform_interface # Flutter Sound Dir$/    path: \.\.\/flauto_platform_interface # Flutter Sound Dir/"            flutter_sound_web/pubspec.yaml


# flutter_sound/pubspec.yaml
#---------------------------
        gsed -i  "s/^ *flutter_sound_platform_interface: *#* *\(.*\)$/  flutter_sound_platform_interface: # \1/"                                                        flutter_sound/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/flutter_sound_platform_interface # Flutter Sound Dir$/    path: \.\.\/flutter_sound_platform_interface # Flutter Sound Dir/"        flutter_sound/pubspec.yaml
        gsed -i  "s/^ *flutter_sound_web: *#* *\(.*\)$/  flutter_sound_web: # \1/"                                                                                      flutter_sound/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/flutter_sound_web # Flutter Sound Dir$/    path: \.\.\/flutter_sound_web # Flutter Sound Dir/"                                      flutter_sound/pubspec.yaml

# ---

        gsed -i  "s/^ *flauto_platform_interface: *#* *\(.*\)$/  flauto_platform_interface: # \1/"                                                        flutter_sound/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/flauto_platform_interface # Flutter Sound Dir$/    path: \.\.\/flauto_platform_interface # Flutter Sound Dir/"        flutter_sound/pubspec.yaml
        gsed -i  "s/^ *flauto_web: *#* *\(.*\)$/  flauto_web: # \1/" flutter_sound/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/flauto_web # Flutter Sound Dir$/    path: \.\.\/flauto_web # Flutter Sound Dir/"                                      flutter_sound/pubspec.yaml

# flutter_sound/example/pubspec.yaml
#-----------------------------------
        gsed -i  "s/^ *flutter_sound: *#* *\(.*\)$/  flutter_sound: # \1/"                                                                                              flutter_sound/example/pubspec.yaml
        gsed -i  "s/^ *flutter_sound_lite: *#* *\(.*\)$/  flutter_sound_lite: # \1/"                                                                                    flutter_sound/example/pubspec.yaml

        gsed -i  "s/^# *path: \.\.\/ # Flutter Sound Dir$/    path: \.\.\/ # Flutter Sound Dir/"                                                                        flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *#* *flutter_sound_platform_interface: *#* *\(.*\)$/  flutter_sound_platform_interface: # \1/"                                                    flutter_sound/example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/flutter_sound_platform_interface # flutter_sound_platform_interface Dir$/    path: \.\.\/\.\.\/flutter_sound_platform_interface # flutter_sound_platform_interface Dir/" flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *#* *flutter_sound_web: *#* *\(.*\)$/  flutter_sound_web: # \1/"                                                                                  flutter_sound/example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/flutter_sound_web # flutter_sound_web Dir$/    path: \.\.\/\.\.\/flutter_sound_web # flutter_sound_web Dir/"                  flutter_sound/example/pubspec.yaml

# ---

        gsed -i  "s/^ *flauto: *#* *\(.*\)$/  flauto: # \1/"                                                                                              flutter_sound/example/pubspec.yaml
        gsed -i  "s/^ *flauto_lite: *#* *\(.*\)$/  flauto_lite: # \1/"                                                                                    flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *#* *flauto_platform_interface: *#* *\(.*\)$/  flauto_platform_interface: # \1/"                                                    flutter_sound/example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/flauto_platform_interface # flauto_platform_interface Dir$/    path: \.\.\/\.\.\/flauto_platform_interface # flauto_platform_interface Dir/" flutter_sound/example/pubspec.yaml

        gsed -i  "s/^ *#* *flauto_web: *#* *\(.*\)$/  flauto_web: # \1/"                                                                                  flutter_sound/example/pubspec.yaml
        gsed -i  "s/^# *path: \.\.\/\.\.\/flauto_web # flutter_sound_web Dir$/    path: \.\.\/\.\.\/flauto_web # flutter_sound_web Dir/"                  flutter_sound/example/pubspec.yaml


        exit 0

else
        echo "Correct syntax is $0 [REL | DEV]"
        exit -1
fi
echo "Done"
