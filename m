Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F5348FC20
	for <lists+linux-media@lfdr.de>; Sun, 16 Jan 2022 11:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiAPKOW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jan 2022 05:14:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiAPKOV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jan 2022 05:14:21 -0500
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BFBC061574
        for <linux-media@vger.kernel.org>; Sun, 16 Jan 2022 02:14:21 -0800 (PST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:105:465:1:2:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Jc9qt2pNFzQl1C;
        Sun, 16 Jan 2022 11:14:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1642328056;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gQWVGyE0JAbM1mFVgFpC7biPfOeBFT7yce6tDRDcClg=;
        b=w9PsR9UcH/1mzoGfwaaBVoJWFoPUhFP15iH10S8/isT+A6S3cYZqzekTrPrLz5pNgt4FvP
        x2ylQvhBOs+7mxjp3MPoYtjaBPEQ2dGHKSgtRz5qgTtF97xhJ4kAueto5rASaSNrnQ290w
        onOVz4ycDztPWLDJ9RjSaK//aPqS6sRTe4ku825DnWFIw7VHVb/a8SofbqXDQZElBWkPdX
        H5pD8qaq+TU0TmhyXCnno0Wz67+jaXUIJd8MNFr4z4XKjDucfUPG+pd9Lh7Qrr38seDgiA
        IDHNCXJwugqrZP/ozZ2TZ5CEkUhvypCyq1z/jmMm8E/MLwhdiToxSOldc+NXsw==
From:   Alexander Stein <alexander.stein@mailbox.org>
To:     Stefan Agner <stefan@agner.ch>
Cc:     narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: (EXT) HDMI CEC on ODROID-N2+
Date:   Sun, 16 Jan 2022 11:14:14 +0100
Message-ID: <2219762.iZASKD2KPV@kongar>
In-Reply-To: <772e1613cd49ddac3941ae584e0e89c2@agner.ch>
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch> <8112d37eaed169735ca8b46e5d587210@agner.ch> <772e1613cd49ddac3941ae584e0e89c2@agner.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Am Samstag, 15. Januar 2022, 14:28:01 CET schrieb Stefan Agner:
> > I tried to reproduce your findings, unfortunately I am not successful in
> > booting mainline using Arch Linux ARM so far. It seems it comes with
> > downstream 4.9 kernel by default (where CEC seems to work in this case
> > too). I then installed linux-aarch64 and adjusted the device tree, but
> > it seems that the downstream U-Boot 2015.01-10 has some hardcoded
> > "rsvmem" command which fails. How are you booting v5.14?
> 
> FWIW, adjusted U-Boot load addresses fixed that issue:
> # Set load addresses
> setenv dtb_loadaddr "0x20000000"
> setenv loadaddr "0x1080000"
> setenv initrd_loadaddr "0x4080000"
> 
> And I can confirm, HDMI CEC works with Arch Linux 5.15.13 kernel!

Yes, you need to modify the loading addresses as with newer kernels the size 
increased. With the load addresses you will hit a memory hole which aborts the 
boot process.
I'm on downstream u-boot BTW.

> That assumption turned out to be wrong: I used our mainline based U-Boot
> 2021.10 instead of the Arch Linux ARM U-Boot, and HDMI CEC continued to
> work.

Does the mainstream U-Boot work out of the box? Or does it require some 
additional configuration?

> I then moved to 5.15.13 as well to rule out any kernel changes. But
> still, in our configuration HDMI CEC did not work. I ended up diffing
> configuration, and noticed that we are using built-in CONFIG_CEC_CORE
> whereas Arch Linux uses it as a module. To build CONFIG_CEC_CORE as a
> module I had to change some other configuration from built-in to module,
> namely:
> 
> - CONFIG_CEC_CORE=m
> - CONFIG_DRM_DW_HDMI=m
> - CONFIG_DRM_MESON=m
> - CONFIG_DRM_MESON_DW_HDMI=m
> 
> With that change, HDMI CEC started to work in my builds too!
> 
> With that change, it also works on Linux 5.10.
> 
> I guess there is some ordering issue or something which makes it fail
> when those drivers are built-in? Note that I did not change
> CONFIG_CEC_MESON_G12A_AO, that driver was already a module before.

You need all 4 options above to be modules? Or is it maybe enough to set 
CONFIG_DRM_DW_HDMI_CEC=m? This should make CONFIG_CEC_CORE=m as well, while 
the other modules are built-in.
I suspect at some point a -EPROBE_DEFER is missing.

Just FYI: Arch Linux aarch64 kernel config currently lacks some drivers for 
HDMI audio. See [1].

Best regards,
Alexander

[1] https://github.com/archlinuxarm/PKGBUILDs/pull/1864



