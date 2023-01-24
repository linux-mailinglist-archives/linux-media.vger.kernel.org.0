Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD286795CD
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 11:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbjAXKyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 05:54:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbjAXKyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 05:54:07 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AF7EC62
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 02:54:06 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324944651"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="324944651"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:54:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="692557790"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="692557790"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2023 02:54:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKGwC-00EIgi-2e;
        Tue, 24 Jan 2023 12:54:00 +0200
Date:   Tue, 24 Jan 2023 12:54:00 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 48/57] media: atomisp: ov2680: s/dev/sensor/
Message-ID: <Y8+4yDUddxRVVah3@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-49-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-49-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:56PM +0100, Hans de Goede wrote:
> Using dev as name for variables pointing to struct ov2680_device is a bit
> unfortunate choice.
> 
> All the recently added / rewritten code is already using sensor for this,
> replace the remaining usages of "struct ov2680_device *dev" with
> "struct ov2680_device *sensor".
> 
> Note the power_up()/power_down() related functions are not changed as
> these will be removed in one of the next patches.

No functional changes. ?

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/i2c/atomisp-ov2680.c        | 74 +++++++++----------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 881340d7466f..5f26508a1e5a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -472,7 +472,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *format)
>  {
> -	struct ov2680_device *dev = to_ov2680_sensor(sd);
> +	struct ov2680_device *sensor = to_ov2680_sensor(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct v4l2_mbus_framefmt *fmt;
>  	unsigned int width, height;
> @@ -485,17 +485,17 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>  	width = min_t(unsigned int, ALIGN(format->format.width, 2), OV2680_NATIVE_WIDTH);
>  	height = min_t(unsigned int, ALIGN(format->format.height, 2), OV2680_NATIVE_HEIGHT);
>  
> -	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
> -	ov2680_fill_format(dev, fmt, width, height);
> +	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
> +	ov2680_fill_format(sensor, fmt, width, height);
>  
>  	format->format = *fmt;
>  
>  	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>  		return 0;
>  
> -	mutex_lock(&dev->input_lock);
> -	ov2680_calc_mode(dev, fmt->width, fmt->height);
> -	mutex_unlock(&dev->input_lock);
> +	mutex_lock(&sensor->input_lock);
> +	ov2680_calc_mode(sensor, fmt->width, fmt->height);
> +	mutex_unlock(&sensor->input_lock);
>  	return 0;
>  }
>  
> @@ -503,10 +503,10 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *format)
>  {
> -	struct ov2680_device *dev = to_ov2680_sensor(sd);
> +	struct ov2680_device *sensor = to_ov2680_sensor(sd);
>  	struct v4l2_mbus_framefmt *fmt;
>  
> -	fmt = __ov2680_get_pad_format(dev, sd_state, format->pad, format->which);
> +	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
>  	format->format = *fmt;
>  	return 0;
>  }
> @@ -596,17 +596,17 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
>  static int ov2680_s_config(struct v4l2_subdev *sd,
>  			   int irq, void *platform_data)
>  {
> -	struct ov2680_device *dev = to_ov2680_sensor(sd);
> +	struct ov2680_device *sensor = to_ov2680_sensor(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	int ret = 0;
>  
>  	if (!platform_data)
>  		return -ENODEV;
>  
> -	dev->platform_data =
> +	sensor->platform_data =
>  	    (struct camera_sensor_platform_data *)platform_data;
>  
> -	mutex_lock(&dev->input_lock);
> +	mutex_lock(&sensor->input_lock);
>  
>  	ret = pm_runtime_get_sync(&client->dev);
>  	if (ret < 0) {
> @@ -614,7 +614,7 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
>  		goto fail_power_on;
>  	}
>  
> -	ret = dev->platform_data->csi_cfg(sd, 1);
> +	ret = sensor->platform_data->csi_cfg(sd, 1);
>  	if (ret)
>  		goto fail_csi_cfg;
>  
> @@ -627,16 +627,16 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
>  
>  	/* turn off sensor, after probed */
>  	pm_runtime_put(&client->dev);
> -	mutex_unlock(&dev->input_lock);
> +	mutex_unlock(&sensor->input_lock);
>  
>  	return 0;
>  
>  fail_csi_cfg:
> -	dev->platform_data->csi_cfg(sd, 0);
> +	sensor->platform_data->csi_cfg(sd, 0);
>  fail_power_on:
>  	pm_runtime_put(&client->dev);
>  	dev_err(&client->dev, "sensor power-gating failed\n");
> -	mutex_unlock(&dev->input_lock);
> +	mutex_unlock(&sensor->input_lock);
>  	return ret;
>  }
>  
> @@ -770,35 +770,35 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
>  static void ov2680_remove(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> -	struct ov2680_device *dev = to_ov2680_sensor(sd);
> +	struct ov2680_device *sensor = to_ov2680_sensor(sd);
>  
>  	dev_dbg(&client->dev, "ov2680_remove...\n");
>  
> -	dev->platform_data->csi_cfg(sd, 0);
> +	sensor->platform_data->csi_cfg(sd, 0);
>  
>  	v4l2_device_unregister_subdev(sd);
> -	media_entity_cleanup(&dev->sd.entity);
> -	v4l2_ctrl_handler_free(&dev->ctrls.handler);
> +	media_entity_cleanup(&sensor->sd.entity);
> +	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  	pm_runtime_disable(&client->dev);
> -	kfree(dev);
> +	kfree(sensor);
>  }
>  
>  static int ov2680_probe(struct i2c_client *client)
>  {
> -	struct ov2680_device *dev;
> +	struct ov2680_device *sensor;
>  	int ret;
>  	void *pdata;
>  
> -	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> -	if (!dev)
> +	sensor = kzalloc(sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
>  		return -ENOMEM;
>  
> -	mutex_init(&dev->input_lock);
> +	mutex_init(&sensor->input_lock);
>  
> -	dev->client = client;
> -	v4l2_i2c_subdev_init(&dev->sd, client, &ov2680_ops);
> +	sensor->client = client;
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
>  
> -	pdata = gmin_camera_platform_data(&dev->sd,
> +	pdata = gmin_camera_platform_data(&sensor->sd,
>  					  ATOMISP_INPUT_FORMAT_RAW_10,
>  					  atomisp_bayer_order_bggr);
>  	if (!pdata) {
> @@ -811,29 +811,29 @@ static int ov2680_probe(struct i2c_client *client)
>  	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>  	pm_runtime_use_autosuspend(&client->dev);
>  
> -	ret = ov2680_s_config(&dev->sd, client->irq, pdata);
> +	ret = ov2680_s_config(&sensor->sd, client->irq, pdata);
>  	if (ret)
>  		goto out_free;
>  
> -	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
> -	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
> -	ret = ov2680_init_controls(dev);
> +	ret = ov2680_init_controls(sensor);
>  	if (ret) {
>  		ov2680_remove(client);
>  		return ret;
>  	}
>  
> -	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
>  	if (ret) {
>  		ov2680_remove(client);
>  		return ret;
>  	}
>  
> -	ov2680_fill_format(dev, &dev->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
> +	ov2680_fill_format(sensor, &sensor->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
>  
> -	ret = atomisp_register_i2c_module(&dev->sd, pdata, RAW_CAMERA);
> +	ret = atomisp_register_i2c_module(&sensor->sd, pdata, RAW_CAMERA);
>  	if (ret) {
>  		ov2680_remove(client);
>  		return ret;
> @@ -842,8 +842,8 @@ static int ov2680_probe(struct i2c_client *client)
>  	return 0;
>  out_free:
>  	dev_dbg(&client->dev, "+++ out free\n");
> -	v4l2_device_unregister_subdev(&dev->sd);
> -	kfree(dev);
> +	v4l2_device_unregister_subdev(&sensor->sd);
> +	kfree(sensor);
>  	return ret;
>  }
>  
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


