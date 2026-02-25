Return-Path: <linux-media+bounces-53322-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGvnFrq6nmnwWwQAu9opvQ
	(envelope-from <linux-media+bounces-53322-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 10:02:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C673119492A
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 10:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E829131329A0
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB094330676;
	Wed, 25 Feb 2026 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GZT1Gfo3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A15E328251;
	Wed, 25 Feb 2026 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009897; cv=none; b=hQr/qP57GsZGpnCaoqOmqC/OfDdDG9o3hmQal/UU3Mi/3dflgAq+F84CchAy7NcQehE72NwWJeDmhZYmQRSr3KZjxsd0xeXqeARkl1JpmklFW6XQlxBS2Wx0juZ8sdId1pu3to8ByHOCO731LNZCgesUYChdt72BquJO0emP9LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009897; c=relaxed/simple;
	bh=oo4HfQ416nZtW3BkrF2ilCcyNVnfvTiOl4cDGFxBo1Y=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kPMbFM0cxWJ5sT70555qj23++FC67Cggg2n/CPslpZlHwlZc13zqPq95V75lNDfRreX0ySkR9hKVtPYK8pvraBbN/s8wWGRStgDDAkkl+PdH7gDn1JCXmGbu9TwinsIghVlC34bJOKWnQybmGiPbGcx8QiNxIVdnqnXVAqAIOX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GZT1Gfo3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A122E47;
	Wed, 25 Feb 2026 09:57:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772009837;
	bh=oo4HfQ416nZtW3BkrF2ilCcyNVnfvTiOl4cDGFxBo1Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GZT1Gfo3d2CUb7C8DE8Q86qDexnZdZCI0dhacU8S11ZFYl/mnGVaa+0O6rVuLM/2Z
	 hCzlmyPZtHBy1xEk4oWblV8dcMJXpWnenZkbiUvHeLGxt/yrCHn97+wylFktHdiGJh
	 RfnkWWB+EEeMz6IEGRGgeW3uzlxcyXtXZfQ4uhBc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aZ6ubqtUwCuVPQtt@zed>
References: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com> <aZwQJZX6sjzLgVL4@zed> <177191073323.14753.12002575507884033868@freya> <aZ3qotzgQQeyhnbg@zed> <aZ6ubqtUwCuVPQtt@zed>
Subject: Re: [PATCH] media: Documentation: Fix frame interval calculation for raw camera sensors
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 25 Feb 2026 14:28:08 +0530
Message-ID: <177200988883.14753.3704595112630172819@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53322-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C673119492A
X-Rspamd-Action: no action

Quoting Jacopo Mondi (2026-02-25 13:42:35)
> Sorry, one correction
>=20
> On Tue, Feb 24, 2026 at 07:22:24PM +0100, Jacopo Mondi wrote:
> > Hi Jai
> >
> > On Tue, Feb 24, 2026 at 10:55:33AM +0530, Jai Luthra wrote:
> > > Hi Jacopo,
> > >
> > > Thanks for the review.
> > >
> > > Quoting Jacopo Mondi (2026-02-23 14:41:02)
> > > > Hi Jai
> > > >
> > > > On Thu, Feb 19, 2026 at 01:20:50PM +0530, Jai Luthra wrote:
> > > > > The previous frame interval formula used analogue crop dimensions=
. This
> > > > > breaks down for some sensors when binning.
> > > > >
> > > > > For example in imx219 the minimum FLL (frame length in lines) can=
 be
> > > > > lower than the analogue crop height when binning, which would req=
uire a
> > > > > negative VBLANK to represent the actual timing. Similarly, imx283=
 allows
> > > > > a lower minimum HMAX (line length) when doing 2x2 or 3x3 binning =
than
> > > > > the analogue crop width of the full resolution mode.
> > > > >
> > > > > The CCS specification also describes under section "8.2.6 Line Le=
ngth
> > > > > and Frame Length" how the horizontal and vertical readout minimum=
s can
> > > > > be different when binning.
> > > > >
> > > > > Replace the formula with the underlying hardware concepts of LLP =
(line
> > > > > length in pixels) and FLL (frame length in lines). These terms we=
re
> > > > > chosen to match the CCS specification on raw sensors, as it is a =
cleaner
> > > > > reference compared to a typical sensor vendor datasheet.
> > > > >
> > > > > Finally, define the blanking controls relative to the active pixel
> > > > > readout (post-binning) rather than the analogue crop size. This m=
atches
> > > > > what most sensor drivers already do, and also what applications l=
ike
> > > > > libcamera expect. In "Figure 42" of CCS specification too, we see=
 a
> > > > > similar definition:
> > > > >
> > > > >   frame interval =3D (output width + HBLANK) *
> > > > >                    (output height + VBLANK) / pixel rate
> > > > >
> > > > > Also add a note in the "Writing camera sensor drivers" guide, to =
ensure
> > > > > this formula is followed by new sensor drivers.
> > > >
> > > > I agree that using the analogue crop rectangle sizes is not correct,
> > > > however, with this new formulation the LLP and FLL values might be
> > > > smaller than the crop rectangles reported through the selection API,
> > > > which I'm not sure it's great from a consistency point of view ?
> > >
> > > While it takes a while to grok, but most sensors I looked at operate =
in
> > > this way (of reducing the line length or the frame length) when binni=
ng,
> > > including CCS (implicitly). A counterexample would really help here.
> > >
> > > >
> > > > Also the below suggested formulation:
> > > >
> > > >         LLP =3D active width + V4L2_CID_HBLANK
> > > >         FLL =3D active height + V4L2_CID_VBLANK
> > > >
> > > > Assumes the combined effect of [binning + subsampling] always direc=
tly
> > > > affect the readout time of pixels on the pixel array. The CCS specs
> > > > and driver seems to suggest that's not always the case ?
> > >
> > > Why do you think this model can't work for sensors where the readout =
time is
> > > unaffected?
> > >
> > > Let's say a sensor's pixel array is 1920x1080 with minimum LLP=3D2000=
, FLL=3D1200.
> > >
> > > so, HBLANK minimum =3D 80, VBLANK minimum =3D 120
> > >
> > > It also supports a 2x2 binned mode of 960x540 with the same minimum L=
LP and FLL
> > > (that is same max framerate, no speed up or change in readout).
> > >
> > > so, HBLANK minimum =3D 2000 - 960 =3D 1040, VBLANK minimum =3D 1200 -=
 540 =3D 660
> > >
> > > If you match this with the CCS Figure 42 it still makes sense.
> > >
> >
> > Ah well, sure if LLP and FFL remain constant, the usage of the
> > "active sizes" doesn't matter.
> >
> > This means that the min hblank and min vblank have to be doubled to
> > compensate for the halved the active sizes.
>=20
> This is of course not correct. blankings doesn't have to be doubled,
> but just enalrged enough to maintain LLP/FFL constant.
>=20
> Sorry for the oversight.
>=20

No worries, the general idea got across.

> >
> > Speaking in CCS terms, this means the limits reported in Table 86 are
> > always populated.
> >
> > And what I'm struggling with at the moment, is the assumptions that's
> > always be the case for all sensors. Unfortunately I don't have enough
> > experience across all vendors to tell if that's the case..
> >

Indeed, same here. At least the handful of sensors I have dealt with follow
this, so I will go ahead and send a v2 to at least document the current
"Lingua Franca" for blanking controls even if it's as inconsistent as
English :-)

