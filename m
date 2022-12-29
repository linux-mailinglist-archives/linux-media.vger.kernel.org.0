Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8400D659020
	for <lists+linux-media@lfdr.de>; Thu, 29 Dec 2022 19:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiL2SH6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Dec 2022 13:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiL2SH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Dec 2022 13:07:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0EC12A90
        for <linux-media@vger.kernel.org>; Thu, 29 Dec 2022 10:07:54 -0800 (PST)
Received: from ideasonboard.com (host-79-41-191-169.retail.telecomitalia.it [79.41.191.169])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36946283;
        Thu, 29 Dec 2022 19:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672337272;
        bh=wHfxQxDwrf5edyeOio4lcRZhPHMIQWjYBCrH239aVrk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=diipa2tGwY5/GL9LhTeGDgTL8sz/TtQnLpU8HW5d/7EA6eKhjPLaCutY3n6cYHv6z
         YkbV+fZIQLk1PdHgAgyTNzQuAA/U9Bbq0wX5wr9kehikv036xfbWs5u4asUiJC6xjt
         CqnoYt0FS3Rlh1yHPstOGIaxLYWkS9Z1WWpvO0dY=
Date:   Thu, 29 Dec 2022 19:07:48 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v3 2/3] media: ov5640: Fix soft reset sequence and timings
Message-ID: <20221229180748.xjb2cpiehzlvbv7f@uno.localdomain>
References: <20221227173634.5752-1-j-luthra@ti.com>
 <20221227173634.5752-3-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221227173634.5752-3-j-luthra@ti.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai

On Tue, Dec 27, 2022 at 11:06:33PM +0530, Jai Luthra wrote:
> Move the register-based reset out of the init_setting[] and into the
> powerup_sequence function. The sensor is power cycled and reset using
> the gpio pins so the soft reset is not always necessary.
>
> This also ensures that soft reset honors the timing sequence
> from the datasheet [1].
>
> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index e6525caa9b8c..5df16fb6f0a0 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -50,6 +50,7 @@
>  #define OV5640_REG_SYS_CTRL0		0x3008
>  #define OV5640_REG_SYS_CTRL0_SW_PWDN	0x42
>  #define OV5640_REG_SYS_CTRL0_SW_PWUP	0x02
> +#define OV5640_REG_SYS_CTRL0_SW_RST	0x82
>  #define OV5640_REG_CHIP_ID		0x300a
>  #define OV5640_REG_IO_MIPI_CTRL00	0x300e
>  #define OV5640_REG_PAD_OUTPUT_ENABLE01	0x3017
> @@ -532,7 +533,7 @@ static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
>  };
>
>  static const struct reg_value ov5640_init_setting[] = {
> -	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> +	{0x3103, 0x11, 0, 0}, {0x3008, 0x42, 0, 0},

have you tried removing the second entry
        {0x3008, 0x42, 0, 0},

as well ?

The SW_PWDN state allows programming registers (how can you exit with
SW_PWUP otherwise?), so it's probably right to have it there.



>  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
>  	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
>  	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
> @@ -2440,18 +2441,27 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
>   */
>  static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>  {
> -	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +	if (sensor->pwdn_gpio) {
> +		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>
> -	/* camera power cycle */
> -	ov5640_power(sensor, false);
> -	usleep_range(5000, 10000);
> -	ov5640_power(sensor, true);
> -	usleep_range(5000, 10000);
> +		/* camera power cycle */
> +		ov5640_power(sensor, false);
> +		usleep_range(5000, 10000);
> +		ov5640_power(sensor, true);
> +		usleep_range(5000, 10000);
>
> -	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> -	usleep_range(1000, 2000);
> +		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> +		usleep_range(1000, 2000);
>
> -	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +	} else {
> +		/* software reset */
> +		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> +				 OV5640_REG_SYS_CTRL0_SW_RST);
> +		usleep_range(5000, 10000);
> +		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> +				 OV5640_REG_SYS_CTRL0_SW_PWUP);

But now I wonder if this last PWUP is necessary, since init_settings[]
(which programs PWDN) is programmed immediately after.


> +	}
>  	usleep_range(20000, 25000);
>  }
>
> --
> 2.17.1
>
