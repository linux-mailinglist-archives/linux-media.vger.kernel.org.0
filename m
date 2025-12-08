Return-Path: <linux-media+bounces-48431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A794CAD994
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 16:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 413B5301CEB1
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 15:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC2A21A459;
	Mon,  8 Dec 2025 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWtvTX12"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B51122083;
	Mon,  8 Dec 2025 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207956; cv=none; b=iQSti9phJcvpLYHHEkPvUndfy3M8lKDFhUvHLZakkFimTQvlyEbke5iwNK71S698eTGnSZR+wWQJ7fFGklMSEqyh02zpm6MHkl1wlfLybayHt66hWRJDdpYNaeSymbr/Et7i91f8KjFb/RNtLOW54yK+JN7KrlEmhM+srceURx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207956; c=relaxed/simple;
	bh=PusM7xeaT4yaiEWhML+9RyjteBA0D5MBEKjOaZ0q/cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+WVTqbn5RapR/4GPuxOV+snE4lPxvZPPYG8u2qeTaaq61+0C+G9XsI7QSVJ10UWSwbRlOjFm3houD+BB8IesLdG0Lp+6Wl0KOp4Ga9QTCISDm3CbTXnJZpx6TMPzndV16f3lKZ+4aTn52MSGbHb4C4mOvHRBI96LvR5xbMyyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWtvTX12; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE04DC4CEF1;
	Mon,  8 Dec 2025 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765207956;
	bh=PusM7xeaT4yaiEWhML+9RyjteBA0D5MBEKjOaZ0q/cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LWtvTX12a6NA/QFJ37apLDY4QIYn5XYRmzp1svMB81nbDnuZziFSifX/p5vMWJoRG
	 g9vFU6FuC7FJRlbw27YxlrxrURihM8pGEdGaA4L1P2g87EQ2/pAc4mAawodV4idWtt
	 OR58sT6Zhusl9hiH6Qtojc+c47cltvH4YoJ/szzq27Tp0oGsUqdfpqtKNXpmC6HcjL
	 mJRXhQF+GxQn47xudfs7mJrt8HcUHzE+Ewd0yUDj7fU+ddxy6xeqbSI3cphDIoOKlr
	 fbJe2JBlYHoO6C4TxiHMePPXaSTdl2Nv0QsyR609JYkL+xa8TP+i5Of5XCRhghCeL8
	 +O1neeSNKhr7A==
Date: Mon, 8 Dec 2025 16:32:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mats Randgaard <matrandg@cisco.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Message-ID: <20251208-powerful-penguin-of-reputation-ffdc5c@houat>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
 <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org>
 <20251026231553.GB9719@pendragon.ideasonboard.com>
 <20251026233308.GC9719@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dx6cc6brlqxwpezc"
Content-Disposition: inline
In-Reply-To: <20251026233308.GC9719@pendragon.ideasonboard.com>


--dx6cc6brlqxwpezc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
MIME-Version: 1.0

Hi Laurent,

On Mon, Oct 27, 2025 at 01:33:08AM +0200, Laurent Pinchart wrote:
> On Mon, Oct 27, 2025 at 01:15:54AM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 13, 2025 at 01:01:34PM +0200, Maxime Ripard wrote:
> > > MIPI-CSI2 sends its RGB format on the wire with the blue component
> > > first, then green, then red. MIPI calls that format "RGB", but by v4l2
> > > conventions it would be BGR.
> > >=20
> > > MIPI-CSI2 supports three RGB variants: 444, 555, 565, 666 and 888.
> > >=20
> > > We already have BGR666 and BGR888 media bus formats, we don't have any
> > > CSI transceivers using the 444 and 555 variants, but some transceivers
> > > use the CSI RGB565 format, while using the RGB565 media bus code.
> > >=20
> > > That's a mistake, but since we don't have a BGR565 media bus code we
> > > need to introduce one before fixing it.
> > >=20
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++=
++++++++++
> > >  include/uapi/linux/media-bus-format.h              |  3 +-
> > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst=
 b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > index 8e92f784abd8123f9ea950f954a60af56ee76dbe..def0d24ef6cdb1a2ec939=
