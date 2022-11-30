Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9487163DAC0
	for <lists+linux-media@lfdr.de>; Wed, 30 Nov 2022 17:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiK3Qf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Nov 2022 11:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiK3Qf4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Nov 2022 11:35:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3DE4AF00
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 08:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669826099;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ykv46HoHJsKjboHcMm93CTGhjBNnlsrLv9WEv8+JXlk=;
        b=AlAzIOXaR9ElqL2dvx7nEwZ3/UjyPFf2xlBYvzs5oHkOurget8N6R7VrpdYKkIrOCRBRLx
        Zm9J1GYUY9VP5pkCxfBpqG53m0WQ0lQ5LDelp1rDQTL0Fyh/Bu6vLe+HkgT+BtErbghk1J
        PMDuZHgm8GwQ8qIGhEBPPAelklHmfAs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-Koyr-xh-PRO2xKhKcgF5nA-1; Wed, 30 Nov 2022 11:34:58 -0500
X-MC-Unique: Koyr-xh-PRO2xKhKcgF5nA-1
Received: by mail-ej1-f70.google.com with SMTP id sd31-20020a1709076e1f00b007ae63b8d66aso8823416ejc.3
        for <linux-media@vger.kernel.org>; Wed, 30 Nov 2022 08:34:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ykv46HoHJsKjboHcMm93CTGhjBNnlsrLv9WEv8+JXlk=;
        b=zWn0ZmDI16m695kHq9CEiTEcofatxML4ropd6Nw54POOpsTLpqpMbCcWnzvo3mtOrY
         em9O2YT5CtDGXp2tYau+yM09qfVMhcFjGM0OAu+hJqW0ERusyk1jHA+ZKmYobDAHpJtT
         8UZheb8o0OaxIAIPJh5MqbVjUoodAO7yOQUxTinU4W12FuNHhUO9oswMW4Dh9/JzOfyv
         SSzW+q2e2xahvb1K9XsTvfJXYF+6yB4Q3ESkeJ/cYJPtrVjQ343YtGDOErKzR51L64VI
         MKJFWixDWn1+z/268WC8LU06M73IcvAFpwoGUAqVivnWHykEz7uSZGQmLqUMv2TFyMGK
         aS4w==
X-Gm-Message-State: ANoB5plWEGfwPbG5jPK/yzyxZHTthwFpww2WrlURKY3tUklIbyjqmSo0
        xjuGUWF9z0V6u1kf8R/8IFT+3XKcr4C3AS7GHKUnqgorSqkcIYMbEpNWItDxe+7UYGd53eiInW9
        78jS8PDL9HudtkbB0qhlB2Po=
X-Received: by 2002:a17:906:490:b0:7c0:7efe:7ba4 with SMTP id f16-20020a170906049000b007c07efe7ba4mr10171766eja.521.1669826097196;
        Wed, 30 Nov 2022 08:34:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4avfUWAc3t4pAmJnNoo0hVhwRymTwXpXlMqoOhlkyWQeX/a1Z14ayB1E9utbEdwlsupIUeOA==
X-Received: by 2002:a17:906:490:b0:7c0:7efe:7ba4 with SMTP id f16-20020a170906049000b007c07efe7ba4mr10171751eja.521.1669826096968;
        Wed, 30 Nov 2022 08:34:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709060a4a00b007c073be0127sm797258ejf.202.2022.11.30.08.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 08:34:56 -0800 (PST)
Message-ID: <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
Date:   Wed, 30 Nov 2022 17:34:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Content-Language: en-US, nl
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/30/22 15:52, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 11/30/22 14:41, Sakari Ailus wrote:
>>> Hi Hans,
>>>
>>> On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
>>>> Add support for a privacy-led GPIO.
>>>>
>>>> Making the privacy LED to controlable from userspace, as using the LED
>>>> class subsystem would do, would make it too easy for spy-ware to disable
>>>> the LED.
>>>>
>>>> To avoid this have the sensor driver directly control the LED.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Note an additional advantage of directly controlling the GPIO is that
>>>> GPIOs are tied directly to consumer devices. Where as with a LED class
>>>> device, there would need to be some mechanism to tie the right LED
>>>> (e.g front or back) to the right sensor.
>>>
>>> Thanks for the patch.
>>>
>>> This approach has the drawback that support needs to be added for each
>>> sensor separately. Any idea how many sensor drivers might need this?
>>
>> Quite a few probably. But as discussed here I plan to write a generic
>> sensor_power helper library since many sensor drivers have a lot of
>> boilerplate code to get clks + regulators + enable/reset gpios. The plan
>> is to add support for a "privacy-led" to this library so that all sensors
>> which use this get support for free.
> 
> I'm not sure how well this could be generalised. While most sensors do
> something similar there are subtle differences. If those can be taken into
> account I guess it should be doable. But would it simplify things or reduce
> the number of lines of code as a whole?
> 
> The privacy LED is separate from sensor, including its power on/off
> sequences which suggests it could be at least as well be handled
> separately.
> 
>>
>> Laurent pointed out that some sensors may have more complex power-up
>> sequence demands, which is true. But looking at existing drivers
>> then many follow a std simple pattern which can be supported in
>> a helper-library.
>>
>>> Most implementations have privacy LED hard-wired to the sensor's power
>>> rails so it'll be lit whenever the sensor is powered on.
>>>
>>> If there would be more than just a couple of these I'd instead create a LED
>>> class device and hook it up to the sensor in V4L2.
>>
>>
>> A LED cladd device will allow userspace to override the privacy-led
>> value which is considered bad from a privacy point of view. This
>> was actually already discussed here:
>>
>> https://lore.kernel.org/platform-driver-x86/e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com/
>>
>> See the part of the thread on the cover-letter with Dan, Laurent
>> and me participating.
>>
>> And a LED class device also will be a challenge to bind to the right
>> sensor on devices with more then one sensor, where as mentioned
>> above using GPIO-mappings give us the binding to the right sensor
>> for free.
> 
> Whether the privacy LED is controlled via the LED framework or GPIO doesn't
> really matter from this PoV, it could be controlled via the V4L2 framework
> in both cases. It might not be very pretty but I think I'd prefer that than
> putting this in either drivers or some sensor power sequence helper
> library.

In sensors described in ACPI, esp. the straight forward described sensors
on atomisp2 devices, the GPIO resources inluding the LED one are listed
as resources of the i2c_client for the sensor.

And in a sense the same applies to later IPU3 / IPU6 devices where there
is a separate INT3472 device describing all the GPIOS which is also
tied to a specific sensor and we currently map all the GPIOs from
the INT3472 device to the sensor.

So it looks like that at least for x86/ACPI windows devices if the
LED has its own GPIO the hardware description clearly counts that
as part of the sensor's GPIOs. So the sensor driver has direct
access to this, where as any v4l2 framework driver would needed
to start poking inside the fwnode of the sensor which really
isn't pretty.

Where as if you look at this patch set adding the privacy-LED GPIO
from the INT3472 (IPU3 / IPU6) to the sensor fwnode is a 1 line change.

This really by far is the most KISS solution and we have so much
other things which need work that I believe that over-engineering
this is not doing ourselves any favours.

Regards,

Hans




