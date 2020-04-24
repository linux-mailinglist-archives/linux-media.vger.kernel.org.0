Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6931B704C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgDXJKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgDXJKp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:10:45 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE04C09B045
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 02:10:45 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j1so9863577wrt.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2020 02:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vcRWYkcNfS4V8Bu74JQa3IXdQi9KAHxD0a7K9WTEago=;
        b=o0Tbrnd2bWCnPlH/xibS/2/HVqIMLs+JmISfP8TZjhDLRQ3CmqScuU5NL07ambvSGP
         /LbbvVZMRAQUqIzm4oSAXVd+8NFl/+RG91y2/q1KQIiTnSFzy6wF/dSLyQW7a2Y/Gem7
         3+IlF21sxY44x64i7bmTkkzmpNR5XCU4xziPk27/gkp+/4rtKfWD/i6LCfvTLKY9LK2N
         b0d11muWIHTSw+dKbWJOyzDYabyT3geGcIfjOvroq8afD1gpVtISi2v9DABFLUZ9tpqy
         LGSPXbEDsFO/aWgXQpskrQ3J5iww5q5O1W3OG3IgASbJ39CtoE1s1A8Y/ePmfpslSmVo
         xRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=vcRWYkcNfS4V8Bu74JQa3IXdQi9KAHxD0a7K9WTEago=;
        b=OKheUpJuc02plOqrL05P52nraFATtdsoQKENeg+dp7g+aI9uZQ2pf2iCX1zNc+6YTZ
         yyl4BQk38e6TgRq/0M1SzcRYIkK+duLIxmWSajDyd1gOC8t3seVyMM2mtS4SJiQt4mDa
         ZlPHVsttsg0L9LvYZ2WuNGgG/b9nm017eU7AUNXnENk3cS7uNNKDkgaRHIEGwWmlZG8B
         QWZYIyUW2S1sxi++mZJnz3d0oHoB2B2jn+zRc3ko8uQuWiLB0DuIKd51yQus3E2hLEXc
         o93yI0f82rkxxtAJ2Otryb2f8m3GekTJei7iZNk+zpgc7EkUhINPaXPXBB2QnFEueh1Q
         CtLQ==
X-Gm-Message-State: AGi0PuYWzet0RO4xef5VoozJqgBFK9BziqBKJ+rR+j4QAYEZMI8mTo+D
        AR1r9hl5ruDoild4jzfSL6zYFopxOm8=
X-Google-Smtp-Source: APiQypKYoJQ3RXd9zMaTxBToQ96yv2KH/EAxa8equDo9IqXPopPSsIH2R8KaZspG61uHrVFIB1ihNg==
X-Received: by 2002:a5d:42c7:: with SMTP id t7mr9740095wrr.336.1587719443149;
        Fri, 24 Apr 2020 02:10:43 -0700 (PDT)
Received: from [192.168.0.104] (77-56-155-30.dclient.hispeed.ch. [77.56.155.30])
        by smtp.gmail.com with ESMTPSA id c190sm2024453wme.4.2020.04.24.02.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 02:10:42 -0700 (PDT)
