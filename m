Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0EB54C9F8F
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 09:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237341AbiCBIoR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 03:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbiCBIoP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 03:44:15 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087E03B55F
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 00:43:32 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id qk11so2154713ejb.2
        for <linux-media@vger.kernel.org>; Wed, 02 Mar 2022 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to;
        bh=h3B0RUzQ2Dal2pyxteenvK8LJSEwypv8tNhNxllymIw=;
        b=QmqMH48FhZxh0J+0n/1yVezfkWRMwTTdIKruRvShSB6NzCEULyr1QqW2kpaknX149g
         yYBqOyGOHWsXDGu+6jkLSt4GAmd6gx2u0evevTsRyzvPlVD8phVB28RzcNtg+e+R/6Kk
         g//KGpZU+UAmTjcISF7Pr3YEbZ+ymMF4+HjnrpzpQ2QxlKm2x2v4VzKSAydwbAzuiz4r
         vjkFiEK2Y66IYWROdUlH+U1QBVe9a5vNPzOdoPq90nqX1umNBvGxVarxmV8RnizeSBeH
         kvLamGscu12J2QA9qZBEILDbp033Go3hT+9IIOZGtEykiXlKyovL9+I5dp0FzrULkCiH
         LNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to;
        bh=h3B0RUzQ2Dal2pyxteenvK8LJSEwypv8tNhNxllymIw=;
        b=DCaXqTyKbjGuzPiVXbiWf2/xoorI32njJ2hX3W9BjfSAMNBSFjRWf2w3l3V9iZ1Ffw
         6X9bByEw5FAFfhOtBAJMsgBlv+Te2hrCY7vir1BehlUwnd+OlQSfLlRJrDbmaxHovhAV
         9QR2OzUW1jlw9KdVKlKxCrQ7F4dYsHFxU89lHZ1OeLSVALGi5Iooz2h6QhYJYUkFYSMW
         XvpMza0L09L1CyE8kNggC+8ECVBawtQC5IqY76HTyRDWUPVybjmT9OySjtJmOa9CI/Fp
         JsgKvS3l/rxC51cC/kyFnWVX1HQjOhlYq7BwsRFOFKSYFlRygmJteYLGNKFDmL8hQdVj
         fkBQ==
X-Gm-Message-State: AOAM5314MVYQ0YnT5DZOcxzIStzWo8JzCjP4Wnrk0PVr3jbRWZHZoC5m
        vWseBGbDGcSmNx+3DnebMA4=
X-Google-Smtp-Source: ABdhPJzNfWBXoIKavZxpoxJBhBX6pGdikOf9jLJO9CR5NkxQ7gKJMCNXNEqxBUX3vWY18pCPk4Cxaw==
X-Received: by 2002:a17:907:961b:b0:6d9:acb0:5403 with SMTP id gb27-20020a170907961b00b006d9acb05403mr1707962ejc.568.1646210610185;
        Wed, 02 Mar 2022 00:43:30 -0800 (PST)
Received: from [192.168.0.12] (176-66-70-95.static.highway.a1.net. [176.66.70.95])
        by smtp.googlemail.com with ESMTPSA id d21-20020a1709067a1500b006cf0da57174sm3793837ejo.51.2022.03.02.00.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 00:43:29 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------gj9YOOQQNwsGH3ZX4M4mwU6L"
Message-ID: <6d75fd81-e6da-966b-ce50-32bd1749411e@gmail.com>
Date:   Wed, 2 Mar 2022 09:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: RockPro65 RK3399 chipset, ISP and IMX214 camera
Content-Language: de
To:     Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
References: <dbb69fc2-d46f-ee91-d089-46e7370a2a14@gmail.com>
 <164570696256.4066078.10553504447380276248@Monstersaurus>
 <CAPuf0ENRRjMafZUOXS45PJxQrpcK_tdCRREoHn43t54pSbVhDg@mail.gmail.com>
 <411433596.ldbydfAV7o@phil>
 <CAPybu_2ZwYBLy13KAbznErGU-2=hLcot081WE7ZLZbZaEwC0ag@mail.gmail.com>
 <dc0a22f7-80c3-12b9-d3ec-38fdf51e374c@gmail.com>
 <CAPybu_0j6csK29_LNDZwmu2Xxs+tLPD3QGqxktgpj-=BKO8G-A@mail.gmail.com>
