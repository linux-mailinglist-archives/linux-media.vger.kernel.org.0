Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 231CE71853C
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 16:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235976AbjEaOpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 10:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjEaOpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 10:45:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A4798;
        Wed, 31 May 2023 07:45:44 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A519C7F5;
        Wed, 31 May 2023 16:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685544321;
        bh=sn/NAAwjUxAwN9fkYYUDaJAsqUTIKnydTVXwkecQ1fQ=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=ioBTiclVGWQJfOurlPOjlCz10e8v3kiPC8JNI5w+FFQ2whYiVvzuef+yLpyqCV+Wm
         4NLx8Mb7giBHnTvK3w/s/I7mMqeNOhTy46RT6aRYOPmuY/5Ua7i4YtJJyaLXLKb+e2
         tOcv3yYxN1W6mBH7r9TFEyXOd6D5+RoqG1+Dq/IE=
Message-ID: <70e8ece9-d9eb-7749-ae8f-276891324e48@ideasonboard.com>
Date:   Wed, 31 May 2023 15:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     bingbu.cao@linux.intel.com, platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        Hao Yao <hao.yao@intel.com>
References: <20230531134429.171337-1-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v2] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
In-Reply-To: <20230531134429.171337-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans and Bingbu (and thanks for both versions of the patch)

On 31/05/2023 14:44, Hans de Goede wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>
> On some platforms, the imaging clock should be controlled by evaluating
> specific clock device's _DSM method instead of setting gpio, so this
> change register clock if no gpio based clock and then use the _DSM method
> to enable and disable clock.


Interesting - is that a common thing? Are there other camera-related resources that are controlled 
in a similar way? I still don't know how to drive the infrared LED on most Surface platforms, so now 
I'm wondering if they need something similar doing.


It does seem a bit strange for this to be a _DSM method against the INT3472 rather than part of _PS0 
against the camera itself - isn't that where you'd usually find such things?

