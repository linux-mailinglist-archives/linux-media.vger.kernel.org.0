Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B30CC14201B
	for <lists+linux-media@lfdr.de>; Sun, 19 Jan 2020 22:16:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgASVQi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jan 2020 16:16:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35574 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbgASVQi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jan 2020 16:16:38 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E060504;
        Sun, 19 Jan 2020 22:16:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1579468594;
        bh=ffTWHrk2gyKHevm9liaAZrpFbmtycmoi4n/4zfmpCaU=;
        h=Subject:To:References:Reply-To:From:Date:In-Reply-To:From;
        b=DDhY6XkgPxJ6oNo3hxUL31plVhNaHhr6+UevyJO7bI6DjZX6Rk9NLGCDmny7f+wIJ
         e0W+gkVTA1ojQQqRlwdoE24ENjK/5CoHbcZQZseqEIvgtT5uX5+CL/0doY6Qk6DMcU
         u1azbVkObAAwnP8xH9/N1AHoxU/AckNMFZcv3kFg=
Subject: Re: Build failed in Jenkins: libcamera #72
To:     Jenkins Builder Robot <jenkins@linuxtv.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org,
        LibCamera Devel <libcamera-devel@lists.libcamera.org>
References: <659134945.14.1579046596894.JavaMail.jenkins@builder.linuxtv.org>
Reply-To: kieran.bingham@ideasonboard.com
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <263aa6e2-9b6c-5939-687d-005ae8fc2059@ideasonboard.com>
Date:   Sun, 19 Jan 2020 21:16:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <659134945.14.1579046596894.JavaMail.jenkins@builder.linuxtv.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

It looks like the Jenkins jobs for Libcamera are failing continuously.

I believe it looks like the jobs reuse an existing build configuration,
and that doesn't get reconfigured if we change the top level meson.build
or such.

In particular, here we have changed to C++14, and the build should
certainly be done from clean, as compiler flags should be updated.


As a side note, is it possible (or desirable?) to cc
<libcamera-devel@lists.libcamera.org> on these failures to make sure we
see them?

Thanks
--
Kieran

On 15/01/2020 00:03, Jenkins Builder Robot wrote:
> See <https://builder.linuxtv.org/job/libcamera/72/display/redirect?page=changes>
> 
> Changes:
> 
> [laurent.pinchart] meson.build: Switch to C++14
> 
> [laurent.pinchart] libcamera: Switch from utils::make_unique to std::make_unique
> 
> 
> ------------------------------------------
> Started by an SCM change
> Running as SYSTEM
> Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
> No credentials specified
>  > git rev-parse --is-inside-work-tree # timeout=10
> Fetching changes from the remote Git repository
>  > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
> Fetching upstream changes from git://linuxtv.org/libcamera.git
>  > git --version # timeout=10
>  > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
>  > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
>  > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
> Checking out Revision acf18e4265dec2991e62f7c8baecfacf1a6708b3 (refs/remotes/origin/master)
>  > git config core.sparsecheckout # timeout=10
>  > git checkout -f acf18e4265dec2991e62f7c8baecfacf1a6708b3 # timeout=10
> Commit message: "libcamera: Switch from utils::make_unique to std::make_unique"
>  > git rev-list --no-walk 055335bf49dbcb8c149bdcd4e96004c68e6b6ece # timeout=10
> [libcamera] $ /bin/sh -xe /tmp/jenkins2777310540601637282.sh
> + meson build -Dandroid=true
> Directory already configured.

^^ This implies the previous build is being re-used.

Perhaps for a CI job, would it make more sense to do from-scratch clean
configure and rebuilds?


It would be nice if meson always knew when to reconfigure, but I'm not
sure how to make sure that always happens :-D



