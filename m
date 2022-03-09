Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4950F4D366A
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiCIRXi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 12:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236892AbiCIRXg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 12:23:36 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364737F6E0
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 09:22:36 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 2E55C1BF203;
        Wed,  9 Mar 2022 17:22:32 +0000 (UTC)
Date:   Wed, 9 Mar 2022 18:22:31 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ov5640: Use runtime PM
Message-ID: <20220309172231.gvtbre7l4u4wfbyb@uno.localdomain>
References: <20220309113232.1182362-1-paul.elder@ideasonboard.com>
 <20220309134757.43uoopt5qbgonuup@uno.localdomain>
 <Yii4jxm8MLxlC0Lb@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y33f4pnygl6fvv4w"
Content-Disposition: inline
In-Reply-To: <Yii4jxm8MLxlC0Lb@aptenodytes>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--y33f4pnygl6fvv4w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Paul, Sakari

On Wed, Mar 09, 2022 at 03:24:15PM +0100, Paul Kocialkowski wrote:
> Hi Jacopo,
>
> On Wed 09 Mar 22, 14:47, Jacopo Mondi wrote:
> > Hi Paul,
> >
> > On Wed, Mar 09, 2022 at 08:32:32PM +0900, Paul Elder wrote:
> > > Switch to using runtime PM for power management.
> >
> > What happens if CONFIG_PM is not selected ? Two of the existing
> > sensor drivers in mainline depends on PM but not the ov5640, and I'm
> > not sure we should depend on PM to be able to compile the module.
>
> I think the direction for the media subsystem is to use runtime pm
> everywhere possible, which is not opional (like traditional PM) so
> I really thinks it makes sense to have the sensor driver depend on it.
>
> The alternative would probably be to keep the s_power implementation
> when !CONFIG_PM which is certinaly not something we want.
>
> > Also I see very few #ifdef CONFIG_PM in drivers/media/i2c so either
> > the CONFIG_PM dependency is not an issue or most sensor drivers don't
> > care.
>
> This seems like an overlook, I think drivers that rely on runtime pm
> do need to depend on PM in Kconfig.
>

Since we're discusing runtime_pm and sensor drivers:

I see the repeated pattern of initializing runtime pm in the end of
the probe routine as:

        pm_runtime_set_active(&client->dev);
	pm_runtime_enable(&client->dev);
	pm_runtime_idle(&client->dev);

But most drivers do not define and idle callback

