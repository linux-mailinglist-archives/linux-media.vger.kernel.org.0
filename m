Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76ECA343FC
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfFDKNS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:13:18 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:21251 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727107AbfFDKMN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:13 -0400
X-UUID: 62a2ad958e424d779cde763c8a056289-20190604
X-UUID: 62a2ad958e424d779cde763c8a056289-20190604
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1540687792; Tue, 04 Jun 2019 18:12:02 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v4 08/14] [media] mtk-mipicsi: enable/disable cmos for mt2712
Date:   Tue, 4 Jun 2019 18:11:49 +0800
Message-ID: <1559643115-15124-9-git-send-email-stu.hsieh@mediatek.com>
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

This patch enable/disable cmos setting for mt2712 when
streaming start/stop streaming.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index ea1edbc6401b..8bb40656bcb1 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -88,9 +88,11 @@
 #define CAMSV_MODULE_EN					0x10
 #define CAMSV_FMT_SEL					0x14
 #define CAMSV_INT_EN					0x18
+#define CAMSV_SW_CTL					0x20
 #define CAMSV_CLK_EN					0x30
 
 #define CAMSV_TG_SEN_MODE				0x500
+#define CAMSV_TG_VF_CON					0x504
 #define CAMSV_TG_SEN_GRAB_PXL				0x508
 #define CAMSV_TG_SEN_GRAB_LIN				0x50C
 #define CAMSV_TG_PATH_CFG				0x510
@@ -541,11 +543,41 @@ static void mtk_mipicsi_vb2_queue(struct vb2_buffer *vb)
 	spin_unlock(&mipicsi->queue_lock);
 }
 
+static void mtk_mipicsi_cmos_vf_enable(struct mtk_mipicsi_dev *mipicsi,
+				       unsigned int max_camsv_num,
+				       bool enable)
+{
+	void __iomem *base = NULL;
+	u32 mask = enable ? (u32)1 : ~(u32)1;
+	int i;
+
+	for (i = 0; i < max_camsv_num; i++)
+		if (((mipicsi->link_reg_val >> i) & 0x01U) == 0x01U) {
+			if (enable) {
+				/*enable cmos_en and vf_en*/
+				base = mipicsi->camsv[i];
+				writel(readl(base + CAMSV_TG_SEN_MODE) | mask,
+				       base + CAMSV_TG_SEN_MODE);
+				writel(readl(base + CAMSV_TG_VF_CON) | mask,
+				       base + CAMSV_TG_VF_CON);
+			} else {
+				/*disable cmos_en and vf_en*/
+				base = mipicsi->camsv[i];
+				writel(readl(base + CAMSV_TG_SEN_MODE) & mask,
+					base + CAMSV_TG_SEN_MODE);
+				writel(readl(base + CAMSV_TG_VF_CON) & mask,
+					base + CAMSV_TG_VF_CON);
+			}
+		}
+}
+
 static int mtk_mipicsi_vb2_start_streaming(struct vb2_queue *vq,
 		unsigned int count)
 {
 	struct mtk_mipicsi_dev *mipicsi = vb2_get_drv_priv(vq);
 
+	mtk_mipicsi_cmos_vf_enable(mipicsi, mipicsi->camsv_num, true);
+
 	mipicsi->streamon = true;
 
 	return 0;
@@ -558,6 +590,8 @@ static void mtk_mipicsi_vb2_stop_streaming(struct vb2_queue *vq)
 	struct mtk_mipicsi_buf *tmp = NULL;
 	unsigned int index = 0;
 
+	mtk_mipicsi_cmos_vf_enable(mipicsi, mipicsi->camsv_num, false);
+
 	spin_lock(&mipicsi->queue_lock);
 	while (list_empty(&(mipicsi->fb_list)) == 0) {
 		list_for_each_entry_safe(buf, tmp, &(mipicsi->fb_list), queue) {
-- 
2.18.0

