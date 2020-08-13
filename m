Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8E424385D
	for <lists+linux-media@lfdr.de>; Thu, 13 Aug 2020 12:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHMKSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 06:18:43 -0400
Received: from gofer.mess.org ([88.97.38.141]:51487 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgHMKSn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 06:18:43 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4985FC63D7; Thu, 13 Aug 2020 11:18:41 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: gpio-ir-tx: spinlock is not needed to disable interrupts
Date:   Thu, 13 Aug 2020 11:18:41 +0100
Message-Id: <20200813101841.5526-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During bit-banging the IR on a gpio pin, we cannot be scheduled or have
anything interrupt us, else the generated signal will be incorrect.
Therefore, we need to disable interrupts on the local cpu. This also
disables preemption.

local_irq_disable() does exactly what we need and does not require a
spinlock.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/gpio-ir-tx.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index f33b443bfa47..70d0d2baa3ae 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -19,8 +19,6 @@ struct gpio_ir {
 	struct gpio_desc *gpio;
 	unsigned int carrier;
 	unsigned int duty_cycle;
-	/* we need a spinlock to hold the cpu while transmitting */
-	spinlock_t lock;
 };
 
 static const struct of_device_id gpio_ir_tx_of_match[] = {
@@ -53,12 +51,11 @@ static int gpio_ir_tx_set_carrier(struct rc_dev *dev, u32 carrier)
 static void gpio_ir_tx_unmodulated(struct gpio_ir *gpio_ir, uint *txbuf,
 				   uint count)
 {
-	unsigned long flags;
 	ktime_t edge;
 	s32 delta;
 	int i;
 
-	spin_lock_irqsave(&gpio_ir->lock, flags);
+	local_irq_disable();
 
 	edge = ktime_get();
 
@@ -72,14 +69,11 @@ static void gpio_ir_tx_unmodulated(struct gpio_ir *gpio_ir, uint *txbuf,
 	}
 
 	gpiod_set_value(gpio_ir->gpio, 0);
-
-	spin_unlock_irqrestore(&gpio_ir->lock, flags);
 }
 
 static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 				 uint count)
 {
-	unsigned long flags;
 	ktime_t edge;
 	/*
 	 * delta should never exceed 0.5 seconds (IR_MAX_DURATION) and on
@@ -95,7 +89,7 @@ static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 	space = DIV_ROUND_CLOSEST((100 - gpio_ir->duty_cycle) *
 				  (NSEC_PER_SEC / 100), gpio_ir->carrier);
 
-	spin_lock_irqsave(&gpio_ir->lock, flags);
+	local_irq_disable();
 
 	edge = ktime_get();
 
@@ -128,19 +122,20 @@ static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
 			edge = last;
 		}
 	}
-
-	spin_unlock_irqrestore(&gpio_ir->lock, flags);
 }
 
 static int gpio_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
 		      unsigned int count)
 {
 	struct gpio_ir *gpio_ir = dev->priv;
+	unsigned long flags;
 
+	local_irq_save(flags);
 	if (gpio_ir->carrier)
 		gpio_ir_tx_modulated(gpio_ir, txbuf, count);
 	else
 		gpio_ir_tx_unmodulated(gpio_ir, txbuf, count);
+	local_irq_restore(flags);
 
 	return count;
 }
-- 
2.26.2

