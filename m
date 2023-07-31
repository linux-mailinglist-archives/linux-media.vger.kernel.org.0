Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F604769803
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 15:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjGaNtK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 09:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbjGaNtB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 09:49:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E51A1993
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 06:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690811277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yXcqwkN+Tw99+7xaIf4kxuYRuCo9EteFFPrM9MEBiKU=;
        b=i+oIH25NEMmNCG4EsCsLNORLaQ2cHy/EjG53tC55hIJ0VUhH0qJ0Ugv7W08vD/f70uf5iM
        bBrt+kR0wmayrG8bHUurSgB1CHqwhe98mRxegwCfYTlFEoYqWyWSkd9R3uk8W/mbGu3Hpw
        VRcGfUerUegFP2FJExGA/OICfv27k2Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-RUI0CW5ZM6K9l7cZ7SPZiw-1; Mon, 31 Jul 2023 09:47:55 -0400
X-MC-Unique: RUI0CW5ZM6K9l7cZ7SPZiw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bfe6a531bso151958366b.1
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 06:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690811274; x=1691416074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXcqwkN+Tw99+7xaIf4kxuYRuCo9EteFFPrM9MEBiKU=;
        b=Lx8k3FoPqFnI9dTkQ/mkGK1UIJF0ndoCQxgE/77PoLFfOfADUCDRuRx8NqP2YRwpbs
         SvxGI9Gk6FDwm8opQtiX9dQsj9olsmH6itthnGoGm12+3gkmjezpFcCwSXxiL5iemNas
         HJTpcWCRc+HJfx7I183+Jyn0vMDF3v8mcpiYW5AgRy8GN0w4HDs2PI+AerADHAGKUFNR
         l/pGja/4DL7VJggF+FBVPwn1P4o3GOSF/1El14VIznXT8yRSFvWjKgSEAkm++SQHZ+hg
         4Q4TfvW/nG/Ub6LkXfPUK/aF+8yBJvVoGcn8B55jEhTZrAQ9VtHWC3NGY+sPA+3Ltor1
         UcdQ==
X-Gm-Message-State: ABy/qLZ1cs3dp9R86PnahJxt4i2bwIIg89jKGUv8kWLm3iCLxb0ktJZf
        rQJIgNpBqUPDDBpO1mqAa/xw8vBnV4ZFmlah6Z211PkBse2BSqOuZug/+3qCXyEYQWj/r3aiMaL
        /qp5mQ/zYrUDp8A4XJfCxTv0=
X-Received: by 2002:a17:906:2253:b0:99b:ca5d:1467 with SMTP id 19-20020a170906225300b0099bca5d1467mr6711537ejr.60.1690811274772;
        Mon, 31 Jul 2023 06:47:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHm6r6A9GSJ+nAsgIu/b671AxJs7mbsMl5TLy/M0tTlDIrl0QIS9YwaHQk32zfiCp8xYtyXbQ==
X-Received: by 2002:a17:906:2253:b0:99b:ca5d:1467 with SMTP id 19-20020a170906225300b0099bca5d1467mr6711519ejr.60.1690811274401;
        Mon, 31 Jul 2023 06:47:54 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y6-20020a1709064b0600b00991bba473e2sm6164687eju.85.2023.07.31.06.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:47:53 -0700 (PDT)
Message-ID: <34b28753-33de-1e3a-d8ec-08fc76dac822@redhat.com>
Date:   Mon, 31 Jul 2023 15:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 14/29] media: ov2680: Add support for more clk setups
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-15-hdegoede@redhat.com>
 <ZMesmcoad6ez8kst@kekkonen.localdomain>
 <2593f770-dca5-c368-7776-a2b938fbd09e@redhat.com>
 <ZMe4kktsgQ7nrr+t@kekkonen.localdomain>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZMe4kktsgQ7nrr+t@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/31/23 15:35, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Jul 31, 2023 at 02:54:13PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 7/31/23 14:44, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Tue, Jun 27, 2023 at 03:18:15PM +0200, Hans de Goede wrote:
