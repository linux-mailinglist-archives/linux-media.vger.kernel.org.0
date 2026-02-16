Return-Path: <linux-media+bounces-52883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MD7EDiUtk2mZ2AEAu9opvQ
	(envelope-from <linux-media+bounces-52883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:43:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B3144C6D
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9D703027966
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 14:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3F9310777;
	Mon, 16 Feb 2026 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F3C4y/73"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1342FF652;
	Mon, 16 Feb 2026 14:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771252947; cv=none; b=hlFJXxYfoXCBzDG8zlsi7nIbehkk6xlRjewgrPFWA0jkWAbyPwtd188aEyFBZowpVJeCWDqQlVbEICf7ciZVX4Eyzv+Em5zcu4JObQmNVdSI7P/gF/9NhRSpQi+5S9Jp9eJ62lTCW3hdCJj894e/MD+XYgLp6LQQ6n6hrlxh7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771252947; c=relaxed/simple;
	bh=xi7PIRDSmFFYJfVfs34X71tXkcfFqcT0/prRQDYvdCs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=nlofxJ+dtq1zLnvhHwZZNZAnG81ZwxjLZvSxnK5ALRi7w80x98vOZmBnF6QoaSN9soj3rA3QeCGvmox2ka8LfGBVQm2aWeJaLOl9EQe0FdRpeq9UIzlwp2U2S7RN1BIuRylRXqJy85Eq0Z6NwZMrq5WGMYShAkAnB9x7DTQruX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F3C4y/73; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:6452:b7eb:ea26:c129:40a5])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEBF54B3;
	Mon, 16 Feb 2026 15:41:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771252894;
	bh=xi7PIRDSmFFYJfVfs34X71tXkcfFqcT0/prRQDYvdCs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F3C4y/73Dt02EyGpkL/G7ApaIu4aON/L9YQmN3CHWlwEEI1uijdG/bgB9PrQ9OJKn
	 efAa7zBg3ZFpYR9qEAI8zAIOb89semVkmVv0pYeeFxoSeMAMF59elcT37BSsE/NjP7
	 RIZEcWKLmLQb/VW3qKg7xvnJX+8N0u845jQGfvVI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260213-mainline-imx283-v2-v2-4-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com> <20260213-mainline-imx283-v2-v2-4-be40a3770ebf@ideasonboard.com>
Subject: Re: [PATCH v2 04/25] media: i2c: imx283: Move scan out data to single data structure
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Hans Verkuil <hverkuil@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Umang Jain <uajain@igalia.com>
Date: Mon, 16 Feb 2026 20:12:19 +0530
Message-ID: <177125293955.14753.15690282606594009547@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52883-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: A30B3144C6D
X-Rspamd-Action: no action

