Return-Path: <linux-media+bounces-32378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91364AB5313
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 12:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACD34188040A
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D171B2472AD;
	Tue, 13 May 2025 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fDogRfXs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB724679F;
	Tue, 13 May 2025 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132822; cv=none; b=HWTVlunbi2szDdGCI0uQvh4No4Chb+0EAai76TrM4CuYCMHCjlm+oe+xIY0IBTL5TS+QmOYgaENlIIAgDCHWy6uTmP9OZPeSUUoB7AtCFpUMjAAtT/cLwjXdBRDGhh3GTKSjXUkQQtwR6pjG++ZJ6882uevxotpFZS1Xj2/JCbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132822; c=relaxed/simple;
	bh=lQdTu8Ydp43ztCCkt1GodvPmayVsw1d5b31sCVQ8VOw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=RrP4axLfVkCxJM9xvgMLIuLnfUn1bLbR8zw2VoUTjKp4cEB63bQCYhj0yL1rUE2CO/rgU4MU3Y/Jchwzszi9E7taKUa8coYmaeN5IF9XYF2z4uNwCkMp2vKnB80pXd+7F6HRjC+pgHxdM2sX3R5NjxB9WkgeTWooMxctCjIbGNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fDogRfXs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (unknown [IPv6:2001:861:3a80:3300:4f2f:8c2c:b3ef:17d4])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B902B7E4;
	Tue, 13 May 2025 12:40:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747132800;
	bh=lQdTu8Ydp43ztCCkt1GodvPmayVsw1d5b31sCVQ8VOw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fDogRfXsPzpsczFcLTr57qaxAHf2j8RrDV2bfrg72YF8wq/LkX/cCUoUMcU94Jj4g
	 b0exwfG8qFkvN0L/olPIxfHCabTHQ6N0YzW8kmvdTaqiC68hFCItsGGmv6ONijRZNG
	 sidcTLcht60OqID86Ht/dD+JRwyGyDLz66RbkRCM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250429-awb64-v5-1-2dc3163a8cfc@ideasonboard.com>
References: <20250429-awb64-v5-0-2dc3163a8cfc@ideasonboard.com> <20250429-awb64-v5-1-2dc3163a8cfc@ideasonboard.com>
Subject: Re: [PATCH v5 1/2] media: rockchip: rkisp1: Add support for Wide Dynamic Range
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Klug <stefan.klug@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Jai Luthra <jai.luthra@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 13 May 2025 12:40:13 +0200
Message-ID: <174713281310.233090.4341459510607966863@pyrite.rasen.tech>
User-Agent: alot/0.0.0

Hi Jai,

Thanks for the patch.

