Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4106405B7
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 12:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbiLBLWY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 06:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbiLBLWU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 06:22:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC9AD3A28
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 03:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669980076;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sWmdT1AfMDpWae9RrpxJGTLnwLATPcdz02XU9gnPqGA=;
        b=ie2wqyJ7c/bshrXW+ab5NECRhbaXHPmCR7rAmqf5zObo+WcdGeciaD2vd/yorFMOr3ksr0
        zy7/Bmksfw9aCj5Vwh5BsmmlWMGnY+v3/Gj/58dOYLMIC5eulqMBlGVSMS3+MlnhZFNavL
        V8gVmKz/lo8iflWORsE/XusB0gS7vb4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-B26I9yJsNq6sDpYt8iQrXQ-1; Fri, 02 Dec 2022 06:21:15 -0500
X-MC-Unique: B26I9yJsNq6sDpYt8iQrXQ-1
Received: by mail-ed1-f70.google.com with SMTP id r12-20020a05640251cc00b00463699c95aeso2311733edd.18
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 03:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWmdT1AfMDpWae9RrpxJGTLnwLATPcdz02XU9gnPqGA=;
        b=m3JbtVuIinjMamYfhDcBYY6jnK88VA5LYx9Qm81Hvfpuo1F5/lcadUUSpYZClmGZrU
         JvGv+r3xXmJcSt/V6PNu5x3FT2rHfLVeHv4/w4McIYO6UMY2y/rhKWbOG0ai3nf+2kGf
         vBxEQCawPdkVthaVS0063vPwbobgxeujGOwvFR5pkO2s0MOMShpeSYElA2QvDSmh0ot/
         1YlM49tOe/Uw/heY3+xHb3ZkDaEFMKvo8+72i6Lz/WJP8qTICyN77KlRP6cWaDjr6EYJ
         K+oBlT4kkQbfsmx7HaTbPBFSJMhZWq8TMlqjUXgHFmtBSPmEEQwja01OWaLvdD4CCN75
         Lw/Q==
X-Gm-Message-State: ANoB5plCK+u1DLbdCZdMEajhSMAvfnV5e1HtCMSXCljaETkQqTVcLoiq
        aX/LfQH2/A5/SAeyFliWTCGBmIz0BubYZoLDSc3bPSmp5+mu4+vl3QK1H5ok3Aq388p4RuKkhPG
        qyxu5I4mRY31OWR4S4djZwIo=
X-Received: by 2002:a17:906:6d8e:b0:7ad:a2e9:a48c with SMTP id h14-20020a1709066d8e00b007ada2e9a48cmr48304371ejt.77.1669980073748;
        Fri, 02 Dec 2022 03:21:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7IFQCalgG7VnpvbIrnBqxz7HfDHsFWyMJ5UwCWUKx+iahon0HAUwjLPsK+6gQb4Fe1HjHZlw==
X-Received: by 2002:a17:906:6d8e:b0:7ad:a2e9:a48c with SMTP id h14-20020a1709066d8e00b007ada2e9a48cmr48304350ejt.77.1669980073458;
        Fri, 02 Dec 2022 03:21:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y10-20020a056402170a00b0046b16872e69sm2827188edu.2.2022.12.02.03.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 03:21:12 -0800 (PST)
Message-ID: <29b30a50-0fc1-e185-c79b-10856a80bceb@redhat.com>
Date:   Fri, 2 Dec 2022 12:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-media@vger.kernel.org
References: <20221129231149.697154-1-hdegoede@redhat.com>
 <20221129231149.697154-2-hdegoede@redhat.com>
 <Y4ddgnRbRyUDSPFI@paasikivi.fi.intel.com>
 <ad9d01b6-de08-b54c-d300-cf133df90536@redhat.com>
 <Y4duQpP/GrfFQkwS@paasikivi.fi.intel.com>
 <fef2a014-1ef9-049a-2516-539ea14abdac@redhat.com>
 <Y4nZUpGvtKMpxrDR@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4nZUpGvtKMpxrDR@pendragon.ideasonboard.com>
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

