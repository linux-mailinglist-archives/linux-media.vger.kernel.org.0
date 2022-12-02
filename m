Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44BBD64099A
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 16:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbiLBP4t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 10:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbiLBP4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 10:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B045D9B29
        for <linux-media@vger.kernel.org>; Fri,  2 Dec 2022 07:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669996549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9PIgv6i6JYU/fH7VceUDt1ZjtMbWcqKRSOlYKMiqufI=;
        b=KuDd4MtFqOgxDs+d8MvKTqRH1aT2NVE0X4iMNoPa3IPpeo9D4MOQiui/OOpRIZ31KbRzbi
        rcGKCaZvMQgSpwOvaavM3PAc4pKSTJPBByTz2tq0qbreeO75ZUMREjhpxh+d+yq6yKwYic
        PKeNary6Db9cyxei8oidZiOOXCxMiKY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-zasZ2Mc6O-euLtMW5QeKaA-1; Fri, 02 Dec 2022 10:55:48 -0500
X-MC-Unique: zasZ2Mc6O-euLtMW5QeKaA-1
Received: by mail-ej1-f71.google.com with SMTP id hc41-20020a17090716a900b007c07a5fc017so3575902ejc.9
        for <linux-media@vger.kernel.org>; Fri, 02 Dec 2022 07:55:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PIgv6i6JYU/fH7VceUDt1ZjtMbWcqKRSOlYKMiqufI=;
        b=yGTqQQk+TDWrpI44HNw52ZPpLAVdYfoq83JCswMlKW4aHghUpWVEFF9k2wAVGfeehv
         0rl1hI8IgMbLwdjgJg0/esBPdneT4lZ27wPNA8Gb6rMJYGpQCJloqkXNOLsRsPtKuaC6
         Jh/A2kCKVwF/zoxe2wNHdF27OyFEe4VacGXGAm6C1kYy3SnOO6YQ+hxoyIQLCcLzNsCM
         EmPoM1aAFV2kl0rJ/Iysajs68vm4JOM8ZnP3AsygWnT2sfxJIO8YU/CT/hcMTKxhRryT
         uUwRx6LU5szmvuMbfICC0BguhvR1munSNzjhwJnv12+uiny5ErtmrIoUsLFmar/QW1eM
         ArgA==
X-Gm-Message-State: ANoB5pntwcM6cWEvtBEL717SZvrLBaxfIeukSizrHGhYVuTZE7NFK4QB
        ANORGwcJCaHhWaAPhtp803rYDZPHU/OSRU5sioopCYrIY+piucZ5hLN+Dg7oy6BxqSRp99p90nO
        MRppq1OeX09jb/TjGGC7UVls=
X-Received: by 2002:aa7:c759:0:b0:46a:b8e0:f73a with SMTP id c25-20020aa7c759000000b0046ab8e0f73amr32822234eds.425.1669996547106;
        Fri, 02 Dec 2022 07:55:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6I9Y/nVi7sO11DqAx9a5aTyd0M96BTB/sDYBNaomJZqg9wHwGeT0GhM1i+oQLw/mgnKlbZXw==
X-Received: by 2002:aa7:c759:0:b0:46a:b8e0:f73a with SMTP id c25-20020aa7c759000000b0046ab8e0f73amr32822203eds.425.1669996546803;
        Fri, 02 Dec 2022 07:55:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906768300b007c099174a12sm3212552ejm.178.2022.12.02.07.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 07:55:46 -0800 (PST)
Message-ID: <0a85ae44-e86c-fb6c-9a0c-c5b306ef4551@redhat.com>
Date:   Fri, 2 Dec 2022 16:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/6] media: ov5693: Add support for a privacy-led GPIO
Content-Language: en-US
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
 <29b30a50-0fc1-e185-c79b-10856a80bceb@redhat.com>
 <Y4nmZND8Mm89X0Y/@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4nmZND8Mm89X0Y/@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 12/2/22 12:49, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Fri, Dec 02, 2022 at 12:21:12PM +0100, Hans de Goede wrote:
