Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4200843B5E5
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 17:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237094AbhJZPod (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 11:44:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50210 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237071AbhJZPoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 11:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635262901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HydBjt21gCt95Cro1vJ7cdlFUf1FAfNM+p1sttBY83E=;
        b=XHvShInSnkAAf/gs7cniFx9v7fzsde1QTP/5cEGG2nBwVfuDJ0Xjroq+5iwD6loc6PZl3J
        LUOqtL3eWYrGwwyajwjIhR/Dv5K9GzluEUkTeQD6Am1rygWLSHW4GTXP4qNLsQQm1Ii/do
        tVxpH+ZZ/ZinH4/+0jT1TVpVz+gi678=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-_axUAKHoM1G4ESubsSWFIw-1; Tue, 26 Oct 2021 11:41:40 -0400
X-MC-Unique: _axUAKHoM1G4ESubsSWFIw-1
Received: by mail-ed1-f70.google.com with SMTP id f4-20020a50e084000000b003db585bc274so2718540edl.17
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 08:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HydBjt21gCt95Cro1vJ7cdlFUf1FAfNM+p1sttBY83E=;
        b=t0Lj0o2PSUKGUZ9PYlis9mvd4SfSkeQUEJDLVcKWOgXU0Oaj67PFNMC/+jscPpMI+g
         lfPzrBMAu4O44cfKJxSrskv+IIMyk6g8xYhQ3Udcu1oIKtV1lEtUi3/QjKRWTUo/30KB
         S3MTFaU41aWPmeuRSAS3pebscu+zb6b2QB7O7Z9eqMp5Qw7SQEWYDM6R8lSFX9OoFwob
         13ZaOTWyyp6vJdc0FJHb2Oa1J5+eQJtwST/ZgJZsrkDHAoQQS3Rm4l9ArC6wWWsK7d0Y
         zMw06PNbwQ/djv/doVBY/YizGRg0+sPPEHvYkN09aCaLg9W8WqyvpCXrQDo9oVfhwD2Y
         ud4w==
X-Gm-Message-State: AOAM533e5VFdMUecNGDWao1DLkm0vsmhKoanZsfzSA+F2jw51nyrhuce
        Hxpx/VAsARERDehuTMoBLtkVX9Zlx6e76S70xM7LGEoNekcMVtmpwax3H2/iiFQyNVfBUEsISh4
        Db8gKt4bxG98OK6PyWaDHmGY=
X-Received: by 2002:a17:906:2cc9:: with SMTP id r9mr31749407ejr.138.1635262898737;
        Tue, 26 Oct 2021 08:41:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw03ITfTsgc75NlWimPviwxZVatCIiP6szDTI6PMKXZ/yZz3i/0FjBNCWVTfQsJ+w62pLBEiw==
X-Received: by 2002:a17:906:2cc9:: with SMTP id r9mr31749374ejr.138.1635262898493;
        Tue, 26 Oct 2021 08:41:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h10sm11133550edf.85.2021.10.26.08.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 08:41:38 -0700 (PDT)
Message-ID: <4da3cd96-33ee-fd6e-9405-9047d2f39545@redhat.com>
Date:   Tue, 26 Oct 2021 17:41:37 +0200
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
 <552baf68-8fed-9a6f-d18c-5634f93a58f8@redhat.com>
 <b86b8c1257d535cd03e6ded145aa0467b91929e7.camel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b86b8c1257d535cd03e6ded145aa0467b91929e7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 10/26/21 11:35, Tsuchiya Yuto wrote:
> On Sun, 2021-10-24 at 10:32 +0200, Hans de Goede wrote:
>> Hi,
>>
>> [...]
>>
>> <note going a bit offtopic from atomisp here>
>>
>> Friday I've resized the Android data partition on my Mi Pad 2 Android,
>> 16G eMMC model and installed Fedora 35 in the free space.
>>
>> And yesterday I've been poking at the Mi Pad 2 the entire day,
>> both under Fedora and under the original Android install to figure
>> out which chips there are and how they are used, etc. This has
>> diverted me from looking into atomisp2 stuff, but it was fun :)
>>
>> I've also managed to make the i915 driver work. It still gives one
>> warning during boot which I need to look into. But it works now.
>> ATM my i915 fix is just a hack. I plan to turn it into something
>> which I hope I can get upstream, I'll Cc you (Tsuchiya) on the
>> upstream submission of the i915 submission.
> 
> Thank you! I just tried your patch and now mipad2 can boot with GPU!

I'm happy to hear that it works for you to, is it ok if I add
a "Tested-by: Tsuchiya Yuto <kitakar@gmail.com>" to the next version
of the patch?

> So, I tried if I can reproduce touchscreen issue with atomisp, but
> there was no such issue. Touchscreen works regardless of atomisp drivers.
> I guess this is maybe a PMIC difference (mipad2/wcove and surface3/ccove).

Yeah, I actually bought a 2nd hand Surface 3 this weekend so that
I have the same platforms as you to test on as we work on improving
the atomisp2 driver. I've not run any atomisp tests on either device
yet, but I hope to get around to that soon. Then I should also be
able to see if I can reproduce the touchscreen issue and try to
debug it.

