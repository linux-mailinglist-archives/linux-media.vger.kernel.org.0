Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EA71BACB7
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 20:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgD0Sbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 14:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726189AbgD0Sbg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 14:31:36 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB52AC0610D5
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 11:31:35 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id v8so457088wma.0
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=xZP1k7gqSdWAYF4FbPycMJXVRL8C0wOeZu0sUT6QgDI=;
        b=VdIwcHubskApqtoJnaT4he505RZtG4+zzWQTrnP4ZTjPMD2VrqWY6UdlXf1+rfPkOv
         1MOUNshtqCjavzwq8VKHB1+pIGYi+JHpjKZrBYG8T1tjBPaWh3pSRjgf38R/NtJQ0B9K
         l4lzqb/pcs4mO7mJrtjvUnjZedzZAukHu10AqYMYIr6kdr4FpE+UAhrdFBt6TqXwxWWG
         xDdO4hvzo1AZwwDPptwKn0pKA8MFroRqDBWfyOC5hzxO+IjTNWEKJKS+QSVG1EyNtFJ7
         CW3e+P272UvUud9yxLB4Hujlgv5F9twOkaWreBFsBdd4tG62mk8bZnAzV/8OIBffYj+H
         vwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=xZP1k7gqSdWAYF4FbPycMJXVRL8C0wOeZu0sUT6QgDI=;
        b=cWG3+b4m5VA7oC9+WSmmJZDWhqb/7Hb1GQMmd/1Snq76MNIQfJ/DNW0uuiZBZ070hi
         L+WXglMJFUUqpMcH46eugsaKXDfct+D2qTjYzqxBTCTE3mTXm1EdnF5VDvYuadA8QhcS
         4AeLzMS5CsLGSmyTGi/I33TXfVYdyzbLmiZfP9likQvUHtLmI+4gYmdO4qJreO5i9/+8
         2oVagNu9enTZv7hKx1T91k76UahYEM8ZoSTjLHa+zqDFvf+TGHOkdD5Eo2GS3aDYBBjx
         LSzvlBppRibSubcyaz6p6OW+mQ1x+SnW2YOzjdW9TyuQ7LfuhxMbq0H9Cc6LbtQxiphB
         HAhg==
X-Gm-Message-State: AGi0Pua+1WBeQ2UqXiTpUk1cmEup3x4naRqSvcnign0SqlesEEip/ltt
        R9i2fVCmqZ9xH9qIubkX4Q+PoSA5VJE=
