Return-Path: <linux-media+bounces-14665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64320927E16
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 22:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16FA4285744
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 20:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197E613CFB9;
	Thu,  4 Jul 2024 20:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RgYBQU3h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8C481A5
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720123429; cv=none; b=GlL20j0VjoQ51ALRSq0ckCxKsktrFgCwfPTfEvdO6va8cwnyzFWsH6ebXLcQ1Mo7+Jg9/dpzTLn42sN3AWPUrRuUnN5r7C5eLnFZhHN0boNXFitCn7fgiJQkQOXjPsrBBB05RDihSQwyYz530WOO5AGa7iB9Idr6dEFo2Gl5n0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720123429; c=relaxed/simple;
	bh=573QHhK6H/aeda8M/b7k68o+eH26LQSp9+xVvL7DRGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vd8VXafLI0sg0Qy091gDUq1vSv81+N78DoSjddjPQYTSEnuqWxLRN3mQXZO98ox1SbaqbJcsrTNZfnaGixC00nnu2KMtKcSRuBrFDDTV5vtnonQ/OabgIiPzdoFWgC9QGfa6ndX7O4XqF/1xlpQ1yKO+q5gWFMaO/0dRbQViEkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RgYBQU3h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-52-146.net.vodafone.it [5.90.52.146])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43C2D502;
	Thu,  4 Jul 2024 22:03:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720123396;
	bh=573QHhK6H/aeda8M/b7k68o+eH26LQSp9+xVvL7DRGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RgYBQU3hd2Tz+ZXsrRoUe1dIt50/4BvqHD+y7TFNPrZCuidq33Qqj7QR02lp/GYc6
	 pMQ+SR4vrGETLl5E/npGUGAM0JX0zMZdFqbdJPyTI44vqJD9XfY+OexwH51dz04kab
	 h/l2zSpvHvQPEM6SdzLN5zOofo1ityv5dDVUVllk=
Date: Thu, 4 Jul 2024 22:03:41 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 5/5] media: rkisp1: Add support for the companding
 block
Message-ID: <7fy5ax6ndarv55gkkhs7yy4ejs7fwopz3wej67lgersnr47d4q@m7ue6f2gucbq>
References: <20240704154932.6686-1-laurent.pinchart@ideasonboard.com>
 <20240704154932.6686-6-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240704154932.6686-6-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Thu, Jul 04, 2024 at 06:49:32PM GMT, Laurent Pinchart wrote:
