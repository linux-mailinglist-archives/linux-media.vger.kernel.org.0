Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E03088EB53
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 14:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730330AbfHOMPP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 15 Aug 2019 08:15:15 -0400
Received: from www.linuxtv.org ([130.149.80.248]:39741 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbfHOMPP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 08:15:15 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hyEet-00011g-Iq; Thu, 15 Aug 2019 12:15:11 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hyEeu-0004X1-MI; Thu, 15 Aug 2019 12:15:12 +0000
Date:   Thu, 15 Aug 2019 12:15:12 +0000 (UTC)
From:   jenkins@linuxtv.org
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1855160069.12.1565871312684.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: libcamera
X-Jenkins-Result: FAILURE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/libcamera/3/display/redirect>

Changes:

------------------------------------------
Started by user Mauro Carvalho Chehab
Running as SYSTEM
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
No credentials specified
Cloning the remote Git repository
Cloning repository git://linuxtv.org/libcamera.git
 > git init <https://builder.linuxtv.org/job/libcamera/ws/> # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git --version # timeout=10
 > git fetch --tags --force --progress git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/*
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
 > git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
Fetching upstream changes from git://linuxtv.org/libcamera.git
 > git fetch --tags --force --progress git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/*
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 0268984c0d870a6e772b45e3aa1b01daadd45395 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 0268984c0d870a6e772b45e3aa1b01daadd45395
Commit message: "test: v4l2_device: Remove unused function"
 > git rev-list --no-walk 0268984c0d870a6e772b45e3aa1b01daadd45395 # timeout=10
[libcamera] $ /bin/sh -xe /tmp/jenkins43895443202581844.sh
+ meson build -Dandroid=true
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
Header <stdlib.h> has symbol "secure_getenv" : YES
Configuring version.h using configuration
Found pkg-config: /usr/bin/pkg-config (0.29)
Dependency libudev found: YES 241
Library dl found: YES
Dependency threads found: YES 
WARNING: rcc dependencies will not work reliably until this upstream issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
Dependency qt5 (modules: Core, Gui, Widgets) found: YES 5.11.3 (pkg-config)
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
Build targets in project: 52
Option werror is: True [default: true]
Found ninja-1.8.2 at /usr/bin/ninja
+ cd build
+ ninja
[1/171] Generating control_types_cpp with a custom command.
[2/171] Generating gen-header with a custom command.
[3/171] Compiling C object 'src/android/e7e5733@@camera_metadata@sta/metadata_camera_metadata.c.o'.
[4/171] Linking static target src/android/libcamera_metadata.a.
[5/171] Generating version.cpp with a custom command.
[6/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/event_dispatcher.cpp.o'.
[7/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator_sysfs.cpp.o'.
[8/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/buffer.cpp.o'.
[9/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/meson-generated_.._control_types.cpp.o'.
[10/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/meson-generated_.._version.cpp.o'.
[11/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_interface.cpp.o'.
[12/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator.cpp.o'.
[13/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/geometry.cpp.o'.
[14/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/controls.cpp.o'.
[15/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/event_notifier.cpp.o'.
[16/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/camera_manager.cpp.o'.
[17/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/formats.cpp.o'.
[18/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/camera_sensor.cpp.o'.
[19/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/camera.cpp.o'.
[20/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/event_dispatcher_poll.cpp.o'.
[21/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_manager.cpp.o'.
[22/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_proxy.cpp.o'.
[23/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/message.cpp.o'.
[24/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipc_unixsocket.cpp.o'.
[25/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media_object.cpp.o'.
[26/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_module.cpp.o'.
[27/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/log.cpp.o'.
[28/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media_device.cpp.o'.
[29/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/object.cpp.o'.
[30/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/utils.cpp.o'.
[31/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/timer.cpp.o'.
[32/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/signal.cpp.o'.
[33/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/process.cpp.o'.
[34/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/v4l2_controls.cpp.o'.
[35/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/thread.cpp.o'.
[36/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/v4l2_device.cpp.o'.
[37/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/request.cpp.o'.
[38/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_handler.cpp.o'.
[39/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/stream.cpp.o'.
[40/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/v4l2_subdevice.cpp.o'.
[41/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator_udev.cpp.o'.
[42/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/v4l2_videodevice.cpp.o'.
[43/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o'.
[44/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._android_camera3_hal.cpp.o'.
[45/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._android_camera_hal_manager.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/.._android_camera_hal_manager.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/.._android_camera_hal_manager.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/.._android_camera_hal_manager.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/.._android_camera_hal_manager.cpp.o' -c ../src/android/camera_hal_manager.cpp
../src/android/camera_hal_manager.cpp: In member function ‘CameraProxy* CameraHalManager::open(unsigned int, const hw_module_t*)’:
../src/android/camera_hal_manager.cpp:89:9: error: comparison of unsigned expression < 0 is always false [-Werror=type-limits]
  if (id < 0 || id >= numCameras()) {
      ~~~^~~
cc1plus: all warnings being treated as errors
[46/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_uvcvideo.cpp.o'.
[47/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o'.
[48/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o'.
[49/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._android_thread_rpc.cpp.o'.
[50/171] Compiling C++ object 'src/cam/351722a@@cam@exe/event_loop.cpp.o'.
[51/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o'.
[52/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._android_camera_device.cpp.o'.
[53/171] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._android_camera_proxy.cpp.o'.
[54/171] Compiling C++ object 'src/cam/351722a@@cam@exe/main.cpp.o'.
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
