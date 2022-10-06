Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7C35F6DFC
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 21:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiJFTOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 15:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbiJFTOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 15:14:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65648B14D1
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665083672; x=1696619672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KRuKFI8SRG+IqBI126M/6iIeDJ3Ffx0llThQEoD6yx0=;
  b=iKMqdzxn9sdguKW83ePGn7M+56SU38lQSXW7VLPbwvrgT5gUkW3n8Dgq
   qy78skLhE7cFZFZ6u4yj4nhDDzX1iP/M3lgAcCChe5tcaNY2r8XTVy5Un
   ghl+qfCV8qFvTPWusmVZnFQFIu0ppBmSz5jDkn/T6fhHdnXkBNHyq6zxh
   ocNIe6YnNe7DKxIu8UC4N4dJoX/EK7tUQsiNPvmcTKhPvCGwbZvS7YD6c
   I6c+x+K6Njwrmgyks4z+r2wrmwA+BDEk1fxk54Ey7QPDQGeJyhkbRBVbR
   ynuWnWveLnTRQWBfSbHfvQEBkOGMabwUj+OiIXRM47w1BLYQ789imOEwh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="283262703"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="283262703"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 12:14:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="767273485"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="767273485"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 12:14:29 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 641BE20274;
        Thu,  6 Oct 2022 22:14:27 +0300 (EEST)
Date:   Thu, 6 Oct 2022 19:14:27 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        hverkuil@xs4all.nl
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

Thanks for the update. A few more comments below...

On Tue, Sep 27, 2022 at 10:37:02AM +0200, Benjamin Mugnier wrote:
> +static const char * const vgxy61_hdr_mode_menu[] = {
> +	"HDR linearize",
> +	"HDR substraction",
> +	"No HDR",
> +};

I think more documentation is needed on the HDR modes. What do these mean?
For instance, are they something that requires further processing or is the
result e.g. a ready HDR image?

This should probably make it to driver specific documentation.

> +
> +static const char * const vgxy61_supply_name[] = {
> +	"VCORE",
> +	"VDDIO",
> +	"VANA",
> +};
> +
> +#define VGXY61_NUM_SUPPLIES		ARRAY_SIZE(vgxy61_supply_name)

Please use plain ARRAY_SIZE() instead.

...

> +static int vgxy61_poll_reg(struct vgxy61_dev *sensor, u32 reg, u8 poll_val,
> +			   unsigned int timeout_ms)
> +{
> +	const unsigned int loop_delay_ms = 10;
> +	int ret, timeout;
> +
> +	timeout = read_poll_timeout(vgxy61_read_reg, ret,
> +				    ((ret < 0) || (ret == poll_val)),
> +				    loop_delay_ms * 1000, timeout_ms * 1000,
> +				    false, sensor, reg);
> +	if (timeout)
> +		return timeout;
> +
> +	return 0;

"timeout" here is entirely pointless.

> +}

...

> +static int vgxy61_apply_exposure(struct vgxy61_dev *sensor)
> +{
> +	int ret = 0;
> +
> +	 /* We first set expo to zero to avoid forbidden parameters couple */
> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_SHORT,
> +			       0, &ret);
> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_LONG,
> +			       sensor->expo_long, &ret);
> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_SHORT,
> +			       sensor->expo_short, &ret);

return vgxy61_write_reg(...);

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

...

> +static int vgxy61_init_controls(struct vgxy61_dev *sensor)
> +{
> +	const struct v4l2_ctrl_ops *ops = &vgxy61_ctrl_ops;
> +	struct v4l2_ctrl_handler *hdl = &sensor->ctrl_handler;
> +	const struct vgxy61_mode_info *cur_mode = sensor->current_mode;
> +	struct v4l2_ctrl *ctrl;
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(hdl, 16);
> +	/* We can use our own mutex for the ctrl lock */
> +	hdl->lock = &sensor->lock;
> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN, 0, 0x1c, 1,
> +			  sensor->analog_gain);
> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN, 0, 0xfff, 1,
> +			  sensor->digital_gain);
> +	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(vgxy61_test_pattern_menu) - 1,
> +				     0, 0, vgxy61_test_pattern_menu);
> +	ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, 0,
> +				 sensor->line_length, 1,
> +				 sensor->line_length - cur_mode->width);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	ctrl = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> +				      ARRAY_SIZE(link_freq) - 1, 0, link_freq);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_MODE,
> +				     ARRAY_SIZE(vgxy61_hdr_mode_menu) - 1, 0,
> +				     VGXY61_NO_HDR, vgxy61_hdr_mode_menu);
> +
> +	/*
> +	 * Keep a pointer to these controls as we need to update them when
> +	 * setting the format
> +	 */
> +	sensor->pixel_rate_ctrl = v4l2_ctrl_new_std(hdl, ops,
> +						    V4L2_CID_PIXEL_RATE, 1,
> +						    INT_MAX, 1,
> +						    get_pixel_rate(sensor));
> +	sensor->pixel_rate_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;

