Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64122321450
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 11:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhBVKoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 05:44:19 -0500
Received: from gofer.mess.org ([88.97.38.141]:54611 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230315AbhBVKoP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 05:44:15 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 9372CC64D8; Mon, 22 Feb 2021 10:43:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1613990610; bh=vFVBNb9aw+ZPRYimnegRaki9g0NwtUzst6xS3c7pxBQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rRi/KEbolzt5JwNEuLXR30uBdwvfW6cseXSUJutgqfWvGPaKHsD8XR+YgFY2VL4jg
         UZmygkc3pd6EqHS5Tr8jqvUYDKLYnPRUjW5ei+vtE5Xs/VgtmEKCnscV0Yaw3IqqVF
         V1a2JaDSQUZgNN/tFOt/OpBbKlNrHVKZFxbxICheprODLUTP7+VSKlC/Ormqz0ndpV
         FfUkg5elIMDaEa9t/2z8GtpzRMd9WZJcLJySac2EXd3MA/dKAJboKNmxRLy7LGFnZi
         HfpY2cK0SEdbIV66Hyj/0qCN6fLJxZs+sccGnpI5ay7MjGvLjxyew9qpAe7LpKxER4
         03s6AAgi0ZP9g==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, Matthias Reichl <hias@horus.com>,
        =?UTF-8?q?Juan=20Jes=C3=BAs=20Garc=C3=ADa=20de=20Soria?= 
        <skandalfo@gmail.com>
Subject: [PATCH 6/6] media: ite-cir: check for receive overflow
Date:   Mon, 22 Feb 2021 10:43:29 +0000
Message-Id: <e0b95fe2fdb41dca654a921f083bdf2ad872afce.1613989288.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1613989288.git.sean@mess.org>
References: <cover.1613989288.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's best if this condition is reported.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index cc0a70dcf93d..9580e9e6e5c9 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -236,8 +236,14 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	/* read the interrupt flags */
 	iflags = dev->params->get_irq_causes(dev);
 
+	/* Check for RX overflow */
+	if (iflags & ITE_IRQ_RX_FIFO_OVERRUN) {
+		dev_warn(&dev->rdev->dev, "receive overflow\n");
+		ir_raw_event_reset(dev->rdev);
+	}
+
 	/* check for the receive interrupt */
-	if (iflags & (ITE_IRQ_RX_FIFO | ITE_IRQ_RX_FIFO_OVERRUN)) {
+	if (iflags & ITE_IRQ_RX_FIFO) {
 		/* read the FIFO bytes */
 		rx_bytes = dev->params->get_rx_bytes(dev, rx_buf,
 						    ITE_RX_FIFO_LEN);
@@ -496,13 +502,13 @@ static int it87_get_irq_causes(struct ite_dev *dev)
 
 	switch (iflags) {
 	case IT87_II_RXDS:
-		ret = ITE_IRQ_RX_FIFO;
+		ret |= ITE_IRQ_RX_FIFO;
 		break;
 	case IT87_II_RXFO:
-		ret = ITE_IRQ_RX_FIFO_OVERRUN;
+		ret |= ITE_IRQ_RX_FIFO_OVERRUN;
 		break;
 	case IT87_II_TXLDL:
-		ret = ITE_IRQ_TX_FIFO;
+		ret |= ITE_IRQ_TX_FIFO;
 		break;
 	}
 
-- 
2.29.2

