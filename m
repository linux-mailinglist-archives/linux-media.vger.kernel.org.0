Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11260343F8
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfFDKMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:12:12 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:16528 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727110AbfFDKMI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:08 -0400
X-UUID: 913cc3a306454d96b3044610a02c493d-20190604
X-UUID: 913cc3a306454d96b3044610a02c493d-20190604
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1893859149; Tue, 04 Jun 2019 18:12:02 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Jun 2019 18:12:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 4 Jun 2019 18:12:01 +0800
From:   Stu Hsieh <stu.hsieh@mediatek.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stu Hsieh <stu.hsieh@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v4 10/14] [media] mtk-mipicsi: set the output address in HW reg
Date:   Tue, 4 Jun 2019 18:11:51 +0800
Message-ID: <1559643115-15124-11-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch set the output address in HW reg when buffer queue and ISR.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index dc5c5c888914..9e45786a0282 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -100,6 +100,7 @@
 #define CAMSV_TG_SEN_GRAB_LIN				0x50C
 #define CAMSV_TG_PATH_CFG				0x510
 
+#define IMGO_BASE_ADDR					0x220
 #define IMGO_XSIZE					0x230
 #define IMGO_YSIZE					0x234
 #define IMGO_STRIDE					0x238
@@ -538,6 +539,32 @@ static int mtk_mipicsi_vb2_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
+static void mtk_mipicsi_fill_buffer(void __iomem *base, dma_addr_t dma_handle)
+{
+	writel(dma_handle, base + IMGO_BASE_ADDR);
+}
+
+static void mtk_mipicsi_write_camsv(struct mtk_mipicsi_dev *mipicsi,
+				    unsigned int index,
+				    unsigned int max_camsv_num)
+{
+	struct mtk_mipicsi_channel *ch = mipicsi->channel;
+	unsigned int i = 0;
+	u8 link_index = 0;
+	u32 bytesperline = mipicsi->fmt.fmt.pix.bytesperline;
+	u32 height = mipicsi->fmt.fmt.pix.height;
+	u64 offset = 0;
+
+	for (i = 0; i < max_camsv_num; i++)
+		if (((mipicsi->link_reg_val >> i) & 0x01) == 0x01) {
+			offset = (u64)link_index * bytesperline * height;
+			mtk_mipicsi_fill_buffer(ch[i].camsv,
+				mipicsi->cam_buf[index].vb_dma_addr_phy
+					+ offset);
+			link_index++;
+		}
+}
+
 static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 {
 	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vb->vb2_queue);
@@ -546,6 +573,12 @@ static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 	list_add_tail(&(mipicsi->cam_buf[vb->index].queue),
 		&(mipicsi->fb_list));
 	spin_unlock(&mipicsi->queue_lock);
+
+	spin_lock(&mipicsi->irqlock);
+	if (!mipicsi->streamon)
+		mtk_mipicsi_write_camsv(mipicsi, vb->index, mipicsi->camsv_num);
+
+	spin_unlock(&mipicsi->irqlock);
 }
 
 static void mtk_mipicsi_cmos_vf_enable(struct mtk_mipicsi_dev *mipicsi,
@@ -875,6 +908,8 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 		++i;
 	}
 
+	mtk_mipicsi_write_camsv(mipicsi, next, mipicsi->camsv_num);
+
 	/*
 	 * fb_list has one more buffer. Free the first buffer to user
 	 * and fill the second buffer to HW.
-- 
2.18.0

