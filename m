Return-Path: <linux-media+bounces-63621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vcfXIv8/IGoGzQAAu9opvQ
	(envelope-from <linux-media+bounces-63621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:53:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C2C638D0D
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:53:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=eT8scUdi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63621-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63621-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68B15303FAE9
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E953812ED;
	Wed,  3 Jun 2026 14:33:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F252233ADA3;
	Wed,  3 Jun 2026 14:33:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497238; cv=none; b=P1tD25+yIQxQOvZEf6nRbki+H5xFFb4H7aYnDGRE7YjPq3e+zGRth4exCIWPvavNLhMn+j0bvBNAXqNW0muGOl1Jv3C46QserZ5tz26MRfrKfU+Om5KQP3Joujvv1PJaIssc5StcKfMsgU3uG4JSj1NjxUVQanTg58bDZKAvzKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497238; c=relaxed/simple;
	bh=UTcBEx5Okbprk6wN9sGn7FXnZinOqc/dR1NUcU+TZFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NInd3S01LQT0aPitY+xJ9t6WI8cYw71Dyq6z6bKFsd5/UW3WR9+HaLPbllTEf492HPnaUh8XGumaK3VCI2V1BlozBGuhGPZziEr4p7UiJrxYlqqOnfNcDuNzsGHY3CljWoilR0vWDKEsduM5YT4kEEzVxLIQTBOGXK1QkUAX0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eT8scUdi; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C777C929;
	Wed,  3 Jun 2026 16:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780497211;
	bh=UTcBEx5Okbprk6wN9sGn7FXnZinOqc/dR1NUcU+TZFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eT8scUdiSwiZU0vIpbKpif4dEiqPkX6/wf8TqNE+q1qDkc3v5urBWncTg8s4EeLIT
	 g6j8yEexHDAowziqy2gYuQi/sMa1HR88qwFqhXnKYfu8WrdKiFNAS+/SfScy/1YGw8
	 Df3LPTCGIgrlFxwEHRc/90wZENLCGxVd5N4Zop00=
Date: Wed, 3 Jun 2026 16:33:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v9 12/13] media: rppx1: ga: Add support for gamma out
 correction
Message-ID: <aiA7Qk9CwyN-lE7M@zed>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-13-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516211320.3041412-13-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63621-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,zed:mid,ragnatech.se:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05C2C638D0D

Hi Niklas

