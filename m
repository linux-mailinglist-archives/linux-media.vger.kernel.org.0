Return-Path: <linux-media+bounces-52166-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OtWLAwTg2kPhQMAu9opvQ
	(envelope-from <linux-media+bounces-52166-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 10:36:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14851E3EBB
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 10:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57766306ECB0
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 09:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60203ACF0F;
	Wed,  4 Feb 2026 09:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyof0mHU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA053A0E9F;
	Wed,  4 Feb 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197467; cv=none; b=giCeoTPPeORik3thZSFww1g3FY2wu4F8lZglu9rUfNwCzou5plC9wQ/Dkl1XDhXqkwj7rjQvD+0EojzEBsOr9m8RBd+fPNkGurE+dXFtyiuu8m6udQ2swxIYEQHLU1cfB+aprtq0JsOW8IXcK2Q1ScNjSPvsiXcOUwjxGhOzcNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197467; c=relaxed/simple;
	bh=tQ3XIdnaSUo2UGNmxHEuYSJyHlYM8G4Np04MBwdnOvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1qfkSMUkiujtBn15D1lUZWafychM+puhJi4nDrVi1e+jxd0HZvUJkF8BtRfT/O3xuV/WWj2hRZEzWq6snfR4asWPSVoGtmS35lm3rf66LB/tiaBBoMgFsaFTPRKgff7l6oJTapXPuWxlqeyn+Im3xXI+xdaQ3F0mRPYzjh6ILI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyof0mHU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6701AC4CEF7;
	Wed,  4 Feb 2026 09:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770197466;
	bh=tQ3XIdnaSUo2UGNmxHEuYSJyHlYM8G4Np04MBwdnOvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyof0mHUktn/2i2FooBn7/XhbX0Txty4MKXHsuNYsyoXwWiCrBGC7c4e3s9rJ8qhq
	 JGBuxccYKYsAgP+/iISgy3cDZ9eLoea2fsjruNWBYgMgQ4jp1giRRhQVwE+vFa6UBB
	 KhlKR4ewojG6CdJYOuehSp1vkY6+wKpNUJvv5Gmu6bPGCE1cBvuM8/BTshFZSYaWWG
	 6DPYxeTl8FWa3sNS0A+74j3Z9iLVvBWafnMvHG1WMXGsWAq9D3n9kfYde3xH/DS+e3
	 Gu9xx3evZu723N+RR+QzMHTsUNJjaJT7KFdRPRtV6+RhkkP3uf7AKgv/YSvFkU2jzb
	 Nh3gH4fFyEY0g==
Date: Wed, 4 Feb 2026 10:31:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Mats Randgaard <matrandg@cisco.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Message-ID: <20260204-elastic-optimal-basilisk-d2e57a@houat>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
 <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org>
 <20251026231553.GB9719@pendragon.ideasonboard.com>
 <20251026233308.GC9719@pendragon.ideasonboard.com>
 <20251208-powerful-penguin-of-reputation-ffdc5c@houat>
 <20260123153432.GA415966@killaraus>
 <20260128-neon-lyrical-pheasant-6cbdf2@houat>
 <20260128131903.GC3210848@killaraus>
 <20260203-bald-meek-crayfish-fdaafc@houat>
 <20260203234036.GC133801@killaraus>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ruzn5zormkky65do"
Content-Disposition: inline
In-Reply-To: <20260203234036.GC133801@killaraus>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52166-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 14851E3EBB
X-Rspamd-Action: no action


--ruzn5zormkky65do
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
MIME-Version: 1.0

On Wed, Feb 04, 2026 at 01:40:36AM +0200, Laurent Pinchart wrote:
> On Tue, Feb 03, 2026 at 09:52:16AM +0100, Maxime Ripard wrote:
> > On Wed, Jan 28, 2026 at 03:19:03PM +0200, Laurent Pinchart wrote:
> > > On Wed, Jan 28, 2026 at 01:32:15PM +0100, Maxime Ripard wrote:
> > > > On Fri, Jan 23, 2026 at 05:34:32PM +0200, Laurent Pinchart wrote:
> > > > > On Mon, Dec 08, 2025 at 04:32:33PM +0100, Maxime Ripard wrote:
> > > > > > On Mon, Oct 27, 2025 at 01:33:08AM +0200, Laurent Pinchart wrot=
e:
> > > > > > > On Mon, Oct 27, 2025 at 01:15:54AM +0200, Laurent Pinchart wr=
ote:
> > > > > > > > On Mon, Oct 13, 2025 at 01:01:34PM +0200, Maxime Ripard wro=
te:
> > > > > > > > > MIPI-CSI2 sends its RGB format on the wire with the blue =
component
> > > > > > > > > first, then green, then red. MIPI calls that format "RGB"=
, but by v4l2
> > > > > > > > > conventions it would be BGR.
> > > > > > > > >=20
> > > > > > > > > MIPI-CSI2 supports three RGB variants: 444, 555, 565, 666=
 and 888.
> > > > > > > > >=20
> > > > > > > > > We already have BGR666 and BGR888 media bus formats, we d=
on't have any
> > > > > > > > > CSI transceivers using the 444 and 555 variants, but some=
 transceivers
> > > > > > > > > use the CSI RGB565 format, while using the RGB565 media b=
us code.
> > > > > > > > >=20
> > > > > > > > > That's a mistake, but since we don't have a BGR565 media =
bus code we
> > > > > > > > > need to introduce one before fixing it.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > > > ---
> > > > > > > > >  .../userspace-api/media/v4l/subdev-formats.rst     | 37 =
++++++++++++++++++++++
> > > > > > > > >  include/uapi/linux/media-bus-format.h              |  3 =
+-
> > > > > > > > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > > > > > > > >=20
> > > > > > > > > diff --git a/Documentation/userspace-api/media/v4l/subdev=
-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > > > > > index 8e92f784abd8123f9ea950f954a60af56ee76dbe..def0d24ef=
6cdb1a2ec9395af1468f56adf31a8de 100644
> > > > > > > > > --- a/Documentation/userspace-api/media/v4l/subdev-format=
s.rst
> > > > > > > > > +++ b/Documentation/userspace-api/media/v4l/subdev-format=
s.rst
> > > > > > > > > @@ -625,10 +625,47 @@ The following tables list existing =
packed RGB formats.
> > > > > > > > >        - b\ :sub:`4`
> > > > > > > > >        - b\ :sub:`3`
> > > > > > > > >        - b\ :sub:`2`
> > > > > > > > >        - b\ :sub:`1`
> > > > > > > > >        - b\ :sub:`0`
> > > > > > > > > +    * .. _MEDIA-BUS-FMT-BGR565-1X16:
> > > > > > > > > +
> > > > > > > > > +      - MEDIA_BUS_FMT_BGR565_1X16
> > > > > > > > > +      - 0x1028
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      -
> > > > > > > > > +      - b\ :sub:`4`
> > > > > > > > > +      - b\ :sub:`3`
> > > > > > > > > +      - b\ :sub:`2`
> > > > > > > > > +      - b\ :sub:`1`
> > > > > > > > > +      - b\ :sub:`0`
> > > > > > > > > +      - g\ :sub:`5`
> > > > > > > > > +      - g\ :sub:`4`
> > > > > > > > > +      - g\ :sub:`3`
> > > > > > > > > +      - g\ :sub:`2`
> > > > > > > > > +      - g\ :sub:`1`
> > > > > > > > > +      - g\ :sub:`0`
> > > > > > > > > +      - r\ :sub:`4`
> > > > > > > > > +      - r\ :sub:`3`
> > > > > > > > > +      - r\ :sub:`2`
> > > > > > > > > +      - r\ :sub:`1`
> > > > > > > > > +      - r\ :sub:`0`
> > > > > > > >=20
> > > > > > > > We're definitely in convention territory, because this is n=
ot how 16-bit
> > > > > > > > RGB data is transmitted over CSI-2. CSI-2 transmits blue fi=
rst, but
> > > > > > > > starts with bit 0, not bit 4.
> > > > > > > >=20
> > > > > > > > Have you explored the alternative of picking the parallel b=
us code that
> > > > > > > > matches the serial order when transmitted with the least si=
gnificant bit
> > > > > > > > first ? That would be MEDIA_BUS_FMT_RGB565_1X16 here, and
> > > > > > > > MEDIA_BUS_FMT_RGB888_1X24 for 24-bit RGB.
> > > > > > >=20
> > > > > > > To be clear, media bus codes are a matter of conventions. Some
> > > > > > > conventions would be easier to explain that others, and can a=
lso be more
> > > > > > > consistent with pixel format namings, but at the end of the d=
ay they're
> > > > > > > all conventions. While saying "pick the media bus code that t=
ransmits a
> > > > > > > pixel in one clock sample, with the bit order matching LSB-fi=
rst
> > > > > > > transmission" could be the simplest to document, there will b=
e a
> > > > > > > mismatch in component orders between the media bus code and t=
he pixel
> > > > > > > format in some cases. There may also be more drivers implemen=
ting other
> > > > > > > conventions, making the transition more difficult.
> > > > > > >=20
> > > > > > > I'll be very busy the upcoming week and will likely not be ab=
le to
> > > > > > > participate in this discussion in the near future.
> > > > > >=20
> > > > > > For the record, we've discussed it on IRC recently.
> > > > > >=20
> > > > > > The suggestion to have all CSI Data Formats as MEDIA_BUS_FMT_RG=
B*_1X*
> > > > > > variants make sense to me. And we can easily document it, becau=
se we
> > > > > > could match the first bit transmitted with the least significan=
t bit
> > > > > > of a media bus code indeed.
> > > > >=20
> > > > > That's one of the things I like about it, it's consistent and eas=
y to
> > > > > document. Glad we agree :-)
> > > > >=20
> > > > > > Thus a sensor using RGB888 would register MEDIA_BUS_FMT_RGB888_=
1X24.
> > > > > > That's indeed the case right now with tc358743:
> > > > > > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/i2c=
/tc358743.c#L1775
> > > > > >=20
> > > > > > Unicam however hardcodes (and validates) that the v4l2 format c=
odes
> > > > > > matches the media bus code of the other end:
> > > > > >=20
> > > > > > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/pla=
tform/broadcom/bcm2835-unicam.c#L1333
> > > > > >=20
> > > > > > That alone makes total sense, but it has an association between
> > > > > > V4l2_PIX_FMT_RGB24 and MEDIA_BUS_FMT_RGB888_1X24, and between
> > > > > > V4L2_PIX_FMT_BGR24 and MEDIA_BUS_FMT_BGR888_1X24
> > > > > >=20
> > > > > > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/pla=
tform/broadcom/bcm2835-unicam.c#L343
> > > > > >=20
> > > > > > Using the convention you suggested, this association is wrong, =
and
> > > > > > V4L2_PIX_FMT_BGR24 should be associated MEDIA_BUS_FMT_RGB888_1X=
24. Thus,
> > > > > > the red and blue color components are mixed up.
> > > > >=20
> > > > > Correct.
> > > > >=20
> > > > > > I initially tried to fix it in my v1 by removing the RGB24 supp=
ort
> > > > > > https://lore.kernel.org/all/20250606-rpi-unicam-rgb-bgr-fix-v1-=
1-9930b963f3eb@kernel.org/
> > > > > >=20
> > > > > > This was shot down (rightfully) because it would still be broke=
n.
> > > > > >=20
> > > > > > The second version changed the media bus tc358743 reported:
> > > > > > https://lore.kernel.org/all/20250612-csi-bgr-rgb-v1-0-dc8a30911=
8f8@kernel.org/
> > > > > >=20
> > > > > > Dave was against it because it would potentially break userspac=
e, citing
> > > > > > Linus that we shouldn't break userspace ever. I understand and =
somewhat
> > > > > > agree with his point, but having two drivers reporting the same=
 data
