Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 305CE7C6DEE
	for <lists+linux-media@lfdr.de>; Thu, 12 Oct 2023 14:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378198AbjJLMXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Oct 2023 08:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343869AbjJLMXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Oct 2023 08:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CEE4B7
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697113380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aYDuBmS6dJ7clLQo4ci/vZJcyZt1Gee23BbEWs4NHGk=;
        b=h+7QtHE816s3nwjboNWdeHMNCJM9RAwsQiZ8FmPpIVIByg9TZJBwMzUNOM4E4VNJrQIDKa
        nzArbZynZLFVBcPeM6gMBuF/2GM4OC8HMOMCGThHvc/u7wmXTOFo/D9AesRsCA8omAa9Gr
        Ey10Icqoj6jW5C9DasR4NNI9ivNpq+8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-GEVuaC2ZNF-iimNtan76VQ-1; Thu, 12 Oct 2023 08:22:49 -0400
X-MC-Unique: GEVuaC2ZNF-iimNtan76VQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9b98bbf130cso59986266b.2
        for <linux-media@vger.kernel.org>; Thu, 12 Oct 2023 05:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697113368; x=1697718168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYDuBmS6dJ7clLQo4ci/vZJcyZt1Gee23BbEWs4NHGk=;
        b=Q6SzG4IzS0hE2whRfUEsU8xHX529+2PLMu1XNA39SknYCX3CorgogeEvtEkKB4T7ly
         yR3Yv/c7rk3ZaIFxbh8DTOK7X1daG2strTaUXP/llsWcCc/Ghnx/V669eRVDJGAcBR3N
         Ce0cfqnVW4fzaLUo2X8x+o9YW9oqxD4eDGJMjFH4K/bwWkxp9uk/D67oZtJfHPl9xFBH
         C3xq0LYnsuRHlQrSN2wFGQCrhbLUE8AidJNtkw5oQ7Zd/g2Un86Dt2GNLMMiV6Jhxixy
         mRzP5C3V1Lqki8N2tIUJvvpNAc16X2CUQQ3RwOhMVZUv1g77WLRblx0Cs994xtN5mCLm
         uHWw==
X-Gm-Message-State: AOJu0YzLJ9txL3zt7GV71r4Ku3UOsloKi6sspKo5gNqL3xuCrR57Zj4k
        hicisbioVGk2EIfwSrRMz8zQ/6ayvJTW5pxl6seJiYTlNIMcJt+g813lV2OFqniXmgFX9Hkkb7w
        2wa7yAQvrOP/+K0PkbEoMA5U=
X-Received: by 2002:a17:906:7484:b0:9b9:f980:8810 with SMTP id e4-20020a170906748400b009b9f9808810mr14864442ejl.34.1697113367988;
        Thu, 12 Oct 2023 05:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzEJaBOOZo+55cnnNNZwd/v4zyLlu4YXN7lBsNC6XaPyIDnnFGbMXPBrbDB9OsE7DPnQjMTg==
X-Received: by 2002:a17:906:7484:b0:9b9:f980:8810 with SMTP id e4-20020a170906748400b009b9f9808810mr14864423ejl.34.1697113367673;
        Thu, 12 Oct 2023 05:22:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p26-20020a1709060dda00b0099bc08862b6sm11219830eji.171.2023.10.12.05.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 05:22:46 -0700 (PDT)
Message-ID: <186830d2-dd18-7948-b2c5-bcda934ad3e8@redhat.com>
Date:   Thu, 12 Oct 2023 14:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: int3472: Add handshake GPIO function
Content-Language: en-US, nl
To:     Hao Yao <hao.yao@intel.com>,
        Dan Scally <dan.scally@ideasonboard.com>, djrscally@gmail.com,
        Sakari Ailus <sakari.ailus@intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20231007021225.9240-1-hao.yao@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231007021225.9240-1-hao.yao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/7/23 04:12, Hao Yao wrote:
> Handshake pin is used for Lattice MIPI aggregator to enable the
> camera sensor. After pulled up, recommend to wail ~250ms to get
> everything ready.

If this is a pin on the "Lattice MIPI aggregator" and
not on the sensor itself then this really should be
modeled as such and should not be registered as a GPIO
consumed by the sensor since the actual sensor does not
have a handshake pin at all.

Also we really don't want to need to patch all involved
sensor drivers to toggle a handshake pin, especially since
the sensor itself does not physically have this pin.

Can you explain a bit more:

1. What the "Lattice MIPI aggregator" is 
2. What its functions are, does this control reset + pwdn
   GPIOs for the sensor? Voltages to the sensor? Clk
   to the sensor ?
3. How the aggregator is connected to both the main
   CPU/SoC as well as how it is connected to the sensor ?
   Some example diagram would be really helpful here.

Then with this info in hand we can try to come up
with a way how to model this.

Assuming this controls the entire power-up sequence
for the sensor then I think it could be modelled
as a GPIO regulator. This also allows making the
regulator core take care of the necessary delay
between setting the GPIO and trying to talk to
the sensor.

Regards,

Hans



> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/intel/int3472/common.h   | 1 +
>  drivers/platform/x86/intel/int3472/discrete.c | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 655ae3ec0593..3ad4c72afb45 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -23,6 +23,7 @@
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> +#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>  
>  #define INT3472_PDEV_MAX_NAME_LEN				23
>  #define INT3472_MAX_SENSOR_GPIOS				3
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index b644ce65c990..4753161b4080 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -111,6 +111,10 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
>  		*func = "power-enable";
>  		*polarity = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_HANDSHAKE:
> +		*func = "handshake";
> +		*polarity = GPIO_ACTIVE_HIGH;
> +		break;
>  	default:
>  		*func = "unknown";
>  		*polarity = GPIO_ACTIVE_HIGH;
> @@ -201,6 +205,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	switch (type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  	case INT3472_GPIO_TYPE_POWERDOWN:
> +	case INT3472_GPIO_TYPE_HANDSHAKE:
>  		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>  		if (ret)
>  			err_msg = "Failed to map GPIO pin to sensor\n";

