Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648A020D73F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 22:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732401AbgF2T2O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732761AbgF2T1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:27:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32D0C031401
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 10:01:18 -0700 (PDT)
Received: from [IPv6:2003:cb:8737:cf00:84c7:ee07:61e9:a21f] (p200300cb8737cf0084c7ee0761e9a21f.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:84c7:ee07:61e9:a21f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DBF872A058A;
        Mon, 29 Jun 2020 18:01:16 +0100 (BST)
Subject: Re: [libcamera-devel] [PATCH 22/25] media: ov5647: Support
 V4L2_CID_PIXEL_RATE
To:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     andrew_gabbasov@mentor.com, mrodin@de.adit-jv.com,
        mripard@kernel.org, libcamera-devel@lists.libcamera.org,
        sudipi@jp.adit-jv.com, hugues.fruchet@st.com,
        erosca@de.adit-jv.com, aford173@gmail.com,
        linux-media@vger.kernel.org, Dafna Hirschfeld <dafna3@gmail.com>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623165550.45835-3-jacopo@jmondi.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <3aab9b3d-0156-e83c-9a63-026ded395af6@collabora.com>
Date:   Mon, 29 Jun 2020 19:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623165550.45835-3-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 23.06.20 18:55, Jacopo Mondi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Clients need to know the pixel rate in order to compute exposure
> and frame rate values. Advertise it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>   drivers/media/i2c/ov5647.c | 40 +++++++++++++++++++++++++++++++-------
>   1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 35865e56de5f9..218576a05e66b 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -76,6 +76,7 @@ struct regval_list {
>   struct ov5647_mode {
>   	struct v4l2_mbus_framefmt	format;
>   	struct v4l2_rect		crop;
> +	u64				pixel_rate;
>   	struct regval_list		*reg_list;
>   	unsigned int			num_regs;
>   };
> @@ -97,6 +98,7 @@ struct ov5647 {
>   	struct v4l2_ctrl_handler	ctrls;
>   	struct ov5647_mode		*mode;
>   	struct ov5647_mode		*current_mode;
> +	struct v4l2_ctrl		*pixel_rate;
>   };
>   
>   static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> @@ -583,6 +585,7 @@ static struct ov5647_mode ov5647_sbggr8_modes[] = {
>   			.width		= 1280,
>   			.height		= 960,
>   		},
> +		.pixel_rate	= 77291670,
>   		.reg_list	= ov5647_640x480_sbggr8,
>   		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr8)
>   	},
> @@ -604,6 +607,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
>   			.width		= 2592,
>   			.height		= 1944
>   		},
> +		.pixel_rate	= 87500000,
>   		.reg_list	= ov5647_2592x1944_sbggr10,
>   		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_sbggr10)
>   	},
> @@ -622,6 +626,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
>   			.width		= 1928,
>   			.height		= 1080,
>   		},
> +		.pixel_rate	= 81666700,
>   		.reg_list	= ov5647_1080p30_sbggr10,
>   		.num_regs	= ARRAY_SIZE(ov5647_1080p30_sbggr10)
>   	},
> @@ -640,6 +645,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
>   			.width		= 2592,
>   			.height		= 1944,
>   		},
> +		.pixel_rate	= 81666700,
>   		.reg_list	= ov5647_2x2binned_sbggr10,
>   		.num_regs	= ARRAY_SIZE(ov5647_2x2binned_sbggr10)
>   	},
> @@ -658,6 +664,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
>   			.width		= 2560,
>   			.height		= 1920,
>   		},
> +		.pixel_rate	= 55000000,
>   		.reg_list	= ov5647_640x480_sbggr10,
>   		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr10)
>   	},
> @@ -1094,6 +1101,10 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
>   	/* Update the sensor mode and apply at it at streamon time. */
>   	mutex_lock(&sensor->lock);
>   	sensor->mode = mode;
> +
> +	__v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
> +				 mode->pixel_rate, 1, mode->pixel_rate);
> +
>   	*fmt = mode->format;
>   	mutex_unlock(&sensor->lock);
>   
> @@ -1295,6 +1306,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>   		return  ov5647_s_analogue_gain(sd, ctrl->val);
>   	case V4L2_CID_EXPOSURE:
>   		return ov5647_s_exposure(sd, ctrl->val);
> +	case V4L2_CID_PIXEL_RATE:
> +		/* Read-only, but we adjust it based on mode. */

Looking at other drivers, I see they don't handle read only controls
in s_ctrl cb. Also the docs (vidioc-queryctrl.rst) says that trying to set a read only control should
return EINVAL

Thanks,
Dafna

> +		return 0;
>   	default:
>   		dev_info(&client->dev,
>   			 "Control (id:0x%x, val:0x%x) not supported\n",
> @@ -1313,7 +1327,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>   {
>   	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>   
> -	v4l2_ctrl_handler_init(&sensor->ctrls, 5);
> +	v4l2_ctrl_handler_init(&sensor->ctrls, 6);
>   
>   	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>   			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1333,17 +1347,29 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>   	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>   			  V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
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
> +	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
> -		return sensor->ctrls.error;
> -	}
> +	if (sensor->ctrls.error)
> +		goto handler_free;
>   
>   	sensor->sd.ctrl_handler = &sensor->ctrls;
>   
>   	return 0;
> +
> +handler_free:
> +	dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
> +		__func__, sensor->ctrls.error);
> +	v4l2_ctrl_handler_free(&sensor->ctrls);
> +
> +	return sensor->ctrls.error;
>   }
>   
>   static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
> 
