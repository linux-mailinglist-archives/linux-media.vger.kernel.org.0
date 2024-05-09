Return-Path: <linux-media+bounces-11203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5730C8C0FC8
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 14:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB34C1F23AA5
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 12:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2C113BAC2;
	Thu,  9 May 2024 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uD0ybtNF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F51FAA;
	Thu,  9 May 2024 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258583; cv=none; b=Rto2WmgvNfOVKjlv2WaAvYupcrXCJRNYqmMSfelwdsilHY9TW0RRn08W4Ri53IDdY6PxToSM4LbY8oDorDjyHwug+XLcISw7YdoJxO6C6QiJDWY5WO6CnLod9blHor4X0rVJWkMrzMyJLKA6Js/knNq9epqjn+sRUPMtLRSP5N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258583; c=relaxed/simple;
	bh=ovbbO/jEptGHNymxWmVVvu6MBpn+VzPNNNcL869UYNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxUWpjV4X5DIqZLNN5wDIm8+z/vwOZbDD6hpY6XgroRt2vdAwtxO+ljFY5OBOOWQtJVO44OCifykilw7SKr8KeyfsCWHBB9O4VKX+CBSQ7rQmdD+g8XX5h+tAdF+k/uT06m4RiQOu+rfXpWyPgLImo8ZqsaLxUIy+BNqUNhrFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uD0ybtNF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F5E7CC8;
	Thu,  9 May 2024 14:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715258575;
	bh=ovbbO/jEptGHNymxWmVVvu6MBpn+VzPNNNcL869UYNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uD0ybtNFWMe2OqV1opTf/Q+s8sblZVqq+PsbUclEatqaWV+SVwxbXHa4hFWRAw4us
	 YODkfRhI2ydQosLCUN/R2A8W/txrBUVSOwUEnex7B6UFhn9p2GVxW2UogPdswpE7YM
	 O3Z1cd0QXeofLn+KA1zglbFtuC1MEExy/vaJFKBM=
Date: Thu, 9 May 2024 15:42:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 05/11] media: adv748x-csi2: Implement enum_mbus_codes
Message-ID: <20240509124249.GB17123@pendragon.ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
 <20240506164941.110389-6-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506164941.110389-6-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, May 06, 2024 at 06:49:33PM +0200, Jacopo Mondi wrote:
> Define a list of supported mbus codes for the TXA and TXB CSI-2
> transmitters and implement the enum_mbus_code operation.
> 
> The TXB transmitter only support YUV422 while the TXA one supports
> multiple formats as reported by the chip's manual in section 9.7.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 35 ++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 5b265b722394..4fd6d3a681d5 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -14,6 +14,18 @@
>  
>  #include "adv748x.h"
>  
> +static const unsigned int adv748x_csi2_txa_fmts[] = {
> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +	MEDIA_BUS_FMT_UYVY10_1X20,
> +	MEDIA_BUS_FMT_RGB565_1X16,
> +	MEDIA_BUS_FMT_RGB666_1X18,
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
> @@ -139,6 +151,28 @@ static const struct v4l2_subdev_video_ops adv748x_csi2_video_ops = {
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
> +	if (code->pad != ADV748X_CSI2_SOURCE)
> +		return -EINVAL;

Any reason to not support enumeration of formats on the sink pad ?

Is the CSI-2 TX pass-through regarding media bus formats ? That is, does
it modify the format between the sink and source pads ? If not, I think
this function should be implemented as

	if (code->pad == ADV748X_CSI2_SINK) {
		if (code->index >= num_fmts)
			return -EINVAL;

		code->code = codes[code->index];
	} else {
		const struct v4l2_msbu_framefmt *fmt;

		if (code->index > 0)
			return -EINVAL;

		/*
		 * The device doesn't modify formats, the same media bus code is
		 * used on the sink and source.
		 */
		fmt = v4l2_subdev_state_get_format(sd_state, ADV748X_CSI2_SINK);
		code->code = fmt->code;
	}

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
> @@ -228,6 +262,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
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

