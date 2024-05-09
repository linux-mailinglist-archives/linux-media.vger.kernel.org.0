Return-Path: <linux-media+bounces-11204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B178C0FD7
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 14:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 875A01C2299F
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 12:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CE213B7BD;
	Thu,  9 May 2024 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YJ1HUIjm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF613AD33;
	Thu,  9 May 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258653; cv=none; b=ElERHnKXoR0CffkbtNFNh0P17m+CC6IFlOxoyy/wCwM2P4eFh12wJU6uOzACVEJZ6/mmYOQHOlxc/2ggMt9yoZrsxxrMmbHkCc7Wcwui/PWay3XIgqL4Z21ws41DEs5DiSaEVIVr/Kdd2OMxeByr5yojZyNyBBEU0mH+r+VRyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258653; c=relaxed/simple;
	bh=2cldxy1wla8V7r0jOtmy/Bsgn82hXzNqb9iSuhKy8uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5T2VTDQSMYJfkWG4XY3S9CyX7lY3D8hTkgtVTldswoO3ivewKUiMIHX0tSEg4jcpIIVNINuNUnM9XmWIhRlKFel+qGjgtvWTpyeq8p2FT3JyjI0//CNpf1iQn2LY0X2HSo7hiwhEYpo1syYol9x0RGnAnr5c77IAL93DryLg7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YJ1HUIjm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3478AB3;
	Thu,  9 May 2024 14:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715258647;
	bh=2cldxy1wla8V7r0jOtmy/Bsgn82hXzNqb9iSuhKy8uQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJ1HUIjmgiwnYouozyU79UaPe+4VZJ12/VT66kufVO7p1eAZfOG1SKtXMbdHMj/cN
	 UWdVIaSbm0sRaQSL7LJtZlziD8XG5VNp8UJ3+ZCxGIIZoqojbjnUHlnqw/uklo1C4R
	 jHInKJLAAFSgOb7I8cpLulE8RvW2UGl1Az77wcGw=
Date: Thu, 9 May 2024 15:44:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] media: adv748x-csi2: Validate the image format
Message-ID: <20240509124401.GC17123@pendragon.ideasonboard.com>
References: <20240506164941.110389-1-jacopo.mondi@ideasonboard.com>
 <20240506164941.110389-7-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506164941.110389-7-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Mon, May 06, 2024 at 06:49:34PM +0200, Jacopo Mondi wrote:
> The adv748x-csi2 driver configures the CSI-2 transmitter to
> automatically infer the image stream format from the connected
> frontend (HDMI or AFE).
> 
> Setting a new format on the subdevice hence does not actually control
> the CSI-2 output format, but it's only there for the purpose of
> pipeline validation.
> 
> However, there is currently no validation that the supplied media bus
> code is valid and supported by the device.
> 
> With the introduction of enum_mbus_codes a list of supported format is
> now available, use it to validate that the supplied format is correct
> and use the default UYVY8 one if that's not the case.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/adv748x/adv748x-csi2.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
> index 4fd6d3a681d5..3f22dc426d7a 100644
> --- a/drivers/media/i2c/adv748x/adv748x-csi2.c
> +++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
> @@ -208,6 +208,23 @@ static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx,
> +					  unsigned int code)

u32 code to match the data type from the format structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +{
> +	const unsigned int *codes = is_txa(tx) ?
> +				    adv748x_csi2_txa_fmts :
> +				    adv748x_csi2_txb_fmts;
> +	size_t num_fmts = is_txa(tx) ? ARRAY_SIZE(adv748x_csi2_txa_fmts)
> +				     : ARRAY_SIZE(adv748x_csi2_txb_fmts);
> +
> +	for (unsigned int i = 0; i < num_fmts; i++) {
> +		if (codes[i] == code)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *sd_state,
>  				   struct v4l2_subdev_format *sdformat)
> @@ -217,6 +234,13 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *mbusformat;
>  	int ret = 0;
>  
> +	/*
> +	 * Make sure the format is supported, if not default it to
> +	 * UYVY8 as it's supported by both TXes.
> +	 */
> +	if (!adv748x_csi2_is_fmt_supported(tx, sdformat->format.code))
> +		sdformat->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
> +
>  	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
>  						 sdformat->which);
>  	if (!mbusformat)

-- 
Regards,

Laurent Pinchart

