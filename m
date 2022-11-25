Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3DF638DFD
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 17:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiKYQAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 11:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiKYQAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 11:00:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14B22FFD7;
        Fri, 25 Nov 2022 08:00:10 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E197E496;
        Fri, 25 Nov 2022 17:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669392009;
        bh=cbdHVV2MrKXct2FMDoQfcRxM16G4dnrUe44uQpf2HvM=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=Penc6fcZwJKK+8p+FiWAio+z6qwam96N1qGUbM4blTpwycoTI81Sdx+3JnP13Iygu
         DEgTfWlkXb86JBr0Ki0kvHZQMTl9526xL3X5SctIuI8KUgi9OMGDK/3Ag5GD4LVHnG
         cRvwOdCC0QYvHxgw/Yj4i9xku3wadKZoBt5RBUwY=
Message-ID: <6ee3d17c-3481-b33f-682d-ac4a1e03061c@ideasonboard.com>
Date:   Fri, 25 Nov 2022 16:00:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-2-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 1/3] platform/x86: int3472/discrete: Refactor GPIO to
 sensor mapping
In-Reply-To: <20221124200007.390901-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 24/11/2022 20:00, Hans de Goede wrote:
> Make the GPIO to sensor mapping more generic and fold the
> INT3472_GPIO_TYPE_RESET and INT3472_GPIO_TYPE_POWERDOWN cases into
> a single generic case.
>
> This is a preparation patch for further GPIO mapping changes.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Tested-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/platform/x86/intel/int3472/discrete.c | 31 ++++++++++++++-----
>   1 file changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 974a132db651..bc6c62f3f3bf 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -184,6 +184,24 @@ static int skl_int3472_map_gpio_to_clk(struct int3472_discrete_device *int3472,
>   	return 0;
>   }
>   
> +static const char *int3472_dsm_type_to_func(u8 type)
> +{
> +	switch (type) {
> +	case INT3472_GPIO_TYPE_RESET:
> +		return "reset";
> +	case INT3472_GPIO_TYPE_POWERDOWN:
> +		return "powerdown";
> +	case INT3472_GPIO_TYPE_CLK_ENABLE:
> +		return "clken";
> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		return "pled";
> +	case INT3472_GPIO_TYPE_POWER_ENABLE:
> +		return "power-enable";
> +	}
> +
> +	return "unknown";
> +}
> +
>   /**
>    * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
>    * @ares: A pointer to a &struct acpi_resource
> @@ -223,6 +241,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   	struct acpi_resource_gpio *agpio;
>   	union acpi_object *obj;
>   	const char *err_msg;
> +	const char *func;
>   	int ret;
>   	u8 type;
>   
> @@ -246,19 +265,15 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   
>   	type = obj->integer.value & 0xff;
>   
> +	func = int3472_dsm_type_to_func(type);
> +
>   	switch (type) {
>   	case INT3472_GPIO_TYPE_RESET:
> -		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, "reset",
> -						     GPIO_ACTIVE_LOW);
> -		if (ret)
> -			err_msg = "Failed to map reset pin to sensor\n";
> -
> -		break;
>   	case INT3472_GPIO_TYPE_POWERDOWN:
> -		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, "powerdown",
> +		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func,
>   						     GPIO_ACTIVE_LOW);
>   		if (ret)
> -			err_msg = "Failed to map powerdown pin to sensor\n";
> +			err_msg = "Failed to map GPIO pin to sensor\n";
>   
>   		break;
>   	case INT3472_GPIO_TYPE_CLK_ENABLE:
