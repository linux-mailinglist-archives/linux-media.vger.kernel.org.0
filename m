Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7ED2DEDFD
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 10:28:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgLSJ1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 04:27:45 -0500
Received: from gofer.mess.org ([88.97.38.141]:49153 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726444AbgLSJ1p (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 04:27:45 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C97F511A001; Sat, 19 Dec 2020 09:27:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1608370023; bh=cWBlzQPBpPTJutL8OakF61nBwVhB75cZ4XrVN/ie9jo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nXr391bX3uCNGQADLiR8Ew5EG+6mhDzNx1XGIk666873Tyh6WBkqJo1HecgYs+wBy
         tUXOcwtGYA+8flVl8jy17RCoNvSEM1siTw73XjPwJyiE2PdxptLGdoi49y2X5YJenr
         2nYfjT0glbyRHFBzFcaLOqY7d1qhOmU9dg68Xqng7R4AXjfIMqMJNpPET2rFYjHVBc
         XDO4CiIvp54fgoeY9TmmD1MwLchwgM3M0R/kb19DWiFtO2AuGcP54HLjfnFbl9Lu/4
         8U9C54MV741q0gEwLf7Gzg4LtVBiL25ZGZYqAcYDBB3hgFimh/3F7aH5AN+3Wv+fNN
         7J+8NSfreHdYQ==
Date:   Sat, 19 Dec 2020 09:27:03 +0000
From:   Sean Young <sean@mess.org>
To:     Jesus <observer1@hotmail.es>
Cc:     linux-media@vger.kernel.org
Subject: Re: Help with harmony remote
Message-ID: <20201219092703.GA14414@gofer.mess.org>
References: <VI1P193MB0160CDD11C1487D57A4B795081C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
 <20201218100710.GA29317@gofer.mess.org>
 <VI1P193MB016010B2B176FE481020913881C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1P193MB016010B2B176FE481020913881C30@VI1P193MB0160.EURP193.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Sat, Dec 19, 2020 at 01:56:50AM +0000, Jesus wrote:
> It's a Universal Harmony 350
> 
> This one:
> https://support.myharmony.com/en-us/350
> https://assets.logitech.com/assets/54199/gallery-1.png
> 
> It's programable, the remote selected for the mouse is named Media Center PC SE i believe is the mce, and for the other functions of the pc part I use a remote named Intel Media Player I believe is mce too but diferent set of keys selectable
> I've managed to make work every button I use in the intel media player remote, for the Media Center PC SE, I only use the mouse part thats what I have tested, the mouse movement works, the left and right click are the ones not working

That's interesting, I did not know there was any other device that generates
this IR.

> Some recording of the ir using "ir-ctl -r" would be useful too.
> 
> this is the output for the left click:
> 
> +2800 -200 +300 -300 +300 -250 +300 -300 +600 -600 +300 -400 +200 -350 +300 -200 +350 -300 +300 -300 +600 -300 +300 -600 +300 -250 +400 -200 +400 -200 +400 -250 +350 -300 +300 -400 +200 -300 +300 -300 +300 -300 +300 -300 +300 -300 +300 -300 +350 -250 +350 -300 +600 -250 +350 -350 +250 -300 +300 -600 +350 -250 +350 -75800 +2800 -200 +350 -200 +400 -250 +350 -300 +650 -600 +300 -300 +300 -300 +300 -250 +300 -300 +300 -300 +600 -250 +400 -600 +350 -200 +350 -250 +350 -250 +350 -250 +350 -250 +400 -200 +350 -250 +350 -250 +350 -250 +350 -300 +300 -300 +300 -250 +350 -300 +300 -300 +600 -250 +350 -200 +400 -250 +350 -600 +300 -250 +400 -75800 +2800 -200 +350 -200 +400 -250 +300 -250 +700 -550 +350 -200 +350 -250 +350 -250 +350 -250 +300 -350 +550 -250 +400 -600 +300 -300 +250 -300 +300 -300 +300 -350 +300 -250 +400 -250 +350 -250 +350 -400 +200 -350 +300 -300 +300 -300 +300 -250 +350 -200 +400 -250 +650 -200 +400 -250 +350 -250 +350 -600 +300 -300 +300 # timeout 101600

Actually, that is the right IR for a left mouse button.

> > 688888.335099: lirc protocol(mcir2-mse): scancode = 0x3c
> > 688888.335117: event type EV_MSC(0x04): scancode = 0x3c
> > 688888.335117: event type EV_SYN(0x00).
> > 688888.475123: lirc protocol(mcir2-mse): scancode = 0x3c
> > 688888.475142: event type EV_MSC(0x04): scancode = 0x3c
> > 688888.475142: event type EV_SYN(0x00).

This is also the right scancode.

I think something else is going on. Please can you do the following:

echo 'file ir-mce_kbd-decoder.c +p' > /sys/kernel/debug/dynamic_debug/control 

Now press the left mouse button and see what there is in dmesg.

I hope it says something like:

	rc rc0: mouse: x = 0, y = 0, btns = L

Please can you test the following patch.

Thanks,

Sean
---
From 05a8b10b9b8a6f0e9ccf42010a633e674c672f15 Mon Sep 17 00:00:00 2001
From: Sean Young <sean@mess.org>
Date: Sat, 19 Dec 2020 09:19:45 +0000
Subject: [PATCH] media: mce-kbd: ensure that keycodes set in keybit

The input layer wants to know what keys a device can generate, and will
ignore any keycodes not in this list. Ensure the keybit is set on
registration.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir-mce_kbd-decoder.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index be8f2756a444..c72704aa23a8 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -361,10 +361,19 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct ir_raw_event ev)
 static int ir_mce_kbd_register(struct rc_dev *dev)
 {
 	struct mce_kbd_dec *mce_kbd = &dev->raw->mce_kbd;
+	int i;
 
 	timer_setup(&mce_kbd->rx_timeout, mce_kbd_rx_timeout, 0);
 	spin_lock_init(&mce_kbd->keylock);
 
+	for (i = 0; i < ARRAY_SIZE(kbd_keycodes); i++) {
+		if (kbd_keycodes[i] != KEY_RESERVED)
+			__set_bit(kbd_keycodes[i], dev->input_dev->keybit);
+	}
+
+	__set_bit(BTN_LEFT, dev->input_dev->keybit);
+	__set_bit(BTN_RIGHT, dev->input_dev->keybit);
+
 	return 0;
 }
 
-- 
2.29.2

