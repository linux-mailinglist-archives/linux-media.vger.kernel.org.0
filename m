Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC64C4D3070
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 14:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbiCINtD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 08:49:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiCINtC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 08:49:02 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CF0149B87
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 05:48:02 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 1B60520000E;
        Wed,  9 Mar 2022 13:47:58 +0000 (UTC)
Date:   Wed, 9 Mar 2022 14:47:57 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ov5640: Use runtime PM
Message-ID: <20220309134757.43uoopt5qbgonuup@uno.localdomain>
References: <20220309113232.1182362-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220309113232.1182362-1-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Wed, Mar 09, 2022 at 08:32:32PM +0900, Paul Elder wrote:
> Switch to using runtime PM for power management.

What happens if CONFIG_PM is not selected ? Two of the existing
sensor drivers in mainline depends on PM but not the ov5640, and I'm
not sure we should depend on PM to be able to compile the module.

Also I see very few #ifdef CONFIG_PM in drivers/media/i2c so either
the CONFIG_PM dependency is not an issue or most sensor drivers don't
care.

Also, could you base this patch on sakari's tree master branc which
contains my ov5640 patches that will land in v5.18 to avoid future
rebases ?
https://git.linuxtv.org/sailus/media_tree.git

>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5640.c | 108 ++++++++++++++++++++++---------------
>  1 file changed, 64 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index ddbd71394db3..8e95096ba67b 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -15,6 +15,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> @@ -240,7 +241,7 @@ struct ov5640_dev {
>  	/* lock to protect all members below */
>  	struct mutex lock;
>
> -	int power_count;
> +	bool powered;

'powered' is never reset to false when the chip is powered off.

I would avoid tracking the power state manually but rely instead
on the value returned from pm_runtime_get_if_in_use().

>
>  	struct v4l2_mbus_framefmt fmt;
>  	bool pending_fmt_change;
> @@ -2148,6 +2149,8 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
>  	if (!on)
>  		ov5640_set_power_off(sensor);
>
> +	sensor->powered = on;
> +
>  	return 0;
>
>  power_off:
> @@ -2157,37 +2160,6 @@ static int ov5640_set_power(struct ov5640_dev *sensor, bool on)
>
>  /* --------------- Subdev Operations --------------- */
>
> -static int ov5640_s_power(struct v4l2_subdev *sd, int on)
> -{
> -	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> -	int ret = 0;
> -
> -	mutex_lock(&sensor->lock);
> -
> -	/*
> -	 * If the power count is modified from 0 to != 0 or from != 0 to 0,
> -	 * update the power state.
> -	 */
> -	if (sensor->power_count == !on) {
> -		ret = ov5640_set_power(sensor, !!on);
> -		if (ret)
> -			goto out;
> -	}
> -
> -	/* Update the power count. */
> -	sensor->power_count += on ? 1 : -1;
> -	WARN_ON(sensor->power_count < 0);
> -out:
> -	mutex_unlock(&sensor->lock);
> -
> -	if (on && !ret && sensor->power_count == 1) {
> -		/* restore controls */
> -		ret = v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> -	}
> -
> -	return ret;
> -}
> -
>  static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
>  				     struct v4l2_fract *fi,
>  				     u32 width, u32 height)
> @@ -2663,6 +2635,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>
>  	/* v4l2_ctrl_lock() locks our own mutex */
>
> +	if (!sensor->powered)
> +		return 0;
> +
>  	switch (ctrl->id) {
>  	case V4L2_CID_AUTOGAIN:
>  		val = ov5640_get_gain(sensor);
> @@ -2694,7 +2669,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>  	 * not apply any controls to H/W at this time. Instead
>  	 * the controls will be restored right after power-up.
>  	 */
> -	if (sensor->power_count == 0)
> +	if (!sensor->powered)
>  		return 0;
>
>  	switch (ctrl->id) {
> @@ -2945,6 +2920,12 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
>  	int ret = 0;
>
> +	if (enable) {
> +		ret = pm_runtime_resume_and_get(&sensor->i2c_client->dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	mutex_lock(&sensor->lock);
>
>  	if (sensor->streaming == !enable) {
> @@ -2969,13 +2950,17 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>  		if (!ret)
>  			sensor->streaming = enable;
>  	}
> +
>  out:
>  	mutex_unlock(&sensor->lock);
> +
> +	if (!enable || ret)
> +		pm_runtime_put(&sensor->i2c_client->dev);
> +
>  	return ret;
>  }
>
>  static const struct v4l2_subdev_core_ops ov5640_core_ops = {
> -	.s_power = ov5640_s_power,
>  	.log_status = v4l2_ctrl_subdev_log_status,
>  	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>  	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> @@ -3019,15 +3004,11 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  	int ret = 0;
>  	u16 chip_id;
>
> -	ret = ov5640_set_power_on(sensor);
> -	if (ret)
> -		return ret;
> -
>  	ret = ov5640_read_reg16(sensor, OV5640_REG_CHIP_ID, &chip_id);
>  	if (ret) {
>  		dev_err(&client->dev, "%s: failed to read chip identifier\n",
>  			__func__);
> -		goto power_off;
> +		return ret;
>  	}
>
>  	if (chip_id != 0x5640) {
> @@ -3036,8 +3017,6 @@ static int ov5640_check_chip_id(struct ov5640_dev *sensor)
>  		ret = -ENXIO;
>  	}
>
> -power_off:
> -	ov5640_set_power_off(sensor);
>  	return ret;
>  }
>
> @@ -3158,20 +3137,35 @@ static int ov5640_probe(struct i2c_client *client)
>
>  	mutex_init(&sensor->lock);
>
> -	ret = ov5640_check_chip_id(sensor);
> +	ret = ov5640_init_controls(sensor);
>  	if (ret)
>  		goto entity_cleanup;
>
> -	ret = ov5640_init_controls(sensor);
> +	ret = ov5640_set_power(sensor, true);
> +	if (ret)
> +		goto free_ctrls;
> +
> +	ret = ov5640_check_chip_id(sensor);
>  	if (ret)
>  		goto entity_cleanup;

Should you power_off if identifying the chip fails ?

On the other hand, enabling runtime_pm before identifying the chip
might help having a simpler error handling path ?

Something like:

...
	pm_runtime_set_active(dev);
	pm_runtime_enable(dev);
	pm_runtime_get(dev);

	ret = ov5640_check_chip_id(sensor);
	if (ret)
		goto err_pm_runtime;

	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
	if (ret)
		goto err_pm_runtime;

	pm_runtime_set_autosuspend_delay(dev, 1000);
	pm_runtime_use_autosuspend(dev);
	pm_runtime_put_autosuspend(dev);

	return 0;

err_pm_runtime:
	pm_runtime_put(dev);
	pm_runtime_disable(dev);
	pm_runtime_put_noidle(dev);
...

Tested by forcing an early return from ov5640_check_chip_id() and I
get no warnings about unbalanced runtime_pm counters.

>
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +
>  	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
>  	if (ret)
> -		goto free_ctrls;
> +		goto err_pm_runtime;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);

Is this dealy required, where does it come from ?

Thanks
  j


> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_put_autosuspend(dev);
>
>  	return 0;
>
> +err_pm_runtime:
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>  free_ctrls:
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  entity_cleanup:
> @@ -3193,6 +3187,31 @@ static int ov5640_remove(struct i2c_client *client)
>  	return 0;
>  }
>
> +static int __maybe_unused ov5640_sensor_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
> +
> +	return ov5640_set_power(ov5640, false);
> +}
> +
> +static int __maybe_unused ov5640_sensor_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov5640_dev *ov5640 = to_ov5640_dev(sd);
> +	int ret;
> +
> +	ret = ov5640_set_power(ov5640, true);
> +	if (ret)
> +		return ret;
> +
> +	return v4l2_ctrl_handler_setup(&ov5640->ctrls.handler);
> +}
> +
> +static const struct dev_pm_ops ov5640_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
> +};
> +
>  static const struct i2c_device_id ov5640_id[] = {
>  	{"ov5640", 0},
>  	{},
> @@ -3209,6 +3228,7 @@ static struct i2c_driver ov5640_i2c_driver = {
>  	.driver = {
>  		.name  = "ov5640",
>  		.of_match_table	= ov5640_dt_ids,
> +		.pm = &ov5640_pm_ops,
>  	},
>  	.id_table = ov5640_id,
>  	.probe_new = ov5640_probe,
> --
> 2.30.2
>
