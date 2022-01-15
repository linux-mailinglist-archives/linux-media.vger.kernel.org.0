Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5404B48F664
	for <lists+linux-media@lfdr.de>; Sat, 15 Jan 2022 11:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbiAOK2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jan 2022 05:28:09 -0500
Received: from gofer.mess.org ([88.97.38.141]:38197 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229530AbiAOK2J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jan 2022 05:28:09 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1A745101C2F; Sat, 15 Jan 2022 10:28:08 +0000 (UTC)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc:     Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] media: mtk-cir: simplify code
Date:   Sat, 15 Jan 2022 10:28:08 +0000
Message-Id: <20220115102808.251064-1-sean@mess.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Re-write without unnecessary shifts.

Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 255f8a116b59..9d83233195e6 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -203,10 +203,10 @@ static inline void mtk_irq_enable(struct mtk_ir *ir, u32 mask)
 
 static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
 {
+	struct ir_raw_event rawir = {};
 	struct mtk_ir *ir = dev_id;
-	u8  wid = 0;
 	u32 i, j, val;
-	struct ir_raw_event rawir = {};
+	u8 wid;
 
 	/*
 	 * Each pulse and space is encoded as a single byte, each byte
@@ -228,7 +228,8 @@ static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
 		dev_dbg(ir->dev, "@reg%d=0x%08x\n", i, val);
 
 		for (j = 0 ; j < 4 ; j++) {
-			wid = (val & (MTK_WIDTH_MASK << j * 8)) >> j * 8;
+			wid = val & MTK_WIDTH_MASK;
+			val <<= 8;
 			rawir.pulse = !rawir.pulse;
 			rawir.duration = wid * (MTK_IR_SAMPLE + 1);
 			ir_raw_event_store_with_filter(ir->rc, &rawir);
-- 
2.34.1

