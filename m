Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF9548DC44
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 17:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236925AbiAMQzy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 11:55:54 -0500
Received: from gofer.mess.org ([88.97.38.141]:55269 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231269AbiAMQzx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 11:55:53 -0500
X-Greylist: delayed 22075 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jan 2022 11:55:53 EST
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6E480101C2F; Thu, 13 Jan 2022 16:55:52 +0000 (UTC)
Date:   Thu, 13 Jan 2022 16:55:52 +0000
From:   Sean Young <sean@mess.org>
To:     Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
Cc:     linux-media@vger.kernel.org
Subject: Re: Inconsistent RC5 ir-keytable events
Message-ID: <YeBZmM0ISnFGcsVa@gofer.mess.org>
References: <YdKdPosyzj2urFpS@jyty>
 <20220103092123.GA21115@gofer.mess.org>
 <YdLRa86ddm2T4xew@jyty>
 <20220103110743.GA22001@gofer.mess.org>
 <YdLqL2ViSwWzS/Ig@jyty>
 <YdRwqt1pwb8osT6V@jyty>
 <20220105095355.GA6428@gofer.mess.org>
 <YdbVfObDZZnFIDc3@jyty>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YdbVfObDZZnFIDc3@jyty>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 06, 2022 at 01:41:48PM +0200, Marko Mäkelä wrote:
> Wed, Jan 05, 2022 at 09:53:55AM +0000, Sean Young wrote:
> > On Tue, Jan 04, 2022 at 06:07:06PM +0200, Marko Mäkelä wrote:
> > > I tested once more the stock driver (value=200) with the NEC
> > > protocol.  The GNOME volume control would only react to the initial
> > > press of the button, not on the repeats. Also in ir-keytable -t, I
> > > only see one key_down/key_up followed by LIRC-only messages:
> > > 
> > > 2776.698529: lirc protocol(nec): scancode = 0x1e
> > > 2776.698539: event type EV_MSC(0x04): scancode = 0x1e
> > > 2776.698539: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
> > > 2776.698539: event type EV_SYN(0x00).
> > > 2776.824077: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
> > > 2776.824077: event type EV_SYN(0x00).
> > > 2776.909965: lirc protocol(nec): scancode = 0x1e repeat
> > > 2776.909973: event type EV_MSC(0x04): scancode = 0x1e
> > > 2776.909973: event type EV_SYN(0x00).
> > > 2777.121976: lirc protocol(nec): scancode = 0x1e repeat
> > > 2777.121983: event type EV_MSC(0x04): scancode = 0x1e
> > > 2777.121983: event type EV_SYN(0x00).
> > 
> > Here the is such a delay between the the first message and the repeat,
> > that rc-core does not honour the repeat any more.
> 
> I repeated the experiment with a stock Debian 5.15.0-2-amd64 kernel (based
> on 5.15.5). First, I checked the RCU with a digital camera.  Because the
> blinking of the IR LED appeared a little erratic, I replaced the CR2025 cell
> (voltage=3.25V) with a better one (voltage=3.3V). It got brighter and better
> in the digital viewfinder, but there was no improvement for ir-keytable -t:
> 
> Testing events. Please, press CTRL-C to abort.
> 25559.898935: lirc protocol(nec): scancode = 0x1e
> 25559.898948: event type EV_MSC(0x04): scancode = 0x1e
> 25559.898948: event type EV_KEY(0x01) key_down: KEY_VOLUMEUP(0x0073)
> 25559.898948: event type EV_SYN(0x00).
> 25560.024055: event type EV_KEY(0x01) key_up: KEY_VOLUMEUP(0x0073)
> 25560.024055: event type EV_SYN(0x00).
> 25560.110134: lirc protocol(nec): scancode = 0x1e repeat
> 25560.110141: event type EV_MSC(0x04): scancode = 0x1e
> 25560.110141: event type EV_SYN(0x00).
> 25560.322180: lirc protocol(nec): scancode = 0x1e repeat
> 25560.322188: event type EV_MSC(0x04): scancode = 0x1e
> 25560.322188: event type EV_SYN(0x00).
> 25560.534173: lirc protocol(nec): scancode = 0x1e repeat
> 25560.534180: event type EV_MSC(0x04): scancode = 0x1e
> 25560.534180: event type EV_SYN(0x00).
> 25560.746156: lirc protocol(nec): scancode = 0x1e repeat
> 25560.746163: event type EV_MSC(0x04): scancode = 0x1e
> 25560.746163: event type EV_SYN(0x00).
> 25560.958173: lirc protocol(nec): scancode = 0x1e repeat
> 25560.958181: event type EV_MSC(0x04): scancode = 0x1e
> 25560.958181: event type EV_SYN(0x00).
> 25997.954229: lirc protocol(nec): scancode = 0x1e repeat
> 25997.954241: event type EV_MSC(0x04): scancode = 0x1e
> 25997.954241: event type EV_SYN(0x00).
> 25998.166182: lirc protocol(nec): scancode = 0x1e repeat
> 25998.166189: event type EV_MSC(0x04): scancode = 0x1e
> 25998.166189: event type EV_SYN(0x00).

So I had to dig around for a while, but I have the same device here. After
some experimenting I've written a patch. Please could test it out for me,
a `Tested-by:` would be appreciated (if it works of course!).

Thanks

Sean
---
From f860a05c35a7b0e7b331e61e1b61674c2a9279f0 Mon Sep 17 00:00:00 2001
From: Sean Young <sean@mess.org>
Date: Thu, 13 Jan 2022 16:33:13 +0000
Subject: [PATCH] media: rtl28xxu: improve IR receiver

This device presents an IR buffer, which can be read and cleared.
Clearing the buffer is racey with receiving IR, so wait until the IR
message is finished before clearing it.

This should minimize the chance of the buffer clear happening while
IR is being received, although we cannot avoid this completely.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 26 ++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 795a012d4020..f6fc362573d0 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1720,6 +1720,7 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 		{IR_RX_BUF_CTRL,         0x80, 0xff},
 		{IR_RX_CTRL,             0x80, 0xff},
 	};
