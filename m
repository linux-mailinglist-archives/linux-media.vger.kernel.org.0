Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8168B49522E
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 17:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376954AbiATQQR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 11:16:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376946AbiATQQR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 11:16:17 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03C4C061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 08:16:16 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 19F96101C5F; Thu, 20 Jan 2022 16:16:14 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: lirc: report ir receiver overflow
Date:   Thu, 20 Jan 2022 16:16:14 +0000
Message-Id: <20220120161614.328202-2-sean@mess.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120161614.328202-1-sean@mess.org>
References: <20220120161614.328202-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the driver reports that the hardware had an overflow, report this to
userspace. It would be nice to know when this happens, and not just get
a long space.

This change has been tested with lircd, ir-ctl, and ir-keytable.

Signed-off-by: Sean Young <sean@mess.org>
---
 .../userspace-api/media/lirc.h.rst.exceptions         |  3 +++
 .../userspace-api/media/rc/lirc-dev-intro.rst         | 11 +++++++++--
 drivers/media/rc/lirc_dev.c                           | 11 +++++------
 drivers/media/rc/rc-loopback.c                        |  6 +++++-
 include/uapi/linux/lirc.h                             |  3 +++
 5 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/Documentation/userspace-api/media/lirc.h.rst.exceptions b/Documentation/userspace-api/media/lirc.h.rst.exceptions
index ec86e82d026d..5f31e967bc50 100644
--- a/Documentation/userspace-api/media/lirc.h.rst.exceptions
+++ b/Documentation/userspace-api/media/lirc.h.rst.exceptions
@@ -11,12 +11,14 @@ ignore define LIRC_SPACE
 ignore define LIRC_PULSE
 ignore define LIRC_FREQUENCY
 ignore define LIRC_TIMEOUT
+ignore define LIRC_OVERFLOW
 ignore define LIRC_VALUE
 ignore define LIRC_MODE2
 ignore define LIRC_IS_SPACE
 ignore define LIRC_IS_PULSE
 ignore define LIRC_IS_FREQUENCY
 ignore define LIRC_IS_TIMEOUT
+ignore define LIRC_IS_OVERFLOW
 
 ignore define LIRC_MODE2SEND
 ignore define LIRC_SEND2MODE
@@ -75,6 +77,7 @@ ignore define PULSE_MASK
 ignore define LIRC_MODE2_SPACE
 ignore define LIRC_MODE2_PULSE
 ignore define LIRC_MODE2_TIMEOUT
+ignore define LIRC_MODE2_OVERFLOW
 
 ignore define LIRC_VALUE_MASK
 ignore define LIRC_MODE2_MASK
diff --git a/Documentation/userspace-api/media/rc/lirc-dev-intro.rst b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
index 9a5e5f0aae11..d899331b943f 100644
--- a/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
+++ b/Documentation/userspace-api/media/rc/lirc-dev-intro.rst
@@ -103,11 +103,11 @@ on the following table.
 
     ``LIRC_MODE2_PULSE``
 
-        Signifies the presence of IR in microseconds.
+        Signifies the presence of IR in microseconds, also known as *flash*.
 
     ``LIRC_MODE2_SPACE``
 
-        Signifies absence of IR in microseconds.
+        Signifies absence of IR in microseconds, also known as *gap*.
 
     ``LIRC_MODE2_FREQUENCY``
 
@@ -121,6 +121,13 @@ on the following table.
         to no IR being detected, this packet will be sent, with the number
         of microseconds with no IR.
 
+    ``LIRC_MODE2_OVERFLOW``
+
+        Signifies that the IR receiver encounter an overflow, and some IR
+        is missing. The IR data after this should be correct again. The
+        actual value is not important, but this is set to 0xffffff by the
+        kernel for compatibility with lircd.
+
 .. _lirc-mode-pulse:
 
 ``LIRC_MODE_PULSE``
diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index fa4671fc92be..4d13486924fc 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -44,13 +44,12 @@ void lirc_raw_event(struct rc_dev *dev, struct ir_raw_event ev)
 	/* Receiver overflow, data missing */
 	if (ev.overflow) {
 		/*
-		 * Userspace expects a long space event before the start of
-		 * the signal to use as a sync.  This may be done with repeat
-		 * packets and normal samples.  But if an overflow has been sent
-		 * then we assume that a long time has passed, so we send a
-		 * space with the maximum time value.
+		 * Send lirc overflow message. This message is unknown to
+		 * lircd, but it will interpret this as a long space as
+		 * long as the value is set to high value. This resets its
+		 * decoder state.
 		 */
-		sample = LIRC_SPACE(LIRC_VALUE_MASK);
+		sample = LIRC_OVERFLOW(LIRC_VALUE_MASK);
 		dev_dbg(&dev->dev, "delivering overflow space to lirc_dev\n");
 
 	/* Carrier reports */
diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index 6441879fcba1..b356041c5c00 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -112,7 +112,11 @@ static int loop_tx_ir(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 		rawir.pulse = i % 2 ? false : true;
 		rawir.duration = txbuf[i];
 
-		ir_raw_event_store_with_filter(dev, &rawir);
+		/* simulate overflow if ridiculously long pulse was sent */
+		if (rawir.pulse && rawir.duration > MS_TO_US(50))
+			ir_raw_event_overflow(dev);
+		else
+			ir_raw_event_store_with_filter(dev, &rawir);
 	}
 
 	if (lodev->carrierreport) {
diff --git a/include/uapi/linux/lirc.h b/include/uapi/linux/lirc.h
index a1f9c26ea537..807306d6928c 100644
--- a/include/uapi/linux/lirc.h
+++ b/include/uapi/linux/lirc.h
@@ -16,6 +16,7 @@
 #define LIRC_MODE2_PULSE     0x01000000
 #define LIRC_MODE2_FREQUENCY 0x02000000
 #define LIRC_MODE2_TIMEOUT   0x03000000
+#define LIRC_MODE2_OVERFLOW  0x04000000
 
 #define LIRC_VALUE_MASK      0x00FFFFFF
 #define LIRC_MODE2_MASK      0xFF000000
@@ -24,6 +25,7 @@
 #define LIRC_PULSE(val) (((val)&LIRC_VALUE_MASK) | LIRC_MODE2_PULSE)
 #define LIRC_FREQUENCY(val) (((val)&LIRC_VALUE_MASK) | LIRC_MODE2_FREQUENCY)
 #define LIRC_TIMEOUT(val) (((val)&LIRC_VALUE_MASK) | LIRC_MODE2_TIMEOUT)
+#define LIRC_OVERFLOW(val) (((val)&LIRC_VALUE_MASK) | LIRC_MODE2_OVERFLOW)
 
 #define LIRC_VALUE(val) ((val)&LIRC_VALUE_MASK)
 #define LIRC_MODE2(val) ((val)&LIRC_MODE2_MASK)
@@ -32,6 +34,7 @@
 #define LIRC_IS_PULSE(val) (LIRC_MODE2(val) == LIRC_MODE2_PULSE)
 #define LIRC_IS_FREQUENCY(val) (LIRC_MODE2(val) == LIRC_MODE2_FREQUENCY)
 #define LIRC_IS_TIMEOUT(val) (LIRC_MODE2(val) == LIRC_MODE2_TIMEOUT)
+#define LIRC_IS_OVERFLOW(val) (LIRC_MODE2(val) == LIRC_MODE2_OVERFLOW)
 
 /* used heavily by lirc userspace */
 #define lirc_t int
-- 
2.34.1