> > > > > > format but with a different meaning is also a way of breaking u=
serspace.
> > > > >=20
> > > > > Yes, I would find that pretty bad, possibly even worse.
> > > > >=20
> > > > > > Anyway. It was then suggested to support both in the tc358743. =
That's
> > > > > > what the second, third and fourth that you commented on worked =
towards.
> > > > > >=20
> > > > > > https://lore.kernel.org/all/20250911-csi-bgr-rgb-v2-0-e6c6b10c1=
040@kernel.org/
> > > > > > https://lore.kernel.org/all/20250917-csi-bgr-rgb-v3-0-0145571b3=
aa4@kernel.org/
> > > > > > https://lore.kernel.org/all/20251013-csi-bgr-rgb-v4-0-55eab2caa=
69f@kernel.org/
> > > > > >=20
> > > > > > In order to implement your suggestion, I wouldn't to modify tc3=
58743,
> > > > > > but would need to modify the association between the v4l2 forma=
t and
> > > > > > media bus code that unicam has. In a way, it's very similar to =
my first
> > > > > > version that got shot down, and suffers from the same flaws: we=
 could
> > > > > > have a userspace application out there hardcoding formats and c=
odes that
> > > > > > will get an error.
> > > > > >=20
> > > > > > So I'm not sure your suggestion really works, unless we reevalu=
ate what
> > > > > > we mean by breaking userspace. Either way, I don't care, I just=
 want to
> > > > > > get pixels in the expected (and documented!) order when using u=
nicam.
> > > > >=20
> > > > > I've lost track of the status of this series and what your current
> > > > > suggestion is. Can we standardize on
> > > > >=20
> > > > > - Using MEDIA_BUS_FMT_RGB*
> > > >=20
> > > > I guess we can do that.
> > > >=20
> > > > > - Produce V4L2_PIX_FMT_BGR24 from MEDIA_BUS_FMT_RGB888_1X24 in un=
icam
> > > >=20
> > > > You called "pretty bad, possibly even worse" to do the exact opposi=
te
> > > > (ie, change the bridge media bus to match unicam) because it would =
break
> > > > userspace. Changing the unicam media bus to match the bridge create=
s the
> > > > exact same situation.
> > > >=20
> > > > The alternative would still be to report both for the bridge, and i=
nvert
> > > > the current assocation for the v4l2 formats and mbus codes.
> > > >=20
> > > > > - Possibly implement backward compatibility somewhere (where ?) t=
o avoid
> > > > >   regressions, but with a big warning
> > > >=20
> > > > What would you improve there exactly? It's very clearly in the patc=
hes
> > > > already, so unless you have some specific comments I'm not really s=
ure
> > > > what you want me to do.
> > >=20
> > > If we standardize on MEDIA_BUS_FMT_RGB*, then the issue is in the uni=
cam
> > > driver, not in the tc358743 driver. Is it possible to implement the
> > > backward compatibility (with a warning) in unicam instead of tc358743=
 ?
