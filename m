Return-Path: <linux-media+bounces-42828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE09B8CAD3
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 17:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDD1C17E56F
	for <lists+linux-media@lfdr.de>; Sat, 20 Sep 2025 15:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FEB2F7AA4;
	Sat, 20 Sep 2025 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="zCtmgdrm"
X-Original-To: linux-media@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A336378F59
	for <linux-media@vger.kernel.org>; Sat, 20 Sep 2025 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758380432; cv=none; b=rYp1yy1EAiyVPIg/rVFetQIv9/hES03xy/EzvcETrBtobfmIlf3uQQ32+IofikXrYUIDzLgv5RRtQPPzPCc2wqdvGJE5Av5yLCf/QIA8EvWOOB1/VnHTKMbc/SSdaIzWiSzrDAyKqb77k6EY272V7jIaIAuYf5ldufoOr4Zgjew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758380432; c=relaxed/simple;
	bh=YCHgOlPcbJKOH7zU/k20TSLxOTTK/PdftazqwXXuQ7c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RxymyGiavNs/mi1H1dpLAVKXmV3Ud2h14ui3zYH4ELmsWL1tcAEGzm2SIlnlfMt4oaInK+78NGYbwrGjoitkf47mSDY+aRltTqObIo+5ZR6VNkTXNtHkgbgICESaGcF7KtR9e7/IvKNVm5+G2PnXxkhVMiJjiEPpLc7dXbkMsow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=zCtmgdrm; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1758380426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijOJzmdzRDKd9dcL3XghcGraqozcSVhpfrfjEqKGU1w=;
	b=zCtmgdrmEsYTM0cuSGcVI8mxDkJGlqh6Eh2X0sslv5WLy3al2Hb4vbc8LGnpC4Ej4QJnfh
	Z+lNaoIYxcqQ/9JxPcYszt+Vz22qeimwbPGlIWZ9KfvRGuxSh9h4qvH/3eM3dHNUOa6ubZ
	DSzlm5c+ZkclAcyfrIhU1QKUXPReeGyjKvBugGR/ZXYXt4YP1uSljgXgtcPtL4sJP5iWsq
	pYCwGwegCV8rCD/kFVivcGHw7zRhVx2hjFpWg3uWC45T9jVl0beRYiahFU4jQSYfOAO8Lw
	O0ztuybJecCAz12ByrbxNjeqE93PDMKHuv1YazmpBQHxBy8uN5Ha3n11KjAM0Q==
Content-Type: multipart/signed;
 boundary=b9fa74363659b670e23c1dce98bffde2f9949cfa8c820d422a3b42c86d81;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 20 Sep 2025 17:00:07 +0200
Message-Id: <DCXPTZRNNTDY.1773L2181HWF@cknow.org>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>
Subject: Re: [PATCH v2 09/12] media: rkvdec: Add H264 support for the
 VDPU381 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-10-detlev.casanova@collabora.com>
In-Reply-To: <20250808200340.156393-10-detlev.casanova@collabora.com>
X-Migadu-Flow: FLOW_OUT

--b9fa74363659b670e23c1dce98bffde2f9949cfa8c820d422a3b42c86d81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Detlev,

Thanks a LOT for this patch set!
As already reported the results were quite impressive :-D

To figure out how to make VDPU346 for rk3568 work, I had a close look at
the TRM and compared that to rk3588's TRM and compared it to your code.
I think I may have found a few potential issue, but I may also not
understand things correctly.

On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
> This decoder variant is found in Rockchip RK3588 SoC family.
>
> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
> output formats and level up to 5.1.
>
> The maximum width and height have been significantly increased
> supporting up to 65520 pixels for both.
>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>  .../platform/rockchip/rkvdec/rkvdec-h264.c    |  36 --
>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 ++++++++++++++++++
>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 427 ++++++++++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 164 +++++-
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   6 +
>  7 files changed, 1067 insertions(+), 38 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381=
-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381=
-regs.h
>
> ...
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> new file mode 100644
> index 0000000000000..11b545e9ee7ea
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> @@ -0,0 +1,427 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VDPU381 Video Decoder driver registers description
> + *
> + * Copyright (C) 2024 Collabora, Ltd.
> + *  Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <linux/types.h>
> +
> +#ifndef _RKVDEC_REGS_H_
> +#define _RKVDEC_REGS_H_
> +
> +#define OFFSET_COMMON_REGS		(8 * sizeof(u32))
> +#define OFFSET_CODEC_PARAMS_REGS	(64 * sizeof(u32))
> +#define OFFSET_COMMON_ADDR_REGS		(128 * sizeof(u32))
> +#define OFFSET_CODEC_ADDR_REGS		(160 * sizeof(u32))
> +#define OFFSET_POC_HIGHBIT_REGS		(200 * sizeof(u32))
> +
> +#define VDPU381_MODE_HEVC	0
> +#define VDPU381_MODE_H264	1
> +#define VDPU381_MODE_VP9	2
> +#define VDPU381_MODE_AVS2	3
> +
> +#define MAX_SLICE_NUMBER	0x3fff
> +
> +#define RKVDEC_1080P_PIXELS		(1920 * 1080)
> +#define RKVDEC_4K_PIXELS		(4096 * 2304)
> +#define RKVDEC_8K_PIXELS		(7680 * 4320)

