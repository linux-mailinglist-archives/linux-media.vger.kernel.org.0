Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCBAD638878
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiKYLRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbiKYLRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:17:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB78B4EC19
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669374961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zZEANn6ED077kJj/o8vGC/0LkJ3Wc8rmaO3J8VfnSnc=;
        b=AKyHg38bQ2WKex6FzanwvLWNrOPDikI2SGZbDXHUlfrdTh1CRmQoql+C9o9Pc/otUppKF6
        u8fyYeY7CiEVmU1e1FYXWwDQKXCyMj7AnQK1b8qoxiDvE96mXZf1PtcoxL6tIcAyL/LcXk
        I0XoeBrbELNCTD/QivpgKxRSNeGb9mw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-yvn19h8yPHmwdYWfRcKdzA-1; Fri, 25 Nov 2022 06:16:00 -0500
X-MC-Unique: yvn19h8yPHmwdYWfRcKdzA-1
Received: by mail-ej1-f72.google.com with SMTP id oz34-20020a1709077da200b007adc8d68e90so2127369ejc.11
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZEANn6ED077kJj/o8vGC/0LkJ3Wc8rmaO3J8VfnSnc=;
        b=CTkADHzw4+Ml7BissGQO28Gr8qdASc249dl8sY0ZgsGhZDp3ETybVmeop/HIeNXVdU
         dt2foLiqr+gx2qMYcbDyOfkeHsFxt/0OqO5VgieoFU2t1zAQYgEqc/8iducZA/GrUlN2
         JuYpw8hQfqcKyNwqSd8Wnz3D4H5YhAe4P+a8m+VDlW6eUfoH2EE484eHkKQj5o6ld5H7
         wWFeUw+BgGiqyxjeHuwdSFoxiZGp5UcONu6vPCMQH16i5u8bATHqtKvpKsvcHzTymIuZ
         hlKH0JlJahaX4tvsZZbqZnFKzAbzRojRMvyU8YKQCr3Li92XCBPV7Tifv2IPX/a4sTjT
         Xv9g==
X-Gm-Message-State: ANoB5pmXxP1CJw8KQMnkq5J7ekVw90ec3rzhDYkNyPQ8Apd3rrrJxjxn
        OIua1bct66EnhcTXy9wU2UwQAycZWHGnQBIZTHSH+Z2dh70LTPaCHo2vXmEVQF2vwzOy00AJJvT
        Qdc9qQUJDgM2KvpGPE5SAILI=
X-Received: by 2002:a17:907:378:b0:7ad:db82:d071 with SMTP id rs24-20020a170907037800b007addb82d071mr16118460ejb.200.1669374959203;
        Fri, 25 Nov 2022 03:15:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf799hTO0VCDRht2YcCci/6vNF1KEUtkmw7M+IprXUPdNdZMxMF3OVnhgZ6T9mRBdTuyGBRIRQ==
X-Received: by 2002:a17:907:378:b0:7ad:db82:d071 with SMTP id rs24-20020a170907037800b007addb82d071mr16118434ejb.200.1669374958957;
        Fri, 25 Nov 2022 03:15:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d24-20020a50fb18000000b0045bccd8ab83sm1673358edq.1.2022.11.25.03.15.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:15:58 -0800 (PST)
Message-ID: <636c471d-d7ee-d184-7a9d-fbfd0545059c@redhat.com>
Date:   Fri, 25 Nov 2022 12:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
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

