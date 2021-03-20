Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF91342F6E
	for <lists+linux-media@lfdr.de>; Sat, 20 Mar 2021 21:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhCTUCE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Mar 2021 16:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCTUBs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Mar 2021 16:01:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E819C061574
        for <linux-media@vger.kernel.org>; Sat, 20 Mar 2021 13:01:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8F068D3;
        Sat, 20 Mar 2021 21:01:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616270504;
        bh=s3uHMNgGlfbW1eEjVyqLHaGYhQ72kK1N9sjn1Sdm/ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YxNvpiGoMPGKZCP17CG5dt3ryaPcBrbp/vM1VFlES0SCkSmvIdMGEjZOVPKAwquUj
         BYxPly8FWEvIlV6e3gLPIoxLn3ufHTqJ1PwiBWsZAobchuIi5fGHp+oWxhFCQEBb32
         lS0/U7uo+vljPXkQYB1GNVVfdchQ5ZZN87nPF92s=
Date:   Sat, 20 Mar 2021 22:01:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Gregor Jasny <gjasny@googlemail.com>,
        Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com, sakari.ailus@iki.fi
Subject: Re: [v4l-utils v4 2/5] Add support for meson building
Message-ID: <YFZUf9RfS6rdD8Il@pendragon.ideasonboard.com>
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
 <20210317172227.620584-3-ariel.dalessandro@collabora.com>
 <7096f897-1e48-c1e5-5503-008fff60d2b2@googlemail.com>
 <20210320203209.14c65453@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210320203209.14c65453@coco.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Sat, Mar 20, 2021 at 08:32:09PM +0100, Mauro Carvalho Chehab wrote:
> Em Sat, 20 Mar 2021 17:56:10 +0100 Gregor Jasny escreveu:
> 
> > Hello,
> > 
> > Thank you again for these patches. Building v4l-utils has never been so 
> > fast and easy. It will accelerate my Debian / Ubuntu packaging and 
> > really sparks joy!
> > 
> > On 17.03.21 18:22, Ariel D'Alessandro wrote:
> > > Supports building libraries and tools found in contrib/, lib/ and
> > > utils/ directories, along with the implemented gettext translations.  
> > 
> > Here's a patch on top of your tree:
> > https://gitlab.com/gjasny/v4l-utils/-/commit/a9853f79c2675bf08fc3e93f15aa4158c9769bdd
> > 
> > I changed the following:
> > * Use pkgconfig to detect libbpf (like configure.ac does)
> > * check for libbpf presence in the keytable subdir (like it's done for 
> > libelf
> > * refined the empty rc_keymaps dir hack with something supported by 
> > meson: https://github.com/mesonbuild/meson/issues/2904 (your hack 
> > stopped working for me with meson on Ubuntu 20.04.2)
> > 
> > With those changes I could successfully build a Debian package using meson.
> > 
> > Thanks,
> > Gregor
> > 
> > PS: I could not find Mauro in the CC list.
> 
> I'm not a lover of autoconf tools. Yet, replacing from it on this
> project sounds a bad idea, for a couple of reasons.
> 
> The main one is that nobody has yet provided any real reason about
> *why* auto-tools should be replaced.
> 
> Auto-tools is reliable, stable and has been used since the
> beginning of this project. It is well-known and it is maintained
> upstream. It is present on all Linux distros and installing it
> doesn't require lots of packages for it to work. It is easy to
> keep maintaining it, and I never had to touch the Jenkins builder
> due to some troubles with autoconf packages.
> 
> The only package we have at jenkins using meson broke quite a
> few times due to problems with meson toolset versions.
> 
> So, switching from autotools will just place us on an unknown
> territory for no reason.
> 
> Besides that:
> 
> 1) meson doesn't support yet in-tree compilation. This is
>    a feature that I use a lot;

I'm curious, what does in-tree compilation allow that out-of-tree
compilation doesn't ?