Quoting Kieran Bingham (2026-02-13 19:31:43)
> Move the common data structures to a new scanout table and allow v4l2
> output modes to reference their scanout.
>=20
> This removes duplication from the mode definitions.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> ---
>  drivers/media/i2c/imx283.c | 90 +++++++++++++++++++++++++++++++---------=
------
>  1 file changed, 62 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
> index d53cea49baae..3e97ad38f716 100644
> --- a/drivers/media/i2c/imx283.c
> +++ b/drivers/media/i2c/imx283.c
> @@ -264,28 +264,63 @@ struct imx283_readout_mode {
>         u8 mdsel4;
>  };
> =20
> -static const struct imx283_readout_mode imx283_readout_modes[] =3D {
> +struct imx283_scanout {
> +       u8 bpp;
> +       struct imx283_readout_mode readout;
> +};
> +
> +static const struct imx283_scanout imx283_scan_modes[] =3D {
>         /* All pixel scan modes */
> -       [IMX283_MODE_0] =3D { 0x04, 0x03, 0x10, 0x00 }, /* 12 bit */
> -       [IMX283_MODE_1] =3D { 0x04, 0x01, 0x00, 0x00 }, /* 10 bit */
> -       [IMX283_MODE_1A] =3D { 0x04, 0x01, 0x20, 0x50 }, /* 10 bit */
> -       [IMX283_MODE_1S] =3D { 0x04, 0x41, 0x20, 0x50 }, /* 10 bit */
> +       [IMX283_MODE_0] =3D {
> +               .bpp =3D 12,
> +               .readout =3D { 0x04, 0x03, 0x10, 0x00 },
> +       },
> +       [IMX283_MODE_1] =3D {
> +               .bpp =3D 10,
> +               .readout =3D { 0x04, 0x01, 0x00, 0x00 },
> +       },
> +       [IMX283_MODE_1A] =3D {
> +               .bpp =3D 10,
> +               .readout =3D { 0x04, 0x01, 0x20, 0x50 },
> +       },
> +       [IMX283_MODE_1S] =3D {
> +               .bpp =3D 10,
> +               .readout =3D { 0x04, 0x41, 0x20, 0x50 },
> +       },
> =20
>         /* Horizontal / Vertical 2/2-line binning */
> -       [IMX283_MODE_2] =3D { 0x0d, 0x11, 0x50, 0x00 }, /* 12 bit */
> -       [IMX283_MODE_2A] =3D { 0x0d, 0x11, 0x70, 0x50 }, /* 12 bit */
> +       [IMX283_MODE_2] =3D {
> +               .bpp =3D 12,
> +               .readout =3D { 0x0d, 0x11, 0x50, 0x00 },
> +       },
> +       [IMX283_MODE_2A] =3D {
> +               .bpp =3D 12,
> +               .readout =3D { 0x0d, 0x11, 0x70, 0x50 },
> +       },
> =20
>         /* Horizontal / Vertical 3/3-line binning */
> -       [IMX283_MODE_3] =3D { 0x1e, 0x18, 0x10, 0x00 }, /* 12 bit */
> +       [IMX283_MODE_3] =3D {
> +               .bpp =3D 12,
> +               .readout =3D { 0x1e, 0x18, 0x10, 0x00 },
> +       },
> =20
>         /* Vertical 2/9 subsampling, horizontal 3 binning cropping */
> -       [IMX283_MODE_4] =3D { 0x29, 0x18, 0x30, 0x50 }, /* 12 bit */
> +       [IMX283_MODE_4] =3D {
> +               .bpp =3D 12,
> +               .readout =3D { 0x29, 0x18, 0x30, 0x50 },
> +       },
> =20
>         /* Vertical 2/19 subsampling binning, horizontal 3 binning */
> -       [IMX283_MODE_5] =3D { 0x2d, 0x18, 0x10, 0x00 }, /* 12 bit */
> +       [IMX283_MODE_5] =3D {
> +               .bpp =3D 12,
> +               .readout =3D { 0x2d, 0x18, 0x10, 0x00 },
> +       },
> =20
>         /* Vertical 2 binning horizontal 2/4, subsampling 16:9 cropping */
> -       [IMX283_MODE_6] =3D { 0x18, 0x21, 0x00, 0x09 }, /* 10 bit */
> +       [IMX283_MODE_6] =3D {
> +               .bpp =3D 10,
> +               .readout =3D { 0x18, 0x21, 0x00, 0x09 },
> +       },
> =20
>         /*
>          * New modes should make sure the offset period is complied.
> @@ -293,12 +328,14 @@ static const struct imx283_readout_mode imx283_read=
out_modes[] =3D {
>          */
>  };
> =20
> +static bool scan_mode(const struct imx283_scanout *scan, enum imx283_mod=
es mode)
> +{
> +       return scan =3D=3D &imx283_scan_modes[mode];
> +}
> +
>  /* Mode : resolution and related config values */
>  struct imx283_mode {
> -       unsigned int mode;
> -
> -       /* Bits per pixel */
> -       unsigned int bpp;
> +       const struct imx283_scanout *scan;
> =20
>         /* Frame width */
>         unsigned int width;
> @@ -410,8 +447,8 @@ static const struct imx283_reg_list link_freq_reglist=
[] =3D {
>  static const struct imx283_mode supported_modes_12bit[] =3D {
>         {
>                 /* 20MPix 21.40 fps readout mode 0 */
> -               .mode =3D IMX283_MODE_0,
> -               .bpp =3D 12,
> +               .scan =3D &imx283_scan_modes[IMX283_MODE_0],
> +
>                 .width =3D 5472,
>                 .height =3D 3648,
>                 .min_hmax =3D 5914, /* 887 @ 480MHz/72MHz */
> @@ -442,8 +479,7 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>                 /*
>                  * Readout mode 2 : 2/2 binned mode (2736x1824)
>                  */
> -               .mode =3D IMX283_MODE_2,
> -               .bpp =3D 12,
> +               .scan =3D &imx283_scan_modes[IMX283_MODE_2],
>                 .width =3D 2736,
>                 .height =3D 1824,
>                 .min_hmax =3D 2414, /* Pixels (362 * 480MHz/72MHz + paddi=
ng) */
> @@ -475,8 +511,7 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>                 /*
>                  * Readout mode 3 : 3/3 binned mode (1824x1216)
>                  */
> -               .mode =3D IMX283_MODE_3,
> -               .bpp =3D 12,
> +               .scan =3D &imx283_scan_modes[IMX283_MODE_3],
>                 .width =3D 1824,
>                 .height =3D 1216,
>                 .min_hmax =3D 1894, /* Pixels (284 * 480MHz/72MHz + paddi=
ng) */
> @@ -509,8 +544,7 @@ static const struct imx283_mode supported_modes_12bit=
[] =3D {
>  static const struct imx283_mode supported_modes_10bit[] =3D {
>         {
>                 /* 20MPix 25.48 fps readout mode 1 */
> -               .mode =3D IMX283_MODE_1,
> -               .bpp =3D 10,
> +               .scan =3D &imx283_scan_modes[IMX283_MODE_1],
>                 .width =3D 5472,
>                 .height =3D 3648,
>                 .min_hmax =3D 5960, /* 745 @ 576MHz / 72MHz */
> @@ -616,7 +650,7 @@ static u64 imx283_pixel_rate(struct imx283 *imx283,
>                              const struct imx283_mode *mode)
>  {
>         u64 link_frequency =3D link_frequencies[__ffs(imx283->link_freq_b=
itmap)];
> -       unsigned int bpp =3D mode->bpp;
> +       unsigned int bpp =3D mode->scan->bpp;
>         const unsigned int ddr =3D 2; /* Double Data Rate */
>         const unsigned int lanes =3D 4; /* Only 4 lane support */
>         u64 numerator =3D link_frequency * ddr * lanes;
> @@ -673,7 +707,7 @@ static u32 imx283_exposure(struct imx283 *imx283,
>         u64 numerator;
> =20
>         /* Number of clocks per internal offset period */
> -       offset =3D mode->mode =3D=3D IMX283_MODE_0 ? 209 : 157;
> +       offset =3D scan_mode(mode->scan, IMX283_MODE_0) ? 209 : 157;
>         numerator =3D (imx283->vmax * (svr + 1) - shr) * imx283->hmax + o=
ffset;
> =20
>         do_div(numerator, imx283->hmax);
> @@ -708,7 +742,7 @@ static u32 imx283_shr(struct imx283 *imx283, const st=
ruct imx283_mode *mode,
>         u64 temp;
> =20
>         /* Number of clocks per internal offset period */
> -       offset =3D mode->mode =3D=3D IMX283_MODE_0 ? 209 : 157;
> +       offset =3D scan_mode(mode->scan, IMX283_MODE_0) ? 209 : 157;
>         temp =3D ((u64)exposure * imx283->hmax - offset);
>         do_div(temp, imx283->hmax);
> =20
> @@ -1073,7 +1107,7 @@ static int imx283_start_streaming(struct imx283 *im=
x283,
>          * Set the readout mode registers.
>          * MDSEL3 and MDSEL4 are updated to enable Arbitrary Vertical Cro=
pping.
>          */
> -       readout =3D &imx283_readout_modes[mode->mode];
> +       readout =3D &mode->scan->readout;
>         cci_write(imx283->cci, IMX283_REG_MDSEL1, readout->mdsel1, &ret);
>         cci_write(imx283->cci, IMX283_REG_MDSEL2, readout->mdsel2, &ret);
>         cci_write(imx283->cci, IMX283_REG_MDSEL3,
> @@ -1082,7 +1116,7 @@ static int imx283_start_streaming(struct imx283 *im=
x283,
>                   readout->mdsel4 | IMX283_MDSEL4_VCROP_EN, &ret);
> =20
>         /* Mode 1S specific entries from the Readout Drive Mode Tables */
> -       if (mode->mode =3D=3D IMX283_MODE_1S) {
> +       if (scan_mode(mode->scan, IMX283_MODE_1S)) {
>                 cci_write(imx283->cci, IMX283_REG_MDSEL7, 0x01, &ret);
>                 cci_write(imx283->cci, IMX283_REG_MDSEL18, 0x1098, &ret);
>         }
>=20
> --=20
> 2.52.0
>

