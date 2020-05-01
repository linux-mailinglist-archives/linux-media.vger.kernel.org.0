Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2923D1C100F
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 10:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgEAIyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 04:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbgEAIyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 May 2020 04:54:23 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A2EC035495
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 01:54:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k1so10776536wrx.4
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 01:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8n5wB7XQA3D5Uz2HJq2qdSE94DfT0qCYI/AjcHqu87Y=;
        b=lQXjOGTp+1GsE2jnPlWB+lkItEzzaLI1wMqGKQaRYrQr1SQuAWGJHFxGPA2Txxuv/N
         taMofaf5dKm86++pz/Ke8nqnLWT06OTSOl1diCmnLZnaRnznO3UgZZTgrgKMRCzfgmyW
         ADuRfztvevRwc44OeHlpUKa2KkMFxbFFxMZEoQYU+818TB/2TdYR6o7ko4ImFclf5qN+
         DbAFv//2FVQvVIv8+QzfB+SPY1n6n5tw+lpf4gfhL/eAweG3PWn6g/nzOOyxzSuYU51C
         /QvqJPVNrH/VVVbdbf/ouV2vBJbhmU4EuqIpE5VR5iEstuRly+hx+y9JvXx26kDizOAm
         n5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8n5wB7XQA3D5Uz2HJq2qdSE94DfT0qCYI/AjcHqu87Y=;
        b=kciHEu5A9Ia8V1YWxnkbDG0QchL7xHF4cREmBsqUDUKX8+uZchXSJKQJujbMr3/ROO
         xZ7ojL0lsYk5cJbDxjmydsunXGYEjNQ0WwUzEv0kqJJhBP4CATq9CD4RqkDWp93Rlqrn
         VDKRGBy1xMF3vU0zJnKgxO5e+ihuQeHyTbCzinM9nRZPVxltpRPplZjRVV0a8COFExvD
         9Ffz4u4jLbVZ4baFVorw5FwLYgAqzNwDT77/IqSr4Bx8KWUhjf1qfPMEPU37uWBsW/EW
         YMz+8J3prSAs9zvjQLkF8LwxxzZC3AV0/TwzSKKElBjq5w8jDaQJyL9ia1GnAT9+f1su
         oxdA==
X-Gm-Message-State: AGi0Pub5uvnkiZxUSXtsr8TPyg8UYawiMsLZOHjhMONA078NfMVsQqhS
        Nw+z9bz4SPECLEcWeZfo1Lgz2yMRWlY=
