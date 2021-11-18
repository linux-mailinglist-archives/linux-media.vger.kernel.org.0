Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58972455941
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 11:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245729AbhKRKnN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 05:43:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56552 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245694AbhKRKnF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 05:43:05 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 952293E5;
        Thu, 18 Nov 2021 11:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637232004;
        bh=beuf7evVlZEBWZL3cG5iClzBNn3N85f+T4rTx949R7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YsBM/0NPdTavFjbsHZR8vy74ioOS/5H9AW9xbk3jSea0C9kQFOXHn70+c0WGjC8Y7
         nDvznqixSOs3IqWkI9RFpXhjd00Wud+Jo67DbbgtzLH8qW8pWToL1ufuZh/+EUCqpi
         /ZXk3DwGtOgPzeUlj2zA4ZoyAEWzx5nNltS+014s=
Date:   Thu, 18 Nov 2021 12:39:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, mchehab+huawei@kernel.org, rosenp@gmail.com
Subject: Re: [v4l-utils v5 0/5] Add support for meson building
Message-ID: <YZYtbu5QjW8l4lQ0@pendragon.ideasonboard.com>
References: <20210512184946.102863-1-ariel.dalessandro@collabora.com>
 <db868d34-aaa5-7e89-59a5-a61e024b2ec9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <db868d34-aaa5-7e89-59a5-a61e024b2ec9@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 18, 2021 at 11:03:59AM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> On 12/05/2021 21:49, Ariel D'Alessandro wrote:
> > Hi all,
> > 
> > Another attempt to support meson build, addressing comments/fixes from
> > reviewers.
> > 
> > This patchset was developed on top of v4l-utils current master branch:
> > 
> >      commit f0c7e3d71eaf4182bae7eb3ee0e43b4eeb047ea9
> >      Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > 
> >          v4l2-ctl: add '--set-edid type=list' support
> > 
> > You can find the patchset pushed to the following branch:
> > 
> >      https://gitlab.collabora.com/adalessandro/v4l-utils/-/tree/v4l-utils-meson-v5
> > 
> > Feedback appreciated as always :-)
> 
> I was testing this (well, I'm using it, as I can't get the autoconf work with
> cross-compilation..), and I see this problem if gconv is enabled when
> cross-compiling for arm (buildroot system):
> 
> [1/2] Linking target contrib/gconv/EN300-468-TAB00.so
> FAILED: contrib/gconv/EN300-468-TAB00.so
> /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc  -o contrib/gconv/EN300-468-TAB00.so contrib/gconv/EN300-468-TAB00.so.p/en300-468-tab00.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -shared -fPIC -Wl,-rpath,/usr/lib/x86_64-linux-gnu/gconv -Wl,-rpath-link,/usr/lib/x86_64-linux-gnu/gconv -Wl,--start-group /usr/lib/x86_64-linux-gnu/gconv/libJIS.so /usr/lib/x86_64-linux-gnu/gconv/libJISX0213.so -Wl,--end-group
> /usr/lib/x86_64-linux-gnu/gconv/libJIS.so: file not recognized: file format not recognized
> collect2: error: ld returned 1 exit status
> [2/2] Linking target contrib/gconv/ARIB-STD-B24.so
> FAILED: contrib/gconv/ARIB-STD-B24.so
> /home/tomba/work/buildroot/output32/host/bin/arm-buildroot-linux-gnueabihf-gcc  -o contrib/gconv/ARIB-STD-B24.so contrib/gconv/ARIB-STD-B24.so.p/arib-std-b24.c.o -Wl,--as-needed -Wl,--allow-shlib-undefined -shared -fPIC -Wl,-rpath,/usr/lib/x86_64-linux-gnu/gconv -Wl,-rpath-link,/usr/lib/x86_64-linux-gnu/gconv -Wl,--start-group /usr/lib/x86_64-linux-gnu/gconv/libJIS.so /usr/lib/x86_64-linux-gnu/gconv/libJISX0213.so -Wl,--end-group
> /usr/lib/x86_64-linux-gnu/gconv/libJIS.so: file not recognized: file format not recognized
> 
> Also, would this be better, to be a bit more explicit:
> 
> -    '-I.', # Needed for config.h
> +    '-I' + meson.global_build_root(), # Needed for config.h
> 
> I would do the same to other ".." paths too, but maybe that's just a personal
> preference:
> 
> -Icontrib/test/v4l2gl.p -Icontrib/test -I../contrib/test -I../lib/include -I../include -I.
> 
> I also wonder what the "-Icontrib/test" is for.
> 
> I also see a problem when cross-compiling where a wrong config.h is included. When
> compiling with buildroot env, valgrind include dir is in the include paths. And valgrind
> has a "config.h" there...
> 
> It would be safer to have the "-I." common flag before all the rest of the parameters,
> instead of being after all the others, but I didn't immediately find out how to do
> that with meson.

I think '-include config.h' would be safer, but it requires dropping the
manual include in all source files.

-- 
Regards,

Laurent Pinchart
