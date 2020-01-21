Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D976143DB8
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 14:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgAUNNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 08:13:08 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:34380 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUNNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 08:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=2XdzJO8qz1/imZ4VyfX37SmS+MH6Qc/K4rJFlTssaF4=; b=LSEy+LpG880sAbv9UItZGN0Ne
        pJYmKVuFj/GbE3rCePOpF2r1IsMcb75CDDFlirr7cwhCiyiTarTOGujVNubC7P4muy6LZ+sSpCs77
        YmvUel1Imx1WHpRZz0guAqLJ29H54T+5LN3QAJNpHueCp3U50BosqfIwFeV1jj41fGkczO37Oyan2
        sgW7Ru0jFyC+tgX9D+aAdlSdsTkryVlmXGRYttpZcB+V3YziHgVaBU93EzFCGDSgQIOOFoXxVE3MY
        Imyb81oUsgiDRuDgcwpm9wEBX6bms89tR0pPzWu8J23z8coM9mpfZAJNPXLs4rc5H6dxYZKTWFQAl
        aHRTLTGBg==;
Received: from [179.179.33.167] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ittL3-00063W-Va; Tue, 21 Jan 2020 13:13:03 +0000
Date:   Tue, 21 Jan 2020 14:12:46 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jenkins Builder Robot <jenkins@linuxtv.org>,
        linux-media@vger.kernel.org,
        LibCamera Devel <libcamera-devel@lists.libcamera.org>
Subject: Re: Build failed in Jenkins: libcamera #72
Message-ID: <20200121141246.4d1b2ac5@kernel.org>
In-Reply-To: <263aa6e2-9b6c-5939-687d-005ae8fc2059@ideasonboard.com>
References: <659134945.14.1579046596894.JavaMail.jenkins@builder.linuxtv.org>
        <263aa6e2-9b6c-5939-687d-005ae8fc2059@ideasonboard.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 19 Jan 2020 21:16:31 +0000
Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:

> Hi Mauro,
>=20
> It looks like the Jenkins jobs for Libcamera are failing continuously.
>=20
> I believe it looks like the jobs reuse an existing build configuration,
> and that doesn't get reconfigured if we change the top level meson.build
> or such.
>=20
> In particular, here we have changed to C++14, and the build should
> certainly be done from clean, as compiler flags should be updated.
>=20
>=20
> As a side note, is it possible (or desirable?) to cc
> <libcamera-devel@lists.libcamera.org> on these failures to make sure we
> see them?
>=20
> Thanks
> --
> Kieran
>=20
> On 15/01/2020 00:03, Jenkins Builder Robot wrote:
> > See <https://builder.linuxtv.org/job/libcamera/72/display/redirect?page=
=3Dchanges>
> >=20
> > Changes:
> >=20
> > [laurent.pinchart] meson.build: Switch to C++14
> >=20
> > [laurent.pinchart] libcamera: Switch from utils::make_unique to std::ma=
ke_unique
> >=20
> >=20
> > ------------------------------------------
> > Started by an SCM change
> > Running as SYSTEM
> > Building remotely on slave1 in workspace <https://builder.linuxtv.org/j=
ob/libcamera/ws/>
> > No credentials specified =20
> >  > git rev-parse --is-inside-work-tree # timeout=3D10 =20
> > Fetching changes from the remote Git repository =20
> >  > git config remote.origin.url git://linuxtv.org/libcamera.git # timeo=
ut=3D10 =20
> > Fetching upstream changes from git://linuxtv.org/libcamera.git =20
> >  > git --version # timeout=3D10
> >  > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.g=
it +refs/heads/*:refs/remotes/origin/* # timeout=3D10
> >  > git rev-parse refs/remotes/origin/master^{commit} # timeout=3D10
> >  > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=
=3D10 =20
> > Checking out Revision acf18e4265dec2991e62f7c8baecfacf1a6708b3 (refs/re=
motes/origin/master) =20
> >  > git config core.sparsecheckout # timeout=3D10
> >  > git checkout -f acf18e4265dec2991e62f7c8baecfacf1a6708b3 # timeout=
=3D10 =20
> > Commit message: "libcamera: Switch from utils::make_unique to std::make=
_unique" =20
> >  > git rev-list --no-walk 055335bf49dbcb8c149bdcd4e96004c68e6b6ece # ti=
meout=3D10 =20
> > [libcamera] $ /bin/sh -xe /tmp/jenkins2777310540601637282.sh
> > + meson build -Dandroid=3Dtrue
> > Directory already configured. =20
>=20
> ^^ This implies the previous build is being re-used.
>=20
> Perhaps for a CI job, would it make more sense to do from-scratch clean
> configure and rebuilds?
>=20
>=20
> It would be nice if meson always knew when to reconfigure, but I'm not
> sure how to make sure that always happens :-D
>=20
>=20
>=20
> >=20
> > Just run your build command (e.g. ninja) and Meson will regenerate as n=
ecessary.
> > If ninja fails, run "ninja reconfigure" or "meson --reconfigure"
> > to force Meson to regenerate.
> >=20
> > If build failures persist, run "meson setup --wipe" to rebuild from scr=
atch
> > using the same options as passed when configuring the build.
> > To change option values, run "meson configure" instead.
> > + cd build
> > + ninja
> > [0/1] Regenerating build files.
> > The Meson build system
> > Version: 0.49.2
> > Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
> > Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
> > Build type: native build
> > Project name: libcamera
> > Project version: 0.0.0
> > Native C compiler: ccache cc (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
> > Native C++ compiler: ccache c++ (gcc 8.3.0 "c++ (Debian 8.3.0-6) 8.3.0")
> > Build machine cpu family: x86_64
> > Build machine cpu: x86_64
> > Header <execinfo.h> has symbol "backtrace" : YES
> > Header <stdlib.h> has symbol "secure_getenv" : YES
> > Configuring version.h using configuration
> > Dependency libudev found: YES (cached)
> > Library atomic found: YES
> > Library dl found: YES
> > Dependency threads found: YES (cached)
> > WARNING: rcc dependencies will not work reliably until this upstream is=
sue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
> > Dependency qt5 found: YES (cached)
> > Detecting Qt5 tools
> >  moc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/moc, 5.11.3)
> >  uic: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/uic, 5.11.3)
> >  rcc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/rcc, 5.11.3)
> >  lrelease: NO
> > Program doxygen found: YES (/usr/bin/doxygen)
> > Configuring Doxyfile using configuration
> > Program sphinx-build-3 found: NO
> > Program sphinx-build found: YES (/usr/bin/sphinx-build)
> > Configuring config.h using configuration
> > Build targets in project: 68
> > Option werror is: True [default: true]
> > Option cpp_std is: c++11 [default: c++14]
> > Found ninja-1.8.2 at /usr/bin/ninja
> > [1/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/buffer.=
cpp.o'.
> > [2/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/message=
.cpp.o'.
> > [3/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/object.=
cpp.o'.
> > [4/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media_o=
bject.cpp.o'.
> > [5/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/process=
.cpp.o'.
> > [6/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipelin=
e_vimc.cpp.o'.
> > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o=20
> > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src=
/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamer=
a/include -I../include/android/hardware/libhardware/include/ -I../include/a=
ndroid/metadata/ -I../include/android/system/core/include -Iinclude/libcame=
ra -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winva=
lid-pch -Wnon-virtual-dtor -Wextra -Werror -std=3Dc++11 -g -Wno-unused-para=
meter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@cam=
era@sha/pipeline_vimc.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipelin=
e_vimc.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o' =
-c ../src/libcamera/pipeline/vimc.cpp
> > ../src/libcamera/pipeline/vimc.cpp: In member function =E2=80=98virtual=
 bool libcamera::PipelineHandlerVimc::match(libcamera::DeviceEnumerator*)=
=E2=80=99:
> > ../src/libcamera/pipeline/vimc.cpp:368:46: error: =E2=80=98make_unique=
=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> >   std::unique_ptr<VimcCameraData> data =3D std::make_unique<VimcCameraD=
ata>(this);
> >                                               ^~~~~~~~~~~
> > ../src/libcamera/pipeline/vimc.cpp:368:46: note: =E2=80=98std::make_uni=
que=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did you forge=
t to =E2=80=98#include <memory>=E2=80=99?
> > ../src/libcamera/pipeline/vimc.cpp:34:1:
> > +#include <memory>
> > =20
> > ../src/libcamera/pipeline/vimc.cpp:368:46:
> >   std::unique_ptr<VimcCameraData> data =3D std::make_unique<VimcCameraD=
ata>(this);
> >                                               ^~~~~~~~~~~
> > ../src/libcamera/pipeline/vimc.cpp:368:72: error: expected primary-expr=
ession before =E2=80=98>=E2=80=99 token
> >   std::unique_ptr<VimcCameraData> data =3D std::make_unique<VimcCameraD=
ata>(this);
> >                                                                        =
 ^
> > [7/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/framebu=
ffer_allocator.cpp.o'.
> > [8/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipelin=
e_ipu3_ipu3.cpp.o'.
> > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o=20
> > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src=
/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamer=
a/include -I../include/android/hardware/libhardware/include/ -I../include/a=
ndroid/metadata/ -I../include/android/system/core/include -Iinclude/libcame=
ra -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winva=
lid-pch -Wnon-virtual-dtor -Wextra -Werror -std=3Dc++11 -g -Wno-unused-para=
meter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@cam=
era@sha/pipeline_ipu3_ipu3.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pi=
peline_ipu3_ipu3.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_ip=
u3_ipu3.cpp.o' -c ../src/libcamera/pipeline/ipu3/ipu3.cpp
> > ../src/libcamera/pipeline/ipu3/ipu3.cpp: In member function =E2=80=98in=
t libcamera::PipelineHandlerIPU3::registerCameras()=E2=80=99:
> > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: error: =E2=80=98make_uni=
que=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> >     std::make_unique<IPU3CameraData>(this);
> >          ^~~~~~~~~~~
> > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: note: =E2=80=98std::make=
_unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did you f=
orget to =E2=80=98#include <memory>=E2=80=99?
> > ../src/libcamera/pipeline/ipu3/ipu3.cpp:29:1:
> > +#include <memory>
> > =20
> > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9:
> >     std::make_unique<IPU3CameraData>(this);
> >          ^~~~~~~~~~~
> > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:35: error: expected primary=
-expression before =E2=80=98>=E2=80=99 token
> >     std::make_unique<IPU3CameraData>(this);
> >                                    ^
> > [9/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/request=
.cpp.o'.
> > [10/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeli=
ne_rkisp1_timeline.cpp.o'.
> > [11/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeli=
ne_handler.cpp.o'.
> > [12/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/proxy_=
ipa_proxy_linux.cpp.o'.
> > FAILED: src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o=20
> > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src=
/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamer=
a/include -I../include/android/hardware/libhardware/include/ -I../include/a=
ndroid/metadata/ -I../include/android/system/core/include -Iinclude/libcame=
ra -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winva=
lid-pch -Wnon-virtual-dtor -Wextra -Werror -std=3Dc++11 -g -Wno-unused-para=
meter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@cam=
era@sha/proxy_ipa_proxy_linux.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha=
/proxy_ipa_proxy_linux.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/proxy=
_ipa_proxy_linux.cpp.o' -c ../src/libcamera/proxy/ipa_proxy_linux.cpp
> > In file included from ../src/libcamera/proxy/ipa_proxy_linux.cpp:14:
> > ../src/libcamera/proxy/ipa_proxy_linux.cpp: In member function =E2=80=
=98virtual std::unique_ptr<libcamera::IPAProxy> libcamera::IPAProxyLinuxFac=
tory::create(libcamera::IPAModule*)=E2=80=99:
> > ../src/libcamera/include/ipa_proxy.h:58:15: error: =E2=80=98make_unique=
=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> >    return std::make_unique<proxy>(ipam); \
> >                ^~~~~~~~~~~
> > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of =
macro =E2=80=98REGISTER_IPA_PROXY=E2=80=99
> >  REGISTER_IPA_PROXY(IPAProxyLinux)
> >  ^~~~~~~~~~~~~~~~~~
> > ../src/libcamera/include/ipa_proxy.h:58:15: note: =E2=80=98std::make_un=
ique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did you forg=
et to =E2=80=98#include <memory>=E2=80=99?
> >    return std::make_unique<proxy>(ipam); \
> >                ^~~~~~~~~~~
> > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of =
macro =E2=80=98REGISTER_IPA_PROXY=E2=80=99
> >  REGISTER_IPA_PROXY(IPAProxyLinux)
> >  ^~~~~~~~~~~~~~~~~~
> > ../src/libcamera/include/ipa_proxy.h:58:32: error: expected primary-exp=
ression before =E2=80=98>=E2=80=99 token
> >    return std::make_unique<proxy>(ipam); \
> >                                 ^
> > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion of =
macro =E2=80=98REGISTER_IPA_PROXY=E2=80=99
> >  REGISTER_IPA_PROXY(IPAProxyLinux)
> >  ^~~~~~~~~~~~~~~~~~
> > [13/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._and=
roid_camera3_hal.cpp.o'.
> > [14/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/device=
_enumerator_udev.cpp.o'.
> > [15/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipeli=
ne_rkisp1_rkisp1.cpp.o'.
> > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.o=
=20
> > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../src=
/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcamer=
a/include -I../include/android/hardware/libhardware/include/ -I../include/a=
ndroid/metadata/ -I../include/android/system/core/include -Iinclude/libcame=
ra -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winva=
lid-pch -Wnon-virtual-dtor -Wextra -Werror -std=3Dc++11 -g -Wno-unused-para=
meter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@cam=
era@sha/pipeline_rkisp1_rkisp1.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sh=
a/pipeline_rkisp1_rkisp1.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pip=
eline_rkisp1_rkisp1.cpp.o' -c ../src/libcamera/pipeline/rkisp1/rkisp1.cpp
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function =E2=80=
=98void libcamera::RkISP1CameraData::queueFrameAction(unsigned int, const l=
ibcamera::IPAOperationData&)=E2=80=99:
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: error: =E2=80=98mak=
e_unique=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(fra=
me,
> >                                  ^~~~~~~~~~~
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: note: =E2=80=98std:=
:make_unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did =
you forget to =E2=80=98#include <memory>=E2=80=99?
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:34:1:
> > +#include <memory>
> > =20
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33:
> >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(fra=
me,
> >                                  ^~~~~~~~~~~
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:66: error: expected pri=
mary-expression before =E2=80=98>=E2=80=99 token
> >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(fra=
me,
> >                                                                   ^
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: left operand=
 of comma operator has no effect [-Werror=3Dunused-value]
> >             sensor_,
> >             ^~~~~~~
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: right operan=
d of comma operator has no effect [-Werror=3Dunused-value]
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function =E2=80=
=98virtual int libcamera::PipelineHandlerRkISP1::queueRequestDevice(libcame=
ra::Camera*, libcamera::Request*)=E2=80=99:
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: error: =E2=80=98mak=
e_unique=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuff=
ers>(data->frame_,
> >                                       ^~~~~~~~~~~
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: note: =E2=80=98std:=
:make_unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did =
you forget to =E2=80=98#include <memory>=E2=80=99?
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:74: error: expected pri=
mary-expression before =E2=80=98>=E2=80=99 token
> >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuff=
ers>(data->frame_,
> >                                                                        =
   ^
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:82: error: left operand=
 of comma operator has no effect [-Werror=3Dunused-value]
> >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBuff=
ers>(data->frame_,
> >                                                                        =
     ~~~~~~^~~~~~
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:851:13: error: right operan=
d of comma operator has no effect [-Werror=3Dunused-value]
> >              this));
> >              ^~~~
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function =E2=80=
=98int libcamera::PipelineHandlerRkISP1::createCamera(libcamera::MediaEntit=
y*)=E2=80=99:
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: error: =E2=80=98make=
_unique=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> >    std::make_unique<RkISP1CameraData>(this);
> >         ^~~~~~~~~~~
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: note: =E2=80=98std::=
make_unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did y=
ou forget to =E2=80=98#include <memory>=E2=80=99?
> > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:36: error: expected pri=
mary-expression before =E2=80=98>=E2=80=99 token
> >    std::make_unique<RkISP1CameraData>(this);
> >                                     ^
> > cc1plus: all warnings being treated as errors
> > ninja: build stopped: subcommand failed.
> > Build step 'Execute shell' marked build as failure

I added a clean step, just to be sure, e. g. the current build script is:

	ninja -C build clean
	meson build -Dandroid=3Dtrue
	ninja -C build

But it still produces errors when trying to build.


Cheers,
Mauro
