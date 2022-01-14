Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B308248E449
	for <lists+linux-media@lfdr.de>; Fri, 14 Jan 2022 07:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236586AbiANGbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jan 2022 01:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234063AbiANGbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jan 2022 01:31:40 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFA7C061574
        for <linux-media@vger.kernel.org>; Thu, 13 Jan 2022 22:31:40 -0800 (PST)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B87A71B000FB;
        Fri, 14 Jan 2022 08:31:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1642141896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W5EJb7mBSaPyfeDGt6/hZ1YAhqX8qY0ZQifEsg76r+Q=;
        b=HwdgeJ4LwwH97RHB3su+y7lyTJkfQNTZRhy62dGVIBBtk0z5GjKU1Y2X80L5xyy8kKNVkV
        PAYywIVPdhCQrcvtZXU7h+KNg53onzmnbz4aOxSoHLXDLR74F46AeMukRW0zm6M5L0fO4H
        HD/UIWn16rxhNkGlY2jqkLJuq76pXwx/f3cLDMJOLNNS/s62xUEhkn65zv3BxHNY9WuSF6
        tc8Ogq8MNqY+r2G2krV1Y8AxywvlRpsPb2NIteTWDsQKLGU7L4Ff4OqELfaPmXuebVfFVY
        x7wp8nqXN0LR+ZQcwKv7VJjnjyRxDCkbsOAGYtby1TvN/QYiHvp9jklrv8ZBfg==
Date:   Fri, 14 Jan 2022 08:31:35 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YeEYxwUkCV7rSa0A@jyty>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
 <YdRwqt1pwb8osT6V@jyty>
 <20220105095355.GA6428@gofer.mess.org>
 <YdbVfObDZZnFIDc3@jyty>
 <YeBZmM0ISnFGcsVa@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YeBZmM0ISnFGcsVa@gofer.mess.org>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1642141896; a=rsa-sha256;
        cv=none;
        b=tXJt1gsuaCQcq3gt5v91jbTkcbsQB/3kYxHahEe7Y3Mu28f5v2PY2fgtHlVA1JigSJdNTz
        VySZ0haJO5luDXYR1arf5YxdR/HneuecRfNoKl4vwG7DjZ+5ScgSwtOt0v4LmHMmNPX0lI
        RjpXfyEBesmDOIaRW32lcconqUoOQm2KtM0oBzd6cwmLOLZDwBRta5qsOvSsewNYslSHsk
        9+EBtC4KnS4dQOPhkor7+bjhPSp6q+JE/dp+5TILx1QCQuy6+enuVfaP6ka7VIfZhRxt9k
        HILsnRLDYQmf1oDF1nce/sfl1Qjo9/SK7UPYGEYK4opSLJAFD7SVjVn1hsgbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1642141896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W5EJb7mBSaPyfeDGt6/hZ1YAhqX8qY0ZQifEsg76r+Q=;
        b=BNW6FDoQoNTIw5z9ukXE2M4QpSyNT/c3oM/D6cwETs67P9bt+uKzMVQSN0d5MBgChKSHPT
        LQ99vclvZoGt1PN8nCY6l1m0akLfLP7DpqHBaJf5XU2rZjzugIOR9PMd9x70bLwIFBDuil
        50lY/qvfc8IuLLSxmm0uX5piQfAyp3tsRyDUp+Bd0vDdxD9nSI8kf3zMvLP7qXe7Jj8FkH
        b7/wHWGZInck1CJVWF14EFYqeTBgTDEfebySenzgARTIRa6soAU4vUutdkZYU8mqvnWkVb
        dGTIwBzDcHqHBHB9mrsUFn278QYtKWxrjyiOcP3pMYDg5xfG0k9zmi+qdUaFfg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thu, Jan 13, 2022 at 04:55:52PM +0000, Sean Young wrote:
>So I had to dig around for a while, but I have the same device here.  
>After some experimenting I've written a patch. Please could test it out 
>for me, a `Tested-by:` would be appreciated (if it works of course!).

