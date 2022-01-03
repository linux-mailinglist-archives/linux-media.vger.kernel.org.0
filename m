Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2A2482FEE
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 11:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbiACKf2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 05:35:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbiACKf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 05:35:28 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D3BC061761
        for <linux-media@vger.kernel.org>; Mon,  3 Jan 2022 02:35:27 -0800 (PST)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id F07FC1B00056;
        Mon,  3 Jan 2022 12:35:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1641206125;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ug2eJpsNZ7FEVLqlDiGcWIPnmfl69OcdLkGAcVn3k2I=;
        b=HDM2xeqHlvwiwyWrlHh6ZjrbZbM1XoXIljI1FsQswvKYJeSg2hDNWNclDK+YSJrLln29f0
        L/wbktKZ9oWV/XMZKsr92LVVxBs3drbTcVbmporyqMkIr3Vw1BB/07F+ePTRSHrxLnAHlY
        i/3D1eZOc0vCG20okU+UWI6t3js4QnJD0SfBZNRq6Yi7FfBPDxJx9S9vt38mLIguUNGLur
        t8aLaLlcNxlewB2cydCF4ErLd/ia77Q8dAqXvjltLX41/e1VPxRRpuWE3abztfpW+e5pXy
        u/KQgIvoEPFx+CbydPFg2DFKpqs7j9XTzlLCQQbrOSyJz095sNrLB0wSU1/TCA==
Date:   Mon, 3 Jan 2022 12:35:23 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YdLRa86ddm2T4xew@jyty>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220103092123.GA21115@gofer.mess.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1641206125; a=rsa-sha256;
        cv=none;
        b=TG6Gu+ZIoQK3+tC0qzMgjao7rD+W7/f+hEOyRKaLMXBNpm2Thxlpe8bkYLZH2lrTsg3Koe
        /su8xEq+kgz9tD2RIp2zqFvTnIbiygb2yMZbsXdkDXbVuJoJ+EZBXtr0mvwuLKmRvKbDh2
        Ln+40ZNEPbB2gWF3p4OM9GU1OytQBLeeR5m+Oc+3MTQnaXbjVOwyIIGGQAUvu6h4wVOIFF
        WS98lF/UJh9URzF6zYcZgbD/WmoC3a+NTfvw+TmeJAejjJsK1z97D0hJS9E8q7JwVwJzMz
        +/B69bjGUd/iWS+JKmRkq8HvwM+iFKLgLIouxAVoha9oqE2s60StQuvrsFvp6g==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1641206125;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ug2eJpsNZ7FEVLqlDiGcWIPnmfl69OcdLkGAcVn3k2I=;
        b=rHeVgq18CcQytNBclM+KGZS919KzLhVc2Jj77ebBpq+aJaehvH8bX1YO/DJrPqIbfx47b4
        T+JuIlvQKBiKaYXMXRMk6S7uR1C7i9komNp+WujVT26vMHChy5Hf2nbIJk3Y5PE3conQgP
        dxcJmDjnHBHaahdsLu+0cseEnKhM1MkZz+pGoJACTcpJ+UL9PlZWk1mWFn/rE8NrDggmUA
        NBWytIp0+r/XKiDt6/MGIVhYug9pIaligtWf/u2QVy4JFQD+RboMdsDfaXk1yL8G64mwJw
        I0d5sbhgD4N0O02wt3lR4eReuULyRSryXNyjNW/5Tfc31bCAs6e29gG+2EH0UA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Thank you for your prompt and helpful reply.

Mon, Jan 03, 2022 at 09:21:23AM +0000, Sean Young wrote:
>On Mon, Jan 03, 2022 at 08:52:46AM +0200, Marko Mäkelä wrote:
>> Hi,
>>
>> Years ago, I was using the Hauppauge Nova-T PCI 90002 card that bundles a
>> remote control unit that uses RC5 codes.
>
>Would you mind sending the lspci output for this device? Then we know 
>exactly how the driver is handling this.

