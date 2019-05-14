Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1791C318
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 08:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfENGPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 02:15:19 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:16842 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726347AbfENGOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 02:14:07 -0400
X-UUID: 31563ad590f64cd3a9adb8a36aec06ad-20190514
X-UUID: 31563ad590f64cd3a9adb8a36aec06ad-20190514
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 678261910; Tue, 14 May 2019 14:13:56 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 May 2019 14:13:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 14:13:55 +0800
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
Subject: [PATCH v3 10/13] [media] mtk-mipicsi: set the output address in HW reg
Date:   Tue, 14 May 2019 14:13:47 +0800
Message-ID: <1557814430-9675-11-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
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
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index af5655345754..cf46fcd01a19 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -105,6 +105,7 @@
 #define CAMSV_TG_SEN_GRAB_LIN				0x50C
 #define CAMSV_TG_PATH_CFG				0x510
 
+#define IMGO_BASE_ADDR					0x220
 #define IMGO_XSIZE					0x230
 #define IMGO_YSIZE					0x234
 #define IMGO_STRIDE					0x238
@@ -503,12 +504,22 @@ static int mtk_mipicsi_vb2_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
+static void mtk_mipicsi_fill_buffer(void __iomem *base, dma_addr_t dma_handle)
+{
+	writel(dma_handle, base + IMGO_BASE_ADDR);
+}
+
 static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 {
 	struct soc_camera_device *icd = soc_camera_from_vb2q(vb->vb2_queue);
 	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
 	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+	unsigned int i = 0;
+	u64 offset = 0;
+	u8 link_index = 0U;
 	char *va = NULL;
+	u32 bytesperline = mipicsi->bytesperline;
+	u32 height = mipicsi->height;
 
 	spin_lock(&mipicsi->queue_lock);
 	list_add_tail(&(mipicsi->cam_buf[vb->index].queue),
@@ -517,6 +528,20 @@ static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 
 	va = vb2_plane_vaddr(vb, 0);
 
+	for (i = 0U; (mipicsi->enqueue_cnt == 0UL) && (i < MTK_CAMDMA_MAX_NUM);
+		++i)
+		if (((mipicsi->link_reg_val >> i) & 0x01U) == 0x01U) {
+			offset = (u64)link_index * bytesperline * height;
+
+			spin_lock(&mipicsi->lock);
+			mtk_mipicsi_fill_buffer(mipicsi->camsv[i],
+				mipicsi->cam_buf[vb->index].vb_dma_addr_phy
+					+ offset);
+			spin_unlock(&mipicsi->lock);
+
+			link_index++;
+		}
+
 	++(mipicsi->enqueue_cnt);
 }
 
@@ -938,6 +963,10 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	struct mtk_mipicsi_buf *tmp = NULL;
 	unsigned int index = 0U;
 	unsigned int next = 0U;
+	u64 offset = 0ULL;
+	u8 link_index = 0U;
+	void __iomem *base = NULL;
+	dma_addr_t pa;
 
 	for (i = 0U; i < MTK_CAMDMA_MAX_NUM; ++i)
 		mipicsi->irq_status[i] = false;
@@ -960,6 +989,16 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 		++i;
 	}
 
+	for (i = 0U; i < MTK_CAMDMA_MAX_NUM; ++i) {
+		if (((mipicsi->link_reg_val >> i) & 0x01U) == 0x01U) {
+			offset = (u64)link_index *
+				mipicsi->bytesperline * mipicsi->height;
+			base = mipicsi->camsv[i];
+			pa = mipicsi->cam_buf[next].vb_dma_addr_phy;
+			mtk_mipicsi_fill_buffer(base, pa + offset);
+			link_index++;
+		}
+	}
 	/*
 	 * fb_list has one more buffer. Free the first buffer to user
 	 * and fill the second buffer to HW.
-- 
2.18.0

