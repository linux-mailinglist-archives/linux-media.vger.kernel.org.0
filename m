Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABFED638829
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 12:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbiKYLDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 06:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbiKYLDG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 06:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC0E4B742
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669374131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uSFrKMRx9F4MbJ3pxDLdoIyd2lK2S5t/+AdLLV4BlLs=;
        b=NTPvlXskXaS/A8DcbzmpeRtOU6qX9qaOK9sgAmnsxETO5zw2KFDGZKgrOlH6e61A7Cc8bG
        N+AofzUHigtBbLTwwU7/N6jyZjSRmSlG7QLda4yrdIsgIJLcNpf41C9ifuwDXXgUdAvyU3
        RJjinogvnrJhZsp8uOvlrVSugB5aNEA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-pXPabE15MwqrmqAHLpYYcQ-1; Fri, 25 Nov 2022 06:02:10 -0500
X-MC-Unique: pXPabE15MwqrmqAHLpYYcQ-1
Received: by mail-ej1-f69.google.com with SMTP id sa20-20020a1709076d1400b007bbe8699c2eso1208138ejc.6
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 03:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSFrKMRx9F4MbJ3pxDLdoIyd2lK2S5t/+AdLLV4BlLs=;
        b=kzTjUanjcR/7x/DfRN8ZtQ6rv/+X9+55ay7pSkDN1b0cGVuTXnQIDLu5jCckRLgw0y
         bAFMERz2aXmj5ZTNHE3mKrbGdvl+dIqGFRqMr8ICFTtut4c9KyHFo7OMODqlRRQOIhrU
         ikOz+05WrAQ+Z4zY5WvHsNXAzO6Vcea71Fn36LXf6sy+juo6uxUurmcthzDfQZuwXuRL
         xfX9o1zeOGC/oheAT6ko+inrgpWfJwvkFzGVpBOq8gXiorAcyKEmFZF19xcf+b3ziGCl
         Nv+vFy0P3qvN5n+KgSWs6cqWhdd5yu7w2CpN/CxnprhGCwQMY0PYAFko2mYLgA+WQcqJ
         ziNw==
X-Gm-Message-State: ANoB5pnSmpgsQSvzkUJCViIGa4Ko0lgzVKaZVk2SQ4+JlWIzfM9G8FGT
        JMpItJMbagRoNJoXXIqtBk32jMs181F0NbzfMLqLJqYrh7YGjNQG90XY4v5IybG2NI3s/tj09/J
        OVSRvkh4E1TcC7+58SQ5Xijw=
X-Received: by 2002:aa7:c844:0:b0:461:a130:ea3c with SMTP id g4-20020aa7c844000000b00461a130ea3cmr33474086edt.272.1669374129248;
        Fri, 25 Nov 2022 03:02:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5FdiUpm7V8FhHJpDv3e8ePhpFJ4XQsO+Uk0fmKF/leaKerNddG8jLYpvyr8y0yYLXFE/r0Jw==
X-Received: by 2002:aa7:c844:0:b0:461:a130:ea3c with SMTP id g4-20020aa7c844000000b00461a130ea3cmr33474041edt.272.1669374128780;
        Fri, 25 Nov 2022 03:02:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b00779a605c777sm709227ejh.192.2022.11.25.03.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:02:08 -0800 (PST)
Message-ID: <c2f364ec-c31e-e6ec-c546-f25078c104ec@redhat.com>
Date:   Fri, 25 Nov 2022 12:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
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

On 11/25/22 11:17, Dan Scally wrote:
> Morning Hans - thanks for the set
> 
> On 24/11/2022 20:00, Hans de Goede wrote:
>> Hi All,
>>
>> Here is a small set of patches to make the int3472/discrete code
>> work with the sensor drivers bundled with the (unfortunately out of tree)
>> IPU6 driver.
>>
>> There are parts of the out of tree IPU6 code, like the sensor drivers,
>> which can be moved to the mainline and I do plan to work on this at some
>> point and then some of this might need to change. But for now the goal is
>> to make the out of tree driver work with standard mainline distro kernels
>> through e.g. dkms. Otherwise users need to run a patched kernel just for
>> a couple of small differences.
>>
>> This is basically a rewrite of this patch:
>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>>
>> Wich users who want to use the IPU6 driver so far have had to manually
>> apply to their kernels which is quite inconvenient.
>>
>> This rewrite makes 2 significant changes:
>>
>> 1. Don't break things on IPU3 platforms
>>
>> 2. Instead of extending the int3472_sensor_configs[] quirks table for each
>> model which needs "clken" and "pled" GPIOs, do this based on matching
>> the ACPI HID of the ACPI device describing the sensor.
>>
>> The need for these GPIOs is a property of the specific sensor driver which
>> binds using this same HID, so by using this we avoid having to extend the
>> int3472_sensor_configs[] quirks table all the time.
>>
>> This allows roling back the behavior to at least use a clk-framework
>> clk instead of clken GPIO on a per sensor(-driver) basis as we mainline
>> the sensor drivers, assuming that the drivers are switched over to the
>> clk framework as part of their mainlining.
>>
>> A bigger question is what to do with the privacy-led GPIO on IPU3
>> we so far have turned the LED on/off at the same as te clock,
>> but at least on some IPU6 models this won't work, because they only
>> have a privacy-led GPIO and no clk_en GPIO (there is no sensor
>> clk-control at all on some models).
> 
> 
> Ah how annoying, we hadn't come across any situations for IPU3 with a privacy LED but no clock GPIO
> 
>>
>> I think we should maybe move all models, including IPU3 based
>> models over to using a normal GPIO for controlling the privacy-led
>> to make things consistent.
> 
> 
> I think they probably should be represented as LED devices then, and have the media subsytem call some framework to find associated LEDs and cycle them at power on time in the sensor drivers. I know there's the v4l2_flash structure at the moment, but not sure if a privacy one exists.

That is actually a pretty good idea, the LED subsystem has the notion
of triggers, which are identified simply with a string.

So we could simple add a LED class device which sets it default trigger
to "camera-front" and then have either the sensor-drivers start-stream
or maybe even something more generic, so in the media subsystem code
somewhere set the led trigger.

See e.g. the LED class device in drivers/hid/hid-lenovo.c and how
it sets data->led_micmute.default_trigger = "audio-micmute",
combined with the drivers/leds/trigger/ledtrig-audio.c code,
where the ALSA kernel code just does, e.g.:

ledtrig_audio_set(LED_AUDIO_MUTE, 1);
or:
ledtrig_audio_set(LED_AUDIO_MUTE, 0);

We would then probably need to do something like rename
the drivers/leds/trigger/ledtrig-audio.c code and extend the
enum led_audio type with front + back cameras. That or copy the
code, but just renaming it seems better then adding a copy.

And then all need is to have something call:

ledtrig_multimedia_set(LED_CAMERA_FRONT, 0);
ledtrig_multimedia_set(LED_CAMERA_FRONT, 1);

And we are done.

I think the biggest question here is where to put those
ledtrig_multimedia_set() calls ?

These calls will be no-ops when no LED has its trigger
set to "camera-front", so there is no need to worry
about making them conditional (other then them being
conditional (or stubbed out?) when the LED subsystem
is disabled).

Note I would like to move forward with this patch set as is,
to unblock distros wanting to package the out of tree
IPU6 driver for now and then we can convert things to this
model later.

Please let me know if there are any objections with going
with this patch-set as an intermediate solution.

Regards,

Hans


