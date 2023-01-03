Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3435965C4C6
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 18:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238398AbjACRKj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 12:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238395AbjACRKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 12:10:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 580F613F04
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 09:07:42 -0800 (PST)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:c40c:10ff:feac:d8bd])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79543108;
        Tue,  3 Jan 2023 18:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672765660;
        bh=V79SqGBzHl99jVAzMWlNZZK/iQ2nYAob/68p3rqgobE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fv2T1GJypjctw+0yhYaGCqoBUv0c0A8WpPgZo11l7i1cyVrDMXKDQNUimsTAYe42d
         17FYhiQpMAG4i/H+3ytPuHbTk59tdu91+HpdaIGM/y1oI2g8eMIubAN4tixfJ8v8n+
         HZRAAbXEo5BvbSHdSVvSrB2kFHibORVjXGBlub0U=
Date:   Tue, 3 Jan 2023 18:07:38 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v4 1/2] media: ov5640: Fix soft reset sequence and timings
Message-ID: <20230103170738.hldmc6pu4s2jch3e@uno.localdomain>
References: <20230103122736.18479-1-j-luthra@ti.com>
 <20230103122736.18479-2-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230103122736.18479-2-j-luthra@ti.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai,
  bear with me a little longer..

On Tue, Jan 03, 2023 at 05:57:35PM +0530, Jai Luthra wrote:
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
> Reported-by: Nishanth Menon <nm@ti.com>
> Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index e0f908af581b..9f3913aad93c 100644
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
> +	{0x3103, 0x11, 0, 0},
>  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
>  	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
>  	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
> @@ -2429,19 +2430,31 @@ static void ov5640_reset(struct ov5640_dev *sensor)
>  	if (!sensor->reset_gpio)
>  		return;
>
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
> +	}
>  	usleep_range(20000, 25000);
> +
> +	/* software standby: allows registers programming;
> +	 * exit at restore_mode() for CSI, s_stream(1) for DVP
> +	 */

Multiline comments are usually written as

	/*
         * Software standby: allows registers programming;
	 * exit at restore_mode() for CSI, s_stream(1) for DVP
	 */

It's a trivial change, I'm not collecting patches so I can't offer to
change it when doing so, but maybe Sakari could help with that so that
you don't have to send a new version ? (if that's the only comment you
receive ofc)

The patch looks good to me

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonaboard.com>


> +	ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> +			 OV5640_REG_SYS_CTRL0_SW_PWDN);
>  }
>
>  static int ov5640_set_power_on(struct ov5640_dev *sensor)
> --
> 2.17.1
>
