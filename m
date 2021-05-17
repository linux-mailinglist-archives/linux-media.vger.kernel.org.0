Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C00D386BC4
	for <lists+linux-media@lfdr.de>; Mon, 17 May 2021 22:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237350AbhEQU4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 16:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237252AbhEQU4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 16:56:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B005AC061573
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 13:55:15 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id ABA021F425E6
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
To:     kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com, sakari.ailus@iki.fi, mchehab+huawei@kernel.org,
        rosenp@gmail.com
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
 <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
Date:   Mon, 17 May 2021 17:55:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran!

Thanks a lot for the feedback.

On 5/13/21 5:56 AM, Kieran Bingham wrote:
> Hi Ariel,
> 
> I'm still very much looking forward to this update!
> 
> I still think meson could be used in parallel for some cross over period
> while these issues are worked out, which would encourage and support
> wider testing before any consideration to swap altogether occurred.
> 
> 
> Furthermore, the performance improvement on this is really nice
> (intel i7 8th gen 4 core/8threads)
> 
> /usr/bin/time -v ./make-meson.sh
> 	User time (seconds): 99.38
> 	System time (seconds): 10.69
> 	Percent of CPU this job got: 577%
> 	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:19.05
> 
> 
> /usr/bin/time -v ./make-autoconf.sh
> 	User time (seconds): 218.19
> 	System time (seconds): 21.46
> 	Percent of CPU this job got: 360%
> 	Elapsed (wall clock) time (h:mm:ss or m:ss): 1:06.54
> 
> however the build output directories are not comparable so I suspect
> that perhaps meson isn't (yet?) building all the same things?

Not sure what your scripts are doing, but the default autotools
behaviour should be equivalent to:

  $ meson configure build/ -Ddefault_library=both -Ddoxygen-doc=disabled

> 
> du -sh build-autoconf build-meson/
> 129M	build-autoconf
> 69M	build-meson/
> 
> 
> I've just tried testing it locally and found a smallish issue:
> 
> 
> On 12/05/2021 19:49, Ariel D'Alessandro wrote:
<snip>
>> Changes from v4:
>>
>>   * Dropped install_subdir() work-around to install empty dir. Supported
>>     now in meson v0.57.
>>   * Bump to meson v0.57. Replaced deprecated methods.
>>   * Added override_dependency() calls on libraries.
>>   * Properly check for bpf and SDL2 dependencies.
> 
> The SDL2 dependency is optional when I run ./bootstrap.sh; ./configure
> which gives the following output:
> 
> compile time options summary
> ============================
> 
>     Host OS                    : linux-gnu
>     X11                        : yes
>     GL                         : yes
>     glu                        : yes
>     libelf		       : yes
>     libjpeg                    : yes
>     libudev                    : yes
>     pthread                    : yes
>     QT version                 : v5.4 with QtGL
>     ALSA support               : yes
>     SDL support		       : no
> 
>     build dynamic libs         : yes
>     build static libs          : yes
> 
>     gconv                      : no
> 
>     dynamic libv4l             : yes
>     v4l_plugins                : yes
>     v4l_wrappers               : yes
>     libdvbv5                   : yes
>     dvbv5-daemon               : yes
>     v4lutils                   : yes
>     qv4l2                      : yes
>     qvidcap                    : yes
>     v4l2-ctl uses libv4l       : yes
>     v4l2-ctl-32                : no
>     v4l2-compliance            : yes
>     v4l2-compliance uses libv4l: yes
>     v4l2-compliance-32         : no
>     BPF IR Decoders:           : no
> 
> 
> However running meson build gives:
> 
> Has header "bpf/bpf.h" : NO
> Run-time dependency sdl2 found: YES 2.0.10
> Run-time dependency sdl2_image found: NO (tried pkgconfig and cmake)
> 
> meson.build:90:4: ERROR: C header 'SDL2/SDL_image.h' not found
> 
> Now I bet that's a corner case because SDL was found but SDL Image
> wasn't, but perhaps it needs updating so that both are optional, and the
> SDL support is only enabled when all SDL dependencies are met.
> 
> 
> 
> Of course I was able to 'solve/workaround' this locally with
>  sudo apt install libsdl2-image-dev
> 
> Note that the time measurements reported above were after installing SDL
> image so that both meson and autoconf should have been building the

That's a bug introducen in the latest v5 patchset, while addressing
comment [0] from Xavier. This will fix it:

$ git diff
diff --git a/meson.build b/meson.build
index bba8e030..f062856c 100644
--- a/meson.build
+++ b/meson.build
@@ -82,12 +82,12 @@ endif

 dep_sdl = dependency('SDL2', required: false)
 if not dep_sdl.found()
-    dep_sdl = cc.find_library('SDL2', has_headers: 'SDL2/SDL.h')
+    dep_sdl = cc.find_library('SDL2', has_headers: 'SDL2/SDL.h',
required: false)
 endif

 dep_sdl_image = dependency('SDL2_image', required: false)
 if not dep_sdl_image.found()
-    dep_sdl_image = cc.find_library('SDL2_image', has_headers:
'SDL2/SDL_image.h')
+    dep_sdl_image = cc.find_library('SDL2_image', has_headers:
'SDL2/SDL_image.h', required: false)
 endif

 dep_threads = dependency('threads')

[0]
https://gitlab.collabora.com/adalessandro/v4l-utils/-/commit/d6fc25fdd28227e88d5517342f045d5bda632272#note_82115

Thanks again!
Ariel
