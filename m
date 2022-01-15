Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C982448F71A
	for <lists+linux-media@lfdr.de>; Sat, 15 Jan 2022 14:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbiAON2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jan 2022 08:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiAON2F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jan 2022 08:28:05 -0500
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB238C061574
        for <linux-media@vger.kernel.org>; Sat, 15 Jan 2022 05:28:04 -0800 (PST)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id BD8F25C2F4F;
        Sat, 15 Jan 2022 14:28:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1642253281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=psCj3yYz2JzB8Myw+pQ9GhPT5gIxMQVgGkHm8xE4YQs=;
        b=mz+CybejpGgsAXbzhE+DZqNS0sMhJy/Z+Y5EY7YFHxpDMxn9j/g9gwR8ntwy+n6HpPppai
        uDURKDGACiD+bJNKid89O6bIkOk32DyF23yWSCjNCxalVOGYsLLB/eKRMdf18SbYMwfPan
        rIEiMsH6aFYyrPXzGs/jifyJ7aLZVKc=
MIME-Version: 1.0
Date:   Sat, 15 Jan 2022 14:28:01 +0100
From:   Stefan Agner <stefan@agner.ch>
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: (EXT) HDMI CEC on ODROID-N2+
In-Reply-To: <8112d37eaed169735ca8b46e5d587210@agner.ch>
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
 <5560050.DvuYhMxLoT@kongar> <8112d37eaed169735ca8b46e5d587210@agner.ch>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <772e1613cd49ddac3941ae584e0e89c2@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander, Hi Neil,

On 2022-01-15 11:52, Stefan Agner wrote:
> Hi Alexander,
> 
> On 2022-01-15 11:02, Alexander Stein wrote:
>> Hi Stefan,
>>
>> Am Donnerstag, 13. Januar 2022, 15:36:38 CET schrieb Stefan Agner:
>>> Hi Neil,
>>>
>>> I am trying to use HDMI CEC on ODROID-N2+ using Linux 5.10.91. However,
>>> I was unsuccessful: As far as I can tell cec-client uses the right
>>> device (I disabled CONFIG_DRM_DW_HDMI_CEC since my kernel is still
>>> missing your patch "drm/meson: dw-hdmi: disable DW-HDMI CEC
>>> sub-driver"). But communication won't work, and dmesg prints timeout
>>> messages:
>>>
>>> [   68.831253] cec-meson_g12a_ao_cec: message ff 84 20 00 06 timed out
>>> [   71.134987] cec-meson_g12a_ao_cec: message ff 87 00 15 82 timed out
>>> [   73.438826] cec-meson_g12a_ao_cec: message f0 timed out
>>> [   75.742677] cec-meson_g12a_ao_cec: message f0 timed out
>>> [   78.046555] cec-meson_g12a_ao_cec: message f0 timed out
>>> [   80.350446] cec-meson_g12a_ao_cec: message f0 timed out
>>> [   82.654358] cec-meson_g12a_ao_cec: message 11 timed out
>>> [   84.958285] cec-meson_g12a_ao_cec: message 11 timed out
>>> [   87.262194] cec-meson_g12a_ao_cec: message 11 timed out
>>> [   89.566130] cec-meson_g12a_ao_cec: message 11 timed out
>>>
>>> I did a quick test with CoreELEC which uses the 4.9 downstream kernel,
>>> CEC seems to work there. So it does not seem to be my hardware setup.
>>>
>>> A quick test with the latest Linux 5.16 shows the same errors.
>>>
>>> Do you happen to have an idea? Do you know if HDMI CEC using upstream
>>> kernels worked at one point on that particular platform?
>>
>> I'm using Arch Linux on my ODROID-n2 (non-plus) and HDMI CEC works as
>> expected.
>> Currently I'm running a 5.15.13-1-aarch64-ARCH kernel. AFAICS the mentioned
>> patch is mainline since v5.14. I can see my TV without issues. I have to add
>> that not every cable is suitable for HDMI CEC, I have one where CEC does not
>> work (in general).
> 
> Hm, interesting, thanks for the datapoint!
> 
> I tried to reproduce your findings, unfortunately I am not successful in
> booting mainline using Arch Linux ARM so far. It seems it comes with
> downstream 4.9 kernel by default (where CEC seems to work in this case
> too). I then installed linux-aarch64 and adjusted the device tree, but
> it seems that the downstream U-Boot 2015.01-10 has some hardcoded
> "rsvmem" command which fails. How are you booting v5.14?

FWIW, adjusted U-Boot load addresses fixed that issue:
# Set load addresses
setenv dtb_loadaddr "0x20000000"
setenv loadaddr "0x1080000"
setenv initrd_loadaddr "0x4080000"

And I can confirm, HDMI CEC works with Arch Linux 5.15.13 kernel!

> 
> It is a bit surprising that 5.15.13 works for you but 5.16 didn't for
> me. That makes me wonder, could it be bootloader dependent? Are you
> using downstream U-Boot?

That assumption turned out to be wrong: I used our mainline based U-Boot
2021.10 instead of the Arch Linux ARM U-Boot, and HDMI CEC continued to
work.

I then moved to 5.15.13 as well to rule out any kernel changes. But
still, in our configuration HDMI CEC did not work. I ended up diffing
configuration, and noticed that we are using built-in CONFIG_CEC_CORE
whereas Arch Linux uses it as a module. To build CONFIG_CEC_CORE as a
module I had to change some other configuration from built-in to module,
namely:

- CONFIG_CEC_CORE=m
- CONFIG_DRM_DW_HDMI=m
- CONFIG_DRM_MESON=m
- CONFIG_DRM_MESON_DW_HDMI=m

With that change, HDMI CEC started to work in my builds too!

With that change, it also works on Linux 5.10.

I guess there is some ordering issue or something which makes it fail
when those drivers are built-in? Note that I did not change
CONFIG_CEC_MESON_G12A_AO, that driver was already a module before.

--
Stefan
