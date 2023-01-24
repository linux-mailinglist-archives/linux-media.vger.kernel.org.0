Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD796795C1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 11:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbjAXKwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 05:52:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232302AbjAXKwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 05:52:00 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684BD1BC1
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 02:51:59 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306622276"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="306622276"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="639536599"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="639536599"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2023 02:51:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKGu9-00EIcv-2z;
        Tue, 24 Jan 2023 12:51:53 +0200
Date:   Tue, 24 Jan 2023 12:51:53 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 46/57] media: atomisp: ov2680: Delay power-on till
 streaming is started
Message-ID: <Y8+4SZzMpgI1yNaU@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-47-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-47-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:54PM +0100, Hans de Goede wrote:
> Move the setting of the mode to stream on, this also allows
> delaying power-on till streaming is started.
> 
> And drop the deprecated s_power callback since this now no long
> is necessary.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

See below.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-ov2680.c        | 101 +++++++-----------
>  1 file changed, 41 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 1dc821ca4e68..2a8c4508cc66 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -327,24 +327,6 @@ static int power_down(struct v4l2_subdev *sd)
>  	return 0;
>  }
>  
> -static int ov2680_s_power(struct v4l2_subdev *sd, int on)
> -{
> -	struct ov2680_device *dev = to_ov2680_sensor(sd);
> -	int ret;
> -
> -	mutex_lock(&dev->input_lock);
> -
> -	if (on == 0) {
> -		ret = power_down(sd);
> -	} else {
> -		ret = power_up(sd);
> -	}
> -
> -	mutex_unlock(&dev->input_lock);
> -
> -	return ret;
> -}
> -
>  static struct v4l2_mbus_framefmt *
>  __ov2680_get_pad_format(struct ov2680_device *sensor,
>  			struct v4l2_subdev_state *state,
> @@ -393,14 +375,12 @@ static void ov2680_calc_mode(struct ov2680_device *sensor, int width, int height
>  	sensor->mode.vts = OV2680_LINES_PER_FRAME;
>  }
>  
> -static int ov2680_set_mode(struct ov2680_device *sensor, int width, int height)
> +static int ov2680_set_mode(struct ov2680_device *sensor)
>  {
>  	struct i2c_client *client = sensor->client;
>  	u8 pll_div, unknown, inc, fmt1, fmt2;
>  	int ret;
>  
> -	ov2680_calc_mode(sensor, width, height);
> -
>  	if (sensor->mode.binning) {
>  		pll_div = 1;
>  		unknown = 0x23;
> @@ -500,7 +480,6 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *fmt;
>  	unsigned int width, height;
> -	int ret = 0;
>  
>  	dev_dbg(&client->dev, "%s: %s: pad: %d, fmt: %p\n",
>  		__func__,
> @@ -518,23 +497,10 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>  		return 0;
>  
> -	dev_dbg(&client->dev, "%s: %dx%d\n",
> -		__func__, fmt->width, fmt->height);
> -
>  	mutex_lock(&dev->input_lock);
> -
> -	/* s_power has not been called yet for std v4l2 clients (camorama) */
> -	power_up(sd);
> -
> -	ret = ov2680_set_mode(dev, fmt->width, fmt->height);
> -	if (ret < 0)
> -		goto err;
> -
> -	/* Restore value of all ctrls */
> -	ret = __v4l2_ctrl_handler_setup(&dev->ctrls.handler);
> -err:
> +	ov2680_calc_mode(dev, fmt->width, fmt->height);
>  	mutex_unlock(&dev->input_lock);
> -	return ret;
> +	return 0;
>  }
>  
>  static int ov2680_get_fmt(struct v4l2_subdev *sd,
> @@ -584,30 +550,50 @@ static int ov2680_detect(struct i2c_client *client)
>  
>  static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
>  {
> -	struct ov2680_device *dev = to_ov2680_sensor(sd);
> +	struct ov2680_device *sensor = to_ov2680_sensor(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret;
> +	int ret = 0;
>  
> -	mutex_lock(&dev->input_lock);
> -	if (enable)
> -		dev_dbg(&client->dev, "ov2680_s_stream one\n");
> -	else
> -		dev_dbg(&client->dev, "ov2680_s_stream off\n");
> -
> -	ret = ovxxxx_write_reg8(client, OV2680_SW_STREAM,
> -				enable ? OV2680_START_STREAMING : OV2680_STOP_STREAMING);
> -	if (ret == 0) {
> -		dev->is_streaming = enable;
> -		v4l2_ctrl_activate(dev->ctrls.vflip, !enable);
> -		v4l2_ctrl_activate(dev->ctrls.hflip, !enable);
> +	mutex_lock(&sensor->input_lock);
> +
> +	if (sensor->is_streaming == enable) {
> +		dev_warn(&client->dev, "stream already %sed\n", enable ? "start" : "stopp");

stopP ?!

> +		goto error_unlock;
>  	}
>  
> -	//otp valid at stream on state
> -	//if(!dev->otp_data)
> -	//	dev->otp_data = ov2680_otp_read(sd);
> +	if (enable) {
> +		ret = power_up(sd);
> +		if (ret)
> +			goto error_unlock;
>  
> -	mutex_unlock(&dev->input_lock);
> +		ret = ov2680_set_mode(sensor);
> +		if (ret)
> +			goto error_power_down;
>  
> +		/* Restore value of all ctrls */
> +		ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> +		if (ret)
> +			goto error_power_down;
> +
> +		ret = ovxxxx_write_reg8(client, OV2680_SW_STREAM, OV2680_START_STREAMING);
> +		if (ret)
> +			goto error_power_down;
> +	} else {
> +		ovxxxx_write_reg8(client, OV2680_SW_STREAM, OV2680_STOP_STREAMING);
> +		power_down(sd);
> +	}
> +
> +	sensor->is_streaming = enable;
> +	v4l2_ctrl_activate(sensor->ctrls.vflip, !enable);
> +	v4l2_ctrl_activate(sensor->ctrls.hflip, !enable);
> +
> +	mutex_unlock(&sensor->input_lock);
> +	return 0;
> +
> +error_power_down:
> +	power_down(sd);
> +error_unlock:
> +	mutex_unlock(&sensor->input_lock);
>  	return ret;
>  }
>  
> @@ -736,10 +722,6 @@ static const struct v4l2_subdev_sensor_ops ov2680_sensor_ops = {
>  	.g_skip_frames	= ov2680_g_skip_frames,
>  };
>  
> -static const struct v4l2_subdev_core_ops ov2680_core_ops = {
> -	.s_power = ov2680_s_power,
> -};
> -
>  static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
>  	.enum_mbus_code = ov2680_enum_mbus_code,
>  	.enum_frame_size = ov2680_enum_frame_size,
> @@ -749,7 +731,6 @@ static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
>  };
>  
>  static const struct v4l2_subdev_ops ov2680_ops = {
> -	.core = &ov2680_core_ops,
>  	.video = &ov2680_video_ops,
>  	.pad = &ov2680_pad_ops,
>  	.sensor = &ov2680_sensor_ops,
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


