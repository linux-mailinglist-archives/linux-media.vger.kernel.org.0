Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78D77668660
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 23:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240086AbjALWHs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 17:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjALWGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 17:06:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52BCC7
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 13:55:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77BA6492;
        Thu, 12 Jan 2023 22:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673560556;
        bh=STfXc3ObPxq+eJJzPmzMS6k0se11ecvTr/msqFDMaB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tzRD4Wdl2TQHYdkQI5Qd/onabExzZYRodhQKiGufYFABi/2r8l6cbzEQGRsKrX7yX
         Zk4kV/YM1SdR1gV7g3nsLT6870p5Q9ed/CsOcUama61vCWojxkgHgZ3HjBrvz6rvM4
         qlps9AIcygWvnKxtOO0VJSYzAj8b8FkdbgOd80DM=
Date:   Thu, 12 Jan 2023 23:55:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Nicholas Roth <nicholas@rothemail.net>,
        Robert Mader <robert.mader@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add driver for OmniVision OV8858
Message-ID: <Y8CB60mdY0fcFAXI@pendragon.ideasonboard.com>
References: <20230109120129.24519-1-jacopo@jmondi.org>
 <20230109120129.24519-3-jacopo@jmondi.org>
 <Y71hyqZePgLx5OTG@pendragon.ideasonboard.com>
 <20230110155220.refzsjxkasosgnof@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230110155220.refzsjxkasosgnof@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Jan 10, 2023 at 04:52:20PM +0100, Jacopo Mondi wrote:
