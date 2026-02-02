Return-Path: <linux-media+bounces-52001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKfPD+mCgGnE8wIAu9opvQ
	(envelope-from <linux-media+bounces-52001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:56:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F496CB4C8
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA2B93055836
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8A035B64B;
	Mon,  2 Feb 2026 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nMye4gMC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8598827E054;
	Mon,  2 Feb 2026 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029469; cv=none; b=XEJLjqQdQ+MbeJ24KX4sHYTFLKv0MaQBl+1GVmysyZwhsWRaNp35x9WxYMciC3OfL1Od3E9hDFRZJ2Bod+Jo8zHLIPYPjsXtOH2qwo5kWjtGU3khsccUivp4LqSUjvRvAWZmSAtGtFq++0SBIc/3x06F/PlK/46GvDaOenMCi6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029469; c=relaxed/simple;
	bh=/wW/wSw64N69tmH1Eeb8H8Uzc/hjkVoXJfLMaiwWBRA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NvIRdRZ02PijFtXgU+uHlcqfoTv84J5N+CXjf2/z60ABVpYnwIBh2LwIJHh12MwUwsynJ6MYrkCtCkqYlVqI9+DMMogWYrHCxKomToi62y8QHqjMm4kpqPbBySFx9gkCQ8mabU0nvOfqQRCxlxUKS+S7R6I4N8/0JOlu21SKjNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nMye4gMC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:86fa:bf02:d5f1:808c:8622])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9899E66B;
	Mon,  2 Feb 2026 11:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770029425;
	bh=/wW/wSw64N69tmH1Eeb8H8Uzc/hjkVoXJfLMaiwWBRA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nMye4gMCsdlC2hHYanNfzKHYN+lKmQwDnXEGnT19CczEnnnjla08V8IEaGgwYT7U6
	 dbKxZgKlejIBjNFr6gMUIlVzZPpLAstN7Jik4LjGMx/u1bIBP3soeE8W6qep4hH0lm
	 VCPjPWAuK1yzRfFDm1RqbWGobJSlKzBWiCAlSzTk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260202093105.GC3374091@killaraus>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org> <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org> <20251026231553.GB9719@pendragon.ideasonboard.com> <20251026233308.GC9719@pendragon.ideasonboard.com> <20251208-powerful-penguin-of-reputation-ffdc5c@houat> <20260123153432.GA415966@killaraus> <20260128-neon-lyrical-pheasant-6cbdf2@houat> <20260128131903.GC3210848@killaraus> <177001699568.9154.17517527570808307498@freya> <20260202093105.GC3374091@killaraus>
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mats Randgaard <matrandg@cisco.com>, Alain Volmat <alain.volmat@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Mon, 02 Feb 2026 16:21:00 +0530
Message-ID: <177002946028.9154.2512834530413257039@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52001-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8F496CB4C8
X-Rspamd-Action: no action

Quoting Laurent Pinchart (2026-02-02 15:01:05)
> On Mon, Feb 02, 2026 at 12:53:15PM +0530, Jai Luthra wrote:
> > Hi Laurent, Maxime,
> >=20
> > Quoting Laurent Pinchart (2026-01-28 18:49:03)
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
> > Not just unicam. TI's CSI driver (j721e-csi2rx.c) also uses:
> >=20
> > V4L2_PIX_FMT_XBGR32 for MEDIA_BUS_FMT_RGB888_1X24 (and vice versa)
>=20
> That is not necessarily wrong. The mapping between media bus codes and
> pixel formats is device-dependent. Does the upstream j721e-csi2rx driver
> map MEDIA_BUS_FMT_RGB888_1X24 to V4L2_PIX_FMT_XBGR32 but actually writes
> a different pixel format to memory ?

From the TRM, MIPI RGB888 unpacks to:
BYTE0		BYTE1		BYTE2		BYTE3	=09
BBBBBBBB	GGGGGGGG	RRRRRRRR	00000000=09

Which is V4L2_PIX_FMT_XBGR32 I believe.

>=20
> > (my 2 cents) It's better to have backward compatibility in drivers that
> > currently don't follow the Media documentation. I agree the docs are
> > confusing, they tripped me up too, but there are already userspace
> > scripts/applications that TI / beagle users use that follow those confu=
sing
> > docs :)
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Thanks,
    Jai

