Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFD11923CB
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgCYJNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:13:11 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:46117 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725903AbgCYJNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:13:11 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id H25xjKcYxLu1fH260jz0DL; Wed, 25 Mar 2020 10:13:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585127588; bh=1kn0+ao0pxiSxYHshk9vRk6XDIhy/1S0cYRMV6/XgXU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uDxYEixcHr6kZRum61nhKqYbKMMqVdput1f1//tTOwV3Wt6ckA2NUYgZEvx3k6Sd5
         DE1YT/PNA9y3xDAMX6vRHo3BwcFyRCYCqJYmmFQfheOyMUu8hM6ePmiVFl4iI4XBhl
         +TQc8VVfyMOGZQWXb3oER99CNOpj1rMp+hGmqKOOkbgpU20G2q0w7kaDrauDH+QGqX
         QrtXF8RDNC2YcSZvMS4R9sS67+WE00yaGcFWTdRPvlHaf/sNcdwLh7Yo46RLAirXyZ
         7SAyUGAgwTC0CnyJ0R8QHutvVSXIw71PzK8ehKh+iT8erWKq1OoMYJYfsI0gynX54R
         w6IM70mtM2ubQ==
Subject: Re: [PATCH 13/14] media: imx: imx7-mipi-csis: Don't use
 imx-media-utils helpers
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200312234722.23483-1-laurent.pinchart@ideasonboard.com>
 <20200312234722.23483-14-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8b877c3f-e6ff-86ce-34d8-17cf4ed0395d@xs4all.nl>
Date:   Wed, 25 Mar 2020 10:13:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312234722.23483-14-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO/fss7u8MmWmws3RCO5QS9SIc9wJNnu7GMtYhJ1pyNydTXO0zQduqXWDKbWt+vyCzQYj8/LrJvpoy2p18GVUYoBWWufW1icD0PiVmppDD7AWdbaye/a
 ut+UmFy323P5O7pMn1z/a151PLQdE2U/NVgmz0q2ODMULWOu61OikxlbCBMVam2bJ+aHl0UCJZOH37fjdAOa/QKzOQmkbh8mM6MOoV/GZcWfeQ+gQBJlFlzG
 +2RidumaPLP1Bd/wCGoBXwwJGsdvsfUFHTyJaEq7PlkM8mvAPfC+yJuvj3hxflFuMlPby2k/2qoQUzYU9Uz0Hg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/13/20 12:47 AM, Laurent Pinchart wrote:
> The imx7-mipi-csis only uses the imx_media_init_mbus_fmt() function from
> the imx-media-utils helpers. The helpers don't support all the media bus
> formats used by this driver, and are thus a bad fit. As the MIPI CSIS is
> a standalone IP core that could be integrated in other SoCs, let's not
> use the helper.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
> index 0829980d7af5..66ff73919371 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -28,8 +28,6 @@
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
> -#include "imx-media.h"
> -
>  #define CSIS_DRIVER_NAME			"imx7-mipi-csis"
>  #define CSIS_SUBDEV_NAME			CSIS_DRIVER_NAME
>  
> @@ -709,15 +707,21 @@ static int mipi_csis_init_cfg(struct v4l2_subdev *mipi_sd,
>  	struct v4l2_mbus_framefmt *fmt_sink;
>  	struct v4l2_mbus_framefmt *fmt_source;
>  	enum v4l2_subdev_format_whence which;
> -	int ret;
>  
>  	which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
>  	fmt_sink = mipi_csis_get_format(state, cfg, which, CSIS_PAD_SINK);
> -	ret = imx_media_init_mbus_fmt(fmt_sink, MIPI_CSIS_DEF_PIX_WIDTH,
> -				      MIPI_CSIS_DEF_PIX_HEIGHT, 0,
> -				      V4L2_FIELD_NONE, NULL);
> -	if (ret < 0)
> -		return ret;
> +
> +	fmt_sink->code = MEDIA_BUS_FMT_UYVY8_2X8;
> +	fmt_sink->width = MIPI_CSIS_DEF_PIX_WIDTH;
> +	fmt_sink->height = MIPI_CSIS_DEF_PIX_HEIGHT;
> +	fmt_sink->field = V4L2_FIELD_NONE;
> +
> +	fmt_sink->colorspace = V4L2_COLORSPACE_SMPTE170M;

Why V4L2_COLORSPACE_SMPTE170M?

After grepping a bit more in the imx code I see that the colorspace
handling is wrong in any case, so I will just accept this patch, but
this really should be fixed driver-wide.

It looks like the driver makes the typical mistake of thinking that
YUV formats use SMPTE170M colorspace and RGB formats use SRGB, but that's
not true. For drivers like this that typically are used with sensors
initializing the colorspace to SRGB is a good default. But the actual
colorspace comes from the sensor or the video receiver, the imx driver can't
know. And YUV vs RGB memory formats is just a different pixel encoding and
is unrelated to the colorspace.

Regards,

	Hans

> +	fmt_sink->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt_sink->colorspace);
> +	fmt_sink->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt_sink->colorspace);
> +	fmt_sink->quantization =
> +		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
> +					      fmt_sink->ycbcr_enc);
>  
>  	/*
>  	 * When called from mipi_csis_subdev_init() to initialize the active
> 