> >=20
> > I don't think we can, because the media bus code is exposed on the
> > links, and we would change the media bus code we require on that link.
>=20
> I'm sorry but I don't get you. The tc358743 driver uses
> MEDIA_BUS_FMT_RGB888_1X24. If we standardize on RGB* media bus formats,
> the link between the tc358743 and unicam will keep using
> MEDIA_BUS_FMT_RGB888_1X24. What link would use a different media bus
> code ?

=46rom the summary you asked for:

> Unicam however hardcodes (and validates) that the v4l2 format codes
> matches the media bus code of the other end:
>
> https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/broa=
dcom/bcm2835-unicam.c#L1333
>
> That alone makes total sense, but it has an association between
> V4l2_PIX_FMT_RGB24 and MEDIA_BUS_FMT_RGB888_1X24, and between
> V4L2_PIX_FMT_BGR24 and MEDIA_BUS_FMT_BGR888_1X24
>
> https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/broa=
dcom/bcm2835-unicam.c#L343

If *only* standardize on MEDIA_BUS_FMT_RGB888_1X24 for
V4L2_PIX_FMT_BGR24, then that means breaking the media link code to v4l2
format unicam has enforced for years now, and both are exposed to
userspace.

If that's not what you suggest, then please state what you actually
suggest.

Maxime

--ruzn5zormkky65do
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYMR1wAKCRAnX84Zoj2+
dm1eAYDqBwVWvDo8GiTXxtAr6Wx2LrVSrPfCFpWMfKnXrhXmJ5aC+8nPXlqbCnEf
NG9iMpcBf1seSqrf56HHKMW2PDwnmC3BQUGw0P1BPO/MYr+ZBsIT0BJUQU2cCdMx
KxaodkhXew==
=DUgq
-----END PGP SIGNATURE-----

--ruzn5zormkky65do--

