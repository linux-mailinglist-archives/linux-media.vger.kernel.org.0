Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C935B676A6
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 00:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbfGLWrE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 18:47:04 -0400
Received: from gofer.mess.org ([88.97.38.141]:45631 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbfGLWrD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 18:47:03 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1A91060665; Fri, 12 Jul 2019 23:47:01 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Sean Wang <sean.wang@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 3/3] media: mtk-cir: lower de-glitch counter for rc-mm protocol
Date:   Fri, 12 Jul 2019 23:47:00 +0100
Message-Id: <20190712224700.11285-3-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190712224700.11285-1-sean@mess.org>
References: <20190712224700.11285-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rc-mm protocol can't be decoded by the mtk-cir since the de-glitch
filter removes pulses/spaces shorter than 294 microseconds.

Tested on a BananaPi R2.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 9dc467ebae24..8027181de985 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -35,6 +35,11 @@
 /* Fields containing pulse width data */
 #define MTK_WIDTH_MASK		  (GENMASK(7, 0))
 
+/* IR threshold */
+#define MTK_IRTHD		 0x14
+#define MTK_DG_CNT_MASK		 (GENMASK(12, 8))
+#define MTK_DG_CNT(x)		 ((x) << 8)
+
 /* Bit to enable interrupt */
 #define MTK_IRINT_EN		  BIT(0)
 
@@ -400,6 +405,9 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	mtk_w32_mask(ir, val, ir->data->fields[MTK_HW_PERIOD].mask,
 		     ir->data->fields[MTK_HW_PERIOD].reg);
 
+	/* Set de-glitch counter */
+	mtk_w32_mask(ir, MTK_DG_CNT(1), MTK_DG_CNT_MASK, MTK_IRTHD);
+
 	/* Enable IR and PWM */
 	val = mtk_r32(ir, MTK_CONFIG_HIGH_REG);
 	val |= MTK_OK_COUNT(ir->data->ok_count) |  MTK_PWM_EN | MTK_IR_EN;
-- 
2.21.0

