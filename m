Return-Path: <linux-media+bounces-57077-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J2uFIkBxGm0vQQAu9opvQ
	(envelope-from <linux-media+bounces-57077-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:38:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF041328348
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 16:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB011304EDE2
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 15:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6283C4578;
	Wed, 25 Mar 2026 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B1LWaFNi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A2035AC01;
	Wed, 25 Mar 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452082; cv=none; b=tMNQVOqH9NIG6nORaNQD/Lb9fcoij5y/H6Q4PXpMprhWcZfuSRsyAtPIkOQApqNmG7BRchV0ordGm7rzEmXde+830NVX3oBdhuNQHv+lEOjWW42YBusyJ1mfAqhMdgLW5gQD7X9fDC0K66K7jBpxXTWVyTDjdU/wEhLN2BcV0nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452082; c=relaxed/simple;
	bh=qZGiT+EvKcDkmxuOuy3DrL28n1CGTnETVnQH8DAchQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rz7XM8lJKl1NdTFDYt0j3VqqvNwb0bugfpP4/YnPWJ++EkFcf2NPk6UlJv4ZhjDIMXa8I8a1TtCDTYEa9vuNX83sBsHw1mFITYr32J9fNJ2UD8BV0NS/VBs4S4Q+XYzvZAsCyT917JeLOIlAo9k/2/XrSNZv8mdzRuCnQMohBFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B1LWaFNi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B175D121A;
	Wed, 25 Mar 2026 16:19:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774451999;
	bh=qZGiT+EvKcDkmxuOuy3DrL28n1CGTnETVnQH8DAchQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1LWaFNi5OP19gPp8aVu+LOV0EMljp+gddp4A85a63+pI1HaXpCvXa1sq/ytmWK1L
	 5d0iv3SiXbrj/2yFMvfDChcMU8kxuDJOYFuQmW3wJUYH0cGRYY2b7Qq7o5Q8TDkoXk
	 4BoV6Yb+XlJ+7lrH/OcKZq/rRWuLYLWa6+NeBxN8=
Date: Wed, 25 Mar 2026 16:21:15 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: rkisp1: Add support for CAC
Message-ID: <acP7qpa8TxGLKFiw@zed>
References: <20260323140216.1486161-1-barnabas.pocze@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323140216.1486161-1-barnabas.pocze@ideasonboard.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[fastmail.com,ideasonboard.com,kernel.org,sntech.de,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-57077-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: DF041328348
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Barnabás

On Mon, Mar 23, 2026 at 03:02:16PM +0100, Barnabás Pőcze wrote:
> The CAC block implements chromatic aberration correction. Expose it to
> userspace using the extensible parameters format. This was tested on the
> i.MX8MP platform, but based on available documentation it is also present
> in the RK3399 variant (V10). Thus presumably also in later versions,
> so no feature flag is introduced.
>
> Signed-off-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>

Only minors..

> ---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |  69 ++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  21 +++-
>  include/uapi/linux/rkisp1-config.h            | 106 +++++++++++++++++-
>  3 files changed, 193 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 6442436a5e428..b889af9dcee45 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -64,6 +64,7 @@ union rkisp1_ext_params_config {
>  	struct rkisp1_ext_params_compand_bls_config compand_bls;
>  	struct rkisp1_ext_params_compand_curve_config compand_curve;
>  	struct rkisp1_ext_params_wdr_config wdr;
> +	struct rkisp1_ext_params_cac_config cac;
>  };
>
>  enum rkisp1_params_formats {
> @@ -1413,6 +1414,48 @@ static void rkisp1_wdr_config(struct rkisp1_params *params,
>  				     RKISP1_CIF_ISP_WDR_TONE_CURVE_YM_MASK);
>  }
>
> +static void
> +rkisp1_cac_config(struct rkisp1_params *params,
> +		  const struct rkisp1_cif_isp_cac_config *arg)

Fits in one line without going over 80 cols

> +{
> +	u32 regval;
> +
> +	/*
> +	 * The enable bit is in the same register (RKISP1_CIF_ISP_CAC_CTRL),
> +	 * so only set the clipping mode, and do not modify the other bits.
> +	 */
> +	regval = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_CAC_CTRL);
> +	regval &= ~(RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE |
> +		    RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE);
> +	regval |= FIELD_PREP(RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE, arg->h_clip_mode) |
> +		  FIELD_PREP(RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE, arg->v_clip_mode);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_CTRL, regval);
> +
> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_COUNT_START_H_MASK, arg->h_count_start) |
> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_COUNT_START_V_MASK, arg->v_count_start);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_COUNT_START, regval);
> +
> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_A_RED_MASK, arg->red[0]) |
> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_A_BLUE_MASK, arg->blue[0]);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_A, regval);
> +
> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_B_RED_MASK, arg->red[1]) |
> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_B_BLUE_MASK, arg->blue[1]);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_B, regval);
> +
> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_C_RED_MASK, arg->red[2]) |
> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_C_BLUE_MASK, arg->blue[2]);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_C, regval);
> +
> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_X_NORM_NF_MASK, arg->x_nf) |
> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_X_NORM_NS_MASK, arg->x_ns);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_X_NORM, regval);
> +
> +	regval = FIELD_PREP(RKISP1_CIF_ISP_CAC_Y_NORM_NF_MASK, arg->y_nf) |
> +		 FIELD_PREP(RKISP1_CIF_ISP_CAC_Y_NORM_NS_MASK, arg->y_ns);
> +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_Y_NORM, regval);
> +}
> +
>  static void
>  rkisp1_isp_isr_other_config(struct rkisp1_params *params,
>  			    const struct rkisp1_params_cfg *new_params)
> @@ -2089,6 +2132,25 @@ static void rkisp1_ext_params_wdr(struct rkisp1_params *params,
>  				      RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
>  }
>
> +static void rkisp1_ext_params_cac(struct rkisp1_params *params,
> +				  const union rkisp1_ext_params_config *block)
> +{
> +	const struct rkisp1_ext_params_cac_config *cac = &block->cac;
> +
> +	if (cac->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
> +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
> +					RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
> +		return;
> +	}
> +
> +	rkisp1_cac_config(params, &cac->config);
> +
> +	if ((cac->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
> +	    !(params->enabled_blocks & BIT(cac->header.type)))
> +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
> +				      RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
> +}
> +
>  typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
>  			     const union rkisp1_ext_params_config *config);
>
> @@ -2185,6 +2247,10 @@ static const struct rkisp1_ext_params_handler {
>  		.handler	= rkisp1_ext_params_wdr,
>  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
>  	},
> +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC] = {
> +		.handler	= rkisp1_ext_params_cac,
> +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> +	},
>  };
>
>  #define RKISP1_PARAMS_BLOCK_INFO(block, data) \
> @@ -2215,6 +2281,7 @@ rkisp1_ext_params_block_types_info[] = {
>  	RKISP1_PARAMS_BLOCK_INFO(COMPAND_EXPAND, compand_curve),
>  	RKISP1_PARAMS_BLOCK_INFO(COMPAND_COMPRESS, compand_curve),
>  	RKISP1_PARAMS_BLOCK_INFO(WDR, wdr),
> +	RKISP1_PARAMS_BLOCK_INFO(CAC, cac),
>  };
>
>  static_assert(ARRAY_SIZE(rkisp1_ext_params_handlers) ==
> @@ -2474,6 +2541,8 @@ void rkisp1_params_disable(struct rkisp1_params *params)
>  	rkisp1_ie_enable(params, false);
>  	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
>  				RKISP1_CIF_ISP_DPF_MODE_EN);
> +	rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
> +				RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
>  }
>
>  static const struct rkisp1_params_ops rkisp1_v10_params_ops = {
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index fbeb186cde0d5..8e25537459bbd 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -724,6 +724,23 @@
>  #define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MASK		GENMASK(20, 16)
>  #define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MAX		16U
>
> +/* CAC */
> +#define RKISP1_CIF_ISP_CAC_CTRL_ENABLE		BIT(0)
> +#define RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE	GENMASK(2, 1)
> +#define RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE	GENMASK(3, 3)
> +#define RKISP1_CIF_ISP_CAC_COUNT_START_H_MASK	GENMASK(12, 0)
> +#define RKISP1_CIF_ISP_CAC_COUNT_START_V_MASK	GENMASK(28, 16)
> +#define RKISP1_CIF_ISP_CAC_A_RED_MASK		GENMASK(8, 0)
> +#define RKISP1_CIF_ISP_CAC_A_BLUE_MASK		GENMASK(24, 16)
> +#define RKISP1_CIF_ISP_CAC_B_RED_MASK		GENMASK(8, 0)
> +#define RKISP1_CIF_ISP_CAC_B_BLUE_MASK		GENMASK(24, 16)
> +#define RKISP1_CIF_ISP_CAC_C_RED_MASK		GENMASK(8, 0)
> +#define RKISP1_CIF_ISP_CAC_C_BLUE_MASK		GENMASK(24, 16)

All these masks for coefficients 0, 1 and 2 are identical. Maybe
#define RKISP1_CIF_ISP_CAC_RED_MASK		GENMASK(8, 0)
#define RKISP1_CIF_ISP_CAC_BLUE_MASK		GENMASK(24, 16)

is enough

> +#define RKISP1_CIF_ISP_CAC_X_NORM_NF_MASK	GENMASK(4, 0)
> +#define RKISP1_CIF_ISP_CAC_X_NORM_NS_MASK	GENMASK(19, 16)
> +#define RKISP1_CIF_ISP_CAC_Y_NORM_NF_MASK	GENMASK(4, 0)
> +#define RKISP1_CIF_ISP_CAC_Y_NORM_NS_MASK	GENMASK(19, 16)
> +
>  /* =================================================================== */
>  /*                            CIF Registers                            */
>  /* =================================================================== */
> @@ -1196,8 +1213,8 @@
>  #define RKISP1_CIF_ISP_CAC_A			(RKISP1_CIF_ISP_CAC_BASE + 0x00000008)
>  #define RKISP1_CIF_ISP_CAC_B			(RKISP1_CIF_ISP_CAC_BASE + 0x0000000c)
>  #define RKISP1_CIF_ISP_CAC_C			(RKISP1_CIF_ISP_CAC_BASE + 0x00000010)
> -#define RKISP1_CIF_ISP_X_NORM			(RKISP1_CIF_ISP_CAC_BASE + 0x00000014)
> -#define RKISP1_CIF_ISP_Y_NORM			(RKISP1_CIF_ISP_CAC_BASE + 0x00000018)
> +#define RKISP1_CIF_ISP_CAC_X_NORM		(RKISP1_CIF_ISP_CAC_BASE + 0x00000014)
> +#define RKISP1_CIF_ISP_CAC_Y_NORM		(RKISP1_CIF_ISP_CAC_BASE + 0x00000018)
>
>  #define RKISP1_CIF_ISP_EXP_BASE			0x00002600
>  #define RKISP1_CIF_ISP_EXP_CTRL			(RKISP1_CIF_ISP_EXP_BASE + 0x00000000)
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index b2d2a71f7baff..d8acccaddd0e9 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -967,6 +967,92 @@ struct rkisp1_cif_isp_wdr_config {
>  	__u8 use_iref;
>  };
>
> +/*
> + * enum rkisp1_cif_isp_cac_h_clip_mode - horizontal clipping mode
> + *
> + * @RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4PX: +/- 4 pixels
> + * @RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4_5PX: +/- 4/5 pixels depending on bayer position
> + */
> +enum rkisp1_cif_isp_cac_h_clip_mode {
> +	RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4PX = 0,
> +	RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4_5PX = 1,
> +};
> +
> +/**
> + * enum rkisp1_cif_isp_cac_v_clip_mode - vertical clipping mode
> + *
> + * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_2PX: +/- 2 pixels
> + * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3PX: +/- 3 pixels
> + * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3_4PX: +/- 3/4 pixels depending on bayer position
> + */
> +enum rkisp1_cif_isp_cac_v_clip_mode {
> +	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_2PX = 0,
> +	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3PX = 1,
> +	RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3_4PX = 2,
> +};
> +
> +/**
> + * struct rkisp1_cif_isp_cac_config - chromatic aberration correction configuration
> + *
> + * The correction is carried out by shifting the red and blue pixels relative
> + * to the green ones, depending on the distance from the optical center:

Yes, the distance to the center is one parameter, but the shifting
amount depends on other things. I would drop the last part of the
sentence and move the description of the two below fields after the
text

> + *
> + * @h_count_start: horizontal coordinate of the optical center (13-bit unsigned integer; [1,8191])
> + * @v_count_start: vertical coordinate of the optical center (13-bit unsigned integer; [1,8191])

so these could go just before @x_nf

> + *
> + * For each pixel, the x/y distances from the optical center are calculated and

I forgot: did we establish that the correction is applied to the
euclidean distance or to x and y separately ?

> + * then transformed into the [0,255] range based on the following formula:

s/transformed/normalized ?

> + *
> + *   (((d << 4) >> s) * f) >> 5
> + *
> + * where `d` is the distance, `s` and `f` are the normalization parameters:

Can you use 'ns' and 'nf' to match the below ?

> + *
> + * @x_nf: horizontal normalization scale parameter (5-bit unsigned integer; [0,31])
> + * @x_ns: horizontal normalization shift parameter (4-bit unsigned integer; [0,15])
> + *
> + * @y_nf: vertical normalization scale parameter (5-bit unsigned integer; [0,31])
> + * @y_ns: vertical normalization shift parameter (4-bit unsigned integer; [0,15])
> + *
> + * These parameters should be chosen based on the image resolution, the position
> + * of the optical center, and the shape of pixels: so that no normalized distance

s/pixels:/pixels/

> + * is larger than 255. If the pixels have square shape, the two sets of parameters
> + * should be equal.
> + *
> + * The actual amount of correction is calculated with a third degree polynomial:
> + *
> + *   c[0] * r + c[1] * r^2 + c[2] * r^3
> + *
> + * where `c` is the set of coefficients for the given color, and `r` is distance:
> + *
> + * @red: red coefficients (5.4 two's complement; [-16,15.9375])
> + * @blue: blue coefficients (5.4 two's complement; [-16,15.9375])
> + *
> + * Finally, the amount is clipped as requested:
> + *
> + * @h_clip_mode: maximum horizontal shift (from enum rkisp1_cif_isp_cac_h_clip_mode)
> + * @v_clip_mode: maximum vertical shift (from enum rkisp1_cif_isp_cac_v_clip_mode)
> + *
> + * A positive result will shift away from the optical center, while a negative
> + * one will shift towards the optical center. In the latter case, the pixel
> + * values at the edges are duplicated.
> + */
> +struct rkisp1_cif_isp_cac_config {
> +	__u8 h_clip_mode;
> +	__u8 v_clip_mode;
> +
> +	__u16 h_count_start;
> +	__u16 v_count_start;
> +
> +	__u16 red[3];
> +	__u16 blue[3];
> +
> +	__u8 x_nf;
> +	__u8 x_ns;
> +
> +	__u8 y_nf;
> +	__u8 y_ns;
> +};
> +
>  /*---------- PART2: Measurement Statistics ------------*/
>
>  /**
> @@ -1161,6 +1247,7 @@ enum rkisp1_ext_params_block_type {
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
>  	RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
> +	RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC,
>  };
>
>  /* For backward compatibility */
> @@ -1507,6 +1594,22 @@ struct rkisp1_ext_params_wdr_config {
>  	struct rkisp1_cif_isp_wdr_config config;
>  } __attribute__((aligned(8)));
>
> +/**
> + * struct rkisp1_ext_params_cac_config - RkISP1 extensible params CAC config
> + *
> + * RkISP1 extensible parameters CAC block.
> + * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC`.
> + *
> + * @header: The RkISP1 extensible parameters header, see
> + *	    :c:type:`rkisp1_ext_params_block_header`
> + * @config: CAC configuration, see
> + *	    :c:type:`rkisp1_cif_isp_cac_config`
> + */
> +struct rkisp1_ext_params_cac_config {
> +	struct rkisp1_ext_params_block_header header;
> +	struct rkisp1_cif_isp_cac_config config;
> +} __attribute__((aligned(8)));
> +
>  /*
>   * The rkisp1_ext_params_compand_curve_config structure is counted twice as it
>   * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block types.
> @@ -1532,7 +1635,8 @@ struct rkisp1_ext_params_wdr_config {
>  	sizeof(struct rkisp1_ext_params_compand_bls_config)		+\
>  	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
>  	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
> -	sizeof(struct rkisp1_ext_params_wdr_config))
> +	sizeof(struct rkisp1_ext_params_wdr_config)			+\
> +	sizeof(struct rkisp1_ext_params_cac_config))

All minors, please add
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>
>  /**
>   * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
> --
> 2.53.0
>
>

