Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6971163A5B1
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 11:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiK1KFl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 05:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiK1KFi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 05:05:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 255F41A208
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 02:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669629874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0kptGvMGHSAx6t8nlMnrJ0d9wUMVGi1jatn/SMhdc8M=;
        b=impGzpQsu8cA3F5ndUj3maCDrBARJutxZiE6LQStczvWu96o/UC4maQSjItFncsqZ+/znW
        TLSI0dNo07O3a/PMnia/otF8rqHXEnHa0EnBupsDlk+du1azJ5s23wEPM3sjbKWzhUMOKz
        14JvGyyIU9FWgmQocQEF1+tAqoAsRqI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-Flgwr7FKOpSUvg3I-_NTzA-1; Mon, 28 Nov 2022 05:04:32 -0500
X-MC-Unique: Flgwr7FKOpSUvg3I-_NTzA-1
Received: by mail-ej1-f72.google.com with SMTP id jg27-20020a170907971b00b007ad9892f5f6so4031135ejc.7
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 02:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0kptGvMGHSAx6t8nlMnrJ0d9wUMVGi1jatn/SMhdc8M=;
        b=BJgfPC99OAXLMUx978IJ3CgxE1rjxofDf+2Xag9f1Uk55Qg33Qc/XBmeBIFeybdZc/
         wOVhiMu3duufk+uDPnttSTKX2HYuzTFaEu/VzzM475Y6yduNzAUH/Pmmrrm2tqJZFxu9
         3wTXWN5rDwRPR562/ly1MkQXWWH+0Ohl+DFwQdfduJrMlIc+WnbJqravoTJcbk1pdvxy
         3WlxoAhdJ3raViwmqoFrjHzK8M0fTUmI8F2dYVxAjIeFsVyhBm1URI1hWYeJcgNX/MSH
         1xZomyuswDzLf3Z1gdJH7oR+PfIx80rk83mwrHB8f7F2d/xBpBmo63YTNHeiv/w9EDb8
         W0fQ==
X-Gm-Message-State: ANoB5pk4vOBd3k0uqVa6mhwh7+sU4QI2MbfQEpOXS6gIS3qLIHrS6b9O
        yYu0av68WozdGjv1tRB53JCj2hfELUvAMinFNStgsVBfG0TupSvHQ1Xokmt3MwKX5gqUuo0qOsg
        8i/dZOQdHAEzVA0ZZWUpNU6s=
X-Received: by 2002:a17:906:3a14:b0:7ad:79c0:4662 with SMTP id z20-20020a1709063a1400b007ad79c04662mr42930023eje.400.1669629871629;
        Mon, 28 Nov 2022 02:04:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4knslyJvMRk31JYSg0uvVLf7rjFniYPZio6qp3KHO4qybsVK7fEvuG2Qij7p6HZSe0jOdtmw==
X-Received: by 2002:a17:906:3a14:b0:7ad:79c0:4662 with SMTP id z20-20020a1709063a1400b007ad79c04662mr42929995eje.400.1669629871327;
        Mon, 28 Nov 2022 02:04:31 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906538300b0078cb06c2ef9sm4747116ejo.8.2022.11.28.02.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 02:04:30 -0800 (PST)
Message-ID: <3606640b-14bf-28c3-cf2a-b8cc93bad07f@redhat.com>
Date:   Mon, 28 Nov 2022 11:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/3] platform/x86: int3472/discrete: Add support for
 sensor-drivers which expect clken + pled GPIOs
Content-Language: en-US
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-4-hdegoede@redhat.com>
 <0fa6d92a-9b3b-cec9-c834-1b530ffe7a68@ideasonboard.com>
 <e7fb85f9-9e39-e33e-61b7-14e02cfafb88@redhat.com>
 <df65983e-547a-5ed7-0a49-812f6e227549@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <df65983e-547a-5ed7-0a49-812f6e227549@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/28/22 08:39, Dan Scally wrote:
