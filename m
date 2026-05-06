Return-Path: <linux-media+bounces-60649-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA1AD7tk+2kuaQMAu9opvQ
	(envelope-from <linux-media+bounces-60649-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:56:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BF04DDB3A
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35F4F302E931
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A03F4921AD;
	Wed,  6 May 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="slvAics8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93973F7AA9;
	Wed,  6 May 2026 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082886; cv=none; b=IHJ5+x33MqfSFgelO2/4zABBLxdfmJdUjQ7eomZRlhARgC8up292VnzJtfBZixSc3l7UT6/jGy1CKjfqiYoIlhA8K4SCCSh7m0LlXHo8Lz0v1p5nTxM4j2msV+YUpCMvdqwbQdl7Tw///eCpZmodDygNhtEYqScWxx1pTbFy+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082886; c=relaxed/simple;
	bh=lhV/jrsffG3O8DxQRuYFzgjjD/mkLEfrqwmEWVKu3zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ms4/ZmDh37n04KfDXpJBrHwHaNJVezYNFNb4wMzt3SLVJmHmnsWfT6e8stbLbTDhh42XjNLidF2ON6XwvjHMWI6ZdmJ6J6RbuR690nbN0VE05AgmCfqWFfxBYlV7FsL0qsZcA3Gc/SHbdcBbLqJ/fltg+PQuAXdIuw5jc2hJp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=slvAics8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CEE7DA;
	Wed,  6 May 2026 17:54:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778082876;
	bh=lhV/jrsffG3O8DxQRuYFzgjjD/mkLEfrqwmEWVKu3zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slvAics8xpXDrMHG/ZTbGrUgymuhuFFNZQpAF8LbBlKkdda0/8s1T3oaFyJNiObW7
	 ryMSaNQjjuZH+NkKYG67oQqLrGaWMhWH2+GpGC1v5NFB3R48/Neu//1vZlq7FgVY0S
	 VUtXGUWEB9wdNdsBZaJ8f5mLaJOJ9y7Mm3FYyGWI=
Date: Wed, 6 May 2026 17:54:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v8 12/14] media: rppx1: db: Add support for debayering filters
Message-ID: <aftj3lgMSyVIvFda@zed>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-13-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260504010556.2796398-13-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Queue-Id: C2BF04DDB3A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60649-lists,linux-media=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ragnatech.se:email]

Hi Niklas

On Mon, May 04, 2026 at 03:05:54AM +0200, Niklas Söderlund wrote:
> Extend the RPPX1 driver to allow setting the debayering filters
> configuration parameters. It uses the RPPX1 framework for parameters and
> its writer abstraction to allow the user to control how, and when,
> configuration is applied to the RPPX1.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> ---
>  .../platform/dreamchip/rppx1/rpp_module.h     |  2 +
>  .../platform/dreamchip/rppx1/rpp_params.c     |  7 ++
>  .../media/platform/dreamchip/rppx1/rppx1_db.c | 82 +++++++++++++++++++
>  .../uapi/linux/media/dreamchip/rppx1-config.h | 58 ++++++++++++-

As this block still doesn't have a user in libcamera, but I understand
there might be value in having the module upstream, what if we
upstream rppx1_db.c but we don't commit to a uAPI yet ? We can keep
the types you have defined in the uAPI internal to the driver for now?

