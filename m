Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D782EA7BC
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 10:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbhAEJhI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 04:37:08 -0500
Received: from mail.horus.com ([78.46.148.228]:43089 "EHLO mail.horus.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbhAEJhI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 Jan 2021 04:37:08 -0500
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Tue, 05 Jan 2021 04:37:07 EST
Received: from [192.168.1.20] (62-116-63-217.adsl.highway.telekom.at [62.116.63.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "E-Mail Matthias Reichl", Issuer "HiassofT CA 2014" (not verified))
        by mail.horus.com (Postfix) with ESMTPSA id 721C16409C;
        Tue,  5 Jan 2021 10:30:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
        s=20180324; t=1609839031;
        bh=3uAvaYTnJj70a1j5/nbACq1hfSa4h3BkSIn2baVHKCQ=;
        h=From:To:Cc:Subject:Date:From;
        b=BhQ/TMsiDA8acfiLQl9uyymIShy00rP9MAfjgqo1qOsudIx8y0YD2I95WAPQz3Ait
         mec3N5BxGsH8BoeiV1mAEIb2LTuQWOPkFMnsOSNxgno6B847X+aB518VlK+SKXUXJr
         zxfj471wavgSJYd+DrROpqmos0hn2iMn09jGDsn0=
Received: by camel2.lan (Postfix, from userid 1000)
        id D4B941C7374; Tue,  5 Jan 2021 10:30:30 +0100 (CET)
From:   Matthias Reichl <hias@horus.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: fix timeout handling after switch to microsecond durations
Date:   Tue,  5 Jan 2021 10:30:23 +0100
Message-Id: <20210105093023.5212-1-hias@horus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 528222d853f92 ("media: rc: harmonize infrared durations to
microseconds") missed to switch some timeout calculations from
nanoseconds to microseconds. This resulted in spurious key_up+key_down
events at the last scancode if the rc device uses a long timeout
(eg 100ms on nuvoton-cir) as the device timeout wasn't properly
accounted for in the keyup timeout calculation.

Fix this by applying the proper conversion functions.

Fixes: 528222d853f92 ("media: rc: harmonize infrared durations to microseconds")
Signed-off-by: Matthias Reichl <hias@horus.com>
---
 drivers/media/rc/ir-mce_kbd-decoder.c | 2 +-
 drivers/media/rc/rc-main.c            | 4 ++--
 drivers/media/rc/serial_ir.c          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/ir-mce_kbd-decoder.c b/drivers/media/rc/ir-mce_kbd-decoder.c
index be8f2756a444..1524dc0fc566 100644
--- a/drivers/media/rc/ir-mce_kbd-decoder.c
+++ b/drivers/media/rc/ir-mce_kbd-decoder.c
@@ -320,7 +320,7 @@ static int ir_mce_kbd_decode(struct rc_dev *dev, struct ir_raw_event ev)
 				data->body);
 			spin_lock(&data->keylock);
 			if (scancode) {
-				delay = nsecs_to_jiffies(dev->timeout) +
+				delay = usecs_to_jiffies(dev->timeout) +
 					msecs_to_jiffies(100);
 				mod_timer(&data->rx_timeout, jiffies + delay);
 			} else {
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 29d4d01896ff..1fd62c1dac76 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -737,7 +737,7 @@ static unsigned int repeat_period(int protocol)
 void rc_repeat(struct rc_dev *dev)
 {
 	unsigned long flags;
-	unsigned int timeout = nsecs_to_jiffies(dev->timeout) +
+	unsigned int timeout = usecs_to_jiffies(dev->timeout) +
 		msecs_to_jiffies(repeat_period(dev->last_protocol));
 	struct lirc_scancode sc = {
 		.scancode = dev->last_scancode, .rc_proto = dev->last_protocol,
@@ -855,7 +855,7 @@ void rc_keydown(struct rc_dev *dev, enum rc_proto protocol, u64 scancode,
 	ir_do_keydown(dev, protocol, scancode, keycode, toggle);
 
 	if (dev->keypressed) {
-		dev->keyup_jiffies = jiffies + nsecs_to_jiffies(dev->timeout) +
+		dev->keyup_jiffies = jiffies + usecs_to_jiffies(dev->timeout) +
 			msecs_to_jiffies(repeat_period(protocol));
 		mod_timer(&dev->timer_keyup, dev->keyup_jiffies);
 	}
diff --git a/drivers/media/rc/serial_ir.c b/drivers/media/rc/serial_ir.c
index 8cc28c92d05d..96ae0294ac10 100644
--- a/drivers/media/rc/serial_ir.c
+++ b/drivers/media/rc/serial_ir.c
@@ -385,7 +385,7 @@ static irqreturn_t serial_ir_irq_handler(int i, void *blah)
 	} while (!(sinp(UART_IIR) & UART_IIR_NO_INT)); /* still pending ? */
 
 	mod_timer(&serial_ir.timeout_timer,
-		  jiffies + nsecs_to_jiffies(serial_ir.rcdev->timeout));
+		  jiffies + usecs_to_jiffies(serial_ir.rcdev->timeout));
 
 	ir_raw_event_handle(serial_ir.rcdev);
 
-- 
2.20.1

