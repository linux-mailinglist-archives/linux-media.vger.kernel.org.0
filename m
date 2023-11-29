Return-Path: <linux-media+bounces-1363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075D07FD8A3
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82765B21565
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09197210F0;
	Wed, 29 Nov 2023 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oGPVJn7s"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64AA198
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 05:51:28 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43D7C2000A;
	Wed, 29 Nov 2023 13:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701265887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iio5lhZ7fDTgwlNACNdVlwnuy5DnkJ33cA5N20DaXYc=;
	b=oGPVJn7sniLFH47nuUbO4CwBJhoY6bH3i4gh5xbttoOG7D1mbHPM67SJA+5qM9AIQ7HnnW
	XrL4aBxx5HkD0sf74mv38C4Y1fPYS4qElZ3pIpiTuPVtUm0f4zU9bakGktXkOvASE0kS02
	oMJKFgGeYH5Johd8N8xuA6kkQptlwCbIJaQv4vBSrEaGhQdX7h1F+AZxMosMRgfvduHKg4
	fr4QWOQ/gjjKr2MP4OxaRTpfKl9Ku9a4cc5jspfbMwDFyMrQ4vKgXzjlTGNChpmAnbMmap
	FTv5BhN1oRKyOfuU3vBds5j1m4BDLK//bFN8i6QI9QN/5pc9ki36yQFBathBhQ==
Date: Wed, 29 Nov 2023 14:51:21 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Jacopo Mondi <jacopo@jmondi.org>, Bingbu Cao <bingbu.cao@intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Maxime Ripard <mripard@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Yong Deng <yong.deng@magewell.com>, Benoit Parrot <bparrot@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v4 1/1] media: v4l2-subdev: Rename .init_cfg() operation
 to .init_state()
Message-ID: <ZWdB2T3miLiXv3Gg@aptenodytes>
References: <20231127090744.30012-1-laurent.pinchart@ideasonboard.com>
 <20231127090744.30012-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N9wa/NidUoCPh6m3"
Content-Disposition: inline
In-Reply-To: <20231127090744.30012-2-laurent.pinchart@ideasonboard.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com


--N9wa/NidUoCPh6m3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Mon 27 Nov 23, 11:07, Laurent Pinchart wrote:
> The subdev .init_cfg() operation is affected by two issues:
>=20
> - It has long been extended to initialize a whole v4l2_subdev_state
>   instead of just a v4l2_subdev_pad_config, but its name has stuck
>   around.
>=20
> - Despite operating on a whole subdev state and not being directly
>   exposed to the subdev users (either in-kernel or through the userspace
>   API), .init_cfg() is categorized as a subdev pad operation.
>=20
> This participates in making the subdev API confusing for new developers.
> Fix it by renaming the operation to .init_state(), and make it a subdev
> internal operation.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Michael Riesch <michael.riesch@wolfvision.net> # for imx415
> Acked-by: Shuah Khan <skhan@linuxfoundation.org> # for vimc

For the sun6i-csi, sun6i-isp, sun6i-mipi-csi2 and sun8i-a83t-mipi-csi2 driv=
ers:
Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

I might submit some cosmetic patch later to reorder things but this can wai=
t.

Thanks for working on this, it's much cleaner this way :)

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--N9wa/NidUoCPh6m3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVnQdkACgkQ3cLmz3+f
v9F3JQf+LlRthaKeOvwJCHOU9Q2X+XQnUF7gemWM+Uhn5mBgRJEgQJaKVEKC3Ws9
d48rQ8vUm6PEqNmR+brozNcazA7ooiF57XSAxOkMMe4DmzI+Ty3v33TgFUSs9Mj5
KKMN86uON2kTUxABosJXzxki8xiKLcHukpSqBu0Bdsf7qihWWjy1fnphh71J+sUB
5d3PnshhRdzckUxQVYBO+gyvRKCC9ayidhoRLETD4wcyOKhrCGolcEfdq5vOcZoB
Ddkbr88YAmbDIpj/oPTrZ/yZFKDktPu0o9FKqEyCG1fXFlTKmndgfwEs/Sg4s3J1
KoucOX5VVOLRjdUDhdh1ygcQVPyIBQ==
=QniV
-----END PGP SIGNATURE-----

--N9wa/NidUoCPh6m3--