X-Google-Smtp-Source: APiQypJLa+n0h868fwk03vwQwDCKQ+xItEyME2Nf/fhh2gLSg+uZ16QG7l8qcivGf7yaFYpNY+SIPA==
X-Received: by 2002:a1c:e302:: with SMTP id a2mr21903wmh.96.1588012294008;
        Mon, 27 Apr 2020 11:31:34 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id t16sm22686677wrb.8.2020.04.27.11.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 11:31:33 -0700 (PDT)
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
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <45817a6a-dd2f-13a6-835b-fd2b04ded23f@gmail.com>
Date:   Mon, 27 Apr 2020 20:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426185007.1954885a@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 26.04.20 18:50, Mauro Carvalho Chehab wrote:
> Em Sun, 26 Apr 2020 13:38:19 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>
>> On 25.04.20 13:22, Mauro Carvalho Chehab wrote:
>>> Hi Patrik,
>>>
>>> Em Fri, 24 Apr 2020 12:07:30 +0200
>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>>   
>>>> On 24.04.20 11:10, Patrik Gfeller wrote:
>>>>> On 24.04.20 10:52, Patrik Gfeller wrote:
>>>>>> On 22.04.20 21:13, Mauro Carvalho Chehab wrote:
>>>>>>> Em Wed, 22 Apr 2020 19:56:56 +0200
>>>>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>>>>>>      
>>>>>>>> On 20.04.20 22:47, Mauro Carvalho Chehab wrote:
>>>>>>>>> Em Mon, 20 Apr 2020 20:27:25 +0200
>>>>>>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>>>>>>>>> Me again ... sorry to ask such a basic question, but I can't get
>>>>>>>>>> your
>>>>>>>>>> modified source code. I get the following error:
>>>>>>>>>>        > git clone https://git.linuxtv.$ sudo make M=drivers/staging/media/atomisp/ modules_install
>>>>>>>>>> org/mchehab/experimental.git/
>>>>>>>>>> Cloning into 'experimental'...
>>>>>>>>>> warning: adding alternate object store:
>>>>>>>>>> https://git.linuxtv.org/git/linux.git/
>>>>>>>>>> warning: adding alternate object store:
>>>>>>>>>> https://git.linuxtv.org/git/media_tree.git/
>>>>>>>>>> warning: adding alternate object store:
>>>>>>>>>> https://git.linuxtv.org/git/linux.git/
>>>>>>>>>> error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f under
>>>>>>>>>> https://git.linuxtv.org/mchehab/experimental.git
>>>>>>>>>> Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
>>>>>>>>>> while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c987.
>>>>>>>>>> error: fetch failed.
>>>>>>>>>>
>>>>>>>>>> Do I use the wrong command?
>>>>>>>>> Better to use git:// url:
>>>>>>>>>
>>>>>>>>>       git clone git://git.linuxtv.org/mchehab/experimental.git/
>>>>>>>> I was able to download and compile the code. I installed the kernel
>>>>>>>> and
>>>>>>>> tried to boot; unfortunately it hangs with the message "Loading
>>>>>>>> initial
>>>>>>>> ramdisk ..." - after I start the old kernel I check kern.log and
>>>>>>>> syslog
>>>>>>>> - but I do not see entries from the failed boot attempt. I'll read
>>>>>>>> into
>>>>>>>> the topic and try around. This will take some time ... so there
>>>>>>>> will be
>>>>>>>> a dealy, but it's not that I do not care or lacking interest, I just
>>>>>>>> first have to sort this out.
>>>>>>> Well, try to build it first without the atomisp driver. This would
>>>>>>> allow
>>>>>>> you to see what's going on.
>>>>>> I was able to solve the problem I had with the ramdisk - I had to
>>>>>> strip the kernel modules, probably the ramdisk file was too big.
>>>>>>
>>>>>> It is possible to boot with the atomisp driver, but I can not see the
>>>>>> camera yet - but maybe that's due to missing firmware, as there were
>>>>>> warnings when I installed the kernel that firmware files are missing.
>>>> I've added the missing firmware files and now I do not have warnings
>>>> when I create the ramdisk. Unfortunately it makes no difference - the
>>>> device does not work yet (dmesg looks the same).
>>>>>> The following I found in dmesg:
>>>>>>
>>>>>> [    9.331011] kernel: atomisp_ov2680: module is from the staging
>>>>>> directory, the quality is unknown, you have been warned.
>>>>>> [    9.402456] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing
>>>>>> atomisp module subdev data.PMIC ID 1
>>>>>> [    9.421113] kernel: acpi OVTI2680:00: Failed to find gmin variable
>>>>>> OVTI2680:00_CamClk
>>>>>> [    9.433478] kernel: acpi OVTI2680:00: Failed to find gmin variable
>>>>>> OVTI2680:00_ClkSrc
>>>>>> [    9.443146] kernel: acpi OVTI2680:00: Failed to find gmin variable
>>>>>> OVTI2680:00_CsiPort
>>>>>> [    9.456677] kernel: acpi OVTI2680:00: Failed to find gmin variable
>>>>>> OVTI2680:00_CsiLanes
>>>>>> [    9.479411] kernel: ov2680 i2c-OVTI2680:00: supply V1P8SX not
>>>>>> found, using dummy regulator
>>>>>> [    ...
>>>>>> [    9.510282] kernel: ov2680 i2c-OVTI2680:00: supply V2P8SX not
>>>>>> found, using dummy regulator
>>>>>> [    ...
>>>>>> [    9.532284] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not
>>>>>> found, using dummy regulator
>>>>>> [    9.536200] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not
>>>>>> found, using dummy regulator
>>>>>> [   ...'
>>>>>> [    9.592064] kernel: ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
>>>>>> [    9.623628] kernel: ov2680 i2c-OVTI2680:00: camera pdata: port: 0
>>>>>> lanes: 1 order: 00000002
>>>>>> [    9.628258] kernel: ov2680 i2c-OVTI2680:00: sensor_revision id =
>>>>>> 0x2680, rev= 0
>>>>>> [    9.636582] kernel: ov2680 i2c-OVTI2680:00: register atomisp i2c
>>>>>> module type 1
>>>>>>
>>>>>> The first signs of live :-) ... I'll try to find the firmware files
>>>>>> to see if it makes a difference.
>>> Atomisp driver uses ACPI to detect the camera configuration. As you
>>> can see at drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:
>>>
>>> 	static const struct acpi_device_id ov2680_acpi_match[] = {
>>> 	        {"XXOV2680"},
>>> 	        {"OVTI2680"},
>>> 	        {},
>>> 	};
>>> 	MODULE_DEVICE_TABLE(acpi, ov2680_acpi_match);
>>>
>>> The regulator data is parsed at
>>> drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:
>>>
>>>           if (pmic_id == PMIC_REGULATOR) {
>>>                   gmin_subdevs[i].v1p8_reg = regulator_get(dev, "V1P8SX");
>>>                   gmin_subdevs[i].v2p8_reg = regulator_get(dev, "V2P8SX");
>>>                   gmin_subdevs[i].v1p2_reg = regulator_get(dev, "V1P2A");
>>>                   gmin_subdevs[i].v2p8_vcm_reg = regulator_get(dev, "VPROG4B");
>>>
>>>                   /* Note: ideally we would initialize v[12]p8_on to the
>>>                    * output of regulator_is_enabled(), but sadly that
>>>                    * API is broken with the current drivers, returning
>>>                    * "1" for a regulator that will then emit a
>>>                    * "unbalanced disable" WARNing if we try to disable
>>>                    * it.
>>>                    */
>>>           }
>>>
>>> There are two things that could be the cause of this issue:
>>>
>>> 1) Some patch could have broken support for it.
>>>
>>> Doing a:
>>>
>>> 	git diff a49d25364dfb drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>>>
>>> will allow you to check the changes on this file.
>>>
>>> 2) Maybe recent BIOSes may have changed the names of the ACPI variables.
>>>
>>> For instance, from the code, the driver should be seeking for those
>>> variables for OV2680 (and several others that seem to be common among
>>> multiple combinations):
>>>
>>> 	XXOV2680:00_CsiPort
>>> 	XXOV2680:00_CsiLanes
>>> 	XXOV2680:00_CamClk
>>>
>>> It would be possible, that, on a modern BIOS, such vars were, for example,
>>> renamed to 'XXOV2680_V2*'.
>> Thank you for the explanations. I've read the article about ACPI and
>> have now a basic idea what it is.
>>
>> I tried to figure out if the ACPI variable names changed ... in the ACPI
>> dump the variables seem to match the code (if I understood correctly). I
>> tried to scan the firmware file to check if there's a hint regarding a
>> changed variable:
>>
>> $ strings shisp_2401a0_v21.bin | grep 2680
>> $ strings shisp_2401a0_v21.bin | grep OV
> No, you're looking at the wrong place. This should be at the system
> board's BIOS, and not at something that the driver would load.
>
> Just run (as root):
>
> 	# dmidecode
>
> and check the name of your board. It should be similar to this:
>
> 	...
> 	System Information
> 	        Manufacturer: Intel Corporation
> 	        Product Name: (something)
>
> The "(something)" is the board name. The atomisp driver will seek for
> it. So, you need to patch the driver (using the example I gave) in
> order for it to look at the right DMI_MATCH() table. Right now,
> the driver knows only those:
>
> 	$ git grep DMI_MATCH drivers/staging/media/atomisp/
> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "T100TA"),
> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "TABLET"),	
> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_VERSION, "MRD 7"),
> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "ST70408"),
> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "VTA0803"),
>
> Your asus board should likely use "ASUS", "_ASUS_" or something similar.
> So, you should take a look on the patch I sent you and modify it to
> match whatever name dmidecode printed.
>
> See for example this patch:
>
> 	https://www.spinics.net/lists/linux-media/msg126880.html
>
> If it finds the right table, it should end by calling gmin_subdev_add(),
> with should use DTST table, also from the ACPI table inside the system's BIOS.
Now I understood :-). I've made the modifications as you explained and 
indeed the errors regarding