In the RK3588 TRM Part 1 paragraph 5.4.3 I can find the values for 4K
and 8K, but the 1080P resolution seems to be 1920x1088 (not 1080).

> +#define RKVDEC_TIMEOUT_1080p		(0xefffff)
> +#define RKVDEC_TIMEOUT_4K		(0x2cfffff)
> +#define RKVDEC_TIMEOUT_8K		(0x4ffffff)
> +#define RKVDEC_TIMEOUT_MAX		(0xffffffff)
> +
> +#define VDPU381_REG_DEC_E		0x028
> +#define VDPU381_DEC_E_BIT		1
> +
> +#define VDPU381_REG_IMPORTANT_EN	0x02c
> +#define VDPU381_DEC_IRQ_DISABLE	BIT(4)
> +
> +#define VDPU381_REG_STA_INT		0x380
> +#define VDPU381_STA_INT_DEC_RDY_STA	BIT(2)
> +#define VDPU381_STA_INT_ERROR		BIT(4)
> +#define VDPU381_STA_INT_TIMEOUT		BIT(5)
> +#define VDPU381_STA_INT_SOFTRESET_RDY	BIT(9)
> +
> +/* base: OFFSET_COMMON_REGS */
>
> ...
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 0ccf1ba81958a..1b55fe4ff2baf 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -28,6 +28,7 @@
> =20
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
> +#include "rkvdec-vdpu381-regs.h"
>  #include "rkvdec-rcb.h"
> =20
>  static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> @@ -84,11 +85,50 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ct=
x, u32 fourcc,
>  	return false;
>  }
> =20
> +#define VDPU38X_STRIDE_ALIGN	16
> +
> +/**
> + * The default v4l2_fill_pixfmt_mp() function doesn't allow for specific=
 alignment values.
> + * As the VDPU381 and VDPU383 need lines to be aligned on 16, use our ow=
n implementation here.
> + */
> +static int vdpu38x_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pix_mp,=
 u32 pixelformat,
> +				  u32 width, u32 height)
> +{
> +	const struct v4l2_format_info *info =3D v4l2_format_info(pix_mp->pixelf=
ormat);
> +	struct v4l2_plane_pix_format *plane =3D &pix_mp->plane_fmt[0];
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	pix_mp->num_planes =3D 1;
> +
> +	memset(plane, 0, sizeof(*plane));
> +
> +	plane->bytesperline =3D pix_mp->width * info->bpp[0] / info->bpp_div[0]=
;
> +	plane->bytesperline =3D ALIGN(plane->bytesperline, VDPU38X_STRIDE_ALIGN=
);
> +
> +	for (int i =3D 0; i < info->comp_planes; i++) {
> +		unsigned int vdiv =3D i ? info->vdiv : 1;
> +		unsigned int hdiv =3D i ? info->hdiv : 1;
> +		unsigned int stride =3D DIV_ROUND_UP(pix_mp->width, hdiv)
> +				    * info->bpp[i] / info->bpp_div[i];
> +		unsigned int height =3D DIV_ROUND_UP(pix_mp->height, vdiv);
> +
> +		plane->sizeimage +=3D ALIGN(stride, VDPU38X_STRIDE_ALIGN) * height;
> +	}
> +
> +	return 0;
> +}
> +
>  static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>  				       struct v4l2_pix_format_mplane *pix_mp)
>  {
> -	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
> -			    pix_mp->width, pix_mp->height);
> +	struct rkvdec_config *cfg =3D ctx->dev->config;
> +
> +	cfg->fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width, pix_mp-=
>height);
> +
> +	ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> +
>  	pix_mp->plane_fmt[0].sizeimage +=3D 128 *
>  		DIV_ROUND_UP(pix_mp->width, 16) *
>  		DIV_ROUND_UP(pix_mp->height, 16);
> @@ -287,6 +327,25 @@ static const struct rkvdec_coded_fmt_desc rkvdec_cod=
ed_fmts[] =3D {
>  	}
>  };
> =20
> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D  65520,
> +			.step_width =3D 64,
> +			.min_height =3D 16,
> +			.max_height =3D  65520,
> +			.step_height =3D 16,
> +		},

Also in the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image size"=
 :
16x16 to 65520x65520; step size 16 pixels

I interpret that that .min_width and .step_width should both be 16.
(.min_height and .step_height are correct at 16; if I read the TRM right)

> +		.ctrls =3D &rkvdec_h264_ctrls,
> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +};
> +
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>  {
> @@ -1125,6 +1184,35 @@ static irqreturn_t rk3399_irq_handler(struct rkvde=
c_ctx *ctx)

Cheers,
  Diederik

--b9fa74363659b670e23c1dce98bffde2f9949cfa8c820d422a3b42c86d81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaM7BggAKCRDXblvOeH7b
bpgmAQCFDGMgDVQ1jCwy/pQMoyeJggzfPDXfxF075j1Mf44bpQD6A3aEPqu/IG3M
dq8uGQQ/2TiBUsOPasKNSUPOOQwsdAc=
=Wwg0
-----END PGP SIGNATURE-----

--b9fa74363659b670e23c1dce98bffde2f9949cfa8c820d422a3b42c86d81--

