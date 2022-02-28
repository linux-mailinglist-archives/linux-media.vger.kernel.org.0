Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710004C64E1
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 09:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbiB1Ie5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 03:34:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbiB1Ie4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 03:34:56 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5119765D3B
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 00:34:15 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id r13so23196570ejd.5
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 00:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l9QPHwIcMlY2yNjNs7YFymK/IFA/0KxkGGZ971nBgNM=;
        b=Yd7PEE6aSyvfE/nAZ8PsPFF74yyOL/YpQTcIHckcB4q4Ucm1iPU9Uy4QpvVUWqlCby
         ukwq4VAl+dbyw4Zu/UVoRyqN/OnsgYP5lOlg88ZFxPQFjBcXbsUAWNAVC7Q6c+dl9ZwT
         iT9ucCDcCFFjhcvjKS1VIz1EsqT/AgQiAPSuBVrN3Kkeq88MMq91Sx981LGd99yB1QX9
         C2tkYMYwOXylzYCMOyzi7X04lXL7P1rzmYOZsBFV3wRcxyG6HySPuQKWL3MFIorx+EBY
         P3gUwOC/2punZRIK99GbyIfDLMiu2VO3nV+EXE+tHHen74oNOF/eknpkGbgtOQeWuWua
         HnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l9QPHwIcMlY2yNjNs7YFymK/IFA/0KxkGGZ971nBgNM=;
        b=CMgN7WRIU44Ce0vEcRsBc2AmZggJVFyMjP/0C60BZ+f3qaRjsx8Ea5mTWVHmys6aY+
         xi3WBhHVSyUw48GphPnemvcwgyQpXTi/pAEZshv9kSrSPdeTbTIFC/Z/avWtIaYZOzUc
         3ucfUhs0vqMRZ53FWQHaIKA6X/lHrHyGA4+iczrGqFheAA+L4xUc2X9fLVoKxNh2zaMa
         pXp/Sd/sZK87O10u3/PqdJ9CcxiXflBhF9yOUWlmgdUUd0KloC22flSRGUYvc4kXn2gp
         Nx14CczIWVUz0HelpqJbQdDIRcwNU/MYbMM6m03h+tz3IgY7gzZ5xJoTlNS9hrCCfK4t
         ln1A==
X-Gm-Message-State: AOAM531E3TiUuvf3mCsrF8QAFYDddn201ra+z6Pd+Z6eF7kILjJWqr8V
        cQront9hkcbCVvy4543ZK1M=
X-Google-Smtp-Source: ABdhPJwM+XYaK6b5y7yGZBo0woAu3vD1QjjqvEdvaG8NMM2oHVtGz0rfmXTsX2l5gdU9QwGYuVyqgg==
X-Received: by 2002:a17:906:6848:b0:6cf:6273:9c47 with SMTP id a8-20020a170906684800b006cf62739c47mr14797495ejs.1.1646037254186;
        Mon, 28 Feb 2022 00:34:14 -0800 (PST)
Received: from [192.168.0.40] (176-66-70-95.static.highway.a1.net. [176.66.70.95])
        by smtp.googlemail.com with ESMTPSA id t7-20020a17090616c700b006d0286453absm4196707ejd.146.2022.02.28.00.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 00:34:13 -0800 (PST)
Message-ID: <19971c19-a269-0ab4-3d92-b2d0a770d230@gmail.com>
Date:   Mon, 28 Feb 2022 09:34:11 +0100
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

Yes, I know - no offense, just an observation, seems that you got a lot 
of the registers right anyway :-)

I need to dig into the i2c stuff indeed... I was playing around with it 
a lot yesterday, but the documentation of the rockpro64 stuff is overall 
real crap imho and I really wonder how to expect that the community will 
fix things without being a hardware/software/kernel pro and wasting tons 
of time for essentially nothing...

there is something weird going on on the I2C bus and 100kHz seems also 
the only frequency that gives at least something. If I manually play 
around with setting gpios there are 2 more interfaces popping up for a 
second or so on 0x19 and 0x1a, which might indeed be the camera 
interfaces, but they vanish immediately, like being powered off or 
something. However, the 400kHz does not give any devices whatsoever -

the i2cget and i2cset tools seem to work, but the 0x0c device does not 
give me any meaningful output with respect to the documented 
registers... and the 16-bit addressing is a pain... so I probably really 
need to do as you suggested and get some debugging interface...

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

