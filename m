Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65594143E76
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 14:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgAUNqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 08:46:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:45666 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729127AbgAUNqW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 08:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=39mIOJnvAOZocdv5eMtc0eYGyNb4FeXfZ+rYT4f1y5E=; b=TF5ywj4tVrgK+gPLsbGids5Jz
        hhgwHPWgbg3FEs39+ATtS/sCvjzh0Nu/bZazkB6AAHg3y1xtYq3wCz5e/oIyYSHlrGGj7cLrTxlxo
        FPrKfqxAC3/Ui/PI1UqkpIWMiEJmEFtf2uYk/PjYO6BfvEbpb9i2QpBtFE5Ort7tCV0kiRjeP9ops
        iy3k80Kh0tP6vaCis3yR3gIeRvl7l+ugm8BFFsqy5z3fuiwY+RDUht4AyBzgwMSAhbe3TI8BUWbhX
        j2pOTA9HtORrutxhcB1xUihFAbQWtIky8fd+b/hZx/IaV0fle18inXOfux77g2EI6jFSf4w1NGa6F
        Sjusmr92Q==;
Received: from [179.179.33.167] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ittrG-0001j9-G2; Tue, 21 Jan 2020 13:46:19 +0000
Date:   Tue, 21 Jan 2020 14:46:06 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jenkins Builder Robot <jenkins@linuxtv.org>,
        linux-media@vger.kernel.org,
        LibCamera Devel <libcamera-devel@lists.libcamera.org>