It is significantly better for the bundled remote control unit (using 
the NEC protocol). But it can still lose events. I tested by holding 
down the VOL+ and VOL- keys. Also the GNOME Desktop was listening to 
those events, so I got some additional visual feedback.

Here is a trace from ir-keytable -t, using the NEC protocol:

Testing events. Please, press CTRL-C to abort.
261.125938: lirc protocol(nec): scancode = 0x1e
261.125959: event type EV_MSC(0x04): scancode = 0x1e
261.125959: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
261.125959: event type EV_SYN(0x00).
261.189926: lirc protocol(nec): scancode = 0x1e repeat
261.189939: event type EV_MSC(0x04): scancode = 0x1e
261.189939: event type EV_SYN(0x00).
261.309891: lirc protocol(nec): scancode = 0x1e repeat
261.309905: event type EV_MSC(0x04): scancode = 0x1e
261.309905: event type EV_SYN(0x00).
261.429960: lirc protocol(nec): scancode = 0x1e repeat
261.429973: event type EV_MSC(0x04): scancode = 0x1e
261.429973: event type EV_SYN(0x00).
261.553908: lirc protocol(nec): scancode = 0x1e repeat
261.553923: event type EV_MSC(0x04): scancode = 0x1e
261.553923: event type EV_SYN(0x00).
261.617911: lirc protocol(nec): scancode = 0x1e repeat
261.617924: event type EV_MSC(0x04): scancode = 0x1e
261.617924: event type EV_SYN(0x00).
261.628041: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
261.628041: event type EV_SYN(0x00).
261.737970: lirc protocol(nec): scancode = 0x1e repeat
261.628041: event type EV_MSC(0x04): scancode = 0x1e
261.628041: event type EV_SYN(0x00).
261.760048: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
261.760048: event type EV_SYN(0x00).
261.857958: lirc protocol(nec): scancode = 0x1e repeat
261.760048: event type EV_MSC(0x04): scancode = 0x1e
261.760048: event type EV_SYN(0x00).
261.892056: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
261.892056: event type EV_SYN(0x00).

So far, so good. The initial delay between the key_down events is 500ms.  
But, keep reading:

262.024055: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
262.024055: event type EV_SYN(0x00).
262.045960: lirc protocol(nec): scancode = 0x1e repeat
262.024055: event type EV_MSC(0x04): scancode = 0x1e
262.024055: event type EV_SYN(0x00).
262.156052: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
262.156052: event type EV_SYN(0x00).
262.156052: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
262.156052: event type EV_SYN(0x00).
264.074505: lirc protocol(nec): scancode = 0x1e repeat
264.074524: event type EV_MSC(0x04): scancode = 0x1e
264.074524: event type EV_SYN(0x00).
264.137961: lirc protocol(nec): scancode = 0xa
264.137979: event type EV_MSC(0x04): scancode = 0x0a
264.137979: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
264.137979: event type EV_SYN(0x00).
264.324062: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
264.324062: event type EV_SYN(0x00).
264.325944: lirc protocol(nec): scancode = 0xa repeat
264.325960: event type EV_MSC(0x04): scancode = 0x0a
264.325960: event type EV_SYN(0x00).
264.445972: lirc protocol(nec): scancode = 0xa repeat
264.445988: event type EV_MSC(0x04): scancode = 0x0a
264.445988: event type EV_SYN(0x00).
264.565937: lirc protocol(nec): scancode = 0xa repeat
264.565952: event type EV_MSC(0x04): scancode = 0x0a
[snip]
266.585974: lirc protocol(nec): scancode = 0xa repeat
266.585989: event type EV_MSC(0x04): scancode = 0x0a
266.585989: event type EV_SYN(0x00).
267.270556: lirc protocol(nec): scancode = 0xa repeat
267.270571: event type EV_MSC(0x04): scancode = 0x0a
267.270571: event type EV_SYN(0x00).
267.389958: lirc protocol(nec): scancode = 0xa
267.389976: event type EV_MSC(0x04): scancode = 0x0a
267.389976: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
267.389976: event type EV_SYN(0x00).
267.509941: lirc protocol(nec): scancode = 0xa repeat
267.509957: event type EV_MSC(0x04): scancode = 0x0a
267.509957: event type EV_SYN(0x00).
267.629971: lirc protocol(nec): scancode = 0xa repeat
267.629986: event type EV_MSC(0x04): scancode = 0x0a
267.629986: event type EV_SYN(0x00).
267.749948: lirc protocol(nec): scancode = 0xa repeat
267.749963: event type EV_MSC(0x04): scancode = 0x0a
267.749963: event type EV_SYN(0x00).
267.873963: lirc protocol(nec): scancode = 0xa repeat
267.873978: event type EV_MSC(0x04): scancode = 0x0a
267.873978: event type EV_SYN(0x00).
267.900054: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
267.900054: event type EV_SYN(0x00).
267.937934: lirc protocol(nec): scancode = 0xa repeat
267.900054: event type EV_MSC(0x04): scancode = 0x0a
267.900054: event type EV_SYN(0x00).
268.032044: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
268.032044: event type EV_SYN(0x00).