> 2) Meson setup is *a way more complex* than autotools. With
>    auto-tools, everything is on a single file (plus standard
>    Makefiles):
> 	
> 	$ wc -l configure.ac
> 	660
> 
>   The meson config is a way bigger and it is spread on multiple
>   files, with is 3 times bigger than our current configure.ac:
> 
>   $ wc -l $(find . -name 'meson*' -type f|grep -v .git)
>     3 ./v4l-utils-po/meson.build
>     3 ./libdvbv5-po/meson.build
>   117 ./lib/libv4lconvert/meson.build
>    23 ./lib/libv4l-mplane/meson.build
>    70 ./lib/libv4l2/meson.build
>    36 ./lib/libv4l2rds/meson.build
>    61 ./lib/libv4l1/meson.build
>   158 ./lib/libdvbv5/meson.build
>    11 ./lib/meson.build
>   151 ./utils/keytable/rc_keymaps/meson.build
>    31 ./utils/keytable/bpf_protocols/meson.build
>    81 ./utils/keytable/meson.build
>    70 ./utils/dvb/meson.build
>    14 ./utils/libmedia_dev/meson.build
>     8 ./utils/cx18-ctl/meson.build
>    58 ./utils/v4l2-compliance/meson.build
>    19 ./utils/cec-follower/meson.build
>    80 ./utils/qv4l2/meson.build
>    82 ./utils/qvidcap/meson.build
>    23 ./utils/ir-ctl/meson.build
>    22 ./utils/cec-compliance/meson.build
>    16 ./utils/libv4l2util/meson.build
>    13 ./utils/rds-ctl/meson.build
>    43 ./utils/media-ctl/meson.build
>    45 ./utils/libcecutil/meson.build
>    18 ./utils/cec-ctl/meson.build
>    16 ./utils/v4l2-dbg/meson.build
>    75 ./utils/v4l2-ctl/meson.build
>    14 ./utils/v4l2-sysfs-path/meson.build
>    13 ./utils/ivtv-ctl/meson.build
>    46 ./utils/meson.build
>    50 ./meson_options.txt
>    34 ./doc/meson.build
>     8 ./contrib/cobalt-ctl/meson.build
>    11 ./contrib/xc3028-firmware/meson.build
>    44 ./contrib/gconv/meson.build
>     7 ./contrib/rds-saa6588/meson.build
>    14 ./contrib/decode_tm6000/meson.build
>   143 ./contrib/test/meson.build
>    13 ./contrib/meson.build
>   318 ./meson.build
>  2062 total

That's not a fair comparison, meson.build replaces configure.ac and
Makefile.am, as well as m4/*. There's also bootstrap.sh and most
probably other ancillary files.

$ cat $(find . -name 'Makefile.am' -type f | grep -v .git) configure.ac m4/* | wc -l
2549

>   Ok, part of it seems because meson doesn't like Makefiles, which
>   is, IMHO, a misfeature, as it makes harder to identify what are
>   the actual build instructions for each target.
> 
> 4) As the new build config files are bigger and use a different
>    syntax than configure.ac, it will require time and efforts to
>    learn how to use and modify it. Again, there's no need for
>    doing that;
> 
> 5) I don't know how to integrate meson with Coverity, as the
>    current procedure assumes an in-tree Makefile set that
>    will be used by cov-build to produce an out-of-tree build.

We run coverity on libcamera and haven't had any meson-related issues.
I'm sure we can help if you need assistance.

> 6) with our configure.ac, it is easy to check what options
>    were enabled or not:
> 
>   compile time options summary
>   ============================
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
>     SDL support		       : yes
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
>   at least the current meson patches don't have anything similar.

Meson has a summary() function that offers the same feature. If it's not
used in the current patches, it can easily be added.

>   This also affects Coverity builds, as we need the selected options
>   to be logged, as the coverity scan complains if the code is only
>   partially built (to the point to simply ignore incomplete builds):
> 
> 	Subject: Coverity Scan: Analysis failed for v4l-utils
> 
> 	Your request for analysis of v4l-utils  is failed.
> 	    Analysis status: Failure
> 	    Please fix the error and upload the build again.
> 	
> 	    Error details:
> 	    The build uploaded has been only partially compiled. We recommend at least 85% capture success to avoid false-positives during analysis. As per last few lines of cov-int/build-log.txt, the percentage of compilation units ready for analysis is 80% which is less than the expected 85%
> 
> 7) As meson relies on Python, which has unstable APIs, which breaks
>    from time to time, it seems a lot less reliable than
>    configure.ac, which relies on a lot more stable language (m4).
> 
> 
> >	diff --git a/README.md b/README.md
> >	index a2322c6e3af3..a4ff7511390b 100644
> >	--- a/README.md
> >	+++ b/README.md
> >	@@ -18,6 +18,10 @@ There is also a wiki page for the v4l-utils:
> >	 
> >	 ## Building
> >	 
> >	+Temporarily, both meson and autotools build systems are supported in parallel.
> >	+*NOTE*: Packagers should be aware that autotools support will be dropped soon,
> >	+to be fully replaced by meson.
> >	+
> 
> NAK to drop autotools. Even if we would add support for some new
> building system that would support in-tree build (cmake would be 
> a better option, IMHO), autotools should remain the main building
> system for at least a couple of years, in order for us to be sure
> that it would work properly and that people will start dominating
> the new way.

I'm curious again, would you rather drop autotools, or contributors to
v4l-utils ?

-- 
Regards,

Laurent Pinchart
