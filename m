Return-Path: <linux-media+bounces-61577-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK+GBlWKBWrGYAIAu9opvQ
	(envelope-from <linux-media+bounces-61577-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:39:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 122B753F68B
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 10:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 60B5D300FB0A
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 08:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D650C3DD842;
	Thu, 14 May 2026 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D+ZYveE6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC2A3DC850;
	Thu, 14 May 2026 08:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747977; cv=none; b=D/zv8y33lubWER1kvIgSSblHiTTUY/9zb9Q4lLo0cEWAs3Xhl9ZUyOTcQy+OhDZCc7PEmTnRU5aT0hXXDJ7rB+jUFnllpT9jolJsBmKVo1+my+f4t63i/nwXsT8F31c102AZRcWG8y6KmjpeBEFjigWzt25DBaVXOtZ6ZNxIiDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747977; c=relaxed/simple;
	bh=/5D1jP71rjhw0zPFbzEP5Gnt6PsPIb3/BLmRvytHfQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZ0CnDGVe185rE7J2Bd/NtQgb3tlEqYVsYBOrYDCqRRYhr+g7NVfDpfqUAn6USojfY+UxCj6RnK7v5GjriS5e3v02FfEr78aeWw+kwDti94Amf4tnj3DmJ6KEOs0blETxPlyKcXWevowYvaWG8XaOMsRTvScwKHCDLtIePnrf8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D+ZYveE6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 544C5454;
	Thu, 14 May 2026 10:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778747965;
	bh=/5D1jP71rjhw0zPFbzEP5Gnt6PsPIb3/BLmRvytHfQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+ZYveE695cylVRmhWHTX/PINFTWOzpGqYSnCilvuPd6cOaRZFVJz+laPuGAsYPB0
	 qucQs5Ib2zJEtmGc+EeWOH1Xz9cTTlUmirBlMcZQIgeFwuJOl6fwiET6MR79+uLvOT
	 ahevqRi3omDicdCqcJ3Q8Vbxa2zOGlwq5ikzTvK8=
Date: Thu, 14 May 2026 10:39:31 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] media: i2c: ov5640: Disable ISP for raw output
Message-ID: <agV9sFGnM6soxHub@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-10-0869a7802a33@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260501-ov5640_cleanup-v1-10-0869a7802a33@ideasonboard.com>
X-Rspamd-Queue-Id: 122B753F68B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61577-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Kieran

On Fri, May 01, 2026 at 04:39:12PM +0100, Kieran Bingham wrote:
> The OV5640 has ISP operations that can run even when outputting RAW
> bayer data.  These include the Lens Shading Correction, Gamma and Auto
> white balance which need to be disabled when performing module
> calibration using RAW data.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 45 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index fd369a13463e..f63d81640f54 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -280,28 +280,28 @@ static const struct ov5640_pixfmt ov5640_dvp_formats[] = {
>  	}, {
>  		/* Raw, BGBG... / GRGR... */
>  		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.colorspace	= V4L2_COLORSPACE_RAW,
>  		.bpp		= 8,
>  		.ctrl00		= 0x00,
>  		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
>  		/* Raw bayer, GBGB... / RGRG... */
>  		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.colorspace	= V4L2_COLORSPACE_RAW,
>  		.bpp		= 8,
>  		.ctrl00		= 0x01,
>  		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
>  		/* Raw bayer, GRGR... / BGBG... */
>  		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.colorspace	= V4L2_COLORSPACE_RAW,
>  		.bpp		= 8,
>  		.ctrl00		= 0x02,
>  		.mux		= OV5640_FMT_MUX_RAW_DPC,
>  	}, {
>  		/* Raw bayer, RGRG... / GBGB... */
>  		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.colorspace	= V4L2_COLORSPACE_RAW,
>  		.bpp		= 8,
>  		.ctrl00		= 0x03,
>  		.mux		= OV5640_FMT_MUX_RAW_DPC,
> @@ -348,7 +348,7 @@ static const struct ov5640_pixfmt ov5640_csi2_formats[] = {
>  	}, {
>  		/* Raw, BGBG... / GRGR... */
>  		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
> -		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.colorspace	= V4L2_COLORSPACE_RAW,
>  		.bpp		= 8,
>  		.ctrl00		= 0x00,
>  		.mux		= OV5640_FMT_MUX_RAW_DPC,
> @@ -473,6 +473,7 @@ struct ov5640_dev {
>
>  	struct v4l2_mbus_framefmt fmt;
>  	bool pending_fmt_change;
> +	bool is_raw;
>
>  	const struct ov5640_mode_info *current_mode;
>  	const struct ov5640_mode_info *last_mode;
> @@ -618,8 +619,13 @@ static const struct reg_value ov5640_init_setting[] = {
>  	{0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
>
>  	/* ISP Control */
> -	{OV5640_REG_ISP_CTRL00, 0xa7, 0, 0},
> -	{OV5640_REG_ISP_CTRL01, 0xa3, 0, 0},
> +	{OV5640_REG_ISP_CTRL00, OV5640_ISP_00_LENC_ENABLE | OV5640_ISP_00_GMA_ENABLE |
> +				OV5640_ISP_00_BPC_ENABLE | OV5640_ISP_00_WPC_ENABLE |
> +				OV5640_ISP_00_CIP_ENABLE, 0, 0},
> +
> +	/* OV5640_ISP_01_UVA_ENABLE is not enabled */
> +	{OV5640_REG_ISP_CTRL01, OV5640_ISP_01_SDE_ENABLE | OV5640_ISP_01_SCL_ENABLE |
> +				OV5640_ISP_01_CMX_ENABLE | OV5640_ISP_01_AWB_ENABLE, 0, 0},

Should we avoid writing these registers at all in the init sequence ?

>
>  	/* AWB Control */
>  	{OV5640_REG_AWB_CONTROL_00, 0xff, 0, 0}, /* AWB B Block */
> @@ -3116,6 +3122,31 @@ static int ov5640_set_framefmt(struct ov5640_dev *sensor,
>  	if (ret)
>  		return ret;
>
> +	/*
> +	 * Disable all ISP image processing (Lens Shading, Gamma, AWB...) for
> +	 * RAW modes to facilitate module tuning.
> +	 */
> +	sensor->is_raw = pixfmt->colorspace == V4L2_COLORSPACE_RAW;

Unless it is used later on, the 'is_raw' flag can be kept a local
variable.

> +	if (sensor->is_raw) {
> +		ret = ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL00, 0);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL00,
> +				       OV5640_ISP_00_LENC_ENABLE | OV5640_ISP_00_GMA_ENABLE |
> +				       OV5640_ISP_00_BPC_ENABLE | OV5640_ISP_00_WPC_ENABLE |
> +				       OV5640_ISP_00_CIP_ENABLE);
> +		if (ret)
> +			return ret;
> +
> +		/* OV5640_ISP_01_UVA_ENABLE is not enabled */
> +		ret = ov5640_write_reg(sensor, OV5640_REG_ISP_CTRL01,
> +				       OV5640_ISP_01_SDE_ENABLE | OV5640_ISP_01_SCL_ENABLE |
> +				       OV5640_ISP_01_CMX_ENABLE | OV5640_ISP_01_AWB_ENABLE);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	/*
>  	 * TIMING TC REG21:
>  	 * - [5]:	JPEG enable
>
> --
> 2.52.0
>
>

