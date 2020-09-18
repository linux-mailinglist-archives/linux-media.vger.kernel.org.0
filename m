Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8ED26FE82
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 15:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgIRNbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 09:31:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36888 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIRNbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 09:31:07 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E59C42D7;
        Fri, 18 Sep 2020 15:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600435865;
        bh=qMolTnCWJLZyuyIWhilqrpZhIrhooRurMVjCCVrkHUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LnrGXLeODbfQRMR9Xv4ka8o+ewjpEepo7rC/jsul3zsw0WXieZZPMnoZvZnMiUqZu
         vJi3WTcoPVQC+nAS+URx6xk0lHsopx6ZEDke2usnLw9e7h73b7YJh8HjAJTgwQL+X/
         Bew6YJkEuhp9CDIquezM0iiEtVhd4bYPJQUH1DO0=
Date:   Fri, 18 Sep 2020 16:30:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     mchehab@kernel.org
Cc:     Jenkins Builder Robot <jenkins@linuxtv.org>,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: [libcamera-devel] Build failed in Jenkins: libcamera #294
Message-ID: <20200918133033.GA28436@pendragon.ideasonboard.com>
References: <1170002497.6.1600426996226@builder.linuxtv.org>
 <1219298116.7.1600435091483@builder.linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1219298116.7.1600435091483@builder.linuxtv.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Fri, Sep 18, 2020 at 01:18:11PM +0000, Jenkins Builder Robot wrote:
> See <https://builder.linuxtv.org/job/libcamera/294/display/redirect?page=changes>
> 
> Changes:
> 
> [jacopo] libcamera: ipu3: Always use sensor full frame size
> 
> 
> ------------------------------------------
> Started by an SCM change
> Running as SYSTEM
> Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
> The recommended git tool is: NONE
> No credentials specified
>  > git rev-parse --is-inside-work-tree # timeout=10
> Fetching changes from the remote Git repository
>  > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
> Fetching upstream changes from git://linuxtv.org/libcamera.git
>  > git --version # timeout=10
>  > git --version # 'git version 2.20.1'
>  > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
>  > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
>  > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
> Checking out Revision 7208e70211a6ea35b9d889aedf942e607d20d66a (refs/remotes/origin/master)
>  > git config core.sparsecheckout # timeout=10
>  > git checkout -f 7208e70211a6ea35b9d889aedf942e607d20d66a # timeout=10
> Commit message: "libcamera: ipu3: Always use sensor full frame size"
>  > git rev-list --no-walk 45fe8e99c83889816df320c6d27f7a2019744693 # timeout=10
> [Checks API] No suitable checks publisher found.
> [libcamera] $ /bin/sh -xe /tmp/jenkins15984653505809101702.sh
> + rm -rf build
> + meson setup build
> The Meson build system
> Version: 0.52.1
> Source dir: <https://builder.linuxtv.org/job/libcamera/ws/>
> Build dir: <https://builder.linuxtv.org/job/libcamera/ws/build>
> Build type: native build
> Project name: libcamera
> Project version: 0.0.0
> C compiler for the host machine: ccache cc (gcc 8.3.0 "cc (Debian 8.3.0-6) 8.3.0")
> C linker for the host machine: GNU ld.bfd 2.31.1
> C++ compiler for the host machine: ccache c++ (gcc 8.3.0 "c++ (Debian 8.3.0-6) 8.3.0")
> C++ linker for the host machine: GNU ld.bfd 2.31.1
> Host machine cpu family: x86_64
> Host machine cpu: x86_64
> Header <execinfo.h> has symbol "backtrace" : YES 
> Header <stdlib.h> has symbol "secure_getenv" : YES 
> Compiler for C supports arguments -Wno-c99-designator -Wc99-designator: NO 
> Configuring version.h using configuration
> Dependency libexif skipped: feature android disabled
> Dependency libjpeg skipped: feature android disabled
> Program openssl found: YES (/usr/bin/openssl)
> Library atomic found: YES
> Library dl found: YES
> Library gnutls found: YES
> Found pkg-config: /usr/bin/pkg-config (0.29)
> Run-time dependency libudev found: YES 241
> Run-time dependency threads found: YES 
> Run-time dependency Boost found: YES 1.67
> Program ipa-sign-install.sh found: YES (<https://builder.linuxtv.org/job/libcamera/ws/src/ipa/ipa-sign-install.sh)>
> WARNING: rcc dependencies will not work reliably until this upstream issue is fixed: https://bugreports.qt.io/browse/QTBUG-45460
> Run-time dependency qt5 (modules: Core, Gui, Widgets) found: YES 5.11.3 (pkg-config)
> Run-time dependency libtiff-4 found: YES 4.1.0
> Header <QOpenGLWidget> has symbol "QOpenGLWidget" with dependency qt5: YES 
> Detecting Qt5 tools
>  moc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/moc, 5.11.3)
>  uic: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/uic, 5.11.3)
>  rcc: YES (/usr/lib/x86_64-linux-gnu/qt5/bin/rcc, 5.11.3)
>  lrelease: NO
> Run-time dependency glib-2.0 found: YES 2.58.3
> Did not find CMake 'cmake'
> Found CMake: NO
> Run-time dependency gstreamer-video-1.0 found: NO (tried pkgconfig and cmake)
> Run-time dependency gstreamer-allocators-1.0 found: NO (tried pkgconfig and cmake)
> Program doxygen found: YES (/usr/bin/doxygen)
> Configuring Doxyfile using configuration
> Program sphinx-build-3 found: NO
> Program sphinx-build found: YES (/var/lib/jenkins/.local/bin/sphinx-build)
> meson.build:123: WARNING: The current running kernel version 4.19.0-6-amd64 is too old to run libcamera.
> meson.build:125: WARNING: If you intend to use libcamera on this machine, please upgrade to a kernel >= 5.0.0.
> Configuring config.h using configuration
> Message: Enabled pipelines: ipu3, raspberrypi, rkisp1, simple, uvcvideo, vimc
> Build targets in project: 84
> Found ninja-1.8.2 at /usr/bin/ninja
> + meson configure -Dandroid=true -Dv4l2=true build
> 
> ERROR: Value "true" for combo option is not one of the choices. Possible choices are: "enabled", "disabled", "auto".
> Build step 'Execute shell' marked build as failure

We have changed the android configuration option. Could you please
update the build script to use -Dandroid=auto instead of -Dandroid=true
?

-- 
Regards,

Laurent Pinchart
