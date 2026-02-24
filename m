Return-Path: <linux-media+bounces-53263-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBV5Gmk2nWlINQQAu9opvQ
	(envelope-from <linux-media+bounces-53263-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 06:26:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3578181E24
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 06:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E7223055DE8
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 05:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AA02874E6;
	Tue, 24 Feb 2026 05:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uQFQAHSW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E724501B;
	Tue, 24 Feb 2026 05:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771910743; cv=none; b=NRI3wvndKxzYIU8O4+nc/kLWg+8777XX+PMGvbBBgNMUTne+pin0kYOE15Ny4imzWFoaiGdKVQ3jhHA2R75yifI4t6WvBV1BTWk0X/4mBHgpn9W19ZNoqSI2XBkWUDwbtIUZEHLH4mjha70BI5u4HSWEhc4PH3DntHXOggMDb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771910743; c=relaxed/simple;
	bh=n45U8aEPuSpNMh2kd8y4EjkYhg5n3q6FrtU3z6PCvVE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CzIydMQtLTZGNzhpq1vbl4fJPVFF9QGjXpj0uR9jukpm/1/RPQxjBSh6myMkhn5bVBJN1h/HBu5xIAiGVzDDSeVf3XEOU7tZnobhLKjsM5DJRvj8o1NKm4/UrEGYNkinI6ltglxBLx7HG5JdWhy6U4KS7t5Xd3YqF9GRsyxNh3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uQFQAHSW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D2E0B1A;
	Tue, 24 Feb 2026 06:24:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771910681;
	bh=n45U8aEPuSpNMh2kd8y4EjkYhg5n3q6FrtU3z6PCvVE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uQFQAHSWcs2nVVvKyrctKQd2Me7/oqtXWGz0F2kgDGfTu4bqLh/Y1eWePZAxX1oqo
	 ZqYkVKN1iO2Ka6ve0i9E2fk10el2WjjJWesIQ9OG3Bw5WWn3KWdcQ7HLPifK/aMg/N
	 hKYZpEdKm9g63QLlSZuzBbfzXKXvnHGG249UhBcQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aZwQJZX6sjzLgVL4@zed>
References: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com> <aZwQJZX6sjzLgVL4@zed>
Subject: Re: [PATCH] media: Documentation: Fix frame interval calculation for raw camera sensors
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 24 Feb 2026 10:55:33 +0530
Message-ID: <177191073323.14753.12002575507884033868@freya>
User-Agent: alot/0.13.dev20+g31692a239
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
	TAGGED_FROM(0.00)[bounces-53263-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C3578181E24
X-Rspamd-Action: no action

Hi Jacopo,

Thanks for the review.

Quoting Jacopo Mondi (2026-02-23 14:41:02)
> Hi Jai
>=20
> On Thu, Feb 19, 2026 at 01:20:50PM +0530, Jai Luthra wrote:
> > The previous frame interval formula used analogue crop dimensions. This
> > breaks down for some sensors when binning.
> >
> > For example in imx219 the minimum FLL (frame length in lines) can be
> > lower than the analogue crop height when binning, which would require a
> > negative VBLANK to represent the actual timing. Similarly, imx283 allows
> > a lower minimum HMAX (line length) when doing 2x2 or 3x3 binning than
> > the analogue crop width of the full resolution mode.
> >
> > The CCS specification also describes under section "8.2.6 Line Length
> > and Frame Length" how the horizontal and vertical readout minimums can
> > be different when binning.
> >
> > Replace the formula with the underlying hardware concepts of LLP (line
> > length in pixels) and FLL (frame length in lines). These terms were
> > chosen to match the CCS specification on raw sensors, as it is a cleaner
> > reference compared to a typical sensor vendor datasheet.
> >
> > Finally, define the blanking controls relative to the active pixel
> > readout (post-binning) rather than the analogue crop size. This matches
> > what most sensor drivers already do, and also what applications like
> > libcamera expect. In "Figure 42" of CCS specification too, we see a
> > similar definition:
> >
> >   frame interval =3D (output width + HBLANK) *
> >                    (output height + VBLANK) / pixel rate
> >
> > Also add a note in the "Writing camera sensor drivers" guide, to ensure
> > this formula is followed by new sensor drivers.
>=20
> I agree that using the analogue crop rectangle sizes is not correct,
> however, with this new formulation the LLP and FLL values might be
> smaller than the crop rectangles reported through the selection API,
> which I'm not sure it's great from a consistency point of view ?

While it takes a while to grok, but most sensors I looked at operate in
this way (of reducing the line length or the frame length) when binning,
including CCS (implicitly). A counterexample would really help here.

>=20
> Also the below suggested formulation:
>=20
>         LLP =3D active width + V4L2_CID_HBLANK
>         FLL =3D active height + V4L2_CID_VBLANK
>=20
> Assumes the combined effect of [binning + subsampling] always directly
> affect the readout time of pixels on the pixel array. The CCS specs
> and driver seems to suggest that's not always the case ?

Why do you think this model can't work for sensors where the readout time is
unaffected?

Let's say a sensor's pixel array is 1920x1080 with minimum LLP=3D2000, FLL=
=3D1200.

so, HBLANK minimum =3D 80, VBLANK minimum =3D 120

It also supports a 2x2 binned mode of 960x540 with the same minimum LLP and=
 FLL
(that is same max framerate, no speed up or change in readout).

so, HBLANK minimum =3D 2000 - 960 =3D 1040, VBLANK minimum =3D 1200 - 540 =
=3D 660

If you match this with the CCS Figure 42 it still makes sense.

>=20
> Do we need to distinguish between binning modes that affect the
> timings and binning modes that do not do that?
>=20
> As we're going to introduce a control for binning to report the
> binning factor in the image dimension domain, should we introduce
> a control to specify the binning factor in the image timing domain ?
>=20
>         LLP =3D (analog_crop_width + HBLANK) / binning_timing_h
>         FLL =3D (analog_crop_height + VBLANK) / binning_timing_v
>         frame_interval =3D LLP * FLL / pixel_rate
>=20
> I'm not 100% sure this is correct however, as the blankings should be
> expressed on a different clock domain that the pixel sampling rate,
> but I guess this is a reasonable approximation ?

What does these two extra controls really offer us?

All sensors we have seen thus far map their LLP/FLL (or equivalent HTOT/VTO=
T)
values with respect to the digital readout, and not the analogue pixel arra=
y.

If we add these two controls, we will have to support two different models =
for
frame interval calculation in the application layer too. Which I'm fine wit=
h if
it has a practical benefit, that is, it makes it easier to deal with some
particular sensor.

And if exposing the LLP/FLL directly offer the same benefit, then that is
cleaner, as it leaves the HBLANK/VBLANK as-is in the new model.

Thanks,
Jai

[...]

