Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD8B732C9D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 11:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238942AbjFPJ7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 05:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjFPJ7k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 05:59:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E2E2D59;
        Fri, 16 Jun 2023 02:59:33 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 370698E1;
        Fri, 16 Jun 2023 11:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686909539;
        bh=hE4PSr3/dL9hpfRlQRqRnxP5UbQq9Dxh+B+h85l9+gA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eb9HnSSxlGsZsAzIaUItzGRfGU3XUi/49yH0W4QQQnCVnFIa0I/3x/ylA9rEvVVlY
         vX4cgTbWPI/D2uikVFw8gWM8jrXZMN0KDr9eiJFfdB0CnRlKQfPhygyjYUhANbx7+a
         Bg9BikdrUWRXrqnLmuCfrlZfTb8dQPvgLJnVbL8A=
Message-ID: <cdeff067-7f11-0190-b4cf-997930c84104@ideasonboard.com>
Date:   Fri, 16 Jun 2023 10:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] platform/x86: int3472: discrete: Drop GPIO remapping
 support
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, Hao Yao <hao.yao@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230609204228.74967-1-hdegoede@redhat.com>
 <20230609204228.74967-2-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230609204228.74967-2-hdegoede@redhat.com>
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

Hi Hans - sorry I've been late replying to this series.

On 09/06/2023 21:42, Hans de Goede wrote:
> The only sensor driver which needs GPIO remapping support is the ov2680
> driver and ACPI enumeration support + other necessary changes to
> the ov2680 driver were never upstreamed.
>
> A new series updating the ov2680 driver is pending upstream now and
> in this series the ov2680 driver is patched to look for "powerdown"
> as con-id, instead of relying on GPIO remapping in the int3472 code,
> so the GPIO remapping is no longer necessary.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/platform/x86/intel/int3472/common.h   |  6 ---
>   drivers/platform/x86/intel/int3472/discrete.c | 37 ++-----------------
>   2 files changed, 3 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 0c9c899e017b..735567f374a6 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -69,15 +69,9 @@ struct int3472_cldb {
>   	u8 reserved2[17];
>   };
>   
> -struct int3472_gpio_function_remap {
> -	const char *documented;
> -	const char *actual;
> -};
> -
>   struct int3472_sensor_config {
>   	const char *sensor_module_name;
>   	struct regulator_consumer_supply supply_map;
> -	const struct int3472_gpio_function_remap *function_maps;
>   };
>   
>   struct int3472_discrete_device {
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 8111579a59d4..2ab3c7466986 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -39,27 +39,13 @@ static const guid_t cio2_sensor_module_guid =
>    * the functions mapping resources to the sensors. Where the sensors have
>    * a power enable pin defined in DSDT we need to provide a supply name so
>    * the sensor drivers can find the regulator. The device name will be derived
> - * from the sensor's ACPI device within the code. Optionally, we can provide a
> - * NULL terminated array of function name mappings to deal with any platform
> - * specific deviations from the documented behaviour of GPIOs.
> - *
> - * Map a GPIO function name to NULL to prevent the driver from mapping that
> - * GPIO at all.
> + * from the sensor's ACPI device within the code.
>    */
> -
> -static const struct int3472_gpio_function_remap ov2680_gpio_function_remaps[] = {
> -	{ "reset", NULL },
> -	{ "powerdown", "reset" },
> -	{ }
> -};
> -
>   static const struct int3472_sensor_config int3472_sensor_configs[] = {
> -	/* Lenovo Miix 510-12ISK - OV2680, Front */
> -	{ "GNDF140809R", { 0 }, ov2680_gpio_function_remaps },
>   	/* Lenovo Miix 510-12ISK - OV5648, Rear */
> -	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL), NULL },
> +	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL) },
>   	/* Surface Go 1&2 - OV5693, Front */
> -	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL), NULL },
> +	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL) },
>   };
>   
>   static const struct int3472_sensor_config *
> @@ -96,7 +82,6 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
>   					  struct acpi_resource_gpio *agpio,
>   					  const char *func, u32 polarity)
>   {
> -	const struct int3472_sensor_config *sensor_config;
>   	char *path = agpio->resource_source.string_ptr;
>   	struct gpiod_lookup *table_entry;
>   	struct acpi_device *adev;
> @@ -108,22 +93,6 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
>   		return -EINVAL;
>   	}
>   
> -	sensor_config = int3472->sensor_config;
> -	if (!IS_ERR(sensor_config) && sensor_config->function_maps) {
> -		const struct int3472_gpio_function_remap *remap;
> -
> -		for (remap = sensor_config->function_maps; remap->documented; remap++) {
> -			if (!strcmp(func, remap->documented)) {
> -				func = remap->actual;
> -				break;
> -			}
> -		}
> -	}
> -
> -	/* Functions mapped to NULL should not be mapped to the sensor */
> -	if (!func)
> -		return 0;
> -
>   	status = acpi_get_handle(NULL, path, &handle);
>   	if (ACPI_FAILURE(status))
>   		return -EINVAL;