On 11/25/22 11:58, Laurent Pinchart wrote:
> On Fri, Nov 25, 2022 at 10:17:17AM +0000, Dan Scally wrote:
>> Morning Hans - thanks for the set
>>
>> On 24/11/2022 20:00, Hans de Goede wrote:
>>> Hi All,
>>>
>>> Here is a small set of patches to make the int3472/discrete code
>>> work with the sensor drivers bundled with the (unfortunately out of tree)
>>> IPU6 driver.
>>>
>>> There are parts of the out of tree IPU6 code, like the sensor drivers,
>>> which can be moved to the mainline and I do plan to work on this at some
>>> point and then some of this might need to change. But for now the goal is
>>> to make the out of tree driver work with standard mainline distro kernels
>>> through e.g. dkms. Otherwise users need to run a patched kernel just for
>>> a couple of small differences.
>>>
>>> This is basically a rewrite of this patch:
>>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>>>
>>> Wich users who want to use the IPU6 driver so far have had to manually
>>> apply to their kernels which is quite inconvenient.
>>>
>>> This rewrite makes 2 significant changes:
>>>
>>> 1. Don't break things on IPU3 platforms
>>>
>>> 2. Instead of extending the int3472_sensor_configs[] quirks table for each
>>> model which needs "clken" and "pled" GPIOs, do this based on matching
>>> the ACPI HID of the ACPI device describing the sensor.
>>>
>>> The need for these GPIOs is a property of the specific sensor driver which
>>> binds using this same HID, so by using this we avoid having to extend the
>>> int3472_sensor_configs[] quirks table all the time.
>>>
>>> This allows roling back the behavior to at least use a clk-framework
>>> clk instead of clken GPIO on a per sensor(-driver) basis as we mainline
>>> the sensor drivers, assuming that the drivers are switched over to the
>>> clk framework as part of their mainlining.
>>>
>>> A bigger question is what to do with the privacy-led GPIO on IPU3
>>> we so far have turned the LED on/off at the same as te clock,
>>> but at least on some IPU6 models this won't work, because they only
>>> have a privacy-led GPIO and no clk_en GPIO (there is no sensor
>>> clk-control at all on some models).
>>
>> Ah how annoying, we hadn't come across any situations for IPU3 with a 
>> privacy LED but no clock GPIO
>>
>>> I think we should maybe move all models, including IPU3 based
>>> models over to using a normal GPIO for controlling the privacy-led
>>> to make things consistent.
>>
>> I think they probably should be represented as LED devices then, and 
>> have the media subsytem call some framework to find associated LEDs and 
>> cycle them at power on time in the sensor drivers. I know there's the 
>> v4l2_flash structure at the moment, but not sure if a privacy one exists.
> 
> The whole point of a privacy LED is to be controlled automatically (and
> ideally without software intervention, but that's a different story).
> Can the LED framework be used without having the LED exposed to
> userspace ?

AFAIK using the LED framework will automatically expose the LED
to userspace; and using triggers as I mentioned in my other email
will also allow the user to unset the trigger or even use a different
trigger.

I understand where you are coming from, but I was actually seeing
this (exposed to userspace) as a feature. Users may want to repurpose
the LED, maybe make it blink when the camera is on for extra obviousness
the camera is on. Maybe always have it off because it is too annoying,
etc...  ?

My vision here is that ideally the LED should be hardwired to go on
together with some enable pin or power-supply of the sensor.

But if it is actually just a GPIO, then there is something to be said
for giving the user full-control. OTOH this would make writing spy-ware
where the LED never goes on a lot easier...

Typing this out I'm afraid that I have to agree with you and that
the spyware argument likely wins over how giving the user more control
would be nice :(

Which would bring us back to just making it a GPIO, which would then
need to be turned on+off by the sensor driver I guess.

There seems to be a bunch of GPIO/clk/regulator boilerplate duplicated
in all the sensor drivers. I think a little helper-library  for this might
be in order. E.g. Something like this (in the .h file)

struct camera_sensor_pwr_helper {
	// bunch of stuff here, this should be fixed size so that the
	// sensor drivers can embed it into their driver-data struct
};

int camera_sensor_pwr_helper_init(struct camera_sensor_pwr_helper *helper,
				  const char *supply_names, int supply_count,
				  const char* clk_name.
				  /* other stuff which I'm probably forgetting right now */);

// turn_on_privacy_led should be false when called from probe(), must be true when
// called on stream_on().
int camera_sensor_pwr_helper_on(struct camera_sensor_pwr_helper *helper, bool turn_on_privacy_led);
int camera_sensor_pwr_helper_off(struct camera_sensor_pwr_helper *helper);

// maybe, or make everything devm managed? :
int camera_sensor_pwr_helper_exit(struct camera_sensor_pwr_helper *helper);

Just is just a really really quick n dirty design. For one I could use
suggestions for a better name for the thing :)

I think something like this will be helpfull to reduce a whole bunch
of boilerplate code related to powering on/off the sensor in all
the drivers; and it would give us a central place to drive an
(optional) privacy-led GPIO.

Regards,

Hans











> 
>>> And likewise (eventually) completely drop the "clken" GPIO this
>>> patch series introduces (with some sensors) and instead always model
>>> this through the clk-framework.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>> Hans de Goede (3):
>>>    platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
>>>    platform/x86: int3472/discrete: Get the polarity from the _DSM entry
>>>    platform/x86: int3472/discrete: Add support for sensor-drivers which
>>>      expect clken + pled GPIOs
>>>
>>>   drivers/platform/x86/intel/int3472/common.h   |  2 +-
>>>   drivers/platform/x86/intel/int3472/discrete.c | 92 ++++++++++++++++---
>>>   2 files changed, 78 insertions(+), 16 deletions(-)
> 

