Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFBAC140000
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 00:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389656AbgAPXrG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 16 Jan 2020 18:47:06 -0500
Received: from www.linuxtv.org ([130.149.80.248]:42188 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729160AbgAPXrF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 18:47:05 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1isEpv-00C7jd-BN; Thu, 16 Jan 2020 23:46:03 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1isEs0-0002Yt-7z; Thu, 16 Jan 2020 23:48:12 +0000
Date:   Thu, 16 Jan 2020 23:48:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <682719554.17.1579218492238.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <231412687.16.1579217594411.JavaMail.jenkins@builder.linuxtv.org>
References: <231412687.16.1579217594411.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: libcamera #75
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

See <https://builder.linuxtv.org/job/libcamera/75/display/redirect?page=changes>

Changes:

[laurent.pinchart] README: Remove duplicated line


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
Checking out Revision 30f9624f894ae50044dd367c6560198940d9b702 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 30f9624f894ae50044dd367c6560198940d9b702 # timeout=10
Commit message: "README: Remove duplicated line"
 > git rev-list --no-walk 2de78434ca710bb71590d71cf9d9c2e0aa4b22ba # timeout=10
[libcamera] $ /bin/sh -xe /tmp/jenkins5343542985076092399.sh
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
[1/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/bound_method.cpp.o'.
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
[2/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/event_dispatcher.cpp.o'.
[3/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/file_descriptor.cpp.o'.
[4/120] Generating version.cpp with a custom command.
[5/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/control_serializer.cpp.o'.
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
[6/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator.cpp.o'.
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
[7/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_manager.cpp.o'.
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
[8/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/event_dispatcher_poll.cpp.o'.
[9/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_module.cpp.o'.
[10/120] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/ipa_proxy.cpp.o'.
ninja: build stopped: subcommand failed.
Build step 'Execute shell' marked build as failure