>>>> On ACPI systems the following 2 scenarios are possible:
>>>>
>>>> 1. The xvclk is fully controlled by ACPI powermanagement, so there
>>>>    is no "xvclk" for the driver to get (since it is abstracted away).
>>>>    In this case there will be a "clock-frequency" device property
>>>>    to tell the driver the xvclk rate.
>>>>
>>>> 2. There is a xvclk modelled in the clk framework for the driver,
>>>>    but the clk-generator may not be set to the right frequency
>>>>    yet. In this case there will also be a "clock-frequency" device
>>>>    property and the driver is expected to set the rate of the xvclk
>>>>    through this frequency through the clk framework.
>>>>
>>>> Handle both these scenarios by switching to devm_clk_get_optional()
>>>> and checking for a "clock-frequency" device property.
>>>>
>>>> This is modelled after how the same issue was fixed for the ov8865 in
>>>> commit 73dcffeb2ff9 ("media: i2c: Support 19.2MHz input clock in ov8865").
>>>>
>>>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/media/i2c/ov2680.c | 26 ++++++++++++++++++++++++--
>>>>  1 file changed, 24 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>>>> index b7c23286700e..a6a83f0e53f3 100644
>>>> --- a/drivers/media/i2c/ov2680.c
>>>> +++ b/drivers/media/i2c/ov2680.c
>>>> @@ -698,6 +698,7 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>>>>  {
>>>>  	struct device *dev = sensor->dev;
>>>>  	struct gpio_desc *gpio;
>>>> +	unsigned int rate = 0;
>>>>  	int ret;
>>>>  
>>>>  	/*
>>>> @@ -718,13 +719,34 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>>>>  
>>>>  	sensor->pwdn_gpio = gpio;
>>>>  
>>>> -	sensor->xvclk = devm_clk_get(dev, "xvclk");
>>>> +	sensor->xvclk = devm_clk_get_optional(dev, "xvclk");
>>>>  	if (IS_ERR(sensor->xvclk)) {
>>>>  		dev_err(dev, "xvclk clock missing or invalid\n");
>>>>  		return PTR_ERR(sensor->xvclk);
>>>>  	}
>>>>  
>>>> -	sensor->xvclk_freq = clk_get_rate(sensor->xvclk);
>>>> +	/*
>>>> +	 * We could have either a 24MHz or 19.2MHz clock rate from either DT or
>>>> +	 * ACPI... but we also need to support the weird IPU3 case which will
>>>> +	 * have an external clock AND a clock-frequency property. Check for the
>>>
>>> Where does this happen? This puts the driver in an awful situation. :-(
>>
>> This happens on IPU3 setups where the INT3472 device represents an actual
>> i2c attached sensor PMIC (rather then just some GPIOs) in this case
>> there is a clk generator inside the PMIC which is used and that is programmable,
>> so the driver needs to set the clk-rate.
>>
>> Note this patch is pretty much a 1:1 copy of the same patch for the ov8865
>> and ov7251 drivers.
>>
>> I guess it might be good to start a discussion about doing this more
>> elegantly but that seems out of scope for this series.
> 
> Works for me.
> 
> Do you happen to know which systems use the clock generator feature of the
> PMIC?

This is used at least on the Microsoft Surface Go devices most folks use for IPU3 development.



 
 and have the tps68470 
> 
> I guess it could be as simple as putting this to tps68470 platform data for
> the clock. And then hope no other PMICs will be used with this format.

Right, after your email from earlier today I was actually thinking along the following lines to fix this:

1. There already is a struct tps68470_clk_platform_data which currently just contains the consumer dev_name() + con-id, we could extend this with an init_clk_rate member

2. Have the int3472 glue code fill init_clk_rate with info from the sensor's SSDB. This does require the int3472 code to make an extra SSDB() ACPI call. The ssdb struct definition has moved to include/media/ipu-bridge.h now, so that is already shared.

3. Make the tps68470 driver set the clk-rate to init_clk_rate if that is set to non 0

Then the clk_set_rate() call can be dropped from the drivers, note we do still need the other complexity with getting the clk + then getting the rate from the clk with a fallback to the property.

AFAICT doing this in a follow up series seems quite doable.

Regards,

Hans