> >
> > > >
> > > > Do we need to distinguish between binning modes that affect the
> > > > timings and binning modes that do not do that?
> > > >
> > > > As we're going to introduce a control for binning to report the
> > > > binning factor in the image dimension domain, should we introduce
> > > > a control to specify the binning factor in the image timing domain ?
> > > >
> > > >         LLP =3D (analog_crop_width + HBLANK) / binning_timing_h
> > > >         FLL =3D (analog_crop_height + VBLANK) / binning_timing_v
> > > >         frame_interval =3D LLP * FLL / pixel_rate
> > > >
> > > > I'm not 100% sure this is correct however, as the blankings should =
be
> > > > expressed on a different clock domain that the pixel sampling rate,
> > > > but I guess this is a reasonable approximation ?
> > >
> > > What does these two extra controls really offer us?
> > >
> > > All sensors we have seen thus far map their LLP/FLL (or equivalent HT=
OT/VTOT)
> > > values with respect to the digital readout, and not the analogue pixe=
l array.
> > >
> > > If we add these two controls, we will have to support two different m=
odels for
> > > frame interval calculation in the application layer too. Which I'm fi=
ne with if
> > > it has a practical benefit, that is, it makes it easier to deal with =
some
> > > particular sensor.
> >
> > Not sure why you would need two modes to calculate timings in
> > userspace.
> >

As Sakari pointed out, there are in fact 3 models (2 already present in
upstream)

> > >
> > > And if exposing the LLP/FLL directly offer the same benefit, then tha=
t is
> > > cleaner, as it leaves the HBLANK/VBLANK as-is in the new model.
> > >
> >
> > As per above, if the consensus is that having the limits updated when
> > binning to maintaine the LLP/FFL values will work for all sensors,
> > then I'm fine with that.
> >

Ack. I think we can discuss that further when common raw sensor model is
being finalized.

> > > Thanks,
> > > Jai
> > >
> > > [...]

Thanks,
    Jai