>  4 files changed, 148 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> index 830ef0df7228..064da13082fe 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> @@ -88,6 +88,8 @@ union rppx1_params_block {
>  	struct rppx1_bls_params bls;
>  	struct rppx1_lsc_params lsc;
>  	struct rppx1_awbg_params awbg;
> +	struct rppx1_db_demosaic_params db_demosaic;
> +	struct rppx1_db_filter_params db_filter;
>  	struct rppx1_ccor_params ccor;
>  	struct rppx1_hist_params hist;
>  	struct rppx1_exm_params exm;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index 317ed715f1de..3320ca3998bd 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -22,6 +22,8 @@ rppx1_ext_params_blocks_info[] = {
>  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
> +	RPPX1_PARAMS_BLOCK_INFO(DB_DEMOSAIC_POST, db_demosaic),
> +	RPPX1_PARAMS_BLOCK_INFO(DB_FILTER_POST, db_filter),
>  	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
> @@ -74,6 +76,11 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
>  			module = &rpp->pre1.awbg;
>  			break;
> +		case RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST:
> +		case RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST:
> +			/* Both types handled by the same block. */
> +			module = &rpp->post.db;
> +			break;
>  		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
>  			module = &rpp->post.ccor;
>  			break;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> index 5e233896cfc8..5571b3a9562d 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> @@ -39,6 +39,88 @@ static int rppx1_db_probe(struct rpp_module *mod)
>  	return 0;
>  }
>
> +static int
> +rppx1_db_fill_params_demosaic(struct rpp_module *mod,
> +			      const union rppx1_params_block *block,
> +			      rppx1_reg_write write, void *priv)
> +{
> +	const struct rppx1_db_demosaic_params *cfg = &block->db_demosaic;
> +
> +	/* If the modules is disabled, simply bypass it. */
> +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +		write(priv, mod->base + DEMOSAIC_REG, 0x400);
> +		return 0;
> +	}
> +
> +	/* Native threshold is at RPP 16-bit precision. */
> +	write(priv, mod->base + DEMOSAIC_REG, cfg->demosaic_th);
> +
> +	return 0;
> +}
> +
> +static int
> +rppx1_db_fill_params_filter(struct rpp_module *mod,
> +			    const union rppx1_params_block *block,
> +			    rppx1_reg_write write, void *priv)
> +{
> +	const struct rppx1_db_filter_params *cfg = &block->db_filter;
> +
> +	/* If the modules is disabled, simply bypass it. */
> +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +		write(priv, mod->base + FILT_MODE_REG, 0);
> +		return 0;
> +	}
> +
> +	/* Native values are at RPP 18-bit precision. */
> +	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->thresh_bl0);
> +	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->thresh_bl1);
> +	write(priv, mod->base + FILT_THRESH_SH0_REG, cfg->thresh_sh0);
> +	write(priv, mod->base + FILT_THRESH_SH1_REG, cfg->thresh_sh1);
> +
> +	/* Native values are at RPP 8-bit precision. */
> +	write(priv, mod->base + FILT_FAC_BL0_REG, cfg->fac_bl0);
> +	write(priv, mod->base + FILT_FAC_BL1_REG, cfg->fac_bl1);
> +	write(priv, mod->base + FILT_FAC_MID_REG, cfg->fac_mid);
> +	write(priv, mod->base + FILT_FAC_SH0_REG, cfg->fac_sh0);
> +	write(priv, mod->base + FILT_FAC_SH1_REG, cfg->fac_sh1);
> +
> +	/*
> +	 * The lum_weight field is provided in RPP register format:
> +	 *
> +	 * 31		unused
> +	 * 30:28	lum_weight_gain
> +	 * 27:24	unused
> +	 * 23:12	lum_weight_kink
> +	 * 11:0		lum_weight_min
> +	 */
> +	write(priv, mod->base + FILT_LUM_WEIGHT_REG, cfg->lum_weight);
> +
> +	write(priv, mod->base + FILT_MODE_REG,
> +	      (cfg->chr_v_mode << 4) |
> +	      (cfg->chr_h_mode << 6) |
> +	      (cfg->grn_stage1 << 8) |
> +	      (cfg->mode ? FILT_MODE_FILT_MODE : 0) |
> +	      FILT_MODE_FILT_ENABLE);
> +
> +	return 0;
> +}
> +
> +static int
> +rppx1_db_fill_params(struct rpp_module *mod,
> +		     const union rppx1_params_block *block,
> +		     rppx1_reg_write write, void *priv)
> +{
> +	switch (block->header.type) {
> +	case RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST:
> +		return rppx1_db_fill_params_demosaic(mod, block, write, priv);
> +	case RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST:
> +		return rppx1_db_fill_params_filter(mod, block, write, priv);
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  const struct rpp_module_ops rppx1_db_ops = {
>  	.probe = rppx1_db_probe,
> +	.fill_params = rppx1_db_fill_params,
>  };
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> index d173c0c1bfc0..378b18dbc48d 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -91,6 +91,8 @@ enum rppx1_meas_chan {
>   * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
>   * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
>   * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST: Debayer demosaicing
> + * @RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST: Debayer filtering
>   */
>  enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> @@ -109,6 +111,8 @@ enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
>  	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
>  	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
> +	RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST,
> +	RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST,
>  };
>
>  /**
> @@ -544,6 +548,56 @@ struct rppx1_ga_params {
>  	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
>  };
>
> +/**
> + * struct rppx1_db_demosaic_params - Debayer demosaic configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST)
> + * @demosaic_th: threshold for texture detection, 16-bit
> + */
> +struct rppx1_db_demosaic_params {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 demosaic_th;
> +};
> +
> +/**
> + * struct rppx1_db_filter_params - Debayer filter (denoise) configuration
> + *
> + * RPP-X1 thresholds are 18-bit and factors are 8-bit.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST)
> + * @mode: filter mode
> + * @grn_stage1: green filter stage 1 select (range 0x0...0x8)
> + * @chr_h_mode: chroma filter horizontal mode
> + * @chr_v_mode: chroma filter vertical mode
> + * @thresh_bl0: If thresh_bl1 < sum_grad < thresh_bl0 then fac_bl0 is selected (blurring th)
> + * @thresh_bl1: If sum_grad < thresh_bl1 then fac_bl1 is selected (blurring th)
> + * @thresh_sh0: If thresh_sh0 < sum_grad < thresh_sh1 then thresh_sh0 is selected (sharpening th)
> + * @thresh_sh1: If thresh_sh1 < sum_grad then thresh_sh1 is selected (sharpening th)
> + * @lum_weight: luminance weight, min (bits 0:11), kink (bits 12:23), gain (bits 28:30)
> + * @fac_sh1: filter factor for sharp1 level
> + * @fac_sh0: filter factor for sharp0 level
> + * @fac_mid: filter factor for mid level and for static filter mode
> + * @fac_bl0: filter factor for blur0 level
> + * @fac_bl1: filter factor for blur1 level (max blur)
> + */
> +struct rppx1_db_filter_params {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 mode;
> +	__u8 grn_stage1;
> +	__u8 chr_h_mode;
> +	__u8 chr_v_mode;
> +	__u32 thresh_bl0;
> +	__u32 thresh_bl1;
> +	__u32 thresh_sh0;
> +	__u32 thresh_sh1;
> +	__u32 lum_weight;
> +	__u32 fac_sh1;
> +	__u32 fac_sh0;
> +	__u32 fac_mid;
> +	__u32 fac_bl0;
> +	__u32 fac_bl1;
> +};
> +
>  /**
>   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
>   *
> @@ -566,7 +620,9 @@ struct rppx1_ga_params {
>  	sizeof(struct rppx1_lsc_params)				+	\
>  	sizeof(struct rppx1_lsc_params)				+	\
>  	sizeof(struct rppx1_ga_params)				+	\
> -	sizeof(struct rppx1_ga_params))
> +	sizeof(struct rppx1_ga_params)				+	\
> +	sizeof(struct rppx1_db_demosaic_params)			+	\
> +	sizeof(struct rppx1_db_filter_params))
>
>  /* ---------------------------------------------------------------------------
>   * Statistics Structures
> --
> 2.54.0
>
>

