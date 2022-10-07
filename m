Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68A65F77F8
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiJGMcQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiJGMcO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:32:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675F5C09A0
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:32:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46B51BBE;
        Fri,  7 Oct 2022 14:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665145931;
        bh=lRtTaHJB+7xl5itslAbElHG1gWI8aZfTlckfnNYKnBs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lHroY8Lyo2s4nZXpHL0zzqvGzwlfpWyo0pTzzdW3gtdQ7GaTJg55KoqLWv927Nq1/
         K4H6R1vJhAAi31Lbd6zjMWo0O+tSzLOKKb9191Rln2+zut7lNfzxsDL2FvWi7nz+Tq
         gypIiIhyh1X3/YSMz3CGSmWmguVqofmFvrnjD0EU=
Date:   Fri, 7 Oct 2022 15:32:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, hverkuil@xs4all.nl
Subject: Re: [PATCH v6 4/4] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <Y0AcRntvOlouAs8+@pendragon.ideasonboard.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
 <20220927083702.14138-5-benjamin.mugnier@foss.st.com>
 <Yz8pE15/9tDf6Tjy@paasikivi.fi.intel.com>
 <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af876e81-9105-9a0f-4dd1-47bc17886536@foss.st.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, Oct 07, 2022 at 02:24:16PM +0200, Benjamin MUGNIER wrote:
> Hi Sakari,
> 
> Thank you for your review.
> Please consider everything not commented as queued for v7.
> 
> On 10/6/22 21:14, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > Thanks for the update. A few more comments below...
> > 
> > On Tue, Sep 27, 2022 at 10:37:02AM +0200, Benjamin Mugnier wrote:
> >> +static const char * const vgxy61_hdr_mode_menu[] = {
> >> +	"HDR linearize",
> >> +	"HDR substraction",
> >> +	"No HDR",
> >> +};
> > 
> > I think more documentation is needed on the HDR modes. What do these mean?
> > For instance, are they something that requires further processing or is the
> > result e.g. a ready HDR image?
> > 
> > This should probably make it to driver specific documentation.
> 
> Sure, in fact I did something like this in v3:
> https://lore.kernel.org/linux-media/20220512074037.3829926-4-benjamin.mugnier@foss.st.com/
> 
> Since I standardized the control I was unsure what to do with this
> documentation, and dropped it.
> 
> I will add back the
> Documentation/userspace-api/media/drivers/st-vgxy61.rst file from this
> commit to the patchset, while changing the control name to the new
> one.

The documentation there is about modes for HDR merge on the sensor side.
Can the sensor also output the unmerged images, for instance
line-interleaved ?