Why was there a key_up event at 264.324062 even though I continued to 
hold down that button? Maybe shortly before another key_down was finally 
generated, I had let the button go and pressed it again.

All in all, I long-pressed VOL+, VOL-, VOL+, VOL-, and only for the 
second press (VOL-) I failed to get proper repeat events. So, it almost 
works. For comparison, I used the stock kernel module, which never 
generated repeat events for the NEC protocol.

Then, I loaded the hauppauge.toml and tested with RC5. It was fairly OK, 
except for an anomaly: When I pressed Vol- or Vol+ after just having 
long-pressed the other key, I got one more event for the previous key!  
Here is a trace of that:

1471.642128: event type EV_MSC(0x04): scancode = 0x1e10
1471.642128: event type EV_SYN(0x00).
1471.676071: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
1471.676071: event type EV_SYN(0x00).
1471.808059: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
1471.808059: event type EV_SYN(0x00).
1471.808059: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
1471.808059: event type EV_SYN(0x00).
1472.266096: lirc protocol(rc5): scancode = 0x1e10 toggle=1
1472.266113: event type EV_MSC(0x04): scancode = 0x1e10
1472.266113: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
1472.266113: event type EV_SYN(0x00).
1472.386062: lirc protocol(rc5): scancode = 0x1e11
1472.386079: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
1472.386079: event type EV_MSC(0x04): scancode = 0x1e11
1472.386079: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
1472.386079: event type EV_SYN(0x00).
1472.450104: lirc protocol(rc5): scancode = 0x1e11
1472.450118: event type EV_MSC(0x04): scancode = 0x1e11
1472.450118: event type EV_SYN(0x00).
1472.570090: lirc protocol(rc5): scancode = 0x1e11
1472.570105: event type EV_MSC(0x04): scancode = 0x1e11
1472.570105: event type EV_SYN(0x00).
1472.760061: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
1472.760061: event type EV_SYN(0x00).

The events between 1472.266096 and 1472.386079 are fake. I only pressed 
and released Vol+ once. Once I started to press Vol- I got fake key_down 
and key_up for KEY_VOLUMEUP instead of getting the initial message for 
KEY_VOLUMEDOWN.

I tried this also with short presses, pressing Vol- and Vol+ 
alternatively. Almost all of the time, the GNOME volume control widget 
reacted by getting exactly the wrong event (from the previous key 
press).

>From f860a05c35a7b0e7b331e61e1b61674c2a9279f0 Mon Sep 17 00:00:00 2001
>From: Sean Young <sean@mess.org>
>Date: Thu, 13 Jan 2022 16:33:13 +0000
>Subject: [PATCH] media: rtl28xxu: improve IR receiver

In my opinion, this patch is a significant improvement for decoding the 
NEC protocol, as well as for the RC5 protocol, because for that one it 
no longer sends key_up events before each repeated key_down event for a 
held-down button.

But, for the RC5 decoder, there appears to be a serious regression that 
instead of sending the event for the last received message, it will 
repeat an event for the previously pressed button.

Best regards,

	Marko
