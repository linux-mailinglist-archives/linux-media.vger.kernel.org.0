Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2FE15F784E
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 14:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiJGMu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 08:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiJGMuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 08:50:22 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC735140DA
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 05:50:13 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 3751410005F; Fri,  7 Oct 2022 13:50:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1665147011; bh=9/OUrJFXq4B/d6BMSUi0DY28GNbxS1ApEpCuVAvRA0M=;
        h=From:To:Subject:Date:From;
        b=ROk+glDWdEwhOByU6SHTw9raYzlGjHET8IS+IK8wNNlZAf1BsyueSFQZl+4egDWNQ
         Tqd6Ai3fFHwPVPnhl1idX0JdBO1bqwS1TZwOocdnmzzBRgRBKvjXaxRP9Dke22FcXC
         sxzIKuQU9dCTuGNU7YCn/j37TirY0ZNf+Pc4XTnjxxVxIK8Ppf4t8C2Vi6EA8kbvfs
         jfkLksQrhTTiPDNronMpbCrVAN3v+hEHu4vnA5qdOZt2M97ldiUpfhRQtln2edq5TG
         cOL/lNgOUGlhofivqXSOtyvHXvcRFi1J37vAtIGspNpV2eqKNgEDGTtdaNJ9jdivL9
         NvVRwEwQQIRhQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: ite-cir: ignore interrupts when they are not pending
Date:   Fri,  7 Oct 2022 13:50:11 +0100
Message-Id: <20221007125011.132480-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On an Intel NUC6iSYK, during suspend an interrupt is sometimes received
by the driver even though there is no work pending. This results in an
infred overflow being recorded:

rc rc0: receive overflow

There is no receiver overflow at this time.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 26 ++++++++++++++++----------
 drivers/media/rc/ite-cir.h |  1 +
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index fcfadd7ea31c..ffb0c2249010 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -234,6 +234,8 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 
 	/* read the interrupt flags */
 	iflags = dev->params->get_irq_causes(dev);
+	if (iflags == ITE_IRQ_NOT_PENDING)
+		return IRQ_RETVAL(IRQ_NONE);
 
 	/* Check for RX overflow */
 	if (iflags & ITE_IRQ_RX_FIFO_OVERRUN) {
@@ -498,16 +500,20 @@ static int it87_get_irq_causes(struct ite_dev *dev)
 	/* read the interrupt flags */
 	iflags = inb(dev->cir_addr + IT87_IIR) & IT87_II;
 
-	switch (iflags) {
-	case IT87_II_RXDS:
-		ret = ITE_IRQ_RX_FIFO;
-		break;
-	case IT87_II_RXFO:
-		ret = ITE_IRQ_RX_FIFO_OVERRUN;
-		break;
-	case IT87_II_TXLDL:
-		ret = ITE_IRQ_TX_FIFO;
-		break;
+	if (!(iflags & IT87_IP)) {
+		ret = ITE_IRQ_NOT_PENDING;
+	} else {
+		switch (iflags) {
+		case IT87_II_RXDS:
+			ret = ITE_IRQ_RX_FIFO;
+			break;
+		case IT87_II_RXFO:
+			ret = ITE_IRQ_RX_FIFO_OVERRUN;
+			break;
+		case IT87_II_TXLDL:
+			ret = ITE_IRQ_TX_FIFO;
+			break;
+		}
 	}
 
 	return ret;
diff --git a/drivers/media/rc/ite-cir.h b/drivers/media/rc/ite-cir.h
index 4b4294d77555..8df392bd9af7 100644
--- a/drivers/media/rc/ite-cir.h
+++ b/drivers/media/rc/ite-cir.h
@@ -16,6 +16,7 @@
 #define ITE_IRQ_TX_FIFO        1
 #define ITE_IRQ_RX_FIFO        2
 #define ITE_IRQ_RX_FIFO_OVERRUN    4
+#define ITE_IRQ_NOT_PENDING    8
 
 /* forward declaration */
 struct ite_dev;
-- 
2.38.0

