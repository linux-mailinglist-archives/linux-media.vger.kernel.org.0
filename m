Return-Path: <linux-media+bounces-53317-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCDEDBivnmlxWwQAu9opvQ
	(envelope-from <linux-media+bounces-53317-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 09:13:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A189193F49
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 09:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3CC93068F07
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843C12FFF9D;
	Wed, 25 Feb 2026 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cU5k4cAl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512263101B1;
	Wed, 25 Feb 2026 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772007162; cv=none; b=jPtr11jLcNPJdXGn8SFEbzSlxRQRGbzXgD7A911ItkHsqBAAQXVwzYxCR2LBTOPMjx8eMaqygC5oJTaxqT5hMoPKrQidE3IM31w4T+e00UVT+uSAi/BHxpNfTQKW0nhewFv8Mfc8xbeIM47lW+9QG8Amrl0n7jdtdUnffGuSab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772007162; c=relaxed/simple;
	bh=XrPRETrIz/BRr0AU5M3BOBTEvVFG+Kg0pt2ply1ceKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+8VBWBbUfYJr/thqG3exbkpq7bmJCgqpOQ8772A9TZfEALZfmULPJNq4sKSmLNUP0TL/rrXDJmzoYrxklohKVS+I7SPoi5RyudJVZ99egQCYa0uwYj9FgIzF3Qq60gPocqBK8JzWFSkcjBm07ZUuSEbWWiw27CY8fDtzHWx0HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cU5k4cAl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5B0DE47;
	Wed, 25 Feb 2026 09:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772007100;
	bh=XrPRETrIz/BRr0AU5M3BOBTEvVFG+Kg0pt2ply1ceKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cU5k4cAldkQb4cuKW1vp4GYyFLa5PKjRg7tBjFQC7W0jfXzh4KuMyqOcNnpozO4un
	 qF5za+04UjfGqXoolYx8NdJuPJHA7ZOQJ6UVN883Oa3TdoFCjuoK/fmfsvN5Pd02RD
	 TOMk8tOJFUmwdAJ/3SZs6KWWDDFnsZ5rvIzp19Qk=
Date: Wed, 25 Feb 2026 09:12:35 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH] media: Documentation: Fix frame interval calculation for
 raw camera sensors
Message-ID: <aZ6ubqtUwCuVPQtt@zed>
References: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com>
 <aZwQJZX6sjzLgVL4@zed>
 <177191073323.14753.12002575507884033868@freya>
 <aZ3qotzgQQeyhnbg@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZ3qotzgQQeyhnbg@zed>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53317-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 8A189193F49
X-Rspamd-Action: no action

Sorry, one correction

