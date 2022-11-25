Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4525639001
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 19:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiKYSje (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 13:39:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiKYSjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 13:39:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F178C65D9
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 10:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669401511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oVFt4OOYHWXEHQBp4UYCRdZAKrVLk0eN3Eg8qXa0JLo=;
        b=U1qoKyqRc2hex1cLtk+2+HpABehsj1E6760K1LZcJG2ubuVFzFyBqq1egrPM/yt6PsfU+S
        S447hcnAKVqsYC68BxSSiJbiRobqTwfmCwjfvR6pBdHTJm2Z2e6MsbJjfIiD+pb40aPLjx
        jAvEWT7M4LjEb6RGTqntr50e0Ub9CWY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-6J75OwPqNmOuO7lFKSQ0aw-1; Fri, 25 Nov 2022 13:38:29 -0500
X-MC-Unique: 6J75OwPqNmOuO7lFKSQ0aw-1
Received: by mail-ej1-f71.google.com with SMTP id dn14-20020a17090794ce00b007ae5d040ca8so2554708ejc.17
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 10:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVFt4OOYHWXEHQBp4UYCRdZAKrVLk0eN3Eg8qXa0JLo=;
        b=S5pFa3plhB6ULWIHQYpiNTfCIuJy01kVeRvSLTmD1NUYJmxIRpmiSp9Elh3t2HWy9H
         p9Bzy+Q8GUEKfpCSvBf0SbB8xGm+75p2c9IZqlC4N2xBcW0wygFiSzU0r84j3YTTm6FE
         iWrVMwbllT88ZAMXq5A64ROEDcLrB1raw4QD7g0qD5Kg4bmSsJhuliHD3vd1STZpsq1p
         NKabovUSbkTLEecBVFnlULkGczlz45qo9lzBZeIlO/BSzHhZ7sJfffIpoxi1qbpL0qPL
         rODRMFyt621tXqiJJvIBNoGzkx877gvaiJtui7aYpNSmlmx/1HzlDUVX5F71liTBjcBX
         H2gg==
X-Gm-Message-State: ANoB5pnLaCBTBHp8V9Tphy4Y51QfVLa2TI4aUGK7vlvX3PsJheNZEhj6
        qxb8VLGAZ6bC//Lm77dwB6tE7Bc6KupP5FwwEFVGHWYoVINM+ZDAvtRGFvjXDKdgoFsM3saYd4W
        ce8pvI7mZ681hcDTqLBPUevA=
X-Received: by 2002:a05:6402:3c9:b0:46a:b56d:92d with SMTP id t9-20020a05640203c900b0046ab56d092dmr4803172edw.336.1669401508476;
        Fri, 25 Nov 2022 10:38:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5EbNgkTUc1iVKYZFHB9gb5KYPqUxOjv1R5Yom9zaWt3o+4st1DjiHbvmtKc8onMTe8jYzKvw==
X-Received: by 2002:a05:6402:3c9:b0:46a:b56d:92d with SMTP id t9-20020a05640203c900b0046ab56d092dmr4803153edw.336.1669401508244;
        Fri, 25 Nov 2022 10:38:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id y5-20020aa7ccc5000000b0045b3853c4b7sm2057068edt.51.2022.11.25.10.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 10:38:27 -0800 (PST)
Message-ID: <e7fb85f9-9e39-e33e-61b7-14e02cfafb88@redhat.com>
Date:   Fri, 25 Nov 2022 19:38:26 +0100
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0fa6d92a-9b3b-cec9-c834-1b530ffe7a68@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/25/22 17:07, Dan Scally wrote:
> Hi Hans
> 
> On 24/11/2022 20:00, Hans de Goede wrote:
>> The hm11b1 and ov01a1s sensor drivers shipped with the out of tree IPU6
>> driver, expect the clk_en GPIO to be modelled as a "clken" GPIO rather
>> then using the clk framework; and the hm11b1, ov01a1s and ov2740 driver
>> all 3 expect the privacy-led to be modelled as a "pled" GPIO, rather then
>> it being turned on/off at the same time as the clk.
>>
>> Adjust how we handle the GPIOs on these sensors accordingly, for now at
>> least, so that the out of tree driver can work with standard distro kernels
>> through e.g. dkms. Otherwise users need to run a patched kernel just for
>> this small difference.
>>
>> This of course needs to be revisited when we mainline these sensor drivers,
>> I can imagine the drivers getting clk-framework support when they are
>> mainlined and then at that same time their acpi HID can be dropped from
>> the use_gpio_for_clk_acpi_ids[] array.
>>
>> Note there already is a mainline driver for the ov2740, but that is not
>> impacted by this change since atm it uses neither the clk framework nor
>> a "clken" GPIO.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Maybe we should patch the sensor drivers for sensors supported with
>> the IPU3 to also expect the privacy-led to always be a separate GPIO?
>>
>> This way we can also avoid the camera LED briefly going on at boot,
>> when the driver is powering things up to read the sensor's ID register.
>>
>> And I have also put looking at making the mainline ov2740 driver suitable
>> for use with the (out of tree) IPU6 driver on my TODO list.
>> ---
>>   drivers/platform/x86/intel/int3472/common.h   |  2 +-
>>   drivers/platform/x86/intel/int3472/discrete.c | 37 +++++++++++++++----
>>   2 files changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
>> index 53270d19c73a..58647d3084b9 100644
>> --- a/drivers/platform/x86/intel/int3472/common.h
>> +++ b/drivers/platform/x86/intel/int3472/common.h
>> @@ -23,7 +23,7 @@
>>   #define INT3472_GPIO_TYPE_PRIVACY_LED                0x0d
>>     #define INT3472_PDEV_MAX_NAME_LEN                23
>> -#define INT3472_MAX_SENSOR_GPIOS                3
>> +#define INT3472_MAX_SENSOR_GPIOS                4
>>     #define GPIO_REGULATOR_NAME_LENGTH                21
>>   #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH            9
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index 9159291be28a..bfcf8184db16 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -216,6 +216,26 @@ static const char *int3472_dsm_type_to_func(u8 type)
>>       return "unknown";
>>   }
>>   +/*
>> + * The hm11b1 and ov01a1s sensor drivers shipped with the out of tree IPU6 driver,
>> + * expect the clk_en GPIO to be modelled as a "clken" GPIO rather then as a clk and
>> + * the hm11b1, ov01a1s and ov2740 driver all 3 expect the privacy-led to be modelled
>> + * as a "pled" GPIO, rather then it being turned on/off at the same time as the clk.
>> + *
>> + * Note there also is a mainline driver for the ov2740, but that does not use
>> + * the clk framework atm either.
>> + *
>> + * Adjust how we handle the GPIOs on these sensors accordingly, for now at least.
>> + * This needs to be revisited when we mainline these sensor drivers / when we merge
>> + * the necessary changes in the ov2740 sensor driver so that it can work on the IPU6.
>> + */
> 
> 
> I'm not really sure about this one though; wouldn't it be better to alter those sensor drivers to use the clock framework properly?

