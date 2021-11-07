Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9984476BA
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 00:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbhKGXm2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Nov 2021 18:42:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36586 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231518AbhKGXm1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Nov 2021 18:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636328383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HGtcDgZn/ksQ+cqq+FxyLx4YU8RvAFG9NNnu9g6Qb04=;
        b=bE7xpkZu9V2HWAdkNKgtYC+S4R3GbvuBmva6LGBfxVrJ6qjFQOKbwMvjYFbx2Oyjjfe7d8
        7eXVqq7/7Y1gyVLJlN/8wougMvWdN/dL8ypIPRq/IUsY+xWenYehYPdlksjqDatKJ4Z4IM
        zAelGkM59h4u1Y6+VzlcGJIFmMtGVp4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-ybISUMkrNnqkZWmDwZ39UA-1; Sun, 07 Nov 2021 18:39:42 -0500
X-MC-Unique: ybISUMkrNnqkZWmDwZ39UA-1
Received: by mail-ed1-f70.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8aso13248383edj.20
        for <linux-media@vger.kernel.org>; Sun, 07 Nov 2021 15:39:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HGtcDgZn/ksQ+cqq+FxyLx4YU8RvAFG9NNnu9g6Qb04=;
        b=EtKbCj2M/GW4vxsJWvvmwP1KuvYCsEBpU6KDr4Mfs+QchXeS4+LSAaAIit22cbs8hL
         IPm+1U+wnpLNSb5V2jjxPqhmhnkhVx/BjukQMYHjOsSBhQXuhO7MbdT3SM+l/UuehbiE
         cNYhaJpVypG6AnB7pQrJBk2Qk08Q8RmF7tLFlm4C4hmOUO+NMHE0j3KDuvUJ0rtU5Sbz
         E/yH6WWk1Ex52WUEs3S5onye0mroqGRjGgc4TO1+xvv5P8eT+Eks9ktn+ApheJEf1IFB
         kH/dTn89HOwUVDKWfzuFrMqR6sfJ4oEthtgi3kDDBssioT6jivAQ53F/8jkkGlMOzeJ2
         LKgA==
X-Gm-Message-State: AOAM531VGTSPNg/4JxXGuPmcytUA/W1hAJRqD1NPK7ybzeTEJTL2Vkfp
        H+bVXfpyhaW/3yGb6HJ4SlE2H0IO0XEoO3rqSv94ipO7WmezyjBct8N+bl39dvaXD6Jy/ZGLswA
        Etje6NB1TFCShD2spwu313Rc=
X-Received: by 2002:a05:6402:221b:: with SMTP id cq27mr58861927edb.232.1636328380254;
        Sun, 07 Nov 2021 15:39:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSkXoAZKZEnVZ64ghrNk2A6q3nrbRhzLz6/659oRPRpervgYa5FKRDDJsvfdcZOvti59Ik0w==
X-Received: by 2002:a05:6402:221b:: with SMTP id cq27mr58861889edb.232.1636328379965;
        Sun, 07 Nov 2021 15:39:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cw20sm7109065ejc.32.2021.11.07.15.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 15:39:39 -0800 (PST)
Message-ID: <310ace44-93d5-99a3-bb4c-371b0a13462d@redhat.com>
Date:   Mon, 8 Nov 2021 00:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
Content-Language: en-US
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211017162337.44860-1-kitakar@gmail.com>
 <20211017162337.44860-6-kitakar@gmail.com>
 <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
 <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/21/21 11:52, Tsuchiya Yuto wrote:
> Thank you for your comment :-)
> 
> First, I need to correct what I said in the previous mail. I later found
> that loading only "atomisp" (as well as its dependency,
> atomisp_gmin_platform) does not cause this issue.
> 
> What causes this issue is rather, loading sensor drivers (as well as its
> dependency, atomisp_gmin_platform).
> 
> These sensor drivers for surface3 are both not upstream, but I made them
> as similar as possible to the upstreamed ones. So, I guess this issue
> can still be reproducible on some other devices.

