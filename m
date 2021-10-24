Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEA14387A2
	for <lists+linux-media@lfdr.de>; Sun, 24 Oct 2021 10:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhJXIfA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Oct 2021 04:35:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55798 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231618AbhJXIex (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Oct 2021 04:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635064353;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N7MaMsbEgtkFeoR9dXKCa0jkxzPb/XZnIjnZEfonQdU=;
        b=V4uDz4Aek1rrkd0ffXwdNjInpLQ1VcXcvVl6NTKjlFcix9vCWGwqsk0VYFTALoYXDTxj83
        /Li9Tb6IXeK9Be5y0sc6ZDFjSV+HB4la4NkeCBEvY3eMUNe5/GQzvxJqtzaTGe/BrROmcf
        FaUdXUcbnt5z9zCOtq0Ug3ogq9sBAG0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-iLjtwb2XPV2xh9af-X2HPA-1; Sun, 24 Oct 2021 04:32:31 -0400
X-MC-Unique: iLjtwb2XPV2xh9af-X2HPA-1
Received: by mail-ed1-f70.google.com with SMTP id s12-20020a50dacc000000b003dbf7a78e88so7287056edj.2
        for <linux-media@vger.kernel.org>; Sun, 24 Oct 2021 01:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N7MaMsbEgtkFeoR9dXKCa0jkxzPb/XZnIjnZEfonQdU=;
        b=ZDpSwjhsUNbHfue2SddKqSnCBrF3CrsHmQcUgEzSX1fHpNsfy7xJSYIYvjy7202TNN
         xTFUSXeh0FCwSNlBUH/VIfdT5OwhkSGyZzF2yXukG/P+OibUwAoBLvaDqDDcs80NuRzv
         Ck9RDZx+QflQ+6I5cQYm6TpYgLNa8vZCUmljCXKno+hjfWS8NbTR7FGFe9MuIdbSu19K
         edwa2yfAh9slJyMsp5IIgjmFJJrcW1pp5kYGbS4/llTCDkUxSe8ur2Bi0Nwd0uCfEQkZ
         sCPetQ6MfeKoBoCICh1r5mLxybOeVfiCVMFgPctH52Iq1Fq5osCu8EXuaw4iqNMETUcn
         4WUw==
X-Gm-Message-State: AOAM530fdS71sN7+trHiicsKZVagsXDitdW74TqeXNdLlW6dRYB1HDwt
        OfK3k5aq0I+i1wP6eyRatAB5NfBughc5ae8kk7i6BBTY7SFmbQ/VH2ZnI97XH85oY5UBo8eslB1
        FgNQ/nbzDMY85xk7lFwUSx9Y=
X-Received: by 2002:a17:907:961e:: with SMTP id gb30mr13419145ejc.484.1635064349792;
        Sun, 24 Oct 2021 01:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0i+S6uulwjEVYlO3w6mp2NMyQm2ZwTjdNM32sBC/BeQmWEspIjPmjl3nyGehZTWYhjGe8HA==
X-Received: by 2002:a17:907:961e:: with SMTP id gb30mr13419113ejc.484.1635064349512;
        Sun, 24 Oct 2021 01:32:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gs15sm1616366ejc.53.2021.10.24.01.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Oct 2021 01:32:26 -0700 (PDT)
Message-ID: <552baf68-8fed-9a6f-d18c-5634f93a58f8@redhat.com>
Date:   Sun, 24 Oct 2021 10:32:25 +0200
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
> 
> I can't (easily) try touchscreen on mipad2 because it won't boot without
> nomodeset and somehow GNOME won't start if it's using nomodeset (on Arch
> Linux).

<note going a bit offtopic from atomisp here>

Friday I've resized the Android data partition on my Mi Pad 2 Android,
16G eMMC model and installed Fedora 35 in the free space.

And yesterday I've been poking at the Mi Pad 2 the entire day,
both under Fedora and under the original Android install to figure
out which chips there are and how they are used, etc. This has
diverted me from looking into atomisp2 stuff, but it was fun :)

