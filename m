Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DFD3E8536
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 23:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhHJVXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 17:23:18 -0400
Received: from gofer.mess.org ([88.97.38.141]:47895 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232739AbhHJVXR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 17:23:17 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7A52FC6485; Tue, 10 Aug 2021 22:22:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1628630573; bh=BoRnaNX6LUT/QvDneiyH2G6pBWna4SRG+E7HKo7/qhM=;
        h=From:To:Subject:Date:From;
        b=oE15HX56CEVQZmw+/T7ZA8I6bUqPm+4Zc4ZYEUCQnPzvlRxLgYRHH0L5WKyvfHI2t
         se/EJAW5/Wney6ej3B8n46ku+47dMh+cM4VyCjMSaww99hdytkrnTbDqgDM9paJzIh
         kBC6QsvPk3PKClaJc/kBuPo+z1Jq29UJ0CDBp+1v47l8XvRESD4grfd3JFeT/uRLPb
         8Jr5TxbpaBEFS5CVeH2PuY/FZxgHGiCBPGJ1LjlZ/dCH3YMWCKZyO/S9ZQCtMwkq1H
         EybgJJGk7pum46TVeokRpQwwLHMQ1NZtDJ5CIUXb6Lwpz18N7P6MgNUQ3vIK0Gvari
         wQl2Rn+Kq5dZw==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: ir_toy: allow tx carrier to be set
Date:   Tue, 10 Aug 2021 22:22:53 +0100
Message-Id: <20210810212253.4096-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ir_toy allows the transmit frequency to be specified.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ir_toy.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index 3e729a17b35ff..3908d4dcee34c 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -4,7 +4,9 @@
  * Infrared Toy and IR Droid RC core driver
  *
  * Copyright (C) 2020 Sean Young <sean@mess.org>
-
+ *
+ * http://dangerousprototypes.com/docs/USB_IR_Toy:_Sampling_mode
+ *
  * This driver is based on the lirc driver which can be found here:
  * https://sourceforge.net/p/lirc/git/ci/master/tree/plugins/irtoy.c
  * Copyright (C) 2011 Peter Kooiman <pkooiman@gmail.com>
@@ -45,7 +47,7 @@ static const u8 COMMAND_TXSTART[] = { 0x26, 0x24, 0x25, 0x03 };
 
 enum state {
 	STATE_IRDATA,
-	STATE_RESET,
+	STATE_COMMAND_NO_RESP,
 	STATE_COMMAND,
 	STATE_TX,
 };
@@ -192,7 +194,7 @@ static void irtoy_response(struct irtoy *irtoy, u32 len)
 			irtoy->tx_len -= buf_len;
 		}
 		break;
-	case STATE_RESET:
+	case STATE_COMMAND_NO_RESP:
 		dev_err(irtoy->dev, "unexpected response to reset: %*phN\n",
 			len, irtoy->in);
 	}
@@ -203,7 +205,7 @@ static void irtoy_out_callback(struct urb *urb)
 	struct irtoy *irtoy = urb->context;
 
 	if (urb->status == 0) {
-		if (irtoy->state == STATE_RESET)
+		if (irtoy->state == STATE_COMMAND_NO_RESP)
 			complete(&irtoy->command_done);
 	} else {
 		dev_warn(irtoy->dev, "out urb status: %d\n", urb->status);
@@ -255,7 +257,7 @@ static int irtoy_setup(struct irtoy *irtoy)
 	int err;
 
 	err = irtoy_command(irtoy, COMMAND_RESET, sizeof(COMMAND_RESET),
-			    STATE_RESET);
+			    STATE_COMMAND_NO_RESP);
 	if (err != 0) {
 		dev_err(irtoy->dev, "could not write reset command: %d\n",
 			err);
@@ -338,6 +340,27 @@ static int irtoy_tx(struct rc_dev *rc, uint *txbuf, uint count)
 	return count;
 }
 
+static int irtoy_tx_carrier(struct rc_dev *rc, uint32_t carrier)
+{
+	struct irtoy *irtoy = rc->priv;
+	u8 buf[3];
+	int err;
+
+	if (carrier == 0)
+		return -EINVAL;
+
+	buf[0] = 0x06;
+	buf[1] = DIV_ROUND_CLOSEST(48000000, 16 * carrier) - 1;
+	buf[2] = 0;
+
+	err = irtoy_command(irtoy, buf, sizeof(buf), STATE_COMMAND_NO_RESP);
+	if (err)
+		dev_err(irtoy->dev, "could not write carrier command: %d\n",
+			err);
+
+	return err;
+}
+
 static int irtoy_probe(struct usb_interface *intf,
 		       const struct usb_device_id *id)
 {
@@ -436,6 +459,7 @@ static int irtoy_probe(struct usb_interface *intf,
 	rc->dev.parent = &intf->dev;
 	rc->priv = irtoy;
 	rc->tx_ir = irtoy_tx;
+	rc->s_tx_carrier = irtoy_tx_carrier;
 	rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->map_name = RC_MAP_RC6_MCE;
 	rc->rx_resolution = UNIT_US;
-- 
2.31.1