OVTI2680:00_CamClk
OVTI2680:00_ClkSrc
OVTI2680:00_CsiPort
OVTI2680:00_CsiLanes

are gone. Now we have the following in dmesg:

[    8.815960] kernel: mc: Linux media interface: v0.10
[    8.858458] kernel: videodev: Linux video capture interface: v2.00
[    8.876864] kernel: input: Intel HID events as 
/devices/pci0000:00/INT33D5:00/input/input16
[    8.887625] kernel: 8086228A:01: ttyS5 at MMIO 0x91a1f000 (irq = 40, 
base_baud = 2764800) is a 16550A
[    8.894655] kernel: dw_dmac INTL9C60:01: DesignWare DMA Controller, 8 
channels
[    8.929818] kernel: atomisp_ov2680: module is from the staging 
directory, the quality is unknown, you have been warned.
[    8.989630] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing 
atomisp module subdev data.PMIC ID 1
[    8.989887] kernel: ov2680 i2c-OVTI2680:00: supply V1P8SX not found, 
using dummy regulator
[    8.989954] kernel: ov2680 i2c-OVTI2680:00: supply V2P8SX not found, 
using dummy regulator
[    8.989977] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not found, 
using dummy regulator
[    8.989998] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not found, 
using dummy regulator
[    9.033505] kernel: ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
[    9.061511] kernel: ov2680 i2c-OVTI2680:00: camera pdata: port: 0 
lanes: 1 order: 00000002
[    9.065178] kernel: ov2680 i2c-OVTI2680:00: sensor_revision id = 
0x2680, rev= 0
[    9.071095] kernel: ov2680 i2c-OVTI2680:00: register atomisp i2c 
module type 1

Laurent explained me how to enable internal debug messages. I'll read 
more about this to understand how to use it and hope this will give a 
more detailed insight.


great to see some progress :-),

thanks and kind regards,

Patrik


>
> Thanks,
> Mauro
