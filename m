Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1D61C244E
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 11:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgEBJUJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 05:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgEBJUJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 05:20:09 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E6DC061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 02:20:08 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id v8so11441328wma.0
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=925RkaJps1kwc6teAxCDmV0tvyLcrJRB8SnKAWJZOqQ=;
        b=dt5khRuAkADRmdXagYmqiV0dgAj3/tqtfma3lB1RBX/pUWc4rejgHFszvtjViiNtnh
         xTH5tJR3ehYMC8Y7Hstg3C7PqcZAIt16puAZr0P9DT/gNiujdxMw6jEfsIE3cuBuEWhG
         04OGX+lYIsfnRKoSskG8+Q68T+E2whfsd8befF1kzlbQ7/70HTwlOXmR0Yk55Rijn35g
         YMbjTQJN2gUZXwWpX+bWu+sl2P4gVobCRUvK7FrnZHn2IgmV9zXYAmHnp6dIOZauIiPf
         CieE2oYXCX5Ig8H7kjda94lx0YrxHjVM9qIQQ300tET4WhI/zAFa7ddvQTzElKaGWcp4
         4A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=925RkaJps1kwc6teAxCDmV0tvyLcrJRB8SnKAWJZOqQ=;
        b=WG0WZlE4kwyu8Lg7yXjC7hfimC7A5DDrhuIRzhUWaCfEI5pGNud0H2YRAPKuzz/+e4
         323diZ5W8fII5hMWc8CBKBRGOY+tHVMqtxbJ+fJQR6n/w7kLsuFv9tfY371I1m+yvINa
         pLACTVNIvILB8nwwvNGER1gPKXzIWLd6ehymYoFfIev/6R+HkLfB6wkWjAOqRhIqQD95
         iATyaVT24+7nDJ6HF781NvBk3G0uE5QDEdQ1BskiWg0Gb3tJuZzLzAgVBrAWvkqEP+tC
         sYZgZr0i5KGRQTQGhOHE7s4Vx10kJmzEE1jb8W4VceBFZCaBIVayCZi/Q5aLlKsjNvRG
         19oQ==
X-Gm-Message-State: AGi0PuZuVhkRd3bHqmzcOXeOkcAIltpjvWwjqE5sRz+9S5Q2eNfaZCea
        VuML3qnGHxdCt0yLMacKqarZnT337ZE=
X-Google-Smtp-Source: APiQypJGrIqREHZAyYce2MvkUIJHBYd9V4RP6hTOSgjKYuguoOFiKmtgyNQTyoS4NI8XIOx7n+Go7A==
X-Received: by 2002:a1c:2042:: with SMTP id g63mr3777899wmg.70.1588411206946;
        Sat, 02 May 2020 02:20:06 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id l16sm8141840wrp.91.2020.05.02.02.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 02:20:06 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
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
 <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
 <20200430125544.10a9830d@coco.lan>
 <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
 <20200501002510.0ead955d@coco.lan>
 <1a17ffad-9792-a4ff-519e-a4306e7bf3e1@gmail.com>
 <20200501113812.7f16b7ca@coco.lan> <20200501192844.397efcaa@ASUS>
 <20200501213023.7fe29188@coco.lan> <20200502101542.2972010a@ASUS>
