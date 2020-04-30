Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0F61BF1E9
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 09:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgD3H46 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 03:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgD3H46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 03:56:58 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB81C035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 00:56:57 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g12so760869wmh.3
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kA3idO8H0MCwpG83buXFLvEUEeXdb3Kv1r+UI8P2yP0=;
        b=Vi7DmecNFOslaqP6CYghng8yvWmfRne2LVfFcgJPbYw+I32ch9KGpLowbdon64AOk4
         NZTsy22dsnOvPjXtOsWrehK3d/ySm0c92bZtA9HiDuCH8ejqSwAiwnvwz4hdUYaZuA8J
         c4M5KEkOwOZGTEg14mUXmxIGOtXA2f2+mDLclwX+JUw+M2EJcEJyJ1zgG7A3nTzI/pAn
         PiVwNZrcEsLSu7LbJbgxQR4S7E9QvmHRrdByNhhGl8IRf28VV8w4uVKjgs3liMb0C3Q6
         92HgKZU6Idz7nlqohPa2TDS9sjJ/KCy0AcSbmCwsXcnVD8DY/gWfkLqmgs120bqHAfMw
         DjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kA3idO8H0MCwpG83buXFLvEUEeXdb3Kv1r+UI8P2yP0=;
        b=JzVa8UQiaBlDUdLFGQBzv0CPHNr1Y/fFf3NzeHkOp0NTJvu9WtqGVh8jgenZTwSysC
         BzchgUyLadH7XD31G3EDMESa/5ge8ANK2QoWvhLxzXIkfo3sDxRvQqkTgyqWM25E8Y0n
         HtfBx9A/9xBNiW0mAjtZPG+Q2JsQzgw4R5a3JUg+0f5UB+vtcfejvNSgJgp/B3661IDo
         G41yK3AnGUajhZ0AHlRYJYMLegTCQUZSijotNr7t3saL7HL1EbfJTlvTP2T9p1zGfaEy
         LWytZxkaRu+h6UFH/9M9yn6yUSaUpNqYIpfnXnU3wXGD7HWMfuhFp7ZurQ/dSFoUF+Fs
         /94Q==
X-Gm-Message-State: AGi0PubrYMrKUZgdDZrsEM1X42ELMtZqyP5hFrmyxJxPXZNgZPqx0MbM
        Iwk5jln9DeIDjDL6iPlE2El4vKCcmEk=
X-Google-Smtp-Source: APiQypJIBxjHPmKuG/fJyUEBQYBw1N3E4UtAVajmRd00V5aZkNdviANoJodQYvQpwzBNmw9yS/brtQ==
X-Received: by 2002:a1c:750a:: with SMTP id o10mr1490706wmc.161.1588233415737;
        Thu, 30 Apr 2020 00:56:55 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id y70sm11952039wmc.36.2020.04.30.00.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 00:56:55 -0700 (PDT)
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
 <3b7366b9-463d-c49b-0f2d-51a1d5475a9d@gmail.com>
 <20200429201753.3b2d679b@coco.lan>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
