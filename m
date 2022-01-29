Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BAB4A30FC
	for <lists+linux-media@lfdr.de>; Sat, 29 Jan 2022 18:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244058AbiA2RQD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jan 2022 12:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241147AbiA2RQD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jan 2022 12:16:03 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB68BC061714
        for <linux-media@vger.kernel.org>; Sat, 29 Jan 2022 09:16:02 -0800 (PST)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B9F6C1B000F7;
        Sat, 29 Jan 2022 19:15:58 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1643476558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9/kzovVliN9Rl4D6EI3voRw6vPtDTQpOfN33SmGBFJE=;
        b=AkyifYoidlQ6/V2DyuIEamXX5TKV02W8eigv404g8ty4GYXlYISQqlMYFbSeZHwbO+Q5OA
        3jrcsWZG/cIBVhdJF1jjr4GhggaIsq6QbumBGAlP6j0/TwRvwdtenLiVWT25tGtxqx1W1G
        C6ok8AG/ooA6trwUNfxU9mCSESni6u/UVtkHuKGE45nC5WDISU+eKEAN7+wZIE8ZNBH9yI
        V/vItelun0Ra1RXA+ACNENq2hchfEnRUZuDN1sP7/2T1uP7i2sup/wZrD0TTHFcZrwzh33
        QX5oAfM7o8zPXdLpX58AX7J7ef9GpZOdOzPh5LSNAFyVD67uXePWXZ+TcbLfhw==
Date:   Sat, 29 Jan 2022 19:15:57 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YfV2TeOgSiVShmZN@jyty>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
 <YdRwqt1pwb8osT6V@jyty>
 <20220105095355.GA6428@gofer.mess.org>
 <YdbVfObDZZnFIDc3@jyty>
 <YeBZmM0ISnFGcsVa@gofer.mess.org>
 <YeEYxwUkCV7rSa0A@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YeEYxwUkCV7rSa0A@jyty>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1643476558; a=rsa-sha256;
        cv=none;
        b=OgvIDHOSTz+PKydoq/ci6aZr2es+hkFcD7g2f24/tJE69M9DQWzK4fNgYGYctq1tUtBoZP
        P7eogqXvx0Qq102UXDQxlYCMR9gg6XPAVcpPgYSxlMEYuHNZ+dCdWo4A1waaKHModzZDpk
        p7MDfl6AhqTm1k0PWamIx2+dkLplT8WMr/UbFGX6miIjEBO0nb0ItsqOai/WYC4QbpUzI3
        wB42FIKLeGKF9DhIrGcfn4AkhCH2fXiIegADdfl0nZyYln85WznNlMAKnKxJZ5v78JBkR/
        KE8VB/2swaPGtU3dX//WglsO96f+NXlm2iRPIE9yX5z3Wc0jP69/fRiFmxknDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1643476558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9/kzovVliN9Rl4D6EI3voRw6vPtDTQpOfN33SmGBFJE=;
        b=A1pO0+LVOy24JH+WGQP7rdlz5Bi3ywE7IkWFiq1w6qOJWRYRDRpE5sNk9prYuS6WWtzN0o
        o66Dpi8XJPt5dKV/FizvB1DHzO4P3eSH/iEg1ww7UMz69ihEIA0qOyWgmvOXj0+ElKBmIu
        MuUePcazH1HBWq5rkJ8mUtZbuxD5/xJ07GPSApg59F4C6ZRhdFPEKPrIpRq3tR9fsLIVz3
        LdV6eaMdGkJo0iwb7vzQWAK4e2HTfkpz7Nqdpdm4Atx7vKpWRcpw1I5/+XS7ogrwpzcHU9
        mcDEnZ35AqzMzevIUu1XUfNtcUFeni6ZEYek12i0yxMGTIoA8mI3QsDep7RJTA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Did you have a chance to repeat my findings with a remote control unit 
that uses the RC5 protocol?

I tried to understand the code changes. A few observations:

In rtl2831u_get_rc_config(), rc->interval is set to 400 and rc->timeout 
is not set at all. Maybe it is OK, similar chips supported by the same 
driver.

In rtl2832u_rc_query(), the idle_length is being computed from the last 
two bytes of the IR_RX_BUF buffer. The threshold is 0xc0 and thus
it can only be exceeded if both last 7-bit bytes are included in the 
sum. Side note: the & 0x7f is redundant, because the most significant 
bit was already tested to be clear:

	idle_length = 0;
	if (len > 2) {
		if (!(buf[len - 1] & 0x80))
			idle_length += buf[len - 1] & 0x7f;
		if (!(buf[len - 2] & 0x80))
			idle_length += buf[len - 2] & 0x7f;
	}

	dev_dbg(&d->intf->dev, "idle_length=%x\n", idle_length);

	if (idle_length < 0xbf)
		return 0;

