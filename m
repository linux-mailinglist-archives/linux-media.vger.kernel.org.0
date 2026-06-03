Return-Path: <linux-media+bounces-63624-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A+usCiI/IGq6zAAAu9opvQ
	(envelope-from <linux-media+bounces-63624-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:50:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B7B638C66
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:50:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=hd0ht3Vv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63624-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63624-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 777E6301066A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C329D33B6E8;
	Wed,  3 Jun 2026 14:37:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D848B3D5656;
	Wed,  3 Jun 2026 14:36:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497420; cv=none; b=tCxiU3gNiVpNfOTo7vySjVBADcCw9gB/RFGsk6CtG1phUYQns3XtqvjGMNtJK5e3sBptWvJbTzWEdOAsFyVdZcWuL066CdS4SYp2VuWjU2ucHzGY+20VW+/+UV5gZYxOAYUA95Y6tUDFNCqawjLA+DqzVc1zw8Msi1gHTgBCFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497420; c=relaxed/simple;
	bh=CgKn3OdnfOwNEonAEFPcK4mhMQO9SC84zlDDuAxpR2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJWG6eiQcFVRbAaIXXJQiSWG41fpxcjIcWRixiD1COfgAzoZqT4VAtF5bEsG335xZ41OmIeRBADmNiNR1Seva9CKyn4FRGO5HQY0ICLvBw+1Lhfr2wSqHLrIEznRUnwR/YrjBs9GxE2Aqs0+yhEJ/o5jTOFzUzBkuDyMmVcH3rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hd0ht3Vv; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEA14929;
	Wed,  3 Jun 2026 16:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780497392;
	bh=CgKn3OdnfOwNEonAEFPcK4mhMQO9SC84zlDDuAxpR2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hd0ht3VvSuOhshJWXkHo/B2ftUzAXu++R2FNlWutqgQEpjV+POyMkhd5ernGPlobL
	 MWeD3PTwh2K1XucEhdwf//4kUYTWsRk0hgJjUuLi0Avkcffvq3M51YcOfx7bq75oyP
	 iY1VNslEa1XQatp6dr+TAwrRGJJOKEbzV0SLQGU0=
Date: Wed, 3 Jun 2026 16:36:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v9 13/13] media: rppx1: lin: Add support for gamma sensor
 linearization
Message-ID: <aiA7sxSVeARebisR@zed>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-14-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516211320.3041412-14-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63624-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ragnatech.se:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,zed:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6B7B638C66

Hi Niklas