X-Google-Smtp-Source: APiQypIJPRTzAglJP1F9BFhgEVeidfJzp7436lDpw0xKqeiZzV5g04JpVqXdmZIcqgJ/1ethOuWeIQ==
X-Received: by 2002:a5d:6946:: with SMTP id r6mr2803965wrw.291.1588323260268;
        Fri, 01 May 2020 01:54:20 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id e13sm3449842wrp.15.2020.05.01.01.54.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 01:54:19 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <f3348096-1fb3-5368-ba66-f42a300bde8e@gmail.com>
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
 <6fffdf73-a0eb-1b1c-d894-e4799b8ef944@gmail.com>
 <20200430125544.10a9830d@coco.lan>
 <403b799e-6ae9-d62b-1f3a-a1b6b874071b@gmail.com>
 <20200501002510.0ead955d@coco.lan>
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
Message-ID: <1a17ffad-9792-a4ff-519e-a4306e7bf3e1@gmail.com>
Date:   Fri, 1 May 2020 10:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501002510.0ead955d@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 01.05.20 00:25, Mauro Carvalho Chehab wrote:
> Em Thu, 30 Apr 2020 17:09:48 +0200
> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>
>> Am 4/30/2020 um 12:55 PM schrieb Mauro Carvalho Chehab:
>>> Em Thu, 30 Apr 2020 09:56:53 +0200
>>> Patrik Gfeller<patrik.gfeller@gmail.com>  escreveu:
>>>   
>>>> For my first test tried to re-compile to module, without the whole
>>>> kernel. That was a mistake, as I mixed something up, probably it loaded
>>>> an old version of the module ... to be on the save side the steps I used
>>>> this time (in case we see something unexpected and for my later reference):
>>>>
>>>> $ git log --oneline
>>>> 4c922df10252 (HEAD -> atomisp, origin/atomisp) media: atomisp2: get rid
>>>> of ia_css_sc_param.h version dependency
>>>> ...
>>>>
>>>> $ make -j4 clean
>>>> $ make -j4
>>>> $ sudo make modules_install INSTALL_MOD_STRIP=1
>>>> $ sudo make install
>>> Please try to build from this branch:
>>>
>>> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2
>>>
>>> You'll need to setup a new config var there. So, please run this before
>>> make clean. So, for building it, you will do:
>>>
>>> 	$ ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make -j modules_prepare
>>> 	$ make -j4 clean && make -j4
>>> 	$ sudo make modules_install INSTALL_MOD_STRIP=1 && sudo make install
>>>
>>> This won't change the regulator detection, but it should hopefully use
>>> the ISP2401-specific code, with seems to be needed for your device.
>> I've updated to the latest source (git checkout atomisp_v2 && git pull)
>> and compiled using the instructions above. Compilation worked well, but
>> the linker had some problems (full log attached):
>>
>> ...
>> ld:
>> drivers/staging/media/atomisp/pci/css_2401_system/hive_isp_css_2401_system_generated/ia_css_isp_states.o:(.data+0x0):
>> multiple definition of `ia_css_kernel_init_state';
>> drivers/staging/media/atomisp/pci/css_2401_csi2p_system/hive_isp_css_2401_system_csi2p_generated/ia_css_isp_states.o:(.data+0x0):
>> first defined here
>> ...
> Ok. That's because there are two "hive" variants. the building system
> should use either one of them (but not both at the same time).
>
> I didn't get the error before because I was just building a module
> (that speeds up the development). Such errors only happen on a full
> build.
>
> Fixed.
>
> As I did a git rebase (in order to have something that we could
> upstream later), you'll need to use this procedure to update:
>
> 	$ git remote update
> 	$ git reset --hard origin/atomisp_v2
>
> There's no need to clean your last build. Just run:
>
> 	$ make -j4
>
> And it should build fine this time.

Compiled and linked :-). We get some more output this time:

[    9.120066] kernel: videodev: Linux video capture interface: v2.00

[    9.141554] kernel: atomisp_ov2680: module is from the staging 
directory, the quality is unknown, you have been warned.
[    9.175421] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing 
atomisp module subdev data.PMIC ID 1
[    9.178755] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not found, 
using dummy regulator
[    9.189966] kernel: proc_thermal 0000:00:0b.0: enabling device (0000 
-> 0002)
[    9.212704] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not found, 
using dummy regulator
[    9.235024] kernel: ov2680 i2c-OVTI2680:00: supply Regulator1p8v not 
found, using dummy regulator
[    9.235057] kernel: proc_thermal 0000:00:0b.0: Creating sysfs group 
for PROC_THERMAL_PCI
[    9.238185] kernel: ov2680 i2c-OVTI2680:00: supply Regulator2p8v not 
found, using dummy regulator
[    9.337925] kernel: atomisp: module is from the staging directory, 
the quality is unknown, you have been warned.
[    9.404666] kernel: atomisp-isp2 0000:00:03.0: enabling device (0000 
-> 0002)
[    9.408680] kernel: atomisp-isp2 0000:00:03.0: ISP HPLL frequency 
base = 1600 MHz
[    9.412197] kernel: atomisp-isp2 0000:00:03.0: Unsupported 
hw_revision 0x2010
[    9.416174] kernel: atomisp-isp2: probe of 0000:00:03.0 failed with 
error -2
[    9.419377] kernel: ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
[    9.458987] kernel: ov2680 i2c-OVTI2680:00: camera pdata: port: 1 
lanes: 1 order: 00000002
[    9.460049] kernel: atomisp_ov2680: module is from the staging 
directory, the quality is unknown, you have been warned.
[    9.463221] kernel: ov2680 i2c-OVTI2680:00: sensor_revision id = 
0x2680, rev= 0
[    9.503230] kernel: ov2680 i2c-OVTI2680:00: register atomisp i2c 
module type 1
>> Not sure if I can help with that. Sounds like we have to remove
>> definitions - which I might be able to do. But I would need to know
>> where the right place is to keep the definitions.
>> If a code generator is
>> involved (one of the paths looks like it) it will be more difficult for
>> me.
> Intel seems to use some code generator internally. Basically, for each
> specific device, it can remove/add/change things. Don't mind about that.
>
> For us, we're seeing just the generated code and working to simplify it
> and making it more generic.
So the original code is from intel itself? I currently have an open 
support request to get access to the information we need. Maybe it is 
helpful if I can let them know the code was from them in the first 
place. I'll check the history to find who from intel contributed.
>
>> But with some hints I'm of course willing to give it a shot. Please
>> give me an example of a definition) and a hint in case we deal with
>> generated code.
>>
>>> Ah, when replying, could you please use an emailer that won't be breaking
>>> long lines? Your emailer is currently breaking lines longer than 80 columns,
>>> with is quite annoying when checking log results ;-)
>> I changed the configuration of my mail client; a test message looked ok.
>> Let me know if the problem persists.
> Yeah, is is fine now. Thanks!
>
> Thanks,
> Mauro

with kind regards,
Patrik

