Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 619B838733C
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 09:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242070AbhERHZa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 03:25:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:54598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240356AbhERHZY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 03:25:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A3A661166;
        Tue, 18 May 2021 07:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621322647;
        bh=3PTF16UHq1i6LQ5q2TDviF0q9YuNrKdeviV46cHUyuk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NnYFzBcjQayS2WtcfoyYn/6isx8SmghIHgD22LJI3zecckz4S3GcGctOhZtWFDFFf
         XMIw/WjovL1OKVrzjKET6jDKIcrW1dIciWVCbg0Yv9pCvK+xV7a/PO32XMALRqOnx5
         m2q6/44QcaYFFSTa11YJhaqQRP69Kht5tnt6dgJL/QtLeEZ8GXin5Mf48yJcltpOYp
         kVey6yUVBOOhPXsnGAVQRSHp8mJnjAvtcWb8G90HkGRNRR9NTJvt2J1lRophnD88Tp
         UqxFVw71zlSFk5W1ZJLgf3ntjz/EsZZgNmnQcHO6Ejf7squvBcWSopZoMhExC0qpA6
         Eh3F9AuLLdkTw==
Date:   Tue, 18 May 2021 09:23:58 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, laurent.pinchart@ideasonboard.com,
        ezequiel@collabora.com, nicolas@ndufresne.ca,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, rosenp@gmail.com
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
Message-ID: <20210518092358.05c7a189@coco.lan>
In-Reply-To: <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
        <f2f72ec5-e352-132f-b8d1-718589360bf0@ideasonboard.com>
        <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
        <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 17 May 2021 23:13:45 +0100
Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu:

> Ah, yes I should have been clearer there - but they don't do 'anything'
> except the bare minimum for both:
> 
> ----------
> kbingham@Q:/opt/projects/media/v4l-utils$ cat make-autoconf.sh
> #!/bin/sh
> 
> export CCACHE_DISABLE=true
> 
> rm -rf build-autoconf
> mkdir -p build-autoconf
> cd build-autoconf
> ../configure

This is not the bare minimum. It is just the opposite: the way we
intentionally implemented configure.ac is to auto-detect as much as possible
what tools are supported and to build the maximum number of features as
possible.

See, when one calls:

	$ ./configure

It will display at the end the optional features that were enabled
that we found important enough to report:

compile time options summary
============================

    Host OS                    : linux-gnu
    X11                        : yes
    GL                         : yes
    glu                        : yes
    libelf		       : yes
    libjpeg                    : yes
    libudev                    : yes
    pthread                    : yes
    QT version                 : v5.4 with QtGL
    ALSA support               : yes
    SDL support		       : yes

    build dynamic libs         : yes
    build static libs          : yes

    gconv                      : no

    dynamic libv4l             : yes
    v4l_plugins                : yes
    v4l_wrappers               : yes
    libdvbv5                   : yes
    dvbv5-daemon               : yes
    v4lutils                   : yes
    qv4l2                      : yes
    qvidcap                    : yes
    v4l2-ctl uses libv4l       : yes
    v4l2-ctl-32                : no
    v4l2-compliance            : yes
    v4l2-compliance uses libv4l: yes
    v4l2-compliance-32         : no
    BPF IR Decoders:           : no

a bare minimum setting would print most (if not all) above features
as "no".

See, we never treated internationalization or documentation as
features. So, it won't display anything about that. It will just
build docs and .po files by default, if the needed tools and
libraries are present at the building system.

Yet, autotools have some options that could disable building them.
./configure --help is your friend[1], if you want a bare minimum
build.

[1] You can see most of the options that can be enabled/disabled with:

	./configure --help|grep -E '(enable|disable|with)'

    The command would be similar to: 

	./configure --disable-nls --disable-libdvbv5 --disable-dyn-libv4l --disable-v4l-utils --disable-v4l2-compliance-libv4l --disable-v4l2-ctl-libv4l --disable-qv4l2 --disable-qvidcap --disable-bpf --without-jpeg --without-libudev --disable-gconv --disable-doxygen-doc --disable-doxygen-dot --disable-doxygen-html --disable-doxygen-ps --disable-doxygen-pdf

	here, after running the above, building with autoconf was very fast.

		$ make clean
		$ time CCACHE_DISABLE=true make -j8
		real	0m4,594s
		user	0m14,050s
		sys	0m1,613s

> meson build-meson
> ninja -C build-meson

I would be expecting that the above would do the same, but
it sounds it is lacking a lot of things...

> >> du -sh build-autoconf build-meson/
> >> 129M	build-autoconf
> >> 69M	build-meson/  

as otherwise the difference won't be so huge.

See, you're comparing very different things, as autotools is clearly
doing a lot more than meson. If they were building the same thing, I 
would expect a difference at the order of tens of KB at most, due to
temporary/cache files, build logs and, in the case of autotools, m4
files. Neither of those are huge.

Assuming that both builds used the same compilers, a difference at 
the order of (tens of) MB can only be explained if Meson build
was very incomplete, and/or the output files don't carry the same
debug info.


Thanks,
Mauro
