Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEB32C7AB8
	for <lists+linux-media@lfdr.de>; Sun, 29 Nov 2020 19:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgK2SkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Nov 2020 13:40:14 -0500
Received: from gofer.mess.org ([88.97.38.141]:48997 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728147AbgK2SkN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Nov 2020 13:40:13 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 5A0FCC6334; Sun, 29 Nov 2020 18:39:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1606675171; bh=lHOq9RtER7XLhVkW+pFfckH99vmmj9EuxXycxms+NvM=;
        h=From:To:Cc:Subject:Date:From;
        b=BtmtWm4B5eWG41IDghJlM7U4OJGf0zsYPBrkVOwGrGLmqpCSpjRFRdTyWzTK5l0SI
         Lb5kpp87cevijmtjAQgUtT+wXs+nMaiPThYCIjOaUu8MMRw1Npk9FtLnLTxF3vZEJt
         L2oMs/Nm1ZPGWN3HXi/f5IbwouZw8E69OLOjvSnTofPeKpw3RbyA9mX+RXOQuoXQI6
         roM2axC6NEvbKZ8/rqAHYx1jNfz+bZGsAgzfyy55TasvED3PWvqL+7G52yYOx7GiMP
         Tg9/hjPxwxOKWSXbYBWJT3iIXu5t68vL+gUKTpFZKXM+hhw0bq//to/bWpZuQDX7fy
         MxodARHeJE36Q==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Sean Wang <sean.wang@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v2] media: mtk-cir: fix calculation of chk period
Date:   Sun, 29 Nov 2020 18:39:31 +0000
Message-Id: <20201129183931.19208-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 528222d853f9 ("media: rc: harmonize infrared durations to
microseconds"), the calculation of the chk period is wrong. As a result,
all reported IR will have incorrect timings.

Now that the calculations are done in microseconds rather than nanoseconds,
we can fold the calculations in a simpler form with less rounding error.

Tested-by: Frank Wunderlich <frank-w@public-files.de>
Fixes: 528222d853f9 ("media: rc: harmonize infrared durations to microseconds")
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 5051a5e5244b..65a136c0fac2 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -151,15 +151,12 @@ static inline u32 mtk_chk_period(struct mtk_ir *ir)
 {
 	u32 val;
 
-	/* Period of raw software sampling in ns */
-	val = DIV_ROUND_CLOSEST(1000000000ul,
-				clk_get_rate(ir->bus) / ir->data->div);
-
 	/*
 	 * Period for software decoder used in the
 	 * unit of raw software sampling
 	 */
-	val = DIV_ROUND_CLOSEST(MTK_IR_SAMPLE, val);
+	val = DIV_ROUND_CLOSEST(clk_get_rate(ir->bus),
+				USEC_PER_SEC * ir->data->div / MTK_IR_SAMPLE);
 
 	dev_dbg(ir->dev, "@pwm clk  = \t%lu\n",
 		clk_get_rate(ir->bus) / ir->data->div);
@@ -412,7 +409,7 @@ static int mtk_ir_probe(struct platform_device *pdev)
 	mtk_irq_enable(ir, MTK_IRINT_EN);
 
 	dev_info(dev, "Initialized MT7623 IR driver, sample period = %dus\n",
-		 DIV_ROUND_CLOSEST(MTK_IR_SAMPLE, 1000));
+		 MTK_IR_SAMPLE);
 
 	return 0;
 
-- 
2.28.0

