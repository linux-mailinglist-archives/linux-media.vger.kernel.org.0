Return-Path: <linux-media+bounces-11259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954B8C1991
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 00:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CBBE1C21F59
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 22:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A176C12D210;
	Thu,  9 May 2024 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="V1WlT118";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U269Bhja"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E94770E0;
	Thu,  9 May 2024 22:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294764; cv=none; b=uuovSVgkaoPrgp0pMkFsAzL2b9QManisU3LpfgZKmusLxMPMzmoWYaaRVegVD0jC9Ui0t9SgqX5D6htbeF53uyfmD1BQhlzHY04Pzg24gUXdGEX7EsFNwU1cM6GRSf6idm/oZnUqW5O4dLx2gyxrfyRvXOjpEZGyPTTUaf7qu5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294764; c=relaxed/simple;
	bh=C4d+LGlEyak4Rs8tTjDcvz80uEVgaGF6BgGmKYSSusE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6kAKIppUOqEjBnm4+XlN2L2Hj+0oWmdZ//dACEmD0WFsrLKB4ONIIWuWxEkHgcJ8Q6q/5uiRM1rVdyqN1+JMGfAwLBnFIxQVfLt8os5LMrHxf/MeyXRCHqAnOWFIOHzNn47LcYImmOf4VGro7CpBAa0me+Qi06pQUJoerW+wPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=V1WlT118; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U269Bhja; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1FAC81140141;
	Thu,  9 May 2024 18:45:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 09 May 2024 18:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715294759;
	 x=1715381159; bh=e9kxIxrPCGGM17jIK9UIcJIFO9rZ2I2IE+HMsx+pXf8=; b=
	V1WlT118lpM/tXuH5WMXq4DvZOWx/XN2mxsnWNGEWIFO1dHa/L6OQpV8HWYMaxWR
	0RrR5wNW3w4az+OHO8WXPsz34GHnsohxDAn4CkLh50FMjKHIsvK4TGF+z3zvvCQN
	NDoZOLu2fepLKS95LE77BMRbtMtDKOGKw3wulS6J4sBmy/OaWB1tzthsm3Py2PaJ
	bovOlO/b/BekWHqbjNhR/MwHjzCRJyTUkkd/Ky2FcO8UzfYTtyAr/2+76G60u41b
	hwcdMLbk9nWflZKDPC1U+tOHcYAMroAagdchDyPBZJrcgNMDjnj+QLCN605vlObO
	rzrrXwHU8+NN8zWAz518iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715294759; x=
	1715381159; bh=e9kxIxrPCGGM17jIK9UIcJIFO9rZ2I2IE+HMsx+pXf8=; b=U
	269BhjaOly7HC9j7ExLuDLjU6kjd4ZTOkWYopdl77dnGkzdgEvkJaDd8dJ2zJ9l6
	8SBU3Pogqs0ILFYYf4NP0d0HokAsorlfhtFpeRdH+A/yYuds241M3xsqJ7goooDW
	45neKdTsSJUvQis1iviHIuVWMBSThM+6Jppq4AJJi0wOoxNmgtm1yGnZt9HvR/Gm
	Z5iAoc7SRjqJYjpiB4MUpW81rzM1HhdwXlcN3muE7qx70ZIHfUGl8HFe7LfPMLUM
	hLNucgn10gQS4dX7wOVzKLfVKD0QNSVeGWhjVziYGRkZXpzW//X4srOobnthvZSb
	0c32IQWrcOQgpqJ/uIsJA==
X-ME-Sender: <xms:JlI9ZrnkSsOgX_EExKwnWU-4FTBhRnEfPaOK962KBTBPFH0LAbEAjw>
    <xme:JlI9Zu204wCi_ydW253x86xlY-37IfddeJcyp3flSLmflHuVEvCMkwoYmEUYPQmEw
    OUvJu_Z_oXmfXY7d5I>
X-ME-Received: <xmr:JlI9ZhpPXT3QvmgmLnDMDdurBkWMo4zKpQbAvvHUnls6VmNyLcn12rmEA-bXP1ph87PTK0H59pMo8n3d_sIvb6nSzD3vvVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefh
    ffejgfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:JlI9Zjl2p7J8WLqQ8qb79qXUcXLT-7bS5WqGYl4Mc5T2D1b19UkrZw>
    <xmx:JlI9Zp1QVCz9dUtypjovCdmwZptk_ImLXfDsB7rNOj1JF09LbrPeFA>
    <xmx:JlI9Ziv99ZeuFSQJBgRiu52Lxd57msNmmcANA_uQwO2cf85tlRPFTA>
    <xmx:JlI9ZtX-ctX-nEUgXhmY1LPdqWkfhQ_GZFc1f_Oepg89ZskFI6wnnQ>
    <xmx:J1I9ZmlUCM9jbBVOCEGo0pwR3eGhpxdEvUsbQvzCXnfZJmU7HnMWR8fD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 18:45:58 -0400 (EDT)
Date: Fri, 10 May 2024 00:45:56 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 07/11] media: adv748x-csi2: Use the subdev active state
Message-ID: <20240509224556.GU1385281@ragnatech.se>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
 <20240509161403.111789-8-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509161403.111789-8-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thanks for your work.

