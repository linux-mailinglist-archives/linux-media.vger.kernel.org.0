Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97AF54FAE23
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 16:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239599AbiDJOKK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 10:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234650AbiDJOKJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 10:10:09 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB1B2AC60
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 07:07:57 -0700 (PDT)
Received: from jyty (dsl-hkibng31-58c389-173.dhcp.inet.fi [88.195.137.173])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: msmakela)
        by meesny.iki.fi (Postfix) with ESMTPSA id D0DB120154;
        Sun, 10 Apr 2022 17:07:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1649599672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bk0a/vjCPWvYSUgPGtzBKvKHCMcCq8bfv7xUN7yN4fE=;
        b=lmZXf20SDHOcQ0FLO8CDowDef7AfzfUh/6BRByru8a5ABE7tdAw0nC8wklsp/pCFeYjS9u
        t7u/VCfSG7yqMuIBrND23jUSwfHJzIckYCqcB3y1/znVHWcNb2nf4E24PzA2/qYgRahj7M
        RmnsAcFdXb8OCfRmqYzVZziqI71Z+Bc=
Date:   Sun, 10 Apr 2022 17:07:50 +0300
From:   Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YlLktqqcX0i38g14@jyty>
References: <YdbVfObDZZnFIDc3@jyty>
 <YeBZmM0ISnFGcsVa@gofer.mess.org>
 <YeEYxwUkCV7rSa0A@jyty>
 <YfV2TeOgSiVShmZN@jyty>
 <YgKeZ+vAynWvvijz@gofer.mess.org>
 <YgN3cq+utQAFFnEW@jyty>
 <YgeXBRR8YUH8H61t@gofer.mess.org>
 <Ygfhl+dZUfHNJXkU@gofer.mess.org>
 <Ygk8DM3tstwi/m9g@jyty>
 <Yj9fArSg/fFU2MB7@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Yj9fArSg/fFU2MB7@jyty>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1649599672; a=rsa-sha256; cv=none;
        b=gEHy5VMzoajYWKxsKNHJAgLIQ5PB2ZXcVX9tNU24iEMJpTsY/11qFcd/becT2LUugkFgNL
        pReQRTSidfNpdF/vuYs+A2cA0dC0AbW0MnCnACkzq6MjR8nzkTq2unKtD0uo1nX1ee080S
        Qffnk3g3ETjs0Mef0AMFMDbmcRTtU4k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1649599672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Bk0a/vjCPWvYSUgPGtzBKvKHCMcCq8bfv7xUN7yN4fE=;
        b=rHDM87/S0juouNtfM8VDnEu4MOtMCVPKRJ6+wGcA3G2SzLAnDDbZoLs+thOayLByK7729a
        JP1TJoEPBq0OpEPx7ETaUB2nhLon/glmkGYsZJ4DNQJ6iytmLtezG72CReepvSR2ivFx+K
        hOrKdEUeqo2qPT+hByxioPHMDzZz7A4=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sean,

Were you able to repeat the problem of bogus keyup events (and lost 
key-repeat events) when holding down a remote control button for several 
seconds?

I tried to understand your two commits and how the subsystem works. No 
new timer callback is being declared in the patch. Basically, only the 
field dvb_usb_rc::timeout is being split into rawir_timeout and 
keyup_delay.  For all other drivers except rtl28xxu.c they are being set 
to identical values.

I could not figure out what would invoke rtl2832u_rc_query() that is 
actually reading the IR data from the USB driver. As far as I can tell, 
it is feeding the data to the LIRC driver (in a separate thread) via 
ir_raw_event_store_with_filter() and ir_raw_event_handle(). The 
ir_timer_keyup() and ir_timer_repeat() are presumably called from a 
timer handler thread.

Because the LIRC events were seemingly always reported consistently, the 
problem should either be some kind of a glitch between rc-ir-raw.c and 
the decoder, or some glitch in the ir_raw_event data that is being 
supplied to the decoder. I was thinking if the problem could reside here 
in rtl2832u_rc_query():

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index a83b1107fc7f..3d292a351403 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1802,9 +1802,13 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
  	}
  
  	/* pass data to Kernel IR decoder */
-	for (i = 0; i < len; i++) {
+	for (i = 0; i < len; ) {
  		ev.pulse = buf[i] >> 7;
-		ev.duration = 51 * (buf[i] & 0x7f);
+		ev.duration = buf[i] & 0x7f;
+		while (++i < len && ev.pulse == buf[i] >> 7) {
+			ev.duration += buf[i] & 0x7f;
+		}
+		ev.duration *= 51;
  		ir_raw_event_store_with_filter(d->rc_dev, &ev);
  	}

My idea was to avoid sending multiple events for a single transition 
that for some reason was split into multiple bytes in the buffer. But, 
this did not help at all. Holding down the Volume+ or Volume- button 
would still fail to turn the volume all the way up or down in the GNOME 
desktop, without any pauses.
  
This would seem to suggest some glitch between ir_raw_event_thread() and 
the decoder, that is, ir_rc5_decode() or ir_nec_decode(), and the keyup 
timeout.

I have two ideas how to avoid bogus keyup events:

(1) Extend the keyup timeout on every ir_raw_event_handle().
(2) In the keyup callback, reschedule the timer a little later if some 
incompletely decoded raw events remain in the buffers.

I think that (1) is simpler.

	Marko
