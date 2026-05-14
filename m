Return-Path: <linux-media+bounces-61580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eClRF3+LBWo5YQIAu9opvQ
	(envelope-from <linux-media+bounces-61580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:44:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD68A53F715
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 618D0301F5E5
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0C73DD853;
	Thu, 14 May 2026 08:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aoKD33+6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B6B3D9DA4;
	Thu, 14 May 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778748228; cv=none; b=MGqiP0lj8OeAMycMcitXuVUp1FPRzWN1D+LJ5SdRMg+HgZNmYSnaEKnXoIBfm29uPA5+v/LjxFpka5o81Cqdyqqy5w2sRZTtbPRBIDF+UWKb7xqalhkdgXwr3FrAmj+5uUvkcf/hM8PSl431ZnsZccE//VSVms5Xl0ajX+bGJuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778748228; c=relaxed/simple;
	bh=sTCR9cEUYEm0CLV5LNEu//TBhcxgSBXYNGkopfZm/w8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mdY4uzIUp6/hxXo+cLGB1MxVh9sYTiC8HOFIkx5hGvooLybP1e2w5dd5DqyIJ9+jOAQ2d82nKH0Vxt+JHbfJCY/LSyJ94UpgDrqtQwHFVrAM3pm2IaczMkYRbEhlS6TcukLgJ3I6Bgc+MXWxXxQCDBa+xzTkVuqyK6Ug/3g3sK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aoKD33+6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BC01454;
	Thu, 14 May 2026 10:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778748217;
	bh=sTCR9cEUYEm0CLV5LNEu//TBhcxgSBXYNGkopfZm/w8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aoKD33+6wOuX3Wn5eEGkKs9DlcVWk/NoL+KB6bzbk6cEEEhnsbTl/s0noLmi1zvKq
	 wtQgSySj1p99OPGidzUBivT/1YaVR9I6EMuiRbN0V8tENkcVXYHy3XZRGSSVTAoBsg
	 1v8/zDXdDUGGpNtlzlutSSN+5sG7c9LmVqcYwWCE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <agWDRd0oOBsNfyy_@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com> <20260501-ov5640_cleanup-v1-5-0869a7802a33@ideasonboard.com> <agWDRd0oOBsNfyy_@zed>
Subject: Re: [PATCH 05/11] media: i2c: ov5640: Remove unsupported bayer orders
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 14 May 2026 09:43:42 +0100
Message-ID: <177874822267.2082999.7527544096525133469@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-Rspamd-Queue-Id: AD68A53F715
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61580-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Quoting Jacopo Mondi (2026-05-14 09:10:48)
> Hi Kieran
>=20
> On Fri, May 01, 2026 at 04:39:07PM +0100, Kieran Bingham wrote:
> > The OV5640 only outputs SBGGR8. Remove the incorrectly advertised
> > alternatives which allow a misconfigured pipeline to be established.
>=20
> Do you have any idea why the datasheet mentions all the RGGB
> permutations as valid outputs ?

I would anticipate it's because the internal ISP component can support them.

But now I think more I have to admit, I have no idea if other modules
might have different physical orderings.

But certainly as far as I can tell any given module can only have a
single 'correct' value here.

So we'll have to try to work out how to confirm/verify that perhaps ?

>=20
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 21 ---------------------
> >  1 file changed, 21 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index 244c341d0e77..e1e253730206 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -309,27 +309,6 @@ static const struct ov5640_pixfmt ov5640_csi2_form=
ats[] =3D {
> >               .bpp            =3D 8,
> >               .ctrl00         =3D 0x00,
> >               .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> > -     }, {
> > -             /* Raw bayer, GBGB... / RGRG... */
> > -             .code           =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > -             .colorspace     =3D V4L2_COLORSPACE_SRGB,
> > -             .bpp            =3D 8,
> > -             .ctrl00         =3D 0x01,
> > -             .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> > -     }, {
> > -             /* Raw bayer, GRGR... / BGBG... */
> > -             .code           =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > -             .colorspace     =3D V4L2_COLORSPACE_SRGB,
> > -             .bpp            =3D 8,
> > -             .ctrl00         =3D 0x02,
> > -             .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> > -     }, {
> > -             /* Raw bayer, RGRG... / GBGB... */
> > -             .code           =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > -             .colorspace     =3D V4L2_COLORSPACE_SRGB,
> > -             .bpp            =3D 8,
> > -             .ctrl00         =3D 0x03,
> > -             .mux            =3D OV5640_FMT_MUX_RAW_DPC,
> >       },
>=20
> Seems like you've missed the same entries in the ov5640_dvp_formats[]
> table.

That was intentional so far as I can only test the CSI variant. But
perhaps for the same reasons mentioned above, whatever happens on one
will be the same on the other.

I hope posting this will find some wider testers 'perhaps' if anyone
cares.

--
Kieran.

>=20
> >       { /* sentinel */ }
> >  };
> >
> > --
> > 2.52.0
> >
> >