On 2024-05-09 18:13:57 +0200, Jacopo Mondi wrote:
> Initialize and use the subdev active state to store the subdevice
> format.
> 
> This simplifies the implementation of the get_fmt and set_fmt pad
> operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 107 +++++++++--------------
>  drivers/media/i2c/adv748x/adv748x.h      |   1 -
>  2 files changed, 42 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 0cdb397d9e0a..ebe7da8ebed7 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -6,7 +6,6 @@
>   */
>  
>  #include <linux/module.h>
> -#include <linux/mutex.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -68,7 +67,33 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
>  
>  /* -----------------------------------------------------------------------------
>   * v4l2_subdev_internal_ops
> - *
> + */
> +
> +static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state)
> +{
> +	static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
> +		.width		= 1280,
> +		.height		= 720,
> +		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
> +		.colorspace	= V4L2_COLORSPACE_SRGB,
> +		.field		= V4L2_FIELD_NONE,
> +		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
> +		.quantization	= V4L2_QUANTIZATION_DEFAULT,
> +		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
> +	};
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = v4l2_subdev_state_get_format(state, ADV748X_CSI2_SINK);
> +	*fmt = adv748x_csi2_default_fmt;
> +
> +	fmt = v4l2_subdev_state_get_format(state, ADV748X_CSI2_SOURCE);
> +	*fmt = adv748x_csi2_default_fmt;
> +
> +	return 0;
> +}
> +
> +/*
>   * We use the internal registered operation to be able to ensure that our
>   * incremental subdevices (not connected in the forward path) can be registered
>   * against the resulting video path and media device.
> @@ -118,6 +143,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
>  }
>  
>  static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
> +	.init_state = adv748x_csi2_init_state,
>  	.registered = adv748x_csi2_registered,
>  };
>  
> @@ -183,41 +209,6 @@ static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static struct v4l2_mbus_framefmt *
> -adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
> -			    struct v4l2_subdev_state *sd_state,
> -			    unsigned int pad, u32 which)
> -{
> -	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> -
> -	if (which == V4L2_SUBDEV_FORMAT_TRY)
> -		return v4l2_subdev_state_get_format(sd_state, pad);
> -
> -	return &tx->format;
> -}
> -
> -static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
> -				   struct v4l2_subdev_state *sd_state,
> -				   struct v4l2_subdev_format *sdformat)
> -{
> -	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> -	struct adv748x_state *state = tx->state;
> -	struct v4l2_mbus_framefmt *mbusformat;
> -
> -	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> -						 sdformat->which);
> -	if (!mbusformat)
> -		return -EINVAL;
> -
> -	mutex_lock(&state->mutex);
> -
> -	sdformat->format = *mbusformat;
> -
> -	mutex_unlock(&state->mutex);
> -
> -	return 0;
> -}
> -
>  static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx, u32 code)
>  {
>  	const unsigned int *codes = is_txa(tx) ?
> @@ -239,9 +230,10 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_format *sdformat)
>  {
>  	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
> -	struct adv748x_state *state = tx->state;
>  	struct v4l2_mbus_framefmt *mbusformat;
> -	int ret = 0;
> +
> +	if (sdformat->pad == ADV748X_CSI2_SOURCE)
> +		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
>  
>  	/*
>  	 * Make sure the format is supported, if not default it to
> @@ -250,34 +242,14 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	if (!adv748x_csi2_is_fmt_supported(tx, sdformat->format.code))
>  		sdformat->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
>  
> -	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
> -						 sdformat->which);
> -	if (!mbusformat)
> -		return -EINVAL;
> -
> -	mutex_lock(&state->mutex);
> -
> -	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
> -		const struct v4l2_mbus_framefmt *sink_fmt;
> -
> -		sink_fmt = adv748x_csi2_get_pad_format(sd, sd_state,
> -						       ADV748X_CSI2_SINK,
> -						       sdformat->which);
> -
> -		if (!sink_fmt) {
> -			ret = -EINVAL;
> -			goto unlock;
> -		}
> -
> -		sdformat->format = *sink_fmt;
> -	}
> -
> +	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
>  	*mbusformat = sdformat->format;
>  
> -unlock:
> -	mutex_unlock(&state->mutex);
> +	/* Propagate format to the source pad. */
> +	mbusformat = v4l2_subdev_state_get_format(sd_state, ADV748X_CSI2_SOURCE);
> +	*mbusformat = sdformat->format;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
> @@ -296,7 +268,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
>  
>  static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
>  	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
> -	.get_fmt = adv748x_csi2_get_format,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = adv748x_csi2_set_format,
>  	.get_mbus_config = adv748x_csi2_get_mbus_config,
>  };
> @@ -388,6 +360,11 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
>  	if (ret)
>  		goto err_cleanup_subdev;
>  
> +	tx->sd.state_lock = &state->mutex;
> +	ret = v4l2_subdev_init_finalize(&tx->sd);
> +	if (ret)
> +		goto err_free_ctrl;
> +
>  	ret = v4l2_async_register_subdev(&tx->sd);
>  	if (ret)
>  		goto err_free_ctrl;
> diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
> index d2b5e722e997..9bc0121d0eff 100644
> --- a/drivers/media/i2c/adv748x/adv748x.h
> +++ b/drivers/media/i2c/adv748x/adv748x.h
> @@ -75,7 +75,6 @@ enum adv748x_csi2_pads {
>  
>  struct adv748x_csi2 {
>  	struct adv748x_state *state;
> -	struct v4l2_mbus_framefmt format;
>  	unsigned int page;
>  	unsigned int port;
>  	unsigned int num_lanes;
> -- 
> 2.44.0
> 

-- 
Kind Regards,
Niklas Söderlund

