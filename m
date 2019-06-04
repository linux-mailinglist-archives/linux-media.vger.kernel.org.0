Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05EDD34D75
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 18:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbfFDQbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 12:31:07 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44541 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbfFDQaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 12:30:12 -0400
Received: by mail-wr1-f67.google.com with SMTP id w13so16484986wru.11;
        Tue, 04 Jun 2019 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TrJrO+4WVaDcBJRtqTErrFHqZWoDLU/J3nYOQSosNEY=;
        b=RGvzKAyaP8Nn+tVEfpqKFWUsv0KutBvUK6HHUt60gDfdFjLe+liHA6E3qMJj3yiaBk
         A18rCVtZgu60LIWyGbYuDG7sY6ybggpciaLV4xKTFNX5lbNqGIOaiYNS8UDc5HCGWcYC
         8S6+OYjOjuMgYQDj74AxTq+/s8rl0Wiz4NUTvvSj7i6WHDs7h2rvdCzdnob6+QmdlfMd
         Y3npXQef+x5jCNbLuCnLotNeabJwrW1Xfyi9SrUNalmYjeAM5FJNyCDp8zd1SYxdl188
         KB6255DdPms6iwIkIFcFFdc/F8/pC71XdXkPnCvqlyveK5E4o6/Ka0M0wvhz+U2kcmD9
         2OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TrJrO+4WVaDcBJRtqTErrFHqZWoDLU/J3nYOQSosNEY=;
        b=HJ3gsNWZuZpQcrIcxFa8qtNhYhEsdMuPO4a2GruDrEiKr6W+IYGWJFi63UwlOVq5Tu
         4ebvRSvGdrZl4ow6mere7vjT8D925LElY8TvJFB9y97IGOFDzGfdPBgfDYhIBFj+sKqL
         aa3XCAyywCZrrr15DXfnYeJfIObqE7wq5Uq17aiftZYbzJBwhQuFGV+cX850i1ynN7dN
         8+0ii5jR5QYC1W/XuACjWJXg5RDKMFNUxEC/IinCah5WI+KrgQhkkXxfspUt6SyXkNeu
         aSXMJUa6z3BX3TaCZXtPhVR9drQ4YROE6S/YlR70ULAtFLn4NZOte/x/pESA4ETQPRlh
         l8OQ==
X-Gm-Message-State: APjAAAWBc+UNDsOy+6umUnLbKNnvyYvl+4xL6qfHf1o724Lh0pYilhG2
        5M5+0iE9c8/VWAqPzjA9BIQ=
X-Google-Smtp-Source: APXvYqzTMZNFQgYpbFMki+XibrOhrkub/SRgKsjfuDCDWwjvBw2nfOYV6dEbU1y/vUlXeJRW/t28xQ==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr20704308wrn.244.1559665809997;
        Tue, 04 Jun 2019 09:30:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id y12sm15108176wrh.40.2019.06.04.09.30.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 04 Jun 2019 09:30:08 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v4 04/13] media: rc: sunxi: Add RXSTA bits definition
Date:   Tue,  4 Jun 2019 18:29:50 +0200
Message-Id: <20190604162959.29199-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604162959.29199-1-peron.clem@gmail.com>
References: <20190604162959.29199-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We are using RXINT bits definition when looking at RXSTA register.

These bits are equal but it's not really proper.

Introduce the RXSTA bits and use them to have coherency.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 0504ebfc831f..572bd2257d35 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -48,11 +48,11 @@
 
 /* Rx Interrupt Enable */
 #define SUNXI_IR_RXINT_REG    0x2C
-/* Rx FIFO Overflow */
+/* Rx FIFO Overflow Interrupt Enable */
 #define REG_RXINT_ROI_EN		BIT(0)
-/* Rx Packet End */
+/* Rx Packet End Interrupt Enable */
 #define REG_RXINT_RPEI_EN		BIT(1)
-/* Rx FIFO Data Available */
+/* Rx FIFO Data Available Interrupt Enable */
 #define REG_RXINT_RAI_EN		BIT(4)
 
 /* Rx FIFO available byte level */
@@ -60,6 +60,12 @@
 
 /* Rx Interrupt Status */
 #define SUNXI_IR_RXSTA_REG    0x30
+/* Rx FIFO Overflow */
+#define REG_RXSTA_ROI			BIT(0)
+/* Rx Packet End */
+#define REG_RXSTA_RPE			BIT(1)
+/* Rx FIFO Data Available */
+#define REG_RXSTA_RA			BIT(4)
 /* RX FIFO Get Available Counter */
 #define REG_RXSTA_GET_AC(val) (((val) >> 8) & (ir->fifo_size * 2 - 1))
 /* Clear all interrupt status value */
@@ -119,7 +125,7 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 	/* clean all pending statuses */
 	writel(status | REG_RXSTA_CLEARALL, ir->base + SUNXI_IR_RXSTA_REG);
 
-	if (status & (REG_RXINT_RAI_EN | REG_RXINT_RPEI_EN)) {
+	if (status & (REG_RXSTA_RA | REG_RXSTA_RPE)) {
 		/* How many messages in fifo */
 		rc  = REG_RXSTA_GET_AC(status);
 		/* Sanity check */
@@ -135,9 +141,9 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 		}
 	}
 
-	if (status & REG_RXINT_ROI_EN) {
+	if (status & REG_RXSTA_ROI) {
 		ir_raw_event_reset(ir->rc);
-	} else if (status & REG_RXINT_RPEI_EN) {
+	} else if (status & REG_RXSTA_RPE) {
 		ir_raw_event_set_idle(ir->rc, true);
 		ir_raw_event_handle(ir->rc);
 	}
-- 
2.20.1

