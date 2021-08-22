Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BF83F40BA
	for <lists+linux-media@lfdr.de>; Sun, 22 Aug 2021 19:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhHVRrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 13:47:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:50458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhHVRrz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 13:47:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D61B46115A;
        Sun, 22 Aug 2021 17:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629654433;
        bh=fY25P1admSJNfX6xbRQpLnyRPnhtl4DK96kMn1AqxZU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ax1jRR7wVJzX3oW7+MdHZUiW8JaQcqi3+F+k0fi5+KY9JD57DBsaoHoAOp3ksHM15
         JOFAITQCKOi6f23nniATpOJpeJDrduNblgrdp+VxkbzWMK+ZXn9Vov4UMGVSmBM7iv
         yjV7kagHCZxfdUhDT5sV4uhk6bZkhGPU6RI5Oblyx8PKSJbLQmM0bjv/xBGPBO7xh4
         wiNlRfM4Rlh5TfQZmXlb0VDU/NV7LeXd2hmTHbsxZ6R3ZFMRr3YaHWTbyHG8UN4mGK
         ncLF01H3xNgjfDNvBJs9NehAERre4LAKIkPlGMpJStstQ+ynH+D7r7MwSuUjGLrxXO
         wWOK2bYZQru2Q==
Date:   Sun, 22 Aug 2021 19:47:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Soeren Moch <smoch@web.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Regression 5.14] media: dvb userspace api
Message-ID: <20210822194709.4b9d33d4@coco.lan>
In-Reply-To: <c56ec571-2278-95e9-2028-990e03159c3f@web.de>
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
        <20210819133128.45ef4353@coco.lan>
        <c56ec571-2278-95e9-2028-990e03159c3f@web.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 22 Aug 2021 17:21:41 +0200
Soeren Moch <smoch@web.de> escreveu:

> > There's no regression: a legacy driver (av7110) for a device that stopp=
ed
> > being manufactured 15 years ago and that doesn't work anymore with curr=
ent
> > Digital TV transmissions was removed, together with the API that it was
> > implemented inside such driver's code. =20
> What you write here is simply not true.
>=20
> The "device" (saa7146/av7110-based full-featured DVB card) is working
> well.=20

Probably not true - at least for some av7110-based boards - as there was a=
=20
regression that no user ever noticed:

	https://lore.kernel.org/lkml/20210503115736.2104747-59-gregkh@linuxfoundat=
ion.org/

This was noticed only too late, due to a review of the offended patch
caused by "hypocrite commits"[1].

[1] https://lwn.net/Articles/854645/.

> Also with current Digital TV transmissions (e.g. Astra Satellite
> TV in Europe). The DVB API never was implemented in driver's code, it is
> linux userspace API (include/uapi/linux/dvb/).

The DVB API used by all upstream drivers is implemented inside the DVB
core (at drivers/media/dvb-core/).

The "full-featured" API consists on the DVB API + some extra ioctls
defined at the uAPI headers, plus an av7110 implementation, which
covered only part of the ioctls that were defined at the headers.

> You moved files out of the uapi part of kernel headers, parts of e.g.
> RedHat userspace stops to build due to this. So it is a userspace
> regression.

Again, this is not a Kernel regression. There isn't a single bit of
code inside the Kernel that it would require the "full-feat" uapi.

If an app implements support to some OOT driver(s), it has to carry on the
OOT userspace code for such driver(s), together with any needed headers for
such support. So, you should submit a patch to such app maintainers=20
directly - and/or to the distro packages that would have packages
providing support for such OOT driver(s).

Btw, as far as I'm aware, Red Hat's Kernels don't come with the
saa716x OOT driver.

> > The av7110 production stopped ~15 years ago. =20
> But the cards work perfectly well. I own two such cards, there is no
> problem at all with them. Other members of the community even test with
> -rc3 kernels and file RedHat bugs. So there clearly is interest in them.

Nobody is telling otherwise. If people want to use OOT drivers, that's
OK. Nobody is preventing people to use it, nor to use the apps developed
for such devices.

Keeping av7110 in-kernel has been a waste of limited upstream development=20
resources. A couple of years ago, we needed to fix the av7110 API due to
year-2038 issues. From time to time, we get bugs affecting it (even security
ones), as the code has been bit-rotting for a long time. The most recent one
probably broke the driver without nobody noticing it for a couple of Kernel=
=20
reviews, as mentioned above.=20

> > This is a legacy hardware, which supports only the first generation of =
DVB
> > standards, and had an integrated MPEG-2 decoder. As most DVB transmissi=
ons
> > use MPEG4 or newer encoding schemas that didn't exist back in 1999, it
> > doesn't make any sense keeping such driver upstream nowadays. =20
> As I wrote in my previous email: most private TV stations in Germany
> provide their free-to-air satellite programs MPEG-2 encoded only.
> Therefore this is very popular and it absolutely makes sense to keep
> this driver upstream.

It is probably a lot easier to get a modern DVB "budget" card with=20
supports not only MPEG-2 but all encoding standards than to find an
old "full-feat" DVB card with av7110 those days.

Who still provides saa71xx chips those days? As far as I'm aware,=20
Philips semiconductors (who used to produce such chipsets) was split
into NXP in 2006, and the entire digital TV chipset line moved
altogether. I can't find any references those days to any saa71xx=20
at either NXP or Philips websites.

> > The API that got removed was written to control the av7110 MPEG-2 decod=
er,
> > and was never integrated at the DVB core: the av7110 had a driver-speci=
fic
> > implementation inside its code. =20
> This is simply not true.
> The DVB API is linux userspace API, absolutely nothing driver specific
> inside driver's code.

=46rom upstream PoV, it is an av7110-specific API, as all in-kernel support
was inside av7110 driver's code.

> > The saa716x driver you're mentioned is an out of tree driver.
> > We don't keep APIs at the upstream Kernel due to OOT drivers. =20
> Strong words to distract from the main point:
> This regression report is about upstream DVB userspace API and the
> saa7146/av7110 driver, both part of mainline linux for a long time.

Removing a legacy driver is not a regression. See, you're the one
trying to distract from the main point:

The saa716x driver is OOT. There was never any upstream support
for it. None of the patches you're mentioning prevents anyone
to keep building it as an OOT driver.

What it was removed was the av7110, together with the API header
files that were used only by this single driver.

> you stripped almost everything from my previous email, you did not
> answer any questions or gave any explanation for your behavior.

I striped the points already discussed with you when I gave you
feedback about the saa716x patchset [2], as this is a completely
separate discussion than the removal of av7110 support.

In summary, it makes no sense to claim that saa716x OOT driver
broke because a different driver was removed upstream.

Thanks,
Mauro

[2] https://lore.kernel.org/linux-media/20180307121438.389f411c@vento.lan/