+	u32 idle_length;
 
 	/* init remote controller */
 	if (!dev->rc_active) {
@@ -1770,6 +1771,22 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 	if (ret)
 		goto err;
 
+	dev_dbg(&d->intf->dev, "IR_RX_BUF=%*ph\n", len, buf);
+
+	/* if the receiver is not idle yet, do not process */
+	idle_length = 0;
+	if (len > 2) {
+		if (!(buf[len - 1] & 0x80))
+			idle_length += buf[len - 1] & 0x7f;
+		if (!(buf[len - 2] & 0x80))
+			idle_length += buf[len - 2] & 0x7f;
+	}
+
+	dev_dbg(&d->intf->dev, "idle_length=%x\n", idle_length);
+
+	if (idle_length < 0xbf)
+		return 0;
+
 	/* let hw receive new code */
 	for (i = 0; i < ARRAY_SIZE(refresh_tab); i++) {
 		ret = rtl28xxu_wr_reg_mask(d, refresh_tab[i].reg,
@@ -1807,9 +1824,12 @@ static int rtl2832u_get_rc_config(struct dvb_usb_device *d,
 	rc->allowed_protos = RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->driver_type = RC_DRIVER_IR_RAW;
 	rc->query = rtl2832u_rc_query;
-	rc->interval = 200;
-	/* we program idle len to 0xc0, set timeout to one less */
-	rc->timeout = 0xbf * 51;
+	rc->interval = 50;
+	/*
+	 * The idle len is set to 0xc0, set timeout to one less plus
+	 * the query interval with some extra margin for error
+	 */
+	rc->timeout = 0xbf * 51 + MS_TO_US(60);
 
 	return 0;
 }
-- 
2.34.1

