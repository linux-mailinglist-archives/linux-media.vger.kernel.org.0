Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636A12741E9
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 14:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgIVMRr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 08:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgIVMRr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 08:17:47 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCFDC061755
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2020 05:17:46 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1EECC11A001; Tue, 22 Sep 2020 13:17:44 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Pavel Machek <pavel@denx.de>
Subject: [PATCH] media: gpio-ir-tx: re-introduce sleeping for periods of > 50us
Date:   Tue, 22 Sep 2020 13:17:43 +0100
Message-Id: <20200922121743.17701-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After commit ea8912b788f8 ("media: gpio-ir-tx: improve precision of
transmitted signal due to scheduling"), the gpio-ir-tx driver disables
interrupts for the entire duration of an IR frame, which is 500ms.

Experimentation on an raspberry pi 3 model b under various loads shows that
sleeping can be done using usleep_range() for periods > 40us.

Fixes: ea8912b788f8 ("media: gpio-ir-tx: improve precision of transmitted signal due to scheduling")
Link: https://lkml.org/lkml/2020/9/2/304
Suggested-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/gpio-ir-tx.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index c6cd2e6d8e65..be77c5b0d9d0 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -51,11 +51,12 @@ static int gpio_ir_tx_set_carrier(struct rc_dev *dev, u32 carrier)
 static void gpio_ir_tx_unmodulated(struct gpio_ir *gpio_ir, uint *txbuf,
 				   uint count)
 {
+	unsigned long flags;
 	ktime_t edge;
 	s32 delta;
 	int i;
 
-	local_irq_disable();
+	local_irq_save(flags);
 
 	edge = ktime_get();
 
@@ -64,16 +65,25 @@ static void gpio_ir_tx_unmodulated(struct gpio_ir *gpio_ir, uint *txbuf,
 
 		edge = ktime_add_us(edge, txbuf[i]);
 		delta = ktime_us_delta(edge, ktime_get());
+		if (delta > 50) {
+			local_irq_restore(flags);
+			usleep_range(delta - 40, delta - 40);
+			local_irq_save(flags);
+			delta = ktime_us_delta(edge, ktime_get());
+		}
 		if (delta > 0)
 			udelay(delta);
 	}
 
 	gpiod_set_value(gpio_ir->gpio, 0);
+
+	local_irq_restore(flags);
 }
 
 static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 				 uint count)
 {
+	unsigned long flags;
 	ktime_t edge;
 	/*
 	 * delta should never exceed 0.5 seconds (IR_MAX_DURATION) and on
@@ -89,7 +99,7 @@ static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 	space = DIV_ROUND_CLOSEST((100 - gpio_ir->duty_cycle) *
 				  (NSEC_PER_SEC / 100), gpio_ir->carrier);
 
-	local_irq_disable();
+	local_irq_save(flags);
 
 	edge = ktime_get();
 
@@ -98,6 +108,12 @@ static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 			// space
 			edge = ktime_add_us(edge, txbuf[i]);
 			delta = ktime_us_delta(edge, ktime_get());
+			if (delta > 50) {
+				local_irq_restore(flags);
+				usleep_range(delta - 40, delta - 40);
+				local_irq_save(flags);
+				delta = ktime_us_delta(edge, ktime_get());
+			}
 			if (delta > 0)
 				udelay(delta);
 		} else {
@@ -122,20 +138,19 @@ static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 			edge = last;
 		}
 	}
+
+	local_irq_restore(flags);
 }
 
 static int gpio_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
 		      unsigned int count)
 {
 	struct gpio_ir *gpio_ir = dev->priv;
-	unsigned long flags;
 
-	local_irq_save(flags);
 	if (gpio_ir->carrier)
 		gpio_ir_tx_modulated(gpio_ir, txbuf, count);
 	else
 		gpio_ir_tx_unmodulated(gpio_ir, txbuf, count);
-	local_irq_restore(flags);
 
 	return count;
 }
-- 
2.26.2

