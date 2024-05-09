Return-Path: <linux-media+bounces-11248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D78C17CD
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BD67B23F1D
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 20:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BDB80617;
	Thu,  9 May 2024 20:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p+sC52s+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97247F7F5;
	Thu,  9 May 2024 20:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715287510; cv=none; b=Tja/4pmosgPSp1N4VTTgflb7fjbYbED9MnBIUnlBF62Y/3ghsFeRCcxFFBTvEhDFf9O62FU+Xb1wP/XlAlH8yMlG5Rbyf8W+GFXfGKxrVpsHpHU00+9fSjLJG7yx5YY2FLbB3/wYuzmuSZuKhfe1hnzHT7mM0OPbR2V4JAdCGEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715287510; c=relaxed/simple;
	bh=atfK6CgaXFdCrhae+pcigKkKQ5+RSaXvkEmd01pFayw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qktvO2O9asXyp5a+WRK8JGQVgqa83flqFgeVk3zs67FhB7DS5Ec+n4CiWsg+C2j7Oh3vDdMDbxDCyTBBgvxXtq2CzVfEB5OFc1Ubrnl9I9X03zdrhey4UDt1ifQdJvoWWPtu7jig0vuJf9RuUvBCWWoVbFcidUVMY8U2CLQUyL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p+sC52s+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A573C2320;
	Thu,  9 May 2024 22:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715287501;
	bh=atfK6CgaXFdCrhae+pcigKkKQ5+RSaXvkEmd01pFayw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+sC52s+C4bcdcL3DJ6CNquPNXOJSOuWuxtGWQoDCxMpCJr3RT5fRHN6UKl0LG+60
	 gIuREP5ceNptn6X7mjxiGH+pQAEmn3dLlKpBjWY4HVeTrSQFnCghWc4KX/Q6d4vMPS
	 ohGEbzT7oX3OL1MIA41oI2nExaQEfge1Vk32A5Kw=
Date: Thu, 9 May 2024 23:44:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 05/11] media: adv748x-csi2: Implement enum_mbus_codes
Message-ID: <20240509204456.GB6407@pendragon.ideasonboard.com>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-6-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240509161403.111789-6-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Thu, May 09, 2024 at 06:13:55PM +0200, Jacopo Mondi wrote:
> Define a list of supported mbus codes for the TXA and TXB CSI-2
> transmitters and implement the enum_mbus_code operation.
> 
> The TXB transmitter only support YUV422 while the TXA one supports
> multiple formats as reported by the chip's manual in section 9.7.
> but the HDMI and AFE subdevices only provide RGB888 and YUV422, so only
> list those ones here.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 45 ++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 5b265b722394..29b18b6c8b0e 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -14,6 +14,15 @@
>  
>  #include "adv748x.h"
>  
> +static const unsigned int adv748x_csi2_txa_fmts[] = {
> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +};
> +
> +static const unsigned int adv748x_csi2_txb_fmts[] = {
> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +};
> +
>  int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx, unsigned int vc)
>  {
>  	return tx_write(tx, ADV748X_CSI_VC_REF, vc << ADV748X_CSI_VC_REF_SHIFT);
> @@ -139,6 +148,41 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
>   * But we must support setting the pad formats for format propagation.
>   */
>  
> +static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *sd_state,
> +				       struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> +	const unsigned int *codes = is_txa(tx) ?
> +				    adv748x_csi2_txa_fmts :
> +				    adv748x_csi2_txb_fmts;
> +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> +
> +	/*
> +	 * The format available on the source pad is the one applied on the sink
> +	 * pad.
> +	 */
> +	if (code->pad == ADV748X_CSI2_SOURCE) {
> +		struct v4l2_mbus_framefmt *fmt;
> +
> +		if (code->index)
> +			return -EINVAL;
> +
> +		fmt = v4l2_subdev_state_get_format(sd_state, ADV748X_CSI2_SINK);
> +		code->code = fmt->code;
> +
> +		return 0;
> +	}
> +
> +	if (code->index >= num_fmts)
> +		return -EINVAL;
> +
> +	code->code = codes[code->index];
> +
> +	return 0;
> +}
> +
>  static struct v4l2_mbus_framefmt *
>  adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *sd_state,
> @@ -228,6 +272,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
>  }
>  
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
> +	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
>  	.get_fmt = adv748x_csi2_get_format,
>  	.set_fmt = adv748x_csi2_set_format,
>  	.get_mbus_config = adv748x_csi2_get_mbus_config,

-- 
Regards,

Laurent Pinchart

