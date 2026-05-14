Return-Path: <linux-media+bounces-61581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAzsGZGLBWo5YQIAu9opvQ
	(envelope-from <linux-media+bounces-61581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:45:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D898C53F725
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1280C30347E2
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8A93DD858;
	Thu, 14 May 2026 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lr1cRSUo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5DD3C2777;
	Thu, 14 May 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748296; cv=none; b=iaKs0ktXiy7fffAXZdeK2ePjxyyl6BwrFBfYgHQT6iZtJLwM3yWhiiURUb95FBC1nteQYtpCXZcF3D5ZqWUwRLM4v+w3rx4OdE1zfQffP4UURZHMkXEfDRpQzze4Mp0Jl8M7W42ZPitcYBSAM2+Q4Fdk64F20ZRx9azxDJP7n5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748296; c=relaxed/simple;
	bh=5QKEezYGw/lK7tZem9NUXwwtsVhl7k1bgAB9Tn0lqi0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Lfzk/xCW1IODfQauZNWpLL//E6H2zu7MoJExpSm0LTSdk9AXR+F7aO5sVhAfEMgAs1GSU8VYyHj2svIbKK0lGaZ5uoa81cngSKczZ4Ma5jpKFuFExlNoZlbGFX9sRMUgi1h5b9bGhJW0P05J+vj9/LhfI6JlJctRoLenx3SQIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lr1cRSUo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C5EF454;
	Thu, 14 May 2026 10:44:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778748285;
	bh=5QKEezYGw/lK7tZem9NUXwwtsVhl7k1bgAB9Tn0lqi0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lr1cRSUoNlEIqB1ox57Vgmm+OMCCLgFavU6Qf+lGphVQSEOn409VoiqSDGln6FQkn
	 SNDAeFdMV6j2W9YgWT0XIpmQ/De4n+DthxFdRyXLQEu4mq8bZFZuk2o+E+Op26SRZT
	 cq0E/wHC3Yh/v4Gn+1RrPMaHkID7SIHGcDYDWUn8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <agWGc0cN8XhFNF2T@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com> <20260501-ov5640_cleanup-v1-6-0869a7802a33@ideasonboard.com> <agWGc0cN8XhFNF2T@zed>
Subject: Re: [PATCH 06/11] media: i2c: ov5640: split out the LSC registers
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 14 May 2026 09:44:51 +0100
Message-ID: <177874829159.2082999.8468069435270729064@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Queue-Id: D898C53F725
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61581-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Quoting Jacopo Mondi (2026-05-14 09:23:50)
> Hi Kieran
>=20
> On Fri, May 01, 2026 at 04:39:08PM +0100, Kieran Bingham wrote:
> > Lens shading is a characteristic which is specific to the lens of a
> > given module.
> >
> > Separate the Lens Shading Calibration registers from the init_setting
> > to identify the registers which must be updated when changing a lens.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >
> > ---
> >
> > The ordering of the table entries here are maintained and not resorted
> > (i.e. that first line) to make it easy to confirm that no adjustment is
> > made to the data here.
> >
> > I've also moved the LSC 'above' the init table as otherwise the diff
> > becomes unreviewable - as it shows a different hunk being conceptually
> > moved instead and hides the ability to see what is moving.
> >
> > Though that itself also confirms that the values don't change here, so
> > I'm happy to move it down if requested.
> > ---
> >  drivers/media/i2c/ov5640.c | 51 +++++++++++++++++++++++++++-----------=
--------
> >  1 file changed, 30 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index e1e253730206..b4e1ec4364df 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -522,6 +522,31 @@ static const struct v4l2_mbus_framefmt ov5640_dvp_=
default_fmt =3D {
> >       .field =3D V4L2_FIELD_NONE,
> >  };
> >
> > +static const struct reg_value ov5640_lsc[] =3D {
> > +     /* Lens Shading Correction */
> > +     {0x5800, 0x23, 0, 0}, {0x5801, 0x14, 0, 0},
> > +     {0x5802, 0x0f, 0, 0}, {0x5803, 0x0f, 0, 0}, {0x5804, 0x12, 0, 0},
> > +     {0x5805, 0x26, 0, 0}, {0x5806, 0x0c, 0, 0}, {0x5807, 0x08, 0, 0},
> > +     {0x5808, 0x05, 0, 0}, {0x5809, 0x05, 0, 0}, {0x580a, 0x08, 0, 0},
> > +     {0x580b, 0x0d, 0, 0}, {0x580c, 0x08, 0, 0}, {0x580d, 0x03, 0, 0},
> > +     {0x580e, 0x00, 0, 0}, {0x580f, 0x00, 0, 0}, {0x5810, 0x03, 0, 0},
> > +     {0x5811, 0x09, 0, 0}, {0x5812, 0x07, 0, 0}, {0x5813, 0x03, 0, 0},
> > +     {0x5814, 0x00, 0, 0}, {0x5815, 0x01, 0, 0}, {0x5816, 0x03, 0, 0},
> > +     {0x5817, 0x08, 0, 0}, {0x5818, 0x0d, 0, 0}, {0x5819, 0x08, 0, 0},
> > +     {0x581a, 0x05, 0, 0}, {0x581b, 0x06, 0, 0}, {0x581c, 0x08, 0, 0},
> > +     {0x581d, 0x0e, 0, 0}, {0x581e, 0x29, 0, 0}, {0x581f, 0x17, 0, 0},
> > +     {0x5820, 0x11, 0, 0}, {0x5821, 0x11, 0, 0}, {0x5822, 0x15, 0, 0},
> > +     {0x5823, 0x28, 0, 0}, {0x5824, 0x46, 0, 0}, {0x5825, 0x26, 0, 0},
> > +     {0x5826, 0x08, 0, 0}, {0x5827, 0x26, 0, 0}, {0x5828, 0x64, 0, 0},
> > +     {0x5829, 0x26, 0, 0}, {0x582a, 0x24, 0, 0}, {0x582b, 0x22, 0, 0},
> > +     {0x582c, 0x24, 0, 0}, {0x582d, 0x24, 0, 0}, {0x582e, 0x06, 0, 0},
> > +     {0x582f, 0x22, 0, 0}, {0x5830, 0x40, 0, 0}, {0x5831, 0x42, 0, 0},
> > +     {0x5832, 0x24, 0, 0}, {0x5833, 0x26, 0, 0}, {0x5834, 0x24, 0, 0},
> > +     {0x5835, 0x22, 0, 0}, {0x5836, 0x22, 0, 0}, {0x5837, 0x26, 0, 0},
> > +     {0x5838, 0x44, 0, 0}, {0x5839, 0x24, 0, 0}, {0x583a, 0x26, 0, 0},
> > +     {0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
> > +};
> > +
> >  static const struct reg_value ov5640_init_setting[] =3D {
> >       {0x3103, 0x11, 0, 0},
> >       {0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
> > @@ -574,27 +599,8 @@ static const struct reg_value ov5640_init_setting[=
] =3D {
> >       {0x548d, 0xcd, 0, 0}, {0x548e, 0xdd, 0, 0}, {0x548f, 0xea, 0, 0},
> >       {0x5490, 0x1d, 0, 0}, {0x5580, 0x02, 0, 0}, {0x5583, 0x40, 0, 0},
> >       {0x5584, 0x10, 0, 0}, {0x5589, 0x10, 0, 0}, {0x558a, 0x00, 0, 0},
> > -     {0x558b, 0xf8, 0, 0}, {0x5800, 0x23, 0, 0}, {0x5801, 0x14, 0, 0},
> > -     {0x5802, 0x0f, 0, 0}, {0x5803, 0x0f, 0, 0}, {0x5804, 0x12, 0, 0},
> > -     {0x5805, 0x26, 0, 0}, {0x5806, 0x0c, 0, 0}, {0x5807, 0x08, 0, 0},
> > -     {0x5808, 0x05, 0, 0}, {0x5809, 0x05, 0, 0}, {0x580a, 0x08, 0, 0},
> > -     {0x580b, 0x0d, 0, 0}, {0x580c, 0x08, 0, 0}, {0x580d, 0x03, 0, 0},
> > -     {0x580e, 0x00, 0, 0}, {0x580f, 0x00, 0, 0}, {0x5810, 0x03, 0, 0},
> > -     {0x5811, 0x09, 0, 0}, {0x5812, 0x07, 0, 0}, {0x5813, 0x03, 0, 0},
> > -     {0x5814, 0x00, 0, 0}, {0x5815, 0x01, 0, 0}, {0x5816, 0x03, 0, 0},
> > -     {0x5817, 0x08, 0, 0}, {0x5818, 0x0d, 0, 0}, {0x5819, 0x08, 0, 0},
> > -     {0x581a, 0x05, 0, 0}, {0x581b, 0x06, 0, 0}, {0x581c, 0x08, 0, 0},
> > -     {0x581d, 0x0e, 0, 0}, {0x581e, 0x29, 0, 0}, {0x581f, 0x17, 0, 0},
> > -     {0x5820, 0x11, 0, 0}, {0x5821, 0x11, 0, 0}, {0x5822, 0x15, 0, 0},
> > -     {0x5823, 0x28, 0, 0}, {0x5824, 0x46, 0, 0}, {0x5825, 0x26, 0, 0},
> > -     {0x5826, 0x08, 0, 0}, {0x5827, 0x26, 0, 0}, {0x5828, 0x64, 0, 0},
> > -     {0x5829, 0x26, 0, 0}, {0x582a, 0x24, 0, 0}, {0x582b, 0x22, 0, 0},
> > -     {0x582c, 0x24, 0, 0}, {0x582d, 0x24, 0, 0}, {0x582e, 0x06, 0, 0},
> > -     {0x582f, 0x22, 0, 0}, {0x5830, 0x40, 0, 0}, {0x5831, 0x42, 0, 0},
> > -     {0x5832, 0x24, 0, 0}, {0x5833, 0x26, 0, 0}, {0x5834, 0x24, 0, 0},
> > -     {0x5835, 0x22, 0, 0}, {0x5836, 0x22, 0, 0}, {0x5837, 0x26, 0, 0},
> > -     {0x5838, 0x44, 0, 0}, {0x5839, 0x24, 0, 0}, {0x583a, 0x26, 0, 0},
> > -     {0x583b, 0x28, 0, 0}, {0x583c, 0x42, 0, 0}, {0x583d, 0xce, 0, 0},
> > +     {0x558b, 0xf8, 0, 0},
> > +
>=20
> I'm wondering if the empty line here is intentional.

Yes, to start separating the functional blocks. I think we can work a
lot more to break out this whole register table with the full datasheet
being 'public'.


> Regardless:
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>=20
> >       {0x5025, 0x00, 0, 0}, {0x3a0f, 0x30, 0, 0}, {0x3a10, 0x28, 0, 0},
> >       {0x3a1b, 0x30, 0, 0}, {0x3a1e, 0x26, 0, 0}, {0x3a11, 0x60, 0, 0},
> >       {0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300=
},
> > @@ -2396,6 +2402,9 @@ static int ov5640_restore_mode(struct ov5640_dev =
*sensor)
> >       ov5640_load_regs(sensor, ov5640_init_setting,
> >                        ARRAY_SIZE(ov5640_init_setting));
> >
> > +     /* Load the Lens Shading Correction Table */
> > +     ov5640_load_regs(sensor, ov5640_lsc, ARRAY_SIZE(ov5640_lsc));
> > +
> >       ret =3D ov5640_mod_reg(sensor, OV5640_REG_SYS_ROOT_DIVIDER, 0x3f,
> >                            (ilog2(OV5640_SCLK2X_ROOT_DIV) << 2) |
> >                            ilog2(OV5640_SCLK_ROOT_DIV));
> >
> > --
> > 2.52.0
> >
> >