>> I've also figured out all the other chips used in the Mi Pad 2
>> and I believe I should be able to get things battery monitoring
>> and switching the USB plug between host <-> device mode to work
>> without too much issues (but it will take some time). This is
>> all pretty similar to all the special handling which I've already
>> added to the kernel for the GPD win / pocket devices which also
>> use the CHT Whiskey Cove PMIC.
> 
> Thanks. I haven't looked into anything other than atomisp yet, so I
> can't comment anything but it's really interesting to see how drivers
> are developed :-)
> 
>> Here are my notes about all the non standard chips used in the
>> Mi Pad 2:
>>
>> PMIC/charger/fuel-gauge:
>> -The Type-C connector is used as / wired up as a regular micro-USB connector
>>
>> -There is a Cherry Trail Whiskey Cove PMIC on the I2C7 i2c_designware ctrl
>>  -This is used for ID pin detection
>>  -Charger-type detection does not work though, because the USB-2 data-lines are
>>   not connected to it
>>  -The 2 GPIOs which are used to enable an external V5 boost converter for
>>   Vbus resp Vconn on other designs are both configured as inputs (register value 0x18)
>>  -The extcon-intel-cht-wc driver should control the USB mux according to the
>>   ID pin, identically to how the extcon-axp288 code does this
>>  -The extcon-intel-cht-wc driver should control the Vboost converter in the
>>   bq25890 charger IC based on the ID pin 
>>
>> -There is a bq25890 charger hanging from the CHT-WC PMIC charger I2C-bus at addr 0x6a
>>  -At boot the BIOS clears bit 4 of register 3, disabling charging so the device
>>   will still be powered from an external supply, but it will not charge!
>>   Linux needs to fix this up
>>  -This charger is connected to the USB-2 data-lines and automatically sets its
>>   input-current-limit based on the detected charger
>>  -Bit 5 of register 3 controls the Vboost converter for sending 5V to attached
>>   USB-devices this bit needs to be controller by Linux based on the ID pin
>>   detection from the PMIC. The BIOS does leave this enabled when booting with
>>   a USB-device plugged in.
>>
>> -There is a BQ27520 fuel-gauge at address 0x55 of the I2C1 i2c_designware ctrl
>>
>> I2C1: addr 0x55 BQ27520 fuel-gauge
>>
>> I2C2: addr 0x0e unknown
>> I2C2: addr 0x1b Realtek 5659 codec ? (not detected by i2cdetect)
>> I2C2: addr 0x2c TI lp855x backlight controller:
>>  https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/video/backlight/lp855x_bl.c
>> I2C2: addr 0x34 NXP9890 audio amplifier
>> I2C2: addr 0x37 NXP9890 audio amplifier
>> I2C2: addr 0x3e unknown
>>
>> I2C3: addr 0x30 KTD2026 RGB LED driver, controlling the status LED
>>  https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/leds/leds-ktd2026.c
>>
>> I2C4: addr 0x36? OVTI5693 camera sensor
>> I2C4: addr 0x37 t3ka3 camera sensor
>>
>> I2C5: addr 0x5a Motor DRV2604 Driver ? the tablet has no haptic feedback motor!
>>       Also nothing seen here by i2c-detect, probably bogus
> 
> This must be a motor for the world-facing camera! I see "DW9761" in DSDT.

Interesting I checked and the world facing camera indeed has
a variable focus length. But the VCM (Voice Coil Motor) for this likely
sits on the same bus as the sensors.

> Currently, I have no idea if motors are working with the upstreamed
> atomisp because there is no userspace driver for Linux that can use
> motors.

No the code attaching to the DRV2604 ACPI ID really is a motor driver
for haptic feedback, see:
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/misc/tspdrv/ImmVibeSPI.c

(never mind the SPI in the name it is actually an I2C driver).

I also noticed that the driver is using an enable GPIO, but even
if I drive that high i2cdetect still does not see anything and
AFAIK the Mi Pad 2 does not have haptics / a buzzer motor.

Regards,

Hans


> 
> Regards,
> Tsuchiya Yuto
> 
>> I2C6: addr 0x38 FTSC touchscreen
>>
>> I2C7: PMIC bus
>>
>> -TPS61158: LED controller for menu keys LEDS, driven by PWM controller, max brightness
>>  80/255 !!!!
>>  https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/leds/leds-tps61158.c
>>  Android behavior: light up menu keys for 5 seconds on any human input:
>>  -Write a special HID driver for mainline linux to fix the key-events send by the
>>   touchscreen and to light up the keys for 5 seconds on any HID input reports
>>
>> -Sensors (accel, als) through hid-ishtp
>>
>> -Panel 1536x2048 on card0-DSI-1
>>  https://bugs.freedesktop.org/show_bug.cgi?id=108714
>>
>> -DSDT: Android: OSID == 0x04, Windows OSID == 0x01
>>
>> Regards,
>>
>> Hans
> 
> 

