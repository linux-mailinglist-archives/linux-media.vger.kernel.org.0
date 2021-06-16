Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2613A9D8A
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 16:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234026AbhFPO2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 10:28:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48140 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbhFPO2a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 10:28:30 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id EAA861F40F41
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
 <008aec9c-c1e6-7f8b-dde5-8fa53c1e9ee6@collabora.com>
 <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <443286a1-b955-1ac1-742d-42b9182a435f@collabora.com>
Date:   Wed, 16 Jun 2021 11:26:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <92b5c1bf-f4cf-5d5e-7c16-57d4a3446f67@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kieran,

On 5/17/21 7:13 PM, Kieran Bingham wrote:
> Hi Ariel,
> 
> On 17/05/2021 21:55, Ariel D'Alessandro wrote:
>> Hi Kieran!
>>
>> Thanks a lot for the feedback.
> 
> No worries, somehow this is almost fun to test out (mostly because of
> watching how crazy fast it is building in meson in comparison).
> 
> 
>> On 5/13/21 5:56 AM, Kieran Bingham wrote:
>>> Hi Ariel,

[Omitting as there's further discussion in other mail responses from
this same thread.]

> 
> The next step was to install both versions, as that will compare what's
> actually built and results in the package, and in fact they do look
> quite similar.
> 
> There are a few small changes, that might be worth looking into - but I
> don't think there's any major difference in what is or isn't built.
> (unless the Internationalisation stuff really is the major factor)
> 
>  - Spurious meson.build file is being installed at
>    /lib/udev/rc_keymaps/meson.build

Will be fixed by:

diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index d3edcf77..deb13934 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -1,7 +1,7 @@
 bin_PROGRAMS = ir-keytable
 man_MANS = ir-keytable.1 rc_keymap.5
 sysconf_DATA = rc_maps.cfg
-keytablesystem_DATA = $(srcdir)/rc_keymaps/*
+keytablesystem_DATA = $(srcdir)/rc_keymaps/*.toml
 udevrules_DATA = 70-infrared.rules
 if WITH_BPF
 if HAVE_SYSTEMD

> 
>  - Meson decided to default libdir to
>      /usr/local/lib/x86_64-linux-gnu
>    while autoconf used
>      /usr/local/lib
>    (it's likely handled by the package managers anyway)

  $ meson configure ../build-meson/ | grep libdir
    libdir    lib/x86_64-linux-gnu    Library directory

Package manager should run meson with configuration option
`-Dlibdir=lib`. Will document this.

> 
>  - /usr/local/etc/rc_keymaps/protocols
>     was installed though autoconf didn't ?

I don't get that difference. Maybe it's related to a different set of
features detected by the two build systems?

> 
>  - Autoconf seemed to install v4l1compat.so and v4l2convert.so
>    (possibly in duplicate) in the libdir, as well as in libdir/libv4l/
>    I'm not sure if that's a bug or a feature in autoconf

Right, an extra symlink is being added to those libs. Is this really needed?

> 
> Ah, and again - size of those installs looks quite different suggesting
> (probably that localisation) has differed between the two builds quite
> drastically
> 
> (after DESTDIR=/tmp/v4l2-$BUILDSYSTEM {make, ninja} install)
> 
> 
> du -sh /tmp/v4l2-autoconf/ /tmp/v4l2-meson/
> 39M	/tmp/v4l2-autoconf/
> 22M	/tmp/v4l2-meson/

As mentioned in another response. Autotools is building with `-g -O2` by
default, that'd the equivalent meson configuration option
--buildtype=debugoptimized. With this configuration the installtion
sizes are not that different:

  $ du -s installation_m*
  37068	installation_make
  37848	installation_meson

In this case the difference is related to libtool `.la` files not being
generated by meson and gconv/ only installed by meson. The latest is
probably a feature being only detected by meson in this case, will check
that out.

~/dev/v4l$ diff -r files_make files_meson
233a234,236
> ./usr/local/lib/gconv/ARIB-STD-B24.so
> ./usr/local/lib/gconv/EN300-468-TAB00.so
> ./usr/local/lib/gconv/gconv-modules
235d237
< ./usr/local/lib/libdvbv5.la
238d239
< ./usr/local/lib/libv4l1.la
241d241
< ./usr/local/lib/libv4l2.la
243d242
< ./usr/local/lib/libv4l2rds.la
247d245
< ./usr/local/lib/libv4lconvert.la
251d248
< ./usr/local/lib/libv4l/plugins/libv4l-mplane.la
253d249
< ./usr/local/lib/libv4l/v4l1compat.la
255d250
< ./usr/local/lib/libv4l/v4l2convert.la

More soon,
Ariel