>> On 12/2/22 11:54, Laurent Pinchart wrote:
>>> On Wed, Nov 30, 2022 at 05:34:55PM +0100, Hans de Goede wrote:
>>>> On 11/30/22 15:52, Sakari Ailus wrote:
>>>>> On Wed, Nov 30, 2022 at 02:56:46PM +0100, Hans de Goede wrote:
>>>>>> On 11/30/22 14:41, Sakari Ailus wrote:
>>>>>>> On Wed, Nov 30, 2022 at 12:11:44AM +0100, Hans de Goede wrote:
>>>>>>>> Add support for a privacy-led GPIO.
>>>>>>>>
>>>>>>>> Making the privacy LED to controlable from userspace, as using the LED
>>>>>>>> class subsystem would do, would make it too easy for spy-ware to disable
>>>>>>>> the LED.
>>>>>>>>
>>>>>>>> To avoid this have the sensor driver directly control the LED.
>>>>>>>>
>>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>>> ---
>>>>>>>> Note an additional advantage of directly controlling the GPIO is that
>>>>>>>> GPIOs are tied directly to consumer devices. Where as with a LED class
>>>>>>>> device, there would need to be some mechanism to tie the right LED
>>>>>>>> (e.g front or back) to the right sensor.
>>>>>>>
>>>>>>> Thanks for the patch.
>>>>>>>
>>>>>>> This approach has the drawback that support needs to be added for each
>>>>>>> sensor separately. Any idea how many sensor drivers might need this?
>>>>>>
>>>>>> Quite a few probably. But as discussed here I plan to write a generic
>>>>>> sensor_power helper library since many sensor drivers have a lot of
>>>>>> boilerplate code to get clks + regulators + enable/reset gpios. The plan
>>>>>> is to add support for a "privacy-led" to this library so that all sensors
>>>>>> which use this get support for free.
>>>>>
>>>>> I'm not sure how well this could be generalised. While most sensors do
>>>>> something similar there are subtle differences. If those can be taken into
>>>>> account I guess it should be doable. But would it simplify things or reduce
>>>>> the number of lines of code as a whole?
>>>>>
>>>>> The privacy LED is separate from sensor, including its power on/off
>>>>> sequences which suggests it could be at least as well be handled
>>>>> separately.
>>>>>
>>>>>> Laurent pointed out that some sensors may have more complex power-up
>>>>>> sequence demands, which is true. But looking at existing drivers
>>>>>> then many follow a std simple pattern which can be supported in
>>>>>> a helper-library.
>>>>>>
>>>>>>> Most implementations have privacy LED hard-wired to the sensor's power
>>>>>>> rails so it'll be lit whenever the sensor is powered on.
>>>>>>>
>>>>>>> If there would be more than just a couple of these I'd instead create a LED
>>>>>>> class device and hook it up to the sensor in V4L2.
>>>>>>
>>>>>> A LED cladd device will allow userspace to override the privacy-led
>>>>>> value which is considered bad from a privacy point of view. This
>>>>>> was actually already discussed here:
>>>>>>
>>>>>> https://lore.kernel.org/platform-driver-x86/e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com/
>>>>>>
>>>>>> See the part of the thread on the cover-letter with Dan, Laurent
>>>>>> and me participating.
>>>>>>
>>>>>> And a LED class device also will be a challenge to bind to the right
>>>>>> sensor on devices with more then one sensor, where as mentioned
>>>>>> above using GPIO-mappings give us the binding to the right sensor
>>>>>> for free.
>>>>>
>>>>> Whether the privacy LED is controlled via the LED framework or GPIO doesn't
>>>>> really matter from this PoV, it could be controlled via the V4L2 framework
>>>>> in both cases. It might not be very pretty but I think I'd prefer that than
>>>>> putting this in either drivers or some sensor power sequence helper
>>>>> library.
>>>>
>>>> In sensors described in ACPI, esp. the straight forward described sensors
>>>> on atomisp2 devices, the GPIO resources inluding the LED one are listed
>>>> as resources of the i2c_client for the sensor.
>>>>
>>>> And in a sense the same applies to later IPU3 / IPU6 devices where there
>>>> is a separate INT3472 device describing all the GPIOS which is also
>>>> tied to a specific sensor and we currently map all the GPIOs from
>>>> the INT3472 device to the sensor.
>>>>
>>>> So it looks like that at least for x86/ACPI windows devices if the
>>>> LED has its own GPIO the hardware description clearly counts that
>>>> as part of the sensor's GPIOs. So the sensor driver has direct
>>>> access to this, where as any v4l2 framework driver would needed
>>>> to start poking inside the fwnode of the sensor which really
>>>> isn't pretty.
>>>
>>> Let me try to understand it better. Looking at the platforms you mention
>>> above, it seems that the way to retrieve the GPIO is platform-specific,
>>> isn't it ? Can the atomisp2 (is that IPU2 ?)
>>
>> Yes, sorta, Intel back then called it an ISP not an IPU, but the
>> Android x86 code which we have for it also refers to work enabling
>> IPU3 support, so definitely the same lineage of ISPs/IPUs.
>>
>>> , IPU3 and IPU6 expose the
>>> GPIO in the same way, or would we need code that, for instance, acquires
>>> the GPIO through different names (or even different APIs) for the same
>>> sensor on different platforms ?
>>
>> Long answer:
>>
>> On the atomisp2 platforms the GPIO is directly listed as a GPIO resource
>> of the i2c_client. Now ACPI resources use GPIO-indexes where as
>> the standard Linux GPIO APIs use GPIO names, so we need an index -> name
>> map in drivers/platform/x86 glue code.
>>
>> Note the need for an index -> name map is standard for all GPIOs
>> on ACPI platforms.
> 
> It's funny how ARM platforms were criticized for their need of board
> files, with x86/ACPI being revered as a saint. Now we have DT on ARM and
> x86 needs board files :-)