On Sat, May 16, 2026 at 11:13:19PM +0200, Niklas Söderlund wrote:
> Extend the RPPX1 driver to allow setting the gamma out correction
> configuration parameters. It uses the RPPX1 framework for parameters and
> its writer abstraction to allow the user to control how, and when,
> configuration is applied to the RPPX1.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
>  .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
>  .../media/platform/dreamchip/rppx1/rppx1_ga.c | 43 ++++++++++++++-
>  .../uapi/linux/media/dreamchip/rppx1-config.h | 53 ++++++++++++++++++-
>  4 files changed, 100 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> index 48b61b5c35b4..948e26d7361d 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> @@ -54,6 +54,7 @@ union rppx1_params_block {
>  	struct rppx1_hist_params hist;
>  	struct rppx1_exm_params exm;
>  	struct rppx1_wbmeas_params wbmeas;
> +	struct rppx1_ga_params ga;
>  };
>
>  union rppx1_stats_block {
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index 8d85d0c7bff1..86d445b52504 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -30,6 +30,8 @@ rppx1_ext_params_blocks_info[] = {
>  	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE1, exm),
>  	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE2, exm),
>  	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> +	RPPX1_PARAMS_BLOCK_INFO(GA_HV, ga),
> +	RPPX1_PARAMS_BLOCK_INFO(GA_MV, ga),
>  };
>
>  int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> @@ -84,6 +86,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
>  			module = &rpp->post.wbmeas;
>  			break;
> +		case RPPX1_PARAMS_BLOCK_TYPE_GA_HV:
> +			module = &rpp->hv.ga;
> +			break;
>  		default:
>  			dev_warn(rpp->dev,
>  				 "Not handled RPPX1 block type: 0x%04x\n",
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
> index 0667672b2694..1d9c24c43f77 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
> @@ -15,9 +15,11 @@
>  #define GAMMA_OUT_MODE_REG			0x0008
>  #define GAMMA_OUT_MODE_GAMMA_OUT_EQU_SEGM	BIT(0)
>
> -#define GAMMA_OUT_Y_REG_NUM			17
>  #define GAMMA_OUT_Y_REG(n)			(0x000c + (4 * (n)))
>
> +#define GAMMA_OUT_HV_GAMMA_CURVE_MASK		GENMASK(11, 0)
> +#define GAMMA_OUT_MV_GAMMA_CURVE_MASK		GENMASK(23, 0)
> +
>  static int rppx1_ga_probe(struct rpp_module *mod)
>  {
>  	/* Version check. */
> @@ -44,7 +46,46 @@ static int rppx1_ga_start(struct rpp_module *mod,
>  	return 0;
>  }
>
> +static int
> +rppx1_ga_fill_params(struct rpp_module *mod,
> +		     const union rppx1_params_block *block,
> +		     rppx1_reg_write write, void *priv)
> +{
> +	const struct rppx1_ga_params *cfg = &block->ga;
> +	u32 mask;
> +
> +	/* If the modules is disabled, simply bypass it. */
> +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +		write(priv, mod->base + GAMMA_OUT_ENABLE_REG, 0);
> +		return 0;
> +	}
> +
> +	switch (cfg->header.type) {
> +	case RPPX1_PARAMS_BLOCK_TYPE_GA_HV:
> +		mask = GAMMA_OUT_HV_GAMMA_CURVE_MASK;
> +		break;
> +	case RPPX1_PARAMS_BLOCK_TYPE_GA_MV:
> +		mask = GAMMA_OUT_MV_GAMMA_CURVE_MASK;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	write(priv, mod->base + GAMMA_OUT_MODE_REG, cfg->mode);
> +
> +	for (unsigned int i = 0; i < RPPX1_GA_MAX_SAMPLES; i++)
> +		write(priv, mod->base + GAMMA_OUT_Y_REG(i),
> +		      cfg->gamma_y[i] & mask);
> +
> +	/* Enable module. */
> +	write(priv, mod->base + GAMMA_OUT_ENABLE_REG,
> +	      GAMMA_OUT_ENABLE_GAMMA_OUT_EN);
> +
> +	return 0;
> +}
> +
>  const struct rpp_module_ops rppx1_ga_ops = {
>  	.probe = rppx1_ga_probe,
>  	.start = rppx1_ga_start,
> +	.fill_params = rppx1_ga_fill_params,
>  };
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> index 7ebcc00ace04..05faec2f68e3 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -91,6 +91,8 @@ enum rppx1_meas_chan {
>   * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
>   * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1: PRE1 pipe Lens Shading Correction
>   * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
>   */
>  enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> @@ -107,6 +109,8 @@ enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
>  	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1,
>  	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
> +	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
> +	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
>  };
>
>  /**
> @@ -497,6 +501,51 @@ struct rppx1_lsc_params {
>  	__u16 y_sect_size[RPPX1_LSC_NUM_SECTORS];
>  };
>
> +/* Gamma Out */
> +#define RPPX1_GA_MAX_SAMPLES 17
> +
> +/**
> + * enum rppx1_ga_seg_mode - Gamma out curve segmentation mode
> + *
> + * Segmentation mode of the 16 input sampling points for the Gamma Out
> + * Correction module.
> + *
> + * @RPPX1_GA_SEG_MODE_LOGARITHMIC: logarithmic-like segmentation mode
> + * @RPPX1_GA_SEG_MODE_EQUIDISTANT: equidistant segmentation mode
> + */
> +enum rppx1_ga_seg_mode {
> +	RPPX1_GA_SEG_MODE_LOGARITHMIC,
> +	RPPX1_GA_SEG_MODE_EQUIDISTANT
> +};
> +
> +/**
> + * struct rppx1_ga_params - Gamma Out Correction configuration
> + *
> + * The Gamma Out Correction module is available on the Human Vision Output
> + * Pipe (HV) and the Machine Vision Output Pipe (MV). Userspace selects
> + * which pipe to operate by setting the @header.type field to
> + * RPPX1_PARAMS_BLOCK_TYPE_GA_HV or RPPX1_PARAMS_BLOCK_TYPE_GA_MV.
> + *
> + * The module allows to apply a @gamma_y gamma correction curve to RGB data
> + * represented as a table of 16 entries. The 16 input sampling points can be
> + * equidistant or segmented using a logarithmic scale according to the value of
> + * @mode.
> + *
> + * The gamma curve values are 12 bits on the HV output pipe and 24 bits on the
> + * MV output pipe. Userspace is expected to provide the curve values with a
> + * bit-depth matching the one of pipe in use.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_GA_HV or
> + *	    type = RPPX1_PARAMS_BLOCK_TYPE_GA_MV)
> + * @mode: gamma curve input segmentation mode (see rppx1_ga_seg_mode)
> + * @gamma_y: gamma out curve y-axis values
> + */
> +struct rppx1_ga_params {
> +	struct v4l2_isp_params_block_header header;
> +	__u8 mode;
> +	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
> +};
> +
>  /**
>   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
>   *
> @@ -517,7 +566,9 @@ struct rppx1_lsc_params {
>  	sizeof(struct rppx1_bls_params)				+	\
>  	sizeof(struct rppx1_ccor_params)			+	\
>  	sizeof(struct rppx1_lsc_params)				+	\
> -	sizeof(struct rppx1_lsc_params))
> +	sizeof(struct rppx1_lsc_params)				+	\
> +	sizeof(struct rppx1_ga_params)				+	\
> +	sizeof(struct rppx1_ga_params))
>
>  /* ---------------------------------------------------------------------------
>   * Statistics Structures
> --
> 2.54.0
>

