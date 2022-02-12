Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE8244B3674
	for <lists+linux-media@lfdr.de>; Sat, 12 Feb 2022 17:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237360AbiBLQcZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Feb 2022 11:32:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbiBLQcZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Feb 2022 11:32:25 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73579197
        for <linux-media@vger.kernel.org>; Sat, 12 Feb 2022 08:32:21 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id C65A9101C8F; Sat, 12 Feb 2022 16:32:19 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Marko=20M=C3=A4kel=C3=A4?= <marko.makela@iki.fi>
Subject: [PATCH 2/2] media: rtl28xxu: improve IR receiver
Date:   Sat, 12 Feb 2022 16:32:19 +0000
Message-Id: <704b3d7e5a7a95cbd5e4dfc25a41454e919aed95.1644683294.git.sean@mess.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1644683294.git.sean@mess.org>
References: <cover.1644683294.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This device presents an IR buffer, which can be read and cleared.
Clearing the buffer is racey with receiving IR, so wait until the IR
message is finished before clearing it.

This should minimize the chance of the buffer clear happening while
IR is being received, although we cannot avoid this completely.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 27 +++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 60e5153fcb24c..a83b1107fc7fd 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -1720,6 +1720,7 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 		{IR_RX_BUF_CTRL,         0x80, 0xff},
 		{IR_RX_CTRL,             0x80, 0xff},
 	};
+	u32 idle_length;
 
 	/* init remote controller */
 	if (!dev->rc_active) {
@@ -1770,6 +1771,28 @@ static int rtl2832u_rc_query(struct dvb_usb_device *d)
 	if (ret)
 		goto err;
 
+	dev_dbg(&d->intf->dev, "IR_RX_BUF=%*ph\n", len, buf);
+
+	/* if the receiver is not idle yet, do not process */
+	idle_length = 0;
+	if (len > 2) {
+		if (!(buf[len - 1] & 0x80))
+			idle_length += buf[len - 1];
+		if (!(buf[len - 2] & 0x80))
+			idle_length += buf[len - 2];
+	}
+
+	if (idle_length < 0xbf) {
+		/*
+		 * If the IR does not end with a space equal to the idle
+		 * length, then the IR is not complete yet and more is to
+		 * arrive shortly. If we process it and flush the buffer now,
+		 * we end up missing IR.
+		 */
+		dev_dbg(&d->intf->dev, "ignoring idle=%x\n", idle_length);
+		return 0;
+	}
+
 	/* let hw receive new code */
 	for (i = 0; i < ARRAY_SIZE(refresh_tab); i++) {
 		ret = rtl28xxu_wr_reg_mask(d, refresh_tab[i].reg,
@@ -1807,10 +1830,10 @@ static int rtl2832u_get_rc_config(struct dvb_usb_device *d,
 	rc->allowed_protos = RC_PROTO_BIT_ALL_IR_DECODER;
 	rc->driver_type = RC_DRIVER_IR_RAW;
 	rc->query = rtl2832u_rc_query;
-	rc->interval = 200;
+	rc->interval = 100;
 	/* we program idle len to 0xc0, set timeout to one less */
 	rc->rawir_timeout = 0xbf * 51;
-	rc->keyup_delay = MS_TO_US(210);
+	rc->keyup_delay = MS_TO_US(110);
 
 	return 0;
 }
-- 
2.34.1