Yes this is a bit painful. Although most of the INT3472 code is not
board specific, it calls _DSM (device-specific-methods) which
the windows drivers use and then translates that to GPIO mappings.

For the non separate PMIC case the _DSM gives us a u8 containing a type
for each GPIO listed, which can be one of: /reset, clk-enable,
regulator-enable, /powerdown or privacy-led and then we "inject" those
into the fwnode for the i2c_client (with the clk / regulator using
the clk/regulator framework).

>> On IPU3 / IPU6 most (all?) of the power-seq (and privacy-led) related
>> resources like GPIOs are all described in an INT3472 ACPI device,
>> and the drivers/platform/x86/intel/int3472/*.c code then adds
>> GPIO-lookup table entries to the sensor's i2c_client pointing
>> to these GPIOS.
>>
>> So in the end for both the ISP2 and the IPU3/IPU6 which have
>> some code (outside of the media subsystem) abstracting away
>> all this platform specific shenanigans and mapping
>> the GPIOs to the sensor's i2c_client device so that a standard:
>>
>> 	sensor->pled_gpiod = gpiod_get(&i2c_client->dev, "privacy-led");
>>
>> Call should work on all of ISP2/IPU3/IPU6 (and presumably also
>> IPU4 if we ever get around to that).
>>
>> ###
>>
>> Short answer to your question:
>>
>> "would we need code that, for instance, acquires the GPIO through
>> different names (or even different APIs) for the same
>> sensor on different platforms ?"
>>
>> No the media subsystem sensor drivers should not need code to
>> deal with any platform differences, this should all be abstracted
>> away by the platform glue code under drivers/platform/x86, which
>> is glue which we need regardless of how we solve this.
>>
>> With that glue in place, a simple / standard:
>>
>> 	sensor->pled_gpiod = gpiod_get(&i2c_client->dev, "privacy-led");
>>
>> should work for all of ISP2 + IPU3 + IPU6 and this does already work
>> in my current testing done on IPU3 + IPU6.
> 
> Can I assume that "privacy-led" will be the right GPIO name not only
> across different platforms but also across different sensors ?

Yes. After this series we always map GPIO for which the _DSM returns 
the privacy-led value in the returned type field to a "privacy-led"
GPIO, the mapping code for this is sensor independent.

Regards,

Hans



