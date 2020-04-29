Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8BA1BE5B2
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 19:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgD2R4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 13:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2R4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 13:56:54 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2F8C03C1AE
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 10:56:53 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id k13so3638963wrw.7
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 10:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wcgCXcgUW7o5ojlHH+PSRmsCyNf7kKlBvq3eP1SU0eI=;
        b=c7x3Jgq9ZuLAkgloLHb3LHZ1k0Ctpz96y/LUHodXa0qK/D9j0IywT8VpkjYqVVrT59
         bJIEUD2Ma/UUuXrIjJ5y3VyRDAZ9+sQw+bAmMPxgAZklcbbQOpJeqOUhXwceNkWqA9nI
         NU/b93+lbTeE3J3B1qvL4XfrhPIjx98QjOqN6IPH5P7X/A7FCjrCh5X2y/nGQkb2pK7l
         Q8Z15DW+WO0LF6ySZR7PZr+CTXFFiBZbzFui9HZPVNECVbQ35Vs7Bdd8QgCbNn/xuz5P
         uEmExxsHys1W6HRJMMCQUkujsbadmSUMr/8CvFNP6TEWI5PQGrp7lDGK4vFzYo4OmnnX
         mVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wcgCXcgUW7o5ojlHH+PSRmsCyNf7kKlBvq3eP1SU0eI=;
        b=ulI0YrGRsuxpUi7vxTnyv88v4MPZUmBimn8KYB+n1xYcznp69y+tEYuGWA1EXIaIbu
         uwxEEqfeSuQZfdR2R97ozsyH3lbMmdW8JCh+aoGOdeu8Yeui2jdJ0jALK+VaX7hppyz7
         UmqgRIRNiygTWneY1hvcd1o+HLKywueesCaN3H1xi1BO2hG5ia8/0/zD2wHYZ+qpXVil
         q6phMHm3CsSFIlMJU00T2lxmWLvXUou9MVjW/V1VO6v+YYLdVJLBJg07Vk0dOhVJkq4j
         BWXzqDLtnB4xdFD9i+hvsCNTPaYH7bMtNE4j4JMb3Oih9poNYVOJzYALIqhqBMdkg03C
         tz5A==
X-Gm-Message-State: AGi0PubAPBGfHLABZF43uzE1TDC88fC7ZUqghobkA7Vx+ntcxMwFna4J
        M0QQc0xJHzi9z4jEUHVT6sm2djG61w8=
X-Google-Smtp-Source: APiQypIO/SgGUrmZo1XpWEOJADRwZZX6tHhnZ+1wJkqjtELZDErYbJEO+CUWzvBXW03hkJBx7WsQdg==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr40054187wrs.283.1588183011801;
        Wed, 29 Apr 2020 10:56:51 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id z22sm8778017wma.20.2020.04.29.10.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:56:51 -0700 (PDT)
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
 <20200418172549.7cca07a7@coco.lan> <20200418172654.74a1eeea@coco.lan>
 <1d529105-3b7d-38d0-b7a2-d385b2221ff7@gmail.com>
 <20200420013109.65babb54@coco.lan>
 <e45de3ea-4b5c-f2d0-0844-1233ca15a939@gmail.com>
 <eb83f789-9595-55f0-d922-bab00ae85cff@gmail.com>
 <20200420224750.28c0181d@coco.lan>
 <dd8ab5df-31c7-f009-36e4-ca4fd0605e97@gmail.com>
 <20200422211344.2ec3d93e@coco.lan>
 <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
 <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
 <682558b0-a2cf-9fe2-6e54-20462ecccb5d@gmail.com>
 <20200425132255.4bf872b2@coco.lan>
 <131a4247-cef3-d651-a0ea-defd32b8bf20@gmail.com>
 <20200426185007.1954885a@coco.lan>
 <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
 <20200427235027.15cd4e03@coco.lan>
 <d9ec5067-142c-66c9-c412-51ddf38e44f7@gmail.com>
 <20200429011339.03af3c2a@coco.lan>
