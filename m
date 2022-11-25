Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E010638C53
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 15:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbiKYOgu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 09:36:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbiKYOgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 09:36:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D97D31DED;
        Fri, 25 Nov 2022 06:36:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E157496;
        Fri, 25 Nov 2022 15:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669387005;
        bh=9BVf21ejFFpO4xjlZS5xPumIzAKd+1naJNV5koJSjNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UX7Wq5+secWwOvBLfWeL09Z9iZz41H/VxBOcpGH6khQsFV3XJHbauvO/+RYfD824/
         jQacD6D+8ofS3EMGggiIHZdzbH1rcxS4FsjPPvWdn6EygTBClPP+cPsXAX9cKmJzjm
         QHw+hT7dhYkQ48HKky8+7VLVPPH0UbLuGjUuuS2A=
Date:   Fri, 25 Nov 2022 16:36:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 3/3] platform/x86: int3472/discrete: Add support for
 sensor-drivers which expect clken + pled GPIOs
Message-ID: <Y4DS7XBwDVAf9qrC@pendragon.ideasonboard.com>
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221124200007.390901-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Nov 24, 2022 at 09:00:07PM +0100, Hans de Goede wrote:
> The hm11b1 and ov01a1s sensor drivers shipped with the out of tree IPU6
> driver, expect the clk_en GPIO to be modelled as a "clken" GPIO rather
> then using the clk framework; and the hm11b1, ov01a1s and ov2740 driver
> all 3 expect the privacy-led to be modelled as a "pled" GPIO, rather then
> it being turned on/off at the same time as the clk.

I don't like this idea much. I see this as opening the door to other
hacks in mainline just for the purpose of supporting out-of-tree
drivers. That's not how we should operate upstream.

Why can't we patch the out-of-tree drivers to use the clock framework,
given that's what it will need to do in mainline ? That shouldn't be a
too intrusive change.

> Adjust how we handle the GPIOs on these sensors accordingly, for now at
> least, so that the out of tree driver can work with standard distro kernels
> through e.g. dkms. Otherwise users need to run a patched kernel just for
> this small difference.
> 
> This of course needs to be revisited when we mainline these sensor drivers,
> I can imagine the drivers getting clk-framework support when they are
> mainlined and then at that same time their acpi HID can be dropped from
> the use_gpio_for_clk_acpi_ids[] array.
> 
> Note there already is a mainline driver for the ov2740, but that is not
> impacted by this change since atm it uses neither the clk framework nor
> a "clken" GPIO.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Maybe we should patch the sensor drivers for sensors supported with
> the IPU3 to also expect the privacy-led to always be a separate GPIO?
> 
> This way we can also avoid the camera LED briefly going on at boot,
> when the driver is powering things up to read the sensor's ID register.

To fix the privacy LED flickering problem correctly we need to avoid
powering up sensor at probe time, as there are hardware designs that
wire the privacy LED to the sensor power rails without any way to
disable it in software.

> And I have also put looking at making the mainline ov2740 driver suitable
> for use with the (out of tree) IPU6 driver on my TODO list.
> ---
>  drivers/platform/x86/intel/int3472/common.h   |  2 +-
>  drivers/platform/x86/intel/int3472/discrete.c | 37 +++++++++++++++----
>  2 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 53270d19c73a..58647d3084b9 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -23,7 +23,7 @@
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
>  
>  #define INT3472_PDEV_MAX_NAME_LEN				23
> -#define INT3472_MAX_SENSOR_GPIOS				3
> +#define INT3472_MAX_SENSOR_GPIOS				4
>  
>  #define GPIO_REGULATOR_NAME_LENGTH				21
>  #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 9159291be28a..bfcf8184db16 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -216,6 +216,26 @@ static const char *int3472_dsm_type_to_func(u8 type)
>  	return "unknown";
>  }
>  
> +/*
> + * The hm11b1 and ov01a1s sensor drivers shipped with the out of tree IPU6 driver,
> + * expect the clk_en GPIO to be modelled as a "clken" GPIO rather then as a clk and
> + * the hm11b1, ov01a1s and ov2740 driver all 3 expect the privacy-led to be modelled
> + * as a "pled" GPIO, rather then it being turned on/off at the same time as the clk.
> + *
> + * Note there also is a mainline driver for the ov2740, but that does not use
> + * the clk framework atm either.
> + *
> + * Adjust how we handle the GPIOs on these sensors accordingly, for now at least.
> + * This needs to be revisited when we mainline these sensor drivers / when we merge
> + * the necessary changes in the ov2740 sensor driver so that it can work on the IPU6.
> + */
> +static const struct acpi_device_id use_gpio_for_clk_acpi_ids[] = {
> +	{ "HIMX11B1" }, /* hm11b1 */
> +	{ "OVTI01AS" }, /* ov01a1s */
> +	{ "INT3474" },  /* ov2740 */
> +	{}
> +};
> +
>  /**
>   * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
>   * @ares: A pointer to a &struct acpi_resource
> @@ -293,19 +313,22 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  		(polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
>  
>  	switch (type) {
> +	case INT3472_GPIO_TYPE_CLK_ENABLE:
> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		if (!acpi_match_device_ids(int3472->adev, use_gpio_for_clk_acpi_ids)) {
> +			ret = skl_int3472_map_gpio_to_clk(int3472, agpio, type);
> +			if (ret)
> +				err_msg = "Failed to map GPIO to clock\n";
> +
> +			break;
> +		}
> +		fallthrough;
>  	case INT3472_GPIO_TYPE_RESET:
>  	case INT3472_GPIO_TYPE_POWERDOWN:
>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>  		if (ret)
>  			err_msg = "Failed to map GPIO pin to sensor\n";
>  
> -		break;
> -	case INT3472_GPIO_TYPE_CLK_ENABLE:
> -	case INT3472_GPIO_TYPE_PRIVACY_LED:
> -		ret = skl_int3472_map_gpio_to_clk(int3472, agpio, type);
> -		if (ret)
> -			err_msg = "Failed to map GPIO to clock\n";
> -
>  		break;
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>  		ret = skl_int3472_register_regulator(int3472, agpio);

-- 
Regards,

Laurent Pinchart
