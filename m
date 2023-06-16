Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA18733BAD
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 23:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbjFPVxy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 17:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjFPVxx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 17:53:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF2D1295A;
        Fri, 16 Jun 2023 14:53:51 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04E907EC;
        Fri, 16 Jun 2023 23:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686952397;
        bh=3IjPZws8n7kuka6mTiTXJgTj7gXBNf6H1JuQ0LesuAQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FTWf4tO5C/8gqcE3ifJ4BVvDL3bWVJXgSxKdCLS55P9UdEyKeTGlh/h+nb+bd1FE/
         /7Lst29hkknwOKMau4k6wOzZqzH60johYpAMK7iq7ljeVDBqgI4Gghy5/OKUVw3cAY
         Qg8Fo9uw1DfwLdF1zvOAJw9Xl4DdVePuHviyzfyU=
Message-ID: <82b57c76-420a-6022-54f5-3e13977607f1@ideasonboard.com>
Date:   Fri, 16 Jun 2023 22:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/6] platform/x86: int3472: discrete: Remove
 sensor_config-s
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Bingbu Cao <bingbu.cao@intel.com>, Hao Yao <hao.yao@intel.com>
References: <20230616172132.37859-1-hdegoede@redhat.com>
 <20230616172132.37859-3-hdegoede@redhat.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230616172132.37859-3-hdegoede@redhat.com>
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

Hi Hans

