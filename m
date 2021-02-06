Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008DA311C69
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 10:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhBFJs6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 04:48:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:38254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhBFJs4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Feb 2021 04:48:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 273D264E49;
        Sat,  6 Feb 2021 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612604895;
        bh=XswrzWTD4tf2fMvapeIPogwUWD2cVwFzfhhga/NqAvo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VNZYEjHhAKWZLKLN2dzaQmsTGWnAeGubH7mMHVvoXLPHDqz69dTiFwPr2w+v06tbj
         kGXGbpHlvDLWYsMvNAxi31X4v37xVpxhVS7WLnHJe2PlbAjq7onZMMF5C5UAR+kip9
         aOBdgReloDnDR9itu1gn003DSCoPS4TWS1yK3t3e2cnhzjOn7Mi+I8dyHyc1jlqF9H
         vhhOspnkcUWtFDHWMCT+TCKTWx7mcUk60E5NPJRJM6SReumO8U4a/mn6TMKv7/uyqs
         gx9cK7aGAITfhQRvkHvQASjdwp6sMW4fQFEQWt+ryxMNsmJM+obD++an4WRMvxtsJh
         RSioahze2ytQQ==
Date:   Sat, 6 Feb 2021 10:48:09 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Hans Verkuil" <hverkuil@xs4all.nl>
Cc:     Tony Battersby <tonyb@cybernetics.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-kernel@vger.kernel.org,
        Jari Ruusu <jariruusu@protonmail.com>,
        David Laight <David.Laight@aculab.com>,
        Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-media@vger.kernel.org
Subject: Re: Kernel version numbers after 4.9.255 and 4.4.255
Message-ID: <20210206104809.30c15609@coco.lan>
In-Reply-To: <YB5hZop6JZ2Lgv63@kroah.com>
References: <a85b7749-38b2-8ce9-c15a-8acb9a54c5b5@kernel.org>
        <0b12bac9-1b4e-ec4a-8a45-5eb3f1dbbeca@cybernetics.com>
        <20210205191105.128c6e48@coco.lan>
        <YB5DTUiurAwqZbz1@kroah.com>
        <20210206102402.2611b23f@coco.lan>
        <YB5hZop6JZ2Lgv63@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 6 Feb 2021 10:29:10 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:

> On Sat, Feb 06, 2021 at 10:24:02AM +0100, Mauro Carvalho Chehab wrote:
> > Em Sat, 6 Feb 2021 08:20:45 +0100
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> >  =20
> > > On Fri, Feb 05, 2021 at 07:11:05PM +0100, Mauro Carvalho Chehab wrote=
: =20
> > > > Em Fri, 5 Feb 2021 12:31:05 -0500
> > > > Tony Battersby <tonyb@cybernetics.com> escreveu:
> > > >    =20
> > > > > On 2/4/21 6:00 AM, Jiri Slaby wrote:   =20
> > > > > > Agreed. But currently, sublevel won't "wrap", it will "overflow=
" to=20
> > > > > > patchlevel. And that might be a problem. So we might need to up=
date the=20
> > > > > > header generation using e.g. "sublevel & 0xff" (wrap around) or=
=20
> > > > > > "sublevel > 255 : 255 : sublevel" (be monotonic and get stuck a=
t 255).
> > > > > >
> > > > > > In both LINUX_VERSION_CODE generation and KERNEL_VERSION proper=
.     =20
> > > > >=20
> > > > > My preference would be to be monotonic and get stuck at 255 to av=
oid
> > > > > breaking out-of-tree modules.=C2=A0 If needed, add another macro =
that
> > > > > increases the number of bits that can be used to check for sublev=
els >
> > > > > 255, while keeping the old macros for compatibility reasons.=C2=
=A0 Since
> > > > > sublevels > 255 have never existed before, any such checks must be
> > > > > newly-added, so they can be required to use the new macros.
> > > > >=20
> > > > > I do not run the 4.4/4.9 kernels usually, but I do sometimes test=
 a wide