Message-ID: <3b7366b9-463d-c49b-0f2d-51a1d5475a9d@gmail.com>
Date:   Wed, 29 Apr 2020 19:56:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429011339.03af3c2a@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 29.04.20 01:13, Mauro Carvalho Chehab wrote:
> Em Tue, 28 Apr 2020 19:59:28 +0200
> Patrik Gfeller<patrik.gfeller@gmail.com>  escreveu:
>
>> On 27.04.20 23:50, Mauro Carvalho Chehab wrote:
>>> Em Mon, 27 Apr 2020 20:31:31 +0200
>>> Patrik Gfeller<patrik.gfeller@gmail.com>  escreveu:
>>>> On 26.04.20 18:50, Mauro Carvalho Chehab wrote:
>>>>> No, you're looking at the wrong place. This should be at the system
>>>>> board's BIOS, and not at something that the driver would load.
>>>>>
>>>>> Just run (as root):
>>>>>
>>>>> 	# dmidecode
>>>>>
>>>>> and check the name of your board. It should be similar to this:
>>>>>
>>>>> 	...
>>>>> 	System Information
>>>>> 	        Manufacturer: Intel Corporation
>>>>> 	        Product Name: (something)
>>>>>
>>>>> The "(something)" is the board name. The atomisp driver will seek for
>>>>> it. So, you need to patch the driver (using the example I gave) in
>>>>> order for it to look at the right DMI_MATCH() table. Right now,
>>>>> the driver knows only those:
>>>>>
>>>>> 	$ git grep DMI_MATCH drivers/staging/media/atomisp/
>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "T100TA"),
>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "TABLET"),	
>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_VERSION, "MRD 7"),
>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "ST70408"),
>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "VTA0803"),
>>>>>
>>>>> Your asus board should likely use "ASUS", "_ASUS_" or something similar.
>>>>> So, you should take a look on the patch I sent you and modify it to
>>>>> match whatever name dmidecode printed.
>>>>>
>>>>> See for example this patch:
>>>>>
>>>>> 	https://www.spinics.net/lists/linux-media/msg126880.html
>>>>>
>>>>> If it finds the right table, it should end by calling gmin_subdev_add(),
>>>>> with should use DTST table, also from the ACPI table inside the system's BIOS.
>>>> Now I understood :-). I've made the modifications as you explained and
>>>> indeed the errors regarding
>>>>
>>>> OVTI2680:00_CamClk
>>>> OVTI2680:00_ClkSrc
>>>> OVTI2680:00_CsiPort
>>>> OVTI2680:00_CsiLanes
>>>>
>>>> are gone.
>>> Great! Could you please submit the exact patch you applied? I'll place
>>> it on my experimental tree:
>> Here is the patch for the change I made:
>>
>> diff --git
>> a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>> b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>> index eef7123a586f..081f9be6ec29 100644
>> ---
>> a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>> +++
>> b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>> @@ -269,6 +269,15 @@ static struct gmin_cfg_var i8880_vars[] = {
>>        {},
>>    };
>>
>> +static struct gmin_cfg_var asus_vars[] = {
>> +    {"OVTI2680:00_CsiPort", "0"},
>> +    {"OVTI2680:00_CsiLanes", "1"},
>> +    {"OVTI2680:00_CsiFmt", "15"},
>> +    {"OVTI2680:00_CsiBayer", "0"},
>> +    {"OVTI2680:00_CamClk", "1"},
>> +    {},
>> +};
>> +
>>    static const struct dmi_system_id gmin_vars[] = {
>>        {
>>            .ident = "BYT-T FFD8", @@ -306,6 +315,13 @@ static const struct dmi_system_id gmin_vars[] 
>> = {          },          .driver_data = i8880_vars,      }, +    { 
>> +        .ident = "T101HA",
>> +        .matches = {
>> +            DMI_MATCH(DMI_BOARD_NAME, "T101HA"),
>> +        },
>> +        .driver_data = asus_vars,
>> +    },
>>        {}
>>    };
> Thanks for testing it. Just applied this patch upstream, together with a
> bunch of other cleanup patches.
>
>>>> Now we have the following in dmesg:
>>>>
>>>> [    8.815960] kernel: mc: Linux media interface: v0.10
>>>> [    8.858458] kernel: videodev: Linux video capture interface: v2.00
>>>> [    8.876864] kernel: input: Intel HID events as
>>>> /devices/pci0000:00/INT33D5:00/input/input16
>>>> [    8.887625] kernel: 8086228A:01: ttyS5 at MMIO 0x91a1f000 (irq = 40,
>>>> base_baud = 2764800) is a 16550A
>>>> [    8.894655] kernel: dw_dmac INTL9C60:01: DesignWare DMA Controller, 8
>>>> channels
>>>> [    8.929818] kernel: atomisp_ov2680: module is from the staging
>>>> directory, the quality is unknown, you have been warned.
>>>> [    8.989630] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing
>>>> atomisp module subdev data.PMIC ID 1
>>>> [    8.989887] kernel: ov2680 i2c-OVTI2680:00: supply V1P8SX not found,
>>>> using dummy regulator
>>>> [    8.989954] kernel: ov2680 i2c-OVTI2680:00: supply V2P8SX not found,
>>>> using dummy regulator
>>> Did you apply this patch also?
>>>
>>> 	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp&id=898564642042fdd136a16c3ee120a00061c13940
>>>
>>> I guess this would get rid of the two above warnings.
>>>   
>> The patch was already applied when I did the test width the driver - the
>> warnings are also present with it.
> Ok. Yet, I found an issue on that patch. Just merged an improvement.
>
> Could you please test it again?

