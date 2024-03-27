Return-Path: <linux-media+bounces-7923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D888DAF2
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 11:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83E2CB2221C
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 10:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CE8482EA;
	Wed, 27 Mar 2024 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qzYRZV04"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E533989
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711534110; cv=none; b=gFdqh9Zxd61f2LmD7Pnp1IRM7yQr+Dvu3Tcd/mTIWziQxmUsdl27SgCr2WJlaCg+jWToKDdOAUWjpGr9tfjZdmyguoXgslzfKw3Tu8wkDxhb4gT5ExRvB712lboqbi+t0WfXW0QTXYTQzi+vnZZyzlcipLYsjcfQveHgMYWrciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711534110; c=relaxed/simple;
	bh=4OsQXNym/0xH70rzb1zGJw8DSdLDrDLapeQfr+62RLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmWwFlMGFgYFGPKwCxTrfT8OO051Wj1fa9TgAFvJzBMf62DeUswzORuHg7zJ5rvkZyEQIYg3/+IbaTtKxoHImgXthqcAJFVvJP0+KBoRc1Z4m5Yg9EsJGk32l8ViFER1DT8d+Dlo3Dwhmoyg6M3Kn8T9pVElgznE5aj0XR2fW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qzYRZV04; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79CC3505;
	Wed, 27 Mar 2024 11:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711534074;
	bh=4OsQXNym/0xH70rzb1zGJw8DSdLDrDLapeQfr+62RLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qzYRZV04dByEhVeqYG9OLRLRXyreey3QKh76ITWca27Pvj8FipdNJe+vuuBQjCGK5
	 8CCJT8cIXkYVV1x/G+g9GlEmDqBdsOYS0KMR6gV7wfwvwQXW8NAxRVw+QaUtN2kD/j
	 Xp24S4o/O0Ped4ufVYNRv1Hgk6pROwbSQF3HADuE=
Message-ID: <0f3d4f4a-bc0a-43ac-aa5c-8cc7a54417d9@ideasonboard.com>
Date: Wed, 27 Mar 2024 12:08:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/15] media: i2c: imx219: Report streams using frame
 descriptors
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Naushir Patuck <naush@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com,
 linux-rpi-kernel@lists.infradead.org,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
 <20240324220854.15010-5-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240324220854.15010-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/03/2024 00:08, Laurent Pinchart wrote:
> Implement the .get_frame_desc() subdev operation to report information
> about streams to the connected CSI-2 receiver. This is required to let
> the CSI-2 receiver driver know about virtual channels and data types for
> each stream.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Changes since v6:
> 
> - Replace v4l2_subdev_state_get_stream_format() with
>    v4l2_subdev_state_get_format()
> - Make imx219_format_bpp() return an unsigned int
> ---
>   drivers/media/i2c/imx219.c | 67 ++++++++++++++++++++++++++++----------
>   1 file changed, 50 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 6602250834be..fa64bc402c9a 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -23,6 +23,7 @@
>   #include <linux/pm_runtime.h>
>   #include <linux/regulator/consumer.h>
>   
> +#include <media/mipi-csi2.h>
>   #include <media/v4l2-cci.h>
>   #include <media/v4l2-ctrls.h>
>   #include <media/v4l2-device.h>
> @@ -591,6 +592,24 @@ static void imx219_free_controls(struct imx219 *imx219)
>    * Subdev operations
>    */
>   
> +static unsigned int imx219_format_bpp(u32 code)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +		return 8;
> +
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	default:
> +		return 10;
> +	}
> +}
> +
>   static int imx219_set_framefmt(struct imx219 *imx219,
>   			       struct v4l2_subdev_state *state)
>   {
> @@ -602,23 +621,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
>   
>   	format = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE);
>   	crop = v4l2_subdev_state_get_crop(state, IMX219_PAD_IMAGE);
> -
> -	switch (format->code) {
> -	case MEDIA_BUS_FMT_SRGGB8_1X8:
> -	case MEDIA_BUS_FMT_SGRBG8_1X8:
> -	case MEDIA_BUS_FMT_SGBRG8_1X8:
> -	case MEDIA_BUS_FMT_SBGGR8_1X8:
> -		bpp = 8;
> -		break;
> -
> -	case MEDIA_BUS_FMT_SRGGB10_1X10:
> -	case MEDIA_BUS_FMT_SGRBG10_1X10:
> -	case MEDIA_BUS_FMT_SGBRG10_1X10:
> -	case MEDIA_BUS_FMT_SBGGR10_1X10:
> -	default:
> -		bpp = 10;
> -		break;
> -	}
> +	bpp = imx219_format_bpp(format->code);
>   
>   	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
>   		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
> @@ -1029,6 +1032,35 @@ static int imx219_init_state(struct v4l2_subdev *sd,
>   	return 0;
>   }
>   
> +static int imx219_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *fd)
> +{
> +	const struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +	u32 code;
> +
> +	if (pad != IMX219_PAD_SOURCE)
> +		return -EINVAL;
> +
> +	state = v4l2_subdev_lock_and_get_active_state(sd);
> +	fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE, 0);

I was going to say change 0 to IMX219_STREAM_IMAGE, but you only add it 
in the next patch. Perhaps a pointless reshuffling, but you could 
introduce IMX219_STREAM_IMAGE in patch 3, or maybe as a separate patch, 
so that in patch 5 (embedded data) you don't need to convert the lines 
related to the image stream.

> +	code = fmt->code;
> +	v4l2_subdev_unlock_state(state);
> +
> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +	fd->num_entries = 1;
> +
> +	memset(fd->entry, 0, sizeof(fd->entry));

The whole fd has been already cleared in call_get_frame_desc().

> +
> +	fd->entry[0].pixelcode = code;
> +	fd->entry[0].stream = 0;
> +	fd->entry[0].bus.csi2.vc = 0;
> +	fd->entry[0].bus.csi2.dt = imx219_format_bpp(code) == 8
> +				 ? MIPI_CSI2_DT_RAW8 : MIPI_CSI2_DT_RAW10;
> +
> +	return 0;
> +}
> +
>   static const struct v4l2_subdev_core_ops imx219_core_ops = {
>   	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>   	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> @@ -1044,6 +1076,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
>   	.set_fmt = imx219_set_pad_format,
>   	.get_selection = imx219_get_selection,
>   	.enum_frame_size = imx219_enum_frame_size,
> +	.get_frame_desc = imx219_get_frame_desc,
>   };
>   
>   static const struct v4l2_subdev_ops imx219_subdev_ops = {

  Tomi


