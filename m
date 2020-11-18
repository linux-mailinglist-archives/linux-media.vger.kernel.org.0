Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40142B85DA
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgKRUnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:43:49 -0500
Received: from mga17.intel.com ([192.55.52.151]:55072 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726837AbgKRUns (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:43:48 -0500
IronPort-SDR: PjHJZ+POjedM12LNQmTCq73Gv3V24Cu+Ab5OZfz7N1Sbc3FefBXkEpXHFxYL29BMhP/l6qBObT
 +sDOqbH/rnfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="151029144"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="151029144"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:43:48 -0800
IronPort-SDR: 4retnFheCBfxI5MP+mHd0Uc18zggYYzqib8av0bobtOr2bOUKf9f5SrrB2U1lY6nq73EyLKHq7
 UbBciD9D5dNw==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; 
   d="scan'208";a="310805128"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 12:43:40 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9A39E20808; Wed, 18 Nov 2020 22:43:36 +0200 (EET)
Date:   Wed, 18 Nov 2020 22:43:36 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 20/29] media: ov5647: Support V4L2_CID_PIXEL_RATE
Message-ID: <20201118204336.GM3940@paasikivi.fi.intel.com>
References: <20201109164934.134919-1-jacopo@jmondi.org>
 <20201109164934.134919-21-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109164934.134919-21-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Nov 09, 2020 at 05:49:25PM +0100, Jacopo Mondi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Clients need to know the pixel rate in order to compute exposure
> and frame rate values. Advertise it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 40 +++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 66556690dcffb..01978491b97f4 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -76,6 +76,7 @@ struct regval_list {
>  struct ov5647_mode {
>  	struct v4l2_mbus_framefmt	format;
>  	struct v4l2_rect		crop;
> +	u64				pixel_rate;
>  	const struct regval_list	*reg_list;
>  	unsigned int			num_regs;
>  };
> @@ -96,6 +97,7 @@ struct ov5647 {
>  	bool				clock_ncont;
>  	struct v4l2_ctrl_handler	ctrls;
>  	const struct ov5647_mode	*mode;
> +	struct v4l2_ctrl		*pixel_rate;
>  };
>  
>  static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -582,6 +584,7 @@ static const struct ov5647_mode ov5647_8bpp_modes[] = {
>  			.width		= 1280,
>  			.height		= 960,
>  		},
> +		.pixel_rate	= 77291670,
>  		.reg_list	= ov5647_640x480_8bpp,
>  		.num_regs	= ARRAY_SIZE(ov5647_640x480_8bpp)
>  	},
> @@ -603,6 +606,7 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
>  			.width		= 2592,
>  			.height		= 1944
>  		},
> +		.pixel_rate	= 87500000,
>  		.reg_list	= ov5647_2592x1944_10bpp,
>  		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_10bpp)
>  	},
> @@ -621,6 +625,7 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
>  			.width		= 1928,
>  			.height		= 1080,
>  		},
> +		.pixel_rate	= 81666700,
>  		.reg_list	= ov5647_1080p30_10bpp,
>  		.num_regs	= ARRAY_SIZE(ov5647_1080p30_10bpp)
>  	},
> @@ -639,6 +644,7 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
>  			.width		= 2592,
>  			.height		= 1944,
>  		},
> +		.pixel_rate	= 81666700,
>  		.reg_list	= ov5647_2x2binned_10bpp,
>  		.num_regs	= ARRAY_SIZE(ov5647_2x2binned_10bpp)
>  	},
> @@ -657,6 +663,7 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
>  			.width		= 2560,
>  			.height		= 1920,
>  		},
> +		.pixel_rate	= 55000000,
>  		.reg_list	= ov5647_640x480_10bpp,
>  		.num_regs	= ARRAY_SIZE(ov5647_640x480_10bpp)
>  	},
> @@ -1083,6 +1090,10 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>  	/* Update the sensor mode and apply at it at streamon time. */
>  	mutex_lock(&sensor->lock);
>  	sensor->mode = mode;
> +
> +	__v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
> +				 mode->pixel_rate, 1, mode->pixel_rate);
> +
>  	*fmt = mode->format;
>  	mutex_unlock(&sensor->lock);
>  
> @@ -1285,6 +1296,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		return  ov5647_s_analogue_gain(sd, ctrl->val);
>  	case V4L2_CID_EXPOSURE:
>  		return ov5647_s_exposure(sd, ctrl->val);
> +	case V4L2_CID_PIXEL_RATE:
> +		/* Read-only, but we adjust it based on mode. */
> +		return 0;
>  	default:
>  		dev_info(&client->dev,
>  			 "Control (id:0x%x, val:0x%x) not supported\n",
> @@ -1303,7 +1317,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>  
> -	v4l2_ctrl_handler_init(&sensor->ctrls, 5);
> +	v4l2_ctrl_handler_init(&sensor->ctrls, 6);
>  
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1323,17 +1337,29 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
>  
> -	if (sensor->ctrls.error) {
> -		dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
> -			__func__, sensor->ctrls.error);
> -		v4l2_ctrl_handler_free(&sensor->ctrls);
> +	/* By default, PIXEL_RATE is read only, but it does change per mode */
> +	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE,
> +					       sensor->mode->pixel_rate,
> +					       sensor->mode->pixel_rate, 1,
> +					       sensor->mode->pixel_rate);
> +	if (!sensor->pixel_rate)
> +		goto handler_free;

You can drop the check and move the assignment below after the handler
error check.

> +	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> -		return sensor->ctrls.error;
> -	}
> +	if (sensor->ctrls.error)
> +		goto handler_free;
>  
>  	sensor->sd.ctrl_handler = &sensor->ctrls;
>  
>  	return 0;
> +
> +handler_free:
> +	dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
> +		__func__, sensor->ctrls.error);
> +	v4l2_ctrl_handler_free(&sensor->ctrls);
> +
> +	return sensor->ctrls.error;
>  }
>  
>  static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)

-- 
Regards,

Sakari Ailus
