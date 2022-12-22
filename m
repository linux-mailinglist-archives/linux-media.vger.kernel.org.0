Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E66E6545E5
	for <lists+linux-media@lfdr.de>; Thu, 22 Dec 2022 19:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiLVSQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Dec 2022 13:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235227AbiLVSPy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Dec 2022 13:15:54 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB2C205C0
        for <linux-media@vger.kernel.org>; Thu, 22 Dec 2022 10:15:51 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id BC3AF20004;
        Thu, 22 Dec 2022 18:15:46 +0000 (UTC)
Date:   Thu, 22 Dec 2022 19:15:45 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] media: ov5640: Handle delays when no reset_gpio
 set
Message-ID: <20221222181545.vtd4sd2fj5dftwzm@uno.localdomain>
References: <20221219143056.4070-1-j-luthra@ti.com>
 <20221219143056.4070-2-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219143056.4070-2-j-luthra@ti.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai

On Mon, Dec 19, 2022 at 08:00:54PM +0530, Jai Luthra wrote:
> Some module manufacturers [1][2] don't expose the RESETB and PWDN pins
> of the sensor directly through the 15-pin FFC connector. Instead wiring
> ~PWDN gpio to the sensor pins with appropriate delays.
>
> In such cases, reset_gpio will not be available to the driver, but it
> will still be toggled when the sensor is powered on, and thus we should
> still honor the wait time of >= 5ms + 1ms + 20ms (see figure 2-3 in [3])
> before attempting any i/o operations over SCCB.
>
> Also, rename the function to ov5640_powerup_sequence to better match the
> datasheet (section 2.7).
>
> [1] https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch.pdf
> [2] https://www.alinx.com/public/upload/file/AN5641_User_Manual.pdf
> [3] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

This looks fine to me
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/i2c/ov5640.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index a9cd21c49147..41e4a4f1b99d 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2372,11 +2372,22 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
>  	gpiod_set_value_cansleep(sensor->pwdn_gpio, enable ? 0 : 1);
>  }
>
> -static void ov5640_reset(struct ov5640_dev *sensor)
> +/*
> + * From section 2.7 power up sequence:
> + * t0 + t1 + t2 >= 5ms	Delay from DOVDD stable to PWDN pull down
> + * t3 >= 1ms		Delay from PWDN pull down to RESETB pull up
> + * t4 >= 20ms		Delay from RESETB pull up to SCCB (i2c) stable
> + *
> + * Some modules don't expose RESETB/PWDN pins directly, instead providing a
> + * "PWUP" GPIO which is wired through appropriate delays and inverters to the
> + * pins.
> + *
> + * In such cases, this gpio should be mapped to pwdn_gpio in the driver, and we
> + * should still toggle the pwdn_gpio below with the appropriate delays, while
> + * the calls to reset_gpio will be ignored.
> + */
> +static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>  {
> -	if (!sensor->reset_gpio)
> -		return;
> -
>  	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>
>  	/* camera power cycle */
> @@ -2412,8 +2423,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
>  		goto xclk_off;
>  	}
>
> -	ov5640_reset(sensor);
> -	ov5640_power(sensor, true);
> +	ov5640_powerup_sequence(sensor);
>
>  	ret = ov5640_init_slave_id(sensor);
>  	if (ret)
> --
> 2.17.1
>
