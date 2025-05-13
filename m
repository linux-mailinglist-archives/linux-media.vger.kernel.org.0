Return-Path: <linux-media+bounces-32381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7716AAB5493
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 14:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2A741B448FF
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 12:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3073D28DB48;
	Tue, 13 May 2025 12:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KgjEvzaQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89DB660;
	Tue, 13 May 2025 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138682; cv=none; b=f0/Gico/gPXZLcHuyv5i/f0YQqTgqzwXrk1evlZ+n/cJlAC13iDbESXsYnrPaMOiRxPAqMHAlOr2qsLJXyEq94CN92J3kOFZdxURjF7pVqHvh6QWuR3qKtS/svSqiQq5QPC8Zw0D2fWZlF9L4c8LuTLvdmFf7uLgCb0jVbU4Sbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138682; c=relaxed/simple;
	bh=kzUWnm5ALMAwiGJXtgFTFVyyqRwLilHLYr1CvPvTAMk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rDIhd5txZsTv+RjufFWcCZ0sp++yFdpHTAslez75ZBRXYIlmYLriEJFXpdj9tMkmufjbxT6cg5WBweBLGxUYeFXYCi0FkbkWNolgMO+96ny9OMvUwa/3sNQ/J89uscXjzciUW+kXedPbUDjPT8T8QszGWgFDv+e+PhCQqNRvPjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KgjEvzaQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (unknown [IPv6:2001:861:3a80:3300:4f2f:8c2c:b3ef:17d4])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEE634C9;
	Tue, 13 May 2025 14:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747138661;
	bh=kzUWnm5ALMAwiGJXtgFTFVyyqRwLilHLYr1CvPvTAMk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KgjEvzaQR0fe/RctGqjCBZ3AbQyRFjNRcXnh9BXfD0QXQLnYyZ0eTJGTLEJiMXAiT
	 eh9MtRGIKwDvEt4wKNTpvylC/C3nOVo44il/WAPmXqNu0PsW3W/trsFG11DiNqzixQ
	 QgFTrxP8Tx5HDI+lACBsIgCOYzUysAyJ1OPjbO8c=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250429-awb64-v5-2-2dc3163a8cfc@ideasonboard.com>
References: <20250429-awb64-v5-0-2dc3163a8cfc@ideasonboard.com> <20250429-awb64-v5-2-2dc3163a8cfc@ideasonboard.com>
Subject: Re: [PATCH v5 2/2] media: rockchip: rkisp1: Add support for AWB64
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Klug <stefan.klug@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Jai Luthra <jai.luthra@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Tue, 13 May 2025 14:17:54 +0200
Message-ID: <174713867465.233090.3756392787659343803@pyrite.rasen.tech>
User-Agent: alot/0.0.0

Hi Jai,

Thanks for the patch.

