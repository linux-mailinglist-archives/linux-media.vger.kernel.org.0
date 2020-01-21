Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 306E9143DF8
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 14:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgAUNZU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 21 Jan 2020 08:25:20 -0500
Received: from www.linuxtv.org ([130.149.80.248]:34844 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbgAUNZU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 08:25:20 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ittVs-000U4v-QA; Tue, 21 Jan 2020 13:24:13 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1ittY4-0001oe-0S; Tue, 21 Jan 2020 13:26:28 +0000
Date:   Tue, 21 Jan 2020 13:26:27 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Message-ID: <1649517221.0.1579613187983.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <703931466.19.1579539790752.JavaMail.jenkins@builder.linuxtv.org>
References: <703931466.19.1579539790752.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #78
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

See <https://builder.linuxtv.org/job/libcamera/78/display/redirect>

Changes:


------------------------------------------
[...truncated 1.66 KB...]
[2/2] Cleaning.
Cleaning... 50 files.
+ meson build -Dandroid=true
Directory already configured.

Just run your build command (e.g. ninja) and Meson will regenerate as necessary.
If ninja fails, run "ninja reconfigure" or "meson --reconfigure"
to force Meson to regenerate.

If build failures persist, run "meson setup --wipe" to rebuild from scratch
using the same options as passed when configuring the build.
To change option values, run "meson configure" instead.
+ ninja -C build
ninja: Entering directory `build'
[1/212] Compiling C object 'utils/ipu3/5b60d53@@ipu3-unpack@exe/ipu3-unpack.c.o'.
[2/212] Compiling C object 'src/android/e7e5733@@camera_metadata@sta/metadata_camera_metadata.c.o'.
[3/212] Linking static target src/android/libcamera_metadata.a.
[4/212] Generating gen-header with a custom command.
[5/212] Linking target utils/ipu3/ipu3-unpack.
[6/212] Generating control_ids_h with a custom command.
[7/212] Generating control_ids_cpp with a custom command.
[8/212] Generating 'src/qcam/9916d8b@@qcam@exe/moc_main_window.cpp'.
[9/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/buffer.cpp.o'.
[10/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/byte_stream_buffer.cpp.o'.
[11/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/camera_controls.cpp.o'.
[12/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/camera_manager.cpp.o'.
[13/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/camera.cpp.o'.
[14/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/control_validator.cpp.o'.
[15/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/controls.cpp.o'.
[16/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/camera_sensor.cpp.o'.
[17/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator_sysfs.cpp.o'.
[18/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/event_dispatcher.cpp.o'.
[19/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/event_dispatcher_poll.cpp.o'.
[20/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/event_notifier.cpp.o'.
[21/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/formats.cpp.o'.
[22/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/file_descriptor.cpp.o'.
[23/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/geometry.cpp.o'.
[24/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_controls.cpp.o'.
[25/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/framebuffer_allocator.cpp.o'.
[26/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_interface.cpp.o'.
[27/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/meson-generated_.._control_ids.cpp.o'.
[28/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_context_wrapper.cpp.o'.
[29/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_module.cpp.o'.
[30/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipc_unixsocket.cpp.o'.
[31/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_proxy.cpp.o'.
[32/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/log.cpp.o'.
[33/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media_device.cpp.o'.
[34/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media_object.cpp.o'.
[35/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/message.cpp.o'.
[36/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/object.cpp.o'.
[37/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pixelformats.cpp.o'.
[38/212] Compiling C++ object 'src/qcam/9916d8b@@qcam@exe/meson-generated_moc_main_window.cpp.o'.
[39/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_handler.cpp.o'.
[40/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/process.cpp.o'.
[41/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/request.cpp.o'.
[42/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/semaphore.cpp.o'.
[43/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/signal.cpp.o'.
[44/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/stream.cpp.o'.
[45/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/thread.cpp.o'.
[46/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/utils.cpp.o'.
[47/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/timer.cpp.o'.
[48/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/v4l2_controls.cpp.o'.
[49/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/v4l2_subdevice.cpp.o'.
[50/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/bound_method.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/bound_method.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/bound_method.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/bound_method.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/bound_method.cpp.o' -c ../src/libcamera/bound_method.cpp
../src/libcamera/bound_method.cpp: In member function ‘bool libcamera::BoundMethodBase::activatePack(std::shared_ptr<libcamera::BoundMethodPackBase>, bool)’:
../src/libcamera/bound_method.cpp:86:9: error: ‘make_unique’ is not a member of ‘std’
    std::make_unique<InvokeMessage>(this, pack, nullptr, deleteMethod);
         ^~~~~~~~~~~
../src/libcamera/bound_method.cpp:86:9: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/bound_method.cpp:13:1:
+#include <memory>
 
../src/libcamera/bound_method.cpp:86:9:
    std::make_unique<InvokeMessage>(this, pack, nullptr, deleteMethod);
         ^~~~~~~~~~~
../src/libcamera/bound_method.cpp:86:34: error: expected primary-expression before ‘>’ token
    std::make_unique<InvokeMessage>(this, pack, nullptr, deleteMethod);
                                  ^
../src/libcamera/bound_method.cpp:86:42: error: left operand of comma operator has no effect [-Werror=unused-value]
    std::make_unique<InvokeMessage>(this, pack, nullptr, deleteMethod);
                                          ^~~~
../src/libcamera/bound_method.cpp:86:48: error: right operand of comma operator has no effect [-Werror=unused-value]
    std::make_unique<InvokeMessage>(this, pack, nullptr, deleteMethod);
                                                ^~~~~~~
../src/libcamera/bound_method.cpp:86:57: error: right operand of comma operator has no effect [-Werror=unused-value]
    std::make_unique<InvokeMessage>(this, pack, nullptr, deleteMethod);
                                                         ^~~~~~~~~~~~
../src/libcamera/bound_method.cpp:95:9: error: ‘make_unique’ is not a member of ‘std’
    std::make_unique<InvokeMessage>(this, pack, &semaphore, deleteMethod);
         ^~~~~~~~~~~
../src/libcamera/bound_method.cpp:95:9: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/bound_method.cpp:95:34: error: expected primary-expression before ‘>’ token
    std::make_unique<InvokeMessage>(this, pack, &semaphore, deleteMethod);
                                  ^
../src/libcamera/bound_method.cpp:95:42: error: left operand of comma operator has no effect [-Werror=unused-value]
    std::make_unique<InvokeMessage>(this, pack, &semaphore, deleteMethod);
                                          ^~~~
../src/libcamera/bound_method.cpp:95:49: error: right operand of comma operator has no effect [-Werror=unused-value]
    std::make_unique<InvokeMessage>(this, pack, &semaphore, deleteMethod);
                                                 ^~~~~~~~~
../src/libcamera/bound_method.cpp:95:48: error: right operand of comma operator has no effect [-Werror=unused-value]
    std::make_unique<InvokeMessage>(this, pack, &semaphore, deleteMethod);
                                                ^~~~~~~~~~
cc1plus: all warnings being treated as errors
[51/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/device_enumerator.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/device_enumerator.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/device_enumerator.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/device_enumerator.cpp.o' -c ../src/libcamera/device_enumerator.cpp
../src/libcamera/device_enumerator.cpp: In static member function ‘static std::unique_ptr<libcamera::DeviceEnumerator> libcamera::DeviceEnumerator::create()’:
../src/libcamera/device_enumerator.cpp:147:20: error: ‘make_unique’ is not a member of ‘std’
  enumerator = std::make_unique<DeviceEnumeratorUdev>();
                    ^~~~~~~~~~~
../src/libcamera/device_enumerator.cpp:147:20: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/device_enumerator.cpp:16:1:
+#include <memory>
 
../src/libcamera/device_enumerator.cpp:147:20:
  enumerator = std::make_unique<DeviceEnumeratorUdev>();
                    ^~~~~~~~~~~
../src/libcamera/device_enumerator.cpp:147:52: error: expected primary-expression before ‘>’ token
  enumerator = std::make_unique<DeviceEnumeratorUdev>();
                                                    ^
../src/libcamera/device_enumerator.cpp:147:54: error: expected primary-expression before ‘)’ token
  enumerator = std::make_unique<DeviceEnumeratorUdev>();
                                                      ^
../src/libcamera/device_enumerator.cpp:156:20: error: ‘make_unique’ is not a member of ‘std’
  enumerator = std::make_unique<DeviceEnumeratorSysfs>();
                    ^~~~~~~~~~~
../src/libcamera/device_enumerator.cpp:156:20: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/device_enumerator.cpp:156:53: error: expected primary-expression before ‘>’ token
  enumerator = std::make_unique<DeviceEnumeratorSysfs>();
                                                     ^
../src/libcamera/device_enumerator.cpp:156:55: error: expected primary-expression before ‘)’ token
  enumerator = std::make_unique<DeviceEnumeratorSysfs>();
                                                       ^
[52/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/control_serializer.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/control_serializer.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/control_serializer.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/control_serializer.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/control_serializer.cpp.o' -c ../src/libcamera/control_serializer.cpp
../src/libcamera/control_serializer.cpp: In member function ‘T libcamera::ControlSerializer::deserialize(libcamera::ByteStreamBuffer&) [with T = libcamera::ControlInfoMap]’:
../src/libcamera/control_serializer.cpp:417:33: error: ‘make_unique’ is not a member of ‘std’
   controlIds_.emplace_back(std::make_unique<ControlId>(entry.id, "", type));
                                 ^~~~~~~~~~~
../src/libcamera/control_serializer.cpp:417:33: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/control_serializer.cpp:20:1:
+#include <memory>
 
../src/libcamera/control_serializer.cpp:417:33:
   controlIds_.emplace_back(std::make_unique<ControlId>(entry.id, "", type));
                                 ^~~~~~~~~~~
../src/libcamera/control_serializer.cpp:417:54: error: expected primary-expression before ‘>’ token
   controlIds_.emplace_back(std::make_unique<ControlId>(entry.id, "", type));
                                                      ^
../src/libcamera/control_serializer.cpp:417:62: error: left operand of comma operator has no effect [-Werror=unused-value]
   controlIds_.emplace_back(std::make_unique<ControlId>(entry.id, "", type));
                                                        ~~~~~~^~
../src/libcamera/control_serializer.cpp:417:70: error: right operand of comma operator has no effect [-Werror=unused-value]
   controlIds_.emplace_back(std::make_unique<ControlId>(entry.id, "", type));
                                                                      ^~~~
cc1plus: all warnings being treated as errors
[53/212] Generating version.cpp with a custom command.
[54/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_manager.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/ipa_manager.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/ipa_manager.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/ipa_manager.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/ipa_manager.cpp.o' -c ../src/libcamera/ipa_manager.cpp
../src/libcamera/ipa_manager.cpp: In member function ‘std::unique_ptr<libcamera::IPAInterface> libcamera::IPAManager::createIPA(libcamera::PipelineHandler*, uint32_t, uint32_t)’:
../src/libcamera/ipa_manager.cpp:267:14: error: ‘make_unique’ is not a member of ‘std’
  return std::make_unique<IPAContextWrapper>(ctx);
              ^~~~~~~~~~~
../src/libcamera/ipa_manager.cpp:267:14: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/ipa_manager.cpp:21:1:
+#include <memory>
 
../src/libcamera/ipa_manager.cpp:267:14:
  return std::make_unique<IPAContextWrapper>(ctx);
              ^~~~~~~~~~~
../src/libcamera/ipa_manager.cpp:267:43: error: expected primary-expression before ‘>’ token
  return std::make_unique<IPAContextWrapper>(ctx);
                                           ^
[55/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/v4l2_device.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/v4l2_device.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/v4l2_device.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/v4l2_device.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/v4l2_device.cpp.o' -c ../src/libcamera/v4l2_device.cpp
../src/libcamera/v4l2_device.cpp: In member function ‘void libcamera::V4L2Device::listControls()’:
../src/libcamera/v4l2_device.cpp:383:33: error: ‘make_unique’ is not a member of ‘std’
   controlIds_.emplace_back(std::make_unique<V4L2ControlId>(ctrl));
                                 ^~~~~~~~~~~
../src/libcamera/v4l2_device.cpp:383:33: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/v4l2_device.cpp:20:1:
+#include <memory>
 
../src/libcamera/v4l2_device.cpp:383:33:
   controlIds_.emplace_back(std::make_unique<V4L2ControlId>(ctrl));
                                 ^~~~~~~~~~~
../src/libcamera/v4l2_device.cpp:383:58: error: expected primary-expression before ‘>’ token
   controlIds_.emplace_back(std::make_unique<V4L2ControlId>(ctrl));
                                                          ^
[56/212] Generating documentation with a custom command.
[57/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/v4l2_videodevice.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/v4l2_videodevice.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/v4l2_videodevice.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/v4l2_videodevice.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/v4l2_videodevice.cpp.o' -c ../src/libcamera/v4l2_videodevice.cpp
../src/libcamera/v4l2_videodevice.cpp: In member function ‘std::unique_ptr<libcamera::FrameBuffer> libcamera::V4L2VideoDevice::createBuffer(const v4l2_buffer&)’:
../src/libcamera/v4l2_videodevice.cpp:1057:14: error: ‘make_unique’ is not a member of ‘std’
  return std::make_unique<FrameBuffer>(std::move(planes));
              ^~~~~~~~~~~
../src/libcamera/v4l2_videodevice.cpp:1057:14: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/v4l2_videodevice.cpp:30:1:
+#include <memory>
 
../src/libcamera/v4l2_videodevice.cpp:1057:14:
  return std::make_unique<FrameBuffer>(std::move(planes));
              ^~~~~~~~~~~
../src/libcamera/v4l2_videodevice.cpp:1057:37: error: expected primary-expression before ‘>’ token
  return std::make_unique<FrameBuffer>(std::move(planes));
                                     ^
[58/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_uvcvideo.cpp.o'.
FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_uvcvideo.cpp.o 
ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_uvcvideo.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_uvcvideo.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_uvcvideo.cpp.o' -c ../src/libcamera/pipeline/uvcvideo.cpp
../src/libcamera/pipeline/uvcvideo.cpp: In member function ‘virtual bool libcamera::PipelineHandlerUVC::match(libcamera::DeviceEnumerator*)’:
../src/libcamera/pipeline/uvcvideo.cpp:299:45: error: ‘make_unique’ is not a member of ‘std’
  std::unique_ptr<UVCCameraData> data = std::make_unique<UVCCameraData>(this);
                                             ^~~~~~~~~~~
../src/libcamera/pipeline/uvcvideo.cpp:299:45: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
../src/libcamera/pipeline/uvcvideo.cpp:26:1:
+#include <memory>
 
../src/libcamera/pipeline/uvcvideo.cpp:299:45:
  std::unique_ptr<UVCCameraData> data = std::make_unique<UVCCameraData>(this);
                                             ^~~~~~~~~~~
../src/libcamera/pipeline/uvcvideo.cpp:299:70: error: expected primary-expression before ‘>’ token
  std::unique_ptr<UVCCameraData> data = std::make_unique<UVCCameraData>(this);
                                                                      ^
[59/212] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o'.
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
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
