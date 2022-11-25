Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9E2638957
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 13:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiKYMBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 07:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKYMBV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 07:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CC72FFF8
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669377622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r/npwORXil08CsJrGDu62pK6Sn8ZbcXWTcMHtEBArOs=;
        b=cnFk4ElIg82AuDkfVLAXQ6tCcDYDkbyYqqcYBSb8x/TOudh6pGbuPt5XNmj1pPFB2BGVsC
        qcLIxmlntxjVuzIhgfY9d0N//iWNZLhYV7BrWb2BOy2q8LLNBU17rJ4WuY/7oIWcYQVKYN
        gziwBj/Dq9+g57kk5Y+FsY4IaNDIshg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-292-rBZppCAeO8Oagg3N2IIOrA-1; Fri, 25 Nov 2022 07:00:19 -0500
X-MC-Unique: rBZppCAeO8Oagg3N2IIOrA-1
Received: by mail-ed1-f71.google.com with SMTP id f17-20020a056402355100b00466481256f6so2514585edd.19
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 04:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/npwORXil08CsJrGDu62pK6Sn8ZbcXWTcMHtEBArOs=;
        b=gPGZYzkYmSIJvbmjKYtLI3QzGiJIQgLKIMiHwDmSqbm/XwY88k1PpRHKSFtbQ2GLBi
         vJvpuYK5ArwKLAadu+JAt/Q/IoX8JgZd8VMDX/xLbqzbUuV2TUd9jShU9Nm8m0MrCpjA
         HDdllwemy+dHWT+LBRoO6Gu8Q/yTB3ymdSci/nzjpliW/766KyEMWfO1z2o1Dgoia2tP
         msQ25VNwX7nvoz1HSv+Vt/ZB2L/AiuYcvTOHpUOVJXUC+MKLDkyIfEz3qOgVHsR1ykZv
         0wV/QhHJrio0u26aaA7ho4k3ElaGvWc1hhIhP08tOXQTJgEVhu2T9pj4PMIv8aZlC8sI
         K52A==
X-Gm-Message-State: ANoB5plUw2W6iFXT9t3cC6Qb5+csxiIn+7qG9hyw0bnIWo77XHSS3fM2
        HkyRfDxelx/8uvHqtUq8SGisY9Q/WNrhcmzrTpb3YAvblsVpHp1SorFrqJH8tmO7MP3gptsKOe1
        0K/9JQk4k4leDa78sAcwE8Wk=
X-Received: by 2002:a05:6402:2488:b0:467:3ea1:acdd with SMTP id q8-20020a056402248800b004673ea1acddmr35687692eda.96.1669377617987;
        Fri, 25 Nov 2022 04:00:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5edOvOgzc6NTtHGOlukFuuu7h7INKQYLe2iFiQ+JUokh6NtbX9yTzulmEBKrcjmMs3E88zZg==
X-Received: by 2002:a05:6402:2488:b0:467:3ea1:acdd with SMTP id q8-20020a056402248800b004673ea1acddmr35687673eda.96.1669377617774;
        Fri, 25 Nov 2022 04:00:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p24-20020a056402075800b0046191f5e946sm1681710edy.21.2022.11.25.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 04:00:17 -0800 (PST)
Message-ID: <e901dc0c-1961-e05d-80f0-2754e41a871a@redhat.com>
Date:   Fri, 25 Nov 2022 13:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <Y4ChnCHkV9RufccT@smile.fi.intel.com>
 <aa42a60b-fe34-a418-3ada-af55f260592e@ideasonboard.com>
 <8f736a26-9942-4fda-0237-313da5bf9c6b@redhat.com>
 <7cb28706-f929-4a5b-9ab9-3e914e7488f0@ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7cb28706-f929-4a5b-9ab9-3e914e7488f0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/25/22 12:42, Dan Scally wrote:
> Hi
> 
> On 25/11/2022 11:23, Hans de Goede wrote:
>> Hi,
>>
>> On 11/25/22 12:11, Dan Scally wrote:
>>> On 25/11/2022 11:06, Andy Shevchenko wrote:
>>>> On Fri, Nov 25, 2022 at 12:58:46PM +0200, Laurent Pinchart wrote:
>>>>> On Fri, Nov 25, 2022 at 10:17:17AM +0000, Dan Scally wrote:
>>>> ...
>>>>
>>>>> Can the LED framework be used without having the LED exposed to
>>>>> userspace ?
>>>> I believe the correct question here is "can the states of some leds be
>>>> read-only from user perspective" (this way any changes into led subsystems
>>>> looks less intrusive, esp. taking into account that subsystem is de facto
>>>> unmaintained).
>>>>
>>> I think the answer to that is yes:
>>>
>>>
>>> https://elixir.bootlin.com/linux/latest/source/drivers/leds/led-class.c#L47
>> Interesting, I did not know that. But what is the added value of
>> using the LED subsytem then for a simple only on/off LED driven
>> by a GPIO?
> 
> 
> Well I suppose it depends on the LED. In the flash case the v4l2 framework disables the sysfs interface for the LED whilst it holds the flash subdev open, which should mean that no nefarious program could turn off the LED whilst it was running the camera but because the sysfs is enabled whilst the v4l2 subdev is closed [1] you could still use that LED as a torch outside of camera streaming. That's probably not a situation that's likely to occur with a privacy LED given they're likely to be much less bright though I suppose, and maybe it's right to treat them differently.
> 
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-flash-led-class.c#L632

If we only disable the sysfs access temporarily then spy-ware in userspace
can still just clear the trigger, so we would need to permanently
disable userspace access (or decide to not disable userspace access
at all).

>> One of the challenges with using LED triggers for the privacy led,
>> is that we need at least 2 triggers: "camera-front" and "camera-back"
>> and then somehow to let what ever code sets the triggers know if
>> it is dealing with the front or back sensor.
> 
> 
> Yes, that is a problem, my plan was to connect them with fwnode and ancillary links, in the same way for example we connected the VCM to the cameras. I think that the int3472-discrete driver would have to do that.

Which would involve a bunch of non trivial code. Where as if we
just model the LED as a GPIO for the sensor-driver to consume
we get this for free.

My conclusion here is:

1. We don't want userspace access because we don't want to make things
easier for spy-ware.

2. Without userspace access there is no added value in using the LED
subsystem and just modelling this as a GPIO is easier / more KISS.

>> Where as with GPIO-s we *bind* them to the sensor i2c_client so if
>> we just have the sensor-driver look for an optional GPIO called
>> "privacy-led" then we don't have this how to we bind the LED to
>> the sensor problem; and if we drop the sysfs interface I fail to
>> see the value in using the LED subsystem for GPIO a driven LED.
>>
>> Also see my other reply for a proposal to be able to share the
>> code dealing with this between sensor drivers (and also remove
>> some other gpio/clk/regulator boilerplate from sensor drivers).
> 
> 
> Yes I certainly find that idea appealing, there is of lot of boilerplate that could be reduced with that idea.

I glad you like the idea. Any suggestions for a better name
for the helper lib / namespace ?

Regards,

Hans


