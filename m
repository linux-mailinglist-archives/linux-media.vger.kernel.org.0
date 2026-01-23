Return-Path: <linux-media+bounces-51431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F3MGhSVc2ktxQAAu9opvQ
	(envelope-from <linux-media+bounces-51431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:34:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97177D52
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 16:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F10F3004CAB
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 15:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B56F27A123;
	Fri, 23 Jan 2026 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Cd9XzLtb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D06229B1F;
	Fri, 23 Jan 2026 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182476; cv=none; b=S49rGCl/WzWu50U/MCYHVgdr8g38zAx1Fw8zJfEMgHCop/bwk3PdgSmb7xnjsFHMPp8peEGCjT58okrAjARR4nmsgyoo7T6s1e5TzV5VhFIrI8iUZYIsL3FPHl0fosTLtL1Ld9wdAoANGe/qIJ5dFTECOYXYR/Nxj460pEMwXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182476; c=relaxed/simple;
	bh=vKkbQaaNJ11jCYbS5Am8GkNG828A1xIItV02UPgH7aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=az98vrBrVWkmvSz7ZmlbU30MMV9Bov6qARQZ/uwPDaQe5ix/EUR8BRxiEBlSMApDqdaoKh08DFepuWaIg/w8AnXD9L07w4kW8dvqUpHhTrfnkQhUSMMJcFoyh+Ii4LXxzvJmhexs1L3F2ozo+s/bno8Jwkgzvb3+EG8w1btl0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Cd9XzLtb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3F1659CE;
	Fri, 23 Jan 2026 16:34:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769182440;
	bh=vKkbQaaNJ11jCYbS5Am8GkNG828A1xIItV02UPgH7aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cd9XzLtbbevSkWr2LhUqvw6r8JL+9OK5GqLT863oywWIcW6qCSaciTpKiDE6Y3cZ2
	 +6MIDArRvnBNeZlu2/xH8XUzRil7JV1M27ncXZuG16rAIf0JgBZDRsg7lAwVmUVVpW
	 L5F0tL1RwdzrOeFOg2nhoG7ScR2xnnbjpjtZ4Z+M=
Date: Fri, 23 Jan 2026 17:34:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mats Randgaard <matrandg@cisco.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Message-ID: <20260123153432.GA415966@killaraus>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
 <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org>
 <20251026231553.GB9719@pendragon.ideasonboard.com>
 <20251026233308.GC9719@pendragon.ideasonboard.com>
 <20251208-powerful-penguin-of-reputation-ffdc5c@houat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251208-powerful-penguin-of-reputation-ffdc5c@houat>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51431-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 3D97177D52
X-Rspamd-Action: no action

On Mon, Dec 08, 2025 at 04:32:33PM +0100, Maxime Ripard wrote:
> On Mon, Oct 27, 2025 at 01:33:08AM +0200, Laurent Pinchart wrote:
> > On Mon, Oct 27, 2025 at 01:15:54AM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 13, 2025 at 01:01:34PM +0200, Maxime Ripard wrote:
> > > > MIPI-CSI2 sends its RGB format on the wire with the blue component
> > > > first, then green, then red. MIPI calls that format "RGB", but by v4l2
> > > > conventions it would be BGR.
> > > > 
> > > > MIPI-CSI2 supports three RGB variants: 444, 555, 565, 666 and 888.
> > > > 
> > > > We already have BGR666 and BGR888 media bus formats, we don't have any
> > > > CSI transceivers using the 444 and 555 variants, but some transceivers
> > > > use the CSI RGB565 format, while using the RGB565 media bus code.
> > > > 
> > > > That's a mistake, but since we don't have a BGR565 media bus code we
> > > > need to introduce one before fixing it.
> > > > 
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++++++++++++
> > > >  include/uapi/linux/media-bus-format.h              |  3 +-
> > > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > index 8e92f784abd8123f9ea950f954a60af56ee76dbe..def0d24ef6cdb1a2ec9395af1468f56adf31a8de 100644
> > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > @@ -625,10 +625,47 @@ The following tables list existing packed RGB formats.
> > > >        - b\ :sub:`4`
> > > >        - b\ :sub:`3`
> > > >        - b\ :sub:`2`
> > > >        - b\ :sub:`1`
> > > >        - b\ :sub:`0`
> > > > +    * .. _MEDIA-BUS-FMT-BGR565-1X16:
> > > > +
> > > > +      - MEDIA_BUS_FMT_BGR565_1X16
> > > > +      - 0x1028
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      -
> > > > +      - b\ :sub:`4`
> > > > +      - b\ :sub:`3`
> > > > +      - b\ :sub:`2`
> > > > +      - b\ :sub:`1`
> > > > +      - b\ :sub:`0`
> > > > +      - g\ :sub:`5`
> > > > +      - g\ :sub:`4`
> > > > +      - g\ :sub:`3`
> > > > +      - g\ :sub:`2`
> > > > +      - g\ :sub:`1`
> > > > +      - g\ :sub:`0`
> > > > +      - r\ :sub:`4`
> > > > +      - r\ :sub:`3`
> > > > +      - r\ :sub:`2`
> > > > +      - r\ :sub:`1`
> > > > +      - r\ :sub:`0`
> > > 
> > > We're definitely in convention territory, because this is not how 16-bit
> > > RGB data is transmitted over CSI-2. CSI-2 transmits blue first, but
> > > starts with bit 0, not bit 4.
> > > 
> > > Have you explored the alternative of picking the parallel bus code that
> > > matches the serial order when transmitted with the least significant bit
> > > first ? That would be MEDIA_BUS_FMT_RGB565_1X16 here, and
> > > MEDIA_BUS_FMT_RGB888_1X24 for 24-bit RGB.
> > 
> > To be clear, media bus codes are a matter of conventions. Some
> > conventions would be easier to explain that others, and can also be more
> > consistent with pixel format namings, but at the end of the day they're
> > all conventions. While saying "pick the media bus code that transmits a
> > pixel in one clock sample, with the bit order matching LSB-first
> > transmission" could be the simplest to document, there will be a
> > mismatch in component orders between the media bus code and the pixel
> > format in some cases. There may also be more drivers implementing other
> > conventions, making the transition more difficult.
> > 
> > I'll be very busy the upcoming week and will likely not be able to
> > participate in this discussion in the near future.
> 
> For the record, we've discussed it on IRC recently.
> 
> The suggestion to have all CSI Data Formats as MEDIA_BUS_FMT_RGB*_1X*
> variants make sense to me. And we can easily document it, because we
> could match the first bit transmitted with the least significant bit
> of a media bus code indeed.

That's one of the things I like about it, it's consistent and easy to
document. Glad we agree :-)

