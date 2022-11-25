Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B0C638E01
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 17:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiKYQBl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 11:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiKYQBk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 11:01:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129971D64C;
        Fri, 25 Nov 2022 08:01:39 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 620B5496;
        Fri, 25 Nov 2022 17:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669392097;
        bh=KDaNurLvDimY2hn+56FprGq+rSdNvURz9N1gHxhig8A=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=JaA9YiKKlCubWkgu5Q7zBPtjDW6ND8Bipn9BZ1CV3ehmvo+LDDLfP2F0l36Lw9eS+
         YigQl1Vec198WCKjllmRpJButyFZXDHmO2aF2bx9nDS+/ZT8z8W/g8uM7RVGnFz6G6
         17IyZi4FAUlCeBuZ1VCBXoE5x/jrZqrjpUnsPFn8=
Message-ID: <b4d94ae0-6398-7224-54d1-8782b4e59844@ideasonboard.com>
Date:   Fri, 25 Nov 2022 16:01:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/3] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-3-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221124200007.390901-3-hdegoede@redhat.com>
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
> The out of tree IPU6 driver has moved to also using the in kernel INT3472
> code for doing power-ctrl rather then doing their own thing (good!).


Neat!

>
> On IPU6 the polarity is encoded in the _DSM entry rather then being
> hardcoded to GPIO_ACTIVE_LOW.
>
> Using the _DSM entry for this on IPU3 leads to regressions, so only
> use the _DSM entry for this on non IPU3 devices.


Shame; some consistency might have been nice

> Note there is a whole bunch of PCI-ids for the IPU6 which is why
> the check is for the IPU3-CIO2, because the CIO2 there has a unique
> PCI-id which can be used for this.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Tested-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/platform/x86/intel/int3472/discrete.c | 28 +++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index bc6c62f3f3bf..9159291be28a 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -11,6 +11,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/overflow.h>
> +#include <linux/pci.h>
>   #include <linux/platform_device.h>
>   #include <linux/uuid.h>
>   
> @@ -36,6 +37,19 @@ static const guid_t cio2_sensor_module_guid =
>   	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
>   		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
>   
> +/* IPU3 vs IPU6 needs to be handled differently */
> +#define IPU3_CIO2_PCI_ID				0x9d32
> +
> +static const struct pci_device_id ipu3_cio2_pci_id_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU3_CIO2_PCI_ID) },
> +	{ }
> +};
> +
> +static int ipu3_present(void)
> +{
> +	return pci_dev_present(ipu3_cio2_pci_id_table);
> +}
> +
>   /*
>    * Here follows platform specific mapping information that we can pass to
>    * the functions mapping resources to the sensors. Where the sensors have
> @@ -242,6 +256,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   	union acpi_object *obj;
>   	const char *err_msg;
>   	const char *func;
> +	u32 polarity;
>   	int ret;
>   	u8 type;
>   
> @@ -265,13 +280,22 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>   
>   	type = obj->integer.value & 0xff;
>   
> +	/* IPU3 always uses active-low, IPU6 polarity is encoded in the _DSM entry. */
> +	if (ipu3_present())
> +		polarity = GPIO_ACTIVE_LOW;
> +	else
> +		polarity = ((obj->integer.value >> 24) & 0xff) ? GPIO_ACTIVE_HIGH : GPIO_ACTIVE_LOW;
> +
>   	func = int3472_dsm_type_to_func(type);
>   
> +	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
> +		agpio->resource_source.string_ptr, agpio->pin_table[0],
> +		(polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
> +
>   	switch (type) {
>   	case INT3472_GPIO_TYPE_RESET:
>   	case INT3472_GPIO_TYPE_POWERDOWN:
> -		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func,
> -						     GPIO_ACTIVE_LOW);
> +		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>   		if (ret)
>   			err_msg = "Failed to map GPIO pin to sensor\n";
>   