Quoting Jai Luthra (2025-04-29 13:41:53)
> RKISP supports a basic Wide Dynamic Range (WDR) module since the first
> iteration (v1.0) of the ISP. Add support for enabling and configuring it
> using extensible parameters.
>=20
> Also, to ease programming, switch to using macro variables for defining
> the tonemapping curve register addresses.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Looks good to me.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes in v5:
> - Ensure WDR_USE_IREF is unset before reading params from user
> - Fix alignment issues in WDR patch
> - Drop reset value information from doxygen comments for WDR tone curve
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 93 ++++++++++++++++=
++++
>  .../media/platform/rockchip/rkisp1/rkisp1-regs.h   | 99 ++++++----------=
------
>  include/uapi/linux/rkisp1-config.h                 | 92 ++++++++++++++++=
++++
>  3 files changed, 210 insertions(+), 74 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a309a3231d44d825c6461e3ecb2a44..dc8e827e9464117877afe6796=
11c528b4126172f 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
>   */
> =20
> +#include <linux/bitfield.h>
>  #include <linux/math.h>
>  #include <linux/string.h>
> =20
> @@ -60,6 +61,7 @@ union rkisp1_ext_params_config {
>         struct rkisp1_ext_params_afc_config afc;
>         struct rkisp1_ext_params_compand_bls_config compand_bls;
>         struct rkisp1_ext_params_compand_curve_config compand_curve;
> +       struct rkisp1_ext_params_wdr_config wdr;
>  };
> =20
>  enum rkisp1_params_formats {
> @@ -1348,6 +1350,73 @@ rkisp1_compand_compress_config(struct rkisp1_param=
s *params,
>                                        arg->x);
>  }
> =20
> +static void rkisp1_wdr_config(struct rkisp1_params *params,
> +                             const struct rkisp1_cif_isp_wdr_config *arg)
> +{
> +       unsigned int i;
> +       u32 value;
> +
> +       value =3D rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_WDR_CTRL)
> +             & ~(RKISP1_CIF_ISP_WDR_USE_IREF |
> +                 RKISP1_CIF_ISP_WDR_COLOR_SPACE_SELECT |
> +                 RKISP1_CIF_ISP_WDR_CR_MAPPING_DISABLE |
> +                 RKISP1_CIF_ISP_WDR_USE_Y9_8 |
> +                 RKISP1_CIF_ISP_WDR_USE_RGB7_8 |
> +                 RKISP1_CIF_ISP_WDR_DISABLE_TRANSIENT |
> +                 RKISP1_CIF_ISP_WDR_RGB_FACTOR_MASK);
> +
> +       /* Colorspace and chrominance mapping */
> +       if (arg->use_rgb_colorspace)
> +               value |=3D RKISP1_CIF_ISP_WDR_COLOR_SPACE_SELECT;
> +
> +       if (!arg->use_rgb_colorspace && arg->bypass_chroma_mapping)
> +               value |=3D RKISP1_CIF_ISP_WDR_CR_MAPPING_DISABLE;
> +
> +       /* Illumination reference */
> +       if (arg->use_iref) {
> +               value |=3D RKISP1_CIF_ISP_WDR_USE_IREF;
> +
> +               if (arg->iref_config.use_y9_8)
> +                       value |=3D RKISP1_CIF_ISP_WDR_USE_Y9_8;
> +
> +               if (arg->iref_config.use_rgb7_8)
> +                       value |=3D RKISP1_CIF_ISP_WDR_USE_RGB7_8;
> +
> +               if (arg->iref_config.disable_transient)
> +                       value |=3D RKISP1_CIF_ISP_WDR_DISABLE_TRANSIENT;
> +
> +               value |=3D FIELD_PREP(RKISP1_CIF_ISP_WDR_RGB_FACTOR_MASK,
> +                                   min(arg->iref_config.rgb_factor,
> +                                       RKISP1_CIF_ISP_WDR_RGB_FACTOR_MAX=
));
> +       }
> +
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_CTRL, value);
> +
> +       /* RGB and Luminance offsets */
> +       value =3D FIELD_PREP(RKISP1_CIF_ISP_WDR_RGB_OFFSET_MASK,
> +                          arg->rgb_offset)
> +             | FIELD_PREP(RKISP1_CIF_ISP_WDR_LUM_OFFSET_MASK,
> +                          arg->luma_offset);
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_OFFSET, value);
> +
> +       /* DeltaMin */
> +       value =3D FIELD_PREP(RKISP1_CIF_ISP_WDR_DMIN_THRESH_MASK,
> +                          arg->dmin_thresh)
> +             | FIELD_PREP(RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MASK,
> +                          min(arg->dmin_strength,
> +                              RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MAX));
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_DELTAMIN, value);
> +
> +       /* Tone curve */
> +       for (i =3D 0; i < RKISP1_CIF_ISP_WDR_CURVE_NUM_DY_REGS; i++)
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_TONECURVE=
(i),
> +                            arg->tone_curve.dY[i]);
> +       for (i =3D 0; i < RKISP1_CIF_ISP_WDR_CURVE_NUM_COEFF; i++)
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_WDR_TONECURVE=
_YM(i),
> +                            arg->tone_curve.ym[i] &
> +                                    RKISP1_CIF_ISP_WDR_TONE_CURVE_YM_MAS=
K);
> +}
> +
>  static void
>  rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>                             const struct rkisp1_params_cfg *new_params)
> @@ -2005,6 +2074,25 @@ static void rkisp1_ext_params_compand_compress(str=
uct rkisp1_params *params,
>                                       RKISP1_CIF_ISP_COMPAND_CTRL_COMPRES=
S_ENABLE);
>  }
> =20
> +static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
> +                                 const union rkisp1_ext_params_config *b=
lock)
> +{
> +       const struct rkisp1_ext_params_wdr_config *wdr =3D &block->wdr;
> +
> +       if (wdr->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
> +               rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_WDR_CTRL,
> +                                       RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
> +               return;
> +       }
> +
> +       rkisp1_wdr_config(params, &wdr->config);
> +
> +       if ((wdr->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
> +           !(params->enabled_blocks & BIT(wdr->header.type)))
> +               rkisp1_param_set_bits(params, RKISP1_CIF_ISP_WDR_CTRL,
> +                                     RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
> +}
> +
>  typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
>                              const union rkisp1_ext_params_config *config=
);
> =20
> @@ -2118,6 +2206,11 @@ static const struct rkisp1_ext_params_handler {
>                 .group          =3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
>                 .features       =3D RKISP1_FEATURE_COMPAND,
>         },
> +       [RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR] =3D {
> +               .size           =3D sizeof(struct rkisp1_ext_params_wdr_c=
onfig),
> +               .handler        =3D rkisp1_ext_params_wdr,
> +               .group          =3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +       },
>  };
> =20
>  static void rkisp1_ext_params_config(struct rkisp1_params *params,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drive=
rs/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index bf0260600a1923eebde6b5fe233daf7d427362dd..5b9de1a2c624f4ecaf451fa80=
6bb4b1c24a2cb55 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -710,6 +710,27 @@
>  #define RKISP1_CIF_ISP_COMPAND_CTRL_SOFT_RESET_FLAG    BIT(2)
>  #define RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE         BIT(3)
> =20
> +/* WDR */
> +/* ISP_WDR_CTRL */
> +#define RKISP1_CIF_ISP_WDR_CTRL_ENABLE                 BIT(0)
> +#define RKISP1_CIF_ISP_WDR_COLOR_SPACE_SELECT          BIT(1)
> +#define RKISP1_CIF_ISP_WDR_CR_MAPPING_DISABLE          BIT(2)
> +#define RKISP1_CIF_ISP_WDR_USE_IREF                    BIT(3)
> +#define RKISP1_CIF_ISP_WDR_USE_Y9_8                    BIT(4)
> +#define RKISP1_CIF_ISP_WDR_USE_RGB7_8                  BIT(5)
> +#define RKISP1_CIF_ISP_WDR_DISABLE_TRANSIENT           BIT(6)
> +#define RKISP1_CIF_ISP_WDR_RGB_FACTOR_MASK             GENMASK(11, 8)
> +#define RKISP1_CIF_ISP_WDR_RGB_FACTOR_MAX              8U
> +/* ISP_WDR_TONE_CURVE_YM */
> +#define RKISP1_CIF_ISP_WDR_TONE_CURVE_YM_MASK          GENMASK(12, 0)
> +/* ISP_WDR_OFFSET */
> +#define RKISP1_CIF_ISP_WDR_RGB_OFFSET_MASK             GENMASK(11, 0)
> +#define RKISP1_CIF_ISP_WDR_LUM_OFFSET_MASK             GENMASK(27, 16)
> +/* ISP_WDR_DELTAMIN */
> +#define RKISP1_CIF_ISP_WDR_DMIN_THRESH_MASK            GENMASK(11, 0)
> +#define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MASK          GENMASK(20, 16)
> +#define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MAX           16U
> +
>  /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
>  /*                            CIF Registers                            */
>  /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
> @@ -1302,82 +1323,12 @@
> =20
>  #define RKISP1_CIF_ISP_WDR_BASE                        0x00002a00
>  #define RKISP1_CIF_ISP_WDR_CTRL                        (RKISP1_CIF_ISP_W=
DR_BASE + 0x00000000)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_1         (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000004)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_2         (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000008)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_3         (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000000c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_4         (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000010)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_0      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000014)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_1      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000018)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_2      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000001c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_3      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000020)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_4      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000024)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_5      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000028)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_6      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000002c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_7      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000030)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_8      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000034)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_9      (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000038)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_10     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000003c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_11     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000040)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_12     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000044)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_13     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000048)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_14     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000004c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_15     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000050)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_16     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000054)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_17     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000058)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_18     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000005c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_19     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000060)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_20     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000064)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_21     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000068)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_22     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000006c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_23     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000070)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_24     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000074)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_25     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000078)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_26     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000007c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_27     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000080)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_28     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000084)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_29     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000088)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_30     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000008c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000090)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000094)
> +#define RKISP1_CIF_ISP_WDR_TONECURVE(n)                (RKISP1_CIF_ISP_W=
DR_BASE + 0x00000004 + (n) * 4)
> +#define RKISP1_CIF_ISP_WDR_TONECURVE_YM(n)     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000014 + (n) * 4)
>  #define RKISP1_CIF_ISP_WDR_OFFSET              (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000098)
>  #define RKISP1_CIF_ISP_WDR_DELTAMIN            (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000009c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_1_SHD     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000a0)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_2_SHD     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000a4)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_3_SHD     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000a8)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_4_SHD     (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000ac)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_0_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000b0)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_1_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000b4)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_2_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000b8)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_3_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000bc)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_4_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000c0)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_5_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000c4)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_6_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000c8)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_7_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000cc)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_8_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000d0)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_9_SHD  (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000d4)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_10_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000d8)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_11_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000dc)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_12_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000e0)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_13_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000e4)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_14_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000e8)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_15_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000ec)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_16_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000f0)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_17_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000f4)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_18_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000f8)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_19_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000fc)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_20_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000100)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_21_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000104)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_22_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000108)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_23_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000010c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_24_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000110)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_25_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000114)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_26_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000118)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_27_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000011c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_28_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000120)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_29_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000124)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_30_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000128)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x0000012c)
> -#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32_SHD (RKISP1_CIF_ISP_WDR_BASE =
+ 0x00000130)
> +#define RKISP1_CIF_ISP_WDR_TONECURVE_SHD(n)    (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000a0 + (n) * 4)
> +#define RKISP1_CIF_ISP_WDR_TONECURVE_YM_SHD(n) (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000b0 + (n) * 4)
> =20
>  #define RKISP1_CIF_ISP_HIST_BASE_V12           0x00002c00
>  #define RKISP1_CIF_ISP_HIST_CTRL_V12           (RKISP1_CIF_ISP_HIST_BASE=
_V12 + 0x00000000)
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkis=
p1-config.h
> index 2d995f3c1ca37820a381f1917a10bf08a304d992..59335097c01372252b296d960=
b39336dfb5ec197 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -169,6 +169,13 @@
>   */
>  #define RKISP1_CIF_ISP_COMPAND_NUM_POINTS      64
> =20
> +/*
> + * Wide Dynamic Range
> + */
> +#define RKISP1_CIF_ISP_WDR_CURVE_NUM_INTERV    32
> +#define RKISP1_CIF_ISP_WDR_CURVE_NUM_COEFF     (RKISP1_CIF_ISP_WDR_CURVE=
_NUM_INTERV + 1)
> +#define RKISP1_CIF_ISP_WDR_CURVE_NUM_DY_REGS   4
> +
>  /*
>   * Measurement types
>   */
> @@ -889,6 +896,72 @@ struct rkisp1_cif_isp_compand_curve_config {
>         __u32 y[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
>  };
> =20
> +/**
> + * struct rkisp1_cif_isp_wdr_tone_curve - Tone mapping curve definition =
for WDR.
> + *
> + * @dY: the dYn increments for horizontal (input) axis of the tone curve.
> + *      each 3-bit dY value represents an increment of 2**(value+3).
> + *      dY[0] bits 0:2 is increment dY1, bit 3 unused
> + *      dY[0] bits 4:6 is increment dY2, bit 7 unused
> + *      ...
> + *      dY[0] bits 28:30 is increment dY8, bit 31 unused
> + *      ... and so on till dY[3] bits 28:30 is increment dY32, bit 31 un=
used.
> + * @ym: the Ym values for the vertical (output) axis of the tone curve.
> + *      each value is 13 bit.
> + */
> +struct rkisp1_cif_isp_wdr_tone_curve {
> +       __u32 dY[RKISP1_CIF_ISP_WDR_CURVE_NUM_DY_REGS];
> +       __u16 ym[RKISP1_CIF_ISP_WDR_CURVE_NUM_COEFF];
> +};
> +
> +/**
> + * struct rkisp1_cif_isp_wdr_iref_config - Illumination reference config=
 for WDR.
> + *
> + * Use illumination reference value as described below, instead of only =
the
> + * luminance (Y) value for tone mapping and gain calculations:
> + * IRef =3D (rgb_factor * RGBMax_tr + (8 - rgb_factor) * Y)/8
> + *
> + * @rgb_factor: defines how much influence the RGBmax approach has in
> + *              comparison to Y (valid values are 0..8).
> + * @use_y9_8: use Y*9/8 for maximum value calculation along with the
> + *            default of R, G, B for noise reduction.
> + * @use_rgb7_8: decrease RGBMax by 7/8 for noise reduction.
> + * @disable_transient: disable transient calculation between Y and RGBY_=
max.
> + */
> +struct rkisp1_cif_isp_wdr_iref_config {
> +       __u8 rgb_factor;
> +       __u8 use_y9_8;
> +       __u8 use_rgb7_8;
> +       __u8 disable_transient;
> +};
> +
> +/**
> + * struct rkisp1_cif_isp_wdr_config - Configuration for wide dynamic ran=
ge.
> + *
> + * @tone_curve: tone mapping curve.
> + * @iref_config: illumination reference configuration. (when use_iref is=
 true)
> + * @rgb_offset: RGB offset value for RGB operation mode. (12 bits)
> + * @luma_offset: luminance offset value for RGB operation mode. (12 bits)
> + * @dmin_thresh: lower threshold for deltaMin value. (12 bits)
> + * @dmin_strength: strength factor for deltaMin. (valid range is 0x00..0=
x10)
> + * @use_rgb_colorspace: use RGB instead of luminance/chrominance colorsp=
ace.
> + * @bypass_chroma_mapping: disable chrominance mapping (only valid if
> + *                         use_rgb_colorspace =3D 0)
> + * @use_iref: use illumination reference instead of Y for tone mapping
> + *            and gain calculations.
> + */
> +struct rkisp1_cif_isp_wdr_config {
> +       struct rkisp1_cif_isp_wdr_tone_curve tone_curve;
> +       struct rkisp1_cif_isp_wdr_iref_config iref_config;
> +       __u16 rgb_offset;
> +       __u16 luma_offset;
> +       __u16 dmin_thresh;
> +       __u8 dmin_strength;
> +       __u8 use_rgb_colorspace;
> +       __u8 bypass_chroma_mapping;
> +       __u8 use_iref;
> +};
> +
>  /*---------- PART2: Measurement Statistics ------------*/
> =20
>  /**
> @@ -1059,6 +1132,7 @@ struct rkisp1_stat_buffer {
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress c=
urve
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR: Wide dynamic range
>   */
>  enum rkisp1_ext_params_block_type {
>         RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> @@ -1081,6 +1155,7 @@ enum rkisp1_ext_params_block_type {
>         RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
>         RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
>         RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
> +       RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
>  };
> =20
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE     (1U << 0)
> @@ -1460,6 +1535,23 @@ struct rkisp1_ext_params_compand_curve_config {
>         struct rkisp1_cif_isp_compand_curve_config config;
>  } __attribute__((aligned(8)));
> =20
> +/**
> + * struct rkisp1_ext_params_wdr_config - RkISP1 extensible params
> + *                                       Wide dynamic range config
> + *
> + * RkISP1 extensible parameters WDR block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR`
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *         :c:type:`rkisp1_ext_params_block_header`
> + * @config: WDR configuration, see
> + *         :c:type:`rkisp1_cif_isp_wdr_config`
> + */
> +struct rkisp1_ext_params_wdr_config {
> +       struct rkisp1_ext_params_block_header header;
> +       struct rkisp1_cif_isp_wdr_config config;
> +} __attribute__((aligned(8)));
> +
>  /*
>   * The rkisp1_ext_params_compand_curve_config structure is counted twice=
 as it
>   * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block types.
>=20
> --=20
> 2.49.0
>=20
>