> Morning Hans
> 
> On 25/11/2022 18:38, Hans de Goede wrote:
>> Hi,
>>
>> On 11/25/22 17:07, Dan Scally wrote:
>>> Hi Hans
>>>
>>> On 24/11/2022 20:00, Hans de Goede wrote:
>>>> The hm11b1 and ov01a1s sensor drivers shipped with the out of tree IPU6
>>>> driver, expect the clk_en GPIO to be modelled as a "clken" GPIO rather
>>>> then using the clk framework; and the hm11b1, ov01a1s and ov2740 driver
>>>> all 3 expect the privacy-led to be modelled as a "pled" GPIO, rather then
>>>> it being turned on/off at the same time as the clk.
>>>>
>>>> Adjust how we handle the GPIOs on these sensors accordingly, for now at
>>>> least, so that the out of tree driver can work with standard distro kernels
>>>> through e.g. dkms. Otherwise users need to run a patched kernel just for
>>>> this small difference.
>>>>
>>>> This of course needs to be revisited when we mainline these sensor drivers,
>>>> I can imagine the drivers getting clk-framework support when they are
>>>> mainlined and then at that same time their acpi HID can be dropped from
>>>> the use_gpio_for_clk_acpi_ids[] array.
>>>>
>>>> Note there already is a mainline driver for the ov2740, but that is not
>>>> impacted by this change since atm it uses neither the clk framework nor
>>>> a "clken" GPIO.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Maybe we should patch the sensor drivers for sensors supported with
>>>> the IPU3 to also expect the privacy-led to always be a separate GPIO?
>>>>
>>>> This way we can also avoid the camera LED briefly going on at boot,
>>>> when the driver is powering things up to read the sensor's ID register.
>>>>
>>>> And I have also put looking at making the mainline ov2740 driver suitable
>>>> for use with the (out of tree) IPU6 driver on my TODO list.
>>>> ---
>>>>    drivers/platform/x86/intel/int3472/common.h   |  2 +-
>>>>    drivers/platform/x86/intel/int3472/discrete.c | 37 +++++++++++++++----
>>>>    2 files changed, 31 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
>>>> index 53270d19c73a..58647d3084b9 100644
>>>> --- a/drivers/platform/x86/intel/int3472/common.h
>>>> +++ b/drivers/platform/x86/intel/int3472/common.h
>>>> @@ -23,7 +23,7 @@
>>>>    #define INT3472_GPIO_TYPE_PRIVACY_LED                0x0d
>>>>      #define INT3472_PDEV_MAX_NAME_LEN                23
>>>> -#define INT3472_MAX_SENSOR_GPIOS                3
>>>> +#define INT3472_MAX_SENSOR_GPIOS                4
>>>>      #define GPIO_REGULATOR_NAME_LENGTH                21
>>>>    #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH            9
>>>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>>>> index 9159291be28a..bfcf8184db16 100644
>>>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>>>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>>>> @@ -216,6 +216,26 @@ static const char *int3472_dsm_type_to_func(u8 type)
>>>>        return "unknown";
>>>>    }
>>>>    +/*
>>>> + * The hm11b1 and ov01a1s sensor drivers shipped with the out of tree IPU6 driver,
>>>> + * expect the clk_en GPIO to be modelled as a "clken" GPIO rather then as a clk and
>>>> + * the hm11b1, ov01a1s and ov2740 driver all 3 expect the privacy-led to be modelled
>>>> + * as a "pled" GPIO, rather then it being turned on/off at the same time as the clk.
>>>> + *
>>>> + * Note there also is a mainline driver for the ov2740, but that does not use
>>>> + * the clk framework atm either.
>>>> + *
>>>> + * Adjust how we handle the GPIOs on these sensors accordingly, for now at least.
>>>> + * This needs to be revisited when we mainline these sensor drivers / when we merge
>>>> + * the necessary changes in the ov2740 sensor driver so that it can work on the IPU6.
>>>> + */
>>>
>>> I'm not really sure about this one though; wouldn't it be better to alter those sensor drivers to use the clock framework properly?
>> Yes, Laurent more or less said the same thing; and I was already starting
>> to think in this direction myself when typing the cover letter.
>>
>> So yes I agree with you and Laurent. That still leaves the question of what to do
>> with devices with just a privacy LED without a clk-en though.
>>
>> Dan, do you have a list of sensors which currently are known to work / be used
>> together with the IPU3 (and the int3472 discrete code) ?
>>
>> I know I will need to modifi the ov5693 code, but I wonder what other drivers
>> I will need to modify ?
> 
> 
> The ov5693, ov8865 and ov7251 are the upstream working ones. There's a couple more that need changes upstreaming, but I can handle those during that process.

Ok thanks.

>> I think I might just move those sensor-drivers over to using a GPIO
>> for the privacy LED and just always register a GPIO for the privacy LED
>> pin, does that sound like a good idea to you ?
> 
> 
> Well if we can't handle it during the int3472 code then yes - I certainly don't have  a better idea.

I will patch the 3 sensors listed above to take an optional privacy LED GPIO then.

I do plan to work on the sensor_power helper library which I discussed
soon-ish since that should make things a lot easier, but for now I'll
just do this the quick and dirty way, also to make backporting easier
for distros (so that they can have a kernel which works with both
IPU3 and the out-of-tree IPU6 stuff).

Regards,

Hans





> 
>> Anyways it is weekend now and I've already worked too many hours this week,
>> so I'll take a look at this on Monday.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>> +static const struct acpi_device_id use_gpio_for_clk_acpi_ids[] = {
>>>> +    { "HIMX11B1" }, /* hm11b1 */
>>>> +    { "OVTI01AS" }, /* ov01a1s */
>>>> +    { "INT3474" },  /* ov2740 */
>>>> +    {}
>>>> +};
>>>> +
>>>>    /**
>>>>     * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
>>>>     * @ares: A pointer to a &struct acpi_resource
>>>> @@ -293,19 +313,22 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>>>            (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
>>>>          switch (type) {
>>>> +    case INT3472_GPIO_TYPE_CLK_ENABLE:
>>>> +    case INT3472_GPIO_TYPE_PRIVACY_LED:
>>>> +        if (!acpi_match_device_ids(int3472->adev, use_gpio_for_clk_acpi_ids)) {
>>>> +            ret = skl_int3472_map_gpio_to_clk(int3472, agpio, type);
>>>> +            if (ret)
>>>> +                err_msg = "Failed to map GPIO to clock\n";
>>>> +
>>>> +            break;
>>>> +        }
>>>> +        fallthrough;
>>>>        case INT3472_GPIO_TYPE_RESET:
>>>>        case INT3472_GPIO_TYPE_POWERDOWN:
>>>>            ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>>>>            if (ret)
>>>>                err_msg = "Failed to map GPIO pin to sensor\n";
>>>>    -        break;
>>>> -    case INT3472_GPIO_TYPE_CLK_ENABLE:
>>>> -    case INT3472_GPIO_TYPE_PRIVACY_LED:
>>>> -        ret = skl_int3472_map_gpio_to_clk(int3472, agpio, type);
>>>> -        if (ret)
>>>> -            err_msg = "Failed to map GPIO to clock\n";
>>>> -
>>>>            break;
>>>>        case INT3472_GPIO_TYPE_POWER_ENABLE:
>>>>            ret = skl_int3472_register_regulator(int3472, agpio);
> 

