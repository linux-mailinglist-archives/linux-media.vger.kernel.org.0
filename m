Return-Path: <linux-media+bounces-810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B220F7F4793
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0B821C2091B
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9753251C39;
	Wed, 22 Nov 2023 13:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ncO63D4Q"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245A3A4;
	Wed, 22 Nov 2023 05:19:04 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86DDE20013;
	Wed, 22 Nov 2023 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700659143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fnxrWPQ64G+VTGUNFQzAHED8SWzP50c4bWCwKUpHX3Y=;
	b=ncO63D4Q/gteYlaYLUwuOzp4pinF9I0sKcymptWV8MtSM5tMHslOLOH7AiVQ4uIcwnMamn
	aDNt0MRI3UMSkRLVCk33hUpTrCskhJ1/jAxiGMKKQSXr4wpsnod5prNFv4H9FD6Q8LuMKc
	EtfEBrF8+hSeSmzA7wCO9h3UOdnls1UH7D079lcwrLWTt3fmxgk6EIfs2KRmNep3j97oxx
	Sxp2jy3iHTt6Zn9r50ozxl7wDnRjbunxNUEtY4K26zJgBxD9pGj/7JaX5+KbJY8UtwkXP3
	p++4Z+9QDXuT+xNRIDy1ZFDS22VUrnvWCfjhyzG7khTIwfaMU7JKJ0fq9cjKkg==
Date: Wed, 22 Nov 2023 14:19:01 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>, mchehab@kernel.org,
	heiko@sntech.de, hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com
Subject: Re: [PATCH v11 2/3] media: rockchip: Add a driver for Rockchip's
 camera interface
Message-ID: <ZV3_xe6A0v7kKgmo@aptenodytes>
References: <cover.1700132457.git.mehdi.djait@bootlin.com>
 <db605935ad21c4780b73db87605b52d30bc936a4.1700132457.git.mehdi.djait@bootlin.com>
 <ZVz58b0r4gtxyVQy@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <9570dc1c-a437-46d4-95e7-1f3dd399e458@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QupFpwrHhFERsze/"
Content-Disposition: inline
In-Reply-To: <9570dc1c-a437-46d4-95e7-1f3dd399e458@wolfvision.net>
X-GND-Sasl: paul.kocialkowski@bootlin.com


--QupFpwrHhFERsze/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed 22 Nov 23, 13:42, Michael Riesch wrote:
> Hi Tommaso,
>=20
> On 11/21/23 19:41, Tommaso Merciai wrote:
> > Hi Mehdi,
> >=20
> > On Thu, Nov 16, 2023 at 12:04:39PM +0100, Mehdi Djait wrote:
> >> This introduces a V4L2 driver for the Rockchip CIF video capture contr=
oller.
> >>
> >> This controller supports multiple parallel interfaces, but for now onl=
y the
> >> BT.656 interface could be tested, hence it's the only one that's suppo=
rted
> >> in the first version of this driver.
> >>
> >> This controller can be found on RK3066, PX30, RK1808, RK3128 and RK328=
8,
> >> but for now it's only been tested on the PX30.
> >>
> >> CIF is implemented as a video node-centric driver.
> >>
> >> Most of this driver was written following the BSP driver from rockchip,
> >> removing the parts that either didn't fit correctly the guidelines, or=
 that
> >> couldn't be tested.
> >>
> >> This basic version doesn't support cropping nor scaling and is only
> >> designed with one SDTV video decoder being attached to it at any time.
> >>
> >> This version uses the "pingpong" mode of the controller, which is a
> >> double-buffering mechanism.
> >>
> >> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> >> ---
> >>  MAINTAINERS                                   |    7 +
> >>  drivers/media/platform/rockchip/Kconfig       |    1 +
> >>  drivers/media/platform/rockchip/Makefile      |    1 +
> >>  drivers/media/platform/rockchip/cif/Kconfig   |   13 +
> >>  drivers/media/platform/rockchip/cif/Makefile  |    3 +
> >>  drivers/media/platform/rockchip/cif/capture.c | 1120 +++++++++++++++++
> >>  drivers/media/platform/rockchip/cif/capture.h |   21 +
> >>  drivers/media/platform/rockchip/cif/common.h  |  129 ++
> >>  drivers/media/platform/rockchip/cif/dev.c     |  302 +++++
> >>  drivers/media/platform/rockchip/cif/regs.h    |  127 ++
> >>  10 files changed, 1724 insertions(+)
> >>  create mode 100644 drivers/media/platform/rockchip/cif/Kconfig
> >>  create mode 100644 drivers/media/platform/rockchip/cif/Makefile
> >>  create mode 100644 drivers/media/platform/rockchip/cif/capture.c
> >>  create mode 100644 drivers/media/platform/rockchip/cif/capture.h
> >>  create mode 100644 drivers/media/platform/rockchip/cif/common.h
> >>  create mode 100644 drivers/media/platform/rockchip/cif/dev.c
> >>  create mode 100644 drivers/media/platform/rockchip/cif/regs.h
> >=20
> > Just a logigistic comment on my side for now, sorry :)
> > What about use cif-* prefix in front of driver files?
> >=20
> > like:
> >=20
> > cif-capture.c
> > cif-capture.h
> > cif-common.h
> > cif-dev.c
> > cif-regs.h
>=20
> What would be the rationale here?
>=20
> IMHO the files are in a folder named cif, so adding this prefix seems
> kind of redundant.
>=20
> That said, if there is a good reason I could live with cif-*.{c,h} as
> well, of course. My only request would be to agree on something ASAP.

It's rather common to do that in Linux and one advantage is that it makes it
clear in your text editor which driver you are looking at when only the file
name is shown.

I don't have any strong opinion on this either though.

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--QupFpwrHhFERsze/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVd/8UACgkQ3cLmz3+f
v9ERgggAlGFeYIALRi2unibzWF/Kw1uv29RulA7nx3yFQuPAvkgq8posHx2e2E6Y
smNvcTOfiSyhtgmzvY8z6p0lMsQ6DtAg6KMrQ491mSEfPNocw5QouLIgFtsTDvCV
BJg4aSOlBFaEERlgUOpLJBykVuFiod3qhf4bJbW+2IEAOfwycDrSYi/YOL6u9QfU
nEuJlCQ1t3vfRiooxDnlZVr7fC6gfVW6CLKQPEa6+Pd/Nv6FSlmk37BcQD3QzlFc
pKyw/n1NVmr26TXCQzyszTP4w38vuyIE8GrupXttgXkd7GzdDowku7vAyrVF1oMq
AUGHco5aawKc3ei0C9e7mpW45jHnVA==
=fucA
-----END PGP SIGNATURE-----

--QupFpwrHhFERsze/--

