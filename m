Return-Path: <linux-media+bounces-24174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A39FE794
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 16:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F33F51627C1
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 15:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84BA42070;
	Mon, 30 Dec 2024 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b9bfAWEL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C306F142905;
	Mon, 30 Dec 2024 15:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735572643; cv=none; b=gUXMPfUB2pa8RqmPcO/gGQcmprpc4+5bDi1XSH0r4N7D3hSFM09sUfzcVRybNVtwQ+kruQuwXxMGUTlvAUUrHgP5y+pksVVgy+lL7AVnqwEHewYvZpRb68jPdjUd/oMYVJfjh13z/TjFrC035lTo3SxQMjUEE5txQIEvIA8V/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735572643; c=relaxed/simple;
	bh=7XwFv/4vHxeLtRbzehBpwvJ5bBFckhoEgIsZCnzeYt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dP9KPrjsdQ+3IoZrO5+JgGQ7My+V8djkL6IZ2gtIAgxiYF+uimfO5cyJusgmThNHX8XTZxFJuldE9LtrG1FfxoW/uzAEKZzjpiXE6liJ6Tci09+DOJcnnUNDyvomc9UACB9Pzy1AK0VLux9j95IWK3+ZF8U5NPdD5XEmmAAVeEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b9bfAWEL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-21-47-nat.elisa-mobile.fi [85.76.21.47])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C0D73DC;
	Mon, 30 Dec 2024 16:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735572592;
	bh=7XwFv/4vHxeLtRbzehBpwvJ5bBFckhoEgIsZCnzeYt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9bfAWEL8vjhomIOZOhntMroSq+ooTFuVDCJc4ZPOOnbrwYGbE9Y4aqfsJ1qfj/7H
	 71Dr7XxwE/fGYi6FtWfO5RrrOMIxMrals060zEAdBds8U11jW1Hf8mmI0wkAkKS23a
	 Q8vWtsVY0iCW2xZiZfhwTukPkS+xB80VpXm+Ng/A=
Date: Mon, 30 Dec 2024 17:30:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] media: rockchip: rkisp1: Add support for AWB64
Message-ID: <20241230153037.GC31841@pendragon.ideasonboard.com>
References: <20241230-awb64-v1-1-27b0ee65f551@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241230-awb64-v1-1-27b0ee65f551@ideasonboard.com>

Hi Jai,

Thank you for the patch.

