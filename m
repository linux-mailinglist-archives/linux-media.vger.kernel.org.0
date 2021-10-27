Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F2143CE47
	for <lists+linux-media@lfdr.de>; Wed, 27 Oct 2021 18:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238641AbhJ0QK2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 12:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237245AbhJ0QK1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 12:10:27 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2432C061570;
        Wed, 27 Oct 2021 09:08:01 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id r2so3341822pgl.10;
        Wed, 27 Oct 2021 09:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=T5um0+Z/h58K04BGvHwe9k2ukenVuoAbZVOpduSLzrE=;
        b=gmNgYVj9qBTFvFWs0Tg5C01Q7vn0sdj9SgsiWlCZf3vDCryuyWSq9jIQ12rLVP94lh
         jh9h3ICer1H2EYuM+zogs/Y8OgcArWCuQG/665TJXadzXZ2er1L8fs0Z9cmfKZYLcDZb
         kW0JqWh66BI2kLNvlpsTDmBp2nE88POn+06u/ohL2P2fy9GLwkw/RsEzotFRdlPIvXxY
         ounSMSZ4LP0Ujf0nj4NIJupn0azrRXI2DYLdPnF8dY0J5Deaq0Ts7rXFZK2H4736iibh
         4fpxU8fWHFFRp6JPSapNfSVWO/oBV2DrbS4zSG+m4JUWsctZbHz8rcSZs7BAlB2h6ZiA
         d9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=T5um0+Z/h58K04BGvHwe9k2ukenVuoAbZVOpduSLzrE=;
        b=QV7iBIq7hde0uFvRNuSA3kIVl6cXPE4svaw/720/P6302LAfPwyL68gQZcEcdhgdar
         zXcleiP7zFFTxi3UjLaDLHeRufAX/0N6uIaC3AraTQXQYxwDlVFrfIIiW//SAnl4BvBb
         b04AanhoK9YSMrLPhuqZWdIwM3qyDid5Zhfbnrzm/Iffiujn/ILH8bl/i7eiJdQvzUSK
         QZFLysmuLu8eWkF9ghvTRHoKSc8kW3lno2An0MZTvcrgEfkHmDQaI3LuHDpy7Js9J13n
         CNo1B4piXAXABCvYLVNLI7w+XXi3hBENq3097Kyxs84bp4fVZVBx3+jtOgCYW5mVRhv9
         ZCiA==
X-Gm-Message-State: AOAM53296eTzceE+uMI9ReLi3krLRQMst8HOL1vfWQ5nrYCaY7JgNqzG
        y5YQrvTQ0FwhayTo9SE1UZo=
X-Google-Smtp-Source: ABdhPJxrqNDKN0r4cjymY3KWZLabpBnBDjJbXaj4t+RZaoABzvqUzp6kk6ZcSlOHqW0ahHHcB0nNqA==
X-Received: by 2002:a62:ab14:0:b0:47b:e126:ea50 with SMTP id p20-20020a62ab14000000b0047be126ea50mr27329713pff.58.1635350881010;
        Wed, 27 Oct 2021 09:08:01 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id s30sm465267pfg.17.2021.10.27.09.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 09:08:00 -0700 (PDT)
Message-ID: <b535d09d606cc45544c00207467354eeb2fcfa24.camel@gmail.com>
Subject: Re: [BUG 5/5] [BUG] media: atomisp: atomisp causes touchscreen to
 stop working on Microsoft Surface 3
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
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
Date:   Thu, 28 Oct 2021 01:07:56 +0900
In-Reply-To: <4da3cd96-33ee-fd6e-9405-9047d2f39545@redhat.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
         <20211017162337.44860-6-kitakar@gmail.com>
         <103b5438-9f7c-7e89-28b9-29fe11eb818c@redhat.com>
         <cfad27a4bfdd94417305e1519e2f450a4422844d.camel@gmail.com>
         <552baf68-8fed-9a6f-d18c-5634f93a58f8@redhat.com>
         <b86b8c1257d535cd03e6ded145aa0467b91929e7.camel@gmail.com>
         <4da3cd96-33ee-fd6e-9405-9047d2f39545@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-10-26 at 17:41 +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/26/21 11:35, Tsuchiya Yuto wrote:
