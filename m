Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73AC031082B
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 10:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhBEJp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 04:45:56 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:12437 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhBEJnr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 04:43:47 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DX9Rr5VF6zjJT0;
        Fri,  5 Feb 2021 17:42:00 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 5 Feb 2021 17:42:58 +0800
From:   Daode Huang <huangdaode@huawei.com>
To:     <sean@mess.org>, <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <song.bao.hua@hisilicon.com>
Subject: [PATCH] media: rc/ite-cir: replace spin_lock_irqsave by spin_lock in hard IRQ
Date:   Fri, 5 Feb 2021 17:39:11 +0800
Message-ID: <1612517951-119798-1-git-send-email-huangdaode@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is redundant to do irqsave and irqrestore in hardIRQ context.

Signed-off-by: Daode Huang <huangdaode@huawei.com>
---
 drivers/media/rc/ite-cir.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 0c62295..4a51ca80 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -262,7 +262,6 @@ static void ite_set_carrier_params(struct ite_dev *dev)
 static irqreturn_t ite_cir_isr(int irq, void *data)
 {
 	struct ite_dev *dev = data;
-	unsigned long flags;
 	irqreturn_t ret = IRQ_RETVAL(IRQ_NONE);
 	u8 rx_buf[ITE_RX_FIFO_LEN];
 	int rx_bytes;
@@ -271,7 +270,7 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	ite_dbg_verbose("%s firing", __func__);
 
 	/* grab the spinlock */
-	spin_lock_irqsave(&dev->lock, flags);
+	spin_lock(&dev->lock);
 
 	/* read the interrupt flags */
 	iflags = dev->params.get_irq_causes(dev);
@@ -287,17 +286,14 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 			/* drop the spinlock, since the ir-core layer
 			 * may call us back again through
 			 * ite_s_idle() */
-			spin_unlock_irqrestore(&dev->
-									 lock,
-									 flags);
+			spin_unlock(&dev->lock);
 
 			/* decode the data we've just received */
 			ite_decode_bytes(dev, rx_buf,
 								   rx_bytes);
 
 			/* reacquire the spinlock */
-			spin_lock_irqsave(&dev->lock,
-								    flags);
+			spin_lock(&dev->lock);
 
 			/* mark the interrupt as serviced */
 			ret = IRQ_RETVAL(IRQ_HANDLED);
@@ -314,7 +310,7 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	}
 
 	/* drop the spinlock */
-	spin_unlock_irqrestore(&dev->lock, flags);
+	spin_unlock(&dev->lock);
 
 	ite_dbg_verbose("%s done returning %d", __func__, (int)ret);
 
-- 
2.8.1

