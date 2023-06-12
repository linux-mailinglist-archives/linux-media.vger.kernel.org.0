Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FE972CA1C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 17:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237841AbjFLPbB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 11:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235312AbjFLPan (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 11:30:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8093E71;
        Mon, 12 Jun 2023 08:30:28 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F603838;
        Mon, 12 Jun 2023 17:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686583797;
        bh=95hm2BR913/Pw2zJNHrWtrbznU22TRkeSXOWbNMzpX4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Alq0wX78j6Qdv28hGUUa4MYIG13salKSxGCvis5105Eg9gsd15AclwhSC/YNP3rvY
         pWc0lgt3RaaW991qeZ3Yv1ZKbFA1A1yAveHVB3LN9i1XAr1sl/543+0V2Qq/Jzy9yT
         Dzk6G4FL7IuMrZL2++AZpfIJfjJH7kHSFi9VUIxA=
Message-ID: <3238cbe3-b1ef-8cce-442f-b8b82ed1df76@ideasonboard.com>
Date:   Mon, 12 Jun 2023 16:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if the
 pin-numbers don't match
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230612141632.5232-1-hdegoede@redhat.com>
 <20230612141632.5232-2-hdegoede@redhat.com>
 <be624721-b150-010d-f78d-1815db65bb8f@ideasonboard.com>
 <b20a54d0-2c3d-0b78-723d-78801f55cc08@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <b20a54d0-2c3d-0b78-723d-78801f55cc08@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On 12/06/2023 16:26, Hans de Goede wrote:
> Hi,
>
> On 6/12/23 16:20, Dan Scally wrote:
>> Hi Hans
>>
>> On 12/06/2023 15:16, Hans de Goede wrote:
>>> The INT3472 discrete code assumes that the ACPI GPIO resources are
>>> in the same order as the pin-info _DSM entries.
>>>
>>> The returned pin-info includes the pin-number in bits 15-8. Add a check
>>> that this matches with the ACPI GPIO resource pin-number in case
>>> the assumption is not true with some ACPI tables.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> That seems like a good idea to me:
>>
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Thanks. Did you also see my:
> "[PATCH 0/4] platform/x86: int3472: discrete: Regulator rework / Lenovo Miix 510 support"
>
> series ? It would be great if I can get your input on that.
>
> Personally I'm not entirely happy with patch 3/4 there,
> but I don't really see any other way of solving
> the issue on the mix 510 that 3/4 fixes.


I did; I was hoping to go through the ov2680 set and that set today but I've been a bit busy; I'll 
try to look at and test both asap.

>
> Regards,
>
> Hans
>
>
>>> ---
>>>    drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++++-
>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>>> index 4ef60883154d..c1132bbbff41 100644
>>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>>> @@ -149,8 +149,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>>    {
>>>        struct int3472_discrete_device *int3472 = data;
>>>        struct acpi_resource_gpio *agpio;
>>> +    u8 active_value, pin, type;
>>>        union acpi_object *obj;
>>> -    u8 active_value, type;
>>>        const char *err_msg;
>>>        const char *func;
>>>        u32 polarity;
>>> @@ -174,10 +174,18 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>>            return 1;
>>>        }
>>>    +    /* Bits 7-0 contain the type/function of the pin */
>>>        type = obj->integer.value & 0xff;
>>>          int3472_get_func_and_polarity(type, &func, &polarity);
>>>    +    /* Bits 15-8 contain the pin-number on the GPIO chip */
>>> +    pin = (obj->integer.value >> 8) & 0xff;
>>> +    if (pin != agpio->pin_table[0])
>>> +        dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
>>> +             func, agpio->resource_source.string_ptr, pin,
>>> +             agpio->pin_table[0]);
>>> +
>>>        /* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
>>>        active_value = (obj->integer.value >> 24) & 0xff;
>>>        if (!active_value)