On 12/2/22 11:54, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Wed, Nov 30, 2022 at 05:34:55PM +0100, Hans de Goede wrote:
>> On 11/30/22 15:52, Sakari Ailus wrote:
>>> On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:
>>>> On 11/30/22 14:41, Sakari Ailus wrote:
>>>>> On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
>>>>>> Add support for a privacy-led GPIO.
>>>>>>
>>>>>> Making the privacy LED to controlable from userspace, as using the LED
>>>>>> class subsystem would do, would make it too easy for spy-ware to disable
>>>>>> the LED.
>>>>>>
>>>>>> To avoid this have the sensor driver directly control the LED.
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>> ---
>>>>>> Note an additional advantage of directly controlling the GPIO is that
>>>>>> GPIOs are tied directly to consumer devices. Where as with a LED class
>>>>>> device, there would need to be some mechanism to tie the right LED
>>>>>> (e.g front or back) to the right sensor.
>>>>>
>>>>> Thanks for the patch.
>>>>>
>>>>> This approach has the drawback that support needs to be added for each
>>>>> sensor separately. Any idea how many sensor drivers might need this?
>>>>
>>>> Quite a few probably. But as discussed here I plan to write a generic
>>>> sensor_power helper library since many sensor drivers have a lot of
>>>> boilerplate code to get clks + regulators + enable/reset gpios. The plan
>>>> is to add support for a "privacy-led" to this library so that all sensors
>>>> which use this get support for free.
>>>
>>> I'm not sure how well this could be generalised. While most sensors do
>>> something similar there are subtle differences. If those can be taken into
>>> account I guess it should be doable. But would it simplify things or reduce
>>> the number of lines of code as a whole?
>>>
>>> The privacy LED is separate from sensor, including its power on/off
>>> sequences which suggests it could be at least as well be handled
>>> separately.
>>>
>>>> Laurent pointed out that some sensors may have more complex power-up
>>>> sequence demands, which is true. But looking at existing drivers
>>>> then many follow a std simple pattern which can be supported in
>>>> a helper-library.
>>>>
>>>>> Most implementations have privacy LED hard-wired to the sensor's power
>>>>> rails so it'll be lit whenever the sensor is powered on.
>>>>>
>>>>> If there would be more than just a couple of these I'd instead create a LED
>>>>> class device and hook it up to the sensor in V4L2.
>>>>
>>>> A LED cladd device will allow userspace to override the privacy-led
>>>> value which is considered bad from a privacy point of view. This
>>>> was actually already discussed here:
>>>>
>>>> https://lore.kernel.org/platform-driver-x86/e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com/
>>>>
>>>> See the part of the thread on the cover-letter with Dan, Laurent
>>>> and me participating.
>>>>
>>>> And a LED class device also will be a challenge to bind to the right
>>>> sensor on devices with more then one sensor, where as mentioned
>>>> above using GPIO-mappings give us the binding to the right sensor
>>>> for free.
>>>
>>> Whether the privacy LED is controlled via the LED framework or GPIO doesn't
>>> really matter from this PoV, it could be controlled via the V4L2 framework
>>> in both cases. It might not be very pretty but I think I'd prefer that than
>>> putting this in either drivers or some sensor power sequence helper
>>> library.
>>
>> In sensors described in ACPI, esp. the straight forward described sensors
>> on atomisp2 devices, the GPIO resources inluding the LED one are listed
>> as resources of the i2c_client for the sensor.
>>
>> And in a sense the same applies to later IPU3 / IPU6 devices where there
>> is a separate INT3472 device describing all the GPIOS which is also
>> tied to a specific sensor and we currently map all the GPIOs from
>> the INT3472 device to the sensor.
>>
>> So it looks like that at least for x86/ACPI windows devices if the
>> LED has its own GPIO the hardware description clearly counts that
>> as part of the sensor's GPIOs. So the sensor driver has direct
>> access to this, where as any v4l2 framework driver would needed
>> to start poking inside the fwnode of the sensor which really
>> isn't pretty.
> 
> Let me try to understand it better. Looking at the platforms you mention
> above, it seems that the way to retrieve the GPIO is platform-specific,
> isn't it ? Can the atomisp2 (is that IPU2 ?)

Yes, sorta, Intel back then called it an ISP not an IPU, but the
Android x86 code which we have for it also refers to work enabling
IPU3 support, so definitely the same lineage of ISPs/IPUs.

> , IPU3 and IPU6 expose the
> GPIO in the same way, or would we need code that, for instance, acquires
> the GPIO through different names (or even different APIs) for the same
> sensor on different platforms ?

Long answer:

On the atomisp2 platforms the GPIO is directly listed as a GPIO resource
of the i2c_client. Now ACPI resources use GPIO-indexes where as
the standard Linux GPIO APIs use GPIO names, so we need an index -> name
map in drivers/platform/x86 glue code.

Note the need for an index -> name map is standard for all GPIOs
on ACPI platforms.

On IPU3 / IPU6 most (all?) of the power-seq (and privacy-led) related
resources like GPIOs are all described in an INT3472 ACPI device,
and the drivers/platform/x86/intel/int3472/*.c code then adds
GPIO-lookup table entries to the sensor's i2c_client pointing
to these GPIOS.

So in the end for both the ISP2 and the IPU3/IPU6 which have
some code (outside of the media subsystem) abstracting away
all this platform specific shenanigans and mapping
the GPIOs to the sensor's i2c_client device so that a standard:

	sensor->pled_gpiod = gpiod_get(&i2c_client->dev, "privacy-led");

Call should work on all of ISP2/IPU3/IPU6 (and presumably also
IPU4 if we ever get around to that).

###

Short answer to your question:

"would we need code that, for instance, acquires the GPIO through
different names (or even different APIs) for the same
sensor on different platforms ?"

No the media subsystem sensor drivers should not need code to
deal with any platform differences, this should all be abstracted
away by the platform glue code under drivers/platform/x86, which
is glue which we need regardless of how we solve this.

With that glue in place, a simple / standard:

	sensor->pled_gpiod = gpiod_get(&i2c_client->dev, "privacy-led");

should work for all of ISP2 + IPU3 + IPU6 and this does already work
in my current testing done on IPU3 + IPU6.

Note this already works in my testing with both normal GPIOs from
the main SoC, as well as with the privacy LED attached to the TP68470
PMIC used for the back sensor on the Surface Go.

Regards,

Hans




> 
>> Where as if you look at this patch set adding the privacy-LED GPIO
>> from the INT3472 (IPU3 / IPU6) to the sensor fwnode is a 1 line change.
>>
>> This really by far is the most KISS solution and we have so much
>> other things which need work that I believe that over-engineering
>> this is not doing ourselves any favours.
> 