On Mon, Dec 30, 2024 at 12:25:09PM +0530, Jai Luthra wrote:
> AWB64 is an advanced auto white-balance statistics block, present on the
> ISP in iMX8MP. This block can calculate color statistics for a maximum
> of 8 different (elliptical) regions, which can be used by the AWB
> algorithm to better tune the color gains.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> This patch is only compile-tested, thus marked as an RFC.
> 
> Some of the ellipse and color transformation parameters are sparsely
> documented, so the API might have to change on further testing.
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |   9 ++
>  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   3 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 123 +++++++++++++++++++++
>  .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  41 +++++++
>  .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  31 +++++-
>  include/uapi/linux/rkisp1-config.h                 | 105 ++++++++++++++++++
>  6 files changed, 310 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829ba7d923ad42fec92840ccd422b6e5..7dc9d101a1a01627f174cc4c454e4e57b38e1f8e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -118,6 +118,7 @@ enum rkisp1_isp_pad {
>   * @RKISP1_FEATURE_DMA_34BIT: The ISP uses 34-bit DMA addresses
>   * @RKISP1_FEATURE_BLS: The ISP has a dedicated BLS block
>   * @RKISP1_FEATURE_COMPAND: The ISP has a companding block
> + * @RKISP1_FEATURE_AWB64: The ISP has an AWB64 block
>   *
>   * The ISP features are stored in a bitmask in &rkisp1_info.features and allow
>   * the driver to implement support for features present in some ISP versions
> @@ -131,6 +132,7 @@ enum rkisp1_feature {
>  	RKISP1_FEATURE_DMA_34BIT = BIT(4),
>  	RKISP1_FEATURE_BLS = BIT(5),
>  	RKISP1_FEATURE_COMPAND = BIT(6),
> +	RKISP1_FEATURE_AWB64 = BIT(7),
>  };
>  
>  #define rkisp1_has_feature(rkisp1, feature) \
> @@ -345,6 +347,8 @@ struct rkisp1_stats;
>  struct rkisp1_stats_ops {
>  	void (*get_awb_meas)(struct rkisp1_stats *stats,
>  			     struct rkisp1_stat_buffer *pbuf);
> +	void (*get_awb64_meas)(struct rkisp1_stats *stats,
> +			       struct rkisp1_stat_buffer *pbuf);
>  	void (*get_aec_meas)(struct rkisp1_stats *stats,
>  			     struct rkisp1_stat_buffer *pbuf);
>  	void (*get_hst_meas)(struct rkisp1_stats *stats,
> @@ -381,6 +385,11 @@ struct rkisp1_params_ops {
>  	void (*awb_meas_enable)(struct rkisp1_params *params,
>  				const struct rkisp1_cif_isp_awb_meas_config *arg,
>  				bool en);
> +	void (*awb64_meas_config)(struct rkisp1_params *params,
> +				  const struct rkisp1_cif_isp_awb64_meas_config *arg);
> +	void (*awb64_meas_enable)(struct rkisp1_params *params,
> +				  const struct rkisp1_cif_isp_awb64_meas_config *arg,
> +				  bool en);
>  	void (*awb_gain_config)(struct rkisp1_params *params,
>  				const struct rkisp1_cif_isp_awb_gain_config *arg);
>  	void (*aec_config)(struct rkisp1_params *params,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 0100b9c3edbefbdc001e2e4d13049efa9493e3bd..20903823b8eec2dd6b2fda788a42ef7545158f8c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -557,7 +557,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
>  	.isp_ver = RKISP1_V_IMX8MP,
>  	.features = RKISP1_FEATURE_MAIN_STRIDE
>  		  | RKISP1_FEATURE_DMA_34BIT
> -		  | RKISP1_FEATURE_COMPAND,
> +		  | RKISP1_FEATURE_COMPAND
> +		  | RKISP1_FEATURE_AWB64,
>  	.max_width = 4096,
>  	.max_height = 3072,
>  };
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a309a3231d44d825c6461e3ecb2a44..1ee5f07d461c5ad7aadff908c25f7a5bd2ff81f9 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -60,6 +60,7 @@ union rkisp1_ext_params_config {
>  	struct rkisp1_ext_params_afc_config afc;
>  	struct rkisp1_ext_params_compand_bls_config compand_bls;
>  	struct rkisp1_ext_params_compand_curve_config compand_curve;
> +	struct rkisp1_ext_params_awb64_meas_config awb64;
>  };
>  
>  enum rkisp1_params_formats {
> @@ -674,6 +675,101 @@ rkisp1_awb_meas_enable_v12(struct rkisp1_params *params,
>  	}
>  }
>  
> +/* ISP White Balance Mode */
> +static void
> +rkisp1_awb64_meas_config_v10(struct rkisp1_params *params,
> +			     const struct rkisp1_cif_isp_awb64_meas_config *arg)

v10 refers to the Rockchip ISP v1.0. As the AWB64 block is found in the
VSI ISP8000 Nano (v18.02 if I'm not mistaken), which we refer to in this
driver as "RKISP1_V_IMX8MP", I would name this function
rkisp1_awb64_meas_config_imx8mp() or just rkisp1_awb64_meas_config().
Same for rkisp1_awb64_meas_enable_v10().

> +{
> +	/* window offset */

	/* Window offset and size */

> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_OFFS,
> +		     arg->awb_wnd.v_offs);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_OFFS,
> +		     arg->awb_wnd.v_offs);

You're writing the same register twice.

> +	/* AWB window size */

Drop this.

> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_SIZE,
> +		     arg->awb_wnd.v_size);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_H_SIZE,
> +		     arg->awb_wnd.h_size);

A blank line here would make code easier to read.

> +	/* RGB thresholds for measurement */
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_R_MIN_MAX,
> +		     arg->max_r << 8 | arg->min_r);

To simplify the calculations in the kernel, would it make sense for
userspace to compute this and store it in a single 16-bit field ?

> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_G_MIN_MAX,
> +		     arg->max_g << 8 | arg->min_g);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_B_MIN_MAX,
> +		     arg->max_b << 8 | arg->min_b);

