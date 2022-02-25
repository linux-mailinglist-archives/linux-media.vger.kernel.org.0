Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20E9B4C4271
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 11:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbiBYKia (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 05:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239680AbiBYKho (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 05:37:44 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196D39D0C2
        for <linux-media@vger.kernel.org>; Fri, 25 Feb 2022 02:37:02 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 85AD3100F35; Fri, 25 Feb 2022 10:36:49 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= 
        <vrserver1@gmail.com>
Subject: [PATCH] media: gpio-ir-tx: fix transmit with long spaces on Orange Pi PC
Date:   Fri, 25 Feb 2022 10:36:49 +0000
Message-Id: <20220225103649.978878-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Calling udelay for than 1000us does not always yield the correct
results.

Reported-by: Михаил <vrserver1@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/gpio-ir-tx.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index c6cd2e6d8e65..47277c9f4780 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -48,11 +48,29 @@ static int gpio_ir_tx_set_carrier(struct rc_dev *dev, u32 carrier)
 	return 0;
 }
 
+static void delay_until(ktime_t until)
+{
+	/*
+	 * delta should never exceed 0.5 seconds (IR_MAX_DURATION) and on
+	 * m68k ndelay(s64) does not compile; so use s32 rather than s64.
+	 */
+	s32 delta;
+
+	while (true) {
+		delta = ktime_us_delta(until, ktime_get());
+		if (delta <= 0)
+			return;
+
+		/* Don't udelay more than 1ms */
+		delta = min(delta, 1000);
+		udelay(delta);
+	}
+}
+
 static void gpio_ir_tx_unmodulated(struct gpio_ir *gpio_ir, uint *txbuf,
 				   uint count)
 {
 	ktime_t edge;
-	s32 delta;
 	int i;
 
 	local_irq_disable();
@@ -63,9 +81,7 @@ static void gpio_ir_tx_unmodulated(struct gpio_ir *gpio_ir, uint *txbuf,
 		gpiod_set_value(gpio_ir->gpio, !(i % 2));
 
 		edge = ktime_add_us(edge, txbuf[i]);
-		delta = ktime_us_delta(edge, ktime_get());
-		if (delta > 0)
-			udelay(delta);
+		delay_until(edge);
 	}
 
 	gpiod_set_value(gpio_ir->gpio, 0);
@@ -97,9 +113,7 @@ static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 		if (i % 2) {
 			// space
 			edge = ktime_add_us(edge, txbuf[i]);
-			delta = ktime_us_delta(edge, ktime_get());
-			if (delta > 0)
-				udelay(delta);
+			delay_until(edge);
 		} else {
 			// pulse
 			ktime_t last = ktime_add_us(edge, txbuf[i]);
-- 
2.35.1

