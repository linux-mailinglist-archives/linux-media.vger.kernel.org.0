Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D024F665A70
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 12:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238298AbjAKLkE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 06:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238344AbjAKLjf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 06:39:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95B0B7E1
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 03:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673436937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aHM2nrq0s6Ww2GRqx6ysR7XCOFH9LRjdLLMrpgZ0h6U=;
        b=GszriPKtmEULQZmluhbNQItDIFMwAxXPGUtMt5oENiSais9Szn5v6Hqd/pNE1uyx3rXtK1
        zS7gSSNHJ4c3NW+xuQ5MO8jUvL5IECsp2yIbCDDa0H83ZcB4App1FGKYOFxF/waK/3g0bw
        QcHt3erf+BerfahFKfT0GTIvrLgFPhQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-LPdhZ5QLPrOliN1aS2hTfA-1; Wed, 11 Jan 2023 06:35:36 -0500
X-MC-Unique: LPdhZ5QLPrOliN1aS2hTfA-1
Received: by mail-ej1-f70.google.com with SMTP id ga21-20020a1709070c1500b007c171be7cd7so10128490ejc.20
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 03:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHM2nrq0s6Ww2GRqx6ysR7XCOFH9LRjdLLMrpgZ0h6U=;
        b=f8uPxSRdexh56tW9/cBkQJNgz6ypneynHVOLixpXbheZYqDrycdmxqOUOqFXnKz+ji
         2YnI9HNWME7FKbS98FouffIUWmbOTQSXuuKQzUOp9Ir/fxZn4U+Akb+iFrccZBKakZX+
         DBFiYWDmq5ZYj2MjdjIEN0ehLIJjDZD0BpMsQGu1jvIAEkReUKumKOMna1THBuuEV9td
         yxaCMFsbP3ptfIjs/NstpRhRINF4BCX23MOU5UEcjVvFix6eobhYNhi5JfHRyfT4jvhI
         DcuEagcPAQiJCVfMt003yajRRMDl8Lela58IxpYK+eu3UrM7Ot4nKKv9EP8YV/RIvRcS
         8rxA==
X-Gm-Message-State: AFqh2koH4O27+R0OTcLZU0nBGktRFAosFkm3XAJishbzxFpx6sYTwsSD
        sFHJH3B9k7++5HybupVqorHsURk3FzuZv6R9dfS4+7HtnBpMA62v7KEMWs+XukMhq55rH443RWw
        kzaCQaZUGzpwMr1ZocVThZcQ=
X-Received: by 2002:a17:906:a19a:b0:7c1:6d65:4718 with SMTP id s26-20020a170906a19a00b007c16d654718mr62940110ejy.33.1673436935053;
        Wed, 11 Jan 2023 03:35:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXugso+wPAehAcdGPV3PaQJQuAyz1wjv3Cn6uo0v71xo5Wz6pAe3kQp44xPM4llry88QH/tdnQ==
X-Received: by 2002:a17:906:a19a:b0:7c1:6d65:4718 with SMTP id s26-20020a170906a19a00b007c16d654718mr62940100ejy.33.1673436934864;
        Wed, 11 Jan 2023 03:35:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a3-20020aa7cf03000000b0049019b48373sm5959303edy.85.2023.01.11.03.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 03:35:34 -0800 (PST)
Message-ID: <7bd5d013-d0d8-8020-d91a-39917fa61f33@redhat.com>
Date:   Wed, 11 Jan 2023 12:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 08/11] platform/x86: int3472/discrete: Create a LED
 class device for the privacy LED
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-9-hdegoede@redhat.com>
 <Y5x9uHm8NnVHc0Lv@smile.fi.intel.com>
 <d3d28b30-a364-66eb-7870-06c43d683bb7@redhat.com>
 <Y5ynWBqkhLB2cHYU@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5ynWBqkhLB2cHYU@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 12/16/22 18:14, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 05:29:13PM +0100, Hans de Goede wrote:
>> On 12/16/22 15:16, Andy Shevchenko wrote:
>>> On Fri, Dec 16, 2022 at 12:30:10PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>> +	if (IS_ERR(int3472->pled.gpio)) {
>>>> +		ret = PTR_ERR(int3472->pled.gpio);
>>>> +		return dev_err_probe(int3472->dev, ret, "getting privacy LED GPIO\n");
>>>
>>> 	return dev_err_probe(...);
>>
>> That goes over 100 chars.
> 
> The point is you don't need ret to be initialized. Moreover, no-one prevents
> you to split the line to two.

The compiler is perfectly capable of optimizing away the store
in ret if that is not necessary; and splitting the line instead
of doing it above will just make the code harder to read.

Also this really is bikeshedding...

> 
>>>> +	}
> 
> ...
> 
>>>> +	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
>>>> +	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
>>>> +		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
>>>
>>>> +	for (i = 0; int3472->pled.name[i]; i++) {
>>>> +		if (int3472->pled.name[i] == ':') {
>>>> +			int3472->pled.name[i] = '_';
>>>> +			break;
>>>> +		}
>>>> +	}
>>>
>>> NIH strreplace().
>>
>> Please look more careful, quoting from the strreplace() docs:
>>
>>  * strreplace - Replace all occurrences of character in string.
>>
>> Notice the *all* and we only want to replace the first ':' here,
>> because the ':' char has a special meaning in LED class-device-names.
> 
> It's still possible to use that, but anyway, the above is still
> something NIH.
> 
> 	char *p;
> 
> 	p = strchr(name, ':');
> 	*p = '_';

Ok, In will switch to this for the next version.

> But either code has an issue if by some reason you need to check if : is ever
> present in acpi_dev_name().

acpi device names are set by this code:

        result = ida_alloc(instance_ida, GFP_KERNEL);
        if (result < 0)
                return result;

        device->pnp.instance_no = result;
        dev_set_name(&device->dev, "%s:%02x", acpi_device_bus_id->bus_id, result);

And the bus_id cannot have a : in it, so there always is a single :.


> 
> The more robust is either to copy acpi_dev_name(), call strreplace(), so you
> will be sure that _all_ : from ACPI device name will be covered and then attach
> the rest.
> 
> ...
> 
>>>> +void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
>>>> +{
>>>> +	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
>>>> +		return;
>>>
>>> This dups the check inside the _unregister() below, right?
>>
>> Right.
>>
>>>> +	led_remove_lookup(&int3472->pled.lookup);
>>>
>>> With list_del_init() I believe the above check can be droped.
>>
>> No it cannot, list_del_init() inside led_remove_lookup() would
>> protect against double led_remove_lookup() calls.
>>
>> But here we may have a completely uninitialized list_head on
>> devices without an INT3472 privacy-led, which will trigger
>> either __list_del_entry_valid() errors or lead to NULL
>> pointer derefs.
> 
> But we can initialize that as well...

The standard pattern in the kernel is that INIT_LIST_HEAD()
is only used for list_head-s which are actually used as the head
of the list. list_head-s used to track members of the list are
usually not initialized until they are added to the list.

Doing multiple list-init-s in multiple cases, including
one in *subsystem core code* just to drop an if here seems
counter productive.

Also checking that we can move forward with the unregister
is a good idea regardless of all the called functions being
able to run safely if the register never happened, because
future changes to the unregister function might end up
doing something which is unsafe when the LED was never
registered in the first place.

Regards,

Hans




> 
>>>> +	led_classdev_unregister(&int3472->pled.classdev);
>>>> +	gpiod_put(int3472->pled.gpio);
>>>> +}
> 

