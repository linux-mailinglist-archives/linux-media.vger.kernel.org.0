Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C650721A88C
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2020 22:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgGIUET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jul 2020 16:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgGIUES (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jul 2020 16:04:18 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3B91C08C5CE
        for <linux-media@vger.kernel.org>; Thu,  9 Jul 2020 13:04:18 -0700 (PDT)
Received: from [IPv6:2003:cb:8737:cf00:f5ff:2fff:89f:f3f4] (p200300cb8737cf00f5ff2fff089ff3f4.dip0.t-ipconnect.de [IPv6:2003:cb:8737:cf00:f5ff:2fff:89f:f3f4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 03A072A663A;
        Thu,  9 Jul 2020 21:04:16 +0100 (BST)
Subject: Re: [libcamera-devel] [PATCH 03/25] media: ov5647: Add support for
 PWDN GPIO.
To:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     mrodin@de.adit-jv.com, hugues.fruchet@st.com, mripard@kernel.org,
        aford173@gmail.com, sudipi@jp.adit-jv.com,
        andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623100815.10674-4-jacopo@jmondi.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <5dbb468e-db42-6ac2-db40-196dc0f8a09f@collabora.com>
Date:   Thu, 9 Jul 2020 22:04:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200623100815.10674-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 23.06.20 12:07, Jacopo Mondi wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.org>
> 
> Add support for an optional GPIO connected to PWDN on the sensor. This
> allows the use of hardware standby mode where internal device clock
> and circuit activities are halted.
> 
> Please note that power is off when PWDN is high.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
> Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>   drivers/media/i2c/ov5647.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index e7d2e5b4ad4b9..105ff7f899b34 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -21,6 +21,7 @@
>   
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/init.h>
>   #include <linux/io.h>
> @@ -35,6 +36,13 @@
>   
>   #define SENSOR_NAME "ov5647"
>   
> +/*
> + * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
> + * high if reset is inserted after PWDN goes high, host can access sensor's
> + * SCCB to initialize sensor."
> + */
> +#define PWDN_ACTIVE_DELAY_MS	20
> +
>   #define MIPI_CTRL00_CLOCK_LANE_GATE		BIT(5)
>   #define MIPI_CTRL00_BUS_IDLE			BIT(2)
>   #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
> @@ -86,6 +94,7 @@ struct ov5647 {
>   	unsigned int			height;
>   	int				power_count;
>   	struct clk			*xclk;
> +	struct gpio_desc		*pwdn;
>   };
>   
>   static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
> @@ -355,6 +364,11 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
>   	if (on && !ov5647->power_count)	{
>   		dev_dbg(&client->dev, "OV5647 power on\n");
>   
> +		if (ov5647->pwdn) {
> +			gpiod_set_value_cansleep(ov5647->pwdn, 0);
> +			msleep(PWDN_ACTIVE_DELAY_MS);
> +		}
> +
>   		ret = clk_prepare_enable(ov5647->xclk);
>   		if (ret < 0) {
>   			dev_err(&client->dev, "clk prepare enable failed\n");
> @@ -392,6 +406,8 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
>   			dev_dbg(&client->dev, "soft stby failed\n");
>   
>   		clk_disable_unprepare(ov5647->xclk);
> +
> +		gpiod_set_value_cansleep(ov5647->pwdn, 1);
>   	}
>   
>   	/* Update the power count. */
> @@ -581,6 +597,10 @@ static int ov5647_probe(struct i2c_client *client)
>   		return -EINVAL;
>   	}
>   
> +	/* Request the power down GPIO asserted */
> +	sensor->pwdn = devm_gpiod_get_optional(&client->dev, "pwdn",
> +					       GPIOD_OUT_HIGH);

Hi,
I see that other drivers check for error from 'devm_gpiod_get_optional'
using 'IS_ERR'

Thanks,
Dafna

> +
>   	mutex_init(&sensor->lock);
>   
>   	sd = &sensor->sd;
> @@ -594,7 +614,15 @@ static int ov5647_probe(struct i2c_client *client)
>   	if (ret < 0)
>   		goto mutex_remove;
>   
> +	if (sensor->pwdn) {
> +		gpiod_set_value_cansleep(sensor->pwdn, 0);
> +		msleep(PWDN_ACTIVE_DELAY_MS);
> +	}
> +
>   	ret = ov5647_detect(sd);
> +
> +	gpiod_set_value_cansleep(sensor->pwdn, 1);
> +
>   	if (ret < 0)
>   		goto error;
>   
> 
