Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E223655B56A
	for <lists+linux-media@lfdr.de>; Mon, 27 Jun 2022 04:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbiF0C4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jun 2022 22:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232071AbiF0C4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jun 2022 22:56:04 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA913894;
        Sun, 26 Jun 2022 19:56:02 -0700 (PDT)
X-UUID: 6056e953faa44dc5a1cf126a15166026-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:031a001d-01c7-4e1b-824b-1e5ce0216495,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:cf0c192e-1756-4fa3-be7f-474a6e4be921,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 6056e953faa44dc5a1cf126a15166026-20220627
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 203041587; Mon, 27 Jun 2022 10:55:58 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 10:55:57 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 10:55:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 10:55:55 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        <angelogioacchino.delregno@collabora.com>,
        <nicolas.dufresne@collabora.com>, <wenst@chromium.org>
CC:     <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Tomasz Figa <tfiga@chromium.org>, <xia.jiang@mediatek.com>,
        <maoguang.meng@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: [V4,6/8] media: mtk-jpegdec: add output pic reorder interface
Date:   Mon, 27 Jun 2022 10:55:38 +0800
Message-ID: <20220627025540.8901-7-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627025540.8901-1-irui.wang@mediatek.com>
References: <20220627025540.8901-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: kyrie wu <kyrie.wu@mediatek.com>

add output reorder func to reorder the output images
to ensure the output pic is consistent with the input images.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 49 ++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index a8d63242ea8f..ea2dca88aae7 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -440,6 +440,51 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_dec_set_config);
 
+static void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
+	struct vb2_v4l2_buffer *dst_buffer;
+	struct list_head *temp_entry;
+	struct list_head *pos = NULL;
+	struct mtk_jpeg_ctx *ctx;
+	unsigned long flags;
+
+	ctx = jpeg->hw_param.curr_ctx;
+	if (unlikely(!ctx)) {
+		dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
+		return;
+	}
+
+	dst_buffer = jpeg->hw_param.dst_buffer;
+	if (!dst_buffer) {
+		dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
+		return;
+	}
+
+	dst_done_buf = container_of(dst_buffer, struct mtk_jpeg_src_buf, b);
+
+	spin_lock_irqsave(&ctx->done_queue_lock, flags);
+	list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
+	while (!list_empty(&ctx->dst_done_queue) &&
+	       (pos != &ctx->dst_done_queue)) {
+		list_for_each_prev_safe(pos,
+					temp_entry,
+					(&ctx->dst_done_queue)) {
+			tmp_dst_done_buf = list_entry(pos,
+						      struct mtk_jpeg_src_buf,
+						      list);
+			if (tmp_dst_done_buf->frame_num ==
+				ctx->last_done_frame_num) {
+				list_del(&tmp_dst_done_buf->list);
+				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
+						  VB2_BUF_STATE_DONE);
+				ctx->last_done_frame_num++;
+			}
+		}
+	}
+	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
+}
+
 static void mtk_jpegdec_timeout_work(struct work_struct *work)
 {
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
@@ -460,7 +505,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	atomic_inc(&master_jpeg->dechw_rdy);
 	wake_up(&master_jpeg->dec_hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
-	v4l2_m2m_buf_done(dst_buf, buf_state);
+	mtk_jpegdec_put_buf(cjpeg);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -503,7 +548,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 irq_handled:
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
-	v4l2_m2m_buf_done(dst_buf, buf_state);
+	mtk_jpegdec_put_buf(jpeg);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
-- 
2.18.0

