Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9455F386CC7
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 00:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234563AbhEQWPN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 May 2021 18:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235143AbhEQWPL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 May 2021 18:15:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDB8C061756
        for <linux-media@vger.kernel.org>; Mon, 17 May 2021 15:13:54 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F5D53EE;
        Tue, 18 May 2021 00:13:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621289630;
        bh=1CXK8s0kEAG1CDNZzOvJk8Gs4lXY/BTkHHh7XiIKvK8=;
        h=Reply-To:To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=gYRPlc+fDWPbVhEINIQa9q64lcnwJ+dHzdc2bEO135YhcZ5fZN7KW5V0rk+BQ1F8p
         EDsN4X/EK4xB0ZafNXhK4dWq8IB4OTF+qFFBCsO5cJw7w9zCchOakCWkoop7DCokpg
         crnhWfgBu1GA4aBN7bdlB4zvadyiAhgNalNKe7Gc=
Reply-To: kieran.bingham@ideasonboard.com
To:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com, sakari.ailus@iki.fi, mchehab+huawei@kernel.org,
        rosenp@gmail.com
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
 <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
 <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Organization: Ideas on Board
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
Message-ID: <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
Date:   Mon, 17 May 2021 23:13:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
Content-Type: multipart/mixed;
 boundary="------------46DEE8162DEAA1573B009866"
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------46DEE8162DEAA1573B009866
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Ariel,

On 17/05/2021 21:55, Ariel D'Alessandro wrote:
> Hi Kieran!
> 
> Thanks a lot for the feedback.

No worries, somehow this is almost fun to test out (mostly because of
watching how crazy fast it is building in meson in comparison).


> On 5/13/21 5:56 AM, Kieran Bingham wrote:
>> Hi Ariel,
>>
>> I'm still very much looking forward to this update!
>>
>> I still think meson could be used in parallel for some cross over period
>> while these issues are worked out, which would encourage and support
>> wider testing before any consideration to swap altogether occurred.
>>
>>
>> Furthermore, the performance improvement on this is really nice
>> (intel i7 8th gen 4 core/8threads)
>>
>> /usr/bin/time -v ./make-meson.sh
>> 	User time (seconds): 99.38
>> 	System time (seconds): 10.69
>> 	Percent of CPU this job got: 577%
>> 	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:19.05
>>
>>
>> /usr/bin/time -v ./make-autoconf.sh
>> 	User time (seconds): 218.19
>> 	System time (seconds): 21.46
>> 	Percent of CPU this job got: 360%
>> 	Elapsed (wall clock) time (h:mm:ss or m:ss): 1:06.54
>>
>> however the build output directories are not comparable so I suspect
>> that perhaps meson isn't (yet?) building all the same things?
> 
> Not sure what your scripts are doing, but the default autotools

Ah, yes I should have been clearer there - but they don't do 'anything'
except the bare minimum for both:

----------
kbingham@Q:/opt/projects/media/v4l-utils$ cat make-autoconf.sh
#!/bin/sh

export CCACHE_DISABLE=true

rm -rf build-autoconf
mkdir -p build-autoconf
cd build-autoconf
../configure
make -j8

----------
kbingham@Q:/opt/projects/media/v4l-utils$ cat make-meson.sh
#!/bin/sh

export CCACHE_DISABLE=true

rm -rf build-meson
meson build-meson
ninja -C build-meson
----------

> behaviour should be equivalent to:
> 
>   $ meson configure build/ -Ddefault_library=both -Ddoxygen-doc=disabled

Ok, updated script to run that:

	meson -Ddefault_library=both -Ddoxygen-doc=disabled build-meson

and still the same fast results.

	Command being timed: "./make-meson.sh"
	User time (seconds): 96.65
	System time (seconds): 10.42
	Percent of CPU this job got: 526%
	Elapsed (wall clock) time (h:mm:ss or m:ss): 0:20.34

(i.e. really fast ;D)


>> du -sh build-autoconf build-meson/
>> 129M	build-autoconf
>> 69M	build-meson/

Still a comparable output size as well, but the main difference from
size is a lot of extra build files in the -autoconf directory.

