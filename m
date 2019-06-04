Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85BE0343F3
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfFDKNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:13:02 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54058 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727258AbfFDKMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:14 -0400
X-UUID: 01d1ab16a8cf47b3b1f4c1755a56206e-20190604
X-UUID: 01d1ab16a8cf47b3b1f4c1755a56206e-20190604
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1987726043; Tue, 04 Jun 2019 18:12:02 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 4 Jun 2019 18:12:02 +0800
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
Subject: [PATCH v4 12/14] [media] mtk-mipicsi: add debug message for mipicsi driver
Date:   Tue, 4 Jun 2019 18:11:53 +0800
Message-ID: <1559643115-15124-13-git-send-email-stu.hsieh@mediatek.com>
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

This patch add debug message for mipicsi driver.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index aaaea5c6f280..b291c95bbf0e 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -25,6 +25,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/moduleparam.h>
+#include <linux/time64.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
@@ -109,6 +110,15 @@
 
 #define notifier_to_mipicsi(n) container_of(n, struct mtk_mipicsi_dev, \
 					    notifier)
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
@@ -168,6 +178,8 @@ struct mtk_mipicsi_dev {
 	u8 link_reg_val;
 	char drv_name[16];
 	u32 id;
+	struct timespec64 fps_time_cur;
+	struct timespec64 fps_time_pre;
 
 	spinlock_t		irqlock;
 	spinlock_t		queue_lock;
@@ -535,6 +547,11 @@ static int mtk_mipicsi_vb2_prepare(struct vb2_buffer *vb)
 		buf->prepare_flag = 1;
 		buf->vb_dma_addr_phy =
 			vb2_dma_contig_plane_dma_addr(vb, 0);
+
+		mtk_mipicsi_dbg(1, "vb_dma_addr_phy=%lx size=%d",
+			(unsigned long)buf->vb_dma_addr_phy,
+			vb->planes[0].bytesused);
+
 		buf->vb = vb;
 	}
 
@@ -581,6 +598,8 @@ static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 		mtk_mipicsi_write_camsv(mipicsi, vb->index, mipicsi->camsv_num);
 
 	spin_unlock(&mipicsi->irqlock);
+
+	mtk_mipicsi_dbg(2, "enqueue NO.%d buffer(%p).", vb->index, vb);
 }
 
 static void mtk_mipicsi_cmos_vf_enable(struct mtk_mipicsi_dev *mipicsi,
@@ -888,6 +907,7 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	struct mtk_mipicsi_buf *tmp = NULL;
 	unsigned int index = 0;
 	unsigned int next = 0;
+	long time_interval;
 
 	for (i = 0; i < mipicsi->camsv_num; ++i)
 		ch[i].irq_status = false;
@@ -895,8 +915,10 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 	i = 0;
 
 	/* only one buffer left */
-	if ((&(mipicsi->fb_list))->next->next == &(mipicsi->fb_list))
+	if ((&(mipicsi->fb_list))->next->next == &(mipicsi->fb_list)) {
+		mtk_mipicsi_dbg(1, "only 1 buffer left, drop frame");
 		return;
+	}
 
 	/*for each fb_lst 2 times to get the top 2 buffer.*/
 	list_for_each_entry_safe(new_cam_buf, tmp,
@@ -920,6 +942,21 @@ static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
 		VB2_BUF_STATE_DONE);
 
 	list_del_init(&(mipicsi->cam_buf[index].queue));
+
+	if (mtk_mipicsi_dbg_level >= 2) {
+		ktime_get_real_ts64(&(mipicsi->fps_time_cur));
+
+		time_interval = (mipicsi->fps_time_cur.tv_sec
+			- mipicsi->fps_time_pre.tv_sec) * 1000000000
+			+ (mipicsi->fps_time_cur.tv_nsec
+			- mipicsi->fps_time_pre.tv_nsec);
+		mtk_mipicsi_dbg(0, "time interval is %ld\n",
+			time_interval);
+		mipicsi->fps_time_pre.tv_sec =
+			mipicsi->fps_time_cur.tv_sec;
+		mipicsi->fps_time_pre.tv_nsec =
+			mipicsi->fps_time_cur.tv_nsec;
+	}
 }
 
 static irqreturn_t mtk_mipicsi_isr(int irq, void *data)
@@ -1575,5 +1612,6 @@ static struct platform_driver mtk_mipicsi_driver = {
 };
 
 module_platform_driver(mtk_mipicsi_driver);
+module_param(mtk_mipicsi_dbg_level, int, 0644);
 MODULE_DESCRIPTION("MediaTek SoC Camera Host driver");
 MODULE_LICENSE("GPL v2");
-- 
2.18.0