> From: Paul Elder <paul.elder@ideasonboard.com>
>
> Add support to the rkisp1 driver for the companding block that exists on
> the i.MX8MP version of the ISP. This requires usage of the new
> extensible parameters format, and showcases how the format allows for
> extensions without breaking backward compatibility.
>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> ---
> Changes since v1:
>
> - Refactor rkisp1_compand_write_px_curve()
> - Use unsigned int instead of size_t for loop indices
> - Hardcode RKISP1_CIF_ISP_COMPAND_NUM_POINTS points
> - Rename RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES to
>   RKISP1_CIF_ISP_COMPAND_NUM_POINTS
> - Add comment to explain why rkisp1_ext_params_compand_curve_config is
>   counted twice in RKISP1_EXT_PARAMS_MAX_SIZE
> - Fix typo
>
> Changes since v0:
>
> - Drop RKISP1_EXT_PARAM_BUFFER_V2
> - Use common structure for compression and expansion curves
> - Rename config fields in rkisp1_ext_params_*_config to just config
> - Mention block type in structures documentation
> - Constify arguments
> - Replace __uxx types with uxx
> - Use rkisp1_bls_swap_regs() helper in rkisp1_compand_bls_config()
> - Use generic feature handling mechanism
> ---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 168 ++++++++++++++++++
>  include/uapi/linux/rkisp1-config.h            |  89 +++++++++-
>  2 files changed, 256 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 20bc6d582527..430d36aedd76 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
>   */
>
> +#include <linux/math.h>
>  #include <linux/string.h>
>
>  #include <media/v4l2-common.h>
> @@ -57,6 +58,8 @@ union rkisp1_ext_params_config {
>  	struct rkisp1_ext_params_hst_config hst;
>  	struct rkisp1_ext_params_aec_config aec;
>  	struct rkisp1_ext_params_afc_config afc;
> +	struct rkisp1_ext_params_compand_bls_config compand_bls;
> +	struct rkisp1_ext_params_compand_curve_config compand_curve;
>  };
>
>  enum rkisp1_params_formats {
> @@ -1258,6 +1261,93 @@ rkisp1_dpf_strength_config(struct rkisp1_params *params,
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_STRENGTH_R, arg->r);
>  }
>
> +static void rkisp1_compand_write_px_curve(struct rkisp1_params *params,
> +					  unsigned int addr, const u8 *curve)
> +{
> +	const unsigned int points_per_reg = 6;
> +	const unsigned int num_regs =
> +		DIV_ROUND_UP(RKISP1_CIF_ISP_COMPAND_NUM_POINTS,
> +			     points_per_reg);
> +
> +	/*
> +	 * The compand curve is specified as a piecewise linear function with
> +	 * 64 points. X coordinates are stored as a log2 of the displacement
> +	 * from the previous point, in 5 bits, with 6 values per register. The
> +	 * last register stores 4 values.
> +	 */
> +	for (unsigned int reg = 0; reg < num_regs; ++reg) {
> +		unsigned int num_points =
> +			min(RKISP1_CIF_ISP_COMPAND_NUM_POINTS -
> +			    reg * points_per_reg, points_per_reg);
> +		u32 val = 0;
> +
> +		for (unsigned int i = 0; i < num_points; i++)
> +			val |= (*curve++ & 0x1f) << (i * 5);
> +
> +		rkisp1_write(params->rkisp1, addr, val);
> +		addr += 4;
> +	}
> +}
> +
> +static void
> +rkisp1_compand_write_curve_mem(struct rkisp1_params *params,
> +			       unsigned int reg_addr, unsigned int reg_data,
> +			       const u32 curve[RKISP1_CIF_ISP_COMPAND_NUM_POINTS])
> +{
> +	for (unsigned int i = 0; i < RKISP1_CIF_ISP_COMPAND_NUM_POINTS; i++) {
> +		rkisp1_write(params->rkisp1, reg_addr, i);
> +		rkisp1_write(params->rkisp1, reg_data, curve[i]);
> +	}
> +}
> +
> +static void
> +rkisp1_compand_bls_config(struct rkisp1_params *params,
> +			  const struct rkisp1_cif_isp_compand_bls_config *arg)
> +{
> +	static const u32 regs[] = {
> +		RKISP1_CIF_ISP_COMPAND_BLS_A_FIXED,
> +		RKISP1_CIF_ISP_COMPAND_BLS_B_FIXED,
> +		RKISP1_CIF_ISP_COMPAND_BLS_C_FIXED,
> +		RKISP1_CIF_ISP_COMPAND_BLS_D_FIXED,
> +	};
> +	u32 swapped[4];
> +
> +	rkisp1_bls_swap_regs(params->raw_type, regs, swapped);
> +
> +	rkisp1_write(params->rkisp1, swapped[0], arg->r);
> +	rkisp1_write(params->rkisp1, swapped[1], arg->gr);
> +	rkisp1_write(params->rkisp1, swapped[2], arg->gb);
> +	rkisp1_write(params->rkisp1, swapped[3], arg->b);
> +}
> +
> +static void
> +rkisp1_compand_expand_config(struct rkisp1_params *params,
> +			     const struct rkisp1_cif_isp_compand_curve_config *arg)
> +{
> +	rkisp1_compand_write_px_curve(params, RKISP1_CIF_ISP_COMPAND_EXPAND_PX_N(0),
> +				      arg->px);
> +	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXPAND_Y_ADDR,
> +				       RKISP1_CIF_ISP_COMPAND_EXPAND_Y_WRITE_DATA,
> +				       arg->y);
> +	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXPAND_X_ADDR,
> +				       RKISP1_CIF_ISP_COMPAND_EXPAND_X_WRITE_DATA,
> +				       arg->x);
> +}
> +
> +static void
> +rkisp1_compand_compress_config(struct rkisp1_params *params,
> +			       const struct rkisp1_cif_isp_compand_curve_config *arg)
> +{
> +	rkisp1_compand_write_px_curve(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_PX_N(0),
> +				      arg->px);
> +	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_ADDR,
> +				       RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_WRITE_DATA,
> +				       arg->y);
> +	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_X_ADDR,
> +				       RKISP1_CIF_ISP_COMPAND_COMPRESS_X_WRITE_DATA,
> +				       arg->x);
> +}
> +
>  static void
>  rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  			    const struct rkisp1_params_cfg *new_params)
> @@ -1844,6 +1934,66 @@ rkisp1_ext_params_afcm(struct rkisp1_params *params,
>  				      RKISP1_CIF_ISP_AFM_ENA);
>  }
>
> +static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params,
> +					  const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_compand_bls_config *bls =
> +		&block->compand_bls;
> +
> +	if (bls->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> +					RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
> +		return;
> +	}
> +
> +	rkisp1_compand_bls_config(params, &bls->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> +				      RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
> +}
> +
> +static void rkisp1_ext_params_compand_expand(struct rkisp1_params *params,
> +					     const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_compand_curve_config *curve =
> +		&block->compand_curve;
> +
> +	if (curve->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> +					RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
> +		return;
> +	}
> +
> +	rkisp1_compand_expand_config(params, &curve->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> +				      RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
> +}
> +
> +static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
> +					       const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_compand_curve_config *curve =
> +		&block->compand_curve;
> +
> +	if (curve->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> +					RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
> +		return;
> +	}
> +
> +	rkisp1_compand_compress_config(params, &curve->config);
> +
> +	if (!(params->enabled_blocks &
> +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> +				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
> +}
> +
>  typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
>  			     const union rkisp1_ext_params_config *config);
>
> @@ -1939,6 +2089,24 @@ static const struct rkisp1_ext_params_handler {
>  		.handler	= rkisp1_ext_params_afcm,
>  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
>  	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_compand_bls_config),
> +		.handler	= rkisp1_ext_params_compand_bls,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +		.features	= RKISP1_FEATURE_COMPAND,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
> +		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
> +		.handler	= rkisp1_ext_params_compand_expand,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +		.features	= RKISP1_FEATURE_COMPAND,
> +	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
> +		.handler	= rkisp1_ext_params_compand_compress,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +		.features	= RKISP1_FEATURE_COMPAND,
> +	},
>  };
>
>  static void rkisp1_ext_params_config(struct rkisp1_params *params,
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 00b09c92cca7..c645db36f2f6 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -164,6 +164,11 @@
>  #define RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS      17
>  #define RKISP1_CIF_ISP_DPF_MAX_SPATIAL_COEFFS  6
>
> +/*
> + * Compand
> + */
> +#define RKISP1_CIF_ISP_COMPAND_NUM_POINTS	64
> +
>  /*
>   * Measurement types
>   */
> @@ -851,6 +856,39 @@ struct rkisp1_params_cfg {
>  	struct rkisp1_cif_isp_isp_other_cfg others;
>  };
>
> +/**
> + * struct rkisp1_cif_isp_compand_bls_config - Rockchip ISP1 Companding parameters (BLS)
> + * @r: Fixed subtraction value for Bayer pattern R
> + * @gr: Fixed subtraction value for Bayer pattern Gr
> + * @gb: Fixed subtraction value for Bayer pattern Gb
> + * @b: Fixed subtraction value for Bayer pattern B
> + *
> + * The values will be subtracted from the sensor values. Note that unlike the
> + * dedicated BLS block, the BLS values in the compander are 20-bit unsigned.
> + */
> +struct rkisp1_cif_isp_compand_bls_config {
> +	__u32 r;
> +	__u32 gr;
> +	__u32 gb;
> +	__u32 b;
> +};
> +
> +/**
> + * struct rkisp1_cif_isp_compand_curve_config - Rockchip ISP1 Companding
> + * parameters (expand and compression curves)
> + * @px: Compand curve x-values. Each value stores the distance from the
> + *      previous x-value, expressed as log2 of the distance on 5 bits.
> + * @x: Compand curve x-values. The functionality of these parameters are
> + *     unknown due to do a lack of hardware documentation, but these are left
> + *     here for future compatibility purposes.
> + * @y: Compand curve y-values
> + */
> +struct rkisp1_cif_isp_compand_curve_config {
> +	__u8 px[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
> +	__u32 x[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
> +	__u32 y[RKISP1_CIF_ISP_COMPAND_NUM_POINTS];
> +};
> +
>  /*---------- PART2: Measurement Statistics ------------*/
>
>  /**
> @@ -1018,6 +1056,9 @@ struct rkisp1_stat_buffer {
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress curve
>   */
>  enum rkisp1_ext_params_block_type {
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> @@ -1037,6 +1078,9 @@ enum rkisp1_ext_params_block_type {
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
>  };
>
>  /**
> @@ -1384,6 +1428,46 @@ struct rkisp1_ext_params_afc_config {
>  	struct rkisp1_cif_isp_afc_config config;
>  } __attribute__((aligned(8)));
>
> +/**
> + * struct rkisp1_ext_params_compand_bls_config - RkISP1 extensible params
> + * Compand BLS config
> + *
> + * RkISP1 extensible parameters Companding configuration block (black level
> + * subtraction). Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Companding BLS configuration, see
> + *	    :c:type:`rkisp1_cif_isp_compand_bls_config`
> + */
> +struct rkisp1_ext_params_compand_bls_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_compand_bls_config config;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct rkisp1_ext_params_compand_curve_config - RkISP1 extensible params
> + * Compand curve config
> + *
> + * RkISP1 extensible parameters Companding configuration block (expand and
> + * compression curves). Identified by
> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND`or
> + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Companding curve configuration, see
> + *	    :c:type:`rkisp1_cif_isp_compand_curve_config`
> + */
> +struct rkisp1_ext_params_compand_curve_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_compand_curve_config config;
> +} __attribute__((aligned(8)));
> +
> +/*
> + * The rkisp1_ext_params_compand_curve_config structure is counted twice as it
> + * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block types.
> + */
>  #define RKISP1_EXT_PARAMS_MAX_SIZE					\
>  	(sizeof(struct rkisp1_ext_params_bls_config)			+\
>  	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
> @@ -1401,7 +1485,10 @@ struct rkisp1_ext_params_afc_config {
>  	sizeof(struct rkisp1_ext_params_awb_meas_config)		+\
>  	sizeof(struct rkisp1_ext_params_hst_config)			+\
>  	sizeof(struct rkisp1_ext_params_aec_config)			+\
> -	sizeof(struct rkisp1_ext_params_afc_config))
> +	sizeof(struct rkisp1_ext_params_afc_config)			+\
> +	sizeof(struct rkisp1_ext_params_compand_bls_config)		+\
> +	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
> +	sizeof(struct rkisp1_ext_params_compand_curve_config))
>
>  /**
>   * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
> --
> Regards,
>
> Laurent Pinchart
>