On Tue, Feb 24, 2026 at 07:22:24PM +0100, Jacopo Mondi wrote:
> Hi Jai
>
> On Tue, Feb 24, 2026 at 10:55:33AM +0530, Jai Luthra wrote:
> > Hi Jacopo,
> >
> > Thanks for the review.
> >
> > Quoting Jacopo Mondi (2026-02-23 14:41:02)
> > > Hi Jai
> > >
> > > On Thu, Feb 19, 2026 at 01:20:50PM +0530, Jai Luthra wrote:
> > > > The previous frame interval formula used analogue crop dimensions. This
> > > > breaks down for some sensors when binning.
> > > >
> > > > For example in imx219 the minimum FLL (frame length in lines) can be
> > > > lower than the analogue crop height when binning, which would require a
> > > > negative VBLANK to represent the actual timing. Similarly, imx283 allows
> > > > a lower minimum HMAX (line length) when doing 2x2 or 3x3 binning than
> > > > the analogue crop width of the full resolution mode.
> > > >
> > > > The CCS specification also describes under section "8.2.6 Line Length
> > > > and Frame Length" how the horizontal and vertical readout minimums can
> > > > be different when binning.
> > > >
> > > > Replace the formula with the underlying hardware concepts of LLP (line
> > > > length in pixels) and FLL (frame length in lines). These terms were
> > > > chosen to match the CCS specification on raw sensors, as it is a cleaner
> > > > reference compared to a typical sensor vendor datasheet.
> > > >
> > > > Finally, define the blanking controls relative to the active pixel
> > > > readout (post-binning) rather than the analogue crop size. This matches
> > > > what most sensor drivers already do, and also what applications like
> > > > libcamera expect. In "Figure 42" of CCS specification too, we see a
> > > > similar definition:
> > > >
> > > >   frame interval = (output width + HBLANK) *
> > > >                    (output height + VBLANK) / pixel rate
> > > >
> > > > Also add a note in the "Writing camera sensor drivers" guide, to ensure
> > > > this formula is followed by new sensor drivers.
> > >
> > > I agree that using the analogue crop rectangle sizes is not correct,
> > > however, with this new formulation the LLP and FLL values might be
> > > smaller than the crop rectangles reported through the selection API,
> > > which I'm not sure it's great from a consistency point of view ?
> >
> > While it takes a while to grok, but most sensors I looked at operate in
> > this way (of reducing the line length or the frame length) when binning,
> > including CCS (implicitly). A counterexample would really help here.
> >
> > >
> > > Also the below suggested formulation:
> > >
> > >         LLP = active width + V4L2_CID_HBLANK
> > >         FLL = active height + V4L2_CID_VBLANK
> > >
> > > Assumes the combined effect of [binning + subsampling] always directly
> > > affect the readout time of pixels on the pixel array. The CCS specs
> > > and driver seems to suggest that's not always the case ?
> >
> > Why do you think this model can't work for sensors where the readout time is
> > unaffected?
> >
> > Let's say a sensor's pixel array is 1920x1080 with minimum LLP=2000, FLL=1200.
> >
> > so, HBLANK minimum = 80, VBLANK minimum = 120
> >
> > It also supports a 2x2 binned mode of 960x540 with the same minimum LLP and FLL
> > (that is same max framerate, no speed up or change in readout).
> >
> > so, HBLANK minimum = 2000 - 960 = 1040, VBLANK minimum = 1200 - 540 = 660
> >
> > If you match this with the CCS Figure 42 it still makes sense.
> >
>
> Ah well, sure if LLP and FFL remain constant, the usage of the
> "active sizes" doesn't matter.
>
> This means that the min hblank and min vblank have to be doubled to
> compensate for the halved the active sizes.

This is of course not correct. blankings doesn't have to be doubled,
but just enalrged enough to maintain LLP/FFL constant.

Sorry for the oversight.

>
> Speaking in CCS terms, this means the limits reported in Table 86 are
> always populated.
>
> And what I'm struggling with at the moment, is the assumptions that's
> always be the case for all sensors. Unfortunately I don't have enough
> experience across all vendors to tell if that's the case..
>
>
> > >
> > > Do we need to distinguish between binning modes that affect the
> > > timings and binning modes that do not do that?
> > >
> > > As we're going to introduce a control for binning to report the
> > > binning factor in the image dimension domain, should we introduce
> > > a control to specify the binning factor in the image timing domain ?
> > >
> > >         LLP = (analog_crop_width + HBLANK) / binning_timing_h
> > >         FLL = (analog_crop_height + VBLANK) / binning_timing_v
> > >         frame_interval = LLP * FLL / pixel_rate
> > >
> > > I'm not 100% sure this is correct however, as the blankings should be
> > > expressed on a different clock domain that the pixel sampling rate,
> > > but I guess this is a reasonable approximation ?
> >
> > What does these two extra controls really offer us?
> >
> > All sensors we have seen thus far map their LLP/FLL (or equivalent HTOT/VTOT)
> > values with respect to the digital readout, and not the analogue pixel array.
> >
> > If we add these two controls, we will have to support two different models for
> > frame interval calculation in the application layer too. Which I'm fine with if
> > it has a practical benefit, that is, it makes it easier to deal with some
> > particular sensor.
>
> Not sure why you would need two modes to calculate timings in
> userspace.
>
> >
> > And if exposing the LLP/FLL directly offer the same benefit, then that is
> > cleaner, as it leaves the HBLANK/VBLANK as-is in the new model.
> >
>
> As per above, if the consensus is that having the limits updated when
> binning to maintaine the LLP/FFL values will work for all sensors,
> then I'm fine with that.
>
> > Thanks,
> > Jai
> >
> > [...]

