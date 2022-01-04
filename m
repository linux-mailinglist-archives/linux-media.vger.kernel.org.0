Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F174845C6
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 17:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbiADQHJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 11:07:09 -0500
Received: from meesny.iki.fi ([195.140.195.201]:52856 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233501AbiADQHJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jan 2022 11:07:09 -0500
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id 8DABF201E7;
        Tue,  4 Jan 2022 18:07:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1641312427;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oXkIdq2+WUjQ+dAqTaZ/B4E4W+wbwETH7YsdhwFxEn4=;
        b=po/p3mQx8m2Hlyp/pYhiJJqBNB3u26AkRDyJzI3k/CNADg6vdiHNZd/oEh2hXLzVCG2She
        Y79QpeNgyeLWYnnNtZS8E5u6K/RPjOeAYpAus84k/IpMSfVTMA5ST8rKKnOgV35wALkDxp
        tbDZ8/i1rhAzUe5dTdy1ep33KgMFi8A=
Date:   Tue, 4 Jan 2022 18:07:06 +0200
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YdRwqt1pwb8osT6V@jyty>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZB3Z7DaWjMqCmbos"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YdLqL2ViSwWzS/Ig@jyty>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1641312427; a=rsa-sha256; cv=none;
        b=vyv8ZHMlegd+0Y2tdLj7sS8UkQZq9YuED4yKDbZAqslF5rhKBU8eAmWDDe5IJU8FvB1a/Z
        iqc16zTI910cCrq6H9O9HD5mkyLBjeq/T9kipq0u+Wmy8k419T6WQNXVVqbtxIi2uden2b
        t2SDlrvAcn5F942dnW+jrQwv+bst8uM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1641312427;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oXkIdq2+WUjQ+dAqTaZ/B4E4W+wbwETH7YsdhwFxEn4=;
        b=MA5qLzVllKw1ZUUSLg7vT70QHIdnhUXCEf/luImIH0gZTbSqp1c3moSumu9mmHQS4I/uVR
        Ur6KBJqgk0NfbjOJkkpLEAAgDG54tWdcKcI/i8DNlDvKUMDUoQPyF0g/KgY1SeoxXCHhPL
        IRXGS4EbX/Dhpl2SItnk3XCLOZTsBKg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ZB3Z7DaWjMqCmbos
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Mon, Jan 03, 2022 at 02:21:05PM +0200, Marko Mäkelä wrote:
>If the correct threshold is 106ms and your suggestion of 100 does not 
>work, I will try a lower value, such as 94 or 95, to get 94+9.741 < 
>106.

With the value 100, I got rather nice output from ir-keytable -t. Here 
is a short press of OK followed by a long press:

Testing events. Please, press CTRL-C to abort.
85.406113: lirc protocol(rc5): scancode = 0x1e25
85.406129: event type EV_MSC(0x04): scancode = 0x1e25
85.406129: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
85.406129: event type EV_SYN(0x00).
85.536094: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
85.536094: event type EV_SYN(0x00).
87.286097: lirc protocol(rc5): scancode = 0x1e25 toggle=1
87.286108: event type EV_MSC(0x04): scancode = 0x1e25
87.286108: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
87.286108: event type EV_SYN(0x00).
87.398095: lirc protocol(rc5): scancode = 0x1e25 toggle=1
87.398103: event type EV_MSC(0x04): scancode = 0x1e25
87.398103: event type EV_SYN(0x00).
87.510073: lirc protocol(rc5): scancode = 0x1e25 toggle=1
87.510081: event type EV_MSC(0x04): scancode = 0x1e25
87.510081: event type EV_SYN(0x00).
87.622079: lirc protocol(rc5): scancode = 0x1e25 toggle=1
87.622088: event type EV_MSC(0x04): scancode = 0x1e25
87.622088: event type EV_SYN(0x00).
87.734090: lirc protocol(rc5): scancode = 0x1e25 toggle=1
87.734099: event type EV_MSC(0x04): scancode = 0x1e25
87.734099: event type EV_SYN(0x00).
87.804051: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
87.804051: event type EV_SYN(0x00).
[snip]
88.854090: lirc protocol(rc5): scancode = 0x1e25 toggle=1
88.854098: event type EV_MSC(0x04): scancode = 0x1e25
88.854098: event type EV_SYN(0x00).
88.860050: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
88.860050: event type EV_SYN(0x00).
88.860050: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
88.860050: event type EV_SYN(0x00).

There was no unexpected key_up during the long press.

I suppose that the key_down events are for the repeated keypresses. This 
was with the default settings for the repeat.

Based on the timestamps, the RC5 messages would seem to arrive at 
112-millisecond intervals.

I also tried smaller values (94, 90, 70), and it got worse. With 94, it 
worked most of the time, but there were occasional glitches (key_up 
events while the RC5 messages kept arriving) like this:

292.842137: lirc protocol(rc5): scancode = 0x1e25
292.776051: event type EV_MSC(0x04): scancode = 0x1e25
292.776051: event type EV_SYN(0x00).
292.908053: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
292.908053: event type EV_SYN(0x00).
292.954082: lirc protocol(rc5): scancode = 0x1e25
292.908053: event type EV_MSC(0x04): scancode = 0x1e25
292.908053: event type EV_SYN(0x00).
293.040051: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
293.040051: event type EV_SYN(0x00).
293.040051: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
293.040051: event type EV_SYN(0x00).
293.162075: lirc protocol(rc5): scancode = 0x1e25
293.162085: event type EV_MSC(0x04): scancode = 0x1e25
293.162085: event type EV_KEY(0x01) key_down: KEY_OK(0x0160)
293.162085: event type EV_SYN(0x00).
293.292069: event type EV_KEY(0x01) key_up: KEY_OK(0x0160)
293.292069: event type EV_SYN(0x00).

With the value 70, every single RC5 message would result in both 
key_down and key_up events:

497.970089: lirc protocol(rc5): scancode = 0x1e0d
497.970104: event type EV_MSC(0x04): scancode = 0x1e0d
497.970104: event type EV_KEY(0x01) key_down: KEY_MENU(0x008b)
497.970104: event type EV_SYN(0x00).
498.100064: event type EV_KEY(0x01) key_up: KEY_MENU(0x008b)
498.100064: event type EV_SYN(0x00).
498.138082: lirc protocol(rc5): scancode = 0x1e0d
498.138096: event type EV_MSC(0x04): scancode = 0x1e0d
498.138096: event type EV_KEY(0x01) key_down: KEY_MENU(0x008b)
498.138096: event type EV_SYN(0x00).
498.268059: event type EV_KEY(0x01) key_up: KEY_MENU(0x008b)
498.268059: event type EV_SYN(0x00).

I got rather good volume+/volume- response in GNOME desktop when I used 
the value 100 (as in the attached patch) and set the following:
ir-keytable --period=111 --delay=111

I tested once more without the patch (using the value 200), both with 
the defaults (--period=125 --delay=500) and the 111ms values, and the 
experience was bad (about half the speed, and frequent intermittent 
pauses).

However, the patch breaks the NEC protocol. With the bundled remote 
control unit of the adapter, I initially get some key_down and key_up, 
but then I only get 'repeat' events if I hit the same (or even 
different) button again. Here is a sample with almost 8 seconds of pause 
in between:

2035.461973: lirc protocol(nec): scancode = 0x1e repeat
2035.461981: event type EV_MSC(0x04): scancode = 0x1e
2035.461981: event type EV_SYN(0x00).
2035.573955: lirc protocol(nec): scancode = 0x1e repeat
2035.573963: event type EV_MSC(0x04): scancode = 0x1e
2035.573963: event type EV_SYN(0x00).
2043.425920: lirc protocol(nec): scancode = 0x1e repeat
2043.425932: event type EV_MSC(0x04): scancode = 0x1e
2043.425932: event type EV_SYN(0x00).

I tested once more the stock driver (value=200) with the NEC protocol.  
The GNOME volume control would only react to the initial press of the 
button, not on the repeats. Also in ir-keytable -t, I only see one 
key_down/key_up followed by LIRC-only messages:

2776.698529: lirc protocol(nec): scancode = 0x1e
2776.698539: event type EV_MSC(0x04): scancode = 0x1e
2776.698539: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
2776.698539: event type EV_SYN(0x00).
2776.824077: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
2776.824077: event type EV_SYN(0x00).
2776.909965: lirc protocol(nec): scancode = 0x1e repeat
2776.909973: event type EV_MSC(0x04): scancode = 0x1e
2776.909973: event type EV_SYN(0x00).
2777.121976: lirc protocol(nec): scancode = 0x1e repeat
2777.121983: event type EV_MSC(0x04): scancode = 0x1e
2777.121983: event type EV_SYN(0x00).

I am happy to test any patches, now that I have a compiled kernel where 
I can easily rmmod and insmod the module.

	Marko

--ZB3Z7DaWjMqCmbos
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="rtl28xxu-rc5.patch"

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 795a012d4020..9504d6f94a58 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1807,7 +1807,7 @@ static int rtl2832u_get_rc_config(struct dvb_usb_device *d,
 	rc->allowed_protos = RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->driver_type = RC_DRIVER_IR_RAW;
 	rc->query = rtl2832u_rc_query;
-	rc->interval = 200;
+	rc->interval = 100;
 	/* we program idle len to 0xc0, set timeout to one less */
 	rc->timeout = 0xbf * 51;
 

--ZB3Z7DaWjMqCmbos--