Quoting Jai Luthra (2025-04-29 13:41:54)
> AWB64 is an advanced auto white-balance statistics block, present on the
> ISP in iMX8MP. This block can calculate color statistics for a maximum
> of 8 different (elliptical) regions, which can help the AWB algorithm in
> calculating gains for complex lighting scenarios.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v5:
> - No updates
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +
>  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   3 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 123 +++++++++++++++=
++++++
>  .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  41 +++++++
>  .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  40 +++++++
>  include/uapi/linux/rkisp1-config.h                 | 107 +++++++++++++++=
+++
>  6 files changed, 315 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829ba7d923ad42fec92840ccd422b6e5..60fbf5a886c498957ba04ddd4=
7a21b744d4ff8b1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -118,6 +118,7 @@ enum rkisp1_isp_pad {
>   * @RKISP1_FEATURE_DMA_34BIT: The ISP uses 34-bit DMA addresses
>   * @RKISP1_FEATURE_BLS: The ISP has a dedicated BLS block
>   * @RKISP1_FEATURE_COMPAND: The ISP has a companding block
> + * @RKISP1_FEATURE_AWB64: The ISP has an AWB64 block
>   *
>   * The ISP features are stored in a bitmask in &rkisp1_info.features and=
 allow
>   * the driver to implement support for features present in some ISP vers=
ions
> @@ -131,6 +132,7 @@ enum rkisp1_feature {
>         RKISP1_FEATURE_DMA_34BIT =3D BIT(4),
>         RKISP1_FEATURE_BLS =3D BIT(5),
>         RKISP1_FEATURE_COMPAND =3D BIT(6),
> +       RKISP1_FEATURE_AWB64 =3D BIT(7),
>  };
> =20
>  #define rkisp1_has_feature(rkisp1, feature) \
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/driver=
s/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index dc65a7924f8ae6f95e7c93c4339619cd90881a62..576ed26e013add281b6d1ad40=
1ba91c5c4128e76 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -560,7 +560,8 @@ static const struct rkisp1_info imx8mp_isp_info =3D {
>         .isp_ver =3D RKISP1_V_IMX8MP,
>         .features =3D RKISP1_FEATURE_MAIN_STRIDE
>                   | RKISP1_FEATURE_DMA_34BIT
> -                 | RKISP1_FEATURE_COMPAND,
> +                 | RKISP1_FEATURE_COMPAND
> +                 | RKISP1_FEATURE_AWB64,
>         .max_width =3D 4096,
>         .max_height =3D 3072,
>  };
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index dc8e827e9464117877afe679611c528b4126172f..4305f8cefa754825a07924834=
8a218386c3df913 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -62,6 +62,7 @@ union rkisp1_ext_params_config {
>         struct rkisp1_ext_params_compand_bls_config compand_bls;
>         struct rkisp1_ext_params_compand_curve_config compand_curve;
>         struct rkisp1_ext_params_wdr_config wdr;
> +       struct rkisp1_ext_params_awb64_meas_config awb64;
>  };
> =20
>  enum rkisp1_params_formats {
> @@ -676,6 +677,105 @@ rkisp1_awb_meas_enable_v12(struct rkisp1_params *pa=
rams,
>         }
>  }
> =20
> +/* ISP White Balance Mode */
> +static void
> +rkisp1_awb64_meas_config(struct rkisp1_params *params,
> +                        const struct rkisp1_cif_isp_awb64_meas_config *a=
rg)
> +{
> +       u32 reg_val =3D
> +               rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MOD=
E);
> +
> +       /* Measurement mode */
> +       if (arg->enable_median_filter)
> +               reg_val |=3D RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN;
> +       else
> +               reg_val &=3D ~RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN;
> +
> +       if (arg->chrom_switch)
> +               reg_val |=3D RKISP1_CIF_ISP_AWB64_CHROM_SWITCH;
> +       else
> +               reg_val &=3D ~RKISP1_CIF_ISP_AWB64_CHROM_SWITCH;
> +
> +       reg_val |=3D (arg->ellip_unite & RKISP1_CIF_ISP_AWB64_UNITE_MASK)
> +                  << RKISP1_CIF_ISP_AWB64_UNITE_SHIFT;
> +
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE,
> +                    reg_val);
> +
> +       /* Measurement window */
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_OFFS,
> +                    arg->awb_wnd.v_offs);
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_H_OFFS,
> +                    arg->awb_wnd.h_offs);
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_SIZE,
> +                    arg->awb_wnd.v_size);
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_H_SIZE,
> +                    arg->awb_wnd.h_size);
> +
> +       /* RGB thresholds for measurement */
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_R_MIN_MAX,
> +                    arg->min_max_r);
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_G_MIN_MAX,
> +                    arg->min_max_g);
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_B_MIN_MAX,
> +                    arg->min_max_b);
> +
> +       /* Minimum input divider threshold */
> +       rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MIN_DIVIDER,
> +                    arg->min_div & RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK);
> +
> +       /* Colorspace matrix coefficients */
> +       for (int i =3D 0; i < 3; i++) {
> +               for (int j =3D 0; j < 3; j++)
> +                       rkisp1_write(params->rkisp1,
> +                                    RKISP1_CIF_ISP_AWB64_CC_COEFF(i * 3 =
+ j),
> +                                    arg->cc_coeff[i][j]);
> +       }
> +
> +       /* Ellipse configuration */
> +       for (int i =3D 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
> +               const struct rkisp1_cif_isp_awb64_ellip *ellip =3D &arg->=
ellip[i];
> +
> +               /* Center */
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_C=
EN_X(i),
> +                            ellip->cen_x & RKISP1_CIF_ISP_AWB64_ELLIP_CE=
N_MASK);
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_C=
EN_Y(i),
> +                            ellip->cen_y & RKISP1_CIF_ISP_AWB64_ELLIP_CE=
N_MASK);
> +               /* Radius */
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_R=
MAX(i),
> +                            ellip->rmax & RKISP1_CIF_ISP_AWB64_ELLIP_RMA=
X_MASK);
> +               /* CTM */
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_A=
1(i),
> +                            ellip->ctm[0] &
> +                                    RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MAS=
K);
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_A=
2(i),
> +                            ellip->ctm[1] &
> +                                    RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MAS=
K);
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_A=
3(i),
> +                            ellip->ctm[2] &
> +                                    RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MAS=
K);
> +               rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_ELLIP_A=
4(i),
> +                            ellip->ctm[3] &
> +                                    RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MAS=
K);
> +       }
> +}
> +
> +static void
> +rkisp1_awb64_meas_enable(struct rkisp1_params *params,
> +                        const struct rkisp1_cif_isp_awb64_meas_config *a=
rg,

arg looks unused.

> +                        bool en)
> +{
> +       if (en) {
> +               rkisp1_param_set_bits(params, RKISP1_CIF_ISP_AWB64_MEAS_M=
ODE,
> +                                     RKISP1_CIF_ISP_AWB64_MEAS_EN |
> +                                             RKISP1_CIF_ISP_AWB64_IRQ_EN=
);
> +       } else {
> +               rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_AWB64_MEAS=
_MODE,
> +                                       RKISP1_CIF_ISP_AWB64_MEAS_EN |
> +                                               RKISP1_CIF_ISP_AWB64_IRQ_=
EN);
> +       }
> +}
> +
>  static void
>  rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
>                            const struct rkisp1_cif_isp_awb_gain_config *a=
rg)
> @@ -2093,6 +2193,23 @@ static void rkisp1_ext_params_wdr(struct rkisp1_pa=
rams *params,
>                                       RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
>  }
> =20
> +static void rkisp1_ext_params_awb64(struct rkisp1_params *params,
> +                                   const union rkisp1_ext_params_config =
*block)
> +{
> +       const struct rkisp1_ext_params_awb64_meas_config *awb64 =3D &bloc=
k->awb64;
> +
> +       if (awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
> +               rkisp1_awb64_meas_enable(params, &awb64->config, false);
> +               return;
> +       }
> +
> +       rkisp1_awb64_meas_config(params, &awb64->config);
> +
> +       if ((awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
> +           !(params->enabled_blocks & BIT(awb64->header.type)))
> +               rkisp1_awb64_meas_enable(params, &awb64->config, true);
> +}
> +
>  typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
>                              const union rkisp1_ext_params_config *config=
);
> =20
> @@ -2211,6 +2328,12 @@ static const struct rkisp1_ext_params_handler {
>                 .handler        =3D rkisp1_ext_params_wdr,
>                 .group          =3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
>         },
> +       [RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS] =3D {
> +               .size           =3D sizeof(struct rkisp1_ext_params_awb64=
_meas_config),
> +               .handler        =3D rkisp1_ext_params_awb64,
> +               .group          =3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +               .features       =3D RKISP1_FEATURE_AWB64,
> +       },
>  };
> =20
>  static void rkisp1_ext_params_config(struct rkisp1_params *params,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drive=
rs/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index 5b9de1a2c624f4ecaf451fa806bb4b1c24a2cb55..6f28d0f65edfb14e9e1ad0de3=
e8e718f07aeed80 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -516,6 +516,24 @@
>  #define RKISP1_CIF_ISP_AWB_CBCR_MAX_REF                        0x000000ff
>  #define RKISP1_CIF_ISP_AWB_THRES_MAX_YC                        0x000000ff
> =20
> +/* AWB64 */
> +/* ISP_AWB64_WHITE_CNT */
> +#define RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(x)          ((x) & 0xffffff)
> +/* ISP_AWB64_MEAS_MODE */
> +#define RKISP1_CIF_ISP_AWB64_MEAS_EN                   BIT(0)
> +#define RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN             BIT(1)
> +#define RKISP1_CIF_ISP_AWB64_IRQ_EN                    BIT(2)
> +#define RKISP1_CIF_ISP_AWB64_CHROM_SWITCH              BIT(3)
> +#define RKISP1_CIF_ISP_AWB64_UNITE_MASK                        GENMASK(5=
, 0)
> +#define RKISP1_CIF_ISP_AWB64_UNITE_SHIFT               4
> +/* ISP_AWB64_DIVIDER_MIN */
> +#define RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK              GENMASK(9, 0)
> +/* ISP_AWB64_ELLIP */
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK            GENMASK(9, 0)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK          GENMASK(11, 0)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK          GENMASK(8, 0)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_RMAX_MASK           GENMASK(23, 0)
> +
>  /* AE */
>  /* ISP_EXP_CTRL */
>  #define RKISP1_CIF_ISP_EXP_ENA                         BIT(0)
> @@ -1330,6 +1348,29 @@
>  #define RKISP1_CIF_ISP_WDR_TONECURVE_SHD(n)    (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000a0 + (n) * 4)
>  #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_SHD(n) (RKISP1_CIF_ISP_WDR_BASE =
+ 0x000000b0 + (n) * 4)
> =20
> +#define RKISP1_CIF_ISP_AWB64_BASE              0x00002c00
> +#define RKISP1_CIF_ISP_AWB64_MEAS_MODE         (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_H_OFFS            (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000004)
> +#define RKISP1_CIF_ISP_AWB64_V_OFFS            (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000008)
> +#define RKISP1_CIF_ISP_AWB64_H_SIZE            (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x0000000c)
> +#define RKISP1_CIF_ISP_AWB64_V_SIZE            (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000010)
> +#define RKISP1_CIF_ISP_AWB64_R_MIN_MAX         (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000014)
> +#define RKISP1_CIF_ISP_AWB64_G_MIN_MAX         (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000018)
> +#define RKISP1_CIF_ISP_AWB64_B_MIN_MAX         (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x0000001c)
> +#define RKISP1_CIF_ISP_AWB64_MIN_DIVIDER       (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000020)
> +#define RKISP1_CIF_ISP_AWB64_CC_COEFF(n)       (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000024 + (n) * 4)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_X(n)    (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000048 + (n) * 8)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_Y(n)    (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x0000004c + (n) * 8)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A1(n)       (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000088 + (n) * 16)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A2(n)       (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x0000008c + (n) * 16)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A3(n)       (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000090 + (n) * 16)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A4(n)       (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000094 + (n) * 16)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_RMAX(n)     (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000108 + (n) * 4)
> +#define RKISP1_CIF_ISP_AWB64_WHITE_CNT(n)      (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000128 + (n) * 4)
> +#define RKISP1_CIF_ISP_AWB64_R_ACCU(n)         (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000148 + (n) * 12)
> +#define RKISP1_CIF_ISP_AWB64_G_ACCU(n)         (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x0000014c + (n) * 12)
> +#define RKISP1_CIF_ISP_AWB64_B_ACCU(n)         (RKISP1_CIF_ISP_AWB64_BAS=
E + 0x00000150 + (n) * 12)
> +
>  #define RKISP1_CIF_ISP_HIST_BASE_V12           0x00002c00
>  #define RKISP1_CIF_ISP_HIST_CTRL_V12           (RKISP1_CIF_ISP_HIST_BASE=
_V12 + 0x00000000)
>  #define RKISP1_CIF_ISP_HIST_SIZE_V12           (RKISP1_CIF_ISP_HIST_BASE=
_V12 + 0x00000004)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/driv=
ers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index d5fdb8f82dc78b0143f71d76f36817db389921b7..de2571ac4c162a770b987e4ad=
a469d2e8953ff7c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -214,6 +214,38 @@ static void rkisp1_stats_get_awb_meas_v12(struct rki=
sp1_stats *stats,
>                                 RKISP1_CIF_ISP_AWB_GET_MEAN_Y_G(reg_val);
>  }
> =20
> +static void rkisp1_stats_get_awb64_meas_imx8mp(struct rkisp1_stats *stat=
s,
> +                                              struct rkisp1_stat_buffer =
*pbuf)
> +{
> +       struct rkisp1_device *rkisp1 =3D stats->rkisp1;
> +       u32 white_cnt;
> +
> +       pbuf->meas_type |=3D RKISP1_CIF_ISP_STAT_AWB64;
> +
> +       for (unsigned int i =3D 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; =
i++) {
> +               struct rkisp1_cif_isp_awb64_meas *count =3D
> +                       &pbuf->params.awb64.count[i];
> +
> +               white_cnt =3D rkisp1_read(rkisp1,
> +                                       RKISP1_CIF_ISP_AWB64_WHITE_CNT(i)=
);
> +               count->cnt =3D RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(white_c=
nt);
> +
> +               count->accu_r =3D
> +                       rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_R_ACCU(i=
));
> +               count->accu_g =3D
> +                       rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_G_ACCU(i=
));
> +               count->accu_b =3D
> +                       rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_B_ACCU(i=
));
> +       }
> +}
> +
> +static void rkisp1_stats_get_awb_meas_imx8mp(struct rkisp1_stats *stats,
> +                                            struct rkisp1_stat_buffer *p=
buf)
> +{
> +       rkisp1_stats_get_awb_meas_v10(stats, pbuf);
> +       rkisp1_stats_get_awb64_meas_imx8mp(stats, pbuf);
> +}
> +
>  static void rkisp1_stats_get_aec_meas_v10(struct rkisp1_stats *stats,
>                                           struct rkisp1_stat_buffer *pbuf)
>  {
> @@ -335,6 +367,12 @@ static struct rkisp1_stats_ops rkisp1_v12_stats_ops =
=3D {
>         .get_hst_meas =3D rkisp1_stats_get_hst_meas_v12,
>  };
> =20
> +static const struct rkisp1_stats_ops rkisp1_imx8mp_stats_ops =3D {
> +       .get_awb_meas =3D rkisp1_stats_get_awb_meas_imx8mp,
> +       .get_aec_meas =3D rkisp1_stats_get_aec_meas_v10,
> +       .get_hst_meas =3D rkisp1_stats_get_hst_meas_v10,
> +};
> +
>  static void
>  rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>  {
> @@ -404,6 +442,8 @@ static void rkisp1_init_stats(struct rkisp1_stats *st=
ats)
> =20
>         if (stats->rkisp1->info->isp_ver =3D=3D RKISP1_V12)
>                 stats->ops =3D &rkisp1_v12_stats_ops;
> +       else if (stats->rkisp1->info->isp_ver =3D=3D RKISP1_V_IMX8MP)
> +               stats->ops =3D &rkisp1_imx8mp_stats_ops;
>         else
>                 stats->ops =3D &rkisp1_v10_stats_ops;
>  }
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkis=
p1-config.h
> index 59335097c01372252b296d960b39336dfb5ec197..3e34f1d0d6a20807cabaeee0c=
2259e407023d4cd 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -88,6 +88,11 @@
>  #define RKISP1_CIF_ISP_AWB_MAX_GRID                1
>  #define RKISP1_CIF_ISP_AWB_MAX_FRAMES              7
> =20
> +/*
> + * Automatic white balance extended block (AWB64)
> + */
> +#define RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE           8
> +
>  /*
>   * Gamma out
>   */
> @@ -183,6 +188,7 @@
>  #define RKISP1_CIF_ISP_STAT_AUTOEXP       (1U << 1)
>  #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
>  #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
> +#define RKISP1_CIF_ISP_STAT_AWB64         (1U << 4)
> =20
>  /**
>   * enum rkisp1_cif_isp_version - ISP variants
> @@ -526,6 +532,61 @@ struct rkisp1_cif_isp_awb_gain_config {
>         __u16 gain_green_b;
>  };
> =20
> +/**
> + * struct rkisp1_cif_isp_awb64_ellip - Ellipse configuration for AWB64 m=
easurement
> + *
> + * @rmax: Points within rmax (24-bit) squared distance from center are
> + *        considered for white point calculations
> + * @cen_x: X coordinate of the center of ellipse, 10-bit signed fixed-po=
int
> + *         number with 9 bits fractional part
> + * @cen_y: Y coordinate of the center of ellipse, 10-bit signed fixed-po=
int
> + *         number with 9 bits fractional part
> + * @ctm: Coordinate transformation matrix,
> + *       ctm[0] and ctm[2] are 12-bit signed fixed-point with 8-bit frac=
tional
> + *       part ranging from -8 (0x800) to 7.996 (0x7ff),
> + *       ctm[1] and ctm[3] are 9-bit signed fixed-point with 8-bit fract=
ional
> + *       part ranging from -1 (0x100) to 0.996 (0x0ff)
> + */
> +struct rkisp1_cif_isp_awb64_ellip {
> +       __u32 rmax;
> +       __u16 cen_x;
> +       __u16 cen_y;
> +       __u16 ctm[4];
> +};
> +
> +/**
> + * struct rkisp1_cif_isp_awb64_meas_config - Configuration for the AWB64=
 stats
> + *
> + * @awb_wnd: White balance measurement window (in pixels)
> + * @ellip: Ellipse regions used for measurement
> + * @cc_coeff: Colorspace matrix (all coefficient values are 11-bit)
> + * @min_div: Minimum divider, if input is less than this don't do divisi=
on
> + *           (unsigned 10-bit fixed-point value with 10 fractional bits)
> + * @min_max_r: Only pixels with min_r < R < max_r contribute to measurem=
ent,
> + *             bits 0:7 are min_r and bits 8:15 are max_r
> + * @min_max_g: Only pixels with min_g < G < max_g contribute to measurem=
ent,
> + *             bits 0:7 are min_g and bits 8:15 are max_g
> + * @min_max_b: Only pixels with min_b < B < max_b contribute to measurem=
ent,
> + *             bits 0:7 are min_b and bits 8:15 are max_b
> + * @enable_median_filter: Enable median filter before AWB measurement
> + * @ellip_unite: Bitmask to select which regions should be combined for =
measurement,
> + *               bits 0:2 to combine ellipse 0 with ellipse 1,2,3 and

I think adding "respectively" here would make it a bit clearer.

"bits 0:2 to combine ellipse 0 with ellipse 1,2,3 respectively and"

> + *               bits 3:5 to combine ellipse 4 with ellipse 5,6,7

Same here.


Otherwise, looks good.

Paul

> + * @chrom_switch: Accumulate Q1, Q2 chromaticities instead of R, G, B
> + */
> +struct rkisp1_cif_isp_awb64_meas_config {
> +       struct rkisp1_cif_isp_window awb_wnd;
> +       struct rkisp1_cif_isp_awb64_ellip ellip[RKISP1_CIF_ISP_AWB64_MAX_=
ELLIPSE];
> +       __u16 cc_coeff[3][3];
> +       __u16 min_div;
> +       __u16 min_max_r;
> +       __u16 min_max_g;
> +       __u16 min_max_b;
> +       __u8 enable_median_filter;
> +       __u8 ellip_unite;
> +       __u8 chrom_switch;
> +};
> +
>  /**
>   * struct rkisp1_cif_isp_flt_config - Configuration used by ISP filtering
>   *
> @@ -1079,6 +1140,31 @@ struct rkisp1_cif_isp_hist_stat {
>         __u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>  };
> =20
> +/**
> + * struct rkisp1_cif_isp_awb64_meas - AWB64 measured values
> + *
> + * @cnt: White pixel count, number of "white pixels" found during last
> + *      measurement
> + * @accu_r: Total value of Red within elliptical region
> + * @accu_g: Total value of Green within elliptical region
> + * @accu_b: Total value of Blue within elliptical region
> + */
> +struct rkisp1_cif_isp_awb64_meas {
> +       __u32 cnt;
> +       __u32 accu_r;
> +       __u32 accu_g;
> +       __u32 accu_b;
> +};
> +
> +/**
> + * struct rkisp1_cif_isp_awb64_stat - statistics AWB64 data
> + *
> + * @count: Measured pixel accumulator data for elliptical regions
> + */
> +struct rkisp1_cif_isp_awb64_stat {
> +       struct rkisp1_cif_isp_awb64_meas count[RKISP1_CIF_ISP_AWB64_MAX_E=
LLIPSE];
> +};
> +
>  /**
>   * struct rkisp1_cif_isp_stat - Rockchip ISP1 Statistics Data
>   *
> @@ -1086,12 +1172,14 @@ struct rkisp1_cif_isp_hist_stat {
>   * @ae: statistics data for auto exposure
>   * @af: statistics data for auto focus
>   * @hist: statistics histogram data
> + * @awb64: statistics data for automatic white balance 64
>   */
>  struct rkisp1_cif_isp_stat {
>         struct rkisp1_cif_isp_awb_stat awb;
>         struct rkisp1_cif_isp_ae_stat ae;
>         struct rkisp1_cif_isp_af_stat af;
>         struct rkisp1_cif_isp_hist_stat hist;
> +       struct rkisp1_cif_isp_awb64_stat awb64;
>  };
> =20
>  /**
> @@ -1133,6 +1221,7 @@ struct rkisp1_stat_buffer {
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress c=
urve
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR: Wide dynamic range
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS: Auto white balance 64 stati=
stics
>   */
>  enum rkisp1_ext_params_block_type {
>         RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> @@ -1156,6 +1245,7 @@ enum rkisp1_ext_params_block_type {
>         RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
>         RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
>         RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
> +       RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS,
>  };
> =20
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE     (1U << 0)
> @@ -1451,6 +1541,23 @@ struct rkisp1_ext_params_awb_meas_config {
>         struct rkisp1_cif_isp_awb_meas_config config;
>  } __attribute__((aligned(8)));
> =20
> +/**
> + * struct rkisp1_ext_params_awb64_meas_config - RkISP1 extensible params=
 AWB64
> + *                                             Meas config
> + *
> + * RkISP1 extensible parameters Auto-White Balance 64 Measurement config=
uration
> + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS=
`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *         :c:type:`rkisp1_ext_params_block_header`
> + * @config: Auto-White Balance 64 measure configuration, see
> + *         :c:type:`rkisp1_cif_isp_awb64_meas_config`
> + */
> +struct rkisp1_ext_params_awb64_meas_config {
> +       struct rkisp1_ext_params_block_header header;
> +       struct rkisp1_cif_isp_awb64_meas_config config;
> +} __attribute__((aligned(8)));
> +
>  /**
>   * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histog=
ram config
>   *
>=20
> --=20
> 2.49.0
>=20
>

