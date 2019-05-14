Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 525B81C2F7
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 08:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbfENGOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 02:14:04 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:37599 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726148AbfENGOB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 02:14:01 -0400
X-UUID: 2ead6c60d3f74208bb8338a830e375ab-20190514
X-UUID: 2ead6c60d3f74208bb8338a830e375ab-20190514
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw01.mediatek.com
        (envelope-from <stu.hsieh@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1259888378; Tue, 14 May 2019 14:13:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 May 2019 14:13:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 May 2019 14:13:54 +0800
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
Subject: [PATCH v3 06/13] [media] mtk-mipicsi: add function to support SerDes for link number
Date:   Tue, 14 May 2019 14:13:43 +0800
Message-ID: <1557814430-9675-7-git-send-email-stu.hsieh@mediatek.com>
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

This patch add function to support SerDes for link number.

Mt2712 can server at most four camera link for each mipicsi port.
Therefore, driver need to know how many camera link in SerDes and
set the mipicsi HW to serve.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 920848e965e3..117eb1939014 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -53,6 +53,8 @@
 #define MIPICSI_COMMON_CLK 2
 #define MTK_CAMDMA_MAX_NUM 4U
 #define MIPICSI_CLK (MIPICSI_COMMON_CLK + MTK_CAMDMA_MAX_NUM)
+#define MAX_DES_LINK 4U
+#define SUBDEV_LINK_REG 0x49
 #define MAX_SUPPORT_WIDTH             4096U
 #define MAX_SUPPORT_HEIGHT            4096U
 #define MAX_BUFFER_NUM                  32U
@@ -103,6 +105,8 @@
 #define IMGO_STRIDE					0x238
 #define DMA_FRAME_HEADER_EN				0xE00
 
+#define SerDes_support 1
+
 /* buffer for one video frame */
 struct mtk_mipicsi_buf {
 	struct list_head queue;
@@ -127,6 +131,8 @@ struct mtk_mipicsi_dev {
 	spinlock_t		queue_lock;
 	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
 	bool streamon;
+	unsigned int link;
+	u8 link_reg_val;
 	unsigned long enqueue_cnt;
 	char drv_name[16];
 	u32 id;
@@ -146,6 +152,64 @@ struct mtk_mipicsi_dev {
 		V4L2_MBUS_PCLK_SAMPLE_FALLING |	\
 		V4L2_MBUS_DATA_ACTIVE_HIGH)
 
+static int get_subdev_register(const struct soc_camera_device *icd,
+	struct v4l2_dbg_register *reg)
+{
+	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
+	int ret = 0;
+
+	reg->match.type = V4L2_CHIP_MATCH_SUBDEV;
+	reg->match.addr = 0;
+	ret = v4l2_subdev_call(sd, core, g_register, reg);
+	if (ret != 2) {
+		dev_err(icd->parent, "mipicsi get des register 0x%llx fail, ret=%d\n",
+			reg->reg, ret);
+		return -EIO;
+	}
+
+	dev_info(icd->parent, "read DES [reg/val/ret] is [0x%llx/0x%llx/%d]\n",
+		reg->reg, reg->val, ret);
+	return ret;
+}
+
+static int get_subdev_link(const struct soc_camera_device *icd,
+	unsigned int *link, u8 *link_reg_val)
+{
+	struct v4l2_dbg_register reg;
+	int ret = 0;
+	unsigned int index = 0U;
+	*link_reg_val = 0x0U;
+
+	if (SerDes_support == 0) {
+		*link = 1;
+		*link_reg_val = 0x1;
+		dev_info(icd->parent, "subdev not support SerDes\n");
+		return 0;
+	}
+
+	if (link == NULL)
+		return -EINVAL;
+
+	memset(&reg, 0, sizeof(reg));
+	/*get camera link number*/
+	reg.reg = SUBDEV_LINK_REG;
+	ret = get_subdev_register(icd, &reg);
+	if (ret < 0)
+		return ret;
+
+	*link = 0U;
+	for (index = 0U; index < MAX_DES_LINK; ++index) {
+		if ((reg.val & 0x01U) == 0x01U) {
+			*link += 1U;
+			*link_reg_val |= (0x01U << index);
+		}
+		reg.val >>= 1U;
+	}
+
+	dev_info(icd->parent, "%u camera linked to sub device\n", *link);
+	return 0;
+}
+
 static u32 get_bytesperline(const u32 fmt, const u32 width)
 {
 	u32 bytesperline = 0;
@@ -177,6 +241,7 @@ static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
 	u32 height;
 	u32 fmt;
 
+	(void)get_subdev_link(icd, &mipicsi->link, &mipicsi->link_reg_val);
 	/* Get width/height info from subdev. Then use them to set register */
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
 	if (ret < 0) {
-- 
2.18.0

