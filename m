Return-Path: <linux-media+bounces-33321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA79AC2F99
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B8367B995D
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592501EF09B;
	Sat, 24 May 2025 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ldwSNUZm"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F81E492D;
	Sat, 24 May 2025 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087532; cv=none; b=ni6wjXQh9YOOpaqFDrpSQI8uGWY2f3OPHS0JF+Ft9tSjzB4Mq7QH7MEBBDs/R9iIBfydnHEYqpRQYSESUzjz41EIOYOaXfjDevbMeFmHV5ZZNWHlpnw3AYjZNPpgABiWv8Xh2VdOjcSc4hS7rb3YRtmGiIeTMVf4fl5nmEJu5UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087532; c=relaxed/simple;
	bh=PZz9yJZAtNqsvo24fcm8RlWB0NCSzRoZfGdd3VJGndI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aUVIeYxxkP+LMW+aUdWlCD2qTFrdD6U2IFbPDZpz0SZew9u6nBBqMwIrAt4rO5tUk1xhocZvb5QtBnlylGmL9jQmOBUwlkyZ1+KT+LC2PfQ0hin+IBjzWQbhSTIatfm2Xy/EP3CflZyhmCqmXQl4rE5gfaeE+JNgUou6DIuhwAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ldwSNUZm; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7af00a98389511f082f7f7ac98dee637-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CqekI3T4vQaqvZMK31hDFZQdEJvFlZRiVAD4u8JmKVI=;
	b=ldwSNUZmf7YrI3sCS6zbyb8lvzR9ADCpDyP1yAE9XU903iWLipKXW1XyZHaziFqUG0v+p+D08dcVvjy+TsvY7u6qqNx5fJybrDnw/CBzn+m4jpnmhpT2BDzCPLtArnG5mRRE3F2LRMKNZ4FHu94q0n+xUWQkUcLOcXyyMzKF4rA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d37ce0b4-a2b1-4f7d-858a-97188a67faf2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5dbb3bf1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7af00a98389511f082f7f7ac98dee637-20250524
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 305957609; Sat, 24 May 2025 19:51:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:48 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Olivia Wen <olivia.wen@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>
Subject: [PATCH v1 06/10] media: mediatek: isp: Add module operations structure for ImgSys
Date: Sat, 24 May 2025 19:49:58 +0800
Message-ID: <20250524115144.3832748-7-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250524115144.3832748-1-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The ImgSys driver is implemented as a series of patches, with this patch
focusing on a set of operations for specific modules.
The ImgSys architecture includes various modules such as WPE (Warping
Engine), TRAW (Tile-Raw), DIP (Digital Image Processing), PQDIP (Picture
Quality Digital Image Processing), and ME (Motion Estimation).
Each module requires specific operations for initialization and
deinitialization to ensure proper setup and cleanup.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../mediatek/isp/isp_7x/imgsys/Makefile       |   8 +
 .../isp_7x/imgsys/modules/mtk_imgsys-dip.c    | 115 +++++++++++
 .../isp_7x/imgsys/modules/mtk_imgsys-dip.h    |  18 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-pqdip.c  | 113 +++++++++++
 .../isp_7x/imgsys/modules/mtk_imgsys-pqdip.h  |  17 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-traw.c   |  65 +++++++
 .../isp_7x/imgsys/modules/mtk_imgsys-traw.h   |  17 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-wpe.c    | 116 +++++++++++
 .../isp_7x/imgsys/modules/mtk_imgsys-wpe.h    |  17 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.h        |  12 +-
 .../isp_7x/imgsys/mtk_imgsys-module_common.h  |  82 ++++++++
 .../isp_7x/imgsys/mtk_imgsys-module_main.c    | 183 ++++++++++++++++++
 .../isp_7x/imgsys/mtk_imgsys-module_main.h    |  17 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-module_ops.h |  26 +++
 .../isp/isp_7x/imgsys/mtk_imgsys-of.h         |   3 +
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.c        |  73 ++++++-
 .../isp/isp_7x/imgsys/mtk_imgsys-v4l2.c       |  45 ++++-
 17 files changed, 923 insertions(+), 4 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
index 571d0ae000eb..26c8c1d39750 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
@@ -2,10 +2,18 @@
 #
 
 mtk_imgsys_util-objs := \
+mtk_imgsys-module_main.o \
 mtk_imgsys-of.o \
 mtk_imgsys-formats.o \
 mtk_imgsys-dev.o \
 mtk_imgsys-sys.o \
 mtk_imgsys-v4l2.o
 
+mtk_imgsys_hw_isp-objs := \
+modules/mtk_imgsys-dip.o \
+modules/mtk_imgsys-traw.o \
+modules/mtk_imgsys-pqdip.o \
+modules/mtk_imgsys-wpe.o
+
 obj-$(CONFIG_VIDEO_MTK_ISP_71_IMGSYS) += mtk_imgsys_util.o