> > > > > range of kernels from 3.18 (gasp!) up to the latest when bisectin=
g,
> > > > > benchmarking, or debugging problems.=C2=A0 And I use a number of =
out-of-tree
> > > > > modules that rely on the KERNEL_VERSION to make everything work.=
=C2=A0 Some
> > > > > out-of-tree modules like an updated igb network driver might be n=
eeded
> > > > > to make it possible to test the old kernel on particular hardware.
> > > > >=20
> > > > > In the worst case, I can patch LINUX_VERSION_CODE and KERNEL_VERS=
ION
> > > > > locally to make out-of-tree modules work.=C2=A0 Or else just not =
test kernels
> > > > > with sublevel > 255.   =20
> > > >=20
> > > > Overflowing LINUX_VERSION_CODE breaks media applications. Several m=
edia
> > > > APIs have an ioctl that returns the Kernel version:
> > > >=20
> > > > 	drivers/media/cec/core/cec-api.c:       caps.version =3D LINUX_VER=
SION_CODE;
> > > > 	drivers/media/mc/mc-device.c:   info->media_version =3D LINUX_VERS=
ION_CODE;
> > > > 	drivers/media/v4l2-core/v4l2-ioctl.c:   cap->version =3D LINUX_VER=
SION_CODE;
> > > > 	drivers/media/v4l2-core/v4l2-subdev.c:          cap->version =3D L=
INUX_VERSION_CODE;   =20
> > >=20
> > > This always struck me as odd, because why can't they just use the
> > > uname(2) syscall instead? =20
> >=20
> > I agree that this is odd on upstream Kernels.
> >=20
> > On backported ones, this should be filled with the version of the V4L2 =
core.
> >=20
> > We maintain a tree that allows running older Kernels with the latest V4=
L2
> > media drivers and subsystem. On such tree, there's a patch that replaces
> > LINUX_VERSION_CODE macro to V4L2_VERSION:
> >=20
> > 	https://git.linuxtv.org/media_build.git/tree/backports/api_version.pat=
ch
> >=20
> > There's a logic here which gets the version of the V4L2 used at the
> > build. So, right now, it is filled with:
> >=20
> > 	#define V4L2_VERSION 330496 /* 0x050b00 */
> >=20
> > In other words, even if you run the backported driver on, let's say, Ke=
rnel
> > 4.8, those calls will tell that the driver's version is from Kernel
> > 5.11. =20
>=20
> That too, is crazy and insane :)
>=20
> > Providing a little of history behind those, this came together with the
> > V4L version 2 API developed during Kernel 2.5.x and merged at Kernel
> > 2.6.0.=20
> >=20
> > When such API was originally introduced, this field was meant to=20
> > contain the driver's version. The problem is that people used to change
> > the drivers (even with major rewrites) without changing its version.
> >=20
> > We ended by standardizing it everywhere, filling those at the media cor=
e,
> > instead of doing it at driver's level - and using the Kernel version.
> >=20
> > This way, developers won't need to be concerned of keeping this
> > updated as the subsystem evolves.
> >=20
> > With time, we also improved the V4L2 API in a way that applications can
> > be able to directly detect the core/driver functionalities without need=
ing
> > to rely on such fields. So, I guess recent versions of most open source
> > applications nowadays don't use it. =20
>=20
> Yes, driver "version" means nothing, so functionality is the correct way
> to handle this.
>=20
> Any chance you all can just drop the kernel version stuff and just
> report a static number that never goes up to allow people to use the
> correct api for new stuff?  Pick a "modern" number, like 5.10 and leave
> it there for forever.

Good question. I like the idea of keeping it fixed, marking those fields
as DEPRECATED at the uAPI documentation.

However, at least the v4l2-compliance tool (used for V4L2=20
development) currently requires it:

	if (vcap.version >=3D 0x050900)  // Present from 5.9.0 onwards
		node->might_support_cache_hints =3D true;

Not sure if uname would work there, or if we would need, to use some
Kconfig symbol to only return the real version on debug Kernels.

Hans,

What do you think?


>=20
> > > > Those can be used by applications in order to enable some features =
that
> > > > are available only after certain Kernel versions.
> > > >=20
> > > > This is somewhat deprecated, in favor of the usage of some other
> > > > capability fields, but for instance, the v4l2-compliance userspace =
tool
> > > > have two such checks:
> > > >=20
> > > > 	utils/v4l2-compliance/v4l2-compliance.cpp
> > > > 	640:	fail_on_test((vcap.version >> 16) < 3);
> > > > 	641:	if (vcap.version >=3D 0x050900)  // Present from 5.9.0 onwards
> > > >=20
> > > > As far as I remember, all such checks are against major.minor. So,
> > > > something like:
> > > >=20
> > > > 	sublevel =3D (sublevel > 0xff) ? 0xff : sublevel;
> > > >=20
> > > > inside KERNEL_VERSION macro should fix such regression at -stable. =
  =20
> > >=20
> > > I think if we clamp KERNEL_VERSION at 255 we should be fine for anyone
> > > checking this type of thing.  Sasha has posted patches to do this. =20
> >=20
> > Yes, this should be enough.
> >=20
> > As far as I remember, when opensource apps use the version from the API,
> > since Kernel 3.0, they always check only for major.minor.
> >=20
> > So, the only problem with those APIs are due to overflows. Setting
> > sublevel to any value beteen 0-255 should work, from V4L2 API
> > standpoint. =20
>=20
> Great, thanks for checking.
>=20
> greg k-h



Thanks,
Mauro