Message-ID: <0241bafc-d392-3848-852a-b9ebca1664a0@gmail.com>
Date:   Sat, 2 May 2020 11:20:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200502101542.2972010a@ASUS>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 02.05.20 10:15, Patrik Gfeller wrote:
> On Fri, 1 May 2020 21:30:23 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>
>> Em Fri, 1 May 2020 19:31:05 +0200
>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>
>>> On Fri, 1 May 2020 11:38:12 +0200
>>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>>>
>>> [...] 
>>>
>>>> Hmm.. your e-mailer is breaking long lines again  :-(  
>>> Ok - then the configuration option I used is not reliable. I've now switched to Claws Mail; I hope this resolves the problem.
>> Yeah, that's what I use here. I actually manually break my lines
>> when I'm closed to the 80 column, as most people do on mailing
>> lists (some people read those upstream MLs with emacs).
>>
Sorry - I use my old mailer for this message - as I suddenly do not see
sent messages anymore
in claws and can this not follow up on my last sent mail. I'll try to
fix this and use claws again.

>>>>   
>>>>> [    9.175421] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing atomisp module subdev data.PMIC ID 1
>>>>> [    9.178755] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not
>>>>> found, using dummy regulator [    9.189966] kernel: proc_thermal
>>>>> 0000:00:0b.0: enabling device (0000 -> 0002)    
>>>>> [    9.212704] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not
>>>>> found, using dummy regulator
>>>>> [    9.235024] kernel: ov2680 i2c-OVTI2680:00: supply Regulator1p8v
>>>>> not found, using dummy regulator    
>>>> I'll check this.
>>>>   
>>>>> [    9.235057] kernel: proc_thermal 0000:00:0b.0: Creating sysfs
>>>>> group for PROC_THERMAL_PCI
>>>> [...]
>>>>
>>>> It sounds that we need to add:
>>>>
>>>>         if (isp->media_dev.hw_revision ==
>>>>             ((ATOMISP_HW_REVISION_ISP2401 <<
>>>> ATOMISP_HW_REVISION_SHIFT) | ATOMISP_HW_STEPPING_B0))
>>>>                 fw_path = "shisp_2401b0_v21.bin";
>>>>
>>>> Eventually, other changes may be needed, depending on how different is
>>>> this B0 revision from A0.
>>>>
>>>> Patch for it pushed. Please notice that it will seek for a firmware
>>>> named "shisp_2401b0_v21.bin".  
>>> Unfortunately I was not able to find "shisp_2401b0_v21.bin"; 
>> Yeah, I also searched for it. Was unable to find it. I suspect that the
>> B0 version could be newer than the atomisp driver that got merged.
>>
>>> so I changed the values in the code and tried with "shisp_2401a0_v21.bin, irci_master_20140707_0622".
>> Yeah, I suspect that this is the next best thing.
>>
>>> I contacted Intel to see if they are willing to provide the newer firmware. Alan Cox mentioned in a commit message, that the drivers can be extracted from an "upgrade kit":
>>>
>>>    "... The firmware files will usually be found in /etc/firmware on an Android
>>>    device but can also be extracted from the upgrade kit if you've managed
>>>    to lose them somehow. ..."
>>>
>>> But I did not yet figure out what this kit is.
>> The firmware should be there somewhere at the BSP for Android
>> (for hardware that came originally with it). It should also be
>> present on Windows and other OSes that support, although the
>> version could be different.
>>
>>> There is also an open support request with Intel to get some hardware/firmware documentation. But this will be difficult (as expected by you and Laurent) - their process only supports requests from companies that sign an NDA. But I opened a ticket as well to see if there's a way to get access to their developer network someway, or if it is possible that they send only the documents required. 
>> Yeah, I suspect that they would open this only for companies
>> with signed NDAs.
>>
>>> I also sent an Mail to the original authors of the drivers at Intel. Two of them no longer work there (mail was rejected), but one went trough. Let's see...
>> Ok. Btw, there is a driver for Atomisp on an yocto tree:
>>
>> 	https://github.com/intel-aero/meta-intel-aero.git
>>
>> It got removed back in 2018, but if you checkout this changeset:
>>
>> 	Merge: db1df368eb58 08f476112708
>> 	Author: Lucas De Marchi <lucas.demarchi@intel.com>
>> 	Date:   Tue Apr 4 11:51:42 2017 -0700
>>
>> 	    Merge pull request #70 from zehortigoza/jam
>>     
> Cool, the code might give additional information. I've also send a
> request regarding the firmware and HW documentation to the author and
> the engineers that signed the patch. The firmware in the patch has a
> different version string and the size is surprisingly a few MB bigger
> than the one I used for the first experiment. I'll give that one a try
> as well.
>
>> You would be able to see it. Unfortunately, the driver there
>> also came with shisp_2401a0_v21.bin.
>>
>> The driver there forces this specific version, disabling the 
>> firmware version checking:
>>
>> recipes-kernel/linux/linux-yocto/0013-temp-atomisp-support.patch:+ccflags-y += -DATOMISP_POSTFIX=\"css2401a0_v21\" -DATOMISP_FWNAME=\"shisp_2401a0_v21.bin\" -DISP2401 -DISP2401_NEW_INPUT_SYSTEM
>>
>> I also found a firmware for some other Asus Transformer device:
>>
>> 	https://github.com/jfwells/linux-asus-t100ta/tree/master/webcam/firmware
>>
> It looks a this firmware is for the 2400 variant; I could also not
> extract the irci version string. Thus I'll not try them for the moment
> to perform experiments.

I've a problem with the build; I've pulled the latest changes from the
repository - and at least some
of your changes are lost. I also checked via the web page and there I
can also not see them
anymore:

https://git.linuxtv.org/mchehab/experimental.git/tree/drivers/staging/media/atomisp/atomisp_v4l2.c?h=atomisp_v2

const struct firmware *
atomisp_load_firmware(struct atomisp_device *isp)
{
    const struct firmware *fw;
    int rc;
    char *fw_path = NULL;

    if (skip_fwload)
        return NULL;

    if (isp->media_dev.hw_revision ==
        ((ATOMISP_HW_REVISION_ISP2401 << ATOMISP_HW_REVISION_SHIFT)
         | ATOMISP_HW_STEPPING_A0))
        fw_path = "shisp_2401a0_v21.bin";

    if (isp->media_dev.hw_revision ==
        ((ATOMISP_HW_REVISION_ISP2401_LEGACY << ATOMISP_HW_REVISION_SHIFT)
         | ATOMISP_HW_STEPPING_A0))
        fw_path = "shisp_2401a0_legacy_v21.bin";

    if (isp->media_dev.hw_revision ==
        ((ATOMISP_HW_REVISION_ISP2400 << ATOMISP_HW_REVISION_SHIFT)
         | ATOMISP_HW_STEPPING_B0))
        fw_path = "shisp_2400b0_v21.bin";

    if (!fw_path) {
        dev_err(isp->dev, "Unsupported hw_revision 0x%x\n",
            isp->media_dev.hw_revision);
        return NULL;
    }

    rc = request_firmware(&fw, fw_path, isp->dev);
    if (rc) {
        dev_err(isp->dev,
            "atomisp: Error %d while requesting firmware %s\n",
            rc, fw_path);
        return NULL;
    }

    return fw;
}

It also does not build properly anymore (uses the old API again). Do you
know what
I'm doing wrong here?

>
>> That's said, there's also a firmware for it inside this:
>> 	https://dlcdnets.asus.com/pub/ASUS/nb/DriversForWin10/Chipset/Chipset_Intel_CherryTrail_T_Win10_64_VER110.zip
>>
>> Probably it is a different version, but it could be worth renaming it and
>> try it. The firmware load code should check if the firmware version is the
>> right one.
> It identifies itself as irci_stable_bw10p_0518_20150801_0537; I'll give
> that one a try first. As usual it will unfortunately take some time
> until I get back to you with the results, as every experiment takes
> many hours (building the kernel on what is essentially a tablet takes
> time).
>
>> Also, the .INF file seems to point to the right PCI ID:
>>
>> 	[Device.NTamd64]
>> 	%iacamera.DeviceDesc%=iacamera,VIDEO\INT22B8
>>
>> drivers/staging/media/atomisp/pci/atomisp_v4l2.c:       {PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x22b8), .driver_data = HW_IS_ISP2401},
>>
>> The inf file also contains this:
>>
>> 	DriverVer=03/02/2016,21.10586.6069.2007
>>
>> So, it sounds to be Version 21. If it is the right one or
>> something else, I dunno.
>>
>>>> This driver will also check if the firmware version is:
>>>>
>>>> 	"irci_ecr - master_20150911_0724"
>>>>
>>>> As far as I know, the firmware is linked to the driver's code. 
>>>> So, supporting a different firmware version will likely require
>>>> changes at the driver.
>>>>   
>>>>> [    9.416174] kernel: atomisp-isp2: probe of 0000:00:03.0 failed
>>>>> with error -2    
>>> With the older firmware it does not look good (full dmesg output attached):
>>> [    9.416329] ov2680 i2c-OVTI2680:00: supply Regulator1p8v not found, using dummy regulator
>>> [    9.425878] ov2680 i2c-OVTI2680:00: supply Regulator2p8v not found, using dummy regulator
>>> [    9.471140] atomisp-isp2 0000:00:03.0: enabling device (0000 -> 0002)
>>> [    9.476362] proc_thermal 0000:00:0b.0: enabling device (0000 -> 0002)
>>> [    9.478540] ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
>>> [    9.493784] cfg80211: Loading compiled-in X.509 certificates for regulatory database
>>> [    9.495675] atomisp-isp2 0000:00:03.0: ISP HPLL frequency base = 1600 MHz
>>> [    9.501274] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
>>> [    9.510963] ov2680 i2c-OVTI2680:00: camera pdata: port: 1 lanes: 1 order: 00000002
>>> [    9.515507] ov2680 i2c-OVTI2680:00: sensor_revision id = 0x2680, rev= 0
>>> [    9.519100] ov2680 i2c-OVTI2680:00: register atomisp i2c module type 1
>>> [    9.530607] proc_thermal 0000:00:0b.0: Creating sysfs group for PROC_THERMAL_PCI
>>> [    9.585233] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=0 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input17
>>> [    9.591623] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=1 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input18
>>> [    9.603063] input: Intel HDMI/DP LPE Audio HDMI/DP,pcm=2 as /devices/pci0000:00/0000:00:02.0/hdmi-lpe-audio/sound/card0/input19
>>> [    9.688254] ------------[ cut here ]------------
>>> [    9.691775] cpu_latency_qos_update_request called for unknown object
>>> [    9.695279] WARNING: CPU: 3 PID: 523 at kernel/power/qos.c:296 cpu_latency_qos_update_request+0x3a/0xb0
>>> [    9.698826] Modules linked in: snd_soc_acpi_intel_match [...]
>>> [    9.736699] CPU: 3 PID: 523 Comm: systemd-udevd Tainted: G         C        5.7.0-rc1+ #2
>>> [    9.741309] Hardware name: ASUSTeK COMPUTER INC. T101HA/T101HA, BIOS T101HA.305 01/24/2018
>>> [    9.745962] RIP: 0010:cpu_latency_qos_update_request+0x3a/0xb0
>>> [    9.750615] Code: [...]
>>> [    9.760065] RSP: 0018:ffffa865404f39c0 EFLAGS: 00010282
>>> [    9.764734] RAX: 0000000000000000 RBX: ffff9d2aefc84350 RCX: 0000000000000000
>>> [    9.769435] RDX: ffff9d2afbfa97c0 RSI: ffff9d2afbf99808 RDI: ffff9d2afbf99808
>>> [    9.774125] RBP: ffffa865404f39d8 R08: 0000000000000304 R09: 0000000000aaaaaa
>>> [    9.778804] R10: 0000000000000000 R11: 0000000000000001 R12: 00000000ffffffff
>>> [    9.783491] R13: ffff9d2afb4640b0 R14: ffffffffc07ecf20 R15: 0000000091000000
>>> [    9.788187] FS:  00007efe67ff8880(0000) GS:ffff9d2afbf80000(0000) knlGS:0000000000000000
>>> [    9.792864] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [    9.797482] CR2: 00007ffc6424bdc8 CR3: 0000000178998000 CR4: 00000000001006e0
>>> [    9.802126] Call Trace:
>>> [    9.806775]  atomisp_pci_probe.cold.19+0x15f/0x116f [atomisp]
>>> [    9.811441]  local_pci_probe+0x47/0x80
>>> [    9.816085]  pci_device_probe+0xff/0x1b0
>>> [    9.820706]  really_probe+0x1c8/0x3e0
>>> [    9.825247]  driver_probe_device+0xd9/0x120
>>> [    9.829769]  device_driver_attach+0x58/0x60
>>> [    9.834294]  __driver_attach+0x8f/0x150
>>> [    9.838782]  ? device_driver_attach+0x60/0x60
>>> [    9.843205]  ? device_driver_attach+0x60/0x60
>>> [    9.847634]  bus_for_each_dev+0x79/0xc0
>>> [    9.852033]  ? kmem_cache_alloc_trace+0x167/0x230
>>> [    9.856462]  driver_attach+0x1e/0x20
>>>
>>> Well - It did more things than before. 
>> Actually, it looked a lot better for me, as the driver is now trying to 
>> do something ;-)
>>
>>> But my fear is that we really depend on the rev b firmware, which is very difficult to get hold of :-(.
>>>
>>>> That's because it didn't load the firmware.
>>>>
>>>> Thanks,
>>>> Mauro  
>>> with kind regards,
>>> Patrik
>>>
>> Thanks,
>> Mauro
> with kind regards,
> Patrik

with kind regards,
Patrik

