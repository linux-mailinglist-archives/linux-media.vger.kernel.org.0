Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67ACC143EAA
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 14:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbgAUNzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 08:55:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51504 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbgAUNzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 08:55:18 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B15B452A;
        Tue, 21 Jan 2020 14:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1579614914;
        bh=/qrUmbNEoAxeU3qxhHajPVFjejzj+UMVBl1jRJchz4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ntBF/SEotKEeUggyaPdCgotDfN6r3Kc+/dgk5nUSEDnsT2r94/R4jtBlDZ7SgzrA8
         hp26YlhiCW4uXrcez2ecKRzosiDWvWCBZpgAhE+IadnciBLN7IRAfkhS3Fh1c2NFup
         Eez6cO62bx1g0G1VvnlF5FTMbHp5vlnoS3L4octc=
Date:   Tue, 21 Jan 2020 15:54:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LibCamera Devel <libcamera-devel@lists.libcamera.org>,
        Jenkins Builder Robot <jenkins@linuxtv.org>,
        linux-media@vger.kernel.org
Subject: Re: [libcamera-devel] Build failed in Jenkins: libcamera #72
Message-ID: <20200121135459.GB7686@pendragon.ideasonboard.com>
References: <659134945.14.1579046596894.JavaMail.jenkins@builder.linuxtv.org>
 <263aa6e2-9b6c-5939-687d-005ae8fc2059@ideasonboard.com>
 <20200121141246.4d1b2ac5@kernel.org>
 <20200121135149.GA7686@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200121135149.GA7686@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Tue, Jan 21, 2020 at 03:51:49PM +0200, Laurent Pinchart wrote:
