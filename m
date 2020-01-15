Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD77213B64E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 01:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgAOACL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 14 Jan 2020 19:02:11 -0500
Received: from www.linuxtv.org ([130.149.80.248]:48874 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728656AbgAOACL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 19:02:11 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1irW7T-009Ywe-Ph; Wed, 15 Jan 2020 00:01:12 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1irW9U-0005OY-T9; Wed, 15 Jan 2020 00:03:17 +0000
Date:   Wed, 15 Jan 2020 00:03:16 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <659134945.14.1579046596894.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #72
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/72/display/redirect?page=changes>

Changes:

[laurent.pinchart] meson.build: Switch to C++14

[laurent.pinchart] libcamera: Switch from utils::make_unique to std::make_unique


------------------------------------------
Started by an SCM change
Running as SYSTEM
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision acf18e4265dec2991e62f7c8baecfacf1a6708b3 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f acf18e4265dec2991e62f7c8baecfacf1a6708b3 # timeout=10
Commit message: "libcamera: Switch from utils::make_unique to std::make_unique"
 > git rev-list --no-walk 055335bf49dbcb8c149bdcd4e96004c68e6b6ece # timeout=10
[libcamera] $ /bin/sh -xe /tmp/jenkins2777310540601637282.sh
+ meson build -Dandroid=true
Directory already configured.

Just run your build command (e.g. ninja) and Meson will regenerate as necessary.
If ninja fails, run "ninja reconfigure" or "meson --reconfigure"
to force Meson to regenerate.

If build failures persist, run "meson setup --wipe" to rebuild from scratch
using the same options as passed when configuring the build.
To change option values, run "meson configure" instead.
+ cd build
+ ninja
[0/1] Regenerating build files.
The Meson build system
Version: 0.49.2
Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
Build type: native build
Project name: libcamera
Project version: 0.0.0
Native C compiler: ccache cc (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
Native C++ compiler: ccache c++ (gcc 8.3.0 "c++ (Debian 8.3.0-6) 8.3.0")
Build machine cpu family: x86_64
Build machine cpu: x86_64
Header <execinfo.h> has symbol "backtrace" : YES
Header <stdlib.h> has symbol "secure_getenv" : YES
Configuring version.h using configuration
Dependency libudev found: YES (cached)
Library atomic found: YES
Library dl found: YES
Dependency threads found: YES (cached)
WARNING: rcc dependencies will not work reliably until this upstream issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
Dependency qt5 found: YES (cached)
Detecting Qt5 tools
 moc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/moc, 5.11.3)
 uic: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/uic, 5.11.3)
 rcc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/rcc, 5.11.3)
 lrelease: NO
