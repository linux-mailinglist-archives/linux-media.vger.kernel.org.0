Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 038D272CA5C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 17:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237991AbjFLPhT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 11:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237415AbjFLPhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 11:37:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083F210CB
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686584193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bnOsvhdJiSt5ITsGhze0Abwe9nSXBIjjDiVkeCUdJn8=;
        b=KD2HxYFNfM0htfdwDXZQW3PjP/vdYwEYw+t+sEXtjSQD4y1cJkoGRGxlsElzsAcZRvqATZ
        542IcqLIDLFp18JtKUDItQScnlBg00iH13EMLNYrNOdUr1c+qeDEUVGi7Fqvo2aVhFpUcS
        AGbcBS7zuLPHr5Xk/hEPFqLHfgPT8S8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-y2YD6Ir3NzWM_n87zlg0dw-1; Mon, 12 Jun 2023 11:36:30 -0400
X-MC-Unique: y2YD6Ir3NzWM_n87zlg0dw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9745c72d99cso521203666b.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 08:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686584190; x=1689176190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnOsvhdJiSt5ITsGhze0Abwe9nSXBIjjDiVkeCUdJn8=;
        b=A3jDMvmsniBmAJXSKWR75nF8AqWBUegAO92ZFbLNZ3KkTKmBxwBVTrK42ET/NEiMnW
         HnfFMVKkGDRW2NhQWtL2ckLMfYCRiCzTo8ugitKrw41x+DXIkjgIw0p1iJq1QCOEwPk3
         V7js9xBCuTV8eP7XD3OtMRno9YUaBy/ylqRZHa5QqbAVgsq8ivCmCXT8oU3mluq7IQuB
         ZMbbdviTnkgGSG/pVobUQsRm/WpDi3aFxW4i+Br9xI2Q1tog5jfEHZtBsrVnk+2Vqkyk
         oU0HZAYQHH9/twoMkHV6+1SgVvC8kkqIFPNjCL7t+v1lakdu8zFQC6iGAxxXVzB/n+u7
         C1GQ==
X-Gm-Message-State: AC+VfDx5bDoj0f6gyIozr5VBlnZ+iZWokuU4iygJmBsG0UCLdsPDpFrm
        TgBm0QXHrTjwFSnvhZ8AXY6sK1mUzKqOvinNedMp1O7lzIsDcgBM+eIsVxgOQAjgy2ACaEkG/k1
        C2ACk4YSTebNXn1Tw07tvnN0=
X-Received: by 2002:a17:907:7e9f:b0:96f:136e:eadd with SMTP id qb31-20020a1709077e9f00b0096f136eeaddmr11804263ejc.66.1686584189761;
        Mon, 12 Jun 2023 08:36:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VRInm7OruhJcl9LnS0pjiwsaX9gaDdgXjmDX4I3gdxv78NBUA+iTL4xOsYTE+EhislcADzw==
X-Received: by 2002:a17:907:7e9f:b0:96f:136e:eadd with SMTP id qb31-20020a1709077e9f00b0096f136eeaddmr11804241ejc.66.1686584189418;
        Mon, 12 Jun 2023 08:36:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h11-20020a1709063c0b00b0097883000525sm5518142ejg.15.2023.06.12.08.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 08:36:28 -0700 (PDT)
Message-ID: <7f7f5382-9441-fd38-81b6-61b0fff5f773@redhat.com>
Date:   Mon, 12 Jun 2023 17:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] platform/x86: int3472: discrete: Log a warning if the
 pin-numbers don't match
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230612141632.5232-1-hdegoede@redhat.com>
 <20230612141632.5232-2-hdegoede@redhat.com>
 <be624721-b150-010d-f78d-1815db65bb8f@ideasonboard.com>
 <b20a54d0-2c3d-0b78-723d-78801f55cc08@redhat.com>
 <3238cbe3-b1ef-8cce-442f-b8b82ed1df76@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3238cbe3-b1ef-8cce-442f-b8b82ed1df76@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/12/23 17:30, Dan Scally wrote:
> Hi Hans
> 
> On 12/06/2023 16:26, Hans de Goede wrote:
>> Hi,
>>
>> On 6/12/23 16:20, Dan Scally wrote:
>>> Hi Hans
>>>
>>> On 12/06/2023 15:16, Hans de Goede wrote:
>>>> The INT3472 discrete code assumes that the ACPI GPIO resources are
>>>> in the same order as the pin-info _DSM entries.
>>>>
>>>> The returned pin-info includes the pin-number in bits 15-8. Add a check
>>>> that this matches with the ACPI GPIO resource pin-number in case
>>>> the assumption is not true with some ACPI tables.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> That seems like a good idea to me:
>>>
>>>
>>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Thanks. Did you also see my:
>> "[PATCH 0/4] platform/x86: int3472: discrete: Regulator rework / Lenovo Miix 510 support"
>>
>> series ? It would be great if I can get your input on that.
>>
>> Personally I'm not entirely happy with patch 3/4 there,
>> but I don't really see any other way of solving
>> the issue on the mix 510 that 3/4 fixes.
> 
> 
> I did; I was hoping to go through the ov2680 set and that set today but I've been a bit busy; I'll try to look at and test both asap.

Ok, thank you.

Note the ov2680 set does not work with the IPU3 yet. I've tried with
the ipu3-capture.sh script after first testing the script with
the ov5693 and my current ov2680 set is missing the link-rate /
pixel-rate v4l2 ctrls.

I plan to continue working on this, adding those ctrls tomorrow.

Regards,

Hans






>>>> ---
>>>>    drivers/platform/x86/intel/int3472/discrete.c | 10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>>>> index 4ef60883154d..c1132bbbff41 100644
>>>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>>>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>>>> @@ -149,8 +149,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>>>    {
>>>>        struct int3472_discrete_device *int3472 = data;
>>>>        struct acpi_resource_gpio *agpio;
>>>> +    u8 active_value, pin, type;
>>>>        union acpi_object *obj;
>>>> -    u8 active_value, type;
>>>>        const char *err_msg;
>>>>        const char *func;
>>>>        u32 polarity;
>>>> @@ -174,10 +174,18 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>>>            return 1;
>>>>        }
>>>>    +    /* Bits 7-0 contain the type/function of the pin */
>>>>        type = obj->integer.value & 0xff;
>>>>          int3472_get_func_and_polarity(type, &func, &polarity);
>>>>    +    /* Bits 15-8 contain the pin-number on the GPIO chip */
>>>> +    pin = (obj->integer.value >> 8) & 0xff;
>>>> +    if (pin != agpio->pin_table[0])
>>>> +        dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
>>>> +             func, agpio->resource_source.string_ptr, pin,
>>>> +             agpio->pin_table[0]);
>>>> +
>>>>        /* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
>>>>        active_value = (obj->integer.value >> 24) & 0xff;
>>>>        if (!active_value)
> 

