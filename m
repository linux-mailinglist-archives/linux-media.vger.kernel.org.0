Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7541CE730
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 23:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgEKVMk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 17:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725810AbgEKVMk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 17:12:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A6FC061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 14:12:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5E7433E;
        Mon, 11 May 2020 23:12:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589231559;
        bh=+5KV0ZyJ0DfI8rVtB41i6s1lTNNkcKZjFVdUEKK0hf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=svdhWDxIOGPWQIiERZZl9MoM6pV+6E6UBeKH2cceL2cDYIkdyqLLI1Kp5/KL+/IFH
         +U+ozk8cS2LDiv7WVIsnbJnvP6Hblu64ZAa2HoUFFnOEMjNCeGETC2Nulhfe0oqXTU
         0C/6KOaWqRMWcqSsH1YnZLp/5euOvIzKDbdF1+ag=
Date:   Tue, 12 May 2020 00:12:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jenkins Builder Robot <jenkins@linuxtv.org>
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: Re: [libcamera-devel] Build failed in Jenkins: libcamera #172
Message-ID: <20200511211232.GG5830@pendragon.ideasonboard.com>
References: <2081683680.23.1589231002255.JavaMail.jenkins@builder.linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2081683680.23.1589231002255.JavaMail.jenkins@builder.linuxtv.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, May 11, 2020 at 09:03:22PM +0000, Jenkins Builder Robot wrote:
> See <https://builder.linuxtv.org/job/libcamera/172/display/redirect?page=changes>
> 
> Changes:
> 
> [laurent.pinchart] LICENSES: Add BSD-2-Clause license
> 
> [laurent.pinchart] include: uapi: Add header definitions for BCM2835 Unicam and ISP blocks
> 
> [laurent.pinchart] libcamera: pipeline: Raspberry Pi pipeline handler
> 
> [laurent.pinchart] libcamera: ipa: Raspberry Pi IPA
> 
> [laurent.pinchart] libcamera: utils: Raspberry Pi Camera Tuning Tool
> 
> [laurent.pinchart] libcamera: raspberrypi: Add components to meson build
> 
> 
> ------------------------------------------
> Started by an SCM change
> Running as SYSTEM
> Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/libcamera/ws/>
> No credentials specified
>  > git rev-parse --is-inside-work-tree # timeout=10
> Fetching changes from the remote Git repository
>  > git config remote.origin.url git://linuxtv.org/libcamera.git # timeout=10
> Fetching upstream changes from git://linuxtv.org/libcamera.git
>  > git --version # timeout=10
>  > git fetch --tags --force --progress -- git://linuxtv.org/libcamera.git +refs/heads/*:refs/remotes/origin/* # timeout=10
>  > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
>  > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
> Checking out Revision 4bb5b1f60248ada4a26e1114940d1bff1cae5bfc (refs/remotes/origin/master)
>  > git config core.sparsecheckout # timeout=10
>  > git checkout -f 4bb5b1f60248ada4a26e1114940d1bff1cae5bfc # timeout=10
> Commit message: "libcamera: raspberrypi: Add components to meson build"
>  > git rev-list --no-walk 019a145068b714482bbf791c0f296abd06ec0dc1 # timeout=10
> [libcamera] $ /bin/sh -xe /tmp/jenkins4639663244990242363.sh
> + meson setup --wipe build
> Traceback (most recent call last):
>   File "/usr/lib/python3/dist-packages/mesonbuild/mesonmain.py", line 112, in run
>     return options.run_func(options)
>   File "/usr/lib/python3/dist-packages/mesonbuild/msetup.py", line 229, in run
>     app = MesonApp(options)
>   File "/usr/lib/python3/dist-packages/mesonbuild/msetup.py", line 82, in __init__
>     mesonlib.windows_proof_rmtree(l)
>   File "/usr/lib/python3/dist-packages/mesonbuild/mesonlib.py", line 1116, in windows_proof_rmtree
>     shutil.rmtree(f)
>   File "/usr/lib/python3.7/shutil.py", line 501, in rmtree
>     onerror(os.path.islink, path, sys.exc_info())
>   File "/usr/lib/python3.7/shutil.py", line 499, in rmtree
>     raise OSError("Cannot call rmtree on a symbolic link")
> OSError: Cannot call rmtree on a symbolic link

This is a bug in meson, fixed by
https://github.com/mesonbuild/meson/pull/7055. Until a new release
becomes available, I recommend either removing the build tree manually
before calling meson setup (and dropping the --wipe argument), or
removing the source symlink manually before running 'meson setup --wipe
build'.

> + true
> + meson configure build
> 
> ERROR: No such build data file as "'<https://builder.linuxtv.org/job/libcamera/ws/build/meson-private/build.dat'".>
> + meson build
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
> Compiler for C supports arguments -Wno-c99-designator -Wc99-designator: NO
> Configuring version.h using configuration
> Program openssl found: YES (/usr/bin/openssl)
> Library atomic found: YES
> Library dl found: YES
> Library gnutls found: YES
> Found pkg-config: /usr/bin/pkg-config (0.29)
> Dependency libudev found: YES 241
> Dependency threads found: YES 
> Dependency Boost found: NO 
> 
> src/ipa/raspberrypi/meson.build:3:0: ERROR:  Dependency "boost" not found

The Raspberry Pi pipeline handler requires boost. If that dependency
can't be easily added to the build machine, the pipeline handlers can be
selected manually:

meson configure -Dpipelines='ipu3, rkisp1, simple, uvcvideo, vimc'

We should likely disable pipeline handlers automatically when
dependencies are missing.

> A full log can be found at <https://builder.linuxtv.org/job/libcamera/ws/build/meson-logs/meson-log.txt>
> Build step 'Execute shell' marked build as failure

-- 
Regards,

Laurent Pinchart