Subject: Re: atomisp kernel driver(s)
From:   Patrik Gfeller <patrik.gfeller@gmail.com>
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
Message-ID: <86413836-e4b5-cb53-3ac0-1764c693ec7b@gmail.com>
Date:   Fri, 24 Apr 2020 11:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <23b3a078-2a9a-5f50-a35e-9f40f5aa8a6e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 24.04.20 10:52, Patrik Gfeller wrote:
>
> On 22.04.20 21:13, Mauro Carvalho Chehab wrote:
>> Em Wed, 22 Apr 2020 19:56:56 +0200
>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>
>>> On 20.04.20 22:47, Mauro Carvalho Chehab wrote:
>>>> Em Mon, 20 Apr 2020 20:27:25 +0200
>>>> Patrik Gfeller <patrik.gfeller@gmail.com> escreveu:
>>>>> Me again ... sorry to ask such a basic question, but I can't get your
>>>>> modified source code. I get the following error:
>>>>>      > git clone https://git.linuxtv.org/mchehab/experimental.git/
>>>>> Cloning into 'experimental'...
>>>>> warning: adding alternate object store:
>>>>> https://git.linuxtv.org/git/linux.git/
>>>>> warning: adding alternate object store:
>>>>> https://git.linuxtv.org/git/media_tree.git/
>>>>> warning: adding alternate object store:
>>>>> https://git.linuxtv.org/git/linux.git/
>>>>> error: Unable to find fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f under
>>>>> https://git.linuxtv.org/mchehab/experimental.git
>>>>> Cannot obtain needed object fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f
>>>>> while processing commit 6d80bfc14608f4bb5514b79721d30b486f50c987.
>>>>> error: fetch failed.
>>>>>
>>>>> Do I use the wrong command?
>>>> Better to use git:// url:
>>>>
>>>>     git clone git://git.linuxtv.org/mchehab/experimental.git/
>>> I was able to download and compile the code. I installed the kernel and
>>> tried to boot; unfortunately it hangs with the message "Loading initial
>>> ramdisk ..." - after I start the old kernel I check kern.log and syslog
>>> - but I do not see entries from the failed boot attempt. I'll read into
>>> the topic and try around. This will take some time ... so there will be
>>> a dealy, but it's not that I do not care or lacking  interest, I just
>>> first have to sort this out.
>> Well, try to build it first without the atomisp driver. This would allow
>> you to see what's going on.
>
> I was able to solve the problem I had with the ramdisk - I had to 
> strip the kernel modules, probably the ramdisk file was too big.
>
> It is possible to boot with the atomisp driver, but I can not see the 
> camera yet - but maybe that's due to missing firmware, as there were 
> warnings when I installed the kernel that firmware files are missing.
>
> The following I found in dmesg:
>
> [    9.331011] kernel: atomisp_ov2680: module is from the staging 
> directory, the quality is unknown, you have been warned.
> [    9.402456] kernel: ov2680 i2c-OVTI2680:00: gmin: initializing 
> atomisp module subdev data.PMIC ID 1
> [    9.421113] kernel: acpi OVTI2680:00: Failed to find gmin variable 
> OVTI2680:00_CamClk
> [    9.433478] kernel: acpi OVTI2680:00: Failed to find gmin variable 
> OVTI2680:00_ClkSrc
> [    9.443146] kernel: acpi OVTI2680:00: Failed to find gmin variable 
> OVTI2680:00_CsiPort
> [    9.456677] kernel: acpi OVTI2680:00: Failed to find gmin variable 
> OVTI2680:00_CsiLanes
> [    9.479411] kernel: ov2680 i2c-OVTI2680:00: supply V1P8SX not 
> found, using dummy regulator
> [    ...
> [    9.510282] kernel: ov2680 i2c-OVTI2680:00: supply V2P8SX not 
> found, using dummy regulator
> [    ...
> [    9.532284] kernel: ov2680 i2c-OVTI2680:00: supply V1P2A not found, 
> using dummy regulator
> [    9.536200] kernel: ov2680 i2c-OVTI2680:00: supply VPROG4B not 
> found, using dummy regulator
> [   ...'
> [    9.592064] kernel: ov2680 i2c-OVTI2680:00: unable to set PMC rate 1
> [    9.623628] kernel: ov2680 i2c-OVTI2680:00: camera pdata: port: 0 
> lanes: 1 order: 00000002
> [    9.628258] kernel: ov2680 i2c-OVTI2680:00: sensor_revision id = 
> 0x2680, rev= 0
> [    9.636582] kernel: ov2680 i2c-OVTI2680:00: register atomisp i2c 
> module type 1
>
> The first signs of live :-) ... I'll try to find the firmware files to 
> see if it makes a difference.

May be of interest as well:

$ i2cdetect -l
i2c-3    unknown       Synopsys DesignWare I2C adapter     N/A
i2c-10    unknown       i915 gmbus dpc                      N/A
i2c-1    unknown       Synopsys DesignWare I2C adapter     N/A
i2c-8    unknown       i915 gmbus vga                      N/A
i2c-6    unknown       Synopsys DesignWare I2C adapter     N/A
i2c-13    unknown       AUX D/port D                        N/A
i2c-4    unknown       Synopsys DesignWare I2C adapter     N/A
i2c-11    unknown       i915 gmbus dpb                      N/A
i2c-2    unknown       Synopsys DesignWare I2C adapter     N/A
i2c-0    unknown       Synopsys DesignWare I2C adapter     N/A
i2c-9    unknown       i915 gmbus panel                    N/A
i2c-7    unknown       i915 gmbus ssc                      N/A
i2c-5    unknown       Synopsys DesignWare I2C adapter     N/A
i2c-12    unknown       i915 gmbus dpd                      N/A

>
>> Thanks,
>> Mauro
>
> kind regards,
>
> Patrik
>