> 
> Just run your build command (e.g. ninja) and Meson will regenerate as necessary.
> If ninja fails, run "ninja reconfigure" or "meson --reconfigure"
> to force Meson to regenerate.
> 
> If build failures persist, run "meson setup --wipe" to rebuild from scratch
> using the same options as passed when configuring the build.
> To change option values, run "meson configure" instead.
> + cd build
> + ninja
> [0/1] Regenerating build files.
> The Meson build system
> Version: 0.49.2
> Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
> Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
> Build type: native build
> Project name: libcamera
> Project version: 0.0.0
> Native C compiler: ccache cc (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
> Native C++ compiler: ccache c++ (gcc 8.3.0 "c++ (Debian 8.3.0-6) 8.3.0")
> Build machine cpu family: x86_64
> Build machine cpu: x86_64
> Header <execinfo.h> has symbol "backtrace" : YES
> Header <stdlib.h> has symbol "secure_getenv" : YES
> Configuring version.h using configuration
> Dependency libudev found: YES (cached)
> Library atomic found: YES
> Library dl found: YES
> Dependency threads found: YES (cached)
> WARNING: rcc dependencies will not work reliably until this upstream issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
> Dependency qt5 found: YES (cached)
> Detecting Qt5 tools
>  moc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/moc, 5.11.3)
>  uic: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/uic, 5.11.3)
>  rcc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/rcc, 5.11.3)
>  lrelease: NO
> Program doxygen found: YES (/usr/bin/doxygen)
> Configuring Doxyfile using configuration
> Program sphinx-build-3 found: NO
> Program sphinx-build found: YES (/usr/bin/sphinx-build)
> Configuring config.h using configuration
> Build targets in project: 68
> Option werror is: True [default: true]
> Option cpp_std is: c++11 [default: c++14]
> Found ninja-1.8.2 at /usr/bin/ninja
> [1/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/buffer.cpp.o'.
> [2/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/message.cpp.o'.
> [3/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/object.cpp.o'.
> [4/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media_object.cpp.o'.
> [5/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/process.cpp.o'.
> [6/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o'.
> FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o 
> ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o' -c ../src/libcamera/pipeline/vimc.cpp
> ../src/libcamera/pipeline/vimc.cpp: In member function ‘virtual bool libcamera::PipelineHandlerVimc::match(libcamera::DeviceEnumerator*)’:
> ../src/libcamera/pipeline/vimc.cpp:368:46: error: ‘make_unique’ is not a member of ‘std’
>   std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
>                                               ^~~~~~~~~~~
> ../src/libcamera/pipeline/vimc.cpp:368:46: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> ../src/libcamera/pipeline/vimc.cpp:34:1:
> +#include <memory>
>  
> ../src/libcamera/pipeline/vimc.cpp:368:46:
>   std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
>                                               ^~~~~~~~~~~
> ../src/libcamera/pipeline/vimc.cpp:368:72: error: expected primary-expression before ‘>’ token
>   std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
>                                                                         ^
> [7/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/framebuffer_allocator.cpp.o'.
> [8/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o'.
> FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o 
> ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o' -c ../src/libcamera/pipeline/ipu3/ipu3.cpp
> ../src/libcamera/pipeline/ipu3/ipu3.cpp: In member function ‘int libcamera::PipelineHandlerIPU3::registerCameras()’:
> ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: error: ‘make_unique’ is not a member of ‘std’
>     std::make_unique<IPU3CameraData>(this);
>          ^~~~~~~~~~~
> ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> ../src/libcamera/pipeline/ipu3/ipu3.cpp:29:1:
> +#include <memory>
>  
> ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9:
>     std::make_unique<IPU3CameraData>(this);
>          ^~~~~~~~~~~
> ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:35: error: expected primary-expression before ‘>’ token
>     std::make_unique<IPU3CameraData>(this);
>                                    ^
> [9/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/request.cpp.o'.
> [10/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_timeline.cpp.o'.
> [11/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_handler.cpp.o'.
> [12/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o'.
> FAILED: src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o 
> ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o' -c ../src/libcamera/proxy/ipa_proxy_linux.cpp
> In file included from ../src/libcamera/proxy/ipa_proxy_linux.cpp:14:
> ../src/libcamera/proxy/ipa_proxy_linux.cpp: In member function ‘virtual std::unique_ptr<libcamera::IPAProxy> libcamera::IPAProxyLinuxFactory::create(libcamera::IPAModule*)’:
> ../src/libcamera/include/ipa_proxy.h:58:15: error: ‘make_unique’ is not a member of ‘std’
>    return std::make_unique<proxy>(ipam); \
>                ^~~~~~~~~~~
> ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
>  REGISTER_IPA_PROXY(IPAProxyLinux)
>  ^~~~~~~~~~~~~~~~~~
> ../src/libcamera/include/ipa_proxy.h:58:15: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
>    return std::make_unique<proxy>(ipam); \
>                ^~~~~~~~~~~
> ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
>  REGISTER_IPA_PROXY(IPAProxyLinux)
>  ^~~~~~~~~~~~~~~~~~
> ../src/libcamera/include/ipa_proxy.h:58:32: error: expected primary-expression before ‘>’ token
>    return std::make_unique<proxy>(ipam); \
>                                 ^
> ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
>  REGISTER_IPA_PROXY(IPAProxyLinux)
>  ^~~~~~~~~~~~~~~~~~
> [13/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._android_camera3_hal.cpp.o'.
> [14/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator_udev.cpp.o'.
> [15/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o'.
> FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o 
> ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o' -c ../src/libcamera/pipeline/rkisp1/rkisp1.cpp
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘void libcamera::RkISP1CameraData::queueFrameAction(unsigned int, const libcamera::IPAOperationData&)’:
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: error: ‘make_unique’ is not a member of ‘std’
>    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
>                                  ^~~~~~~~~~~
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:34:1:
> +#include <memory>
>  
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33:
>    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
>                                  ^~~~~~~~~~~
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:66: error: expected primary-expression before ‘>’ token
>    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
>                                                                   ^
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: left operand of comma operator has no effect [-Werror=unused-value]
>             sensor_,
>             ^~~~~~~
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: right operand of comma operator has no effect [-Werror=unused-value]
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘virtual int libcamera::PipelineHandlerRkISP1::queueRequestDevice(libcamera::Camera*, libcamera::Request*)’:
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: error: ‘make_unique’ is not a member of ‘std’
>   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
>                                       ^~~~~~~~~~~
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:74: error: expected primary-expression before ‘>’ token
>   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
>                                                                           ^
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:82: error: left operand of comma operator has no effect [-Werror=unused-value]
>   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
>                                                                             ~~~~~~^~~~~~
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:851:13: error: right operand of comma operator has no effect [-Werror=unused-value]
>              this));
>              ^~~~
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘int libcamera::PipelineHandlerRkISP1::createCamera(libcamera::MediaEntity*)’:
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: error: ‘make_unique’ is not a member of ‘std’
>    std::make_unique<RkISP1CameraData>(this);
>         ^~~~~~~~~~~
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:36: error: expected primary-expression before ‘>’ token
>    std::make_unique<RkISP1CameraData>(this);
>                                     ^
> cc1plus: all warnings being treated as errors
> ninja: build stopped: subcommand failed.
> Build step 'Execute shell' marked build as failure
> 


-- 
Regards
--
Kieran