5af1468f56adf31a8de 100644
> > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > @@ -625,10 +625,47 @@ The following tables list existing packed RGB f=
ormats.
> > >        - b\ :sub:`4`
> > >        - b\ :sub:`3`
> > >        - b\ :sub:`2`
> > >        - b\ :sub:`1`
> > >        - b\ :sub:`0`
> > > +    * .. _MEDIA-BUS-FMT-BGR565-1X16:
> > > +
> > > +      - MEDIA_BUS_FMT_BGR565_1X16
> > > +      - 0x1028
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      -
> > > +      - b\ :sub:`4`
> > > +      - b\ :sub:`3`
> > > +      - b\ :sub:`2`
> > > +      - b\ :sub:`1`
> > > +      - b\ :sub:`0`
> > > +      - g\ :sub:`5`
> > > +      - g\ :sub:`4`
> > > +      - g\ :sub:`3`
> > > +      - g\ :sub:`2`
> > > +      - g\ :sub:`1`
> > > +      - g\ :sub:`0`
> > > +      - r\ :sub:`4`
> > > +      - r\ :sub:`3`
> > > +      - r\ :sub:`2`
> > > +      - r\ :sub:`1`
> > > +      - r\ :sub:`0`
> >=20
> > We're definitely in convention territory, because this is not how 16-bit
> > RGB data is transmitted over CSI-2. CSI-2 transmits blue first, but
> > starts with bit 0, not bit 4.
> >=20
> > Have you explored the alternative of picking the parallel bus code that
> > matches the serial order when transmitted with the least significant bit
> > first ? That would be MEDIA_BUS_FMT_RGB565_1X16 here, and
> > MEDIA_BUS_FMT_RGB888_1X24 for 24-bit RGB.
>=20
> To be clear, media bus codes are a matter of conventions. Some
> conventions would be easier to explain that others, and can also be more
> consistent with pixel format namings, but at the end of the day they're
> all conventions. While saying "pick the media bus code that transmits a
> pixel in one clock sample, with the bit order matching LSB-first
> transmission" could be the simplest to document, there will be a
> mismatch in component orders between the media bus code and the pixel
> format in some cases. There may also be more drivers implementing other
> conventions, making the transition more difficult.
>=20
> I'll be very busy the upcoming week and will likely not be able to
> participate in this discussion in the near future.

For the record, we've discussed it on IRC recently.

The suggestion to have all CSI Data Formats as MEDIA_BUS_FMT_RGB*_1X*
variants make sense to me. And we can easily document it, because we
could match the first bit transmitted with the least significant bit
of a media bus code indeed.

Thus a sensor using RGB888 would register MEDIA_BUS_FMT_RGB888_1X24.
That's indeed the case right now with tc358743:
https://elixir.bootlin.com/linux/v6.18/source/drivers/media/i2c/tc358743.c#=
L1775

Unicam however hardcodes (and validates) that the v4l2 format codes
matches the media bus code of the other end:

https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/broadc=
om/bcm2835-unicam.c#L1333

That alone makes total sense, but it has an association between
V4l2_PIX_FMT_RGB24 and MEDIA_BUS_FMT_RGB888_1X24, and between
V4L2_PIX_FMT_BGR24 and MEDIA_BUS_FMT_BGR888_1X24

https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/broadc=
om/bcm2835-unicam.c#L343

Using the convention you suggested, this association is wrong, and
V4L2_PIX_FMT_BGR24 should be associated MEDIA_BUS_FMT_RGB888_1X24. Thus,
the red and blue color components are mixed up.

I initially tried to fix it in my v1 by removing the RGB24 support
https://lore.kernel.org/all/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3=
eb@kernel.org/

This was shot down (rightfully) because it would still be broken.

The second version changed the media bus tc358743 reported:
https://lore.kernel.org/all/20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.o=
rg/

Dave was against it because it would potentially break userspace, citing
Linus that we shouldn't break userspace ever. I understand and somewhat
agree with his point, but having two drivers reporting the same data
format but with a different meaning is also a way of breaking userspace.

Anyway. It was then suggested to support both in the tc358743. That's
what the second, third and fourth that you commented on worked towards.

https://lore.kernel.org/all/20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.o=
rg/
https://lore.kernel.org/all/20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.o=
rg/
https://lore.kernel.org/all/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.o=
rg/

In order to implement your suggestion, I wouldn't to modify tc358743,
but would need to modify the association between the v4l2 format and
media bus code that unicam has. In a way, it's very similar to my first
version that got shot down, and suffers from the same flaws: we could
have a userspace application out there hardcoding formats and codes that
will get an error.

So I'm not sure your suggestion really works, unless we reevaluate what
we mean by breaking userspace. Either way, I don't care, I just want to
get pixels in the expected (and documented!) order when using unicam.

Maxime

--dx6cc6brlqxwpezc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTbvjAAKCRAnX84Zoj2+
dgJ3AX99vwu5gYj1cljZfrhA96X4G0eBdwJigkADmkZ7g9com6yc2xX9CFddObyx
JeSus+wBgPSs+t3U6RVwp9touNn/Zs6laE5HiNneP0oVliuusRSI29ruNQh5sSJK
QOMxSlAYiw==
=+oyh
-----END PGP SIGNATURE-----

--dx6cc6brlqxwpezc--