> On Tue, Jan 21, 2020 at 02:12:46PM +0100, Mauro Carvalho Chehab wrote:
> > Em Sun, 19 Jan 2020 21:16:31 +0000 Kieran Bingham escreveu:
> > > Hi Mauro,
> > > 
> > > It looks like the Jenkins jobs for Libcamera are failing continuously.
> > > 
> > > I believe it looks like the jobs reuse an existing build configuration,
> > > and that doesn't get reconfigured if we change the top level meson.build
> > > or such.
> > > 
> > > In particular, here we have changed to C++14, and the build should
> > > certainly be done from clean, as compiler flags should be updated.
> > > 
> > > As a side note, is it possible (or desirable?) to cc
> > > <libcamera-devel@lists.libcamera.org> on these failures to make sure we
> > > see them?
> > > 
> > > On 15/01/2020 00:03, Jenkins Builder Robot wrote:
> > > > See <https://builder.linuxtv.org/job/libcamera/72/display/redirect?page=changes>
> > > > 
> > > > Changes:
> > > > 
> > > > [laurent.pinchart] meson.build: Switch to C++14
> > > > 
> > > > [laurent.pinchart] libcamera: Switch from utils::make_unique to std::make_unique
> > > > 
> > > > 
> > > > ------------------------------------------
> > > > Started by an SCM change
> > > > Running as SYSTEM
> > > > Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
> > > > No credentials specified  
> > > >  > git rev-parse --is-inside-work-tree # timeout=10  
> > > > Fetching changes from the remote Git repository  
> > > >  > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10  
> > > > Fetching upstream changes from git://linuxtv.org/libcamera.git  
> > > >  > git --version # timeout=10
> > > >  > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
> > > >  > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
> > > >  > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10  
> > > > Checking out Revision acf18e4265dec2991e62f7c8baecfacf1a6708b3 (refs/remotes/origin/master)  
> > > >  > git config core.sparsecheckout # timeout=10
> > > >  > git checkout -f acf18e4265dec2991e62f7c8baecfacf1a6708b3 # timeout=10  
> > > > Commit message: "libcamera: Switch from utils::make_unique to std::make_unique"  
> > > >  > git rev-list --no-walk 055335bf49dbcb8c149bdcd4e96004c68e6b6ece # timeout=10  
> > > > [libcamera] $ /bin/sh -xe /tmp/jenkins2777310540601637282.sh
> > > > + meson build -Dandroid=true
> > > > Directory already configured.  
> > > 
> > > ^^ This implies the previous build is being re-used.
> > > 
> > > Perhaps for a CI job, would it make more sense to do from-scratch clean
> > > configure and rebuilds?
> > > 
> > > It would be nice if meson always knew when to reconfigure, but I'm not
> > > sure how to make sure that always happens :-D
> > > 
> > > > Just run your build command (e.g. ninja) and Meson will regenerate as necessary.
> > > > If ninja fails, run "ninja reconfigure" or "meson --reconfigure"
> > > > to force Meson to regenerate.
> > > > 
> > > > If build failures persist, run "meson setup --wipe" to rebuild from scratch
> > > > using the same options as passed when configuring the build.
> > > > To change option values, run "meson configure" instead.
> > > > + cd build
> > > > + ninja
> > > > [0/1] Regenerating build files.
> > > > The Meson build system
> > > > Version: 0.49.2
> > > > Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
> > > > Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
> > > > Build type: native build
> > > > Project name: libcamera
> > > > Project version: 0.0.0
> > > > Native C compiler: ccache cc (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
> > > > Native C++ compiler: ccache c++ (gcc 8.3.0 "c++ (Debian 8.3.0-6) 8.3.0")
> > > > Build machine cpu family: x86_64
> > > > Build machine cpu: x86_64
> > > > Header <execinfo.h> has symbol "backtrace" : YES
> > > > Header <stdlib.h> has symbol "secure_getenv" : YES
> > > > Configuring version.h using configuration
> > > > Dependency libudev found: YES (cached)
> > > > Library atomic found: YES
> > > > Library dl found: YES
> > > > Dependency threads found: YES (cached)
> > > > WARNING: rcc dependencies will not work reliably until this upstream issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
> > > > Dependency qt5 found: YES (cached)
> > > > Detecting Qt5 tools
> > > >  moc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/moc, 5.11.3)
> > > >  uic: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/uic, 5.11.3)
> > > >  rcc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/rcc, 5.11.3)
> > > >  lrelease: NO
> > > > Program doxygen found: YES (/usr/bin/doxygen)
> > > > Configuring Doxyfile using configuration
> > > > Program sphinx-build-3 found: NO
> > > > Program sphinx-build found: YES (/usr/bin/sphinx-build)
> > > > Configuring config.h using configuration
> > > > Build targets in project: 68
> > > > Option werror is: True [default: true]
> > > > Option cpp_std is: c++11 [default: c++14]
> > > > Found ninja-1.8.2 at /usr/bin/ninja
> > > > [1/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/buffer.cpp.o'.
> > > > [2/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/message.cpp.o'.
> > > > [3/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/object.cpp.o'.
> > > > [4/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media_object.cpp.o'.
> > > > [5/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/process.cpp.o'.
> > > > [6/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o'.
> > > > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o 
> > > > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o' -c ../src/libcamera/pipeline/vimc.cpp
> > > > ../src/libcamera/pipeline/vimc.cpp: In member function ‘virtual bool libcamera::PipelineHandlerVimc::match(libcamera::DeviceEnumerator*)’:
> > > > ../src/libcamera/pipeline/vimc.cpp:368:46: error: ‘make_unique’ is not a member of ‘std’
> > > >   std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
> > > >                                               ^~~~~~~~~~~
> > > > ../src/libcamera/pipeline/vimc.cpp:368:46: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> > > > ../src/libcamera/pipeline/vimc.cpp:34:1:
> > > > +#include <memory>
> > > >  
> > > > ../src/libcamera/pipeline/vimc.cpp:368:46:
> > > >   std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
> > > >                                               ^~~~~~~~~~~
> > > > ../src/libcamera/pipeline/vimc.cpp:368:72: error: expected primary-expression before ‘>’ token
> > > >   std::unique_ptr<VimcCameraData> data = std::make_unique<VimcCameraData>(this);
> > > >                                                                         ^
> > > > [7/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/framebuffer_allocator.cpp.o'.
> > > > [8/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o'.
> > > > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o 
> > > > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o' -c ../src/libcamera/pipeline/ipu3/ipu3.cpp
> > > > ../src/libcamera/pipeline/ipu3/ipu3.cpp: In member function ‘int libcamera::PipelineHandlerIPU3::registerCameras()’:
> > > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: error: ‘make_unique’ is not a member of ‘std’
> > > >     std::make_unique<IPU3CameraData>(this);
> > > >          ^~~~~~~~~~~
> > > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> > > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:29:1:
> > > > +#include <memory>
> > > >  
> > > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9:
> > > >     std::make_unique<IPU3CameraData>(this);
> > > >          ^~~~~~~~~~~
> > > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:35: error: expected primary-expression before ‘>’ token
> > > >     std::make_unique<IPU3CameraData>(this);
> > > >                                    ^
> > > > [9/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/request.cpp.o'.
> > > > [10/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_timeline.cpp.o'.
> > > > [11/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_handler.cpp.o'.
> > > > [12/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o'.
> > > > FAILED: src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o 
> > > > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o' -c ../src/libcamera/proxy/ipa_proxy_linux.cpp
> > > > In file included from ../src/libcamera/proxy/ipa_proxy_linux.cpp:14:
> > > > ../src/libcamera/proxy/ipa_proxy_linux.cpp: In member function ‘virtual std::unique_ptr<libcamera::IPAProxy> libcamera::IPAProxyLinuxFactory::create(libcamera::IPAModule*)’:
> > > > ../src/libcamera/include/ipa_proxy.h:58:15: error: ‘make_unique’ is not a member of ‘std’
> > > >    return std::make_unique<proxy>(ipam); \
> > > >                ^~~~~~~~~~~
> > > > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
> > > >  REGISTER_IPA_PROXY(IPAProxyLinux)
> > > >  ^~~~~~~~~~~~~~~~~~
> > > > ../src/libcamera/include/ipa_proxy.h:58:15: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> > > >    return std::make_unique<proxy>(ipam); \
> > > >                ^~~~~~~~~~~
> > > > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
> > > >  REGISTER_IPA_PROXY(IPAProxyLinux)
> > > >  ^~~~~~~~~~~~~~~~~~
> > > > ../src/libcamera/include/ipa_proxy.h:58:32: error: expected primary-expression before ‘>’ token
> > > >    return std::make_unique<proxy>(ipam); \
> > > >                                 ^
> > > > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of macro ‘REGISTER_IPA_PROXY’
> > > >  REGISTER_IPA_PROXY(IPAProxyLinux)
> > > >  ^~~~~~~~~~~~~~~~~~
> > > > [13/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._android_camera3_hal.cpp.o'.
> > > > [14/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device_enumerator_udev.cpp.o'.
> > > > [15/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o'.
> > > > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o 
> > > > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamera/include -I../include/android/hardware/libhardware/include/ -I../include/android/metadata/ -I../include/android/system/core/include -Iinclude/libcamera -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -Wextra -Werror -std=c++11 -g -Wno-unused-parameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o' -c ../src/libcamera/pipeline/rkisp1/rkisp1.cpp
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘void libcamera::RkISP1CameraData::queueFrameAction(unsigned int, const libcamera::IPAOperationData&)’:
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: error: ‘make_unique’ is not a member of ‘std’
> > > >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
> > > >                                  ^~~~~~~~~~~
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:34:1:
> > > > +#include <memory>
> > > >  
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33:
> > > >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
> > > >                                  ^~~~~~~~~~~
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:66: error: expected primary-expression before ‘>’ token
> > > >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(frame,
> > > >                                                                   ^
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: left operand of comma operator has no effect [-Werror=unused-value]
> > > >             sensor_,
> > > >             ^~~~~~~
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: right operand of comma operator has no effect [-Werror=unused-value]
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘virtual int libcamera::PipelineHandlerRkISP1::queueRequestDevice(libcamera::Camera*, libcamera::Request*)’:
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: error: ‘make_unique’ is not a member of ‘std’
> > > >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
> > > >                                       ^~~~~~~~~~~
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:74: error: expected primary-expression before ‘>’ token
> > > >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
> > > >                                                                           ^
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:82: error: left operand of comma operator has no effect [-Werror=unused-value]
> > > >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuffers>(data->frame_,
> > > >                                                                             ~~~~~~^~~~~~
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:851:13: error: right operand of comma operator has no effect [-Werror=unused-value]
> > > >              this));
> > > >              ^~~~
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function ‘int libcamera::PipelineHandlerRkISP1::createCamera(libcamera::MediaEntity*)’:
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: error: ‘make_unique’ is not a member of ‘std’
> > > >    std::make_unique<RkISP1CameraData>(this);
> > > >         ^~~~~~~~~~~
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: note: ‘std::make_unique’ is defined in header ‘<memory>’; did you forget to ‘#include <memory>’?
> > > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:36: error: expected primary-expression before ‘>’ token
> > > >    std::make_unique<RkISP1CameraData>(this);
> > > >                                     ^
> > > > cc1plus: all warnings being treated as errors
> > > > ninja: build stopped: subcommand failed.
> > > > Build step 'Execute shell' marked build as failure
> > 
> > I added a clean step, just to be sure, e. g. the current build script is:
> > 
> > 	ninja -C build clean
> > 	meson build -Dandroid=true
> > 	ninja -C build
> 
> The recommended steps are
> 
> meson -Dandroid=true build
> ninja -C build clean
> ninja -C build
> 
> This will ensure the build directory is created if it doesn't exist
> before trying to run ninja in it. However, the meson step will will be a
> no-op in case the directory exists. If you want to change options for an
> existing build directory, you have to run
> 
> meson --reconfigure -Dandroid=true build
> 
> This will fail if the build directory doesn't exist. The following
> script should work in all cases.
> 
> options="-Dandroid=true"
> 
> if [[ -d build ]] ; then
> 	meson --reconfigure $options build
> else
> 	meson $options build
> fi
> 
> ninja -C build clean
> ninja -C build

It looks like you've solved this by wiping the build directory every
time. As you run ninja clean anyway, your solution won't incur much
extra cost and is simpler, so please ignore mine.

> > But it still produces errors when trying to build.
> 
> Clean is a good idea, but won't be enough when core configuration
> options of the project change I'm afraid :-( We need to wipe out the
> build directory completely, or run
> 
> meson configure -Dcpp_std=c++14 build
> 
> However, the only configuration option that requires such an operation
> to prevent breakages is cpp_std, and we don't envision switching to
> C++17 very soon. Even if we did, that would be a one time change, as
> there's no other published C++ version after that :-)
> 
> Could you handle this manually to fix the build ? No further action
> should be needed after that.
> 
> While at it, could you also set -Dv4l2=true to compile-test the V4L2
> compatibility layer ?

This should however still be added.

-- 
Regards,

Laurent Pinchart