> On Tue, Jan 10, 2023 at 03:02:02PM +0200, Laurent Pinchart wrote:
> > On Mon, Jan 09, 2023 at 01:01:29PM +0100, Jacopo Mondi wrote:
> > > From: Nicholas Roth <nicholas@rothemail.net>
> > >
> > > Add a driver for OmniVision OV8858 image sensor.
> > >
> > > The driver currently supports operations with 2 and 4 data lanes, in
> > > full resolution and half-binned resolution modes.
> > >
> > > The driver has been upported from the PinephonePro BSP available at
> > > https://gitlab.com/pine64-org/linux.git
> > > at commit 8c4a90c12dc2 ("media: i2c: ov8858: Use default subdev
> > > name").
> > >
> > > Signed-off-by: Nicholas Roth <nicholas@rothemail.net>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > ---
> > >  MAINTAINERS                |    9 +
> > >  drivers/media/i2c/Kconfig  |   13 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/ov8858.c | 1993 ++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 2016 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov8858.c

[snip]

> > > diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
> > > new file mode 100644
> > > index 000000000000..4c50cdd55e16
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/ov8858.c
> > > @@ -0,0 +1,1993 @@

[snip]

> > > +/* ----------------------------------------------------------------------------
> > > + * Probe and initialization
> > > + */
> > > +
> > > +static int ov8858_init_ctrls(struct ov8858 *ov8858)
> >
> > I'd put this function just after ov8858_ctrl_ops to group it with the
> > rest of the control code. Up to you.
> 
> I was debated, but this is still "probing" to me..
> 
> > > +{
> > > +	struct v4l2_ctrl_handler *handler = &ov8858->ctrl_handler;
> > > +	const struct ov8858_mode *mode = &ov8858_modes[0];
> > > +	struct v4l2_fwnode_device_properties props;
> > > +	s64 exposure_max, vblank_def;
> > > +	struct v4l2_ctrl *ctrl;
> > > +	u32 h_blank;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_ctrl_handler_init(handler, 10);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ,
> > > +				      0, 0, link_freq_menu_items);
> > > +	if (ctrl)
> > > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> > > +			  0, ov8858->pixel_rate, 1, ov8858->pixel_rate);
> > > +
> > > +	h_blank = mode->hts_def - mode->width;
> > > +	ov8858->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> > > +					   h_blank, h_blank, 1, h_blank);
> > > +	if (ov8858->hblank)
> > > +		ov8858->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	vblank_def = mode->vts_def - mode->height;
> > > +	ov8858->vblank = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> > > +					   V4L2_CID_VBLANK, vblank_def,
> > > +					   OV8858_VTS_MAX - mode->height,
> > > +					   1, vblank_def);
> > > +
> > > +	exposure_max = mode->vts_def - OV8858_EXPOSURE_MARGIN;
> > > +	ov8858->exposure = v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops,
> > > +					     V4L2_CID_EXPOSURE,
> > > +					     OV8858_EXPOSURE_MIN,
> > > +					     exposure_max, OV8858_EXPOSURE_STEP,
> > > +					     mode->exp_def);
> > > +
> > > +	v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> > > +			  OV8858_LONG_GAIN_MIN, OV8858_LONG_GAIN_MAX,
> > > +			  OV8858_LONG_GAIN_STEP, OV8858_LONG_GAIN_DEFAULT);
> > > +
> > > +	v4l2_ctrl_new_std(handler, &ov8858_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> > > +			  OV8858_LONG_DIGIGAIN_MIN, OV8858_LONG_DIGIGAIN_MAX,
> > > +			  OV8858_LONG_DIGIGAIN_STEP,
> > > +			  OV8858_LONG_DIGIGAIN_DEFAULT);
> > > +
> > > +	v4l2_ctrl_new_std_menu_items(handler, &ov8858_ctrl_ops,
> > > +				     V4L2_CID_TEST_PATTERN,
> > > +				     ARRAY_SIZE(ov8858_test_pattern_menu) - 1,
> > > +				     0, 0, ov8858_test_pattern_menu);
> > > +
> > > +	if (handler->error) {
> > > +		ret = handler->error;
> > > +		goto err_free_handler;
> > > +	}
> > > +
> > > +	ret = v4l2_fwnode_device_parse(&ov8858->client->dev, &props);
> > > +	if (ret)
> > > +		goto err_free_handler;
> > > +
> > > +	ret = v4l2_ctrl_new_fwnode_properties(handler, &ov8858_ctrl_ops,
> > > +					      &props);
> > > +	if (ret)
> > > +		goto err_free_handler;
> > > +
> > > +	ov8858->subdev.ctrl_handler = handler;
> > > +
> > > +	return 0;
> > > +
> > > +err_free_handler:
> > > +	dev_err(&ov8858->client->dev, "Failed to init controls: %d\n", ret);
> > > +	v4l2_ctrl_handler_free(handler);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int ov8858_check_sensor_id(struct ov8858 *ov8858,
> > > +				  struct i2c_client *client)
> > > +{
> > > +	struct device *dev = &ov8858->client->dev;
> > > +	u32 id = 0;
> > > +	int ret;
> > > +
> > > +	ret = ov8858_read_reg(client, OV8858_REG_CHIP_ID, &id);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (id != OV8858_CHIP_ID) {
> > > +		dev_err(dev, "Unexpected sensor id 0x%x\n", id);
> >
> > I'd use "0x%06x" here (or "#06x"), as I find it more confusing when
> > messages print a different hex value length depending on the value.
> 
> I got all messagges printed correctly (without leading 0s I mean). I
> recall I used to prepend the by variable lenght, but recently I'm not
> doing it anymore as the result doesn't change ?

It then depends on the value. If the device returns 0, this will pring

	Unexpected sensor id 0x0

and if it returns 0xffffff,

	Unexpected sensor id 0xffffff

I find it more readable not to depend on the value when printing numbers
in hexadecimal.

> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	ret = ov8858_read_reg(client, OV8858_REG_SUB_ID, &id);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	dev_info(dev, "Detected OV8858 sensor, revision 0x%x\n", id);
> >
> > Same here, 0x%02x
> >
> > > +
> > > +	if (id == OV8858_R2A) {
> > > +		ov8858->global_regs = ov8858->num_lanes == 4
> > > +				    ? ov8858_global_regs_r2a_4lane
> > > +				    : ov8858_global_regs_r2a_2lane;
> > > +	} else {
> > > +		ov8858->global_regs = ov8858_global_regs_r1a;
> > > +		dev_warn(dev, "R1A may not work well!\n");
> > > +	}
> > > +
> > > +	return 0;
> > > +}

[snip]

> > > +static int ov8858_probe(struct i2c_client *client)
> > > +{
> > > +	struct device *dev = &client->dev;
> > > +	struct v4l2_subdev *sd;
> > > +	struct ov8858 *ov8858;
> > > +	int ret;
> > > +
> > > +	ov8858 = devm_kzalloc(dev, sizeof(*ov8858), GFP_KERNEL);
> > > +	if (!ov8858)
> > > +		return -ENOMEM;
> > > +
> > > +	ov8858->client = client;
> > > +
> > > +	ov8858->xvclk = devm_clk_get(dev, "xvclk");
> > > +	if (IS_ERR(ov8858->xvclk))
> > > +		return dev_err_probe(dev, PTR_ERR(ov8858->xvclk),
> > > +				     "Failed to get xvclk\n");
> > > +
> > > +	ov8858->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> > > +						     GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(ov8858->reset_gpio))
> > > +		return dev_err_probe(dev, PTR_ERR(ov8858->reset_gpio),
> > > +				     "Failed to get reset gpio\n");
> > > +
> > > +	ov8858->pwdn_gpio = devm_gpiod_get_optional(dev, "powerdown",
> > > +						    GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(ov8858->pwdn_gpio))
> > > +		return dev_err_probe(dev, PTR_ERR(ov8858->pwdn_gpio),
> > > +				     "Failed to get powerdown gpio\n");
> > > +
> > > +	ret = ov8858_configure_regulators(ov8858);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> > > +
> > > +	sd = &ov8858->subdev;
> > > +	v4l2_i2c_subdev_init(sd, client, &ov8858_subdev_ops);
> > > +
> > > +	ret = ov8858_parse_of(ov8858);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = ov8858_init_ctrls(ov8858);
> > > +	if (ret)
> > > +		goto err_put_fwnode;
> > > +
> > > +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +	ov8858->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +	ret = media_entity_pads_init(&sd->entity, 1, &ov8858->pad);
> > > +	if (ret < 0)
> > > +		goto err_free_handler;
> > > +
> > > +	sd->state_lock = ov8858->ctrl_handler.lock;
> > > +	ret = v4l2_subdev_init_finalize(sd);
> > > +	if (ret < 0) {
> > > +		dev_err(&client->dev, "Subdev initialization error %d\n", ret);
> > > +		goto err_clean_entity;
> > > +	}
> > > +
> > > +	ret = ov8858_power_on(ov8858);
> > > +	if (ret)
> > > +		goto err_clean_entity;
> > > +
> > > +	pm_runtime_set_active(dev);
> > > +	pm_runtime_get_noresume(dev);
> > > +	pm_runtime_enable(dev);
> > > +
> > > +	ret = ov8858_check_sensor_id(ov8858, client);
> > > +	if (ret)
> > > +		goto err_power_off;
> > > +
> > > +	pm_runtime_set_autosuspend_delay(dev, 1000);
> > > +	pm_runtime_use_autosuspend(dev);
> >
> > I think you need a pm_runtime_mark_last_busy() here.
> 
> mark_last_busy() restarts the counter for autosuspend. Do we really
> need it now ? I would have suspended immediately at the end of probe.

If we use pm_runtime_put_autosuspend() I think we should use
pm_runtime_mark_last_busy() here too. We could use pm_runtime_put() or
pm_runtime_put_sync() instead. I expect the device to be suspended
before the first user appears in any case.

I'm not sure what the pros and cons of delaying suspend would be here.
In some cases I suppose it could delay suspending the parents too, which
may come handy when the next child is probed, but in practice, I don't
know how often that would happen.

> The vastity of the pm_runtime() API is frankly embarassing. I just
> recently learned about mark_last_busy() and it feel rather dumb a
> driver has to mark the 'last time it was busy' by itself before
> calling autosuspend. Ofc I might be missing the larger picture here,
> but it feels the perfect example of an API that each driver will get
> slightly different and wrong in its own way.

It's an awful API, and the fact that it's undocumented doesn't help :-(
It has grown organically, which explains its current state, but it's
well past the point where it requires a major cleanup.

> > > +	pm_runtime_put_autosuspend(dev);
> >
> > And this (and the pm_runtime_mark_last_busy() call) should move to after
> > v4l2_async_register_subdev_sensor(), or the pm_runtime_put_noidle() call
> > in err_power_off in case v4l2_async_register_subdev_sensor() fails will
> > release a reference that you don't own anymore.
> 
> Or should I remove the pm_runtime_put_noidle() call from the error
> path ? Probably is better to just move the autosuspend call after the
> subdev registration.

No, you need it if pm_runtime_get_noresume() has been called, so at
least when v4l2_async_register_subdev_sensor() fails in any case.

> > > +
> > > +	ret = v4l2_async_register_subdev_sensor(sd);
> > > +	if (ret) {
> > > +		dev_err(dev, "v4l2 async register subdev failed\n");
> > > +		goto err_power_off;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +err_power_off:
> > > +	pm_runtime_disable(dev);
> > > +	pm_runtime_put_noidle(dev);
> > > +	ov8858_power_off(ov8858);
> > > +err_clean_entity:
> > > +	media_entity_cleanup(&sd->entity);
> > > +err_free_handler:
> > > +	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
> > > +err_put_fwnode:
> > > +	fwnode_handle_put(ov8858->subdev.fwnode);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void ov8858_remove(struct i2c_client *client)
> > > +{
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct ov8858 *ov8858 = sd_to_ov8858(sd);
> > > +
> > > +	v4l2_async_unregister_subdev(sd);
> > > +	media_entity_cleanup(&sd->entity);
> > > +	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
> > > +	fwnode_handle_put(ov8858->subdev.fwnode);
> > > +
> > > +	pm_runtime_disable(&client->dev);
> > > +	if (!pm_runtime_status_suspended(&client->dev))
> > > +		ov8858_power_off(ov8858);
> > > +	pm_runtime_set_suspended(&client->dev);
> > > +}
> > > +
> > > +static const struct of_device_id ov8858_of_match[] = {
> > > +	{ .compatible = "ovti,ov8858" },
> > > +	{ /* sentinel */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, ov8858_of_match);
> > > +
> > > +static struct i2c_driver ov8858_i2c_driver = {
> > > +	.driver = {
> > > +		.name = "ov8858",
> > > +		.pm = &ov8858_pm_ops,
> > > +		.of_match_table = of_match_ptr(ov8858_of_match),
> >
> > Drop of_match_ptr(), it's not needed as the device_driver structure
> > of_match_table field isn't conditioned by CONFIG_OF anymore.
> >
> > It's all small issues, with these addressed,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks, I'll send a new version soon!
> 
> > > +	},
> > > +	.probe_new	= &ov8858_probe,
> > > +	.remove		= &ov8858_remove,
> > > +};
> > > +
> > > +module_i2c_driver(ov8858_i2c_driver);
> > > +
> > > +MODULE_DESCRIPTION("OmniVision OV8858 sensor driver");
> > > +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart
