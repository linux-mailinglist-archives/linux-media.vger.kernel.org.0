Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFAE62B85D8
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgKRUmn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:42:43 -0500
Received: from mga05.intel.com ([192.55.52.43]:54197 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726837AbgKRUmn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:42:43 -0500
IronPort-SDR: Tg/3djky3RgXY7hV7AWHu6Vyq4j1B25G3OsnnxrrI5wgwmysMlW1fHyKxRdv5vgihfT5d42mrM
 Pxt0GU+3aFbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="255894258"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="255894258"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:42:41 -0800
IronPort-SDR: y7ODEIMzd/Av7qmePXjh/GNyWpa+iq4wPH+p2zfl+eJ7iunHnz9VLdVnkxRbbptITFwwC6+k0y
 eR6GIvSWO8Sg==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="532881537"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:42:38 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0645820808; Wed, 18 Nov 2020 22:42:36 +0200 (EET)
Date:   Wed, 18 Nov 2020 22:42:35 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: Re: [PATCH v3 18/29] media: ov5647: Implement set_fmt pad operation
Message-ID: <20201118204235.GL3940@paasikivi.fi.intel.com>
References: <20201109164934.134919-1-jacopo@jmondi.org>
 <20201109164934.134919-19-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109164934.134919-19-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 09, 2020 at 05:49:23PM +0100, Jacopo Mondi wrote:
> Now that the driver supports more than a single mode, implement the
> .set_fmt pad operation and adjust the existing .get_fmt one to report
> the currently applied format.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 66 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 62 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index c65aacc0e04d3..68eab61d53493 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1019,14 +1019,72 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
> +static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
>  			      struct v4l2_subdev_pad_config *cfg,
>  			      struct v4l2_subdev_format *format)
>  {
>  	struct v4l2_mbus_framefmt *fmt = &format->format;
> +	const struct v4l2_mbus_framefmt *sensor_format;
> +	struct ov5647 *sensor = to_sensor(sd);
>  
>  	memset(fmt, 0, sizeof(*fmt));
> -	*fmt = OV5647_DEFAULT_FORMAT;
> +
> +	mutex_lock(&sensor->lock);
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
> +	const struct ov5647_mode *ov5647_mode_list;
> +	struct ov5647 *sensor = to_sensor(sd);
> +	const struct ov5647_mode *mode;
> +	unsigned int num_modes;
> +
> +	/*
> +	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
> +	 * is not supported.
> +	 */
> +	if (fmt->code == MEDIA_BUS_FMT_SBGGR8_1X8) {
> +		ov5647_mode_list = ov5647_8bpp_modes;
> +		num_modes = ARRAY_SIZE(ov5647_8bpp_modes);
> +	} else {
> +		ov5647_mode_list = ov5647_10bpp_modes;
> +		num_modes = ARRAY_SIZE(ov5647_10bpp_modes);
> +	}

It'd be nicer if you could obtain the above information from an array where
there's entry for each format. The above checks have a tendency to repeat
themselves in a number of places.

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
>  	return 0;
>  }
> @@ -1071,8 +1129,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
>  static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
>  	.enum_mbus_code		= ov5647_enum_mbus_code,
>  	.enum_frame_size	= ov5647_enum_frame_size,
> -	.set_fmt		= ov5647_set_get_fmt,
> -	.get_fmt		= ov5647_set_get_fmt,
> +	.set_fmt		= ov5647_set_pad_fmt,
> +	.get_fmt		= ov5647_get_pad_fmt,
>  	.get_selection		= ov5647_get_selection,
>  };
>  

-- 
Sakari Ailus