Date:   Thu, 30 Apr 2020 09:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429201753.3b2d679b@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 29.04.20 20:17, Mauro Carvalho Chehab wrote:
> Em Wed, 29 Apr 2020 19:56:49 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>
>> On 29.04.20 01:13, Mauro Carvalho Chehab wrote:
>>> Em Tue, 28 Apr 2020 19:59:28 +0200
>>> Patrik Gfeller<patrik.gfeller@gmail.com>  escreveu:
>>>   
>>>> On 27.04.20 23:50, Mauro Carvalho Chehab wrote:
>>>>> Em Mon, 27 Apr 2020 20:31:31 +0200
>>>>> Patrik Gfeller<patrik.gfeller@gmail.com>  escreveu:
>>>>>> On 26.04.20 18:50, Mauro Carvalho Chehab wrote:
>>>>>>> No, you're looking at the wrong place. This should be at the system
>>>>>>> board's BIOS, and not at something that the driver would load.
>>>>>>>
>>>>>>> Just run (as root):
>>>>>>>
>>>>>>> 	# dmidecode
>>>>>>>
>>>>>>> and check the name of your board. It should be similar to this:
>>>>>>>
>>>>>>> 	...
>>>>>>> 	System Information
>>>>>>> 	        Manufacturer: Intel Corporation
>>>>>>> 	        Product Name: (something)
>>>>>>>
>>>>>>> The "(something)" is the board name. The atomisp driver will seek for
>>>>>>> it. So, you need to patch the driver (using the example I gave) in
>>>>>>> order for it to look at the right DMI_MATCH() table. Right now,
>>>>>>> the driver knows only those:
>>>>>>>
>>>>>>> 	$ git grep DMI_MATCH drivers/staging/media/atomisp/
>>>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
>>>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "T100TA"),
>>>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "TABLET"),	
>>>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_VERSION, "MRD 7"),
>>>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "ST70408"),
>>>>>>> 	drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c:                       DMI_MATCH(DMI_BOARD_NAME, "VTA0803"),
>>>>>>>
>>>>>>> Your asus board should likely use "ASUS", "_ASUS_" or something similar.
>>>>>>> So, you should take a look on the patch I sent you and modify it to
>>>>>>> match whatever name dmidecode printed.
>>>>>>>
>>>>>>> See for example this patch:
>>>>>>>
>>>>>>> 	https://www.spinics.net/lists/linux-media/msg126880.html
>>>>>>>
>>>>>>> If it finds the right table, it should end by calling gmin_subdev_add(),
>>>>>>> with should use DTST table, also from the ACPI table inside the system's BIOS.
>>>>>> Now I understood :-). I've made the modifications as you explained and
>>>>>> indeed the errors regarding
>>>>>>
>>>>>> OVTI2680:00_CamClk
>>>>>> OVTI2680:00_ClkSrc
>>>>>> OVTI2680:00_CsiPort
>>>>>> OVTI2680:00_CsiLanes
>>>>>>
>>>>>> are gone.
>>>>> Great! Could you please submit the exact patch you applied? I'll place
>>>>> it on my experimental tree:
>>>> Here is the patch for the change I made:
>>>>
>>>> diff --git
>>>> a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>>>> b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>>>> index eef7123a586f..081f9be6ec29 100644
>>>> ---
>>>> a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>>>> +++
>>>> b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
>>>> @@ -269,6 +269,15 @@ static struct gmin_cfg_var i8880_vars[] = {
>>>>         {},
>>>>     };
>>>>
>>>> +static struct gmin_cfg_var asus_vars[] = {
>>>> +    {"OVTI2680:00_CsiPort", "0"},
>>>> +    {"OVTI2680:00_CsiLanes", "1"},
>>>> +    {"OVTI2680:00_CsiFmt", "15"},
>>>> +    {"OVTI2680:00_CsiBayer", "0"},
>>>> +    {"OVTI2680:00_CamClk", "1"},
>>>> +    {},
>>>> +};
>>>> +
>>>>     static const struct dmi_system_id gmin_vars[] = {
>>>>         {
>>>>             .ident = "BYT-T FFD8", @@ -306,6 +315,13 @@ static const struct dmi_system_id gmin_vars[]
>>>> = {          },          .driver_data = i8880_vars,      }, +    {
>>>> +        .ident = "T101HA",
>>>> +        .matches = {
>>>> +            DMI_MATCH(DMI_BOARD_NAME, "T101HA"),
>>>> +        },
>>>> +        .driver_data = asus_vars,
>>>> +    },
>>>>         {}
>>>>     };
>>> Thanks for testing it. Just applied this patch upstream, together with a
>>> bunch of other cleanup patches.
>>>   
>>>>>> Now we have the following in dmesg:
>>>>>>
>>>>>> [    8.815960] kernel: mc: Linux media interface: v0.10
>>>>>> [    8.858458] kernel: videodev: Linux video capture interface: v2.00
>>>>>> [    8.876864] kernel: input: Intel HID events as
>>>>>> /devices/pci0000:00/INT33D5:00/input/input16
>>>>>> [    8.887625] kernel: 8086228A:01: ttyS5 at MMIO 0x91a1f000 (irq = 40,
>>>>>> base_baud = 2764800) is a 16550A
>>>>>> [    8.894655] kernel: dw_dmac INTL9C60:01: DesignWare DMA Controller, 8
>>>>>> channels
>>>>>> [    8.929818] kernel: atomisp_ov2680: module is from the staging
>>>>>> directory, the quality is unknown, you have been warned.
>>>>>> [    8.989630] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing
>>>>>> atomisp module subdev data.PMIC ID 1
>>>>>> [    8.989887] kernel: ov2680 i2c-OVTI2680:00: supply V1P8SX not found,
>>>>>> using dummy regulator
>>>>>> [    8.989954] kernel: ov2680 i2c-OVTI2680:00: supply V2P8SX not found,
>>>>>> using dummy regulator
>>>>> Did you apply this patch also?
>>>>>
>>>>> 	https://git.linuxtv.org/mchehab/experimental.git/commit/?h=atomisp&id=898564642042fdd136a16c3ee120a00061c13940
>>>>>
>>>>> I guess this would get rid of the two above warnings.
>>>>>      
>>>> The patch was already applied when I did the test width the driver - the
>>>> warnings are also present with it.
>>> Ok. Yet, I found an issue on that patch. Just merged an improvement.
>>>
>>> Could you please test it again?
>> Of course - I pulled the changes and recompiled the kernel. This is
>> what we see if I reboot the system:
>>
>> Apr 29 19:49:04 ASUS kernel: [    8.821277] atomisp_ov2680: loading
>> out-of-tree module taints kernel.
>> Apr 29 19:49:04 ASUS kernel: [    8.824016] atomisp_ov2680: module is
>> from the staging directory, the quality is unknown, you have been warned.
>> Apr 29 19:49:04 ASUS kernel: [    8.945856] ov2680 i2c-OVTI2680:00:
>> gmin: initializing atomisp module subdev data.PMIC ID 1
>> Apr 29 19:49:04 ASUS kernel: [    8.949070] ov2680 i2c-OVTI2680:00:
>> supply V1P8SX not found, using dummy regulator
>> Apr 29 19:49:04 ASUS kernel: [    8.952036] ov2680 i2c-OVTI2680:00:
>> supply V2P8SX not found, using dummy regulator
> The above don't sound right.
>
> I changed the logic to use regulator_get_optional():
>
>                 gmin_subdevs[i].v1p8_reg = regulator_get_optional(dev, "V1P8SX");
>                 gmin_subdevs[i].v2p8_reg = regulator_get_optional(dev, "V2P8SX");
>
> With that, probing to "V1P8SX" and "V2P8SX" wouldn't print any messages.
>
> So, I suspect that either you're missing patches on your tree or
> you booted an older Kernel.
>
> The last patch on my tree is currently this one:
>
> 	commit 4c922df10252f4bd3f28187eba36056aa3c3c06e (experimental/atomisp)
> 	Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 	Date:   Wed Apr 29 11:50:52 2020 +0200
>
> 	    media: atomisp2: get rid of ia_css_sc_param.h version dependency
For my first test tried to re-compile to module, without the whole 
kernel. That was a mistake, as I mixed something up, probably it loaded 
an old version of the module ... to be on the save side the steps I used 
this time (in case we see something unexpected and for my later reference):

