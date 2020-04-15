Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987261AA905
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 15:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732691AbgDONsj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 09:48:39 -0400
Received: from gofer.mess.org ([88.97.38.141]:57435 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2633551AbgDONsf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 09:48:35 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3219111A002; Wed, 15 Apr 2020 14:48:32 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: iguanair: rc drivers no longer need to do locking
Date:   Wed, 15 Apr 2020 14:48:32 +0100
Message-Id: <20200415134832.30709-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 4957133fe32f ("media: lirc: improve locking"), drivers
do not need to do any of their own locking.

During suspend and resume, no processes are running so no locking is
needed.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/iguanair.c | 36 +++---------------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index 3c8bd13d029a..566c2816d5be 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -14,7 +14,6 @@
 #include <linux/completion.h>
 #include <media/rc-core.h>
 
-#define DRIVER_NAME "iguanair"
 #define BUF_SIZE 152
 
 struct iguanair {
@@ -27,8 +26,6 @@ struct iguanair {
 	uint8_t bufsize;
 	uint8_t cycle_overhead;
 
-	struct mutex lock;
-
 	/* receiver support */
 	bool receiver_on;
 	dma_addr_t dma_in, dma_out;
@@ -284,8 +281,6 @@ static int iguanair_set_tx_carrier(struct rc_dev *dev, uint32_t carrier)
 	if (carrier < 25000 || carrier > 150000)
 		return -EINVAL;
 
-	mutex_lock(&ir->lock);
-
 	if (carrier != ir->carrier) {
 		uint32_t cycles, fours, sevens;
 
@@ -314,8 +309,6 @@ static int iguanair_set_tx_carrier(struct rc_dev *dev, uint32_t carrier)
 		ir->packet->busy4 = 110 - fours;
 	}
 
-	mutex_unlock(&ir->lock);
-
 	return 0;
 }
 
@@ -326,9 +319,7 @@ static int iguanair_set_tx_mask(struct rc_dev *dev, uint32_t mask)
 	if (mask > 15)
 		return 4;
 
-	mutex_lock(&ir->lock);
 	ir->packet->channels = mask << 4;
-	mutex_unlock(&ir->lock);
 
 	return 0;
 }
@@ -339,8 +330,6 @@ static int iguanair_tx(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 	unsigned int i, size, p, periods;
 	int rc;
 
-	mutex_lock(&ir->lock);
-
 	/* convert from us to carrier periods */
 	for (i = size = 0; i < count; i++) {
 		periods = DIV_ROUND_CLOSEST(txbuf[i] * ir->carrier, 1000000);
@@ -368,8 +357,6 @@ static int iguanair_tx(struct rc_dev *dev, unsigned *txbuf, unsigned count)
 		rc = -EOVERFLOW;
 
 out:
-	mutex_unlock(&ir->lock);
-
 	return rc ? rc : count;
 }
 
@@ -378,14 +365,10 @@ static int iguanair_open(struct rc_dev *rdev)
 	struct iguanair *ir = rdev->priv;
 	int rc;
 
-	mutex_lock(&ir->lock);
-
 	rc = iguanair_receiver(ir, true);
 	if (rc == 0)
 		ir->receiver_on = true;
 
-	mutex_unlock(&ir->lock);
-
 	return rc;
 }
 
@@ -394,14 +377,10 @@ static void iguanair_close(struct rc_dev *rdev)
 	struct iguanair *ir = rdev->priv;
 	int rc;
 
-	mutex_lock(&ir->lock);
-
 	rc = iguanair_receiver(ir, false);
 	ir->receiver_on = false;
 	if (rc && rc != -ENODEV)
 		dev_warn(ir->dev, "failed to disable receiver: %d\n", rc);
-
-	mutex_unlock(&ir->lock);
 }
 
 static int iguanair_probe(struct usb_interface *intf,
@@ -441,7 +420,6 @@ static int iguanair_probe(struct usb_interface *intf,
 	ir->rc = rc;
 	ir->dev = &intf->dev;
 	ir->udev = udev;
-	mutex_init(&ir->lock);
 
 	init_completion(&ir->completion);
 	pipeout = usb_sndintpipe(udev,
@@ -483,7 +461,7 @@ static int iguanair_probe(struct usb_interface *intf,
 	rc->s_tx_mask = iguanair_set_tx_mask;
 	rc->s_tx_carrier = iguanair_set_tx_carrier;
 	rc->tx_ir = iguanair_tx;
-	rc->driver_name = DRIVER_NAME;
+	rc->driver_name = KBUILD_MODNAME;
 	rc->map_name = RC_MAP_RC6_MCE;
 	rc->min_timeout = 1;
 	rc->timeout = IR_DEFAULT_TIMEOUT;
@@ -538,8 +516,6 @@ static int iguanair_suspend(struct usb_interface *intf, pm_message_t message)
 	struct iguanair *ir = usb_get_intfdata(intf);
 	int rc = 0;
 
-	mutex_lock(&ir->lock);
-
 	if (ir->receiver_on) {
 		rc = iguanair_receiver(ir, false);
 		if (rc)
@@ -549,17 +525,13 @@ static int iguanair_suspend(struct usb_interface *intf, pm_message_t message)
 	usb_kill_urb(ir->urb_in);
 	usb_kill_urb(ir->urb_out);
 
-	mutex_unlock(&ir->lock);
-
 	return rc;
 }
 
 static int iguanair_resume(struct usb_interface *intf)
 {
 	struct iguanair *ir = usb_get_intfdata(intf);
-	int rc = 0;
-
-	mutex_lock(&ir->lock);
+	int rc;
 
 	rc = usb_submit_urb(ir->urb_in, GFP_KERNEL);
 	if (rc)
@@ -571,8 +543,6 @@ static int iguanair_resume(struct usb_interface *intf)
 			dev_warn(ir->dev, "failed to enable receiver after resume\n");
 	}
 
-	mutex_unlock(&ir->lock);
-
 	return rc;
 }
 
@@ -582,7 +552,7 @@ static const struct usb_device_id iguanair_table[] = {
 };
 
 static struct usb_driver iguanair_driver = {
-	.name =	DRIVER_NAME,
+	.name =	KBUILD_MODNAME,
 	.probe = iguanair_probe,
 	.disconnect = iguanair_disconnect,
 	.suspend = iguanair_suspend,
-- 
2.25.2