I am no longer using the PCI (not PCIe) card, but only the remote 
control unit. I still have the hardware sitting unused, but I do not 
think that it is relevant to the problem when attempting to use the 
remote control unit with the Astrometa DVB-T2 USB adapter.

>That's not the way things should work. The speed at which the IR 
>message gets repeated depends on the IR protocol. You don't want a key 
>down/up event for each of those.

There is a use case where I actually want that. When I press and hold 
the volume-up button, or a button to scroll a list in a menu, I would 
the user interface to update as frequently as possible.

Sure, an initial delay that would discard the 2nd..nth IR message could 
be useful, so that when I press the channel+ button for less than half a 
second, the channel would only change once. But still, it might be 
better to filter out "premature repeats" for specific keycodes in the 
application (possibly depending on context) and configure the driver to 
pass everything through.

>You've turned off autorepeat with those options, so that's not going to 
>change anything. If you press a key, hold it for some time, and then 
>release you should get one key down, one key up and a few autorepeats 
>depending on the --delay/--period settings.

You are right. I tested the bundled RCU of the adapter, and I am indeed 
seeing such output. Here is the dmesg from 5.15.5:

[17984.345840] usb 2-6: Manufacturer: astrometadvbt2
[17984.352731] usb 2-6: dvb_usb_v2: found a 'Astrometa DVB-T2' in warm state
[17984.514105] dvbdev: DVB: registering new adapter (Astrometa DVB-T2)
[17984.545328] Registered IR keymap rc-astrometa-t2hybrid

And here is the ir-keymap -t output. It looks like what I would expect 
(except maybe the key_up event should be sent after the sequence of 
repeat events, not before them).

18022.134140: lirc protocol(nec): scancode = 0x40
18022.134157: event type EV_MSC(0x04): scancode = 0x40
18022.134157: event type EV_KEY(0x01) key_down: KEY_FULL_SCREEN(0x0174)
18022.134157: event type EV_SYN(0x00).
18022.260014: event type EV_KEY(0x01) key_up: KEY_FULL_SCREEN(0x0174)
18022.260014: event type EV_SYN(0x00).
18022.345513: lirc protocol(nec): scancode = 0x40 repeat
18022.345524: event type EV_MSC(0x04): scancode = 0x40
18022.345524: event type EV_SYN(0x00).
18022.561538: lirc protocol(nec): scancode = 0x40 repeat
18022.561549: event type EV_MSC(0x04): scancode = 0x40
18022.561549: event type EV_SYN(0x00).
...
18024.057680: lirc protocol(nec): scancode = 0x40 repeat
18024.057694: event type EV_MSC(0x04): scancode = 0x40
18024.057694: event type EV_SYN(0x00).
^C

>I think this is the issue you are having. Somehow there are gaps in 
>reading the IR, which are long enough to cause key up/down events.

I watched the IR LED in the live viewfinder of a digital camera while 
pressing a button, and you may be right: instead of seeing a constant 
stream of pulses, I saw a few pulses followed by a pause, then again a 
few pulses. After I replaced the batteries, I only saw a short pause 
every couple of seconds, which probably was a sampling artifact of the 
camera. But, this did not improve the situation on Linux yet.

>Each rc device has a timeout which determines how long after keydown 
>event, a key up event is sent as long as the same IR is not received 
>again. This is usually IR_DEFAULT_TIMEOUT (125ms). You can see the 
>value with
>`ir-ctl -f -d /dev/lirc0`
>
>I think the problem is that the gaps in your IR is greater than this timeout.

Again, you seem to be right:

sudo apt install v4l-utils
ir-ctl -f -d /dev/lirc0 
Receive features /dev/lirc0:
  - Device can receive raw IR
  - Can report decoded scancodes and protocol
  - Receiving timeout 9741 microseconds
Send features /dev/lirc0:
  - Device cannot send

How to increase the timeout from this less than 10ms to something closer 
to 125ms?

Note: The bundled remote control unit uses the NEC protocol while the 
one that I am attempting to use (hauppauge.toml) is RC-5.

Best regards,

	Marko