I've also managed to make the i915 driver work. It still gives one
warning during boot which I need to look into. But it works now.
ATM my i915 fix is just a hack. I plan to turn it into something
which I hope I can get upstream, I'll Cc you (Tsuchiya) on the
upstream submission of the i915 submission.

I've also figured out all the other chips used in the Mi Pad 2
and I believe I should be able to get things battery monitoring
and switching the USB plug between host <-> device mode to work
without too much issues (but it will take some time). This is
all pretty similar to all the special handling which I've already
added to the kernel for the GPD win / pocket devices which also
use the CHT Whiskey Cove PMIC.

Here are my notes about all the non standard chips used in the
Mi Pad 2:

PMIC/charger/fuel-gauge:
-The Type-C connector is used as / wired up as a regular micro-USB connector

-There is a Cherry Trail Whiskey Cove PMIC on the I2C7 i2c_designware ctrl
 -This is used for ID pin detection
 -Charger-type detection does not work though, because the USB-2 data-lines are
  not connected to it
 -The 2 GPIOs which are used to enable an external V5 boost converter for
  Vbus resp Vconn on other designs are both configured as inputs (register value 0x18)
 -The extcon-intel-cht-wc driver should control the USB mux according to the
  ID pin, identically to how the extcon-axp288 code does this
 -The extcon-intel-cht-wc driver should control the Vboost converter in the
  bq25890 charger IC based on the ID pin 

-There is a bq25890 charger hanging from the CHT-WC PMIC charger I2C-bus at addr 0x6a
 -At boot the BIOS clears bit 4 of register 3, disabling charging so the device
  will still be powered from an external supply, but it will not charge!
  Linux needs to fix this up
 -This charger is connected to the USB-2 data-lines and automatically sets its
  input-current-limit based on the detected charger
 -Bit 5 of register 3 controls the Vboost converter for sending 5V to attached
  USB-devices this bit needs to be controller by Linux based on the ID pin
  detection from the PMIC. The BIOS does leave this enabled when booting with
  a USB-device plugged in.

-There is a BQ27520 fuel-gauge at address 0x55 of the I2C1 i2c_designware ctrl

I2C1: addr 0x55 BQ27520 fuel-gauge

I2C2: addr 0x0e unknown
I2C2: addr 0x1b Realtek 5659 codec ? (not detected by i2cdetect)
I2C2: addr 0x2c TI lp855x backlight controller:
 https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/video/backlight/lp855x_bl.c
I2C2: addr 0x34 NXP9890 audio amplifier
I2C2: addr 0x37 NXP9890 audio amplifier
I2C2: addr 0x3e unknown

I2C3: addr 0x30 KTD2026 RGB LED driver, controlling the status LED
 https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/leds/leds-ktd2026.c

I2C4: addr 0x36? OVTI5693 camera sensor
I2C4: addr 0x37 t3ka3 camera sensor

I2C5: addr 0x5a Motor DRV2604 Driver ? the tablet has no haptic feedback motor!
      Also nothing seen here by i2c-detect, probably bogus

I2C6: addr 0x38 FTSC touchscreen

I2C7: PMIC bus

-TPS61158: LED controller for menu keys LEDS, driven by PWM controller, max brightness
 80/255 !!!!
 https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/leds/leds-tps61158.c
 Android behavior: light up menu keys for 5 seconds on any human input:
 -Write a special HID driver for mainline linux to fix the key-events send by the
  touchscreen and to light up the keys for 5 seconds on any HID input reports

-Sensors (accel, als) through hid-ishtp

-Panel 1536x2048 on card0-DSI-1
 https://bugs.freedesktop.org/show_bug.cgi?id=108714

-DSDT: Android: OSID == 0x04, Windows OSID == 0x01

Regards,

Hans




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