>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Link: https://lore.kernel.org/r/20230524035135.90315-2-bingbu.cao@intel.com
> ---
> Changes in v2 (Hans de Goede):
> - Minor comment / code changes (address Andy's review remarks)
> - Add a acpi_check_dsm() call
> - Return 0 instead of error if we already have a GPIO clk or if
>    acpi_check_dsm() fails
> - Rename skl_int3472_register_clock() -> skl_int3472_register_gpio_clock()
>    and name the new function: skl_int3472_register_dsm_clock()
> - Move the skl_int3472_register_dsm_clock() call to after
>    acpi_dev_free_resource_list() and add error checking for it


I think all these changes are good ones.

> ---
>   .../x86/intel/int3472/clk_and_regulator.c     | 89 ++++++++++++++++++-
>   drivers/platform/x86/intel/int3472/common.h   | 10 ++-
>   drivers/platform/x86/intel/int3472/discrete.c |  8 +-
>   3 files changed, 99 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 1086c3d83494..9bcf8c64b8e7 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -11,6 +11,37 @@
>   
>   #include "common.h"
>   
> +/*
> + * 82c0d13a-78c5-4244-9bb1-eb8b539a8d11
> + * This _DSM GUID allows controlling the sensor clk when it is not controlled
> + * through a GPIO.
> + */
> +static const guid_t img_clk_guid =
> +	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
> +		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
> +
> +static void skl_int3472_enable_clk_acpi_method(struct int3472_gpio_clock *clk,
> +					       bool enable)
> +{
> +	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
> +	union acpi_object args[3];
> +	union acpi_object argv4;
> +
> +	args[0].integer.type = ACPI_TYPE_INTEGER;
> +	args[0].integer.value = clk->imgclk_index;
> +	args[1].integer.type = ACPI_TYPE_INTEGER;
> +	args[1].integer.value = enable ? 1 : 0;
> +	args[2].integer.type = ACPI_TYPE_INTEGER;
> +	args[2].integer.value = 1;
> +
> +	argv4.type = ACPI_TYPE_PACKAGE;
> +	argv4.package.count = 3;
> +	argv4.package.elements = args;
> +
> +	acpi_evaluate_dsm(acpi_device_handle(int3472->adev), &img_clk_guid,
> +			  0, 1, &argv4);
> +}


I'm not really sure what error modes something like this might have, but acpi_evaluate_dsm() at 
least can fail - is there no value in error checking here so that it could be returned by 
skl_int3472_clk_prepare() below?

> +
>   /*
>    * The regulators have to have .ops to be valid, but the only ops we actually
>    * support are .enable and .disable which are handled via .ena_gpiod. Pass an
> @@ -22,7 +53,11 @@ static int skl_int3472_clk_prepare(struct clk_hw *hw)
>   {
>   	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
>   
> -	gpiod_set_value_cansleep(clk->ena_gpio, 1);
> +	if (clk->ena_gpio)
> +		gpiod_set_value_cansleep(clk->ena_gpio, 1);
> +	else
> +		skl_int3472_enable_clk_acpi_method(clk, 1);
> +
>   	return 0;
>   }
>   
> @@ -30,7 +65,10 @@ static void skl_int3472_clk_unprepare(struct clk_hw *hw)
>   {
>   	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
>   
> -	gpiod_set_value_cansleep(clk->ena_gpio, 0);
> +	if (clk->ena_gpio)
> +		gpiod_set_value_cansleep(clk->ena_gpio, 0);
> +	else
> +		skl_int3472_enable_clk_acpi_method(clk, 0);
>   }
>   
>   static int skl_int3472_clk_enable(struct clk_hw *hw)
> @@ -86,8 +124,51 @@ static const struct clk_ops skl_int3472_clock_ops = {
>   	.recalc_rate = skl_int3472_clk_recalc_rate,
>   };
>   
> -int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
> -			       struct acpi_resource_gpio *agpio, u32 polarity)
> +int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
> +{
> +	struct acpi_device *adev = int3472->adev;
> +	struct clk_init_data init = {
> +		.ops = &skl_int3472_clock_ops,
> +		.flags = CLK_GET_RATE_NOCACHE,
> +	};
> +	int ret;
> +
> +	if (int3472->clock.cl)
> +		return 0; /* A GPIO controlled clk has already been registered */
> +
> +	if (!acpi_check_dsm(adev->handle, &img_clk_guid, 0, BIT(1)))
> +		return 0; /* DSM clock control is not available */
> +
> +	init.name = kasprintf(GFP_KERNEL, "%s-clk", acpi_dev_name(adev));
> +	if (!init.name)
> +		return -ENOMEM;
> +
> +	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
> +	int3472->clock.clk_hw.init = &init;
> +	int3472->clock.clk = clk_register(&adev->dev, &int3472->clock.clk_hw);
> +	if (IS_ERR(int3472->clock.clk)) {
> +		ret = PTR_ERR(int3472->clock.clk);
> +		goto out_free_init_name;
> +	}
> +
> +	int3472->clock.cl = clkdev_create(int3472->clock.clk, NULL, int3472->sensor_name);
> +	if (!int3472->clock.cl) {
> +		ret = -ENOMEM;
> +		goto err_unregister_clk;
> +	}
> +
> +	kfree(init.name);
> +	return 0;
> +
> +err_unregister_clk:
> +	clk_unregister(int3472->clock.clk);
> +out_free_init_name:
> +	kfree(init.name);
> +	return ret;
> +}
> +
> +int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
> +				    struct acpi_resource_gpio *agpio, u32 polarity)
>   {
>   	char *path = agpio->resource_source.string_ptr;
>   	struct clk_init_data init = {
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 61688e450ce5..10a72f42a998 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -64,7 +64,9 @@ struct int3472_cldb {
>   	u8 control_logic_type;
>   	u8 control_logic_id;
>   	u8 sensor_card_sku;
> -	u8 reserved[28];
> +	u8 reserved[10];
> +	u8 clock_source;
> +	u8 reserved2[17];


Not really a comment on the functionality of the patch, but can we not just get the rest of those 
fields filled out?

>   };
>   
>   struct int3472_gpio_function_remap {
> @@ -100,6 +102,7 @@ struct int3472_discrete_device {
>   		struct clk_lookup *cl;
>   		struct gpio_desc *ena_gpio;
>   		u32 frequency;
> +		u8 imgclk_index;
>   	} clock;


This struct is called "int3472_gpio_clock" but perhaps now ought to just be "int3472_clock"

>   
>   	struct int3472_pled {
> @@ -121,8 +124,9 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
>   					 struct acpi_device **sensor_adev_ret,
>   					 const char **name_ret);
>   
> -int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
> -			       struct acpi_resource_gpio *agpio, u32 polarity);
> +int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
> +				    struct acpi_resource_gpio *agpio, u32 polarity);
> +int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472);
>   void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
>   
>   int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index ef020e23e596..8111579a59d4 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -258,7 +258,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   
>   		break;
>   	case INT3472_GPIO_TYPE_CLK_ENABLE:
> -		ret = skl_int3472_register_clock(int3472, agpio, polarity);
> +		ret = skl_int3472_register_gpio_clock(int3472, agpio, polarity);
>   		if (ret)
>   			err_msg = "Failed to register clock\n";
>   
> @@ -311,6 +311,11 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
>   
>   	acpi_dev_free_resource_list(&resource_list);
>   
> +	/* Register _DSM based clock (no-op if a GPIO clock was already registered) */
> +	ret = skl_int3472_register_dsm_clock(int3472);
> +	if (ret < 0)
> +		return ret;
> +
>   	int3472->gpios.dev_id = int3472->sensor_name;
>   	gpiod_add_lookup_table(&int3472->gpios);
>   
> @@ -356,6 +361,7 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
>   	int3472->adev = adev;
>   	int3472->dev = &pdev->dev;
>   	platform_set_drvdata(pdev, int3472);
> +	int3472->clock.imgclk_index = cldb.clock_source;
>   
>   	ret = skl_int3472_get_sensor_adev_and_name(&pdev->dev, &int3472->sensor,
>   						   &int3472->sensor_name);