> Thus a sensor using RGB888 would register MEDIA_BUS_FMT_RGB888_1X24.
> That's indeed the case right now with tc358743:
> https://elixir.bootlin.com/linux/v6.18/source/drivers/media/i2c/tc358743.c#L1775
> 
> Unicam however hardcodes (and validates) that the v4l2 format codes
> matches the media bus code of the other end:
> 
> https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/broadcom/bcm2835-unicam.c#L1333
> 
> That alone makes total sense, but it has an association between
> V4l2_PIX_FMT_RGB24 and MEDIA_BUS_FMT_RGB888_1X24, and between
> V4L2_PIX_FMT_BGR24 and MEDIA_BUS_FMT_BGR888_1X24
> 
> https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/broadcom/bcm2835-unicam.c#L343
> 
> Using the convention you suggested, this association is wrong, and
> V4L2_PIX_FMT_BGR24 should be associated MEDIA_BUS_FMT_RGB888_1X24. Thus,
> the red and blue color components are mixed up.

Correct.

> I initially tried to fix it in my v1 by removing the RGB24 support
> https://lore.kernel.org/all/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org/
> 
> This was shot down (rightfully) because it would still be broken.
> 
> The second version changed the media bus tc358743 reported:
> https://lore.kernel.org/all/20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org/
> 
> Dave was against it because it would potentially break userspace, citing
> Linus that we shouldn't break userspace ever. I understand and somewhat
> agree with his point, but having two drivers reporting the same data
> format but with a different meaning is also a way of breaking userspace.

Yes, I would find that pretty bad, possibly even worse.

> Anyway. It was then suggested to support both in the tc358743. That's
> what the second, third and fourth that you commented on worked towards.
> 
> https://lore.kernel.org/all/20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org/
> https://lore.kernel.org/all/20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org/
> https://lore.kernel.org/all/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org/
> 
> In order to implement your suggestion, I wouldn't to modify tc358743,
> but would need to modify the association between the v4l2 format and
> media bus code that unicam has. In a way, it's very similar to my first
> version that got shot down, and suffers from the same flaws: we could
> have a userspace application out there hardcoding formats and codes that
> will get an error.
> 
> So I'm not sure your suggestion really works, unless we reevaluate what
> we mean by breaking userspace. Either way, I don't care, I just want to
> get pixels in the expected (and documented!) order when using unicam.

I've lost track of the status of this series and what your current
suggestion is. Can we standardize on

- Using MEDIA_BUS_FMT_RGB*
- Produce V4L2_PIX_FMT_BGR24 from MEDIA_BUS_FMT_RGB888_1X24 in unicam
- Possibly implement backward compatibility somewhere (where ?) to avoid
  regressions, but with a big warning

-- 
Regards,

Laurent Pinchart

