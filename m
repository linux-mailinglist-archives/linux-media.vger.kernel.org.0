Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBBF1C725D
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 16:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbgEFOBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 10:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728667AbgEFOBq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 10:01:46 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E473C061A10
        for <linux-media@vger.kernel.org>; Wed,  6 May 2020 07:01:46 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DA2DFC63F1; Wed,  6 May 2020 15:01:44 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: gpio-ir-tx: allow transmission without carrier
Date:   Wed,  6 May 2020 15:01:44 +0100
Message-Id: <20200506140144.19778-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506140144.19778-1-sean@mess.org>
References: <20200506140144.19778-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some IR protocols do not use a carrier.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/gpio-ir-tx.c | 45 ++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/gpio-ir-tx.c b/drivers/media/rc/gpio-ir-tx.c
index 66703989ae185..156abebcce152 100644
--- a/drivers/media/rc/gpio-ir-tx.c
+++ b/drivers/media/rc/gpio-ir-tx.c
@@ -42,18 +42,40 @@ static int gpio_ir_tx_set_carrier(struct rc_dev *dev, u32 carrier)
 {
 	struct gpio_ir *gpio_ir = dev->priv;
 
-	if (!carrier)
-		return -EINVAL;
-
 	gpio_ir->carrier = carrier;
 
 	return 0;
 }
 
-static int gpio_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
-		      unsigned int count)
+static void gpio_ir_tx_unmodulated(struct gpio_ir *gpio_ir, uint *txbuf,
+				   uint count)
+{
+	unsigned long flags;
+	ktime_t edge;
+	s32 delta;
+	int i;
+
+	spin_lock_irqsave(&gpio_ir->lock, flags);
+
+	edge = ktime_get();
+
+	for (i = 0; i < count; i++) {
+		gpiod_set_value(gpio_ir->gpio, !(i % 2));
+
+		edge = ktime_add_us(edge, txbuf[i]);
+		delta = ktime_us_delta(edge, ktime_get());
+		if (delta > 0)
+			udelay(delta);
+	}
+
+	gpiod_set_value(gpio_ir->gpio, 0);
+
+	spin_unlock_irqrestore(&gpio_ir->lock, flags);
+}
+
+static void gpio_ir_tx_modulated(struct gpio_ir *gpio_ir, uint *txbuf,
+				 uint count)
 {
-	struct gpio_ir *gpio_ir = dev->priv;
 	unsigned long flags;
 	ktime_t edge;
 	/*
@@ -105,6 +127,17 @@ static int gpio_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
 	}
 
 	spin_unlock_irqrestore(&gpio_ir->lock, flags);
+}
+
+static int gpio_ir_tx(struct rc_dev *dev, unsigned int *txbuf,
+		      unsigned int count)
+{
+	struct gpio_ir *gpio_ir = dev->priv;
+
+	if (gpio_ir->carrier)
+		gpio_ir_tx_modulated(gpio_ir, txbuf, count);
+	else
+		gpio_ir_tx_unmodulated(gpio_ir, txbuf, count);
 
 	return count;
 }
-- 
2.26.2

