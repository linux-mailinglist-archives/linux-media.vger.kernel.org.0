Return-Path: <linux-media+bounces-52144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NDFIEqIgmn/VwMAu9opvQ
	(envelope-from <linux-media+bounces-52144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 00:44:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFCFDFCE9
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 00:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC2D3035D66
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 23:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108C7330333;
	Tue,  3 Feb 2026 23:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q6nCetGM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17A9314D08;
	Tue,  3 Feb 2026 23:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770162239; cv=none; b=X1yNQtMZ/Yes2O9bwaGhHvfWQ/gszVgIjzlfxwrMF5kwrV8v5rek78xHbSaMR2AePitaggu9stFZ8STlX3sdIK/xasQfh/TXraUUnAOGzvMB+Wc/k70JkU+yjylaRM8jcvslFI/axV57Gt4hwalstPR9nUaf6puc+0DiX88PbWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770162239; c=relaxed/simple;
	bh=uUkCh7jb9WAAMLcbrvXr12E4i+D/QWQa0txEqMbOBlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6JlIDr1OK4IHsEHjqGbl/UXD3ldmR/zRFCaTvkwt6FaW47RX2udUIX0wdzIhNJlkYDxRIIo7+szKwQkM4MUC3GemVFlzWVFn2moqXlfqyz+lzyXsm61mF7Wcn6tNmFo09wqOuBwFfxnhLUeAu2VcT/53tlYnHTx6zsQTs4zs10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q6nCetGM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 676833A4;
	Wed,  4 Feb 2026 00:43:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770162194;
	bh=uUkCh7jb9WAAMLcbrvXr12E4i+D/QWQa0txEqMbOBlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6nCetGMzRI7RpSUoPMpAuFLJJK6+mSxVU6TTdk/R4Qt+Jv5bY1qTBOQMDf1cCq5t
	 Qh2ySnZb21vdb6y4k8ItPWEi0TgwjTyHKil7QIrcTxEqQlroLVhXvbjy+LMWMaEAM2
	 Zkj+w0ou3zs2eZxLcdSOK4VIdatGdHKH2+qvsiAQ=
Date: Wed, 4 Feb 2026 01:43:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mats Randgaard <matrandg@cisco.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 2/4] media: uapi: Introduce MEDIA_BUS_FMT_BGR565_1X16
Message-ID: <20260203234354.GD133801@killaraus>
References: <20251013-csi-bgr-rgb-v4-2-55eab2caa69f@kernel.org>
 <20251026231553.GB9719@pendragon.ideasonboard.com>
 <20251026233308.GC9719@pendragon.ideasonboard.com>
 <20251208-powerful-penguin-of-reputation-ffdc5c@houat>
 <20260123153432.GA415966@killaraus>
 <20260128-neon-lyrical-pheasant-6cbdf2@houat>
 <20260128131903.GC3210848@killaraus>
 <177001699568.9154.17517527570808307498@freya>
 <20260202093105.GC3374091@killaraus>
 <177002946028.9154.2512834530413257039@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177002946028.9154.2512834530413257039@freya>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52144-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url]