Same here.

> +	/* Minimum input divider threshold */
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MIN_DIVIDER,
> +		     arg->min_div & RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK);

And here.

> +	/* Colorspace matrix coefficients */
> +	for (int i = 0; i < 3; i++)
> +		for (int j = 0; j < 3; j++)
> +			rkisp1_write(params->rkisp1,
> +				     RKISP1_CIF_ISP_AWB64_CC_COEFF(i * 3 + j),
> +				     arg->cc_coeff[i][j]);

Use curly braces for outer loop.

> +	/* Ellipse configuration */
> +	for (int i = 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {

		const struct rkisp1_cif_isp_awb64_ellip *ellip = &arg->ellip[i];

> +		/* Center */
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_X(i),
> +			     arg->ellip[i].cen_x &
> +				     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);

			     ellip->cen_x & RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);

Same below.

> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_Y(i),
> +			     arg->ellip[i].cen_y &
> +				     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);
> +		/* Radius */
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB64_ELLIP_RMAX(i),
> +			     arg->ellip[i].rmax &
> +				     RKISP1_CIF_ISP_AWB64_ELLIP_RMAX_MASK);
> +		/* CTM */
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB64_ELLIP_A1(i),
> +			     arg->ellip[i].ctm[0] &
> +				     RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK);
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB64_ELLIP_A2(i),
> +			     arg->ellip[i].ctm[1] &
> +				     RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK);
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB64_ELLIP_A3(i),
> +			     arg->ellip[i].ctm[2] &
> +				     RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK);
> +		rkisp1_write(params->rkisp1,
> +			     RKISP1_CIF_ISP_AWB64_ELLIP_A4(i),
> +			     arg->ellip[i].ctm[3] &
> +				     RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK);
> +	}
> +}
> +
> +static void
> +rkisp1_awb64_meas_enable_v10(struct rkisp1_params *params,
> +			     const struct rkisp1_cif_isp_awb64_meas_config *arg,
> +			     bool en)
> +{
> +	u32 reg_val =
> +		rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE);
> +
> +	if (en) {
> +		if (arg->enable_median_filter)
> +			reg_val |= RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN;
> +
> +		if (arg->chrom_switch)
> +			reg_val |= RKISP1_CIF_ISP_AWB64_CHROM_SWITCH;
> +
> +		reg_val |= (arg->ellip_unite & RKISP1_CIF_ISP_AWB64_UNITE_MASK)
> +			   << RKISP1_CIF_ISP_AWB64_UNITE_SHIFT;

You never clear any of those fields.

Is it intentional that you make it impossible to change those parameters
without disabling and re-enabling the block ?

> +
> +		reg_val |= RKISP1_CIF_ISP_AWB64_MEAS_EN |
> +			   RKISP1_CIF_ISP_AWB64_IRQ_EN;
> +	} else {
> +		reg_val &= ~RKISP1_CIF_ISP_AWB64_MEAS_EN;
> +	}
> +
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE,
> +		     reg_val);
> +}
> +
>  static void
>  rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
>  			   const struct rkisp1_cif_isp_awb_gain_config *arg)
> @@ -2005,6 +2101,25 @@ static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
>  				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
>  }
>  
> +static void rkisp1_ext_params_awb64(struct rkisp1_params *params,
> +				    const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_awb64_meas_config *awb64 = &block->awb64;
> +
> +	if (awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
> +		params->ops->awb64_meas_enable(params, &awb64->config,
> +					     false);

Wrong indentation.

> +		return;
> +	}
> +
> +	params->ops->awb64_meas_config(params, &awb64->config);
> +
> +	if ((awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
> +	    !(params->enabled_blocks & BIT(awb64->header.type)))
> +		params->ops->awb64_meas_enable(params, &awb64->config,
> +					     true);

Same here.

> +}
> +
>  typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
>  			     const union rkisp1_ext_params_config *config);
>  
> @@ -2118,6 +2233,12 @@ static const struct rkisp1_ext_params_handler {
>  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
>  		.features	= RKISP1_FEATURE_COMPAND,
>  	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS] = {
> +		.size		= sizeof(struct rkisp1_ext_params_awb64_meas_config),
> +		.handler	= rkisp1_ext_params_awb64,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +		.features	= RKISP1_FEATURE_AWB64,
> +	},
>  };
>  
>  static void rkisp1_ext_params_config(struct rkisp1_params *params,
> @@ -2381,6 +2502,8 @@ static const struct rkisp1_params_ops rkisp1_v10_params_ops = {
>  	.goc_config = rkisp1_goc_config_v10,
>  	.awb_meas_config = rkisp1_awb_meas_config_v10,
>  	.awb_meas_enable = rkisp1_awb_meas_enable_v10,
> +	.awb64_meas_config = rkisp1_awb64_meas_config_v10,
> +	.awb64_meas_enable = rkisp1_awb64_meas_enable_v10,

I think you can drop these two fields and call
rkisp1_awb64_meas_config() and rkisp1_awb64_meas_enable() directly.

>  	.awb_gain_config = rkisp1_awb_gain_config_v10,
>  	.aec_config = rkisp1_aec_config_v10,
>  	.hst_config = rkisp1_hst_config_v10,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index bf0260600a1923eebde6b5fe233daf7d427362dd..bc292a5738198fff28715b2a7e55e26e8fbddc64 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -516,6 +516,24 @@
>  #define RKISP1_CIF_ISP_AWB_CBCR_MAX_REF			0x000000ff
>  #define RKISP1_CIF_ISP_AWB_THRES_MAX_YC			0x000000ff
>  
> +/* AWB64 */
> +/* ISP_AWB64_WHITE_CNT */
> +#define RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(x)		((x) & 0xffffff)
> +/* ISP_AWB64_MEAS_MODE */
> +#define RKISP1_CIF_ISP_AWB64_MEAS_EN			BIT(0)
> +#define RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN		BIT(1)
> +#define RKISP1_CIF_ISP_AWB64_IRQ_EN			BIT(2)
> +#define RKISP1_CIF_ISP_AWB64_CHROM_SWITCH		BIT(3)
> +#define RKISP1_CIF_ISP_AWB64_UNITE_MASK			GENMASK(5, 0)
> +#define RKISP1_CIF_ISP_AWB64_UNITE_SHIFT		4
> +/* ISP_AWB64_DIVIDER_MIN */
> +#define RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK		GENMASK(9, 0)
> +/* ISP_AWB64_ELLIP */
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK		GENMASK(9, 0)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK		GENMASK(11, 0)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK		GENMASK(8, 0)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_RMAX_MASK		GENMASK(23, 0)
> +
>  /* AE */
>  /* ISP_EXP_CTRL */
>  #define RKISP1_CIF_ISP_EXP_ENA				BIT(0)
> @@ -1379,6 +1397,29 @@
>  #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x0000012c)
>  #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32_SHD	(RKISP1_CIF_ISP_WDR_BASE + 0x00000130)
>  
> +#define RKISP1_CIF_ISP_AWB64_BASE		0x00002c00
> +#define RKISP1_CIF_ISP_AWB64_MEAS_MODE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_H_OFFS		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_V_OFFS		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_H_SIZE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_V_SIZE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_R_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_G_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_B_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_MIN_DIVIDER	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000)
> +#define RKISP1_CIF_ISP_AWB64_CC_COEFF(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000000 + (n) * 4)

All those registers seem to be at the same address. I think the next
version of this patch needs to be tested.

> +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_X(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000048 + (n) * 8)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_Y(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x0000004c + (n) * 8)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A1(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000088 + (n) * 16)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A2(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x0000008c + (n) * 16)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A3(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000090 + (n) * 16)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_A4(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000094 + (n) * 16)
> +#define RKISP1_CIF_ISP_AWB64_ELLIP_RMAX(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000108 + (n) * 4)
> +#define RKISP1_CIF_ISP_AWB64_WHITE_CNT(n)	(RKISP1_CIF_ISP_AWB64_BASE + 0x00000128 + (n) * 4)
> +#define RKISP1_CIF_ISP_AWB64_R_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000148 + (n) * 12)
> +#define RKISP1_CIF_ISP_AWB64_G_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0x0000014c + (n) * 12)
> +#define RKISP1_CIF_ISP_AWB64_B_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0x00000150 + (n) * 12)
> +
>  #define RKISP1_CIF_ISP_HIST_BASE_V12		0x00002c00
>  #define RKISP1_CIF_ISP_HIST_CTRL_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000000)
>  #define RKISP1_CIF_ISP_HIST_SIZE_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + 0x00000004)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index d5fdb8f82dc78b0143f71d76f36817db389921b7..a5b82963e74dac2340a1b3b07cd8d99dd23b5d5d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -172,6 +172,31 @@ rkisp1_stats_init_vb2_queue(struct vb2_queue *q, struct rkisp1_stats *stats)
>  	return vb2_queue_init(q);
>  }
>  
> +static void rkisp1_stats_get_awb64_meas_v10(struct rkisp1_stats *stats,
> +					    struct rkisp1_stat_buffer *pbuf)
> +{
> +	/* Protect against concurrent access from ISR? */

If this is needed, let's address the issue. If it's not, let's drop the
comment.

> +	struct rkisp1_device *rkisp1 = stats->rkisp1;
> +	unsigned int i;
> +	u32 white_cnt;
> +
> +	pbuf->meas_type |= RKISP1_CIF_ISP_STAT_AWB64;
> +
> +	for (i = 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {

	for (unsigned int i = 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
		struct rkisp1_cif_isp_awb64_meas *count =
			&pbuf->params.awb64.count[i];

and use count below.

> +		white_cnt = rkisp1_read(rkisp1,
> +					RKISP1_CIF_ISP_AWB64_WHITE_CNT(i));
> +		pbuf->params.awb64.count[i].cnt =
> +			RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(white_cnt);
> +
> +		pbuf->params.awb64.count[i].accu_cr_or_r =
> +			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_R_ACCU(i));
> +		pbuf->params.awb64.count[i].accu_y_or_g =
> +			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_G_ACCU(i));
> +		pbuf->params.awb64.count[i].accu_cb_or_b =
> +			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_B_ACCU(i));
> +	}
> +}
> +
>  static void rkisp1_stats_get_awb_meas_v10(struct rkisp1_stats *stats,
>  					  struct rkisp1_stat_buffer *pbuf)
>  {
> @@ -325,6 +350,7 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1_stats *stats,
>  
>  static const struct rkisp1_stats_ops rkisp1_v10_stats_ops = {
>  	.get_awb_meas = rkisp1_stats_get_awb_meas_v10,
> +	.get_awb64_meas = rkisp1_stats_get_awb64_meas_v10,

Not all ISP versions using rkisp1_v10_stats_ops support the AWB64 block.
You need to duplicate this structure, with a specific version for the
i.MX8MP.

>  	.get_aec_meas = rkisp1_stats_get_aec_meas_v10,
>  	.get_hst_meas = rkisp1_stats_get_hst_meas_v10,
>  };
> @@ -355,8 +381,11 @@ rkisp1_stats_send_measurement(struct rkisp1_stats *stats, u32 isp_ris)
>  
>  	cur_stat_buf = (struct rkisp1_stat_buffer *)
>  			vb2_plane_vaddr(&cur_buf->vb.vb2_buf, 0);
> -	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE)
> +	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE) {
>  		stats->ops->get_awb_meas(stats, cur_stat_buf);
> +		if (stats->ops->get_awb64_meas)
> +			stats->ops->get_awb64_meas(stats, cur_stat_buf);

As you need to create rkisp1_imx8mp_stats_ops as explained above, you
can combine awb and awb64 support in the .get_awb_meas() operation. One
option is to create a rkisp1_stats_get_awb_meas_imx8mp() that calls
rkisp1_stats_get_awb_meas_v10() and rkisp1_stats_get_awb64_meas().

> +	}
>  
>  	if (isp_ris & RKISP1_CIF_ISP_AFM_FIN)
>  		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 430daceafac7056951be968f3b4d9cd50eb04e71..22243ab8e079925d58f739b3078efed04fd8acda 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -45,6 +45,8 @@
>  #define RKISP1_CIF_ISP_MODULE_DPF		(1U << 16)
>  /* Denoise Pre-Filter Strength */
>  #define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	(1U << 17)
> +/* Auto White Balancing 64 statistics configuration */
> +#define RKISP1_CIF_ISP_MODULE_AWB64		(1U << 18)

