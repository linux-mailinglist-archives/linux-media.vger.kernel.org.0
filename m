Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A20A1C2E0
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 08:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfENGOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 02:14:10 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46762 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726142AbfENGOK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 02:14:10 -0400
X-UUID: 0f261fea4cbd446ab2fdaceb9c9dac9a-20190514
X-UUID: 0f261fea4cbd446ab2fdaceb9c9dac9a-20190514
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1627965337; Tue, 14 May 2019 14:13:56 +0800
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
Subject: [PATCH v3 12/13] [media] mtk-mipicsi: add debug message for mipicsi driver
Date:   Tue, 14 May 2019 14:13:49 +0800
Message-ID: <1557814430-9675-13-git-send-email-stu.hsieh@mediatek.com>
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

This patch add debug message for mipicsi driver.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 58 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 1b885de6d990..c1cbeb3c60e1 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -28,6 +28,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/moduleparam.h>
+#include <linux/time64.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
@@ -114,6 +115,15 @@
 
 #define SerDes_support 1
 
+static int mtk_mipicsi_dbg_level;
+#define mtk_mipicsi_dbg(level, fmt, args...)				 \
+	do {								 \
+		if (mtk_mipicsi_dbg_level >= level)			\
+			pr_info("[MTK_MIPICSI%d] L%d %s %d: " fmt "\n", \
+				mipicsi->id, level,  __func__, __LINE__, \
+				##args);	\
+	} while (0)
+
 /* buffer for one video frame */
 struct mtk_mipicsi_buf {
 	struct list_head queue;
@@ -145,6 +155,9 @@ struct mtk_mipicsi_dev {
 	unsigned int link;
 	u8 link_reg_val;
 	unsigned long enqueue_cnt;
+	unsigned long dequeue_cnt;
+	struct timespec64 fps_time_cur;
+	struct timespec64 fps_time_pre;
 	char drv_name[16];
 	u32 id;
 	int clk_num;
@@ -390,6 +403,8 @@ static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
 
 	mipicsi->width = width;
 	mipicsi->height = height;
+	mtk_mipicsi_dbg(1, "sub device width/height/bytesperline %d/%d/%d",
+		width, height, mipicsi->bytesperline);
 
 	/*
 	 * If power domain was closed before, it will be open.
@@ -527,6 +542,9 @@ static int mtk_mipicsi_set_fmt(struct soc_camera_device *icd,
 	if (pix->pixelformat == V4L2_PIX_FMT_YUYV)
 		pix->sizeimage = pix->width * pix->height * 2U;
 
+	mtk_mipicsi_dbg(0, "width/height/sizeimage %u/%u/%u",
+		pix->width, pix->height, pix->sizeimage);
+
 	if (mf->code != xlate->code)
 		return -EINVAL;
 
@@ -647,6 +665,9 @@ static int mtk_mipicsi_vb2_prepare(struct vb2_buffer *vb)
 		buf->vb_dma_addr_phy =
 			vb2_dma_contig_plane_dma_addr(vb, 0);
 		va = vb2_plane_vaddr(vb, 0);
+		mtk_mipicsi_dbg(1, "va=%p vb_dma_addr_phy=%lx size=%d",
+			va, (unsigned long)buf->vb_dma_addr_phy,
+			vb->planes[0].bytesused);
 		buf->vb = vb;
 	}
 
@@ -692,6 +713,8 @@ static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 		}
 
 	++(mipicsi->enqueue_cnt);
+	mtk_mipicsi_dbg(2, "enqueue NO.%d buffer(%p). Total %lu buffer",
+		vb->index, vb, mipicsi->enqueue_cnt);
 }
 
 static int mtk_mipicsi_vb2_start_streaming(struct vb2_queue *vq,
@@ -770,6 +793,7 @@ static void mtk_mipicsi_vb2_stop_streaming(struct vb2_queue *vq)
 	INIT_LIST_HEAD(&(mipicsi->fb_list));
 
 	mipicsi->enqueue_cnt = 0UL;
+	mipicsi->dequeue_cnt = 0UL;
 }
 
 static struct vb2_ops mtk_vb2_ops = {
@@ -1064,8 +1088,10 @@ static int mtk_mipicsi_pm_resume(struct device *dev)
 
 	if (mipicsi->larb_pdev != NULL) {
 		ret = mtk_smi_larb_get(mipicsi->larb_pdev);
-		if (ret != 0)
+		if (ret != 0) {
+			mtk_mipicsi_dbg(0, "failed to get larb, err %d", ret);
 			return ret;
+		}
 	}
 
 	mtk_mipicsi_ana_clk_enable(mipicsi->ana, true);
@@ -1115,6 +1141,7 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	unsigned int next = 0U;
 	u64 offset = 0ULL;
 	u8 link_index = 0U;
+	long time_interval;
 	void __iomem *base = NULL;
 	dma_addr_t pa;
 
@@ -1124,8 +1151,10 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	i = 0;
 
 	/* only one buffer left */
-	if ((&(mipicsi->fb_list))->next->next == &(mipicsi->fb_list))
+	if ((&(mipicsi->fb_list))->next->next == &(mipicsi->fb_list)) {
+		mtk_mipicsi_dbg(1, "only 1 buffer left, drop frame");
 		return;
+	}
 
 	/*for each fb_lst 2 times to get the top 2 buffer.*/
 	list_for_each_entry_safe(new_cam_buf, tmp,
@@ -1155,8 +1184,30 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	 */
 	vb2_buffer_done(mipicsi->cam_buf[index].vb,
 		VB2_BUF_STATE_DONE);
+	++(mipicsi->dequeue_cnt);
 
 	list_del_init(&(mipicsi->cam_buf[index].queue));
+
+	if (mtk_mipicsi_dbg_level >= 2) {
+		ktime_get_real_ts64(&(mipicsi->fps_time_cur));
+		if (mipicsi->dequeue_cnt == 1) {
+			mipicsi->fps_time_pre.tv_sec =
+				mipicsi->fps_time_cur.tv_sec;
+			mipicsi->fps_time_pre.tv_nsec =
+				mipicsi->fps_time_cur.tv_nsec;
+		} else {
+			time_interval = (mipicsi->fps_time_cur.tv_sec
+				- mipicsi->fps_time_pre.tv_sec) * 1000000000
+				+ (mipicsi->fps_time_cur.tv_nsec
+				- mipicsi->fps_time_pre.tv_nsec);
+			mtk_mipicsi_dbg(0, "time interval is %ld\n",
+				time_interval);
+			mipicsi->fps_time_pre.tv_sec =
+				mipicsi->fps_time_cur.tv_sec;
+			mipicsi->fps_time_pre.tv_nsec =
+				mipicsi->fps_time_cur.tv_nsec;
+		}
+	}
 }
 
 static irqreturn_t mtk_mipicsi_isr(int irq, void *data)
@@ -1171,6 +1222,7 @@ static irqreturn_t mtk_mipicsi_isr(int irq, void *data)
 
 	isr_ch = get_irq_channel(mipicsi);
 	if (isr_ch < 0) {
+		mtk_mipicsi_dbg(0, "no interrupt occur");
 		spin_unlock_irqrestore(&mipicsi->lock, flags);
 		return IRQ_HANDLED;
 	}
@@ -1461,6 +1513,7 @@ static int mtk_mipicsi_probe(struct platform_device *pdev)
 	spin_lock_init(&mipicsi->queue_lock);
 	spin_lock_init(&mipicsi->lock);
 	mipicsi->enqueue_cnt = 0UL;
+	mipicsi->dequeue_cnt = 0UL;
 
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32U));
 	if (ret != 0) {
@@ -1504,5 +1557,6 @@ static struct platform_driver mtk_mipicsi_driver = {
 };
 
 module_platform_driver(mtk_mipicsi_driver);
+module_param(mtk_mipicsi_dbg_level, int, 0644);
 MODULE_DESCRIPTION("MediaTek SoC Camera Host driver");
 MODULE_LICENSE("GPL v2");
-- 
2.18.0