A lot of these are things like .Po files. Does this series already
handle internationalisation?


The next step was to install both versions, as that will compare what's
actually built and results in the package, and in fact they do look
quite similar.

There are a few small changes, that might be worth looking into - but I
don't think there's any major difference in what is or isn't built.
(unless the Internationalisation stuff really is the major factor)

 - Spurious meson.build file is being installed at
   /lib/udev/rc_keymaps/meson.build

 - Meson decided to default libdir to
     /usr/local/lib/x86_64-linux-gnu
   while autoconf used
     /usr/local/lib
   (it's likely handled by the package managers anyway)

 - /usr/local/etc/rc_keymaps/protocols
    was installed though autoconf didn't ?

 - Autoconf seemed to install v4l1compat.so and v4l2convert.so
   (possibly in duplicate) in the libdir, as well as in libdir/libv4l/
   I'm not sure if that's a bug or a feature in autoconf

Ah, and again - size of those installs looks quite different suggesting
(probably that localisation) has differed between the two builds quite
drastically

(after DESTDIR=/tmp/v4l2-$BUILDSYSTEM {make, ninja} install)


du -sh /tmp/v4l2-autoconf/ /tmp/v4l2-meson/
39M	/tmp/v4l2-autoconf/
22M	/tmp/v4l2-meson/


>> I've just tried testing it locally and found a smallish issue:
>>
>>
>> On 12/05/2021 19:49, Ariel D'Alessandro wrote:
> <snip>
>>> Changes from v4:
>>>
>>>   * Dropped install_subdir() work-around to install empty dir. Supported
>>>     now in meson v0.57.
>>>   * Bump to meson v0.57. Replaced deprecated methods.
>>>   * Added override_dependency() calls on libraries.
>>>   * Properly check for bpf and SDL2 dependencies.
>>
>> The SDL2 dependency is optional when I run ./bootstrap.sh; ./configure
>> which gives the following output:
>>
>> compile time options summary
>> ============================
>>
>>     Host OS                    : linux-gnu
>>     X11                        : yes
>>     GL                         : yes
>>     glu                        : yes
>>     libelf		       : yes
>>     libjpeg                    : yes
>>     libudev                    : yes
>>     pthread                    : yes
>>     QT version                 : v5.4 with QtGL
>>     ALSA support               : yes
>>     SDL support		       : no
>>
>>     build dynamic libs         : yes
>>     build static libs          : yes
>>
>>     gconv                      : no

Interesting, it looks like on my system autoconf defaults gconv to no,
but meson built it I think.

I'd call that a feature not a bug at the moment though?

>>
>>     dynamic libv4l             : yes
>>     v4l_plugins                : yes
>>     v4l_wrappers               : yes
>>     libdvbv5                   : yes
>>     dvbv5-daemon               : yes
>>     v4lutils                   : yes
>>     qv4l2                      : yes
>>     qvidcap                    : yes
>>     v4l2-ctl uses libv4l       : yes
>>     v4l2-ctl-32                : no
>>     v4l2-compliance            : yes
>>     v4l2-compliance uses libv4l: yes
>>     v4l2-compliance-32         : no
>>     BPF IR Decoders:           : no
>>
>>
>> However running meson build gives:
>>
>> Has header "bpf/bpf.h" : NO
>> Run-time dependency sdl2 found: YES 2.0.10
>> Run-time dependency sdl2_image found: NO (tried pkgconfig and cmake)
>>
>> meson.build:90:4: ERROR: C header 'SDL2/SDL_image.h' not found
>>
>> Now I bet that's a corner case because SDL was found but SDL Image
>> wasn't, but perhaps it needs updating so that both are optional, and the
>> SDL support is only enabled when all SDL dependencies are met.
>>
>>
>>
>> Of course I was able to 'solve/workaround' this locally with
>>  sudo apt install libsdl2-image-dev
>>
>> Note that the time measurements reported above were after installing SDL
>> image so that both meson and autoconf should have been building the
> 
> That's a bug introducen in the latest v5 patchset, while addressing
> comment [0] from Xavier. This will fix it:
> 
> $ git diff
> diff --git a/meson.build b/meson.build
> index bba8e030..f062856c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -82,12 +82,12 @@ endif
> 
>  dep_sdl = dependency('SDL2', required: false)
>  if not dep_sdl.found()
> -    dep_sdl = cc.find_library('SDL2', has_headers: 'SDL2/SDL.h')
> +    dep_sdl = cc.find_library('SDL2', has_headers: 'SDL2/SDL.h',
> required: false)
>  endif
> 
>  dep_sdl_image = dependency('SDL2_image', required: false)
>  if not dep_sdl_image.found()
> -    dep_sdl_image = cc.find_library('SDL2_image', has_headers:
> 'SDL2/SDL_image.h')
> +    dep_sdl_image = cc.find_library('SDL2_image', has_headers:
> 'SDL2/SDL_image.h', required: false)
>  endif
> 
>  dep_threads = dependency('threads')
> 
> [0]
> https://gitlab.collabora.com/adalessandro/v4l-utils/-/commit/d6fc25fdd28227e88d5517342f045d5bda632272#note_82115
> 
> Thanks again!
> Ariel


-- 
Regards
--
Kieran

--------------46DEE8162DEAA1573B009866
Content-Type: text/x-patch; charset=UTF-8;
 name="v4l2-utils-meson-installed.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="v4l2-utils-meson-installed.diff"

--- /tmp/v4l2-install-autoconf.list	2021-05-17 22:39:34.951165299 +0100
+++ /tmp/v4l2-install-meson.list	2021-05-17 22:39:24.843084176 +0100
@@ -86,7 +86,6 @@
 ./lib/udev/rc_keymaps/medion_x10_or2x.toml
 ./lib/udev/rc_keymaps/medion_x10.toml
 ./lib/udev/rc_keymaps/megasky.toml
-./lib/udev/rc_keymaps/meson.build
 ./lib/udev/rc_keymaps/minix_neo.toml
 ./lib/udev/rc_keymaps/msi_digivox_iii.toml
 ./lib/udev/rc_keymaps/msi_digivox_ii.toml
@@ -179,6 +178,7 @@
 ./usr/local/bin/v4l2-sysfs-path
 ./usr/local/etc
 ./usr/local/etc/rc_keymaps
+./usr/local/etc/rc_keymaps/protocols
 ./usr/local/etc/rc_maps.cfg
 ./usr/local/include
 ./usr/local/include/libdvbv5
@@ -236,49 +236,44 @@
 ./usr/local/include/libv4lconvert.h
 ./usr/local/include/libv4l-plugin.h
 ./usr/local/lib
-./usr/local/lib/libdvbv5.a
-./usr/local/lib/libdvbv5.la
-./usr/local/lib/libdvbv5.so
-./usr/local/lib/libdvbv5.so.0
-./usr/local/lib/libdvbv5.so.0.0.0
-./usr/local/lib/libv4l
-./usr/local/lib/libv4l1.a
-./usr/local/lib/libv4l1.la
-./usr/local/lib/libv4l1.so
-./usr/local/lib/libv4l1.so.0
-./usr/local/lib/libv4l1.so.0.0.0
-./usr/local/lib/libv4l2.a
-./usr/local/lib/libv4l2.la
-./usr/local/lib/libv4l2rds.a
-./usr/local/lib/libv4l2rds.la
-./usr/local/lib/libv4l2rds.so
-./usr/local/lib/libv4l2rds.so.0
-./usr/local/lib/libv4l2rds.so.0.0.0
-./usr/local/lib/libv4l2.so
-./usr/local/lib/libv4l2.so.0
-./usr/local/lib/libv4l2.so.0.0.0
-./usr/local/lib/libv4lconvert.a
-./usr/local/lib/libv4lconvert.la
-./usr/local/lib/libv4lconvert.so
-./usr/local/lib/libv4lconvert.so.0
-./usr/local/lib/libv4lconvert.so.0.0.0
-./usr/local/lib/libv4l/ov511-decomp
-./usr/local/lib/libv4l/ov518-decomp
-./usr/local/lib/libv4l/plugins
-./usr/local/lib/libv4l/plugins/libv4l-mplane.la
-./usr/local/lib/libv4l/plugins/libv4l-mplane.so
-./usr/local/lib/libv4l/v4l1compat.la
-./usr/local/lib/libv4l/v4l1compat.so
-./usr/local/lib/libv4l/v4l2convert.la
-./usr/local/lib/libv4l/v4l2convert.so
-./usr/local/lib/pkgconfig
-./usr/local/lib/pkgconfig/libdvbv5.pc
-./usr/local/lib/pkgconfig/libv4l1.pc
-./usr/local/lib/pkgconfig/libv4l2.pc
-./usr/local/lib/pkgconfig/libv4l2rds.pc
-./usr/local/lib/pkgconfig/libv4lconvert.pc
-./usr/local/lib/v4l1compat.so
-./usr/local/lib/v4l2convert.so
+./usr/local/lib/x86_64-linux-gnu
+./usr/local/lib/x86_64-linux-gnu/gconv
+./usr/local/lib/x86_64-linux-gnu/gconv/ARIB-STD-B24.so
+./usr/local/lib/x86_64-linux-gnu/gconv/EN300-468-TAB00.so
+./usr/local/lib/x86_64-linux-gnu/gconv/gconv-modules
+./usr/local/lib/x86_64-linux-gnu/libdvbv5.a
+./usr/local/lib/x86_64-linux-gnu/libdvbv5.so
+./usr/local/lib/x86_64-linux-gnu/libdvbv5.so.0
+./usr/local/lib/x86_64-linux-gnu/libdvbv5.so.0.0.0
+./usr/local/lib/x86_64-linux-gnu/libv4l
+./usr/local/lib/x86_64-linux-gnu/libv4l1.a
+./usr/local/lib/x86_64-linux-gnu/libv4l1.so
+./usr/local/lib/x86_64-linux-gnu/libv4l1.so.0
+./usr/local/lib/x86_64-linux-gnu/libv4l1.so.0.0.0
+./usr/local/lib/x86_64-linux-gnu/libv4l2.a
+./usr/local/lib/x86_64-linux-gnu/libv4l2rds.a
+./usr/local/lib/x86_64-linux-gnu/libv4l2rds.so
+./usr/local/lib/x86_64-linux-gnu/libv4l2rds.so.0
+./usr/local/lib/x86_64-linux-gnu/libv4l2rds.so.0.0.0
+./usr/local/lib/x86_64-linux-gnu/libv4l2.so
+./usr/local/lib/x86_64-linux-gnu/libv4l2.so.0
+./usr/local/lib/x86_64-linux-gnu/libv4l2.so.0.0.0
+./usr/local/lib/x86_64-linux-gnu/libv4lconvert.a
+./usr/local/lib/x86_64-linux-gnu/libv4lconvert.so
+./usr/local/lib/x86_64-linux-gnu/libv4lconvert.so.0
+./usr/local/lib/x86_64-linux-gnu/libv4lconvert.so.0.0.0
+./usr/local/lib/x86_64-linux-gnu/libv4l/ov511-decomp
+./usr/local/lib/x86_64-linux-gnu/libv4l/ov518-decomp
+./usr/local/lib/x86_64-linux-gnu/libv4l/plugins
+./usr/local/lib/x86_64-linux-gnu/libv4l/plugins/libv4l-mplane.so
+./usr/local/lib/x86_64-linux-gnu/libv4l/v4l1compat.so
+./usr/local/lib/x86_64-linux-gnu/libv4l/v4l2convert.so
+./usr/local/lib/x86_64-linux-gnu/pkgconfig
+./usr/local/lib/x86_64-linux-gnu/pkgconfig/libdvbv5.pc
+./usr/local/lib/x86_64-linux-gnu/pkgconfig/libv4l1.pc
+./usr/local/lib/x86_64-linux-gnu/pkgconfig/libv4l2.pc
+./usr/local/lib/x86_64-linux-gnu/pkgconfig/libv4l2rds.pc
+./usr/local/lib/x86_64-linux-gnu/pkgconfig/libv4lconvert.pc
 ./usr/local/sbin
 ./usr/local/sbin/v4l2-dbg
 ./usr/local/share

--------------46DEE8162DEAA1573B009866--
