Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF131AA140
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 14:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369825AbgDOMfy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 08:35:54 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42363 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369820AbgDOMfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 08:35:50 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7A8631C0011;
        Wed, 15 Apr 2020 12:35:37 +0000 (UTC)
Date:   Wed, 15 Apr 2020 14:38:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <lolivei@synopsys.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [PATCH 2/4] media: ov5647: Add support for PWDN GPIO.
Message-ID: <20200415123842.wiu5vs5lilxvqg7x@uno.localdomain>
References: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
 <f88b99899eb5e680607349b37eb3679dbd12433e.1586759968.git.roman.kovalivskyi@globallogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f88b99899eb5e680607349b37eb3679dbd12433e.1586759968.git.roman.kovalivskyi@globallogic.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Roman,
   this patch requires the device bindings document to be updated
to report an optional 'powerdown-gpios' property is available and that
it's active HIGH.

On Mon, Apr 13, 2020 at 12:17:45PM +0300, Roman Kovalivskyi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
>
> Add support for an optional GPIO connected to PWDN on the sensor. This
> allows the use of hardware standby mode where internal device clock
> and circuit activities are halted.
>
> Please nothe that power is off when PWDN is high.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
> ---
>  drivers/media/i2c/ov5647.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 3e587eb0a30e..c39e3d20e3ef 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -21,6 +21,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -35,6 +36,13 @@
>
>  #define SENSOR_NAME "ov5647"
>
> +/*
> + * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
> + * high if reset is inserted after PWDN goes high, host can access sensor's
> + * SCCB to initialize sensor."
> + */
> +#define PWDN_ACTIVE_DELAY_MS	20
> +
>  #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
>  #define MIPI_CTRL00_BUS_IDLE			BIT(2)
>  #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
> @@ -86,6 +94,7 @@ struct ov5647 {
>  	unsigned int			height;
>  	int				power_count;
>  	struct clk			*xclk;
> +	struct gpio_desc		*pwdn;
>  };
>
>  static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
> @@ -355,6 +364,11 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
>  	if (on && !ov5647->power_count)	{
>  		dev_dbg(&client->dev, "OV5647 power on\n");
>
> +		if (ov5647->pwdn) {
> +			gpiod_set_value(ov5647->pwdn, 0);
> +			msleep(PWDN_ACTIVE_DELAY_MS);

please use usleep_range() according to Documentation/timers/timers-howto.rst

Thanks
   j
> +		}
> +
>  		ret = clk_prepare_enable(ov5647->xclk);
>  		if (ret < 0) {
>  			dev_err(&client->dev, "clk prepare enable failed\n");
> @@ -392,6 +406,8 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
>  			dev_dbg(&client->dev, "soft stby failed\n");
>
>  		clk_disable_unprepare(ov5647->xclk);
> +
> +		gpiod_set_value(ov5647->pwdn, 1);
>  	}
>
>  	/* Update the power count. */
> @@ -603,6 +619,10 @@ static int ov5647_probe(struct i2c_client *client)
>  		return -EINVAL;
>  	}
>
> +	/* Request the power down GPIO asserted */
> +	sensor->pwdn = devm_gpiod_get_optional(&client->dev, "pwdn",
> +					       GPIOD_OUT_HIGH);
> +
>  	mutex_init(&sensor->lock);
>
>  	sd = &sensor->sd;
> @@ -616,7 +636,15 @@ static int ov5647_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto mutex_remove;
>
> +	if (sensor->pwdn) {
> +		gpiod_set_value(sensor->pwdn, 0);
> +		msleep(PWDN_ACTIVE_DELAY_MS);
> +	}
> +
>  	ret = ov5647_detect(sd);
> +
> +	gpiod_set_value(sensor->pwdn, 1);
> +
>  	if (ret < 0)
>  		goto error;
>
> --
> 2.17.1
>
