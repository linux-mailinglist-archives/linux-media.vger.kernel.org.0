Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384096545DC
	for <lists+linux-media@lfdr.de>; Thu, 22 Dec 2022 19:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbiLVSNP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Dec 2022 13:13:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiLVSNO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Dec 2022 13:13:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E59764F
        for <linux-media@vger.kernel.org>; Thu, 22 Dec 2022 10:13:13 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 497EE471;
        Thu, 22 Dec 2022 19:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671732790;
        bh=c3ayc5Nc7I7+ldNzkVDMEt7I6WIZu2oW2fKkT6JQQUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZKdOEMxyheDuEA/N8JRKGFCyiV1/qLMYcDgNj9fMg1vASEam+FQzk1reZxn5F9BHy
         3QAn+VQu8M/aeDCj0Sp9niGObIObwPZTTyGAt5a3UMgCqwL0eTCNhnLaln89XmuQNe
         cdXQrE1Buyf273KWwSpblNw3fEXq45jZm2dTdLAQ=
Date:   Thu, 22 Dec 2022 19:13:07 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2 2/3] media: ov5640: Honor RESETB to SMBUS time t4 in
 init_setting
Message-ID: <20221222181307.ajxrd5t3rmxp3oaw@uno.localdomain>
References: <20221219143056.4070-1-j-luthra@ti.com>
 <20221219143056.4070-3-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219143056.4070-3-j-luthra@ti.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai

On Mon, Dec 19, 2022 at 08:00:55PM +0530, Jai Luthra wrote:
> From: Nishanth Menon <nm@ti.com>
>
> OV5640 Datasheet[1] Figures 2-3 and 2-4 indicate the timing sequences
> that is expected during various initialization steps. Note the t4 >=
> 20ms, delay from RESETB pull high to SCCB initialization
>
> As indicated in section 2.8, the RESETB assertion can either be via
> external pin control OR via the register 0x3008 bit 7. The
> initialization sequence asserts bit7, but on deassert, we do not wait
> for the reset delay.
>
> [1] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
>
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 41e4a4f1b99d..7b0ff04a2c93 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -475,7 +475,7 @@ static const struct v4l2_mbus_framefmt ov5640_default_fmt = {
>  };
>
>  static const struct reg_value ov5640_init_setting[] = {
> -	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
> +	{0x3103, 0x11, 0, 0}, {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 20},

I'm debated here...

This adds a 20msec delay, even in case the reset has been performed
using the GPIO reset line.

Ideally, these SW resets should be moved to ov5640_reset() and only
used if no HW pin is available.

I wonder if ov5640_reset() could go as:

static void ov5640_reset(struct ov5640_dev *sensor)
{
	if (sensor->pwdn_gpio) {
		gpiod_set_value_cansleep(sensor->reset_gpio, 0);

		/* camera power cycle */
		ov5640_power(sensor, false);
		usleep_range(5000, 10000);
		ov5640_power(sensor, true);
		usleep_range(5000, 10000);

		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
		usleep_range(1000, 2000);

		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
	} else {
		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, 0x82);
		usleep_range(5000, 10000);

		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, 0x42);
	}

	usleep_range(20000, 25000);
}


And remove
         {0x3008, 0x82, 0, 5}, {0x3008, 0x42, 0, 0},
from the init_settings[] table.

FWIW I have a setup with reset and pwdn lines and I have tried
with both lines made available to the driver from DTS, and also by removing
them from DTS. In both cases the sensor works for me and the first
captured pictures are ok. Removing the gpio lines from DTS
is probably not enough to simulate a "software-only" setup as the
lines might be left floating and could interfere with the powerup
operations, but in my case it seems it's ok.

Could you try with your setup to see if it works ?

Am I overthinking it ? A delay of 50+msec (25 hw + 25 sw) at power-up
time is not negligible considering that half of that might not be
necessary.


>  	{0x3103, 0x03, 0, 0}, {0x3630, 0x36, 0, 0},
>  	{0x3631, 0x0e, 0, 0}, {0x3632, 0xe2, 0, 0}, {0x3633, 0x12, 0, 0},
>  	{0x3621, 0xe0, 0, 0}, {0x3704, 0xa0, 0, 0}, {0x3703, 0x5a, 0, 0},
> --
> 2.17.1
>