+obj-$(CONFIG_VIDEO_MTK_ISP_71_IMGSYS) += mtk_imgsys_hw_isp.o
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c
new file mode 100644
index 000000000000..1cc1f3e87e8b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/of_address.h>
+#include "../mtk_imgsys-module_common.h"
+#include "mtk_imgsys-dip.h"
+
+/********************************************************************
+ * Global Define
+ ********************************************************************/
+#define DIPCTL_D1A_DIPCTL_INT1_EN    0x094
+#define DIPCTL_D1A_DIPCTL_INT2_EN    0x0A0
+#define DIPCTL_D1A_DIPCTL_INT3_EN    0x0AC
+#define DIPCTL_D1A_DIPCTL_CQ_INT1_EN 0x0C4
+#define DIPCTL_D1A_DIPCTL_CQ_INT2_EN 0x0D0
+#define DIPCTL_D1A_DIPCTL_CQ_INT3_EN 0x0DC
+
+#define DIPCQ_D1A_DIPCQ_CQ_THR0_CTL  0x208
+#define DIPCQ_D1A_DIPCQ_CQ_THR1_CTL  0x218
+#define DIPCQ_D1A_DIPCQ_CQ_THR2_CTL  0x228
+#define DIPCQ_D1A_DIPCQ_CQ_THR3_CTL  0x238
+#define DIPCQ_D1A_DIPCQ_CQ_THR4_CTL  0x248
+#define DIPCQ_D1A_DIPCQ_CQ_THR5_CTL  0x258
+#define DIPCQ_D1A_DIPCQ_CQ_THR6_CTL  0x268
+#define DIPCQ_D1A_DIPCQ_CQ_THR7_CTL  0x278
+#define DIPCQ_D1A_DIPCQ_CQ_THR8_CTL  0x288
+#define DIPCQ_D1A_DIPCQ_CQ_THR9_CTL  0x298
+#define DIPCQ_D1A_DIPCQ_CQ_THR10_CTL 0x2A8
+#define DIPCQ_D1A_DIPCQ_CQ_THR11_CTL 0x2B8
+#define DIPCQ_D1A_DIPCQ_CQ_THR12_CTL 0x2C8
+#define DIPCQ_D1A_DIPCQ_CQ_THR13_CTL 0x2D8
+#define DIPCQ_D1A_DIPCQ_CQ_THR14_CTL 0x2E8
+#define DIPCQ_D1A_DIPCQ_CQ_THR15_CTL 0x2F8
+#define DIPCQ_D1A_DIPCQ_CQ_THR16_CTL 0x308
+#define DIPCQ_D1A_DIPCQ_CQ_THR17_CTL 0x318
+#define DIPCQ_D1A_DIPCQ_CQ_THR18_CTL 0x328
+
+#define DIP_INIT_ARRAY_COUNT	ARRAY_SIZE(mtk_imgsys_dip_init_ary)
+
+/********************************************************************
+ * Global Variable
+ ********************************************************************/
+static const struct mtk_imgsys_init_array mtk_imgsys_dip_init_ary[] = {
+	{ DIPCTL_D1A_DIPCTL_INT1_EN, 0x80000000 },
+	{ DIPCTL_D1A_DIPCTL_INT2_EN, 0x0 },
+	{ DIPCTL_D1A_DIPCTL_INT3_EN, 0x0 },
+	{ DIPCTL_D1A_DIPCTL_CQ_INT1_EN, 0x0 },
+	{ DIPCTL_D1A_DIPCTL_CQ_INT2_EN, 0x0 },
+	{ DIPCTL_D1A_DIPCTL_CQ_INT3_EN, 0x0 },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR0_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR1_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR2_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR3_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR4_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR5_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR6_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR7_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR8_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR9_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR10_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR11_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR12_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR13_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR14_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR15_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR16_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR17_CTL, CQ_THRX_CTL },
+	{ DIPCQ_D1A_DIPCQ_CQ_THR18_CTL, CQ_THRX_CTL },
+};
+
+static void __iomem *dip_reg_base[MTK_IMGSYS_DIP_HW_SET];
+
+/********************************************************************
+ * Functions
+ ********************************************************************/
+void imgsys_dip_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	unsigned int i, hw_id, hw_idx;
+	void __iomem *offset = NULL;
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_DIP_HW_SET; hw_idx++) {
+		hw_id = IMGSYS_REG_DIP1 + hw_idx;
+		dip_reg_base[hw_idx] = of_iomap(imgsys_dev->dev->of_node, hw_id);
+		if (!dip_reg_base[hw_idx]) {
+			dev_info(imgsys_dev->dev,
+				 "%s: error: unable to iomap dip_%d registers, devnode(%s).\n",
+				 __func__, hw_id, imgsys_dev->dev->of_node->name);
+			continue;
+		}
+
+		for (i = 0 ; i < DIP_INIT_ARRAY_COUNT; i++) {
+			offset = dip_reg_base[hw_idx] + mtk_imgsys_dip_init_ary[i].offset;
+			writel(mtk_imgsys_dip_init_ary[i].value, offset);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_dip_init);
+
+void imgsys_dip_uninit(struct mtk_imgsys_dev *imgsys_dev)
+{
+	unsigned int hw_idx;
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_DIP_HW_SET; hw_idx++) {
+		iounmap(dip_reg_base[hw_idx]);
+		dip_reg_base[hw_idx] = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_dip_uninit);
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h
new file mode 100644
index 000000000000..22b4a7c3616d
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_DIP_DIP_H_
+#define _MTK_DIP_DIP_H_
+
+#include "../mtk_imgsys-dev.h"
+
+void imgsys_dip_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_dip_uninit(struct mtk_imgsys_dev *imgsys_dev);
+
+#endif /* _MTK_DIP_DIP_H_ */
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c
new file mode 100644
index 000000000000..d1d3507555d9
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Daniel Huang <daniel.huang@mediatek.com>
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/of_address.h>
+#include "../mtk_imgsys-module_common.h"
+#include "mtk_imgsys-pqdip.h"
+
+/********************************************************************
+ * Global Define
+ ********************************************************************/
+#define PQDIPCTL_P1A_REG_PQDIPCTL_INT1_EN		0x0050
+#define PQDIPCTL_P1A_REG_PQDIPCTL_INT2_EN		0x0060
+#define PQDIPCTL_P1A_REG_PQDIPCTL_CQ_INT1_EN	0x0070
+#define PQDIPCTL_P1A_REG_PQDIPCTL_CQ_INT2_EN	0x0080
+#define PQDIPCTL_P1A_REG_PQDIPCTL_CQ_INT3_EN	0x0090
+
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR0_CTL			0x0208
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR1_CTL			0x0218
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR2_CTL			0x0228
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR3_CTL			0x0238
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR4_CTL			0x0248
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR5_CTL			0x0258
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR6_CTL			0x0268
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR7_CTL			0x0278
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR8_CTL			0x0288
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR9_CTL			0x0298
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR10_CTL		0x02A8
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR11_CTL		0x02B8
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR12_CTL		0x02C8
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR13_CTL		0x02D8
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR14_CTL		0x02E8
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR15_CTL		0x02F8
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR16_CTL		0x0308
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR17_CTL		0x0318
+#define DIPCQ_P1A_REG_DIPCQ_CQ_THR18_CTL		0x0328
+
+#define PQDIP_INIT_ARRAY_COUNT	ARRAY_SIZE(mtk_imgsys_pqdip_init_ary)
+
+/********************************************************************
+ * Global Variable
+ ********************************************************************/
+static const struct mtk_imgsys_init_array mtk_imgsys_pqdip_init_ary[] = {
+	{ PQDIPCTL_P1A_REG_PQDIPCTL_INT1_EN, 0x80000000 },
+	{ PQDIPCTL_P1A_REG_PQDIPCTL_INT2_EN, 0x0 },
+	{ PQDIPCTL_P1A_REG_PQDIPCTL_CQ_INT1_EN, 0x0 },
+	{ PQDIPCTL_P1A_REG_PQDIPCTL_CQ_INT2_EN, 0x0 },
+	{ PQDIPCTL_P1A_REG_PQDIPCTL_CQ_INT3_EN, 0x0 },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR0_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR1_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR2_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR3_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR4_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR5_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR6_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR7_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR8_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR9_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR10_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR11_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR12_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR13_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR14_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR15_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR16_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR17_CTL, CQ_THRX_CTL },
+	{ DIPCQ_P1A_REG_DIPCQ_CQ_THR18_CTL, CQ_THRX_CTL },
+};
+
+static void __iomem *pqdip_reg_base[MTK_IMGSYS_PQDIP_HW_SET];
+
+/********************************************************************
+ * Functions
+ ********************************************************************/
+void imgsys_pqdip_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	unsigned int i, hw_id, hw_idx;
+	void __iomem *offset = NULL;
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_PQDIP_HW_SET; hw_idx++) {
+		hw_id = IMGSYS_REG_PQDIP1 + hw_idx;
+		pqdip_reg_base[hw_idx] = of_iomap(imgsys_dev->dev->of_node, hw_id);
+		if (!pqdip_reg_base[hw_idx]) {
+			dev_info(imgsys_dev->dev,
+				 "%s: error: unable to iomap pqdip_%d registers, devnode(%s).\n",
+				 __func__, hw_id, imgsys_dev->dev->of_node->name);
+			continue;
+		}
+
+		for (i = 0 ; i < PQDIP_INIT_ARRAY_COUNT; i++) {
+			offset = pqdip_reg_base[hw_idx] + mtk_imgsys_pqdip_init_ary[i].offset;
+			writel(mtk_imgsys_pqdip_init_ary[i].value, offset);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_pqdip_init);
+
+void imgsys_pqdip_uninit(struct mtk_imgsys_dev *imgsys_dev)
+{
+	unsigned int hw_idx;
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_PQDIP_HW_SET; hw_idx++) {
+		iounmap(pqdip_reg_base[hw_idx]);
+		pqdip_reg_base[hw_idx] = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_pqdip_uninit);
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h
new file mode 100644
index 000000000000..00f93d536181
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Daniel Huang <daniel.huang@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_PQDIP_H_
+#define _MTK_IMGSYS_PQDIP_H_
+
+#include "../mtk_imgsys-dev.h"
+
+void imgsys_pqdip_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_pqdip_uninit(struct mtk_imgsys_dev *imgsys_dev);
+
+#endif /* _MTK_IMGSYS_PQDIP_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c
new file mode 100644
index 000000000000..292f0ad09c46
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Shih-Fang Chuang <shih-fang.chuang@mediatek.com>
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/of_address.h>
+#include "../mtk_imgsys-module_common.h"
+#include "mtk_imgsys-traw.h"
+
+/********************************************************************
+ * Global Define
+ ********************************************************************/
+#define TRAWCTL_INT1_EN 0x00A0
+
+#define TRAW_INIT_ARRAY_COUNT	ARRAY_SIZE(mtk_imgsys_traw_init_ary)
+
+/********************************************************************
+ * Global Variable
+ ********************************************************************/
+static const struct mtk_imgsys_init_array mtk_imgsys_traw_init_ary[] = {
+	{ TRAWCTL_INT1_EN, 0x80000000 },
+};
+
+static void __iomem *traw_reg_base[MTK_IMGSYS_TRAW_HW_SET];
+
+/********************************************************************
+ * Functions
+ ********************************************************************/
+void imgsys_traw_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	unsigned int i, hw_id, hw_idx;
+	void __iomem *offset = NULL;
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_TRAW_HW_SET; hw_idx++) {
+		hw_id = IMGSYS_REG_TRAW1 + hw_idx;
+		traw_reg_base[hw_idx] = of_iomap(imgsys_dev->dev->of_node, hw_id);
+		if (!traw_reg_base[hw_idx]) {
+			dev_info(imgsys_dev->dev,
+				 "%s: error: unable to iomap traw_%d registers, devnode(%s).\n",
+				 __func__, hw_id, imgsys_dev->dev->of_node->name);
+			continue;
+		}
+
+		for (i = 0 ; i < TRAW_INIT_ARRAY_COUNT; i++) {
+			offset = traw_reg_base[hw_idx] + mtk_imgsys_traw_init_ary[i].offset;
+			writel(mtk_imgsys_traw_init_ary[i].value, offset);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_traw_init);
+
+void imgsys_traw_uninit(struct mtk_imgsys_dev *imgsys_dev)
+{
+	unsigned int hw_idx;
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_TRAW_HW_SET; hw_idx++) {
+		iounmap(traw_reg_base[hw_idx]);
+		traw_reg_base[hw_idx] = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_traw_uninit);
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h
new file mode 100644
index 000000000000..f3727216b58c
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Shih-fang Chuang <shih-fang.chuang@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_TRAW_H_
+#define _MTK_IMGSYS_TRAW_H_
+
+#include "../mtk_imgsys-dev.h"
+
+void imgsys_traw_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_traw_uninit(struct mtk_imgsys_dev *imgsys_dev);
+
+#endif /* _MTK_IMGSYS_TRAW_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c
new file mode 100644
index 000000000000..b19d61529b80
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Floria Huang <floria.huang@mediatek.com>
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/of_address.h>
+#include "../mtk_imgsys-module_common.h"
+#include "mtk_imgsys-wpe.h"
+
+/********************************************************************
+ * Global Define
+ ********************************************************************/
+/* Define register offsets */
+#define WPE_TOP_CTL_INT_EN_OFFSET       0x0018
+#define WPE_TOP_CTL_INT_STATUSX_OFFSET  0x0024
+#define WPE_TOP_CQ_IRQ_EN_OFFSET        0x00D4
+#define WPE_TOP_CQ_IRQ_STX_OFFSET       0x00DC
+#define WPE_TOP_CQ_IRQ_EN2_OFFSET       0x00E0
+#define WPE_TOP_CQ_IRQ_STX2_OFFSET      0x00E8
+#define WPE_TOP_CQ_IRQ_EN3_OFFSET       0x00EC
+#define WPE_TOP_CQ_IRQ_STX3_OFFSET      0x00F4
+#define WPE_CACHE_RWCTL_CTL_OFFSET      0x0204
+#define WPE_DMA_DMA_ERR_CTRL_OFFSET     0x03D4
+#define DIPCQ_W1A_DIPCQ_CQ_THR0_CTL_OFFSET 0x0B08
+#define DIPCQ_W1A_DIPCQ_CQ_THR1_CTL_OFFSET 0x0B18
+#define DIPCQ_W1A_DIPCQ_CQ_THR2_CTL_OFFSET 0x0B28
+#define DIPCQ_W1A_DIPCQ_CQ_THR3_CTL_OFFSET 0x0B38
+#define DIPCQ_W1A_DIPCQ_CQ_THR4_CTL_OFFSET 0x0B48
+#define DIPCQ_W1A_DIPCQ_CQ_THR5_CTL_OFFSET 0x0B58
+#define DIPCQ_W1A_DIPCQ_CQ_THR6_CTL_OFFSET 0x0B68
+#define DIPCQ_W1A_DIPCQ_CQ_THR7_CTL_OFFSET 0x0B78
+#define DIPCQ_W1A_DIPCQ_CQ_THR8_CTL_OFFSET 0x0B88
+#define DIPCQ_W1A_DIPCQ_CQ_THR9_CTL_OFFSET 0x0B98
+#define DIPCQ_W1A_DIPCQ_CQ_THR10_CTL_OFFSET 0x0BA8
+#define DIPCQ_W1A_DIPCQ_CQ_THR11_CTL_OFFSET 0x0BB8
+#define DIPCQ_W1A_DIPCQ_CQ_THR12_CTL_OFFSET 0x0BC8
+#define DIPCQ_W1A_DIPCQ_CQ_THR13_CTL_OFFSET 0x0BD8
+#define DIPCQ_W1A_DIPCQ_CQ_THR14_CTL_OFFSET 0x0BE8
+
+#define WPE_INIT_ARRAY_COUNT	ARRAY_SIZE(mtk_imgsys_wpe_init_ary)
+/********************************************************************
+ * Global Variable
+ ********************************************************************/
+static const struct mtk_imgsys_init_array mtk_imgsys_wpe_init_ary[] = {
+	{ WPE_TOP_CTL_INT_EN_OFFSET, 0x80000000 },
+	{ WPE_TOP_CTL_INT_STATUSX_OFFSET, 0xFFFFFFFF },
+	{ WPE_TOP_CQ_IRQ_EN_OFFSET, 0x80000000 },
+	{ WPE_TOP_CQ_IRQ_STX_OFFSET, 0xFFFFFFFF },
+	{ WPE_TOP_CQ_IRQ_EN2_OFFSET, 0x80000000 },
+	{ WPE_TOP_CQ_IRQ_STX2_OFFSET, 0xFFFFFFFF },
+	{ WPE_TOP_CQ_IRQ_EN3_OFFSET, 0x80000000 },
+	{ WPE_TOP_CQ_IRQ_STX3_OFFSET, 0xFFFFFFFF },
+	{ WPE_CACHE_RWCTL_CTL_OFFSET, 0x00000002 },
+	{ WPE_DMA_DMA_ERR_CTRL_OFFSET, 0x80000000 },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR0_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR1_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR2_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR3_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR4_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR5_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR6_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR7_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR8_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR9_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR10_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR11_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR12_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR13_CTL_OFFSET, CQ_THRX_CTL },
+	{ DIPCQ_W1A_DIPCQ_CQ_THR14_CTL_OFFSET, CQ_THRX_CTL },
+};
+
+static void __iomem *wpe_reg_base[MTK_IMGSYS_WPE_HW_SET];
+
+/********************************************************************
+ * Functions
+ ********************************************************************/
+void imgsys_wpe_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	unsigned int i, hw_id, hw_idx;
+	void __iomem *offset = NULL;
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_WPE_HW_SET; hw_idx++) {
+		hw_id = IMGSYS_REG_WPE1 + hw_idx;
+		wpe_reg_base[hw_idx] = of_iomap(imgsys_dev->dev->of_node, hw_id);
+		if (!wpe_reg_base[hw_idx]) {
+			dev_info(imgsys_dev->dev,
+				 "%s: error: unable to iomap wpe_%d registers, devnode(%s).\n",
+				 __func__, hw_id, imgsys_dev->dev->of_node->name);
+			continue;
+		}
+
+		for (i = 0 ; i < WPE_INIT_ARRAY_COUNT; i++) {
+			offset = wpe_reg_base[hw_idx] + mtk_imgsys_wpe_init_ary[i].offset;
+			writel(mtk_imgsys_wpe_init_ary[i].value, offset);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_wpe_init);
+
+void imgsys_wpe_uninit(struct mtk_imgsys_dev *imgsys_dev)
+{
+	unsigned int hw_idx;
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_WPE_HW_SET; hw_idx++) {
+		iounmap(wpe_reg_base[hw_idx]);
+		wpe_reg_base[hw_idx] = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_wpe_uninit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek IMGSYS Modules");
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h
new file mode 100644
index 000000000000..6001575265e6
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Floria Huang <floria.huang@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_WPE_H_
+#define _MTK_IMGSYS_WPE_H_
+
+#include "../mtk_imgsys-dev.h"
+
+void imgsys_wpe_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_wpe_uninit(struct mtk_imgsys_dev *imgsys_dev);
+
+#endif /* _MTK_IMGSYS_WPE_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
index b69cfd0043d3..b8c30cb32b97 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
@@ -23,7 +23,7 @@
 #include <linux/videodev2.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-v4l2.h>
-
+#include "mtk_imgsys-module_ops.h"
 #include "mtk_header_desc.h"
 
 #define MTK_IMGSYS_MEDIA_MODEL_NAME	"MTK-ISP-DIP-V4L2"
@@ -273,6 +273,7 @@ struct mtk_imgsys_pipe {
  * @v4l2_dev: V4L2 device structure for video device operations.
  * @imgsys_pipe: Image system pipeline configuration structure.
  * @cust_pipes: Pointer to custom pipeline descriptors.
+ * @modules: Pointer to image system module operations.
  * @clks: Array of clock bulk data for managing multiple clocks.
  * @num_clks: Number of clocks in the clock array.
  * @larbs: Array of device pointers for managing LARB (local arbiter).
@@ -281,6 +282,9 @@ struct mtk_imgsys_pipe {
  * @rproc_handle: Handle for remote processor interface.
  * @smem_dev: Device structure for shared memory operations.
  * @num_mods: Number of modules in the image system.
+ * @init_kref: Reference counter for initialization tracking.
+ * @hw_op_lock: Mutex for serializing hardware operations.
+ * @stream_cnt: Counter for active streams, increased on stream on.
  */
 struct mtk_imgsys_dev {
 	/* Device and Resource Information */
@@ -292,6 +296,8 @@ struct mtk_imgsys_dev {
 	struct mtk_imgsys_pipe imgsys_pipe;
 	/* Imgsys Pipeline Information */
 	const struct mtk_imgsys_pipe_desc *cust_pipes;
+	/* Imgsys Moudles Information */
+	const struct module_ops *modules;
 	/* Clock Information */
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -304,6 +310,10 @@ struct mtk_imgsys_dev {
 	struct device *smem_dev;
 	/* Number of modules */
 	int num_mods;
+	/* Synchronization and Flow Control */
+	struct kref init_kref;
+	struct mutex hw_op_lock; /* Protect HW operations */
+	int stream_cnt;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h
new file mode 100644
index 000000000000..dd02a8fa28d4
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Christopher Chen <christopher.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_CORE_REG_H_
+#define _MTK_IMGSYS_CORE_REG_H_
+
+/**
+ * Define the minimum and maximum hardware IDs
+ * for different MediaTek Image System components
+ */
+#define WPE_HW_MIN_ID	IMGSYS_REG_WPE1
+#define WPE_HW_MAX_ID	IMGSYS_REG_WPE3
+#define TRAW_HW_MIN_ID	IMGSYS_REG_TRAW1
+#define TRAW_HW_MAX_ID	IMGSYS_REG_TRAW3
+#define DIP_HW_MIN_ID	IMGSYS_REG_DIP1
+#define DIP_HW_MAX_ID	IMGSYS_REG_DIP2
+#define PQDIP_HW_MIN_ID	IMGSYS_REG_PQDIP1
+#define PQDIP_HW_MAX_ID	IMGSYS_REG_PQDIP2
+#define ME_HW_MIN_ID	IMGSYS_REG_ME
+#define ME_HW_MAX_ID	IMGSYS_REG_ME
+
+/* Macro to calculate the size of a hardware set */
+#define HW_SET_SIZE(min_id, max_id) ((max_id) - (min_id) + 1)
+
+/* Define the hardware set sizes */
+#define MTK_IMGSYS_WPE_HW_SET	HW_SET_SIZE(WPE_HW_MIN_ID, WPE_HW_MAX_ID)
+#define MTK_IMGSYS_TRAW_HW_SET	HW_SET_SIZE(TRAW_HW_MIN_ID, TRAW_HW_MAX_ID)
+#define MTK_IMGSYS_DIP_HW_SET	HW_SET_SIZE(DIP_HW_MIN_ID, DIP_HW_MAX_ID)
+#define MTK_IMGSYS_PQDIP_HW_SET	HW_SET_SIZE(PQDIP_HW_MIN_ID, PQDIP_HW_MAX_ID)
+#define MTK_IMGSYS_ME_HW_SET	HW_SET_SIZE(ME_HW_MIN_ID, ME_HW_MAX_ID)
+
+/* Define the CQ's control register bits */
+#define CQ_THRX_CTL_EN		BIT(0)
+#define CQ_THRX_CTL_MODE	BIT(4)
+#define CQ_THRX_CTL			(CQ_THRX_CTL_EN | CQ_THRX_CTL_MODE)
+
+/**
+ * enum mtk_imgsys_reg_id
+ *
+ * Definition about hw register map id
+ * The engine order should be the same as register order in dts
+ */
+enum mtk_imgsys_reg_id {
+	IMGSYS_REG_TOP = 0,
+	IMGSYS_REG_TRAW1,
+	IMGSYS_REG_TRAW2,
+	IMGSYS_REG_TRAW3,
+	IMGSYS_REG_DIP1,
+	IMGSYS_REG_DIP2,
+	IMGSYS_REG_PQDIP1,
+	IMGSYS_REG_PQDIP2,
+	IMGSYS_REG_WPE1,
+	IMGSYS_REG_WPE2,
+	IMGSYS_REG_WPE3,
+	IMGSYS_REG_WPE1_DIP1,
+	IMGSYS_REG_ME,
+	IMGSYS_REG_WPE2_DIP1,
+	IMGSYS_REG_WPE3_DIP1,
+	IMGSYS_REG_DIP1_TOP,
+	IMGSYS_REG_DIP2_TOP
+};
+
+/**
+ * struct mtk_imgsys_init_array - Array structure for initializing registers
+ * @offset: Offset of the register
+ * @val: Value to be written to the register
+ *
+ * This structure represents an array element used for initializing registers
+ * in the MediaTek Image System. Each element contains the offset of the register
+ * and the value to be written to that register.
+ */
+struct mtk_imgsys_init_array {
+	unsigned int    offset;
+	unsigned int    value;
+};
+#endif /* _MTK_IMGSYS_CORE_REG_H_ */
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c
new file mode 100644
index 000000000000..5daa8f863bd2
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Christopher Chen <christopher.chen@mediatek.com>
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/of_address.h>
+#include "mtk_imgsys-module_common.h"
+#include "mtk_imgsys-module_main.h"
+
+/********************************************************************
+ * Global Define
+ ********************************************************************/
+/* Define the reset register bits */
+#define SW_RST				(0x000C)
+
+/********************************************************************
+ * Global Variable
+ ********************************************************************/
+static void __iomem *imgsys_main_reg_base;
+static void __iomem *wpe_dip1_reg_base;
+static void __iomem *wpe_dip2_reg_base;
+static void __iomem *wpe_dip3_reg_base;
+static void __iomem *dip1_reg_base;
+static void __iomem *dip2_reg_base;
+
+/********************************************************************
+ * Functions
+ ********************************************************************/
+static void imgsys_main_hw_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	void __iomem *wpe_reg_base = NULL;
+	void __iomem *wpe_ctrl = NULL;
+	unsigned int hw_idx = 0;
+
+	/* Enable all LARBs of ImgSys */
+	/**
+	 * The flow will be updated based on the patch series 958467 from
+	 * the Linux MediaTek project. For more details, refer to the following link:
+	 * https://patchwork.kernel.org/project/linux-mediatek/list/?series=958467
+	 */
+
+	/* Reset ImgSys hardware */
+	iowrite32(0xFFFFFFFF, dip1_reg_base + SW_RST);
+	iowrite32(0xFFFFFFFF, dip2_reg_base + SW_RST);
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_WPE_HW_SET; hw_idx++) {
+		if (hw_idx == 0)
+			wpe_reg_base = wpe_dip1_reg_base;
+		else if (hw_idx == 1)
+			wpe_reg_base = wpe_dip2_reg_base;
+		else
+			wpe_reg_base = wpe_dip3_reg_base;
+
+		wpe_ctrl = wpe_reg_base + SW_RST;
+		iowrite32(0xFFFFFFFF, wpe_ctrl);
+		iowrite32(0x0, wpe_ctrl);
+	}
+
+	iowrite32(0x00CF00FF, imgsys_main_reg_base + SW_RST);
+	iowrite32(0x0, imgsys_main_reg_base + SW_RST);
+
+	iowrite32(0x0, dip1_reg_base + SW_RST);
+	iowrite32(0x0, dip2_reg_base + SW_RST);
+
+	for (hw_idx = 0; hw_idx < MTK_IMGSYS_WPE_HW_SET; hw_idx++) {
+		if (hw_idx == 0)
+			wpe_reg_base = wpe_dip1_reg_base;
+		else if (hw_idx == 1)
+			wpe_reg_base = wpe_dip2_reg_base;
+		else
+			wpe_reg_base = wpe_dip3_reg_base;
+
+		wpe_ctrl = wpe_reg_base + SW_RST;
+		iowrite32(0xFFFFFFFF, wpe_ctrl);
+		iowrite32(0x0, wpe_ctrl);
+	}
+
+	iowrite32(0x00CF00FF, imgsys_main_reg_base + SW_RST);
+	iowrite32(0x0, imgsys_main_reg_base + SW_RST);
+
+	/* Disable all LARBs of ImgSys*/
+	/**
+	 * The flow will be updated based on the patch series 958467 from
+	 * the Linux MediaTek project. For more details, refer to the following link:
+	 * https://patchwork.kernel.org/project/linux-mediatek/list/?series=958467
+	 */
+}
+
+void imgsys_main_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	imgsys_main_reg_base = of_iomap(imgsys_dev->dev->of_node, IMGSYS_REG_TOP);
+	if (!imgsys_main_reg_base) {
+		dev_info(imgsys_dev->dev, "%s Unable to ioremap imgsys_top registers\n",
+			 __func__);
+		dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
+			 __func__, imgsys_dev->dev->of_node->name);
+		return;
+	}
+
+	wpe_dip1_reg_base = of_iomap(imgsys_dev->dev->of_node, IMGSYS_REG_WPE1_DIP1);
+	if (!wpe_dip1_reg_base) {
+		dev_info(imgsys_dev->dev, "%s Unable to ioremap wpe_dip1 registers\n",
+			 __func__);
+		dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
+			 __func__, imgsys_dev->dev->of_node->name);
+		return;
+	}
+
+	wpe_dip2_reg_base = of_iomap(imgsys_dev->dev->of_node, IMGSYS_REG_WPE2_DIP1);
+	if (!wpe_dip2_reg_base) {
+		dev_info(imgsys_dev->dev, "%s Unable to ioremap wpe_dip2 registers\n",
+			 __func__);
+		dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
+			 __func__, imgsys_dev->dev->of_node->name);
+		return;
+	}
+
+	wpe_dip3_reg_base = of_iomap(imgsys_dev->dev->of_node, IMGSYS_REG_WPE3_DIP1);
+	if (!wpe_dip3_reg_base) {
+		dev_info(imgsys_dev->dev, "%s Unable to ioremap wpe_dip3 registers\n",
+			 __func__);
+		dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
+			 __func__, imgsys_dev->dev->of_node->name);
+		return;
+	}
+
+	dip1_reg_base = of_iomap(imgsys_dev->dev->of_node, IMGSYS_REG_DIP1_TOP);
+	if (!dip1_reg_base) {
+		dev_info(imgsys_dev->dev, "%s Unable to ioremap dip_top registers\n",
+			 __func__);
+		dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
+			 __func__, imgsys_dev->dev->of_node->name);
+		return;
+	}
+
+	dip2_reg_base = of_iomap(imgsys_dev->dev->of_node, IMGSYS_REG_DIP2_TOP);
+	if (!dip2_reg_base) {
+		dev_info(imgsys_dev->dev, "%s Unable to ioremap dip_top_nr registers\n",
+			 __func__);
+		dev_info(imgsys_dev->dev, "%s of_iomap fail, devnode(%s).\n",
+			 __func__, imgsys_dev->dev->of_node->name);
+		return;
+	}
+
+	imgsys_main_hw_init(imgsys_dev);
+}
+
+void imgsys_main_uninit(struct mtk_imgsys_dev *imgsys_dev)
+{
+	if (imgsys_main_reg_base) {
+		iounmap(imgsys_main_reg_base);
+		imgsys_main_reg_base = NULL;
+	}
+
+	if (wpe_dip1_reg_base) {
+		iounmap(wpe_dip1_reg_base);
+		wpe_dip1_reg_base = NULL;
+	}
+
+	if (wpe_dip2_reg_base) {
+		iounmap(wpe_dip2_reg_base);
+		wpe_dip2_reg_base = NULL;
+	}
+
+	if (wpe_dip3_reg_base) {
+		iounmap(wpe_dip3_reg_base);
+		wpe_dip3_reg_base = NULL;
+	}
+
+	if (dip1_reg_base) {
+		iounmap(dip1_reg_base);
+		dip1_reg_base = NULL;
+	}
+
+	if (dip2_reg_base) {
+		iounmap(dip2_reg_base);
+		dip2_reg_base = NULL;
+	}
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.h
new file mode 100644
index 000000000000..2a3fbd08d128
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Christopher Chen <christopher.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_DEBUG_H_
+#define _MTK_IMGSYS_DEBUG_H_
+
+#include "mtk_imgsys-dev.h"
+
+void imgsys_main_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_main_uninit(struct mtk_imgsys_dev *imgsys_dev);
+
+#endif /* _MTK_IMGSYS_DEBUG_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
index 6dc4b7b60832..a2eea8f4fb3c 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
@@ -24,4 +24,30 @@ enum mtk_imgsys_module {
 	IMGSYS_MOD_MAX,
 };
 
+struct mtk_imgsys_dev;
+
+/**
+ * struct module_ops - Operations for a specific module in the MediaTek Image System
+ * @module_id: Identifier for the module.
+ * @init: Function pointer to initialize the module.
+ *        This function sets the default values for various software-related
+ *        parameters and ensures that the module is ready for operation.
+ *        Example function: imgsys_dip_init
+ * @uninit: Function pointer to uninitialize the module.
+ *          This function resets various software-related parameters to ensure
+ *          the module is properly cleaned up and ready for shutdown.
+ *          Example function: imgsys_dip_uninit
+ *
+ * This structure defines a set of operations for specific modules within the
+ * MediaTek Image System, such as WPE (Warping Engine), TRAW (Tile-Raw),
+ * DIP (Digital Image Processing), PQDIP (Picture Quality Digital Image
+ * Processing), and ME (Motion Estimation). Each module is identified by
+ * a unique identifier and includes function pointers for operations like
+ * initialization and deinitialization.
+ */
+struct module_ops {
+	int module_id;
+	void (*init)(struct mtk_imgsys_dev *imgsys_dev);
+	void (*uninit)(struct mtk_imgsys_dev *imgsys_dev);
+};
 #endif /* _MTK_IMGSYS_MODULES_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h
index 5088c9df704c..f34ea9465745 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk.h>
 #include "mtk_imgsys-dev.h"
+#include "mtk_imgsys-module_ops.h"
 
 /**
  * struct mtk_imgsys_mod_pipe_desc - Description of a module's pipeline
@@ -31,6 +32,7 @@ struct mtk_imgsys_mod_pipe_desc {
  * @mod_num: Number of modules in the pipeline.
  * @pipe_settings: Pointer to pipeline settings for the module.
  * @pipe_num: Number of pipeline settings.
+ * @imgsys_modules: Pointer to module operations for image system modules.
  */
 struct cust_data {
 	struct clk_bulk_data *clks;
@@ -39,6 +41,7 @@ struct cust_data {
 	unsigned int mod_num;
 	const struct mtk_imgsys_pipe_desc *pipe_settings;
 	unsigned int pipe_num;
+	const struct module_ops *imgsys_modules;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
index 9cdcdb0a0200..9f118491b37d 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
@@ -6,7 +6,45 @@
  *
  */
 
+#include <linux/pm_runtime.h>
 #include "mtk_imgsys-sys.h"
+#include "mtk_imgsys-dev.h"
+
+static int mtk_imgsys_hw_connect(struct mtk_imgsys_dev *imgsys_dev)
+{
+	int ret, i;
+
+	ret = pm_runtime_get_sync(imgsys_dev->dev);
+	if (ret < 0) {
+		dev_err(imgsys_dev->dev, "Failed to sync runtime PM: %d\n", ret);
+		return ret;
+	}
+
+	/* Set default value for hardware modules */
+	for (i = 0; i < (imgsys_dev->num_mods); i++)
+		imgsys_dev->modules[i].init(imgsys_dev);
+
+	kref_init(&imgsys_dev->init_kref);
+
+	return 0;
+}
+
+static void module_uninit(struct kref *kref)
+{
+	struct mtk_imgsys_dev *imgsys_dev;
+	int i;
+
+	imgsys_dev = container_of(kref, struct mtk_imgsys_dev, init_kref);
+
+	for (i = 0; i < (imgsys_dev->num_mods); i++)
+		if (imgsys_dev->modules[i].uninit)
+			imgsys_dev->modules[i].uninit(imgsys_dev);
+}
+
+static void mtk_imgsys_hw_disconnect(struct mtk_imgsys_dev *imgsys_dev)
+{
+	kref_put(&imgsys_dev->init_kref, module_uninit);
+}
 
 void mtk_imgsys_hw_enqueue(struct mtk_imgsys_dev *imgsys_dev,
 			   struct mtk_imgsys_request *req)
@@ -16,12 +54,43 @@ void mtk_imgsys_hw_enqueue(struct mtk_imgsys_dev *imgsys_dev,
 
 int mtk_imgsys_hw_streamon(struct mtk_imgsys_pipe *pipe)
 {
-	/* Function implementation will be provided in subsequent patches */
+	struct mtk_imgsys_dev *imgsys_dev = pipe->imgsys_dev;
+	int ret;
+
+	mutex_lock(&imgsys_dev->hw_op_lock);
+	if (!imgsys_dev->stream_cnt) {
+		ret = mtk_imgsys_hw_connect(pipe->imgsys_dev);
+		if (ret) {
+			dev_info(pipe->imgsys_dev->dev,
+				 "%s:%s: pipe(%d) connect to dip_hw failed\n",
+				 __func__, pipe->desc->name, pipe->desc->id);
+			mutex_unlock(&imgsys_dev->hw_op_lock);
+			return ret;
+		}
+	}
+	imgsys_dev->stream_cnt++;
+	mutex_unlock(&imgsys_dev->hw_op_lock);
+
+	dev_dbg(pipe->imgsys_dev->dev,
+		"%s:%s: stream on, id(%d), stream cnt(%d)\n",
+		__func__, pipe->desc->name, pipe->desc->id, imgsys_dev->stream_cnt);
+
 	return 0;
 }
 
 int mtk_imgsys_hw_streamoff(struct mtk_imgsys_pipe *pipe)
 {
-	/* Function implementation will be provided in subsequent patches */
+	struct mtk_imgsys_dev *imgsys_dev = pipe->imgsys_dev;
+
+	dev_dbg(pipe->imgsys_dev->dev,
+		"%s:%s: stream off, id(%d), stream cnt(%d)\n",
+		__func__, pipe->desc->name, pipe->desc->id, imgsys_dev->stream_cnt);
+
+	mutex_lock(&imgsys_dev->hw_op_lock);
+	imgsys_dev->stream_cnt--;
+	if (!imgsys_dev->stream_cnt)
+		mtk_imgsys_hw_disconnect(imgsys_dev);
+	mutex_unlock(&imgsys_dev->hw_op_lock);
+
 	return 0;
 }
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
index 919c69493bbc..e25f17b98649 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
@@ -18,8 +18,13 @@
 #include <media/v4l2-subdev.h>
 #include <media/v4l2-event.h>
 #include "linux/mtkisp_imgsys.h"
-#include "mtk_imgsys-of.h"
 #include "mtk_imgsys-module_ops.h"
+#include "mtk_imgsys-module_main.h"
+#include "modules/mtk_imgsys-dip.h"
+#include "modules/mtk_imgsys-traw.h"
+#include "modules/mtk_imgsys-pqdip.h"
+#include "modules/mtk_imgsys-wpe.h"
+#include "mtk_imgsys-of.h"
 #include "mtk_imgsys-vnode_id.h"
 #include "mtk_imgsys_v4l2_vnode.h"
 #include "mtk_imgsys-dev.h"
@@ -1499,6 +1504,7 @@ static int mtk_imgsys_probe(struct platform_device *pdev)
 	init_imgsys_pipeline(data);
 
 	imgsys_dev->cust_pipes = data->pipe_settings;
+	imgsys_dev->modules = data->imgsys_modules;
 	imgsys_dev->dev = &pdev->dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -1511,6 +1517,8 @@ static int mtk_imgsys_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, imgsys_dev);
 
 	imgsys_dev->num_mods = data->mod_num;
+	imgsys_dev->stream_cnt = 0;
+	mutex_init(&imgsys_dev->hw_op_lock);
 
 	/* Get Clocks */
 	imgsys_dev->clks = data->clks;
@@ -1613,6 +1621,7 @@ static void mtk_imgsys_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	platform_driver_unregister(&mtk_imgsys_larb_driver);
 	mtk_imgsys_dev_v4l2_release(imgsys_dev);
+	mutex_destroy(&imgsys_dev->hw_op_lock);
 	devm_kfree(&pdev->dev, imgsys_dev->larbs);
 	devm_kfree(&pdev->dev, imgsys_dev);
 }
@@ -1709,6 +1718,39 @@ static struct clk_bulk_data imgsys_isp7_clks[] = {
 	{ .id = "ME_CG_LARB12" },
 };
 
+static const struct module_ops imgsys_isp7_modules[] = {
+	[IMGSYS_MOD_IMGMAIN] = {
+		.module_id = IMGSYS_MOD_IMGMAIN,
+		.init = imgsys_main_init,
+		.uninit = imgsys_main_uninit,
+	},
+	[IMGSYS_MOD_WPE] = {
+		.module_id = IMGSYS_MOD_WPE,
+		.init = imgsys_wpe_init,
+		.uninit = imgsys_wpe_uninit,
+	},
+	[IMGSYS_MOD_TRAW] = {
+		.module_id = IMGSYS_MOD_TRAW,
+		.init = imgsys_traw_init,
+		.uninit = imgsys_traw_uninit,
+	},
+	[IMGSYS_MOD_DIP] = {
+		.module_id = IMGSYS_MOD_DIP,
+		.init = imgsys_dip_init,
+		.uninit = imgsys_dip_uninit,
+	},
+	[IMGSYS_MOD_PQDIP] = {
+		.module_id = IMGSYS_MOD_PQDIP,
+		.init = imgsys_pqdip_init,
+		.uninit = imgsys_pqdip_uninit,
+	},
+	[IMGSYS_MOD_ME] = {
+		.module_id = IMGSYS_MOD_ME,
+		.init = NULL,
+		.uninit = NULL,
+	},
+};
+
 static const struct cust_data imgsys_data[] = {
 	[0] = {
 		.clks = imgsys_isp7_clks,
@@ -1717,6 +1759,7 @@ static const struct cust_data imgsys_data[] = {
 		.mod_num = ARRAY_SIZE(module_pipe_isp7),
 		.pipe_settings = pipe_settings_isp7,
 		.pipe_num = ARRAY_SIZE(pipe_settings_isp7),
+		.imgsys_modules = imgsys_isp7_modules,
 	},
 };
 
-- 
2.45.2


