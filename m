Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED9320D6B5
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 22:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730416AbgF2TXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732297AbgF2TWp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:22:45 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0301C030F35
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 09:54:48 -0700 (PDT)
Received: from [IPv6:2003:cb:8737:cf00:84c7:ee07:61e9:a21f] (p200300cb8737cf0084c7ee0761e9a21f.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:84c7:ee07:61e9:a21f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 834CF260CC6;
        Mon, 29 Jun 2020 17:54:46 +0100 (BST)
Subject: Re: [libcamera-devel] [PATCH 19/25] media: ov5647: Implement set_fmt
 pad operation
To:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     andrew_gabbasov@mentor.com, mrodin@de.adit-jv.com,
        mripard@kernel.org, libcamera-devel@lists.libcamera.org,
        sudipi@jp.adit-jv.com, hugues.fruchet@st.com,
        erosca@de.adit-jv.com, aford173@gmail.com,
        linux-media@vger.kernel.org
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623164911.45147-4-jacopo@jmondi.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8f9e76ed-8c78-f6ae-c0c9-fc6d0927325b@collabora.com>
Date:   Mon, 29 Jun 2020 18:54:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623164911.45147-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 23.06.20 18:49, Jacopo Mondi wrote:
> Now that the driver supports more than a single mode, implement the
> .set_fmt pad operation and adjust the existing .get_fmt one to report
> the currently applied format.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>   drivers/media/i2c/ov5647.c | 67 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 62 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index af9e6d43967d8..39e320f321bd8 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1016,15 +1016,72 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
>   	return 0;
>   }
>   
> -static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
> +static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>   			      struct v4l2_subdev_pad_config *cfg,
>   			      struct v4l2_subdev_format *format)
>   {
>   	struct v4l2_mbus_framefmt *fmt = &format->format;
> +	struct v4l2_mbus_framefmt *sensor_format;
> +	struct ov5647 *sensor = to_sensor(sd);
>   
> -	/* Only one format is supported, so return that. */
> +	mutex_lock(&sensor->lock);
>   	memset(fmt, 0, sizeof(*fmt));
> -	*fmt = OV5647_DEFAULT_FORMAT;
> +
> +	switch (format->which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		sensor_format = v4l2_subdev_get_try_format(sd, cfg, format->pad);
> +		break;
> +	default:
> +		sensor_format = &sensor->mode->format;
> +		break;
> +	}
> +
> +	*fmt = *sensor_format;
> +	mutex_unlock(&sensor->lock);
> +
> +	return 0;
> +}
> +
> +static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt = &format->format;
> +	struct ov5647 *sensor = to_sensor(sd);
> +	struct ov5647_mode *ov5647_mode_list;
> +	struct ov5647_mode *mode;
> +	unsigned int num_modes;
> +
> +	/*
> +	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
> +	 * is not supported.

In previous patch you added macros OV5647_DEFAULT_MODE, OV5647_DEFAULT_FORMAT
which comes from first format in the array 'ov5647_formats' which is MEDIA_BUS_FMT_SBGGR8_1X8.
But here you set the default format to MEDIA_BUS_FMT_SBGGR10_1X10

> +	 */
> +	if (fmt->code == MEDIA_BUS_FMT_SBGGR8_1X8) {
> +		ov5647_mode_list = ov5647_sbggr8_modes;
> +		num_modes = ARRAY_SIZE(ov5647_sbggr8_modes);
> +	} else {
> +		ov5647_mode_list = ov5647_sbggr10_modes;
> +		num_modes = ARRAY_SIZE(ov5647_sbggr10_modes);
> +	}
> +
> +	mode = v4l2_find_nearest_size(ov5647_mode_list, num_modes,
> +				      format.width, format.height,
> +				      fmt->width, fmt->height);
> +
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		mutex_lock(&sensor->lock);
> +		*v4l2_subdev_get_try_format(sd, cfg, format->pad) = mode->format;
> +		*fmt = mode->format;
> +		mutex_unlock(&sensor->lock);
> +
> +		return 0;
> +	}
> +
> +	/* Update the sensor mode and apply at it at streamon time. */
> +	mutex_lock(&sensor->lock);
> +	sensor->mode = mode;
> +	*fmt = mode->format;
> +	mutex_unlock(&sensor->lock);
>   
>   	return 0;
>   }
> @@ -1068,8 +1125,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
>   static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
>   	.enum_mbus_code		= ov5647_enum_mbus_code,
>   	.enum_frame_size	= ov5647_enum_frame_size,
> -	.set_fmt		= ov5647_set_get_fmt,
> -	.get_fmt		= ov5647_set_get_fmt,
> +	.set_fmt		= ov5647_set_pad_fmt,
> +	.get_fmt		= ov5647_get_pad_fmt,
>   	.get_selection		= ov5647_get_selection,
>   };
>   
> 