$ git log --oneline
4c922df10252 (HEAD -> atomisp, origin/atomisp) media: atomisp2: get rid 
of ia_css_sc_param.h version dependency
...

$ make -j4 clean
$ make -j4
$ sudo make modules_install INSTALL_MOD_STRIP=1
$ sudo make install

I configured the following boot parameters:
linux    /boot/vmlinuz-5.7.0-rc1+ 
root=UUID=7c547d86-dd95-4cb2-b7ad-e46368c8eed3 ro  ignore_loglevel 
verbose fbcon=rotate:1 module_blacklist=intel_atomisp2_pm dyndbg="module 
atomisp_ov2680 +pm; module atomisp +pm"

This produces the following log:

[    9.111674] kernel: mc: Linux media interface: v0.10
[    9.177076] kernel: videodev: Linux video capture interface: v2.00
[    9.248302] kernel: atomisp_ov2680: module is from the staging 
directory, the quality is unknown, you have been warned.
[    9.303134] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing 
atomisp module subdev data.PMIC ID 1
[    9.309529] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not found, 
using dummy regulator
[    9.312532] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not found, 
using dummy regulator
[    9.317966] kernel: ov2680 i2c-OVTI2680:00: supply Regulator1p8v not 
found, using dummy regulator
[    9.321119] kernel: ov2680 i2c-OVTI2680:00: supply Regulator2p8v not 
found, using dummy regulator
[    9.378805] kernel: ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
[    9.406807] kernel: ov2680 i2c-OVTI2680:00: camera pdata: port: 1 
lanes: 1 order: 00000002
[    9.410458] kernel: ov2680 i2c-OVTI2680:00: sensor_revision id = 
0x2680, rev= 0
[    9.414680] kernel: ov2680 i2c-OVTI2680:00: register atomisp i2c 
module type 1