> > On Sun, 2021-10-24 at 10:32 +0200, Hans de Goede wrote:
> > > Hi,
> > > 
> > > [...]
> > > 
> > > <note going a bit offtopic from atomisp here>
> > > 
> > > Friday I've resized the Android data partition on my Mi Pad 2 Android,
> > > 16G eMMC model and installed Fedora 35 in the free space.
> > > 
> > > And yesterday I've been poking at the Mi Pad 2 the entire day,
> > > both under Fedora and under the original Android install to figure
> > > out which chips there are and how they are used, etc. This has
> > > diverted me from looking into atomisp2 stuff, but it was fun :)
> > > 
> > > I've also managed to make the i915 driver work. It still gives one
> > > warning during boot which I need to look into. But it works now.
> > > ATM my i915 fix is just a hack. I plan to turn it into something
> > > which I hope I can get upstream, I'll Cc you (Tsuchiya) on the
> > > upstream submission of the i915 submission.
> > 
> > Thank you! I just tried your patch and now mipad2 can boot with GPU!
> 
> I'm happy to hear that it works for you to, is it ok if I add
> a "Tested-by: Tsuchiya Yuto <kitakar@gmail.com>" to the next version
> of the patch?

Yes, no problem.

> > So, I tried if I can reproduce touchscreen issue with atomisp, but
> > there was no such issue. Touchscreen works regardless of atomisp drivers.
> > I guess this is maybe a PMIC difference (mipad2/wcove and surface3/ccove).
> 
> Yeah, I actually bought a 2nd hand Surface 3 this weekend so that
> I have the same platforms as you to test on as we work on improving
> the atomisp2 driver. I've not run any atomisp tests on either device
> yet, but I hope to get around to that soon. Then I should also be
> able to see if I can reproduce the touchscreen issue and try to
> debug it.

Welcome, and really appreciate it :-)