From:   Clemens Arth <clemens.arth@gmail.com>
In-Reply-To: <CAPybu_0j6csK29_LNDZwmu2Xxs+tLPD3QGqxktgpj-=BKO8G-A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------gj9YOOQQNwsGH3ZX4M4mwU6L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

so I have good news. With the help of one of the pinetab developers, I 
finally managed to get a working DT together. I did not realize I had to 
use another clock to drive it, but the rest of the DT was already ok.

While I played around with the IMX driver trying to improve it, I 
finally went back to the current mainline branch version testing it with 
the rkisp1 and - voila! - the large 13M res does not work, but the 
1920x1080 worked out immediately, using the pure command-line config of 
media-ctl and video-ctl - the libcamera refuses operation due to the 
missing database info and the lack of certain caps in the driver.

There are a few things on my list though and I wanted to hear your 
thoughts before I move on now.

1) First of all, the image seems to be very badly balanced in terms of 
color and brightness. I assume it has to do with not properly adjusting 
parameters of the camera. I did not play around with it, as I have no 
graphical user interface on the board - it would make more sense I do 
that once I am able to visualize changes in real-time. @Ricardo, would 
you be willing to review changes I do to the IMX214 driver in the kernel 
based on the application guide I shared earlier? As I'm not a driver guy 
AT ALL, fixing things for me might break things for others, and I don't 
know how to verify that without having anyone else to check (I mean, do 
more than just code review, probably).

2) The DT overlay - it is nice that I have it now, but I had to put 
everything together myself - should I contribute it into mainline (or 
armbian), does that make sense and what is the procedure?

3) I don't have any other camera to work with, as I just ordered FPC FCC 
pinouts for 24-pin cams and have to rewire/solder a converter for the 
RockPro64. That might happen as soon as I get them from China - no 
Amazon or anything available right now. Still the DT seems to be the 
most valuable part of all of this right now.

4) The libcamera fix - I saw lc_compliance and gst-video work already 
after a few minor copy/paste fixes, but by pulling the driver from 
mainline broke it again expectedly. What's the plausible roadmap? Fixing 
libcamera alone resorts to fixing 10 lines of code probably, but that 
does not make sense without fixing the IMX214 driver in the kernel 
first, right?

Best
Clemens



