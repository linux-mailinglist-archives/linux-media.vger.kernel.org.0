Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29488B8E5F
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 12:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405909AbfITKRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 06:17:12 -0400
Received: from mga04.intel.com ([192.55.52.120]:59277 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405887AbfITKRM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 06:17:12 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Sep 2019 03:17:11 -0700
X-IronPort-AV: E=Sophos;i="5.64,528,1559545200"; 
   d="scan'208";a="181766573"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Sep 2019 03:17:08 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4EC3320C9F; Fri, 20 Sep 2019 13:17:06 +0300 (EEST)
Date:   Fri, 20 Sep 2019 13:17:06 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v2 5/7] media: i2c: ov2659: Add powerdown/reset gpio
 handling
Message-ID: <20190920101706.GX5781@paasikivi.fi.intel.com>
References: <20190919203955.15125-1-bparrot@ti.com>
 <20190919203955.15125-6-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919203955.15125-6-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

Thanks for the update.

On Thu, Sep 19, 2019 at 03:39:53PM -0500, Benoit Parrot wrote:
> On some board it is possible that the sensor 'powerdown' and or 'reset'
> pin might be controlled by gpio instead of being tied.
> 
> To implement we add pm_runtime support which will handle the power
> up/down sequence.
> 
> Now originally the driver assumed tat the sensor would always stay
> powered and there keep its register setting. We cannot assume that this
> anymore, so every time we "power up" we need to re-program the initial
> registers configuration first. This was previously done only at probe
> time.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/Kconfig  |  2 +-
>  drivers/media/i2c/ov2659.c | 88 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 88 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 7eee1812bba3..315c1d8bdb7b 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -634,7 +634,7 @@ config VIDEO_OV2640
>  config VIDEO_OV2659
>  	tristate "OmniVision OV2659 sensor support"
>  	depends on VIDEO_V4L2 && I2C
> -	depends on MEDIA_CAMERA_SUPPORT
> +	depends on MEDIA_CAMERA_SUPPORT && GPIOLIB
>  	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index f77320e8a60d..170f80a1a51f 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -22,9 +22,11 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <media/i2c/ov2659.h>
>  #include <media/v4l2-ctrls.h>
> @@ -218,6 +220,11 @@ struct ov2659 {
>  	struct sensor_register *format_ctrl_regs;
>  	struct ov2659_pll_ctrl pll;
>  	int streaming;
> +	/* used to control the sensor PWDN pin */
> +	struct gpio_desc *pwdn_gpio;
> +	/* used to control the sensor RESETB pin */
> +	struct gpio_desc *resetb_gpio;
> +	int on;
>  };
>  
>  static const struct sensor_register ov2659_init_regs[] = {
> @@ -1184,9 +1191,17 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
>  		/* Stop Streaming Sequence */
>  		ov2659_set_streaming(ov2659, 0);
>  		ov2659->streaming = on;
> +		pm_runtime_put(&client->dev);
>  		goto unlock;
>  	}
>  
> +	ret = pm_runtime_get_sync(&client->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(&client->dev);
> +		goto unlock;
> +	}
> +
> +	ov2659_init(sd, 0);
>  	ov2659_set_pixel_clock(ov2659);
>  	ov2659_set_frame_size(ov2659);
>  	ov2659_set_format(ov2659);
> @@ -1243,6 +1258,32 @@ static const char * const ov2659_test_pattern_menu[] = {
>  	"Vertical Color Bars",
>  };
>  
> +static int ov2659_set_power(struct ov2659 *ov2659, int on)
> +{
> +	struct i2c_client *client = ov2659->client;
> +
> +	dev_dbg(&client->dev, "%s: on: %d\n", __func__, on);
> +
> +	if (on) {
> +		if (ov2659->pwdn_gpio)
> +			gpiod_direction_output(ov2659->pwdn_gpio, 0);
> +
> +		if (ov2659->resetb_gpio) {
> +			gpiod_set_value(ov2659->resetb_gpio, 1);
> +			usleep_range(500, 1000);
> +			gpiod_set_value(ov2659->resetb_gpio, 0);
> +			usleep_range(3000, 5000);
> +		}

Please move the code to the runtime PM callbacks.

> +	} else {
> +		if (ov2659->pwdn_gpio)
> +			gpiod_direction_output(ov2659->pwdn_gpio, 1);

Gpiod API works with NULL GPIOs, too, so no need to check here.

Isn't the direction supposed to be already output, so set_value would be
more appropriate here, and above.

> +	}
> +
> +	ov2659->on = on;
> +
> +	return 0;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * V4L2 subdev internal operations
>   */
> @@ -1323,7 +1364,6 @@ static int ov2659_detect(struct v4l2_subdev *sd)
>  			ret = -ENODEV;
>  		} else {
>  			dev_info(&client->dev, "Found OV%04X sensor\n", id);
> -			ret = ov2659_init(sd, 0);
>  		}
>  	}
>  
> @@ -1400,6 +1440,18 @@ static int ov2659_probe(struct i2c_client *client)
>  	    ov2659->xvclk_frequency > 27000000)
>  		return -EINVAL;
>  
> +	/* Optional gpio don't fail if not present */
> +	ov2659->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "powerdown",
> +						    GPIOD_OUT_LOW);
> +	if (IS_ERR(ov2659->pwdn_gpio))
> +		return PTR_ERR(ov2659->pwdn_gpio);
> +
> +	/* Optional gpio don't fail if not present */
> +	ov2659->resetb_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						      GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov2659->resetb_gpio))
> +		return PTR_ERR(ov2659->resetb_gpio);
> +
>  	v4l2_ctrl_handler_init(&ov2659->ctrls, 2);
>  	ov2659->link_frequency =
>  			v4l2_ctrl_new_std(&ov2659->ctrls, &ov2659_ctrl_ops,
> @@ -1445,6 +1497,9 @@ static int ov2659_probe(struct i2c_client *client)
>  	ov2659->frame_size = &ov2659_framesizes[2];
>  	ov2659->format_ctrl_regs = ov2659_formats[0].format_ctrl_regs;
>  
> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_get_sync(&client->dev);

This makes the driver depend on runtime PM.

See e.g. the smiapp driver for an example how to make it work without. It
wasn't trivial. :I You won't need autosuspend.

> +
>  	ret = ov2659_detect(sd);
>  	if (ret < 0)
>  		goto error;
> @@ -1458,10 +1513,14 @@ static int ov2659_probe(struct i2c_client *client)
>  
>  	dev_info(&client->dev, "%s sensor driver registered !!\n", sd->name);
>  
> +	pm_runtime_put(&client->dev);
> +
>  	return 0;
>  
>  error:
>  	v4l2_ctrl_handler_free(&ov2659->ctrls);
> +	pm_runtime_put(&client->dev);
> +	pm_runtime_disable(&client->dev);
>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&ov2659->lock);
>  	return ret;
> @@ -1477,9 +1536,35 @@ static int ov2659_remove(struct i2c_client *client)
>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&ov2659->lock);
>  
> +	pm_runtime_disable(&client->dev);
> +
>  	return 0;
>  }
>  
> +static int ov2659_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov2659 *ov2659 = to_ov2659(sd);
> +
> +	ov2659_set_power(ov2659, 0);
> +
> +	return 0;
> +}
> +
> +static int ov2659_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov2659 *ov2659 = to_ov2659(sd);
> +
> +	return ov2659_set_power(ov2659, 1);
> +}
> +
> +static const struct dev_pm_ops ov2659_pm_ops = {
> +	SET_RUNTIME_PM_OPS(ov2659_runtime_suspend, ov2659_runtime_resume, NULL)
> +};
> +
>  static const struct i2c_device_id ov2659_id[] = {
>  	{ "ov2659", 0 },
>  	{ /* sentinel */ },
> @@ -1497,6 +1582,7 @@ MODULE_DEVICE_TABLE(of, ov2659_of_match);
>  static struct i2c_driver ov2659_i2c_driver = {
>  	.driver = {
>  		.name	= DRIVER_NAME,
> +		.pm	= &ov2659_pm_ops,
>  		.of_match_table = of_match_ptr(ov2659_of_match),
>  	},
>  	.probe_new	= ov2659_probe,

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
