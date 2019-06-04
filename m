Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58345343C8
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfFDKML (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:12:11 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:13010 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727167AbfFDKMJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:09 -0400
X-UUID: 5904d1d7544a4135bf5ae6706ff78b22-20190604
X-UUID: 5904d1d7544a4135bf5ae6706ff78b22-20190604
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1181666245; Tue, 04 Jun 2019 18:12:02 +0800
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
Subject: [PATCH v4 09/14] [media] mtk-mipicsi: add ISR for writing the data to buffer
Date:   Tue, 4 Jun 2019 18:11:50 +0800
Message-ID: <1559643115-15124-10-git-send-email-stu.hsieh@mediatek.com>
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

This patch add ISR for writing the data to buffer

When mipicsi HW complete to write the data in buffer,
the interrupt woulb be trigger.
So, the ISR need to clear interrupt status for next interrupt.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 122 +++++++++++++++++-
 1 file changed, 120 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 8bb40656bcb1..dc5c5c888914 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -34,6 +34,7 @@
 #include <linux/iommu.h>
 #include <linux/of_graph.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
@@ -88,6 +89,8 @@
 #define CAMSV_MODULE_EN					0x10
 #define CAMSV_FMT_SEL					0x14
 #define CAMSV_INT_EN					0x18
+#define CAMSV_INT_STATUS				0x1C
+#define PASS1_DONE_STATUS				10
 #define CAMSV_SW_CTL					0x20
 #define CAMSV_CLK_EN					0x30
 
@@ -129,6 +132,8 @@ struct mtk_mipicsi_channel {
 	void __iomem            *seninf_mux;
 	void __iomem            *camsv;
 	struct clk		*clk;
+	unsigned int		irq;
+	bool			irq_status;
 };
 
 struct mtk_mipicsi_dev {
@@ -547,26 +552,31 @@ static void mtk_mipicsi_cmos_vf_enable(struct mtk_mipicsi_dev *mipicsi,
 				       unsigned int max_camsv_num,
 				       bool enable)
 {
+	struct mtk_mipicsi_channel *ch = mipicsi->channel;
 	void __iomem *base = NULL;
 	u32 mask = enable ? (u32)1 : ~(u32)1;
 	int i;
 
 	for (i = 0; i < max_camsv_num; i++)
 		if (((mipicsi->link_reg_val >> i) & 0x01U) == 0x01U) {
+			base = ch[i].camsv;
 			if (enable) {
+				enable_irq(ch[i].irq);
+
 				/*enable cmos_en and vf_en*/
-				base = mipicsi->camsv[i];
 				writel(readl(base + CAMSV_TG_SEN_MODE) | mask,
 				       base + CAMSV_TG_SEN_MODE);
 				writel(readl(base + CAMSV_TG_VF_CON) | mask,
 				       base + CAMSV_TG_VF_CON);
 			} else {
 				/*disable cmos_en and vf_en*/
-				base = mipicsi->camsv[i];
 				writel(readl(base + CAMSV_TG_SEN_MODE) & mask,
 					base + CAMSV_TG_SEN_MODE);
 				writel(readl(base + CAMSV_TG_VF_CON) & mask,
 					base + CAMSV_TG_VF_CON);
+
+				disable_irq(ch[i].irq);
+				ch[i].irq_status = false;
 			}
 		}
 }
@@ -820,9 +830,100 @@ static const struct v4l2_ioctl_ops mtk_mipicsi_ioctl_ops = {
 	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
 };
 
+static int get_irq_channel(struct mtk_mipicsi_dev *mipicsi)
+{
+	struct mtk_mipicsi_channel *ch = mipicsi->channel;
+	int i;
+	u32 int_reg_val;
+
+	for (i = 0; i < mipicsi->camsv_num; i++) {
+		int_reg_val = readl(ch[i].camsv + CAMSV_INT_STATUS);
+		if ((int_reg_val & (1 << PASS1_DONE_STATUS)) != 0)
+			return i;
+	}
+
+	return -1;
+}
+
+static void mtk_mipicsi_irq_buf_process(struct mtk_mipicsi_dev *mipicsi)
+{
+	struct mtk_mipicsi_channel *ch = mipicsi->channel;
+	unsigned int i = 0;
+	struct mtk_mipicsi_buf *new_cam_buf = NULL;
+	struct mtk_mipicsi_buf *tmp = NULL;
+	unsigned int index = 0;
+	unsigned int next = 0;
+
+	for (i = 0; i < mipicsi->camsv_num; ++i)
+		ch[i].irq_status = false;
+
+	i = 0;
+
+	/* only one buffer left */
+	if ((&(mipicsi->fb_list))->next->next == &(mipicsi->fb_list))
+		return;
+
+	/*for each fb_lst 2 times to get the top 2 buffer.*/
+	list_for_each_entry_safe(new_cam_buf, tmp,
+		&(mipicsi->fb_list), queue) {
+		if (i == 0) {
+			index = new_cam_buf->vb->index;
+		} else {
+			next = new_cam_buf->vb->index;
+			break;
+		}
+		++i;
+	}
+
+	/*
+	 * fb_list has one more buffer. Free the first buffer to user
+	 * and fill the second buffer to HW.
+	 */
+	vb2_buffer_done(mipicsi->cam_buf[index].vb,
+		VB2_BUF_STATE_DONE);
+
+	list_del_init(&(mipicsi->cam_buf[index].queue));
+}
+
+static irqreturn_t mtk_mipicsi_isr(int irq, void *data)
+{
+	struct mtk_mipicsi_dev *mipicsi = data;
+	struct device *dev = &mipicsi->pdev->dev;
+	struct mtk_mipicsi_channel *ch = mipicsi->channel;
+	unsigned long flags = 0;
+	int isr_ch;
+	u8 irq_cnt = 0, i = 0;
+
+	spin_lock_irqsave(&mipicsi->irqlock, flags);
+
+	isr_ch = get_irq_channel(mipicsi);
+	if (isr_ch < 0) {
+		dev_info(dev, "no interrupt occur");
+		spin_unlock_irqrestore(&mipicsi->irqlock, flags);
+		return IRQ_HANDLED;
+	}
+
+	/* clear interrupt */
+	writel(1UL << PASS1_DONE_STATUS,
+		ch[isr_ch].camsv + CAMSV_INT_STATUS);
+	ch[isr_ch].irq_status = true;
+	for (i = 0U; i < mipicsi->camsv_num; ++i) {
+		if (ch[i].irq_status)
+			++irq_cnt;
+	}
+
+	if (irq_cnt == mipicsi->link)
+		mtk_mipicsi_irq_buf_process(mipicsi);
+	spin_unlock_irqrestore(&mipicsi->irqlock, flags);
+
+	return IRQ_HANDLED;
+}
+
 static int seninf_mux_camsv_node_parse(struct mtk_mipicsi_dev *mipicsi,
 		int index)
 {
+	int ret;
+	int irq;
 	struct clk *clk = NULL;
 	struct device *dev = NULL;
 	struct resource *res = NULL;
@@ -854,6 +955,23 @@ static int seninf_mux_camsv_node_parse(struct mtk_mipicsi_dev *mipicsi,
 	}
 	ch[index].clk = clk;
 
+	irq = of_irq_get(np, 0);
+	if (irq <= 0) {
+		dev_err(dev, "get irq fail in %s node\n", np->full_name);
+		return -ENODEV;
+	}
+	ch[index].irq = irq;
+
+	ret = devm_request_irq(dev, irq,
+			mtk_mipicsi_isr, 0,
+			mipicsi->drv_name, mipicsi);
+	if (ret != 0) {
+		dev_err(dev, "%s irq register failed\n", np->full_name);
+		return -ENODEV;
+	}
+	disable_irq(ch[index].irq);
+	ch[index].irq_status = false;
+
 	res = platform_get_resource(camdma_pdev, IORESOURCE_MEM, 0);
 	if (res == NULL) {
 		dev_err(dev, "get seninf_mux memory failed in %s node\n",
-- 
2.18.0