Also sensor->pixel_rate_ctrl may be NULL here.

> +	sensor->expo_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> +					      sensor->expo_min,
> +					      sensor->expo_max, 1,
> +					      sensor->expo_long);
> +	sensor->vblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> +						sensor->vblank_min,
> +						0xffff - cur_mode->crop.height,
> +						1, sensor->vblank);
> +	sensor->vflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP,
> +					       0, 1, 1, sensor->vflip);
> +	sensor->hflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP,
> +					       0, 1, 1, sensor->hflip);
> +
> +	if (hdl->error) {
> +		ret = hdl->error;
> +		goto free_ctrls;
> +	}
> +
> +	sensor->sd.ctrl_handler = hdl;
> +	return 0;
> +
> +free_ctrls:
> +	v4l2_ctrl_handler_free(hdl);
> +	return ret;
> +}

...

> +static int vgxy61_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct fwnode_handle *handle;
> +	struct vgxy61_dev *sensor;
> +	int ret;
> +
> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor->i2c_client = client;
> +	sensor->streaming = false;
> +	sensor->hdr = VGXY61_NO_HDR;
> +	sensor->expo_long = 200;
> +	sensor->expo_short = 0;
> +	sensor->hflip = false;
> +	sensor->vflip = false;
> +	sensor->analog_gain = 0;
> +	sensor->digital_gain = 256;
> +
> +	handle = fwnode_graph_get_next_endpoint(of_fwnode_handle(dev->of_node),
> +						NULL);

handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);

> +	if (!handle) {
> +		dev_err(dev, "handle node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = vgxy61_tx_from_ep(sensor, handle);
> +	fwnode_handle_put(handle);
> +	if (ret) {
> +		dev_err(dev, "Failed to parse handle %d\n", ret);
> +		return ret;
> +	}
> +
> +	sensor->xclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(sensor->xclk)) {
> +		dev_err(dev, "failed to get xclk\n");
> +		return PTR_ERR(sensor->xclk);
> +	}
> +	sensor->clk_freq = clk_get_rate(sensor->xclk);
> +	if (sensor->clk_freq < 6 * HZ_PER_MHZ ||
> +	    sensor->clk_freq > 27 * HZ_PER_MHZ) {
> +		dev_err(dev, "Only 6Mhz-27Mhz clock range supported. provide %lu MHz\n",
> +			sensor->clk_freq / HZ_PER_MHZ);
> +		return -EINVAL;
> +	}
> +	sensor->gpios_polarity = of_property_read_bool(dev->of_node,
> +						       "invert-gpios-polarity");

I thought we did discuss dropping support for sensor synchronisation in
this version?

> +
> +	v4l2_i2c_subdev_init(&sensor->sd, client, &vgxy61_subdev_ops);
> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sensor->sd.entity.ops = &vgxy61_subdev_entity_ops;
> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +
> +	ret = vgxy61_get_regulators(sensor);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to get regulators %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(VGXY61_NUM_SUPPLIES, sensor->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to enable regulators %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = vgxy61_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = vgxy61_detect(sensor);
> +	if (ret) {
> +		dev_err(&client->dev, "sensor detect failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	vgxy61_fill_sensor_param(sensor);
> +	vgxy61_fill_framefmt(sensor, sensor->current_mode, &sensor->fmt,
> +			     VGXY61_MEDIA_BUS_FMT_DEF);
> +
> +	ret = vgxy61_update_hdr(sensor, sensor->hdr);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&sensor->lock);
> +
> +	ret = vgxy61_init_controls(sensor);
> +	if (ret) {
> +		dev_err(&client->dev, "controls initialization failed %d\n",
> +			ret);
> +		goto error_power_off;
> +	}
> +
> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> +	if (ret) {
> +		dev_err(&client->dev, "pads init failed %d\n", ret);
> +		goto error_handler_free;
> +	}
> +
> +	/* Enable runtime PM and turn off the device */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	ret = v4l2_async_register_subdev(&sensor->sd);
> +	if (ret) {
> +		dev_err(&client->dev, "async subdev register failed %d\n", ret);
> +		goto error_pm_runtime;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> +	pm_runtime_use_autosuspend(&client->dev);
> +
> +	dev_dbg(&client->dev, "vgxy61 probe successfully\n");
> +
> +	return 0;
> +
> +error_pm_runtime:
> +	pm_runtime_disable(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +	media_entity_cleanup(&sensor->sd.entity);
> +error_handler_free:
> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> +	mutex_destroy(&sensor->lock);
> +error_power_off:
> +	vgxy61_power_off(dev);
> +
> +	return ret;
> +}

-- 
Kind regards,

Sakari Ailus