Of course - I pulled the changes and recompiled the kernel. This is  
what we see if I reboot the system:

Apr 29 19:49:04 ASUS kernel: [    8.821277] atomisp_ov2680: loading 
out-of-tree module taints kernel.
Apr 29 19:49:04 ASUS kernel: [    8.824016] atomisp_ov2680: module is 
from the staging directory, the quality is unknown, you have been warned.
Apr 29 19:49:04 ASUS kernel: [    8.945856] ov2680 i2c-OVTI2680:00: 
gmin: initializing atomisp module subdev data.PMIC ID 1
Apr 29 19:49:04 ASUS kernel: [    8.949070] ov2680 i2c-OVTI2680:00: 
supply V1P8SX not found, using dummy regulator
Apr 29 19:49:04 ASUS kernel: [    8.952036] ov2680 i2c-OVTI2680:00: 
supply V2P8SX not found, using dummy regulator
Apr 29 19:49:04 ASUS kernel: [    8.954893] ov2680 i2c-OVTI2680:00: 
supply V1P2A not found, using dummy regulator
Apr 29 19:49:04 ASUS kernel: [    8.957849] ov2680 i2c-OVTI2680:00: 
supply VPROG4B not found, using dummy regulator
Apr 29 19:49:04 ASUS kernel: [    9.013717] ov2680 i2c-OVTI2680:00: 
unable to set PMC rate 1
Apr 29 19:49:04 ASUS kernel: [    9.041777] ov2680 i2c-OVTI2680:00: 
camera pdata: port: 0 lanes: 1 order: 00000002
Apr 29 19:49:04 ASUS kernel: [    9.048368] ov2680 i2c-OVTI2680:00: 
sensor_revision id = 0x2680, rev= 0
Apr 29 19:49:04 ASUS kernel: [    9.051525] ov2680 i2c-OVTI2680:00: 
register atomisp i2c module type 1

I've also added the following boot parameter to make sure we get all 
debug messages from the module: dyndbg="module atomisp_ov2680 +pm" (as 
explained by Laurent)

I've checked the code of atomisp_ov2680 and there are some dev_dbg 
calls, but either I did the configuration not correct, or we do not 
reach those lines yet (or I looked at the wrong place; I checked dmesg 
and kern.log).

>> But if I read the code correctly this is expected, as we try to get
>> those regulators in any case - only if we have an error on two of them
>> we try the "Regulator1p8v" & "Regulator2p8v". As we do not see warnings
>> for those two regulators I assume this worked.
> No. It probably returned a valid "dummy" regulator. That's not what
> we want.
>
> There are still some things that could be missing for it to work
> properly with ISP2401. I'm trying to do some cleanups in order to
> be sure that everything needed for isp2401 will be there.
Just let me know if I shall try something.
>
> Thanks,
> Mauro

kind regards,
Patrik