X-Rspamd-Queue-Id: 9FFCFDFCE9
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:21:00PM +0530, Jai Luthra wrote:
> Quoting Laurent Pinchart (2026-02-02 15:01:05)
> > On Mon, Feb 02, 2026 at 12:53:15PM +0530, Jai Luthra wrote:
> > > Quoting Laurent Pinchart (2026-01-28 18:49:03)
> > > > On Wed, Jan 28, 2026 at 01:32:15PM +0100, Maxime Ripard wrote:
> > > > > On Fri, Jan 23, 2026 at 05:34:32PM +0200, Laurent Pinchart wrote:
> > > > > > On Mon, Dec 08, 2025 at 04:32:33PM +0100, Maxime Ripard wrote:
> > > > > > > On Mon, Oct 27, 2025 at 01:33:08AM +0200, Laurent Pinchart wrote:
> > > > > > > > On Mon, Oct 27, 2025 at 01:15:54AM +0200, Laurent Pinchart wrote:
> > > > > > > > > On Mon, Oct 13, 2025 at 01:01:34PM +0200, Maxime Ripard wrote:
> > > > > > > > > > MIPI-CSI2 sends its RGB format on the wire with the blue component
> > > > > > > > > > first, then green, then red. MIPI calls that format "RGB", but by v4l2
> > > > > > > > > > conventions it would be BGR.
> > > > > > > > > > 
> > > > > > > > > > MIPI-CSI2 supports three RGB variants: 444, 555, 565, 666 and 888.
> > > > > > > > > > 
> > > > > > > > > > We already have BGR666 and BGR888 media bus formats, we don't have any
> > > > > > > > > > CSI transceivers using the 444 and 555 variants, but some transceivers
> > > > > > > > > > use the CSI RGB565 format, while using the RGB565 media bus code.
> > > > > > > > > > 
> > > > > > > > > > That's a mistake, but since we don't have a BGR565 media bus code we
> > > > > > > > > > need to introduce one before fixing it.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > > > > ---
> > > > > > > > > >  .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++++++++++++
> > > > > > > > > >  include/uapi/linux/media-bus-format.h              |  3 +-
> > > > > > > > > >  2 files changed, 39 insertions(+), 1 deletion(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > > > > > > index 8e92f784abd8123f9ea950f954a60af56ee76dbe..def0d24ef6cdb1a2ec9395af1468f56adf31a8de 100644
> > > > > > > > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > > > > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > > > > > > > @@ -625,10 +625,47 @@ The following tables list existing packed RGB formats.
> > > > > > > > > >        - b\ :sub:`4`
> > > > > > > > > >        - b\ :sub:`3`
> > > > > > > > > >        - b\ :sub:`2`
> > > > > > > > > >        - b\ :sub:`1`
> > > > > > > > > >        - b\ :sub:`0`
> > > > > > > > > > +    * .. _MEDIA-BUS-FMT-BGR565-1X16:
> > > > > > > > > > +
> > > > > > > > > > +      - MEDIA_BUS_FMT_BGR565_1X16
> > > > > > > > > > +      - 0x1028
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      -
> > > > > > > > > > +      - b\ :sub:`4`
> > > > > > > > > > +      - b\ :sub:`3`
> > > > > > > > > > +      - b\ :sub:`2`
> > > > > > > > > > +      - b\ :sub:`1`
> > > > > > > > > > +      - b\ :sub:`0`
> > > > > > > > > > +      - g\ :sub:`5`
> > > > > > > > > > +      - g\ :sub:`4`
> > > > > > > > > > +      - g\ :sub:`3`
> > > > > > > > > > +      - g\ :sub:`2`
> > > > > > > > > > +      - g\ :sub:`1`
> > > > > > > > > > +      - g\ :sub:`0`
> > > > > > > > > > +      - r\ :sub:`4`
> > > > > > > > > > +      - r\ :sub:`3`
> > > > > > > > > > +      - r\ :sub:`2`
> > > > > > > > > > +      - r\ :sub:`1`
> > > > > > > > > > +      - r\ :sub:`0`
> > > > > > > > > 
> > > > > > > > > We're definitely in convention territory, because this is not how 16-bit
> > > > > > > > > RGB data is transmitted over CSI-2. CSI-2 transmits blue first, but
> > > > > > > > > starts with bit 0, not bit 4.
> > > > > > > > > 
> > > > > > > > > Have you explored the alternative of picking the parallel bus code that
> > > > > > > > > matches the serial order when transmitted with the least significant bit
> > > > > > > > > first ? That would be MEDIA_BUS_FMT_RGB565_1X16 here, and
> > > > > > > > > MEDIA_BUS_FMT_RGB888_1X24 for 24-bit RGB.
> > > > > > > > 
> > > > > > > > To be clear, media bus codes are a matter of conventions. Some
> > > > > > > > conventions would be easier to explain that others, and can also be more
> > > > > > > > consistent with pixel format namings, but at the end of the day they're
> > > > > > > > all conventions. While saying "pick the media bus code that transmits a
> > > > > > > > pixel in one clock sample, with the bit order matching LSB-first
> > > > > > > > transmission" could be the simplest to document, there will be a
> > > > > > > > mismatch in component orders between the media bus code and the pixel
> > > > > > > > format in some cases. There may also be more drivers implementing other
> > > > > > > > conventions, making the transition more difficult.
> > > > > > > > 
> > > > > > > > I'll be very busy the upcoming week and will likely not be able to
> > > > > > > > participate in this discussion in the near future.
> > > > > > > 
> > > > > > > For the record, we've discussed it on IRC recently.
> > > > > > > 
> > > > > > > The suggestion to have all CSI Data Formats as MEDIA_BUS_FMT_RGB*_1X*
> > > > > > > variants make sense to me. And we can easily document it, because we
> > > > > > > could match the first bit transmitted with the least significant bit
> > > > > > > of a media bus code indeed.
> > > > > > 
> > > > > > That's one of the things I like about it, it's consistent and easy to
> > > > > > document. Glad we agree :-)
> > > > > > 
> > > > > > > Thus a sensor using RGB888 would register MEDIA_BUS_FMT_RGB888_1X24.
> > > > > > > That's indeed the case right now with tc358743:
> > > > > > > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/i2c/tc358743.c#L1775
> > > > > > > 
> > > > > > > Unicam however hardcodes (and validates) that the v4l2 format codes
> > > > > > > matches the media bus code of the other end:
> > > > > > > 
> > > > > > > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/broadcom/bcm2835-unicam.c#L1333
> > > > > > > 
> > > > > > > That alone makes total sense, but it has an association between
> > > > > > > V4l2_PIX_FMT_RGB24 and MEDIA_BUS_FMT_RGB888_1X24, and between
> > > > > > > V4L2_PIX_FMT_BGR24 and MEDIA_BUS_FMT_BGR888_1X24
> > > > > > > 
> > > > > > > https://elixir.bootlin.com/linux/v6.18/source/drivers/media/platform/broadcom/bcm2835-unicam.c#L343
> > > > > > > 
> > > > > > > Using the convention you suggested, this association is wrong, and
> > > > > > > V4L2_PIX_FMT_BGR24 should be associated MEDIA_BUS_FMT_RGB888_1X24. Thus,
> > > > > > > the red and blue color components are mixed up.
> > > > > > 
> > > > > > Correct.
> > > > > > 
> > > > > > > I initially tried to fix it in my v1 by removing the RGB24 support
> > > > > > > https://lore.kernel.org/all/20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org/
> > > > > > > 
> > > > > > > This was shot down (rightfully) because it would still be broken.
> > > > > > > 
> > > > > > > The second version changed the media bus tc358743 reported:
> > > > > > > https://lore.kernel.org/all/20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org/
> > > > > > > 
> > > > > > > Dave was against it because it would potentially break userspace, citing
> > > > > > > Linus that we shouldn't break userspace ever. I understand and somewhat
> > > > > > > agree with his point, but having two drivers reporting the same data
> > > > > > > format but with a different meaning is also a way of breaking userspace.
> > > > > > 
> > > > > > Yes, I would find that pretty bad, possibly even worse.
> > > > > > 
> > > > > > > Anyway. It was then suggested to support both in the tc358743. That's
> > > > > > > what the second, third and fourth that you commented on worked towards.
> > > > > > > 
> > > > > > > https://lore.kernel.org/all/20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org/
> > > > > > > https://lore.kernel.org/all/20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org/
> > > > > > > https://lore.kernel.org/all/20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org/
> > > > > > > 
> > > > > > > In order to implement your suggestion, I wouldn't to modify tc358743,
> > > > > > > but would need to modify the association between the v4l2 format and
> > > > > > > media bus code that unicam has. In a way, it's very similar to my first
> > > > > > > version that got shot down, and suffers from the same flaws: we could
> > > > > > > have a userspace application out there hardcoding formats and codes that
> > > > > > > will get an error.
> > > > > > > 
> > > > > > > So I'm not sure your suggestion really works, unless we reevaluate what
> > > > > > > we mean by breaking userspace. Either way, I don't care, I just want to
> > > > > > > get pixels in the expected (and documented!) order when using unicam.
> > > > > > 
> > > > > > I've lost track of the status of this series and what your current
> > > > > > suggestion is. Can we standardize on
> > > > > > 
> > > > > > - Using MEDIA_BUS_FMT_RGB*
> > > > > 
> > > > > I guess we can do that.
> > > > > 
> > > > > > - Produce V4L2_PIX_FMT_BGR24 from MEDIA_BUS_FMT_RGB888_1X24 in unicam
> > > > > 
> > > > > You called "pretty bad, possibly even worse" to do the exact opposite
> > > > > (ie, change the bridge media bus to match unicam) because it would break
> > > > > userspace. Changing the unicam media bus to match the bridge creates the
> > > > > exact same situation.
> > > > > 
> > > > > The alternative would still be to report both for the bridge, and invert
> > > > > the current assocation for the v4l2 formats and mbus codes.
> > > > > 
> > > > > > - Possibly implement backward compatibility somewhere (where ?) to avoid
> > > > > >   regressions, but with a big warning
> > > > > 
> > > > > What would you improve there exactly? It's very clearly in the patches
> > > > > already, so unless you have some specific comments I'm not really sure
> > > > > what you want me to do.
> > > > 
> > > > If we standardize on MEDIA_BUS_FMT_RGB*, then the issue is in the unicam
> > > > driver, not in the tc358743 driver. Is it possible to implement the
> > > > backward compatibility (with a warning) in unicam instead of tc358743 ?
> > > 
> > > Not just unicam. TI's CSI driver (j721e-csi2rx.c) also uses:
> > > 
> > > V4L2_PIX_FMT_XBGR32 for MEDIA_BUS_FMT_RGB888_1X24 (and vice versa)
> > 
> > That is not necessarily wrong. The mapping between media bus codes and
> > pixel formats is device-dependent. Does the upstream j721e-csi2rx driver
> > map MEDIA_BUS_FMT_RGB888_1X24 to V4L2_PIX_FMT_XBGR32 but actually writes
> > a different pixel format to memory ?
> 
> From the TRM, MIPI RGB888 unpacks to:
> BYTE0		BYTE1		BYTE2		BYTE3		
> BBBBBBBB	GGGGGGGG	RRRRRRRR	00000000	
> 
> Which is V4L2_PIX_FMT_XBGR32 I believe.

Correct, it's V4L2_PIX_FMT_XBGR32. Where's the problem ? The mapping
between a media bus code and a pixel format is device-dependent,
j721e-csi2rx and unicam don't have to use the same mapping.

> > > (my 2 cents) It's better to have backward compatibility in drivers that
> > > currently don't follow the Media documentation. I agree the docs are
> > > confusing, they tripped me up too, but there are already userspace
> > > scripts/applications that TI / beagle users use that follow those confusing
> > > docs :)

-- 
Regards,

Laurent Pinchart