This doesn't seem to be used, is that expected ?

>  
>  #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
>  #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
> @@ -88,6 +90,11 @@
>  #define RKISP1_CIF_ISP_AWB_MAX_GRID                1
>  #define RKISP1_CIF_ISP_AWB_MAX_FRAMES              7
>  
> +/*
> + * Automatic white balance extended block (AWB64)
> + */
> +#define RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE           8
> +
>  /*
>   * Gamma out
>   */
> @@ -176,6 +183,7 @@
>  #define RKISP1_CIF_ISP_STAT_AUTOEXP       (1U << 1)
>  #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
>  #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
> +#define RKISP1_CIF_ISP_STAT_AWB64         (1U << 4)
>  
>  /**
>   * enum rkisp1_cif_isp_version - ISP variants
> @@ -519,6 +527,55 @@ struct rkisp1_cif_isp_awb_gain_config {
>  	__u16 gain_green_b;
>  };
>  
> +/**
> + * struct rkisp1_cif_isp_awb64_ellipse - Ellipse configuration for AWB64 measurement
> + *
> + * @rmax: Points within rmax (24 bits) distance from center are considered white point

What's the unit ? A maximum radius of 16M pixels doesn't seem to make
sense. Is this the square of the maximum radius ? Or a fixed-point
integer value with a decimal part ?

> + * @cen_x: X co-ordinate of the center of ellipse (10 bits)

s/co-ordinate/coordinate/

Same below.

> + * @cen_y: Y co-ordinate of the center of ellipse (10 bits)
> + * @ctm: Co-ordinate transformation matrix
> + *       ctm[0] and ctm[2] are 12 bits, ctm[1] and ctm[3] are 9 bits
> + */
> +struct rkisp1_cif_isp_awb64_ellip {
> +	__u32 rmax;
> +	__u16 cen_x;
> +	__u16 cen_y;
> +	__u16 ctm[4];
> +};
> +
> +/**
> + * struct rkisp1_cif_isp_awb64_meas_config - Configuration for the AWB64 stats
> + *
> + * @awb_wnd: White balance measurement window (in pixels)
> + * @ellip: Ellipse regions used for measurement
> + * @cc_coeff: Colorspace matrix (all coefficients are 11 bits)
> + * @min_div: Minimum divider, if input is less than this don't do division (10 bits)
> + * @max_r: Only pixels with R < max_r contribute to measurement
> + * @min_r: Only pixels with R > min_r contribute to measurement
> + * @max_g: Only pixels with G < max_g contribute to measurement
> + * @min_g: Only pixels with G > min_g contribute to measurement
> + * @max_b: Only pixels with B < max_b contribute to measurement
> + * @min_b: Only pixels with B > min_b contribute to measurement
> + * @ellip_unite: Bitmask to select which regions should be combined for measurement
> + *               bits 0:2 to combine ellipse 0 with ellipse 1,2,3
> + *               bits 3:5 to combine ellipse 4 with ellipse 5,6,7
> + */
> +struct rkisp1_cif_isp_awb64_meas_config {
> +	struct rkisp1_cif_isp_window awb_wnd;
> +	struct rkisp1_cif_isp_awb64_ellip ellip[RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE];
> +	__u16 cc_coeff[3][3];
> +	__u16 min_div;
> +	__u8 max_r;
> +	__u8 min_r;
> +	__u8 max_g;
> +	__u8 min_g;
> +	__u8 max_b;
> +	__u8 min_b;
> +	__u8 enable_median_filter;

This field is not documented.

> +	__u8 ellip_unite;
> +	__u8 chrom_switch;

Same here. Please compile-test the documentation.

> +};
> +
>  /**
>   * struct rkisp1_cif_isp_flt_config - Configuration used by ISP filtering
>   *
> @@ -1006,6 +1063,34 @@ struct rkisp1_cif_isp_hist_stat {
>  	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
>  };
>  
> +/**
> + * struct rkisp1_cif_isp_awb64_meas - AWB64 measured values
> + *
> + * @cnt: White pixel count, number of "white pixels" found during last
> + *	 measurement
> + * @accu_y_or_g: Total value of Y within elliptical region,
> + *		 Green if RGB is selected.
> + * @accu_cb_or_b: Total value of Cb within elliptical region,
> + *		  Blue if RGB is selected.
> + * @accu_cr_or_r: Total value of Cr within elliptical region,
> + *		  Red if RGB is selected.
> + */
> +struct rkisp1_cif_isp_awb64_meas {
> +	__u32 cnt;
> +	__u32 accu_y_or_g;
> +	__u32 accu_cb_or_b;
> +	__u32 accu_cr_or_r;
> +};
> +
> +/**
> + * struct rkisp1_cif_isp_awb64_stat - statistics AWB64 data
> + *
> + * @count: Measured pixel accumulator data for elliptical regions
> + */
> +struct rkisp1_cif_isp_awb64_stat {
> +	struct rkisp1_cif_isp_awb64_meas count[RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE];
> +};
> +
>  /**
>   * struct rkisp1_cif_isp_stat - Rockchip ISP1 Statistics Data
>   *
> @@ -1019,6 +1104,7 @@ struct rkisp1_cif_isp_stat {
>  	struct rkisp1_cif_isp_ae_stat ae;
>  	struct rkisp1_cif_isp_af_stat af;
>  	struct rkisp1_cif_isp_hist_stat hist;
> +	struct rkisp1_cif_isp_awb64_stat awb64;
>  };
>  
>  /**
> @@ -1059,6 +1145,7 @@ struct rkisp1_stat_buffer {
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
>   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress curve
> + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS: Auto white balance 64 statistics
>   */
>  enum rkisp1_ext_params_block_type {
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> @@ -1081,6 +1168,7 @@ enum rkisp1_ext_params_block_type {
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS,
>  };
>  
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> @@ -1376,6 +1464,23 @@ struct rkisp1_ext_params_awb_meas_config {
>  	struct rkisp1_cif_isp_awb_meas_config config;
>  } __attribute__((aligned(8)));
>  
> +/**
> + * struct rkisp1_ext_params_awb64_meas_config - RkISP1 extensible params AWB64
> + *						Meas config
> + *
> + * RkISP1 extensible parameters Auto-White Balance 64 Measurement configuration
> + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: Auto-White Balance 64 measure configuration, see
> + *	    :c:type:`rkisp1_cif_isp_awb64_meas_config`
> + */
> +struct rkisp1_ext_params_awb64_meas_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_awb64_meas_config config;
> +} __attribute__((aligned(8)));
> +
>  /**
>   * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histogram config
>   *
> 
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241230-awb64-79270098e15e

-- 
Regards,

Laurent Pinchart