On Sat, May 16, 2026 at 11:13:20PM +0200, Niklas Söderlund wrote:
> From: Jai Luthra <jai.luthra@ideasonboard.com>
>
> Extend the RPPX1 driver to allow setting the gamma sensor linearization
> configuration parameters. It uses the RPPX1 framework for parameters and
> its writer abstraction to allow the user to control how, and when,
> configuration is applied to the RPPX1.
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v8
> - Move declaration of dx_lo and dx_hi to top of function.
> ---
>  .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
>  .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
>  .../platform/dreamchip/rppx1/rppx1_lin.c      | 54 +++++++++++++++++++
>  .../uapi/linux/media/dreamchip/rppx1-config.h | 48 ++++++++++++++++-
>  4 files changed, 107 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> index 948e26d7361d..072309d8662d 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> @@ -48,6 +48,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
>  union rppx1_params_block {
>  	struct v4l2_isp_block_header header;
>  	struct rppx1_bls_params bls;
> +	struct rppx1_lin_params lin;
>  	struct rppx1_lsc_params lsc;
>  	struct rppx1_awbg_params awbg;
>  	struct rppx1_ccor_params ccor;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index 86d445b52504..a75a27a8afd0 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
>  rppx1_ext_params_blocks_info[] = {
>  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
>  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
> +	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE1, lin),
> +	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE2, lin),
>  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> @@ -68,6 +70,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
>  			module = &rpp->pre1.bls;
>  			break;
> +		case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1:
> +			module = &rpp->pre1.lin;
> +			break;
>  		case RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1:
>  			module = &rpp->pre1.lsc;
>  			break;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> index 0a0e7ab2d1d6..04a92f24ab49 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> @@ -25,6 +25,11 @@
>  #define LIN_B_Y_REG_NUM				17
>  #define LIN_B_Y_REG(n)				(0x0098 + (4 * (n)))
>
> +#define LIN_PRE1_DEGAMMA_CURVE_MASK		GENMASK(23, 0)
> +#define LIN_PRE1_SAMPLE_POINTS_MASK		GENMASK(3, 0)
> +#define LIN_PRE2_DEGAMMA_CURVE_MASK		GENMASK(11, 0)
> +#define LIN_PRE2_SAMPLE_POINTS_MASK		GENMASK(2, 0)
> +
>  static int rppx1_lin_probe(struct rpp_module *mod)
>  {
>  	/* Version check. */
> @@ -53,7 +58,56 @@ static int rppx1_lin_start(struct rpp_module *mod,
>  	return 0;
>  }
>
> +static int rppx1_lin_fill_params(struct rpp_module *mod,
> +				 const union rppx1_params_block *block,
> +				 rppx1_reg_write write, void *priv)
> +{
> +	const struct rppx1_lin_params *cfg = &block->lin;
> +	u8 sample_mask;
> +	u32 dx_lo = 0;
> +	u32 dx_hi = 0;
> +	u32 mask;
> +
> +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +		write(priv, mod->base + LIN_ENABLE_REG, 0);
> +		return 0;
> +	}
> +
> +	switch (cfg->header.type) {
> +	case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1:
> +		mask = LIN_PRE1_DEGAMMA_CURVE_MASK;
> +		sample_mask = LIN_PRE1_SAMPLE_POINTS_MASK;
> +		break;
> +	case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2:
> +		mask = LIN_PRE2_DEGAMMA_CURVE_MASK;
> +		sample_mask = LIN_PRE2_SAMPLE_POINTS_MASK;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	for (unsigned int i = 0; i < 8; ++i) {
> +		dx_lo |= (cfg->dx[i] & sample_mask) << 4 * i;
> +		dx_hi |= (cfg->dx[i + 8] & sample_mask) << 4 * i;
> +	}
> +
> +	write(priv, mod->base + LIN_DX_LO_REG, dx_lo);
> +	write(priv, mod->base + LIN_DX_HI_REG, dx_hi);
> +
> +	for (unsigned int i = 0; i < RPPX1_LIN_DEGAMMA_CURVE_NUM; i++) {
> +		write(priv, mod->base + LIN_R_Y_REG(i), cfg->curve_r[i] & mask);
> +		write(priv, mod->base + LIN_G_Y_REG(i), cfg->curve_g[i] & mask);
> +		write(priv, mod->base + LIN_B_Y_REG(i), cfg->curve_b[i] & mask);
> +	}
> +
> +	if ((cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))

Why is this conditional ?

Do you think it could be enabled unconditionally ? the "disable" case
is handled already above, isn't it ?


> +		write(priv, mod->base + LIN_ENABLE_REG, LIN_ENABLE_GAMMA_IN_EN);
> +
> +	return 0;
> +}
> +
>  const struct rpp_module_ops rppx1_lin_ops = {
>  	.probe = rppx1_lin_probe,
>  	.start = rppx1_lin_start,
> +	.fill_params = rppx1_lin_fill_params,
>  };
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> index 05faec2f68e3..72f3fd836f41 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -93,6 +93,8 @@ enum rppx1_meas_chan {
>   * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
>   * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
>   * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1: PRE1 pipe Linearization (Sensor De-gamma)
> + * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2: PRE2 pipe Linearization (Sensor De-gamma)
>   */
>  enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> @@ -111,6 +113,8 @@ enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
>  	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
>  	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
> +	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1,
> +	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2,
>  };
>
>  /**
> @@ -546,6 +550,46 @@ struct rppx1_ga_params {
>  	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
>  };
>
> +/* Linearization (Sensor De-gamma) */
> +#define RPPX1_LIN_SAMPLE_POINTS_NUM 16
> +#define RPPX1_LIN_DEGAMMA_CURVE_NUM 17
> +
> +/**
> + * struct rppx1_lin_params - Linearization (Sensor De-gamma) configuration
> + *
> + * The RPP-X1 linearization module is available on the PRE1 and PRE2 pre-fusion
> + * pipes. Userspace selects which pipe to operate by setting the @header.type
> + * field to RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1 or
> + * RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2.
> + *
> + * The LIN module applies the per-color channel de-gamma linearization curves
> + * @curve_r, @curve_g and @curve_b defined on the input sampling points @dx.
> + *
> + * For the PRE1 pipe the de-gamma curves values are 24-bits, for the PRE2 pipe
> + * the de-gamma curve values are 12-bits.
> + *
> + * For the PRE1 pipe de-gamma module sampling points @dx values are in the range
> + * [0, 15] (4 bits). For the PRE2 pipe de-gamma module sampling points values
> + * are in the range [0, 7] (3 bits).
> + *
> + * Userspace is expected to provide the curve values and sampling points with a
> + * bit-depth matching the one of pipe in use.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1 or
> + *	    RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2)
> + * @curve_r: de-gamma linearization curve for red channel
> + * @curve_g: de-gamma linearization curve for green channel
> + * @curve_b: de-gamma linearization curve for blue channel
> + * @dx: input sampling points
> + */
> +struct rppx1_lin_params {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 curve_r[RPPX1_LIN_DEGAMMA_CURVE_NUM];
> +	__u32 curve_g[RPPX1_LIN_DEGAMMA_CURVE_NUM];
> +	__u32 curve_b[RPPX1_LIN_DEGAMMA_CURVE_NUM];
> +	__u8 dx[RPPX1_LIN_SAMPLE_POINTS_NUM];
> +};
> +
>  /**
>   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
>   *
> @@ -568,7 +612,9 @@ struct rppx1_ga_params {
>  	sizeof(struct rppx1_lsc_params)				+	\
>  	sizeof(struct rppx1_lsc_params)				+	\
>  	sizeof(struct rppx1_ga_params)				+	\
> -	sizeof(struct rppx1_ga_params))
> +	sizeof(struct rppx1_ga_params)				+	\
> +	sizeof(struct rppx1_lin_params)				+	\
> +	sizeof(struct rppx1_lin_params))

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>
>  /* ---------------------------------------------------------------------------
>   * Statistics Structures
> --
> 2.54.0
>