Program doxygen found: YES (/usr/bin/doxygen)
Configuring Doxyfile using configuration
Program sphinx-build-3 found: NO
Program sphinx-build found: YES (/usr/bin/sphinx-build)
Configuring config.h using configuration
Build targets in project: 68
Option werror is: True [default: true]
Option cpp_std is: c++11 [default: c++14]
Found ninja-1.8.2 at /usr/bin/ninja
[1/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/buffer.cpp.o'.
[2/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/message.cpp.o'.
[3/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/object.cpp.o'.
[4/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media_object.cpp.o'.
[5/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/process.cpp.o'.
[6/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o' -c ../src/libcamera/pipeline/vimc.cpp
../src/libcamera/pipeline/vimc.cpp: In member function ‘virtual bool libcamera::PipelineHandlerVimc::match(libcamera::DeviceEnumerator*)’:
../src/libcamera/pipeline/vimc.cpp:368:46: error: ‘make_unique’ is not a member of ‘std’
  std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
                                              ^~~~~~~~~~~
../src/libcamera/pipeline/vimc.cpp:368:46: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/pipeline/vimc.cpp:34:1:
+#include <memory>
 
../src/libcamera/pipeline/vimc.cpp:368:46:
  std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
                                              ^~~~~~~~~~~
../src/libcamera/pipeline/vimc.cpp:368:72: error: expected primary-expression before ‘>’ token
  std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
                                                                        ^
[7/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/framebuffer_allocator.cpp.o'.
[8/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o' -c ../src/libcamera/pipeline/ipu3/ipu3.cpp
../src/libcamera/pipeline/ipu3/ipu3.cpp: In member function ‘int libcamera::PipelineHandlerIPU3::registerCameras()’:
../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: error: ‘make_unique’ is not a member of ‘std’
    std::make_unique<IPU3CameraData>(this);
         ^~~~~~~~~~~
../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/pipeline/ipu3/ipu3.cpp:29:1:
+#include <memory>
 
../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9:
    std::make_unique<IPU3CameraData>(this);
         ^~~~~~~~~~~
../src/libcamera/pipeline/ipu3/ipu3.cpp:879:35: error: expected primary-expression before ‘>’ token
    std::make_unique<IPU3CameraData>(this);
                                   ^
[9/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/request.cpp.o'.
[10/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_timeline.cpp.o'.
[11/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_handler.cpp.o'.
[12/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o' -c ../src/libcamera/proxy/ipa_proxy_linux.cpp
In file included from ../src/libcamera/proxy/ipa_proxy_linux.cpp:14:
../src/libcamera/proxy/ipa_proxy_linux.cpp: In member function ‘virtual std::unique_ptr<libcamera::IPAProxy> libcamera::IPAProxyLinuxFactory::create(libcamera::IPAModule*)’:
../src/libcamera/include/ipa_proxy.h:58:15: error: ‘make_unique’ is not a member of ‘std’
   return std::make_unique<proxy>(ipam); \
               ^~~~~~~~~~~
../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
 REGISTER_IPA_PROXY(IPAProxyLinux)
 ^~~~~~~~~~~~~~~~~~
../src/libcamera/include/ipa_proxy.h:58:15: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
   return std::make_unique<proxy>(ipam); \
               ^~~~~~~~~~~
../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
 REGISTER_IPA_PROXY(IPAProxyLinux)
 ^~~~~~~~~~~~~~~~~~
../src/libcamera/include/ipa_proxy.h:58:32: error: expected primary-expression before ‘>’ token
   return std::make_unique<proxy>(ipam); \
                                ^
../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
 REGISTER_IPA_PROXY(IPAProxyLinux)
 ^~~~~~~~~~~~~~~~~~
[13/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._android_camera3_hal.cpp.o'.
[14/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator_udev.cpp.o'.
[15/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o' -c ../src/libcamera/pipeline/rkisp1/rkisp1.cpp
../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘void libcamera::RkISP1CameraData::queueFrameAction(unsigned int, const libcamera::IPAOperationData&)’:
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: error: ‘make_unique’ is not a member of ‘std’
   timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
                                 ^~~~~~~~~~~
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:34:1:
+#include <memory>
 
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33:
   timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
                                 ^~~~~~~~~~~
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:66: error: expected primary-expression before ‘>’ token
   timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
                                                                  ^
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: left operand of comma operator has no effect [-Werror=unused-value]
            sensor_,
            ^~~~~~~
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: right operand of comma operator has no effect [-Werror=unused-value]
../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘virtual int libcamera::PipelineHandlerRkISP1::queueRequestDevice(libcamera::Camera*, libcamera::Request*)’:
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: error: ‘make_unique’ is not a member of ‘std’
  data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
                                      ^~~~~~~~~~~
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:74: error: expected primary-expression before ‘>’ token
  data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
                                                                          ^
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:82: error: left operand of comma operator has no effect [-Werror=unused-value]
  data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
                                                                            ~~~~~~^~~~~~
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:851:13: error: right operand of comma operator has no effect [-Werror=unused-value]
             this));
             ^~~~
../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘int libcamera::PipelineHandlerRkISP1::createCamera(libcamera::MediaEntity*)’:
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: error: ‘make_unique’ is not a member of ‘std’
   std::make_unique<RkISP1CameraData>(this);
        ^~~~~~~~~~~
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:36: error: expected primary-expression before ‘>’ token
   std::make_unique<RkISP1CameraData>(this);
                                    ^
cc1plus: all warnings being treated as errors
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