Yes, Laurent more or less said the same thing; and I was already starting
to think in this direction myself when typing the cover letter.

So yes I agree with you and Laurent. That still leaves the question of what to do
with devices with just a privacy LED without a clk-en though.

Dan, do you have a list of sensors which currently are known to work / be used
together with the IPU3 (and the int3472 discrete code) ?

I know I will need to modifi the ov5693 code, but I wonder what other drivers
I will need to modify ?

I think I might just move those sensor-drivers over to using a GPIO
for the privacy LED and just always register a GPIO for the privacy LED
pin, does that sound like a good idea to you ?

Anyways it is weekend now and I've already worked too many hours this week,
so I'll take a look at this on Monday.

Regards,

Hans



>> +static const struct acpi_device_id use_gpio_for_clk_acpi_ids[] = {
>> +    { "HIMX11B1" }, /* hm11b1 */
>> +    { "OVTI01AS" }, /* ov01a1s */
>> +    { "INT3474" },  /* ov2740 */
>> +    {}
>> +};
>> +
>>   /**
>>    * skl_int3472_handle_gpio_resources: Map PMIC resources to consuming sensor
>>    * @ares: A pointer to a &struct acpi_resource
>> @@ -293,19 +313,22 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>           (polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
>>         switch (type) {
>> +    case INT3472_GPIO_TYPE_CLK_ENABLE:
>> +    case INT3472_GPIO_TYPE_PRIVACY_LED:
>> +        if (!acpi_match_device_ids(int3472->adev, use_gpio_for_clk_acpi_ids)) {
>> +            ret = skl_int3472_map_gpio_to_clk(int3472, agpio, type);
>> +            if (ret)
>> +                err_msg = "Failed to map GPIO to clock\n";
>> +
>> +            break;
>> +        }
>> +        fallthrough;
>>       case INT3472_GPIO_TYPE_RESET:
>>       case INT3472_GPIO_TYPE_POWERDOWN:
>>           ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>>           if (ret)
>>               err_msg = "Failed to map GPIO pin to sensor\n";
>>   -        break;
>> -    case INT3472_GPIO_TYPE_CLK_ENABLE:
>> -    case INT3472_GPIO_TYPE_PRIVACY_LED:
>> -        ret = skl_int3472_map_gpio_to_clk(int3472, agpio, type);
>> -        if (ret)
>> -            err_msg = "Failed to map GPIO to clock\n";
>> -
>>           break;
>>       case INT3472_GPIO_TYPE_POWER_ENABLE:
>>           ret = skl_int3472_register_regulator(int3472, agpio);
> 

