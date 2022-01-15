Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B971048F670
	for <lists+linux-media@lfdr.de>; Sat, 15 Jan 2022 11:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiAOKwf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jan 2022 05:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbiAOKwf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jan 2022 05:52:35 -0500
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF6AC061574
        for <linux-media@vger.kernel.org>; Sat, 15 Jan 2022 02:52:34 -0800 (PST)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id C05EF5C2270;
        Sat, 15 Jan 2022 11:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1642243951;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=miarnX3VEQt3gL/Y2vxztbfjEWeEFx4zHSIOYiBK09g=;
        b=Je0ErrSWQZaj8LyNl0DkbraTeaRIKoelnPRwyayVgixEC8PslLPWdyG9tnuodJtdZ/dkrO
        Uebjk9feprXjTJtcdbXlGEOI/1Qc6o80GjHslJymzEC2XOjtcUS+Q4ylRfajoJb1BgHvIE
        oujUi5KYH4X/i1MZ8avLGsLz5wrG8Co=
MIME-Version: 1.0
Date:   Sat, 15 Jan 2022 11:52:31 +0100
From:   Stefan Agner <stefan@agner.ch>
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-media@vger.kernel.org
Subject: Re: (EXT) HDMI CEC on ODROID-N2+
In-Reply-To: <5560050.DvuYhMxLoT@kongar>
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
 <5560050.DvuYhMxLoT@kongar>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <8112d37eaed169735ca8b46e5d587210@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On 2022-01-15 11:02, Alexander Stein wrote:
> Hi Stefan,
> 
> Am Donnerstag, 13. Januar 2022, 15:36:38 CET schrieb Stefan Agner:
>> Hi Neil,
>>
>> I am trying to use HDMI CEC on ODROID-N2+ using Linux 5.10.91. However,
>> I was unsuccessful: As far as I can tell cec-client uses the right
>> device (I disabled CONFIG_DRM_DW_HDMI_CEC since my kernel is still
>> missing your patch "drm/meson: dw-hdmi: disable DW-HDMI CEC
>> sub-driver"). But communication won't work, and dmesg prints timeout
>> messages:
>>
>> [   68.831253] cec-meson_g12a_ao_cec: message ff 84 20 00 06 timed out
>> [   71.134987] cec-meson_g12a_ao_cec: message ff 87 00 15 82 timed out
>> [   73.438826] cec-meson_g12a_ao_cec: message f0 timed out
>> [   75.742677] cec-meson_g12a_ao_cec: message f0 timed out
>> [   78.046555] cec-meson_g12a_ao_cec: message f0 timed out
>> [   80.350446] cec-meson_g12a_ao_cec: message f0 timed out
>> [   82.654358] cec-meson_g12a_ao_cec: message 11 timed out
>> [   84.958285] cec-meson_g12a_ao_cec: message 11 timed out
>> [   87.262194] cec-meson_g12a_ao_cec: message 11 timed out
>> [   89.566130] cec-meson_g12a_ao_cec: message 11 timed out
>>
>> I did a quick test with CoreELEC which uses the 4.9 downstream kernel,
>> CEC seems to work there. So it does not seem to be my hardware setup.
>>
>> A quick test with the latest Linux 5.16 shows the same errors.
>>
>> Do you happen to have an idea? Do you know if HDMI CEC using upstream
>> kernels worked at one point on that particular platform?
> 
> I'm using Arch Linux on my ODROID-n2 (non-plus) and HDMI CEC works as 
> expected.
> Currently I'm running a 5.15.13-1-aarch64-ARCH kernel. AFAICS the mentioned 
> patch is mainline since v5.14. I can see my TV without issues. I have to add 
> that not every cable is suitable for HDMI CEC, I have one where CEC does not 
> work (in general).

Hm, interesting, thanks for the datapoint!

I tried to reproduce your findings, unfortunately I am not successful in
booting mainline using Arch Linux ARM so far. It seems it comes with
downstream 4.9 kernel by default (where CEC seems to work in this case
too). I then installed linux-aarch64 and adjusted the device tree, but
it seems that the downstream U-Boot 2015.01-10 has some hardcoded
"rsvmem" command which fails. How are you booting v5.14?

It is a bit surprising that 5.15.13 works for you but 5.16 didn't for
me. That makes me wonder, could it be bootloader dependent? Are you
using downstream U-Boot?

--
Stefan

> 
> HTH
> Alexander
> ------
> $ cec-ctl --playback
> $ cec-ctl -S
> Driver Info:
>         Driver Name                : meson-ao-cec-g12a
>         Adapter Name               : meson_g12a_ao_cec
>         Capabilities               : 0x0000011e
>                 Logical Addresses
>                 Transmit
>                 Passthrough
>                 Remote Control Support
>                 Connector Info
>         Driver version             : 5.15.13
>         Available Logical Addresses: 4
>         DRM Connector Info         : card 1, connector 32
>         Physical Address           : 1.0.0.0
>         Logical Address Mask       : 0x0010
>         CEC Version                : 2.0
>         Vendor ID                  : 0x000c03 (HDMI)
>         OSD Name                   : 'Playback'
>         Logical Addresses          : 1 (Allow RC Passthrough)
> 
>           Logical Address          : 4 (Playback Device 1)
>             Primary Device Type    : Playback
>             Logical Address Type   : Playback
>             All Device Types       : Playback
>             RC TV Profile          : None
>             Device Features        :
>                 None
> 
>         System Information for device 0 (TV) from device 4 (Playback Device 
> 1):
>                 CEC Version                : 1.4
>                 Physical Address           : 0.0.0.0
>                 Primary Device Type        : TV
>                 Vendor ID                  : 0x080046 (Sony)
>                 OSD Name                   : 'TV'
>                 Power Status               : Standby
> 
>         Topology:
> 
>             0.0.0.0: TV
>                 1.0.0.0: Playback Device 1
