Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0DD3343EF
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 12:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfFDKNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 06:13:02 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:42698 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727256AbfFDKMO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 06:12:14 -0400
X-UUID: 507e439b8181492fba6365cbd70071ab-20190604
X-UUID: 507e439b8181492fba6365cbd70071ab-20190604
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 767814066; Tue, 04 Jun 2019 18:12:06 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
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
Subject: [PATCH v4 07/14] [media] mtk-mipicsi: add function to get the number of subdev link
Date:   Tue, 4 Jun 2019 18:11:48 +0800
Message-ID: <1559643115-15124-8-git-send-email-stu.hsieh@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F8EDD96C39312300CC9BE38EF59A9647DED5B847D22FF143A7A139D6D6217F8D2000:8
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch add function to get subdev link.

Mt2712 can serve at most four camera link for each mipicsi port.
The number of link according to the value which is
defined in dts, the string is "mediatek,mipicsi_max_vc".
This value "max_vc" is the number of subdev link.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index f5cb29077022..ea1edbc6401b 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -120,6 +120,7 @@ struct mtk_mipicsi_subdev {
 	struct device_node *node;
 	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *subdev;
+	unsigned int max_vc;
 };
 
 struct mtk_mipicsi_channel {
@@ -153,6 +154,8 @@ struct mtk_mipicsi_dev {
 	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
 	struct list_head	fb_list;
 	bool streamon;
+	unsigned int link;
+	u8 link_reg_val;
 	char drv_name[16];
 	u32 id;
 
@@ -182,6 +185,25 @@ static const struct mtk_format mtk_mipicsi_formats[] = {
 },
 };
 
+static int get_subdev_link(struct mtk_mipicsi_dev *mipicsi,
+	unsigned int *link, u8 *link_reg_val)
+{
+	struct device *dev = &mipicsi->pdev->dev;
+	struct mtk_mipicsi_subdev *sd = &mipicsi->mipicsi_sd;
+
+	if (sd->max_vc == 1) {
+		*link = 1;
+		*link_reg_val = 0x1;
+		dev_info(dev, "mtk mipicsi support 1 channel\n");
+
+		return 0;
+	}
+
+	dev_info(dev, "mtk mipicsi support %d channel\n", sd->max_vc);
+
+	return 0;
+}
+
 static void mtk_mipicsi_ana_clk_enable(void __iomem *base, bool enable)
 {
 	if (enable) {
@@ -877,6 +899,7 @@ static int mtk_mipicsi_node_parse(struct mtk_mipicsi_dev *mipicsi)
 	struct resource *res = NULL;
 	struct device_node *common_node = NULL;
 	struct platform_device *pdev = NULL;
+	struct mtk_mipicsi_subdev *sd = &mipicsi->mipicsi_sd;
 
 	dev = &mipicsi->pdev->dev;
 	pdev = mipicsi->pdev;
@@ -891,6 +914,14 @@ static int mtk_mipicsi_node_parse(struct mtk_mipicsi_dev *mipicsi)
 	(void)sprintf(mipicsi->drv_name, MTK_MIPICSI_DRV_NAME"%d",
 		mipicsi->id);
 
+	/*get the number of virtual channel*/
+	ret = of_property_read_u32(dev->of_node, "mediatek,mipicsi_max_vc",
+				   &sd->max_vc);
+	if (ret != 0) {
+		dev_info(dev, "not set mediatek,mipicsi_max_vc, use default value 1\n");
+		sd->max_vc = 1;
+	}
+
 	/* get and parse seninf_mux_camsv */
 	camsv_num = of_count_phandle_with_args(dev->of_node,
 		"mediatek,seninf_mux_camsv", NULL);
@@ -1165,6 +1196,8 @@ static int mtk_mipicsi_open(struct file *file)
 	if (ret)
 		v4l2_subdev_call(sd, core, s_power, 0);
 
+	get_subdev_link(mipicsi, &mipicsi->link, &mipicsi->link_reg_val);
+
 	pm_runtime_get_sync(&mipicsi->pdev->dev);
 
 fh_rel:
-- 
2.18.0

