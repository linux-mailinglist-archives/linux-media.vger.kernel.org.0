Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6989D715B31
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 12:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbjE3KN4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 06:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjE3KNy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 06:13:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DEF116
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685441583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ANz+aVrZr+Q63Kowzn3x2t/159th39sx9WeUesp5vDY=;
        b=AtRMbwzJLiLDef+csve2lZ6fvQuhvsHArdvEgHtTK1bko6QLu5YxGVRPQ3BNqZ5vW88zoN
        hU6uU6DDnKOJjHRiH1WZ4vxGkFnEWz6UD1zRrRiXGcITTIzQFi5PICc1EC+nnnjq0Hp0zU
        2phkBSs2lEyyhOOxtLTOu/oM6QLwX3s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-eQcZtijrMNOnxRB4asZJiA-1; Tue, 30 May 2023 06:13:01 -0400
X-MC-Unique: eQcZtijrMNOnxRB4asZJiA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-97005627685so462130466b.2
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 03:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685441580; x=1688033580;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANz+aVrZr+Q63Kowzn3x2t/159th39sx9WeUesp5vDY=;
        b=DQyEs1sUPznzbVpMq9+9+ttRYxnxRlisSkiYmzHroflV9Qbrf//ZQFsh9M0dGx6Jp9
         wjoIIUHBwkxuf9lY3MqNmsFKaZ6kmifp9fgEedav93dhTzBgvZJLJP19IpZhOpV+aQwn
         Ird9tSF5IjI6LVL1jru/LZOrznCXQ1hVSrEkmVDHy0nNzm74tn/3K8hhBoPZKTzEqfrn
         1BYY7Kmzeiz0psPp17qeXs9HnSYo7wbf0Hv2vJyG2+cxS4QMDu6Zz+9aeniboJIOIyLY
         mHInIlpWcqbRATAL0TEKXiIa9RH1deYcu4MRAaSt4jJ/D2sZm8YoBhY8wYTNqRiVhfL/
         R0rA==
X-Gm-Message-State: AC+VfDzmrpuMNB7p8eGSgCCdNlJXt841h3MD3whs4getwCbohzVMw/hk
        va2qI7YqssKe16b+5648NArY8epVABKfE8z13W8WKq5/177kWoTBesViJqBz2sLjrXgFKwkZ6St
        Aes3E8zPHt4xj28QE/n00N6I=
X-Received: by 2002:a17:907:2d29:b0:96a:f8dc:34d9 with SMTP id gs41-20020a1709072d2900b0096af8dc34d9mr1929677ejc.17.1685441580676;
        Tue, 30 May 2023 03:13:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4LOuUmYprncWCyuW8Ztce+JhsuvFkV/pg36bwO9IdIUA8HY7fPmuKHgW5raGhVOBPnO5pGTQ==
X-Received: by 2002:a17:907:2d29:b0:96a:f8dc:34d9 with SMTP id gs41-20020a1709072d2900b0096af8dc34d9mr1929665ejc.17.1685441580365;
        Tue, 30 May 2023 03:13:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gr10-20020a170906e2ca00b0096ace550467sm7246839ejb.176.2023.05.30.03.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:12:59 -0700 (PDT)
Message-ID: <5f270ccb-6871-742b-204f-80e5a7d7c5c6@redhat.com>
Date:   Tue, 30 May 2023 12:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/3] platform/x86: int3472: Avoid crash in unregistering
 regulator gpio
Content-Language: en-US, nl
To:     bingbu.cao@intel.com, djrscally@gmail.com,
        dan.scally@ideasonboard.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        bingbu.cao@linux.intel.com
References: <20230524035135.90315-1-bingbu.cao@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230524035135.90315-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/24/23 05:51, bingbu.cao@intel.com wrote:
> From: Hao Yao <hao.yao@intel.com>
> 
> When int3472 is loaded before GPIO driver, acpi_get_and_request_gpiod()
> failed but the returned gpio descriptor is not NULL, it will cause panic
> in later gpiod_put(), so set the gpio_desc to NULL in register error
> handling to avoid such crash.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

For the clk-enable GPIO this is not really necessary:

void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
{
        if (!int3472->clock.cl)
                return;

	...
	gpiod_put(int3472->clock.ena_gpio);
}

The int3472->clock.cl check causes the gpiod_put() to never get called.

But setting both GPIOs to NULL when we fail to get them is consistent,
so I have taken this as is:

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans






> ---
>  .../x86/intel/int3472/clk_and_regulator.c        | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index 1086c3d83494..d1088be5af78 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -101,9 +101,12 @@ int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
>  
>  	int3472->clock.ena_gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
>  							     "int3472,clk-enable");
> -	if (IS_ERR(int3472->clock.ena_gpio))
> -		return dev_err_probe(int3472->dev, PTR_ERR(int3472->clock.ena_gpio),
> -				     "getting clk-enable GPIO\n");
> +	if (IS_ERR(int3472->clock.ena_gpio)) {
> +		ret = PTR_ERR(int3472->clock.ena_gpio);
> +		int3472->clock.ena_gpio = NULL;
> +		return dev_err_probe(int3472->dev, ret,
> +				     "failed to get gpio for clock\n");
> +	}
>  
>  	if (polarity == GPIO_ACTIVE_LOW)
>  		gpiod_toggle_active_low(int3472->clock.ena_gpio);
> @@ -199,8 +202,11 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  	int3472->regulator.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
>  							     "int3472,regulator");
>  	if (IS_ERR(int3472->regulator.gpio)) {
> -		dev_err(int3472->dev, "Failed to get regulator GPIO line\n");
> -		return PTR_ERR(int3472->regulator.gpio);
> +		ret = PTR_ERR(int3472->regulator.gpio);
> +		int3472->regulator.gpio = NULL;
> +
> +		return dev_err_probe(int3472->dev, ret,
> +				     "failed to get regulator gpio\n");
>  	}
>  
>  	/* Ensure the pin is in output mode and non-active state */