Strange that it did not find the regulators 1p8v and 2p8v; as they are 
in the ACPI information:

Local0 = Package (0x12)
                         {
                             "CamId",
                             "ov2680",
                             "CamType",
                             "1",
                             "CsiPort",
                             "0",
                             "CsiLanes",
                             "1",
                             "CsiFmt",
                             "15",
                             "CsiBayer",
                             "0",
                             "CamClk",
                             "1",
                             "Regulator1p8v",
                             "0",
                             "Regulator2p8v",
                             "0"
                         }
>> Apr 29 19:49:04 ASUS kernel: [    8.954893] ov2680 i2c-OVTI2680:00:
>> supply V1P2A not found, using dummy regulator
>> Apr 29 19:49:04 ASUS kernel: [    8.957849] ov2680 i2c-OVTI2680:00:
>> supply VPROG4B not found, using dummy regulator
>> Apr 29 19:49:04 ASUS kernel: [    9.013717] ov2680 i2c-OVTI2680:00:
>> unable to set PMC rate 1
>> Apr 29 19:49:04 ASUS kernel: [    9.041777] ov2680 i2c-OVTI2680:00:
>> camera pdata: port: 0 lanes: 1 order: 00000002
>> Apr 29 19:49:04 ASUS kernel: [    9.048368] ov2680 i2c-OVTI2680:00:
>> sensor_revision id = 0x2680, rev= 0
>> Apr 29 19:49:04 ASUS kernel: [    9.051525] ov2680 i2c-OVTI2680:00:
>> register atomisp i2c module type 1
>>
>> I've also added the following boot parameter to make sure we get all
>> debug messages from the module: dyndbg="module atomisp_ov2680 +pm" (as
>> explained by Laurent)
>>
>> I've checked the code of atomisp_ov2680 and there are some dev_dbg
>> calls, but either I did the configuration not correct, or we do not
>> reach those lines yet (or I looked at the wrong place; I checked dmesg
>> and kern.log).
> Maybe you built your Kernel without dyndbg support. The kernel needs
> this at .config:
>
> CONFIG_DYNAMIC_DEBUG=y
>
> This depends on those symbols:
> 	CONFIG_PRINTK [=y] && (CONFIG_DEBUG_FS [=y] || CONFIG_PROC_FS [=y])
> 	

I checked the dynamic debug configuration - looks ok to me:

$ sudo cat /sys/kernel/debug/dynamic_debug/control | grep ov2680
...
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:329 
[atomisp_ov2680]ov2680_get_intg_factor =_ "++++ov2680_get_intg_factor\012"
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:314 
[atomisp_ov2680]ov2680_g_bin_factor_y =_ "++++ov2680_g_bin_factor_y\012"
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:302 
[atomisp_ov2680]ov2680_g_bin_factor_x =_ "++++ov2680_g_bin_factor_x\012"
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:255 
[atomisp_ov2680]ov2680_write_reg_array =_ "+++ov2680_write_reg_array 
reg=%x->%x\012"
drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:239 
[atomisp_ov2680]ov2680_write_reg_array =_ "++++write reg array\012"

So I assume it accepted the boot parameter and we just do not hit debug 
calls yet. I'll try to add a test debug call a suggested by Laurent 
(I've sine details to figure out first on what the 1st parameter is).

>>>> But if I read the code correctly this is expected, as we try to get
>>>> those regulators in any case - only if we have an error on two of them
>>>> we try the "Regulator1p8v" & "Regulator2p8v". As we do not see warnings
>>>> for those two regulators I assume this worked.
>>> No. It probably returned a valid "dummy" regulator. That's not what
>>> we want.
>>>
>>> There are still some things that could be missing for it to work
>>> properly with ISP2401. I'm trying to do some cleanups in order to
>>> be sure that everything needed for isp2401 will be there.
>> Just let me know if I shall try something.
> Sure.
>
>
> Thanks,
> Mauro

with kind regards,

Patrik

