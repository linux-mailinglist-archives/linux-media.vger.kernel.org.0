Return-Path: <linux-media+bounces-51734-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLvbH+4Cemn31QEAu9opvQ
	(envelope-from <linux-media+bounces-51734-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:37:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCAFA1551
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F84B304809E
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 12:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D57634F24D;
	Wed, 28 Jan 2026 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMceGaho"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8552EA151;
	Wed, 28 Jan 2026 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769603538; cv=none; b=uJeWp8TaVw6tvtxGdRDt8ldUMtAjhs1wuZ6O5QVtyOi0Wu6t3yOhXF1m96Z1u3z4E9jAbC1SyBuJvAxixAFpepRIaQJeuRQZnS4YCMjQzQFZ6VeKHRgKfITMAje9gvYtp5BmtIWkNy2/WI0LjjXE9dEt8S5FZjf4Nm0UgaM4klY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769603538; c=relaxed/simple;
	bh=/L7tnY7XQJ2c1DfsTA/jyqX7exYVHQungYCVstKLu+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFS+7zJT4h3qLEd6d7Q5sdb0q78/kr09hUKj9EO+rv2KEkHONu8pvfw9Fw2aRo+ANwODjirQbDBDJKNkZ/wHEDrjjtXRh/WhKQfbzKzSPVewXd+kcYc0kOgdEPHiJidxPemAe2m1b/koMuNT9jSn/iBWMux0fXraH1EEJbx94Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMceGaho; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB793C4CEF1;
	Wed, 28 Jan 2026 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769603538;
	bh=/L7tnY7XQJ2c1DfsTA/jyqX7exYVHQungYCVstKLu+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMceGahoWmW7p0+FuBruwC/wCgM95Zzpqz+259F15SF6V1ALsuUgHqPx2TLzQw2cq
	 Uy1C077JyTqCuyLH6NRaSxnkskQUTGuK4fLl8Ucm4IAfszAH7QaEYa4Ncqx2VH3eEd
	 AX7ilAJFmrbmzmL71UXN/na4X87QdXAJnmEffGT5TVkd1LZTcBIUvcLzuLZbZEVxm/
	 ndJ1ZRvH4osYcT+nBcQTzwXl0e3HiQVc4siBNEGXBSt5k+R5L1uuDJD0UEPEIjvimW
	 z1ttMdG9SeO4/ndR0BkSLJGWG09aZtFKy3Ybl4kN6w/MhX11JMlxaaw2pujDKkgpxZ
	 yEXZC2WylDaOA==
Date: Wed, 28 Jan 2026 13:32:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mats Randgaard <matrandg@cisco.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Message-ID: <20260128-neon-lyrical-pheasant-6cbdf2@houat>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
 <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org>
 <20251026231553.GB9719@pendragon.ideasonboard.com>
 <20251026233308.GC9719@pendragon.ideasonboard.com>
 <20251208-powerful-penguin-of-reputation-ffdc5c@houat>
 <20260123153432.GA415966@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4yr3t5q4yhv5nava"
Content-Disposition: inline
In-Reply-To: <20260123153432.GA415966@killaraus>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51734-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECCAFA1551
X-Rspamd-Action: no action


--4yr3t5q4yhv5nava
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 05:34:32PM +0200, Laurent Pinchart wrote:
> On Mon, Dec 08, 2025 at 04:32:33PM +0100, Maxime Ripard wrote:
> > On Mon, Oct 27, 2025 at 01:33:08AM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 27, 2025 at 01:15:54AM +0200, Laurent Pinchart wrote:
> > > > On Mon, Oct 13, 2025 at 01:01:34PM +0200, Maxime Ripard wrote:
> > > > > MIPI-CSI2 sends its RGB format on the wire with the blue component
> > > > > first, then green, then red. MIPI calls that format "RGB", but by=
 v4l2
> > > > > conventions it would be BGR.
> > > > >=20
> > > > > MIPI-CSI2 supports three RGB variants: 444, 555, 565, 666 and 888.
> > > > >=20
> > > > > We already have BGR666 and BGR888 media bus formats, we don't hav=
e any
> > > > > CSI transceivers using the 444 and 555 variants, but some transce=
ivers
> > > > > use the CSI RGB565 format, while using the RGB565 media bus code.
> > > > >=20
> > > > > That's a mistake, but since we don't have a BGR565 media bus code=
 we
> > > > > need to introduce one before fixing it.
> > > > >=20
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > ---
> > > > >  .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++=
++++++++++++++
> > > > >  include/uapi/linux/media-bus-format.h              |  3 +-
> > > > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats=
=2Erst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > index 8e92f784abd8123f9ea950f954a60af56ee76dbe..def0d24ef6cdb1a2e=
c9395af1468f56adf31a8de 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > @@ -625,10 +625,47 @@ The following tables list existing packed R=
GB formats.
> > > > >        - b\ :sub:`4`
> > > > >        - b\ :sub:`3`
> > > > >        - b\ :sub:`2`
> > > > >        - b\ :sub:`1`
> > > > >        - b\ :sub:`0`
> > > > > +    * .. _MEDIA-BUS-FMT-BGR565-1X16:
> > > > > +
> > > > > +      - MEDIA_BUS_FMT_BGR565_1X16
> > > > > +      - 0x1028
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      -
> > > > > +      - b\ :sub:`4`
> > > > > +      - b\ :sub:`3`
> > > > > +      - b\ :sub:`2`
> > > > > +      - b\ :sub:`1`
> > > > > +      - b\ :sub:`0`
> > > > > +      - g\ :sub:`5`
> > > > > +      - g\ :sub:`4`
> > > > > +      - g\ :sub:`3`
> > > > > +      - g\ :sub:`2`
> > > > > +      - g\ :sub:`1`
> > > > > +      - g\ :sub:`0`
> > > > > +      - r\ :sub:`4`
> > > > > +      - r\ :sub:`3`
> > > > > +      - r\ :sub:`2`
> > > > > +      - r\ :sub:`1`
> > > > > +      - r\ :sub:`0`
> > > >=20
> > > > We're definitely in convention territory, because this is not how 1=
6-bit
> > > > RGB data is transmitted over CSI-2. CSI-2 transmits blue first, but
> > > > starts with bit 0, not bit 4.
> > > >=20
> > > > Have you explored the alternative of picking the parallel bus code =
that
> > > > matches the serial order when transmitted with the least significan=
t bit
> > > > first ? That would be MEDIA_BUS_FMT_RGB565_1X16 here, and
> > > > MEDIA_BUS_FMT_RGB888_1X24 for 24-bit RGB.
> > >=20
> > > To be clear, media bus codes are a matter of conventions. Some
> > > conventions would be easier to explain that others, and can also be m=
ore
> > > consistent with pixel format namings, but at the end of the day they'=
re
> > > all conventions. While saying "pick the media bus code that transmits=
 a
> > > pixel in one clock sample, with the bit order matching LSB-first
> > > transmission" could be the simplest to document, there will be a
> > > mismatch in component orders between the media bus code and the pixel
> > > format in some cases. There may also be more drivers implementing oth=
er
> > > conventions, making the transition more difficult.
> > >=20
> > > I'll be very busy the upcoming week and will likely not be able to
> > > participate in this discussion in the near future.
> >=20
> > For the record, we've discussed it on IRC recently.
> >=20
> > The suggestion to have all CSI Data Formats as MEDIA_BUS_FMT_RGB*_1X*
> > variants make sense to me. And we can easily document it, because we
> > could match the first bit transmitted with the least significant bit
> > of a media bus code indeed.
>=20
> That's one of the things I like about it, it's consistent and easy to
> document. Glad we agree :-)
>=20
> > Thus a sensor using RGB888 would register MEDIA_BUS_FMT_RGB888_1X24.
> > That's indeed the case right now with tc358743:
> > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/i2c/tc35874=
3.c#L1775
> >=20
> > Unicam however hardcodes (and validates) that the v4l2 format codes
> > matches the media bus code of the other end:
> >=20
> > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/br=
oadcom/bcm2835-unicam.c#L1333
> >=20
> > That alone makes total sense, but it has an association between
> > V4l2_PIX_FMT_RGB24 and MEDIA_BUS_FMT_RGB888_1X24, and between
> > V4L2_PIX_FMT_BGR24 and MEDIA_BUS_FMT_BGR888_1X24
> >=20
> > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/br=
oadcom/bcm2835-unicam.c#L343
> >=20
> > Using the convention you suggested, this association is wrong, and
> > V4L2_PIX_FMT_BGR24 should be associated MEDIA_BUS_FMT_RGB888_1X24. Thus,
> > the red and blue color components are mixed up.
>=20
> Correct.
>=20
> > I initially tried to fix it in my v1 by removing the RGB24 support
> > https://lore.kernel.org/all/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b9=
63f3eb@kernel.org/
> >=20
> > This was shot down (rightfully) because it would still be broken.
> >=20
> > The second version changed the media bus tc358743 reported:
> > https://lore.kernel.org/all/20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kern=
el.org/
> >=20
> > Dave was against it because it would potentially break userspace, citing
> > Linus that we shouldn't break userspace ever. I understand and somewhat
> > agree with his point, but having two drivers reporting the same data
> > format but with a different meaning is also a way of breaking userspace.
>=20
> Yes, I would find that pretty bad, possibly even worse.
>=20
> > Anyway. It was then suggested to support both in the tc358743. That's
> > what the second, third and fourth that you commented on worked towards.
> >=20
> > https://lore.kernel.org/all/20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kern=
el.org/
> > https://lore.kernel.org/all/20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kern=
el.org/
> > https://lore.kernel.org/all/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kern=
el.org/
> >=20
> > In order to implement your suggestion, I wouldn't to modify tc358743,
> > but would need to modify the association between the v4l2 format and
> > media bus code that unicam has. In a way, it's very similar to my first
> > version that got shot down, and suffers from the same flaws: we could
> > have a userspace application out there hardcoding formats and codes that
> > will get an error.
> >=20
> > So I'm not sure your suggestion really works, unless we reevaluate what
> > we mean by breaking userspace. Either way, I don't care, I just want to
> > get pixels in the expected (and documented!) order when using unicam.
>=20
> I've lost track of the status of this series and what your current
> suggestion is. Can we standardize on
>=20
> - Using MEDIA_BUS_FMT_RGB*

I guess we can do that.

> - Produce V4L2_PIX_FMT_BGR24 from MEDIA_BUS_FMT_RGB888_1X24 in unicam

You called "pretty bad, possibly even worse" to do the exact opposite
(ie, change the bridge media bus to match unicam) because it would break
userspace. Changing the unicam media bus to match the bridge creates the
exact same situation.

The alternative would still be to report both for the bridge, and invert
the current assocation for the v4l2 formats and mbus codes.

> - Possibly implement backward compatibility somewhere (where ?) to avoid
>   regressions, but with a big warning

What would you improve there exactly? It's very clearly in the patches
already, so unless you have some specific comments I'm not really sure
what you want me to do.

Maxime

--4yr3t5q4yhv5nava
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXoBzgAKCRAnX84Zoj2+
dt2pAYC4rSzMjyagfZjEDxXY+TnFLn6b67lUHCBHgE1pEmHrFjg8OOG/kWdig8av
0+FvcTsBfiSmCedyFgZrh0VYMroeae/liCYHflCGN9Pmx5hmjBEMohixu4Bn6Dt+
6+ah7rUptg==
=13H/
-----END PGP SIGNATURE-----

--4yr3t5q4yhv5nava--

