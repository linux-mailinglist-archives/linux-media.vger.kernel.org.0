Return-Path: <linux-media+bounces-60653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +iASD/Fm+2llawMAu9opvQ
	(envelope-from <linux-media+bounces-60653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:06:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D464DDD75
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 18:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A334303BB98
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 15:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E093B495526;
	Wed,  6 May 2026 15:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YrtBsmd7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA3E4657E2;
	Wed,  6 May 2026 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083078; cv=none; b=jjkbtbLflqtc35ozRqbkJnyZLfP44KHLOgpwPsB63HzBGgD0Yp74pQQBpVdpi+RFv80baVXk6gmvNtyb+xXoi9uSaP8HE/HQyzEl62bLnNKlcHj70eU3ZR6PI8ZI6LMNFdRr/RAqeJ3TjQxDHKhQz/RB6iIYq1G3oCxN4X+4ntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083078; c=relaxed/simple;
	bh=OWuZqJYF2TnMs5gVPN/obOTQDAKJkWQhVJV3NE/LIlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDPjoJBwbnFKM0Xw77IEHMkEdoCgmk1ePhXSWkjwD/ckmKXXLHjtMz5ktOoPJNQpORbAva04itccdiFJS2ccUBDx2X6b6GqDWnyfFjgKAY9gfxlLaSuP1Bc8krX42EgRAjpKgdR7sVHf2AvWLIGaeSjEeyqkHdRvyrzscFbVoYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YrtBsmd7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49E09DA;
	Wed,  6 May 2026 17:57:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778083069;
	bh=OWuZqJYF2TnMs5gVPN/obOTQDAKJkWQhVJV3NE/LIlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrtBsmd758u4EGTX+aABd3n7bvjLLluc/oWtXdS5hjgAxcMWs/ACYqJ+vwMn14RyR
	 CJBaM5LjABjo6woHX2gCahqA8+L4BxfUquf+TrV6ukIb0W85PAAgauF18bP6+QBeJu
	 e6G1HpVr/73/3T9UiPqAt97FVY4jjxi4u0kw783g=
Date: Wed, 6 May 2026 17:57:49 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [v8 14/14] media: rppx1: lin: Add support for gamma sensor
 linearization
Message-ID: <aftkY_BuG0E_e0qC@zed>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-15-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260504010556.2796398-15-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Queue-Id: D8D464DDD75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60653-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Niklas,

On Mon, May 04, 2026 at 03:05:56AM +0200, Niklas Söderlund wrote:
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
>  .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
>  .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
>  .../platform/dreamchip/rppx1/rppx1_lin.c      | 55 +++++++++++++++++++
>  .../uapi/linux/media/dreamchip/rppx1-config.h | 48 +++++++++++++++-
>  4 files changed, 108 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> index 136ec4d48054..27235fdfb749 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> @@ -86,6 +86,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
>  union rppx1_params_block {
>  	struct v4l2_isp_params_block_header header;
>  	struct rppx1_bls_params bls;
> +	struct rppx1_lin_params lin;
>  	struct rppx1_lsc_params lsc;
>  	struct rppx1_awbg_params awbg;
>  	struct rppx1_bd_params bd;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index edea25293d64..1995a80890f4 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -18,6 +18,8 @@ static const struct v4l2_isp_block_type_info
>  rppx1_ext_params_blocks_info[] = {
>  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
>  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
> +	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE1, lin),
> +	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE2, lin),
>  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> @@ -72,6 +74,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
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
> index f595f56a292e..cc8efe3b3f2c 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> @@ -24,6 +24,11 @@
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
> @@ -52,7 +57,57 @@ static int rppx1_lin_start(struct rpp_module *mod,
>  	return 0;
>  }
>
> +static int rppx1_lin_fill_params(struct rpp_module *mod,
> +				 const union rppx1_params_block *block,
> +				 rppx1_reg_write write, void *priv)
> +{
> +	const struct rppx1_lin_params *cfg = &block->lin;
> +	u8 sample_mask;
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
> +	u32 dx_lo = 0;
> +	u32 dx_hi = 0;

I was clearly over-excited by the modernity of C99 that allows mixing
declarations and code. However this is still a discouraged practice
unless there are good reasons to do so. Probably in this case there
aren't enough.

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
> index 0246e9af1d1d..e743e11d11e9 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -95,6 +95,8 @@ enum rppx1_meas_chan {
>   * @RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST: Debayer filtering
>   * @RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1: PRE1 pipe De-noise Pre-Filter
>   * @RPPX1_PARAMS_BLOCK_TYPE_BD_PRE2: PRE2 pipe De-noise Pre-Filter
> + * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1: PRE1 pipe Linearization (Sensor De-gamma)
> + * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2: PRE2 pipe Linearization (Sensor De-gamma)
>   */
>  enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> @@ -117,6 +119,8 @@ enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST,
>  	RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1,
>  	RPPX1_PARAMS_BLOCK_TYPE_BD_PRE2,
> +	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1,
> +	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2,
>  };
>
>  /**
> @@ -735,6 +739,46 @@ struct rppx1_bd_params {
>  	struct rppx1_bd_nll nll;
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
> @@ -761,7 +805,9 @@ struct rppx1_bd_params {
>  	sizeof(struct rppx1_db_demosaic_params)			+	\
>  	sizeof(struct rppx1_db_filter_params)			+	\
>  	sizeof(struct rppx1_bd_params)				+	\
> -	sizeof(struct rppx1_bd_params))
> +	sizeof(struct rppx1_bd_params)				+	\
> +	sizeof(struct rppx1_lin_params)				+	\
> +	sizeof(struct rppx1_lin_params))
>
>  /* ---------------------------------------------------------------------------
>   * Statistics Structures
> --
> 2.54.0
>
>

