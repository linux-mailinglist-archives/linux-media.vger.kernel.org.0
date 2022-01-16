Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E3548FC39
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 11:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbiAPKuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 05:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231880AbiAPKuS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 05:50:18 -0500
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17536C061574
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 02:50:17 -0800 (PST)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id EC99C5C01DD;
        Sun, 16 Jan 2022 11:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1642330215;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=23Ejah2uWRbfv6CyA6t6qcXAwX7LkLD/Ma6ASvyQNIE=;
        b=kH85Q7Do0DlM5rRsA7MC/mb2u6MH8voVfyEkO9ootQb6cpezuGkQLTnFhSgWiCP05G485d
        Hp6mKq5PeH91xlP3O1Ekzug5pJje8XG6gCtGw46Mr9BMRW/kiqg2QHrujROj5aUgyVpJD4
        2ofm1SFSXiVplzZeC5GY7bl6rSg/yZ8=
MIME-Version: 1.0
Date:   Sun, 16 Jan 2022 11:50:14 +0100
From:   Stefan Agner <stefan@agner.ch>
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: (EXT) HDMI CEC on ODROID-N2+
In-Reply-To: <2219762.iZASKD2KPV@kongar>
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
 <8112d37eaed169735ca8b46e5d587210@agner.ch>
 <772e1613cd49ddac3941ae584e0e89c2@agner.ch> <2219762.iZASKD2KPV@kongar>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <3ed4754d39454354c6ac79ea2256c969@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On 2022-01-16 11:14, Alexander Stein wrote:
> Hi Stefan,
> 
> Am Samstag, 15. Januar 2022, 14:28:01 CET schrieb Stefan Agner:
>> That assumption turned out to be wrong: I used our mainline based U-Boot
>> 2021.10 instead of the Arch Linux ARM U-Boot, and HDMI CEC continued to
>> work.
> 
> Does the mainstream U-Boot work out of the box? Or does it require some 
> additional configuration?
> 

Yes mainline U-Boot works out of the box. Building it is somewhat
involved since it requires extra firmwares (there are build instructions
in the source tree in board/amlogic/w400/README.odroid-n2).

You need to add a boot script to your boot partition. I used the script
part of the uboot-odroid-n2-mainline package as inspiration [1]. It
needs some adjustments as it seems to try to boot from the root file
system directly (and my setup used the FAT/ext4 setup still).

We carry a single patch which improved reliability booting from eMMC,
see [2].


>> I then moved to 5.15.13 as well to rule out any kernel changes. But
>> still, in our configuration HDMI CEC did not work. I ended up diffing
>> configuration, and noticed that we are using built-in CONFIG_CEC_CORE
>> whereas Arch Linux uses it as a module. To build CONFIG_CEC_CORE as a
>> module I had to change some other configuration from built-in to module,
>> namely:
>>
>> - CONFIG_CEC_CORE=m
>> - CONFIG_DRM_DW_HDMI=m
>> - CONFIG_DRM_MESON=m
>> - CONFIG_DRM_MESON_DW_HDMI=m
>>
>> With that change, HDMI CEC started to work in my builds too!
>>
>> With that change, it also works on Linux 5.10.
>>
>> I guess there is some ordering issue or something which makes it fail
>> when those drivers are built-in? Note that I did not change
>> CONFIG_CEC_MESON_G12A_AO, that driver was already a module before.
> 
> You need all 4 options above to be modules? Or is it maybe enough to set 
> CONFIG_DRM_DW_HDMI_CEC=m? This should make CONFIG_CEC_CORE=m as well, while 
> the other modules are built-in.

In our builds I disabled CONFIG_DRM_DW_HDMI_CEC entirely actually.

It seems that CONFIG_DRM_DW_HDMI is tied to CEC_CORE through this
dependency:

config DRM_DW_HDMI
...
        select CEC_CORE if CEC_NOTIFIER

> I suspect at some point a -EPROBE_DEFER is missing.
> 
> Just FYI: Arch Linux aarch64 kernel config currently lacks some drivers for 
> HDMI audio. See [1].

Thanks for the link, just checked, it seems our kernel configuration
covers those.

--
Stefan

> 
> Best regards,
> Alexander
> 
> [1] https://github.com/archlinuxarm/PKGBUILDs/pull/1864

[1]
https://github.com/archlinuxarm/PKGBUILDs/blob/master/alarm/uboot-odroid-c2-mainline/boot.txt
[2]
https://github.com/home-assistant/operating-system/blob/rel-7/buildroot-external/board/hardkernel/patches/uboot/0001-HACK-mmc-meson-gx-limit-to-24MHz.patch