$ git grep SET_RUNTIME_PM drivers/media/i2c/
drivers/media/i2c/ak7375.c:     SET_RUNTIME_PM_OPS(ak7375_vcm_suspend, ak7375_vcm_resume, NULL)
drivers/media/i2c/ccs/ccs-core.c:       SET_RUNTIME_PM_OPS(ccs_power_off, ccs_power_on, NULL)
drivers/media/i2c/dw9714.c:     SET_RUNTIME_PM_OPS(dw9714_vcm_suspend, dw9714_vcm_resume, NULL)
drivers/media/i2c/dw9768.c:     SET_RUNTIME_PM_OPS(dw9768_runtime_suspend, dw9768_runtime_resume, NULL)
drivers/media/i2c/dw9807-vcm.c: SET_RUNTIME_PM_OPS(dw9807_vcm_suspend, dw9807_vcm_resume, NULL)
drivers/media/i2c/hi846.c:      SET_RUNTIME_PM_OPS(hi846_suspend, hi846_resume, NULL)
drivers/media/i2c/imx214.c:     SET_RUNTIME_PM_OPS(imx214_power_off, imx214_power_on, NULL)
drivers/media/i2c/imx219.c:     SET_RUNTIME_PM_OPS(imx219_power_off, imx219_power_on, NULL)
drivers/media/i2c/imx258.c:     SET_RUNTIME_PM_OPS(imx258_power_off, imx258_power_on, NULL)
drivers/media/i2c/imx274.c:     SET_RUNTIME_PM_OPS(imx274_power_off, imx274_power_on, NULL)
drivers/media/i2c/imx290.c:     SET_RUNTIME_PM_OPS(imx290_power_off, imx290_power_on, NULL)
drivers/media/i2c/imx334.c:     SET_RUNTIME_PM_OPS(imx334_power_off, imx334_power_on, NULL)
drivers/media/i2c/imx335.c:     SET_RUNTIME_PM_OPS(imx335_power_off, imx335_power_on, NULL)
drivers/media/i2c/imx412.c:     SET_RUNTIME_PM_OPS(imx412_power_off, imx412_power_on, NULL)
drivers/media/i2c/mt9m001.c:    SET_RUNTIME_PM_OPS(mt9m001_power_off, mt9m001_power_on, NULL)
drivers/media/i2c/ov02a10.c:    SET_RUNTIME_PM_OPS(ov02a10_power_off, ov02a10_power_on, NULL)
drivers/media/i2c/ov2659.c:     SET_RUNTIME_PM_OPS(ov2659_power_off, ov2659_power_on, NULL)
drivers/media/i2c/ov2685.c:     SET_RUNTIME_PM_OPS(ov2685_runtime_suspend,
drivers/media/i2c/ov5640.c:     SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
drivers/media/i2c/ov5647.c:     SET_RUNTIME_PM_OPS(ov5647_power_off, ov5647_power_on, NULL)
drivers/media/i2c/ov5648.c:     SET_RUNTIME_PM_OPS(ov5648_suspend, ov5648_resume, NULL)
drivers/media/i2c/ov5693.c:     SET_RUNTIME_PM_OPS(ov5693_sensor_suspend, ov5693_sensor_resume, NULL)
drivers/media/i2c/ov5695.c:     SET_RUNTIME_PM_OPS(ov5695_runtime_suspend,
drivers/media/i2c/ov7740.c:     SET_RUNTIME_PM_OPS(ov7740_runtime_suspend, ov7740_runtime_resume, NULL)
drivers/media/i2c/ov8865.c:     SET_RUNTIME_PM_OPS(ov8865_suspend, ov8865_resume, NULL)
drivers/media/i2c/ov9282.c:     SET_RUNTIME_PM_OPS(ov9282_power_off, ov9282_power_on, NULL)
drivers/media/i2c/tvp5150.c:    SET_RUNTIME_PM_OPS(tvp5150_runtime_suspend,
drivers/media/i2c/video-i2c.c:  SET_RUNTIME_PM_OPS(video_i2c_pm_runtime_suspend,

Does this mean the call to pm_runtime_idle() is a nop and all drivers
calling it should be converted to use:

 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_put_autosuspend(dev);

instead to avoid more cargo cult issues ?

(just tested and actually calling pm_runtime_idle() when no idle func
is defined seems to be a nop)

Thanks
   j

> Cheers,
>
> Paul
>
>
> > Also, could you base this patch on sakari's tree master branc which
> > contains my ov5640 patches that will land in v5.18 to avoid future
> > rebases ?
> > https://git.linuxtv.org/sailus/media_tree.git
> >
> > >
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 108 ++++++++++++++++++++++---------------
> > >  1 file changed, 64 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index ddbd71394db3..8e95096ba67b 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/init.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of_device.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/regulator/consumer.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/types.h>
> > > @@ -240,7 +241,7 @@ struct ov5640_dev {
> > >  	/* lock to protect all members below */
> > >  	struct mutex lock;
> > >
> > > -	int power_count;
> > > +	bool powered;
> >
> > 'powered' is never reset to false when the chip is powered off.
> >
> > I would avoid tracking the power state manually but rely instead
> > on the value returned from pm_runtime_get_if_in_use().
> >
> > >
> > >  	struct v4l2_mbus_framefmt fmt;
> > >  	bool pending_fmt_change;
> > > @@ -2148,6 +2149,8 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> > >  	if (!on)
> > >  		ov5640_set_power_off(sensor);
> > >
> > > +	sensor->powered = on;
> > > +
> > >  	return 0;
> > >
> > >  power_off:
> > > @@ -2157,37 +2160,6 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
> > >
> > >  /* --------------- Subdev Operations --------------- */
> > >
> > > -static int ov5640_s_power(struct v4l2_subdev *sd, int on)
> > > -{
> > > -	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > > -	int ret = 0;
> > > -
> > > -	mutex_lock(&sensor->lock);
> > > -
> > > -	/*
> > > -	 * If the power count is modified from 0 to != 0 or from != 0 to 0,
> > > -	 * update the power state.
> > > -	 */
> > > -	if (sensor->power_count == !on) {
> > > -		ret = ov5640_set_power(sensor, !!on);
> > > -		if (ret)
> > > -			goto out;
> > > -	}
> > > -
> > > -	/* Update the power count. */
> > > -	sensor->power_count += on ? 1 : -1;
> > > -	WARN_ON(sensor->power_count < 0);
> > > -out:
> > > -	mutex_unlock(&sensor->lock);
> > > -
> > > -	if (on && !ret && sensor->power_count == 1) {
> > > -		/* restore controls */
> > > -		ret = v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> > > -	}
> > > -
> > > -	return ret;
> > > -}
> > > -
> > >  static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
> > >  				     struct v4l2_fract *fi,
> > >  				     u32 width, u32 height)
> > > @@ -2663,6 +2635,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
> > >
> > >  	/* v4l2_ctrl_lock() locks our own mutex */
> > >
> > > +	if (!sensor->powered)
> > > +		return 0;
> > > +
> > >  	switch (ctrl->id) {
> > >  	case V4L2_CID_AUTOGAIN:
> > >  		val = ov5640_get_gain(sensor);
> > > @@ -2694,7 +2669,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> > >  	 * not apply any controls to H/W at this time. Instead
> > >  	 * the controls will be restored right after power-up.
> > >  	 */
> > > -	if (sensor->power_count == 0)
> > > +	if (!sensor->powered)
> > >  		return 0;
> > >
> > >  	switch (ctrl->id) {
> > > @@ -2945,6 +2920,12 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
> > >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > >  	int ret = 0;
> > >
> > > +	if (enable) {
> > > +		ret = pm_runtime_resume_and_get(&sensor->i2c_client->dev);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	}
> > > +
> > >  	mutex_lock(&sensor->lock);
> > >
> > >  	if (sensor->streaming == !enable) {
> > > @@ -2969,13 +2950,17 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
> > >  		if (!ret)
> > >  			sensor->streaming = enable;
> > >  	}
> > > +
> > >  out:
> > >  	mutex_unlock(&sensor->lock);
> > > +
> > > +	if (!enable || ret)
> > > +		pm_runtime_put(&sensor->i2c_client->dev);
> > > +
> > >  	return ret;
> > >  }
> > >
> > >  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
> > > -	.s_power = ov5640_s_power,
> > >  	.log_status = v4l2_ctrl_subdev_log_status,
> > >  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > >  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> > > @@ -3019,15 +3004,11 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
> > >  	int ret = 0;
> > >  	u16 chip_id;
> > >
> > > -	ret = ov5640_set_power_on(sensor);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > >  	ret = ov5640_read_reg16(sensor, OV5640_REG_CHIP_ID, &chip_id);
> > >  	if (ret) {
> > >  		dev_err(&client->dev, "%s: failed to read chip identifier\n",
> > >  			__func__);
> > > -		goto power_off;
> > > +		return ret;
> > >  	}
> > >
> > >  	if (chip_id != 0x5640) {
> > > @@ -3036,8 +3017,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
> > >  		ret = -ENXIO;
> > >  	}
> > >
> > > -power_off:
> > > -	ov5640_set_power_off(sensor);
> > >  	return ret;
> > >  }
> > >
> > > @@ -3158,20 +3137,35 @@ static int ov5640_probe(struct i2c_client *client)
> > >
> > >  	mutex_init(&sensor->lock);
> > >
> > > -	ret = ov5640_check_chip_id(sensor);
> > > +	ret = ov5640_init_controls(sensor);
> > >  	if (ret)
> > >  		goto entity_cleanup;
> > >
> > > -	ret = ov5640_init_controls(sensor);
> > > +	ret = ov5640_set_power(sensor, true);
> > > +	if (ret)
> > > +		goto free_ctrls;
> > > +
> > > +	ret = ov5640_check_chip_id(sensor);
> > >  	if (ret)
> > >  		goto entity_cleanup;
> >
> > Should you power_off if identifying the chip fails ?
> >
> > On the other hand, enabling runtime_pm before identifying the chip
> > might help having a simpler error handling path ?
> >
> > Something like:
> >
> > ...
> > 	pm_runtime_set_active(dev);
> > 	pm_runtime_enable(dev);
> > 	pm_runtime_get(dev);
> >
> > 	ret = ov5640_check_chip_id(sensor);
> > 	if (ret)
> > 		goto err_pm_runtime;
> >
> > 	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> > 	if (ret)
> > 		goto err_pm_runtime;
> >
> > 	pm_runtime_set_autosuspend_delay(dev, 1000);
> > 	pm_runtime_use_autosuspend(dev);
> > 	pm_runtime_put_autosuspend(dev);
> >
> > 	return 0;
> >
> > err_pm_runtime:
> > 	pm_runtime_put(dev);
> > 	pm_runtime_disable(dev);
> > 	pm_runtime_put_noidle(dev);
> > ...
> >
> > Tested by forcing an early return from ov5640_check_chip_id() and I
> > get no warnings about unbalanced runtime_pm counters.
> >
> > >
> > > +	pm_runtime_set_active(dev);
> > > +	pm_runtime_get_noresume(dev);
> > > +	pm_runtime_enable(dev);
> > > +
> > >  	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
> > >  	if (ret)
> > > -		goto free_ctrls;
> > > +		goto err_pm_runtime;
> > > +
> > > +	pm_runtime_set_autosuspend_delay(dev, 1000);
> >
> > Is this dealy required, where does it come from ?
> >
> > Thanks
> >   j
> >
> >
> > > +	pm_runtime_use_autosuspend(dev);
> > > +	pm_runtime_put_autosuspend(dev);
> > >
> > >  	return 0;
> > >
> > > +err_pm_runtime:
> > > +	pm_runtime_disable(dev);
> > > +	pm_runtime_put_noidle(dev);
> > >  free_ctrls:
> > >  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> > >  entity_cleanup:
> > > @@ -3193,6 +3187,31 @@ static int ov5640_remove(struct i2c_client *client)
> > >  	return 0;
> > >  }
> > >
> > > +static int __maybe_unused ov5640_sensor_suspend(struct device *dev)
> > > +{
> > > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
> > > +
> > > +	return ov5640_set_power(ov5640, false);
> > > +}
> > > +
> > > +static int __maybe_unused ov5640_sensor_resume(struct device *dev)
> > > +{
> > > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
> > > +	int ret;
> > > +
> > > +	ret = ov5640_set_power(ov5640, true);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return v4l2_ctrl_handler_setup(&ov5640->ctrls.handler);
> > > +}
> > > +
> > > +static const struct dev_pm_ops ov5640_pm_ops = {
> > > +	SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
> > > +};
> > > +
> > >  static const struct i2c_device_id ov5640_id[] = {
> > >  	{"ov5640", 0},
> > >  	{},
> > > @@ -3209,6 +3228,7 @@ static struct i2c_driver ov5640_i2c_driver = {
> > >  	.driver = {
> > >  		.name  = "ov5640",
> > >  		.of_match_table	= ov5640_dt_ids,
> > > +		.pm = &ov5640_pm_ops,
> > >  	},
> > >  	.id_table = ov5640_id,
> > >  	.probe_new = ov5640_probe,
> > > --
> > > 2.30.2
> > >
>
> --
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com



--y33f4pnygl6fvv4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmIo4lcACgkQcjQGjxah
VjzcHhAAvfNdThUUGZRagy/aWTmr8ItZGDeXDZjXZpNSFAyMwWVpKHObaX2d00D0
ZrvVsN/DfHhACelLBizAheBqg1URtH+EPd1VGh6Nn38m72DgLCBhVUqmNgOyC/iu
ZLZ1vzrtMBqoCIN6XfShX5nrcl9l1AcGp3oy57NJX30BFLf1fzJfsMVtGfw9Iyx2
eTMqJldaRI4bZEhXJa0T6u6Lya+ZXOtsr2myMsmpA2ItLJKnd8AiKot5c/w0Yo7d
rcHein9tL1kY7vfRlhzFXlgnfmtaFzW18Pa59rvN4bKbhnUCWfFsmjb/HvjwhPKH
vW/qK09EUeD6k/x5/L4qyalDZtr388qxagJ3pnNOLNxKCZRAC0TYsczl8TSyojhl
qKo5+LsA5IvfkPMFewaPBSXLBLObdCwwCNrZwBzvVNk/KZ/MA0P7mo99JACsrzvY
bEBE/P9O4w3CozH+8k74vGlfV3HB5XJ7OPvTx7+ws1gHlNbWJdlOP88pgvG220n7
FCnWcU7niutfdPkkYIdJXNQ64uL61iENpF0fkfrKARNWlXKxlqbNfRdf3CoG27Ld
jPrRK+SWDTBkVS2gfAddi/OFKxCSw1/KzILy+p/WH9/i+TbObYgXQqSJbbIIa3MQ
BPZoW0BsbxvT39bOTd8h9kI9+9IDhkmzWiSIC/qDq1X0lI4602Q=
=qbnk
-----END PGP SIGNATURE-----

--y33f4pnygl6fvv4w--