Subject: Re: Build failed in Jenkins: libcamera #72
Message-ID: <20200121144606.619468d0@kernel.org>
In-Reply-To: <20200121141246.4d1b2ac5@kernel.org>
References: <659134945.14.1579046596894.JavaMail.jenkins@builder.linuxtv.org>
        <263aa6e2-9b6c-5939-687d-005ae8fc2059@ideasonboard.com>
        <20200121141246.4d1b2ac5@kernel.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 21 Jan 2020 14:12:46 +0100
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Sun, 19 Jan 2020 21:16:31 +0000
> Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:
>=20
> > Hi Mauro,
> >=20
> > It looks like the Jenkins jobs for Libcamera are failing continuously.
> >=20
> > I believe it looks like the jobs reuse an existing build configuration,
> > and that doesn't get reconfigured if we change the top level meson.build
> > or such.
> >=20
> > In particular, here we have changed to C++14, and the build should
> > certainly be done from clean, as compiler flags should be updated.
> >=20
> >=20
> > As a side note, is it possible (or desirable?) to cc
> > <libcamera-devel@lists.libcamera.org> on these failures to make sure we
> > see them?
> >=20
> > Thanks
> > --
> > Kieran
> >=20
> > On 15/01/2020 00:03, Jenkins Builder Robot wrote: =20
> > > See <https://builder.linuxtv.org/job/libcamera/72/display/redirect?pa=
ge=3Dchanges>
> > >=20
> > > Changes:
> > >=20
> > > [laurent.pinchart] meson.build: Switch to C++14
> > >=20
> > > [laurent.pinchart] libcamera: Switch from utils::make_unique to std::=
make_unique
> > >=20
> > >=20
> > > ------------------------------------------
> > > Started by an SCM change
> > > Running as SYSTEM
> > > Building remotely on slave1 in workspace <https://builder.linuxtv.org=
/job/libcamera/ws/>
> > > No credentials specified   =20
> > >  > git rev-parse --is-inside-work-tree # timeout=3D10   =20
> > > Fetching changes from the remote Git repository   =20
> > >  > git config remote.origin.url git://linuxtv.org/libcamera.git # tim=
eout=3D10   =20
> > > Fetching upstream changes from git://linuxtv.org/libcamera.git   =20
> > >  > git --version # timeout=3D10
> > >  > git fetch --tags --force --progress -- git://linuxtv.org/libcamera=
.git +refs/heads/*:refs/remotes/origin/* # timeout=3D10
> > >  > git rev-parse refs/remotes/origin/master^{commit} # timeout=3D10
> > >  > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=
=3D10   =20
> > > Checking out Revision acf18e4265dec2991e62f7c8baecfacf1a6708b3 (refs/=
remotes/origin/master)   =20
> > >  > git config core.sparsecheckout # timeout=3D10
> > >  > git checkout -f acf18e4265dec2991e62f7c8baecfacf1a6708b3 # timeout=
=3D10   =20
> > > Commit message: "libcamera: Switch from utils::make_unique to std::ma=
ke_unique"   =20
> > >  > git rev-list --no-walk 055335bf49dbcb8c149bdcd4e96004c68e6b6ece # =
timeout=3D10   =20
> > > [libcamera] $ /bin/sh -xe /tmp/jenkins2777310540601637282.sh
> > > + meson build -Dandroid=3Dtrue
> > > Directory already configured.   =20
> >=20
> > ^^ This implies the previous build is being re-used.
> >=20
> > Perhaps for a CI job, would it make more sense to do from-scratch clean
> > configure and rebuilds?
> >=20
> >=20
> > It would be nice if meson always knew when to reconfigure, but I'm not
> > sure how to make sure that always happens :-D
> >=20
> >=20
> >  =20
> > >=20
> > > Just run your build command (e.g. ninja) and Meson will regenerate as=
 necessary.
> > > If ninja fails, run "ninja reconfigure" or "meson --reconfigure"
> > > to force Meson to regenerate.
> > >=20
> > > If build failures persist, run "meson setup --wipe" to rebuild from s=
cratch
> > > using the same options as passed when configuring the build.
> > > To change option values, run "meson configure" instead.
> > > + cd build
> > > + ninja
> > > [0/1] Regenerating build files.
> > > The Meson build system
> > > Version: 0.49.2
> > > Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
> > > Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
> > > Build type: native build
> > > Project name: libcamera
> > > Project version: 0.0.0
> > > Native C compiler: ccache cc (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
> > > Native C++ compiler: ccache c++ (gcc 8.3.0 "c++ (Debian 8.3.0-6) 8.3.=
0")
> > > Build machine cpu family: x86_64
> > > Build machine cpu: x86_64
> > > Header <execinfo.h> has symbol "backtrace" : YES
> > > Header <stdlib.h> has symbol "secure_getenv" : YES
> > > Configuring version.h using configuration
> > > Dependency libudev found: YES (cached)
> > > Library atomic found: YES
> > > Library dl found: YES
> > > Dependency threads found: YES (cached)
> > > WARNING: rcc dependencies will not work reliably until this upstream =
issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
> > > Dependency qt5 found: YES (cached)
> > > Detecting Qt5 tools
> > >  moc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/moc, 5.11.3)
> > >  uic: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/uic, 5.11.3)
> > >  rcc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/rcc, 5.11.3)
> > >  lrelease: NO
> > > Program doxygen found: YES (/usr/bin/doxygen)
> > > Configuring Doxyfile using configuration
> > > Program sphinx-build-3 found: NO
> > > Program sphinx-build found: YES (/usr/bin/sphinx-build)
> > > Configuring config.h using configuration
> > > Build targets in project: 68
> > > Option werror is: True [default: true]
> > > Option cpp_std is: c++11 [default: c++14]
> > > Found ninja-1.8.2 at /usr/bin/ninja
> > > [1/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/buffe=
r.cpp.o'.
> > > [2/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/messa=
ge.cpp.o'.
> > > [3/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/objec=
t.cpp.o'.
> > > [4/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/media=
_object.cpp.o'.
> > > [5/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/proce=
ss.cpp.o'.
> > > [6/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipel=
ine_vimc.cpp.o'.
> > > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o=20
> > > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../s=
rc/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcam=
era/include -I../include/android/hardware/libhardware/include/ -I../include=
/android/metadata/ -I../include/android/system/core/include -Iinclude/libca=
mera -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Win=
valid-pch -Wnon-virtual-dtor -Wextra -Werror -std=3Dc++11 -g -Wno-unused-pa=
rameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@c=
amera@sha/pipeline_vimc.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/pipel=
ine_vimc.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_vimc.cpp.o=
' -c ../src/libcamera/pipeline/vimc.cpp
> > > ../src/libcamera/pipeline/vimc.cpp: In member function =E2=80=98virtu=
al bool libcamera::PipelineHandlerVimc::match(libcamera::DeviceEnumerator*)=
=E2=80=99:
> > > ../src/libcamera/pipeline/vimc.cpp:368:46: error: =E2=80=98make_uniqu=
e=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> > >   std::unique_ptr<VimcCameraData> data =3D std::make_unique<VimcCamer=
aData>(this);
> > >                                               ^~~~~~~~~~~
> > > ../src/libcamera/pipeline/vimc.cpp:368:46: note: =E2=80=98std::make_u=
nique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did you for=
get to =E2=80=98#include <memory>=E2=80=99?
> > > ../src/libcamera/pipeline/vimc.cpp:34:1:
> > > +#include <memory>
> > > =20
> > > ../src/libcamera/pipeline/vimc.cpp:368:46:
> > >   std::unique_ptr<VimcCameraData> data =3D std::make_unique<VimcCamer=
aData>(this);
> > >                                               ^~~~~~~~~~~
> > > ../src/libcamera/pipeline/vimc.cpp:368:72: error: expected primary-ex=
pression before =E2=80=98>=E2=80=99 token
> > >   std::unique_ptr<VimcCameraData> data =3D std::make_unique<VimcCamer=
aData>(this);
> > >                                                                      =
   ^
> > > [7/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/frame=
buffer_allocator.cpp.o'.
> > > [8/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipel=
ine_ipu3_ipu3.cpp.o'.
> > > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_ipu3_ipu3.cpp.o=20
> > > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../s=
rc/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcam=
era/include -I../include/android/hardware/libhardware/include/ -I../include=
/android/metadata/ -I../include/android/system/core/include -Iinclude/libca=
mera -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Win=
valid-pch -Wnon-virtual-dtor -Wextra -Werror -std=3Dc++11 -g -Wno-unused-pa=
rameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@c=
amera@sha/pipeline_ipu3_ipu3.cpp.o' -MF 'src/libcamera/4ab8042@@camera@sha/=
pipeline_ipu3_ipu3.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pipeline_=
ipu3_ipu3.cpp.o' -c ../src/libcamera/pipeline/ipu3/ipu3.cpp
> > > ../src/libcamera/pipeline/ipu3/ipu3.cpp: In member function =E2=80=98=
int libcamera::PipelineHandlerIPU3::registerCameras()=E2=80=99:
> > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: error: =E2=80=98make_u=
nique=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> > >     std::make_unique<IPU3CameraData>(this);
> > >          ^~~~~~~~~~~
> > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9: note: =E2=80=98std::ma=
ke_unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did you=
 forget to =E2=80=98#include <memory>=E2=80=99?
> > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:29:1:
> > > +#include <memory>
> > > =20
> > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:9:
> > >     std::make_unique<IPU3CameraData>(this);
> > >          ^~~~~~~~~~~
> > > ../src/libcamera/pipeline/ipu3/ipu3.cpp:879:35: error: expected prima=
ry-expression before =E2=80=98>=E2=80=99 token
> > >     std::make_unique<IPU3CameraData>(this);
> > >                                    ^
> > > [9/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/reque=
st.cpp.o'.
> > > [10/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipe=
line_rkisp1_timeline.cpp.o'.
> > > [11/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipe=
line_handler.cpp.o'.
> > > [12/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/prox=
y_ipa_proxy_linux.cpp.o'.
> > > FAILED: src/libcamera/4ab8042@@camera@sha/proxy_ipa_proxy_linux.cpp.o=
=20
> > > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../s=
rc/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcam=
era/include -I../include/android/hardware/libhardware/include/ -I../include=
/android/metadata/ -I../include/android/system/core/include -Iinclude/libca=
mera -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Win=
valid-pch -Wnon-virtual-dtor -Wextra -Werror -std=3Dc++11 -g -Wno-unused-pa=
rameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@c=
amera@sha/proxy_ipa_proxy_linux.cpp.o' -MF 'src/libcamera/4ab8042@@camera@s=
ha/proxy_ipa_proxy_linux.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/pro=
xy_ipa_proxy_linux.cpp.o' -c ../src/libcamera/proxy/ipa_proxy_linux.cpp
> > > In file included from ../src/libcamera/proxy/ipa_proxy_linux.cpp:14:
> > > ../src/libcamera/proxy/ipa_proxy_linux.cpp: In member function =E2=80=
=98virtual std::unique_ptr<libcamera::IPAProxy> libcamera::IPAProxyLinuxFac=
tory::create(libcamera::IPAModule*)=E2=80=99:
> > > ../src/libcamera/include/ipa_proxy.h:58:15: error: =E2=80=98make_uniq=
ue=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> > >    return std::make_unique<proxy>(ipam); \
> > >                ^~~~~~~~~~~
> > > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion o=
f macro =E2=80=98REGISTER_IPA_PROXY=E2=80=99
> > >  REGISTER_IPA_PROXY(IPAProxyLinux)
> > >  ^~~~~~~~~~~~~~~~~~
> > > ../src/libcamera/include/ipa_proxy.h:58:15: note: =E2=80=98std::make_=
unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did you fo=
rget to =E2=80=98#include <memory>=E2=80=99?
> > >    return std::make_unique<proxy>(ipam); \
> > >                ^~~~~~~~~~~
> > > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion o=
f macro =E2=80=98REGISTER_IPA_PROXY=E2=80=99
> > >  REGISTER_IPA_PROXY(IPAProxyLinux)
> > >  ^~~~~~~~~~~~~~~~~~
> > > ../src/libcamera/include/ipa_proxy.h:58:32: error: expected primary-e=
xpression before =E2=80=98>=E2=80=99 token
> > >    return std::make_unique<proxy>(ipam); \
> > >                                 ^
> > > ../src/libcamera/proxy/ipa_proxy_linux.cpp:93:1: note: in expansion o=
f macro =E2=80=98REGISTER_IPA_PROXY=E2=80=99
> > >  REGISTER_IPA_PROXY(IPAProxyLinux)
> > >  ^~~~~~~~~~~~~~~~~~
> > > [13/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/.._a=
ndroid_camera3_hal.cpp.o'.
> > > [14/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/devi=
ce_enumerator_udev.cpp.o'.
> > > [15/144] Compiling C++ object 'src/libcamera/4ab8042@@camera@sha/pipe=
line_rkisp1_rkisp1.cpp.o'.
> > > FAILED: src/libcamera/4ab8042@@camera@sha/pipeline_rkisp1_rkisp1.cpp.=
o=20
> > > ccache c++ -Isrc/libcamera/4ab8042@@camera@sha -Isrc/libcamera -I../s=
rc/libcamera -Iinclude -I../include -Isrc/libcamera/include -I../src/libcam=
era/include -I../include/android/hardware/libhardware/include/ -I../include=
/android/metadata/ -I../include/android/system/core/include -Iinclude/libca=
mera -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Win=
valid-pch -Wnon-virtual-dtor -Wextra -Werror -std=3Dc++11 -g -Wno-unused-pa=
rameter -include config.h -fPIC -pthread  -MD -MQ 'src/libcamera/4ab8042@@c=
amera@sha/pipeline_rkisp1_rkisp1.cpp.o' -MF 'src/libcamera/4ab8042@@camera@=
sha/pipeline_rkisp1_rkisp1.cpp.o.d' -o 'src/libcamera/4ab8042@@camera@sha/p=
ipeline_rkisp1_rkisp1.cpp.o' -c ../src/libcamera/pipeline/rkisp1/rkisp1.cpp
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function =E2=
=80=98void libcamera::RkISP1CameraData::queueFrameAction(unsigned int, cons=
t libcamera::IPAOperationData&)=E2=80=99:
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: error: =E2=80=98m=
ake_unique=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> > >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(f=
rame,
> > >                                  ^~~~~~~~~~~
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33: note: =E2=80=98st=
d::make_unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; di=
d you forget to =E2=80=98#include <memory>=E2=80=99?
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:34:1:
> > > +#include <memory>
> > > =20
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:33:
> > >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(f=
rame,
> > >                                  ^~~~~~~~~~~
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:391:66: error: expected p=
rimary-expression before =E2=80=98>=E2=80=99 token
> > >    timeline_.scheduleAction(std::make_unique<RkISP1ActionSetSensor>(f=
rame,
> > >                                                                   ^
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: left opera=
nd of comma operator has no effect [-Werror=3Dunused-value]
> > >             sensor_,
> > >             ^~~~~~~
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:392:12: error: right oper=
and of comma operator has no effect [-Werror=3Dunused-value]
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function =E2=
=80=98virtual int libcamera::PipelineHandlerRkISP1::queueRequestDevice(libc=
amera::Camera*, libcamera::Request*)=E2=80=99:
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: error: =E2=80=98m=
ake_unique=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> > >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBu=
ffers>(data->frame_,
> > >                                       ^~~~~~~~~~~
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:38: note: =E2=80=98st=
d::make_unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; di=
d you forget to =E2=80=98#include <memory>=E2=80=99?
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:74: error: expected p=
rimary-expression before =E2=80=98>=E2=80=99 token
> > >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBu=
ffers>(data->frame_,
> > >                                                                      =
     ^
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:849:82: error: left opera=
nd of comma operator has no effect [-Werror=3Dunused-value]
> > >   data->timeline_.scheduleAction(std::make_unique<RkISP1ActionQueueBu=
ffers>(data->frame_,
> > >                                                                      =
       ~~~~~~^~~~~~
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:851:13: error: right oper=
and of comma operator has no effect [-Werror=3Dunused-value]
> > >              this));
> > >              ^~~~
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp: In member function =E2=
=80=98int libcamera::PipelineHandlerRkISP1::createCamera(libcamera::MediaEn=
tity*)=E2=80=99:
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: error: =E2=80=98ma=
ke_unique=E2=80=99 is not a member of =E2=80=98std=E2=80=99
> > >    std::make_unique<RkISP1CameraData>(this);
> > >         ^~~~~~~~~~~
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:8: note: =E2=80=98std=
::make_unique=E2=80=99 is defined in header =E2=80=98<memory>=E2=80=99; did=
 you forget to =E2=80=98#include <memory>=E2=80=99?
> > > ../src/libcamera/pipeline/rkisp1/rkisp1.cpp:895:36: error: expected p=
rimary-expression before =E2=80=98>=E2=80=99 token
> > >    std::make_unique<RkISP1CameraData>(this);
> > >                                     ^
> > > cc1plus: all warnings being treated as errors
> > > ninja: build stopped: subcommand failed.
> > > Build step 'Execute shell' marked build as failure =20
>=20
> I added a clean step, just to be sure, e. g. the current build script is:
>=20
> 	ninja -C build clean
> 	meson build -Dandroid=3Dtrue
> 	ninja -C build
>=20
> But it still produces errors when trying to build.

Changed the recipe to:

	meson setup --wipe build
	meson configure build
	ninja -C build

This way, it should wipe the build information every time, and display the
config it will use for the build.

Job is succeeding with the above.=20

Cheers,
Mauro
