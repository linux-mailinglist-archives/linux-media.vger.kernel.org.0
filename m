Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4188988B15
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 13:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfHJLpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Aug 2019 07:45:00 -0400
Received: from gofer.mess.org ([88.97.38.141]:48767 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726084AbfHJLo7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Aug 2019 07:44:59 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6815660A27; Sat, 10 Aug 2019 12:44:58 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/3] media: imon_raw: simplify and explain bit operations
Date:   Sat, 10 Aug 2019 12:44:56 +0100
Message-Id: <20190810114458.8883-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This code needs some explanation.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/imon_raw.c | 43 +++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/media/rc/imon_raw.c b/drivers/media/rc/imon_raw.c
index 25e56c5b13c0..e6723993b466 100644
--- a/drivers/media/rc/imon_raw.c
+++ b/drivers/media/rc/imon_raw.c
@@ -14,7 +14,7 @@ struct imon {
 	struct device *dev;
 	struct urb *ir_urb;
 	struct rc_dev *rcdev;
-	u8 ir_buf[8] __aligned(__alignof__(u64));
+	__be64 ir_buf;
 	char phys[64];
 };
 
@@ -29,14 +29,35 @@ struct imon {
 static void imon_ir_data(struct imon *imon)
 {
 	struct ir_raw_event rawir = {};
-	u64 d = be64_to_cpup((__be64 *)imon->ir_buf) >> 24;
+	u64 data = be64_to_cpu(imon->ir_buf);
+	u8 packet_no = data & 0xff;
 	int offset = 40;
 	int bit;
 
-	dev_dbg(imon->dev, "data: %*ph", 8, imon->ir_buf);
+	if (packet_no == 0xff)
+		return;
+
+	dev_dbg(imon->dev, "data: %*ph", 8, &imon->ir_buf);
+
+	/*
+	 * Only the first 5 bytes contain IR data. Right shift so we move
+	 * the IR bits to the lower 40 bits.
+	 */
+	data >>= 24;
 
 	do {
-		bit = fls64(d & (BIT_ULL(offset) - 1));
+		/*
+		 * Find highest set bit which is less or equal to offset
+		 *
+		 * offset is the bit above (base 0) where we start looking.
+		 *
+		 * data & (BIT_ULL(offset) - 1) masks off any unwanted bits,
+		 * so we have just bits less than offset.
+		 *
+		 * fls will tell us the highest bit set plus 1 (or 0 if no
+		 * bits are set).
+		 */
+		bit = fls64(data & (BIT_ULL(offset) - 1));
 		if (bit < offset) {
 			dev_dbg(imon->dev, "pulse: %d bits", offset - bit);
 			rawir.pulse = true;
@@ -49,7 +70,12 @@ static void imon_ir_data(struct imon *imon)
 			offset = bit;
 		}
 
-		bit = fls64(~d & (BIT_ULL(offset) - 1));
+		/*
+		 * Find highest clear bit which is less than offset.
+		 *
+		 * Just invert the data and use same trick as above.
+		 */
+		bit = fls64(~data & (BIT_ULL(offset) - 1));
 		dev_dbg(imon->dev, "space: %d bits", offset - bit);
 
 		rawir.pulse = false;
@@ -59,7 +85,7 @@ static void imon_ir_data(struct imon *imon)
 		offset = bit;
 	} while (offset > 0);
 
-	if (imon->ir_buf[7] == 0x0a) {
+	if (packet_no == 0x0a) {
 		ir_raw_event_set_idle(imon->rcdev, true);
 		ir_raw_event_handle(imon->rcdev);
 	}
@@ -72,8 +98,7 @@ static void imon_ir_rx(struct urb *urb)
 
 	switch (urb->status) {
 	case 0:
-		if (imon->ir_buf[7] != 0xff)
-			imon_ir_data(imon);
+		imon_ir_data(imon);
 		break;
 	case -ECONNRESET:
 	case -ENOENT:
@@ -129,7 +154,7 @@ static int imon_probe(struct usb_interface *intf,
 	imon->dev = &intf->dev;
 	usb_fill_int_urb(imon->ir_urb, udev,
 			 usb_rcvintpipe(udev, ir_ep->bEndpointAddress),
-			 imon->ir_buf, sizeof(imon->ir_buf),
+			 &imon->ir_buf, sizeof(imon->ir_buf),
 			 imon_ir_rx, imon, ir_ep->bInterval);
 
 	rcdev = devm_rc_allocate_device(&intf->dev, RC_DRIVER_IR_RAW);
-- 
2.21.0