However, I spotted a potential problem here. I may of course be mistaken 
because I do not know how the IR_RX_BUF is supposed to work. Could it 
happen that buf[] contains some IR events, then 2 or more consecutive 
bytes of no pulses (with the total time exceeding 0xbf*51µs), and then 
again some IR events until the very end of the buffer, so that in the 
above check, we would return 0? Could we in that case discard some IR 
events? Could that explain the glitch that I observed with the NEC 
protocol?

Best regards,

	Marko

Fri, Jan 14, 2022 at 08:31:37AM +0200, Marko Mäkelä wrote:
>Thu, Jan 13, 2022 at 04:55:52PM +0000, Sean Young wrote:
>>So I had to dig around for a while, but I have the same device here.  
>>After some experimenting I've written a patch. Please could test it 
>>out for me, a `Tested-by:` would be appreciated (if it works of 
>>course!).
>
>It is significantly better for the bundled remote control unit (using 
>the NEC protocol). But it can still lose events. I tested by holding 
>down the VOL+ and VOL- keys. Also the GNOME Desktop was listening to 
>those events, so I got some additional visual feedback.
>
>Here is a trace from ir-keytable -t, using the NEC protocol:
>
>Testing events. Please, press CTRL-C to abort.
>261.125938: lirc protocol(nec): scancode = 0x1e
>261.125959: event type EV_MSC(0x04): scancode = 0x1e
>261.125959: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>261.125959: event type EV_SYN(0x00).
>261.189926: lirc protocol(nec): scancode = 0x1e repeat
>261.189939: event type EV_MSC(0x04): scancode = 0x1e
>261.189939: event type EV_SYN(0x00).
>261.309891: lirc protocol(nec): scancode = 0x1e repeat
>261.309905: event type EV_MSC(0x04): scancode = 0x1e
>261.309905: event type EV_SYN(0x00).
>261.429960: lirc protocol(nec): scancode = 0x1e repeat
>261.429973: event type EV_MSC(0x04): scancode = 0x1e
>261.429973: event type EV_SYN(0x00).
>261.553908: lirc protocol(nec): scancode = 0x1e repeat
>261.553923: event type EV_MSC(0x04): scancode = 0x1e
>261.553923: event type EV_SYN(0x00).
>261.617911: lirc protocol(nec): scancode = 0x1e repeat
>261.617924: event type EV_MSC(0x04): scancode = 0x1e
>261.617924: event type EV_SYN(0x00).
>261.628041: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>261.628041: event type EV_SYN(0x00).
>261.737970: lirc protocol(nec): scancode = 0x1e repeat
>261.628041: event type EV_MSC(0x04): scancode = 0x1e
>261.628041: event type EV_SYN(0x00).
>261.760048: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>261.760048: event type EV_SYN(0x00).
>261.857958: lirc protocol(nec): scancode = 0x1e repeat
>261.760048: event type EV_MSC(0x04): scancode = 0x1e
>261.760048: event type EV_SYN(0x00).
>261.892056: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>261.892056: event type EV_SYN(0x00).
>
>So far, so good. The initial delay between the key_down events is 
>500ms.  But, keep reading:
>
>262.024055: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>262.024055: event type EV_SYN(0x00).
>262.045960: lirc protocol(nec): scancode = 0x1e repeat
>262.024055: event type EV_MSC(0x04): scancode = 0x1e
>262.024055: event type EV_SYN(0x00).
>262.156052: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>262.156052: event type EV_SYN(0x00).
>262.156052: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
>262.156052: event type EV_SYN(0x00).
>264.074505: lirc protocol(nec): scancode = 0x1e repeat
>264.074524: event type EV_MSC(0x04): scancode = 0x1e
>264.074524: event type EV_SYN(0x00).
>264.137961: lirc protocol(nec): scancode = 0xa
>264.137979: event type EV_MSC(0x04): scancode = 0x0a
>264.137979: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
>264.137979: event type EV_SYN(0x00).
>264.324062: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
>264.324062: event type EV_SYN(0x00).
>264.325944: lirc protocol(nec): scancode = 0xa repeat
>264.325960: event type EV_MSC(0x04): scancode = 0x0a
>264.325960: event type EV_SYN(0x00).
>264.445972: lirc protocol(nec): scancode = 0xa repeat
>264.445988: event type EV_MSC(0x04): scancode = 0x0a
>264.445988: event type EV_SYN(0x00).
>264.565937: lirc protocol(nec): scancode = 0xa repeat
>264.565952: event type EV_MSC(0x04): scancode = 0x0a
>[snip]
>266.585974: lirc protocol(nec): scancode = 0xa repeat
>266.585989: event type EV_MSC(0x04): scancode = 0x0a
>266.585989: event type EV_SYN(0x00).
>267.270556: lirc protocol(nec): scancode = 0xa repeat
>267.270571: event type EV_MSC(0x04): scancode = 0x0a
>267.270571: event type EV_SYN(0x00).
>267.389958: lirc protocol(nec): scancode = 0xa
>267.389976: event type EV_MSC(0x04): scancode = 0x0a
>267.389976: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
>267.389976: event type EV_SYN(0x00).
>267.509941: lirc protocol(nec): scancode = 0xa repeat
>267.509957: event type EV_MSC(0x04): scancode = 0x0a
>267.509957: event type EV_SYN(0x00).
>267.629971: lirc protocol(nec): scancode = 0xa repeat
>267.629986: event type EV_MSC(0x04): scancode = 0x0a
>267.629986: event type EV_SYN(0x00).
>267.749948: lirc protocol(nec): scancode = 0xa repeat
>267.749963: event type EV_MSC(0x04): scancode = 0x0a
>267.749963: event type EV_SYN(0x00).
>267.873963: lirc protocol(nec): scancode = 0xa repeat
>267.873978: event type EV_MSC(0x04): scancode = 0x0a
>267.873978: event type EV_SYN(0x00).
>267.900054: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
>267.900054: event type EV_SYN(0x00).
>267.937934: lirc protocol(nec): scancode = 0xa repeat
>267.900054: event type EV_MSC(0x04): scancode = 0x0a
>267.900054: event type EV_SYN(0x00).
>268.032044: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
>268.032044: event type EV_SYN(0x00).
>
>Why was there a key_up event at 264.324062 even though I continued to 
>hold down that button? Maybe shortly before another key_down was 
>finally generated, I had let the button go and pressed it again.
>
>All in all, I long-pressed VOL+, VOL-, VOL+, VOL-, and only for the 
>second press (VOL-) I failed to get proper repeat events. So, it 
>almost works. For comparison, I used the stock kernel module, which 
>never generated repeat events for the NEC protocol.
>
>Then, I loaded the hauppauge.toml and tested with RC5. It was fairly 
>OK, except for an anomaly: When I pressed Vol- or Vol+ after just 
>having long-pressed the other key, I got one more event for the 
>previous key!  Here is a trace of that:
>
>1471.642128: event type EV_MSC(0x04): scancode = 0x1e10
>1471.642128: event type EV_SYN(0x00).
>1471.676071: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>1471.676071: event type EV_SYN(0x00).
>1471.808059: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>1471.808059: event type EV_SYN(0x00).
>1471.808059: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
>1471.808059: event type EV_SYN(0x00).
>1472.266096: lirc protocol(rc5): scancode = 0x1e10 toggle=1
>1472.266113: event type EV_MSC(0x04): scancode = 0x1e10
>1472.266113: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
>1472.266113: event type EV_SYN(0x00).
>1472.386062: lirc protocol(rc5): scancode = 0x1e11
>1472.386079: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
>1472.386079: event type EV_MSC(0x04): scancode = 0x1e11
>1472.386079: event type EV_KEY(0x01) key_down: KEY_VOLUMEDOWN(0x0072)
>1472.386079: event type EV_SYN(0x00).
>1472.450104: lirc protocol(rc5): scancode = 0x1e11
>1472.450118: event type EV_MSC(0x04): scancode = 0x1e11
>1472.450118: event type EV_SYN(0x00).
>1472.570090: lirc protocol(rc5): scancode = 0x1e11
>1472.570105: event type EV_MSC(0x04): scancode = 0x1e11
>1472.570105: event type EV_SYN(0x00).
>1472.760061: event type EV_KEY(0x01) key_up: KEY_VOLUMEDOWN(0x0072)
>1472.760061: event type EV_SYN(0x00).
>
>The events between 1472.266096 and 1472.386079 are fake. I only 
>pressed and released Vol+ once. Once I started to press Vol- I got 
>fake key_down and key_up for KEY_VOLUMEUP instead of getting the 
>initial message for KEY_VOLUMEDOWN.
>
>I tried this also with short presses, pressing Vol- and Vol+ 
>alternatively. Almost all of the time, the GNOME volume control widget 
>reacted by getting exactly the wrong event (from the previous key 
>press).
>
>>From f860a05c35a7b0e7b331e61e1b61674c2a9279f0 Mon Sep 17 00:00:00 2001
>>From: Sean Young <sean@mess.org>
>>Date: Thu, 13 Jan 2022 16:33:13 +0000
>>Subject: [PATCH] media: rtl28xxu: improve IR receiver
>
>In my opinion, this patch is a significant improvement for decoding 
>the NEC protocol, as well as for the RC5 protocol, because for that 
>one it no longer sends key_up events before each repeated key_down 
>event for a held-down button.
>
>But, for the RC5 decoder, there appears to be a serious regression 
>that instead of sending the event for the last received message, it 
>will repeat an event for the previously pressed button.
>
>Best regards,
>
>	Marko