On 16/06/2023 18:21, Hans de Goede wrote:
> Currently the only 2 sensor_config-s both specify "avdd" as supply-id.
>
> The INT3472 device is going to be the only supplier of a regulator for
> the sensor device.
>
> So there is no chance of collisions with other regulator suppliers
> and it is undesirable to need to manually add new entries to
> int3472_sensor_configs[] for each new sensor module which uses
> a GPIO regulator.
>
> Instead just always use "avdd" as supply-id when registering
> the GPIO regulator.
>
> If necessary for specific sensor drivers then other supply-ids can
> be added as aliases in the future, adding aliases will be safe
> since INT3472 will be the only regulator supplier for the sensor.
>
> Cc: Bingbu Cao <bingbu.cao@intel.com>
> Tested-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> Changes in v2:
> - Use static_assert() to check that GPIO_REGULATOR_SUPPLY_MAP_COUNT
>    and ARRAY_SIZE(skl_int3472_regulator_map_supplies) match
> ---
>   .../x86/intel/int3472/clk_and_regulator.c     | 40 ++++++++++-------
>   drivers/platform/x86/intel/int3472/common.h   |  7 +--
>   drivers/platform/x86/intel/int3472/discrete.c | 45 +++----------------
>   3 files changed, 31 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 410073ca371c..5487f3ab66ad 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -234,32 +234,40 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
>   	gpiod_put(int3472->clock.ena_gpio);
>   }
>   
> +/*
> + * The INT3472 device is going to be the only supplier of a regulator for
> + * the sensor device. But unlike the clk framework the regulator framework
> + * does not allow matching by consumer-device-name only.
> + *
> + * Ideally all sensor drivers would use "avdd" as supply-id. But for drivers
> + * where this cannot be changed because another supply-id is already used in
> + * e.g. DeviceTree files an alias for the other supply-id can be added here.
> + *
> + * Do not forget to update GPIO_REGULATOR_SUPPLY_MAP_COUNT when changing this.
> + */
> +static const char * const skl_int3472_regulator_map_supplies[] = {
> +	"avdd",
> +};
> +
> +static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
> +	      GPIO_REGULATOR_SUPPLY_MAP_COUNT);
> +
>   int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>   				   struct acpi_resource_gpio *agpio)
>   {
> -	const struct int3472_sensor_config *sensor_config;
>   	char *path = agpio->resource_source.string_ptr;
> -	struct regulator_consumer_supply supply_map;
>   	struct regulator_init_data init_data = { };
>   	struct regulator_config cfg = { };
> -	int ret;
> +	int i, ret;
>   
> -	sensor_config = int3472->sensor_config;
> -	if (IS_ERR(sensor_config)) {
> -		dev_err(int3472->dev, "No sensor module config\n");
> -		return PTR_ERR(sensor_config);
> -	}
> -
> -	if (!sensor_config->supply_map.supply) {
> -		dev_err(int3472->dev, "No supply name defined\n");
> -		return -ENODEV;
> +	for (i = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
> +		int3472->regulator.supply_map[i].supply = skl_int3472_regulator_map_supplies[i];
> +		int3472->regulator.supply_map[i].dev_name = int3472->sensor_name;
>   	}
>   
>   	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
> -	init_data.num_consumer_supplies = 1;
> -	supply_map = sensor_config->supply_map;
> -	supply_map.dev_name = int3472->sensor_name;
> -	init_data.consumer_supplies = &supply_map;
> +	init_data.consumer_supplies = int3472->regulator.supply_map;
> +	init_data.num_consumer_supplies = GPIO_REGULATOR_SUPPLY_MAP_COUNT;
>   
>   	snprintf(int3472->regulator.regulator_name,
>   		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 735567f374a6..225b067c854d 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -28,6 +28,7 @@
>   
>   #define GPIO_REGULATOR_NAME_LENGTH				21
>   #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
> +#define GPIO_REGULATOR_SUPPLY_MAP_COUNT				1
>   
>   #define INT3472_LED_MAX_NAME_LEN				32
>   
> @@ -69,11 +70,6 @@ struct int3472_cldb {
>   	u8 reserved2[17];
>   };
>   
> -struct int3472_sensor_config {
> -	const char *sensor_module_name;
> -	struct regulator_consumer_supply supply_map;
> -};
> -
>   struct int3472_discrete_device {
>   	struct acpi_device *adev;
>   	struct device *dev;
> @@ -83,6 +79,7 @@ struct int3472_discrete_device {
>   	const struct int3472_sensor_config *sensor_config;
>   
>   	struct int3472_gpio_regulator {
> +		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT];
>   		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
>   		char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
>   		struct gpio_desc *gpio;
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 2ab3c7466986..3b410428cec2 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -34,48 +34,17 @@ static const guid_t cio2_sensor_module_guid =
>   	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
>   		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
>   
> -/*
> - * Here follows platform specific mapping information that we can pass to
> - * the functions mapping resources to the sensors. Where the sensors have
> - * a power enable pin defined in DSDT we need to provide a supply name so
> - * the sensor drivers can find the regulator. The device name will be derived
> - * from the sensor's ACPI device within the code.
> - */
> -static const struct int3472_sensor_config int3472_sensor_configs[] = {
> -	/* Lenovo Miix 510-12ISK - OV5648, Rear */
> -	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL) },
> -	/* Surface Go 1&2 - OV5693, Front */
> -	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL) },
> -};
> -
> -static const struct int3472_sensor_config *
> -skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
> +static void skl_int3472_log_sensor_module_name(struct int3472_discrete_device *int3472)
>   {
>   	union acpi_object *obj;
> -	unsigned int i;
>   
>   	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
>   				      &cio2_sensor_module_guid, 0x00,
>   				      0x01, NULL, ACPI_TYPE_STRING);
> -
> -	if (!obj) {
> -		dev_err(int3472->dev,
> -			"Failed to get sensor module string from _DSM\n");
> -		return ERR_PTR(-ENODEV);
> +	if (obj) {
> +		dev_dbg(int3472->dev, "Sensor module id: '%s'\n", obj->string.pointer);
> +		ACPI_FREE(obj);
>   	}
> -
> -	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
> -		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
> -			    obj->string.pointer))
> -			break;
> -	}
> -
> -	ACPI_FREE(obj);
> -
> -	if (i >= ARRAY_SIZE(int3472_sensor_configs))
> -		return ERR_PTR(-EINVAL);
> -
> -	return &int3472_sensor_configs[i];
>   }
>   
>   static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int3472,
> @@ -266,11 +235,7 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
>   	LIST_HEAD(resource_list);
>   	int ret;
>   
> -	/*
> -	 * No error check, because not having a sensor config is not necessarily
> -	 * a failure mode.
> -	 */
> -	int3472->sensor_config = skl_int3472_get_sensor_module_config(int3472);
> +	skl_int3472_log_sensor_module_name(int3472);
>   
>   	ret = acpi_dev_get_resources(int3472->adev, &resource_list,
>   				     skl_int3472_handle_gpio_resources,