I've run some test on my own surface3 and the problem is the writing
of 0x62 (which becomes just 0x02) to the 0x57 register of the PMIC,
writing 0x00 to that after loading the sensor driver makes things work
again.

I have not had time to investigate this further.

I used media-staging + your sensor drivers from:
https://github.com/kitakar5525/surface3-atomisp-cameras.git

Which was enough to figure this out, but I've not actually gotten
either of the cameras working :|  I get:

[user@fedora nvt]$ ./atomisp-test.sh 
p0: OPEN video device `/dev/video2'
p0: VIDIOC_S_INPUT <- 1
p0: ATOMISP_IOC_S_EXPOSURE integration_time={30000,30000} gain={30000,30000}
p0: ./v4l2n: ATOMISP_IOC_S_EXPOSURE failed on fd 3: Inappropriate ioctl for device (25)
p0: CLOSED video device

No matter which value I pass for VIDIOC_S_INPUT (tried 0 and 1) any ideas?

Perhaps I need to load the modules in a certain order, e.g. load the
sensor drivers before the main atomisp driver ?

Regards,

Hans





> 
> I can't (easily) try touchscreen on mipad2 because it won't boot without
> nomodeset and somehow GNOME won't start if it's using nomodeset (on Arch
> Linux).
> 
> On Mon, 2021-10-18 at 10:30 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/17/21 18:23, Tsuchiya Yuto wrote:
>>> Touchscreen input works fine before loading atomisp driver on Surface 3.
>>>
>>> However, after loading atomisp driver, touchscreen works only when
>>> capturing images. This sounds like atomisp turns off something needed
>>> for touchscreen when atomisp is idle.
>>>
>>> There is no useful kernel log. Just the touchscreen stops working
>>> with no log.
>>>
>>> I'll update if I find something further. First of all, can someone
>>> reproduce this issue on the other devices?
>>
>> My first bet would be some regulator getting turned off.
>>
>> What you can do is:
>>
>> 1. ls -l /dev/bus/i2c/devices
>>
>> And then write down the number of the i2c-bus to which the
>> CRC PMIC is connected, lets say it is number "4". Then:
>>
>> 2. Before loading the atomisp drivers run:
>>    "sudo i2cdump -y -f 4 0x6e > crc-regs-good"
>>
>> 3. After loading the atomisp drivers run:
>>    "sudo i2cdump -y -f 4 0x6e > crc-regs-bad
>>
>> 4. "diff -u crc-regs-good crc-regs-bad"
>>
>> And see what changed.
> 
> Here is the diff. The "good" one is before loading sensor driver, the
> "bad" one is from after loading sensor driver:
> 
>         $ diff -u crc-regs-good crc-regs-bad
>         --- crc-regs-good	2021-10-21 18:04:57.853396866 +0900
>         +++ crc-regs-bad	2021-10-21 18:06:13.755738054 +0900
>         @@ -4,14 +4,14 @@
>          20: 00 00 01 c8 68 07 0a 10 10 01 1f 10 10 10 10 10    ..??h???????????
>          30: 10 10 00 20 21 20 20 20 20 20 00 2a 1c 1c 14 10    ??. !     .*????
>          40: 10 10 10 28 20 20 28 2e 2f 20 20 83 00 00 4c 00    ???(  (./  ?..L.
>         -50: 00 01 01 01 00 00 60 00 60 00 00 02 02 03 60 60    .???..`.`..???``
>         +50: 00 01 01 01 00 00 60 02 60 00 00 02 02 62 60 60    .???..`?`..??b``
>          60: 60 01 03 00 00 00 00 00 00 00 30 04 00 00 00 00    `??.......0?....
>         -70: 00 03 00 00 02 7b 02 6c 02 71 02 55 02 7c 02 9d    .?..?{?l?q?U?|??
>         +70: 00 03 00 00 02 7b 02 6d 02 73 02 58 02 7f 02 9e    .?..?{?m?s?X????
>          80: 00 00 00 00 00 00 00 00 00 00 00 02 08 00 0b 02    ...........??.??
>          90: 3f 07 00 00 00 00 4c 00 4e 00 00 4c 00 23 01 b4    ??....L.N..L.#??
>          a0: 4c 00 4e 00 00 3d ca 6a f0 00 00 3d ca 6a f0 00    L.N..=?j?..=?j?.
>          b0: 00 7e 2a ff 02 04 06 00 00 00 00 00 00 20 00 00    .~*.???...... ..
>          c0: 00 00 00 cd 08 00 00 4c 00 00 00 4c 00 00 00 3d    ...??..L...L...=
>         -d0: 97 00 00 3d 97 00 00 fe 17 00 ff 02 01 07 94 03    ?..=?..??..?????
>         -e0: 9a 00 27 00 00 00 00 00 00 00 00 00 00 00 00 00    ?.'.............
>         +d0: 97 00 00 3d 97 00 00 fe 17 00 ff 02 01 07 ec 03    ?..=?..??..?????
>         +e0: 96 00 21 00 00 00 00 00 00 00 00 00 00 00 00 00    ?.!.............
>          f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00    ................
> 
> Note that lines "70:" and "d0:"/"e0:" change over time. So, the actual
> change caused by loading sensor driver is line "50:"
> 
>         -50: 00 01 01 01 00 00 60 00 60 00 00 02 02 03 60 60    .???..`.`..???``
>         +50: 00 01 01 01 00 00 60 02 60 00 00 02 02 62 60 60    .???..`?`..??b``
> 
> and in atomisp_gmin_platform.c file,
> 
>         /* CRYSTAL COVE PMIC register set */
>         #define CRYSTAL_1P8V_REG	0x57
>         #define CRYSTAL_2P8V_REG	0x5d
>         #define CRYSTAL_ON		0x63
>         #define CRYSTAL_OFF		0x62
> 
> indeed we're poking at 0x57 and 0x5d. So, maybe this issue is caused by
> regulators? I tried what would happen if I kept sensor power on before
> in sensor drivers, but there was no effect. But I feel I need to look
> into it again further.
> 
>> There are 2 possible root causes here:
>>
>> 1. Some regulator is shared between the cameras and
>> touchscreen
>>
>> 2. The crc code in atomisp which you are using is
>> poking registers assuming the Bay Trail version of
>> the Crystal Cove PMIC (aka CRC PMIC) but your
>> Surface 3 has the Cherry Trail version and we know
>> that the regulators are add different register
>> addresses there, see the comment in:
>> drivers/acpi/pmic/intel_pmic_chtcrc.c
>> so it is possible that the atomisp code is simply
>> poking the wrong register for one of the regulators
> 
> According to this Android kernel commit [1], the address for 1P8V and
> 2P8V are updated to the CRC+ ones (the upstreamed atomisp already has
> this change)
> 
> [1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/commit/2f8221ba9a3770aed1ecfad2d04db61b95f30394
>     ("update PMIC v1p8/v2p8 address")
> 
>> I also wonder if this goes away if you do the
>>
>> 	hrv = 0x03;
>>
>> Hack inside drivers/mfd/intel_soc_pmic_core.c ?
>>
>> Without that we end up using the wrong PMIC
>> OpRegion driver which also uses the wrong
>> regulator addresses.
> 
> I'm now using cht one with your patch, but the situation is the same
> as before.
> 
> Regards,
> Tsuchiya Yuto
> 
>> Regards,
>>
>> Hans
>>
>>
>> p.s.
>>
>> Here are the 2 different regulator drivers the
>> comment in drivers/acpi/pmic/intel_pmic_chtcrc.c
>> refers to:
>>
>> https://github.com/Zenfone2-Dev/android_kernel_asus_moorefield-1/blob/stock/drivers/regulator/pmic_crystal_cove.c
>> https://github.com/Zenfone2-Dev/android_kernel_asus_moorefield-1/blob/stock/drivers/regulator/pmic_crystal_cove_plus.c
>>
> 
> 