Am 28.02.22 um 09:15 schrieb Ricardo Ribalda Delgado:
> On Sun, Feb 27, 2022 at 5:50 PM Clemens Arth <clemens.arth@gmail.com> wrote:
>>
>> Hi,
>>
>> so I moved on with some tests and trying to fix the driver and the
>> current libcamera version. The driver has still wrong registers I guess,
>> but I can fix them later. Here's the output of v4l-ctl
>>
>> https://pastebin.com/ZkMZ1mjJ
>>
>> which looks kind of ok to me. However what does absolutely make no sense
>> to me is the output of the gst-launcher, which also makes lc_compliance
>> go totally crazy at some point:
>>
>> https://pastebin.com/6MdFL5BL
>>
>> Although I dived through a large number of drivers, I did not get how to
>> set the available formats. While Ricardo included 2 formats, there are
>> obviously 6 or so according to the documentation, however, how are those
>> defined such that they show up correctly there? It's clear to me that
>> the available formats should be defined first, before moving on to
>> getting something out from the device, right? Is this a part of the
>> libcamera part or the driver?
> 
> I had limited access to the doc, so most of the register setting come
> from comparing with other sensors and from 3rd party drivers (nvidia
> kernel)
> 
> Also my isp only supported the 2 formats that I added support to.
> 
>>
>> I had to add quite a bunch of controls to the driver, and without
>> checking the i2c communication in detail, there are at least no errors
>> when I do
>>
>> v4l2-ctl -d /dev/v4l-subdev3 --set-ctrl "test_pattern=2"
>>
>> So I suspect that this actually works as expected...
>>
>> Best
>> Clemens
>>
>>
>> Am 25.02.22 um 08:37 schrieb Ricardo Ribalda Delgado:
>>> Hi
>>>
>>> I think Heiko and Kieran have already given you a lot of clues.
>>>
>>> I would recommend to start looking at i2c communication with i2c
>>> tools: i2cget, i2set, i2cdetect.... before trying any video operation.
>>>
>>> Your life will be much easier if you get your hands into a logic
>>> analyser like this one https://www.saleae.com/
>>>
>>> Regarding the i2c address, bear in mind that vendors and Linux might
>>> use different nomenclature (7 bits to 8 bits).
>>>
>>> Good luck!
>>>
>>> On Thu, Feb 24, 2022 at 6:03 PM Heiko Stuebner <heiko@sntech.de> wrote:
>>>>
>>>> Am Donnerstag, 24. Februar 2022, 16:10:06 CET schrieb Clemens Arth:
>>>>> Hi Kieran,
>>>>>
>>>>> Thx, I’m on my mobile now so I hope copy pasting works… apologies for typos…
>>>>>
>>>>> Kieran Bingham <kieran.bingham@ideasonboard.com> schrieb am Do. 24. Feb.
>>>>> 2022 um 13:49:
>>>>>
>>>>>> Hi Clemens,
>>>>>>
>>>>>> Quoting Clemens Arth (2022-02-23 18:36:28)
>>>>>>> Hi everyone,
>>>>>>>
>>>>>>> + Ricardo and Heiko in CC as the driver originators and rockchip pros...
>>>>>>>
>>>>>>> I'm reaching out to you based on a discussion with Sebastian Fricke, who
>>>>>>> was working on the OV13850 driver for the v5 kernel. I tried getting the
>>>>>>> IMX214 finally to work on the RockPro64 from Pine64, which only works on
>>>>>>> Android so far and I need to get that done on Mainline Linux (I did not
>>>>>>> find anyone who managed that and reported about it). However, I'm also
>>>>>>> totally stuck.
>>>>>>>
>>>>>>> The RockPro64 runs Dietpi, which is essentially Armbian + a few tweaks.
>>>>>>> I'm using the Armbian 5.15.18 kernel, so mainline, with a custom device
>>>>>>> tree, which in the first place powers the MIPI ports. I suspect it is a
>>>>>>> bad idea to have one pinctrl as a placeholder for 4 converters, however,
>>>>>>> I'm not too deep into proxying in the devicetree, so here's the current
>>>>>>> status:
>>>>>>>
>>>>>>> https://pastebin.com/vs277ex0
>>>>>>
>>>>>> Your regulators are all listed as fixed-regulators. Are you sure
>>>>>> there's nothing else to turn on ? I expect this was from another
>>>>>> fragement for the same platform? So I hope it's consistent.
>>>>>>
>>>>>
>>>>> The schematics are here, from which I took the regulator and gpio config.
>>>>> The regulators all seem to be fixed ones. There is just one pin that pulls
>>>>> up all the regulators (DVP_PWR).
>>>>>
>>>>> https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
>>>>>
>>>>> The IMX214 driver has only one pin, the enable_pin, but it is somewhat
>>>>> different from the IMX219 for example. Looking at both driver's code I
>>>>> believe what is the reset_pin with the IMX219 is the enable_pin with the
>>>>> IMX214, but I am not sure about that. There is no MIPI reset on the
>>>>> RockPro64 afaik. Therefore I think it needs to be wired to the DVP_PDN0_H
>>>>> pin, but other drivers define that one specifically and it apparently does
>>>>> something different.
>>>>
>>>> For the pins also check the direction (active_low / active_high).
>>>> I remember having fun somewhere when changing between the vendor
>>>> kernel and mainline.
>>>>
>>>>
>>>>>> Can you validate that the enable-gpios definition is to the correct GPIO
>>>>>> to enable the camera ?
>>>>>>
>>>>>>> The camera is connected to the first MIPI port. The kernel boot logs
>>>>>>> look ok to me (except for the cyclic dependency issue, but I think that
>>>>>>> does not matter much).
>>>>>>>
>>>>>>> https://pastebin.com/hvhdEfxm
>>>>>>>
>>>>>>> Without the camera configured in the device tree, it shows up as 0x0c
>>>>>>> device on the #1 I2C bus, which is a bit suspicious to me given the
>>>>>>> addresses in the documentation and the info given in the kernel
>>>>>>> documentation.
>>>>>>>
>>>>>>> However, I essentially followed the description according to this guide
>>>>>>> to set up the RKISP:
>>>>>>>
>>>>>>> https://linuxtv.org/downloads/v4l-dvb-apis/admin-guide/rkisp1.html
>>>>>>>
>>>>>>> using this:
>>>>>>>
>>>>>>> https://pastebin.com/ZqWC5vhC
>>>>>>>
>>>>>>> It looks like this (see also png attached).
>>>>>>>
>>>>>>> https://pastebin.com/MfTNp5Pd
>>>>>>>
>>>>>>> However, the IMX214 driver does not complain until that point and seems
>>>>>>> to do right. I expected that at least something happens, however it does
>>>>>>> not. The last command does this:
>>>>>>>
>>>>>>> VIDIOC_STREAMON returned -1 (No such device or address) and this is the
>>>>>>> kernel output
>>>>>>>
>>>>>>> [1509.435228] imx214 1-000c: write_table error: -6
>>>>>>> [1509.435868] imx214 1-000c: could not sent common table -6
>>>>>>
>>>>>> -6 is ENXIO 6 No such device or address. So I expect the device isn't
>>>>>> responding to the I2C controller.
>>>>>>
>>>>>> What shows up with i2c-detect -r -y 1 ?
>>>>>>
>>>>>
>>>>>   From the top of my head, it shows 1c on the 0x0c address iirc, but only if
>>>>> I remove the IMX from the DT. Otherwise the driver takes over and it shows
>>>>> UU. I removed the camera physically and it was gone on i2cdetect, so I
>>>>> suspect that it indeed is the camera. From the driver and the documentation
>>>>> I need to configure it 4-lane, as it is hardcoded in the driver (compared
>>>>> to the application notes for registers for the ImX214).
>>>>>
>>>>>
>>>>>>
>>>>>>> There is no more info given, even if I do some "echo 0x3F >
>>>>>>> /sys/class/video4linux/v4l-subdev0/dev_debug" to the subdevs.
>>>>>>>
>>>>>>> Here's the IMX214 documentation btw. that I got through a detour from
>>>>>> CSDN.
>>>>>>>
>>>>>>>
>>>>>> https://www.dropbox.com/sh/5d3mp2akr3kmu7t/AADaAsSxZu2kVSIfEceStwuoa?dl=0
>>>>>>>
>>>>>>> I'm not entirely sure, but there is something wrong somewhere and I
>>>>>>> can't find out if it is with the driver, the RKISP or anything else.
>>>>>>> Here's what "v4l2-ctl -d /dev/v4l-subdev3 --all" gives - not sure but
>>>>>>> shouldn't it show supported resolutions or something?
>>>>>>>
>>>>>>> https://pastebin.com/ckAFPbAs
>>>>>>
>>>>>> You might find it useful to check what is missing to support libcamera
>>>>>> with this sensor, then you can use cam/qcam to test it too. The RKISP1
>>>>>> pipeline handler in libcamera will handle all the media controller
>>>>>> configuration, and identifying the available formats for you, but we
>>>>>> haven't had an IMX214 sensor added yet, so you might need to add a
>>>>>> mapping to the src/libcamera/camera_sensor_properties.cpp sensor
>>>>>> database, and the driver is missing at least V4L2_CID_HBLANK and
>>>>>> V4L2_CID_VBLANK that are required for libcamera.  So it might not be as
>>>>>> straightforward as I'd like, but it would be helpful I expect.
>>>>>
>>>>>
>>>>> I tried that at an earlier stage, to no avail unfortunately. But I will try
>>>>> again as soon as I get back to my desk.
>>>>>
>>>>>>
>>>>>>
>>>>>> But ... I think your issues are more likely underlying hardware or DT
>>>>>> issues, as the device sounds like it's not responding on the i2c
>>>>>> address.
>>>>>>
>>>>>> Sometimes I2C devices have a configurable address, can you check if this
>>>>>> really is the correct I2C address for your camera?
>>>>>>
>>>>>> That’s one of the issues. Ricardo wrote about iirc 0x10 and 0x1a, but the
>>>>> app note says something entirely different (forgot), and my camera appears
>>>>> to be on yet another address…
>>>>
>>>> not specific to cameras, but in the past I had i2c devices that set the
>>>> address depending on the state of a gpio during powerup - which was
>>>> floating in my old case, producing random settings ;-) .
>>>>
>>>>
>>>> Heiko
>>>>
>>>>
>>>
>>>
>>
> 
> 

--------------gj9YOOQQNwsGH3ZX4M4mwU6L
Content-Type: image/jpeg; name="out.jpeg"
Content-Disposition: attachment; filename="out.jpeg"
Content-Transfer-Encoding: base64

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

--------------gj9YOOQQNwsGH3ZX4M4mwU6L--
