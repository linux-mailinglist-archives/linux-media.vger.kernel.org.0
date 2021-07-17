Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C043CC1CE
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 10:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbhGQIPn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 04:15:43 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:47780 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232303AbhGQIPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 04:15:40 -0400
X-UUID: 4dd135ae766743b19cdebef306dfafa7-20210717
X-UUID: 4dd135ae766743b19cdebef306dfafa7-20210717
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 570957547; Sat, 17 Jul 2021 16:12:39 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 16:12:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 16:12:36 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 01/14] media: mtk-vcodec: Get numbers of register bases from DT
Date:   Sat, 17 Jul 2021 16:12:20 +0800
Message-ID: <20210717081233.7809-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717081233.7809-1-yunfei.dong@mediatek.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Different platform may has different numbers of register bases. Gets the
numbers of register bases from DT (sizeof(u32) * 4 bytes for each).

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v2: no changes
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 38 ++++++++++++++-----
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 55ae198dbcf9..d3f34cd04759 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -78,6 +78,31 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int reg_num, i, ret = 0;
+
+	/* Sizeof(u32) * 4 bytes for each register base. */
+	reg_num = of_property_count_elems_of_size(pdev->dev.of_node, "reg",
+		sizeof(u32) * 4);
+	if (!reg_num || reg_num > NUM_MAX_VDEC_REG_BASE) {
+		dev_err(&pdev->dev, "Invalid register property size: %d\n", reg_num);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < reg_num; i++) {
+		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR((__force void *)dev->reg_base[i])) {
+			ret = PTR_ERR((__force void *)dev->reg_base[i]);
+			break;
+		}
+		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
+	}
+
+	return ret;
+}
+
 static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
@@ -206,7 +231,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct resource *res;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
-	int i, ret;
+	int ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -238,14 +263,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_dec_pm;
 	}
 
-	for (i = 0; i < NUM_MAX_VDEC_REG_BASE; i++) {
-		dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
-		if (IS_ERR((__force void *)dev->reg_base[i])) {
-			ret = PTR_ERR((__force void *)dev->reg_base[i]);
-			goto err_res;
-		}
-		mtk_v4l2_debug(2, "reg[%d] base=%p", i, dev->reg_base[i]);
-	}
+	ret = mtk_vcodec_get_reg_bases(dev);
+	if (ret)
+		goto err_res;
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (res == NULL) {
-- 
2.25.1