> > > I've also figured out all the other chips used in the Mi Pad 2
> > > and I believe I should be able to get things battery monitoring
> > > and switching the USB plug between host <-> device mode to work
> > > without too much issues (but it will take some time). This is
> > > all pretty similar to all the special handling which I've already
> > > added to the kernel for the GPD win / pocket devices which also
> > > use the CHT Whiskey Cove PMIC.
> > 
> > Thanks. I haven't looked into anything other than atomisp yet, so I
> > can't comment anything but it's really interesting to see how drivers
> > are developed :-)
> > 
> > > Here are my notes about all the non standard chips used in the
> > > Mi Pad 2:
> > > 
> > > PMIC/charger/fuel-gauge:
> > > -The Type-C connector is used as / wired up as a regular micro-USB connector
> > > 
> > > -There is a Cherry Trail Whiskey Cove PMIC on the I2C7 i2c_designware ctrl
> > >  -This is used for ID pin detection
> > >  -Charger-type detection does not work though, because the USB-2 data-lines are
> > >   not connected to it
> > >  -The 2 GPIOs which are used to enable an external V5 boost converter for
> > >   Vbus resp Vconn on other designs are both configured as inputs (register value 0x18)
> > >  -The extcon-intel-cht-wc driver should control the USB mux according to the
> > >   ID pin, identically to how the extcon-axp288 code does this
> > >  -The extcon-intel-cht-wc driver should control the Vboost converter in the
> > >   bq25890 charger IC based on the ID pin 
> > > 
> > > -There is a bq25890 charger hanging from the CHT-WC PMIC charger I2C-bus at addr 0x6a
> > >  -At boot the BIOS clears bit 4 of register 3, disabling charging so the device
> > >   will still be powered from an external supply, but it will not charge!
> > >   Linux needs to fix this up
> > >  -This charger is connected to the USB-2 data-lines and automatically sets its
> > >   input-current-limit based on the detected charger
> > >  -Bit 5 of register 3 controls the Vboost converter for sending 5V to attached
> > >   USB-devices this bit needs to be controller by Linux based on the ID pin
> > >   detection from the PMIC. The BIOS does leave this enabled when booting with
> > >   a USB-device plugged in.
> > > 
> > > -There is a BQ27520 fuel-gauge at address 0x55 of the I2C1 i2c_designware ctrl
> > > 
> > > I2C1: addr 0x55 BQ27520 fuel-gauge
> > > 
> > > I2C2: addr 0x0e unknown
> > > I2C2: addr 0x1b Realtek 5659 codec ? (not detected by i2cdetect)
> > > I2C2: addr 0x2c TI lp855x backlight controller:
> > >  https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/video/backlight/lp855x_bl.c
> > > I2C2: addr 0x34 NXP9890 audio amplifier
> > > I2C2: addr 0x37 NXP9890 audio amplifier
> > > I2C2: addr 0x3e unknown
> > > 
> > > I2C3: addr 0x30 KTD2026 RGB LED driver, controlling the status LED
> > >  https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/leds/leds-ktd2026.c
> > > 
> > > I2C4: addr 0x36? OVTI5693 camera sensor
> > > I2C4: addr 0x37 t3ka3 camera sensor
> > > 
> > > I2C5: addr 0x5a Motor DRV2604 Driver ? the tablet has no haptic feedback motor!
> > >       Also nothing seen here by i2c-detect, probably bogus
> > 
> > This must be a motor for the world-facing camera! I see "DW9761" in DSDT.
> 
> Interesting I checked and the world facing camera indeed has
> a variable focus length. But the VCM (Voice Coil Motor) for this likely
> sits on the same bus as the sensors.
> 
> > Currently, I have no idea if motors are working with the upstreamed
> > atomisp because there is no userspace driver for Linux that can use
> > motors.
> 
> No the code attaching to the DRV2604 ACPI ID really is a motor driver
> for haptic feedback, see:
> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/misc/tspdrv/ImmVibeSPI.c
> (never mind the SPI in the name it is actually an I2C driver).

Um, I spoke too soon. It may be possible that there is no such device
but just it's written in DSDT. There is one instance. On my mipad2, there
is no S5K4H8 camera but shows up anyway (when `OSID == 0x04`).

Regards,
Tsuchiya Yuto

> I also noticed that the driver is using an enable GPIO, but even
> if I drive that high i2cdetect still does not see anything and
> AFAIK the Mi Pad 2 does not have haptics / a buzzer motor.
> 
> Regards,
> 
> Hans
> 
> 
> > 
> > Regards,
> > Tsuchiya Yuto
> > 
> > > I2C6: addr 0x38 FTSC touchscreen
> > > 
> > > I2C7: PMIC bus
> > > 
> > > -TPS61158: LED controller for menu keys LEDS, driven by PWM controller, max brightness
> > >  80/255 !!!!
> > >  https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/latte-l-oss/drivers/leds/leds-tps61158.c
> > >  Android behavior: light up menu keys for 5 seconds on any human input:
> > >  -Write a special HID driver for mainline linux to fix the key-events send by the
> > >   touchscreen and to light up the keys for 5 seconds on any HID input reports
> > > 
> > > -Sensors (accel, als) through hid-ishtp
> > > 
> > > -Panel 1536x2048 on card0-DSI-1
> > >  https://bugs.freedesktop.org/show_bug.cgi?id=108714
> > > 
> > > -DSDT: Android: OSID == 0x04, Windows OSID == 0x01
> > > 
> > > Regards,
> > > 
> > > Hans
> > 
> > 
> 