> >> +
> >> +static const char * const vgxy61_supply_name[] = {
> >> +	"VCORE",
> >> +	"VDDIO",
> >> +	"VANA",
> >> +};
> >> +
> >> +#define VGXY61_NUM_SUPPLIES		ARRAY_SIZE(vgxy61_supply_name)
> > 
> > Please use plain ARRAY_SIZE() instead.
> > 
> > ...
> > 
> >> +static int vgxy61_poll_reg(struct vgxy61_dev *sensor, u32 reg, u8 poll_val,
> >> +			   unsigned int timeout_ms)
> >> +{
> >> +	const unsigned int loop_delay_ms = 10;
> >> +	int ret, timeout;
> >> +
> >> +	timeout = read_poll_timeout(vgxy61_read_reg, ret,
> >> +				    ((ret < 0) || (ret == poll_val)),
> >> +				    loop_delay_ms * 1000, timeout_ms * 1000,
> >> +				    false, sensor, reg);
> >> +	if (timeout)
> >> +		return timeout;
> >> +
> >> +	return 0;
> > 
> > "timeout" here is entirely pointless.
> > 
> >> +}
> > 
> > ...
> > 
> >> +static int vgxy61_apply_exposure(struct vgxy61_dev *sensor)
> >> +{
> >> +	int ret = 0;
> >> +
> >> +	 /* We first set expo to zero to avoid forbidden parameters couple */
> >> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_SHORT,
> >> +			       0, &ret);
> >> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_LONG,
> >> +			       sensor->expo_long, &ret);
> >> +	ret = vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_SHORT,
> >> +			       sensor->expo_short, &ret);
> > 
> > return vgxy61_write_reg(...);
> > 
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	return 0;
> >> +}
> > 
> > ...
> > 
> >> +static int vgxy61_init_controls(struct vgxy61_dev *sensor)
> >> +{
> >> +	const struct v4l2_ctrl_ops *ops = &vgxy61_ctrl_ops;
> >> +	struct v4l2_ctrl_handler *hdl = &sensor->ctrl_handler;
> >> +	const struct vgxy61_mode_info *cur_mode = sensor->current_mode;
> >> +	struct v4l2_ctrl *ctrl;
> >> +	int ret;
> >> +
> >> +	v4l2_ctrl_handler_init(hdl, 16);
> >> +	/* We can use our own mutex for the ctrl lock */
> >> +	hdl->lock = &sensor->lock;
> >> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN, 0, 0x1c, 1,
> >> +			  sensor->analog_gain);
> >> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN, 0, 0xfff, 1,
> >> +			  sensor->digital_gain);
> >> +	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
> >> +				     ARRAY_SIZE(vgxy61_test_pattern_menu) - 1,
> >> +				     0, 0, vgxy61_test_pattern_menu);
> >> +	ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, 0,
> >> +				 sensor->line_length, 1,
> >> +				 sensor->line_length - cur_mode->width);
> >> +	if (ctrl)
> >> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >> +	ctrl = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> >> +				      ARRAY_SIZE(link_freq) - 1, 0, link_freq);
> >> +	if (ctrl)
> >> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >> +	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_MODE,
> >> +				     ARRAY_SIZE(vgxy61_hdr_mode_menu) - 1, 0,
> >> +				     VGXY61_NO_HDR, vgxy61_hdr_mode_menu);
> >> +
> >> +	/*
> >> +	 * Keep a pointer to these controls as we need to update them when
> >> +	 * setting the format
> >> +	 */
> >> +	sensor->pixel_rate_ctrl = v4l2_ctrl_new_std(hdl, ops,
> >> +						    V4L2_CID_PIXEL_RATE, 1,
> >> +						    INT_MAX, 1,
> >> +						    get_pixel_rate(sensor));
> >> +	sensor->pixel_rate_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > 
> > Also sensor->pixel_rate_ctrl may be NULL here.
> > 
> >> +	sensor->expo_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
> >> +					      sensor->expo_min,
> >> +					      sensor->expo_max, 1,
> >> +					      sensor->expo_long);
> >> +	sensor->vblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> >> +						sensor->vblank_min,
> >> +						0xffff - cur_mode->crop.height,
> >> +						1, sensor->vblank);
> >> +	sensor->vflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP,
> >> +					       0, 1, 1, sensor->vflip);
> >> +	sensor->hflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP,
> >> +					       0, 1, 1, sensor->hflip);
> >> +
> >> +	if (hdl->error) {
> >> +		ret = hdl->error;
> >> +		goto free_ctrls;
> >> +	}
> >> +
> >> +	sensor->sd.ctrl_handler = hdl;
> >> +	return 0;
> >> +
> >> +free_ctrls:
> >> +	v4l2_ctrl_handler_free(hdl);
> >> +	return ret;
> >> +}
> > 
> > ...
> > 
> >> +static int vgxy61_probe(struct i2c_client *client)
> >> +{
> >> +	struct device *dev = &client->dev;
> >> +	struct fwnode_handle *handle;
> >> +	struct vgxy61_dev *sensor;
> >> +	int ret;
> >> +
> >> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
> >> +	if (!sensor)
> >> +		return -ENOMEM;
> >> +
> >> +	sensor->i2c_client = client;
> >> +	sensor->streaming = false;
> >> +	sensor->hdr = VGXY61_NO_HDR;
> >> +	sensor->expo_long = 200;
> >> +	sensor->expo_short = 0;
> >> +	sensor->hflip = false;
> >> +	sensor->vflip = false;
> >> +	sensor->analog_gain = 0;
> >> +	sensor->digital_gain = 256;
> >> +
> >> +	handle = fwnode_graph_get_next_endpoint(of_fwnode_handle(dev->of_node),
> >> +						NULL);
> > 
> > handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > 
> >> +	if (!handle) {
> >> +		dev_err(dev, "handle node not found\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	ret = vgxy61_tx_from_ep(sensor, handle);
> >> +	fwnode_handle_put(handle);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to parse handle %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	sensor->xclk = devm_clk_get(dev, NULL);
> >> +	if (IS_ERR(sensor->xclk)) {
> >> +		dev_err(dev, "failed to get xclk\n");
> >> +		return PTR_ERR(sensor->xclk);
> >> +	}
> >> +	sensor->clk_freq = clk_get_rate(sensor->xclk);
> >> +	if (sensor->clk_freq < 6 * HZ_PER_MHZ ||
> >> +	    sensor->clk_freq > 27 * HZ_PER_MHZ) {
> >> +		dev_err(dev, "Only 6Mhz-27Mhz clock range supported. provide %lu MHz\n",
> >> +			sensor->clk_freq / HZ_PER_MHZ);
> >> +		return -EINVAL;
> >> +	}
> >> +	sensor->gpios_polarity = of_property_read_bool(dev->of_node,
> >> +						       "invert-gpios-polarity");
> > 
> > I thought we did discuss dropping support for sensor synchronisation in
> > this version?
> 
> This properties affects strobing lights gpios polarities as you can
> see in vgxy61_update_gpios_strobe_polarity. If set to '1' all strobing
> gpios are inverted. This has nothing to do with the sensor
> synchronization.
> 
> Now I realize this is poorly named, and I even forgot to document it
> in the device tree bindings file. I apologize.
> 
> I would like to rename it to 'st,strobe-polarity' since this is vendor
> specific and to better reflect that it affects strobing gpios.
> I'll make this change for v7 and document this in the bindings file
> too. Tell me if there is any issues with that.
> 
> >> +
> >> +	v4l2_i2c_subdev_init(&sensor->sd, client, &vgxy61_subdev_ops);
> >> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> >> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
> >> +	sensor->sd.entity.ops = &vgxy61_subdev_entity_ops;
> >> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> >> +
> >> +	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> >> +						     GPIOD_OUT_HIGH);
> >> +
> >> +	ret = vgxy61_get_regulators(sensor);
> >> +	if (ret) {
> >> +		dev_err(&client->dev, "failed to get regulators %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = regulator_bulk_enable(VGXY61_NUM_SUPPLIES, sensor->supplies);
> >> +	if (ret) {
> >> +		dev_err(&client->dev, "failed to enable regulators %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = vgxy61_power_on(dev);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = vgxy61_detect(sensor);
> >> +	if (ret) {
> >> +		dev_err(&client->dev, "sensor detect failed %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	vgxy61_fill_sensor_param(sensor);
> >> +	vgxy61_fill_framefmt(sensor, sensor->current_mode, &sensor->fmt,
> >> +			     VGXY61_MEDIA_BUS_FMT_DEF);
> >> +
> >> +	ret = vgxy61_update_hdr(sensor, sensor->hdr);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	mutex_init(&sensor->lock);
> >> +
> >> +	ret = vgxy61_init_controls(sensor);
> >> +	if (ret) {
> >> +		dev_err(&client->dev, "controls initialization failed %d\n",
> >> +			ret);
> >> +		goto error_power_off;
> >> +	}
> >> +
> >> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
> >> +	if (ret) {
> >> +		dev_err(&client->dev, "pads init failed %d\n", ret);
> >> +		goto error_handler_free;
> >> +	}
> >> +
> >> +	/* Enable runtime PM and turn off the device */
> >> +	pm_runtime_set_active(dev);
> >> +	pm_runtime_enable(dev);
> >> +	pm_runtime_idle(dev);
> >> +
> >> +	ret = v4l2_async_register_subdev(&sensor->sd);
> >> +	if (ret) {
> >> +		dev_err(&client->dev, "async subdev register failed %d\n", ret);
> >> +		goto error_pm_runtime;
> >> +	}
> >> +
> >> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> >> +	pm_runtime_use_autosuspend(&client->dev);
> >> +
> >> +	dev_dbg(&client->dev, "vgxy61 probe successfully\n");
> >> +
> >> +	return 0;
> >> +
> >> +error_pm_runtime:
> >> +	pm_runtime_disable(&client->dev);
> >> +	pm_runtime_set_suspended(&client->dev);
> >> +	media_entity_cleanup(&sensor->sd.entity);
> >> +error_handler_free:
> >> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
> >> +	mutex_destroy(&sensor->lock);
> >> +error_power_off:
> >> +	vgxy61_power_off(dev);
> >> +
> >> +	return ret;
> >> +}

-- 
Regards,

Laurent Pinchart
