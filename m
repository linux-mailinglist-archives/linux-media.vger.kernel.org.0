Return-Path: <linux-media+bounces-33320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74054AC2F94
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AA681BA3D39
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395201EBA0D;
	Sat, 24 May 2025 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EHHg1wme"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B1B1E32D5;
	Sat, 24 May 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087531; cv=none; b=mbKBWHDY5PSXTc2jjgiOB1CYAypIEwLMT4ko+AIps98Hn+8dvC8+vlGdivMiBhp88uEh45OdnaJsXKf9RsiEAA22CuKrmvkSgWGSSxyaHATElahSiR2VNliNqo/2OQ1xPkUxvGruKrAHzIrONNlshzO8iFbcAx4gYAC8ehRwJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087531; c=relaxed/simple;
	bh=bBVF3AX3F/EtL/TQW15QqAs7u1eQHGMczmknxy128SE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UoWpYV4WoDY9kIf0XMIzBIoOCaYbfMmmYMeBd3ppXM6v6fKmAETjl1vB3zSdE1kChY8jK4YDczgoIYKmYBvqvWn6vBJ8XLRGwFuP23k307SRsO4zF3OUx6csGTi91dwLKMPU6Nm7k1lakHTm7kVnEh5LxVXxkjHf7xvm07d+MrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EHHg1wme; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7b563e94389511f082f7f7ac98dee637-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=14yQiIcnv/dUGYobnu5eQZ1xrrBLbmThmkAwrJmjWXU=;
	b=EHHg1wmem8nXjUiMXAdXbBkLoTZOWNbJccYpWHzxOIoavt67b0yVhRp5sK7a+70GWNvhZMkXPZUGFdPogpsMXUAFnQBGrY6sZOaIue9j3VHy0LNt/gsUXemUiFiuSX+8oErsIoa/SQnMZtugcDqZcW2PmRfbi6Od7sCNk6roxAY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8730b21b-a51d-4479-82e5-f476f3a47bf6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:708ded57-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b563e94389511f082f7f7ac98dee637-20250524
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 13456349; Sat, 24 May 2025 19:51:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:49 +0800
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
Subject: [PATCH v1 10/10] media: mediatek: isp: Add normal data dump flow
Date: Sat, 24 May 2025 19:50:02 +0800
Message-ID: <20250524115144.3832748-11-olivia.wen@mediatek.com>
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
focusing on the  normal data dump flow. It is for debugging purposes
within the MediaTek Image System (ImgSys) driver. The data dump
functionality is essential for diagnosing issues, tracking the flow of
data, and ensuring the proper operation of image processing tasks.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../mediatek/isp/isp_7x/imgsys/Makefile       |   2 +
 .../isp_7x/imgsys/modules/mtk_imgsys-dip.c    |  47 +++
 .../isp_7x/imgsys/modules/mtk_imgsys-dip.h    |   3 +
 .../isp/isp_7x/imgsys/modules/mtk_imgsys-me.c |  65 ++++
 .../isp/isp_7x/imgsys/modules/mtk_imgsys-me.h |  30 ++
 .../isp_7x/imgsys/modules/mtk_imgsys-pqdip.c  |  52 +++
 .../isp_7x/imgsys/modules/mtk_imgsys-pqdip.h  |   3 +
 .../isp_7x/imgsys/modules/mtk_imgsys-traw.c   |  55 +++
 .../isp_7x/imgsys/modules/mtk_imgsys-traw.h   |   3 +
 .../isp_7x/imgsys/modules/mtk_imgsys-wpe.c    |  60 +++
 .../isp_7x/imgsys/modules/mtk_imgsys-wpe.h    |   3 +
 .../mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h  |   8 +
 .../isp/isp_7x/imgsys/mtk_imgsys-gce_work.c   |   4 +
 .../isp_7x/imgsys/mtk_imgsys-module_main.c    |   4 +
 .../isp/isp_7x/imgsys/mtk_imgsys-module_ops.h |  11 +
 .../isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c    | 342 ++++++++++++++++++
 .../isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h    |  64 ++++
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.c        |  11 +
 .../isp/isp_7x/imgsys/mtk_imgsys-v4l2.c       |   7 +
 19 files changed, 774 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
index 3aa53e8bfc6d..16044a280d5c 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
@@ -2,6 +2,7 @@
 #
 
 mtk_imgsys_util-objs := \
+mtk_imgsys-ndd_debugfs.o \
 mtk_imgsys-work_buf.o \
 mtk_imgsys-gce_work.o \
 mtk_imgsys-cmdq.o \
@@ -14,6 +15,7 @@ mtk_imgsys-sys.o \
 mtk_imgsys-v4l2.o
 
 mtk_imgsys_hw_isp-objs := \
+modules/mtk_imgsys-me.o \
 modules/mtk_imgsys-dip.o \
 modules/mtk_imgsys-traw.o \
 modules/mtk_imgsys-pqdip.o \
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c
index 1cc1f3e87e8b..d9563d5a177a 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/of_address.h>
 #include "../mtk_imgsys-module_common.h"
+#include "../mtk_imgsys-scp.h"
 #include "mtk_imgsys-dip.h"
 
 /********************************************************************
@@ -42,6 +43,8 @@
 #define DIPCQ_D1A_DIPCQ_CQ_THR17_CTL 0x318
 #define DIPCQ_D1A_DIPCQ_CQ_THR18_CTL 0x328
 
+#define DIP_REG_RANGE  0x17000
+
 #define DIP_INIT_ARRAY_COUNT	ARRAY_SIZE(mtk_imgsys_dip_init_ary)
 
 /********************************************************************
@@ -103,6 +106,50 @@ void imgsys_dip_init(struct mtk_imgsys_dev *imgsys_dev)
 }
 EXPORT_SYMBOL_GPL(imgsys_dip_init);
 
+void imgsys_dip_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			 struct imgsys_ndd_frm_dump_info *frm_dump_info)
+{
+	char *dip_name;
+	char file_name[NDD_FP_SIZE] = "\0";
+	ssize_t ret;
+	void *cq_va;
+
+	if (frm_dump_info->eng_e != IMGSYS_NDD_ENG_DIP)
+		return;
+
+	cq_va = imgsys_scp_get_reserve_mem_virt(DIP_MEM_C_ID);
+	if (!cq_va)
+		return;
+
+	cq_va += frm_dump_info->cq_ofst[frm_dump_info->eng_e];
+
+	dip_name = "REG_DIP_dip.reg";
+	ret = snprintf(file_name, sizeof(file_name), "%s%s", frm_dump_info->fp, dip_name);
+	if (ret < 0 || ret >= sizeof(file_name)) {
+		dev_err(imgsys_dev->dev, "wrong dip ndd file name %s\n", file_name);
+		return;
+	}
+
+	if (frm_dump_info->user_buffer) {
+		ret = copy_to_user(frm_dump_info->user_buffer, file_name, sizeof(file_name));
+		if (ret)
+			return;
+		frm_dump_info->user_buffer += sizeof(file_name);
+
+		ret = copy_to_user(frm_dump_info->user_buffer, cq_va, 0x9000);
+		if (ret)
+			return;
+		frm_dump_info->user_buffer += 0x48000 + 0x9000;
+
+		ret = copy_to_user(frm_dump_info->user_buffer,
+				   cq_va + 0x9000, DIP_REG_RANGE - 0x9000);
+		if (ret)
+			return;
+		frm_dump_info->user_buffer += DIP_REG_RANGE - 0x9000;
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_dip_ndd_dump);
+
 void imgsys_dip_uninit(struct mtk_imgsys_dev *imgsys_dev)
 {
 	unsigned int hw_idx;
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h
index 22b4a7c3616d..1f0b85f1faba 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-dip.h
@@ -10,8 +10,11 @@
 #define _MTK_DIP_DIP_H_
 
 #include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-ndd_debugfs.h"
 
 void imgsys_dip_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_dip_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			 struct imgsys_ndd_frm_dump_info *frm_dump_info);
 void imgsys_dip_uninit(struct mtk_imgsys_dev *imgsys_dev);
 
 #endif /* _MTK_DIP_DIP_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.c
new file mode 100644
index 000000000000..dacb3d591a71
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
+ *
+ */
+#include <linux/of_address.h>
+#include <linux/uaccess.h>
+#include "mtk_imgsys-me.h"
+
+#define ME_REG_RANGE 0xA20
+
+void imgsys_me_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			struct imgsys_ndd_frm_dump_info *frm_dump_info)
+{
+	char *me_name;
+	char file_name[NDD_FP_SIZE] = "\0";
+	void __iomem *reg_va;
+	ssize_t ret;
+
+	if (frm_dump_info->eng_e != IMGSYS_NDD_ENG_ME)
+		return;
+
+	reg_va = ioremap(frm_dump_info->cq_ofst[frm_dump_info->eng_e], ME_REG_RANGE);
+	if (!reg_va)
+		return;
+
+	me_name = "REG_ME_me.reg";
+
+	ret = snprintf(file_name, sizeof(file_name), "%s%s", frm_dump_info->fp, me_name);
+	if (ret < 0 || ret >= sizeof(file_name)) {
+		iounmap(reg_va);
+		return;
+	}
+
+	if (frm_dump_info->user_buffer) {
+		ret = copy_to_user(frm_dump_info->user_buffer, file_name, sizeof(file_name));
+		if (ret) {
+			iounmap(reg_va);
+			return;
+		}
+		frm_dump_info->user_buffer += sizeof(file_name);
+
+		void *kernel_buffer = kmalloc(ME_REG_RANGE, GFP_KERNEL);
+
+		if (!kernel_buffer) {
+			iounmap(reg_va);
+			return;
+		}
+
+		memcpy_fromio(kernel_buffer, reg_va, ME_REG_RANGE);
+		ret = copy_to_user(frm_dump_info->user_buffer, kernel_buffer, ME_REG_RANGE);
+		kfree(kernel_buffer);
+		if (ret != 0) {
+			iounmap(reg_va);
+			return;
+		}
+		frm_dump_info->user_buffer += ME_REG_RANGE;
+	}
+
+	iounmap(reg_va);
+}
+EXPORT_SYMBOL(imgsys_me_ndd_dump);
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.h
new file mode 100644
index 000000000000..10ed0153b740
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-me.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_ME_H_
+#define _MTK_IMGSYS_ME_H_
+
+#include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-ndd_debugfs.h"
+
+/**
+ * imgsys_me_ndd_dump - Dump the frame information for debugging.
+ * @imgsys_dev: Pointer to the mtk_imgsys_dev structure representing the ISP image
+ * processing device.
+ * @frm_dump_info: Pointer to the imgsys_ndd_frm_dump_info structure containing
+ * frame dump information.
+ *
+ * This function dumps the NDD (Normal Data Dump) frame information for debugging
+ * purposes. It provides insights into the frame data processed by the ISP image
+ * processing device, which can help in identifying issues related to frame
+ * handling.
+ */
+void imgsys_me_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			struct imgsys_ndd_frm_dump_info *frm_dump_info);
+
+#endif /* _MTK_IMGSYS_ME_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c
index d1d3507555d9..f1f688b13ba5 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/of_address.h>
 #include "../mtk_imgsys-module_common.h"
+#include "../mtk_imgsys-scp.h"
 #include "mtk_imgsys-pqdip.h"
 
 /********************************************************************
@@ -40,6 +41,8 @@
 #define DIPCQ_P1A_REG_DIPCQ_CQ_THR17_CTL		0x0318
 #define DIPCQ_P1A_REG_DIPCQ_CQ_THR18_CTL		0x0328
 
+#define PQDIP_REG_RANGE	0x6000
+
 #define PQDIP_INIT_ARRAY_COUNT	ARRAY_SIZE(mtk_imgsys_pqdip_init_ary)
 
 /********************************************************************
@@ -100,6 +103,55 @@ void imgsys_pqdip_init(struct mtk_imgsys_dev *imgsys_dev)
 }
 EXPORT_SYMBOL_GPL(imgsys_pqdip_init);
 
+void imgsys_pqdip_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			   struct imgsys_ndd_frm_dump_info *frm_dump_info)
+{
+	char *pqdip_name;
+	char file_name[NDD_FP_SIZE] = "\0";
+	ssize_t ret;
+	void *cq_va;
+
+	if (frm_dump_info->eng_e != IMGSYS_NDD_ENG_PQDIP_A &&
+	    frm_dump_info->eng_e != IMGSYS_NDD_ENG_PQDIP_B)
+		return;
+
+	cq_va = imgsys_scp_get_reserve_mem_virt(PQDIP_MEM_C_ID);
+	if (!cq_va)
+		return;
+
+	cq_va += frm_dump_info->cq_ofst[frm_dump_info->eng_e];
+
+	switch (frm_dump_info->eng_e) {
+	case IMGSYS_NDD_ENG_PQDIP_A:
+		pqdip_name = "REG_PQDIP_A_pqdipa.reg";
+		break;
+	case IMGSYS_NDD_ENG_PQDIP_B:
+		pqdip_name = "REG_PQDIP_B_pqdipb.reg";
+		break;
+	default:
+		return;
+	}
+
+	ret = snprintf(file_name, sizeof(file_name), "%s%s", frm_dump_info->fp, pqdip_name);
+	if (ret < 0 || ret >= sizeof(file_name)) {
+		dev_err(imgsys_dev->dev, "wrong dip ndd file name %s\n", file_name);
+		return;
+	}
+
+	if (frm_dump_info->user_buffer) {
+		ret = copy_to_user(frm_dump_info->user_buffer, file_name, sizeof(file_name));
+		if (ret)
+			return;
+		frm_dump_info->user_buffer += sizeof(file_name);
+
+		ret = copy_to_user(frm_dump_info->user_buffer, cq_va, PQDIP_REG_RANGE);
+		if (ret)
+			return;
+		frm_dump_info->user_buffer += PQDIP_REG_RANGE;
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_pqdip_ndd_dump);
+
 void imgsys_pqdip_uninit(struct mtk_imgsys_dev *imgsys_dev)
 {
 	unsigned int hw_idx;
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h
index 00f93d536181..09bc51a1c15d 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-pqdip.h
@@ -10,8 +10,11 @@
 #define _MTK_IMGSYS_PQDIP_H_
 
 #include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-ndd_debugfs.h"
 
 void imgsys_pqdip_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_pqdip_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			   struct imgsys_ndd_frm_dump_info *frm_dump_info);
 void imgsys_pqdip_uninit(struct mtk_imgsys_dev *imgsys_dev);
 
 #endif /* _MTK_IMGSYS_PQDIP_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c
index 292f0ad09c46..90597f3a776a 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/of_address.h>
 #include "../mtk_imgsys-module_common.h"
+#include "../mtk_imgsys-scp.h"
 #include "mtk_imgsys-traw.h"
 
 /********************************************************************
@@ -16,6 +17,8 @@
  ********************************************************************/
 #define TRAWCTL_INT1_EN 0x00A0
 
+#define TRAW_REG_RANGE 0xC000
+
 #define TRAW_INIT_ARRAY_COUNT	ARRAY_SIZE(mtk_imgsys_traw_init_ary)
 
 /********************************************************************
@@ -53,6 +56,58 @@ void imgsys_traw_init(struct mtk_imgsys_dev *imgsys_dev)
 }
 EXPORT_SYMBOL_GPL(imgsys_traw_init);
 
+void imgsys_traw_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			  struct imgsys_ndd_frm_dump_info *frm_dump_info)
+{
+	const char *traw_name;
+	char file_name[NDD_FP_SIZE] = "\0";
+	ssize_t ret;
+	void *cq_va;
+
+	if (frm_dump_info->eng_e > IMGSYS_NDD_ENG_XTR ||
+	    frm_dump_info->eng_e < IMGSYS_NDD_ENG_TRAW)
+		return;
+
+	switch (frm_dump_info->eng_e) {
+	case IMGSYS_NDD_ENG_TRAW:
+		traw_name = "REG_TRAW_traw.reg";
+		break;
+	case IMGSYS_NDD_ENG_LTR:
+		traw_name = "REG_LTRAW_ltraw.reg";
+		break;
+	case IMGSYS_NDD_ENG_XTR:
+		traw_name = "REG_XTRAW_xtraw.reg";
+		break;
+	default:
+		return;
+	}
+
+	cq_va = imgsys_scp_get_reserve_mem_virt(TRAW_MEM_C_ID);
+	if (!cq_va)
+		return;
+
+	cq_va += frm_dump_info->cq_ofst[frm_dump_info->eng_e];
+
+	ret = snprintf(file_name, sizeof(file_name), "%s%s", frm_dump_info->fp, traw_name);
+	if (ret < 0 || ret >= sizeof(file_name)) {
+		dev_err(imgsys_dev->dev, "wrong traw ndd file name %s\n", file_name);
+		return;
+	}
+
+	if (frm_dump_info->user_buffer) {
+		ret = copy_to_user(frm_dump_info->user_buffer, file_name, sizeof(file_name));
+		if (ret)
+			return;
+		frm_dump_info->user_buffer += sizeof(file_name);
+
+		ret = copy_to_user(frm_dump_info->user_buffer, cq_va, TRAW_REG_RANGE);
+		if (ret)
+			return;
+		frm_dump_info->user_buffer += TRAW_REG_RANGE;
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_traw_ndd_dump);
+
 void imgsys_traw_uninit(struct mtk_imgsys_dev *imgsys_dev)
 {
 	unsigned int hw_idx;
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h
index f3727216b58c..57881bc2e191 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-traw.h
@@ -10,8 +10,11 @@
 #define _MTK_IMGSYS_TRAW_H_
 
 #include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-ndd_debugfs.h"
 
 void imgsys_traw_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_traw_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			  struct imgsys_ndd_frm_dump_info *frm_dump_info);
 void imgsys_traw_uninit(struct mtk_imgsys_dev *imgsys_dev);
 
 #endif /* _MTK_IMGSYS_TRAW_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c
index b19d61529b80..276af83a9ec2 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/of_address.h>
 #include "../mtk_imgsys-module_common.h"
+#include "../mtk_imgsys-scp.h"
 #include "mtk_imgsys-wpe.h"
 
 /********************************************************************
@@ -41,6 +42,10 @@
 #define DIPCQ_W1A_DIPCQ_CQ_THR13_CTL_OFFSET 0x0BD8
 #define DIPCQ_W1A_DIPCQ_CQ_THR14_CTL_OFFSET 0x0BE8
 
+#define WPE_REG_RANGE	0x1000
+#define WPE_PSP_END_OFST	0x554
+#define WPE_COEF_END_OFST	0x5D8
+
 #define WPE_INIT_ARRAY_COUNT	ARRAY_SIZE(mtk_imgsys_wpe_init_ary)
 /********************************************************************
  * Global Variable
@@ -101,6 +106,61 @@ void imgsys_wpe_init(struct mtk_imgsys_dev *imgsys_dev)
 }
 EXPORT_SYMBOL_GPL(imgsys_wpe_init);
 
+void imgsys_wpe_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			 struct imgsys_ndd_frm_dump_info *frm_dump_info)
+{
+	char file_name[NDD_FP_SIZE] = "\0";
+	void *cq_va, *psp_va;
+	u64 psp_ofst;
+	ssize_t ret;
+
+	if (frm_dump_info->eng_e > IMGSYS_NDD_ENG_WPE_LITE)
+		return;
+
+	if (!frm_dump_info->user_buffer)
+		return;
+
+	cq_va = imgsys_scp_get_reserve_mem_virt(WPE_MEM_C_ID);
+	if (!cq_va)
+		return;
+
+	cq_va += frm_dump_info->cq_ofst[frm_dump_info->eng_e];
+
+	psp_va = imgsys_scp_get_reserve_mem_virt(WPE_MEM_C_ID);
+	if (!psp_va)
+		return;
+
+	psp_ofst = frm_dump_info->wpe_psp_ofst[frm_dump_info->eng_e];
+	psp_va += psp_ofst;
+
+	ret = snprintf(file_name, sizeof(file_name),
+		       "%s%s", frm_dump_info->fp, frm_dump_info->wpe_fp);
+	if (ret < 0 || ret >= sizeof(file_name))
+		return;
+
+	ret = copy_to_user(frm_dump_info->user_buffer, file_name, sizeof(file_name));
+	frm_dump_info->user_buffer += sizeof(file_name);
+
+	if (psp_ofst != 0) {
+		ret = copy_to_user(frm_dump_info->user_buffer,
+				   cq_va, WPE_PSP_END_OFST);
+		frm_dump_info->user_buffer += WPE_PSP_END_OFST;
+
+		ret = copy_to_user(frm_dump_info->user_buffer,
+				   psp_va, WPE_COEF_END_OFST - WPE_PSP_END_OFST);
+		frm_dump_info->user_buffer += (WPE_COEF_END_OFST - WPE_PSP_END_OFST);
+
+		ret = copy_to_user(frm_dump_info->user_buffer,
+				   cq_va + WPE_COEF_END_OFST, WPE_REG_RANGE - WPE_COEF_END_OFST);
+		frm_dump_info->user_buffer += (WPE_REG_RANGE - WPE_COEF_END_OFST);
+	} else {
+		ret = copy_to_user(frm_dump_info->user_buffer,
+				   cq_va, WPE_REG_RANGE);
+		frm_dump_info->user_buffer += WPE_REG_RANGE;
+	}
+}
+EXPORT_SYMBOL_GPL(imgsys_wpe_ndd_dump);
+
 void imgsys_wpe_uninit(struct mtk_imgsys_dev *imgsys_dev)
 {
 	unsigned int hw_idx;
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h
index 6001575265e6..77b713bbe499 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_imgsys-wpe.h
@@ -10,8 +10,11 @@
 #define _MTK_IMGSYS_WPE_H_
 
 #include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-ndd_debugfs.h"
 
 void imgsys_wpe_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_wpe_ndd_dump(struct mtk_imgsys_dev *imgsys_dev,
+			 struct imgsys_ndd_frm_dump_info *frm_dump_info);
 void imgsys_wpe_uninit(struct mtk_imgsys_dev *imgsys_dev);
 
 #endif /* _MTK_IMGSYS_WPE_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h
index 850f6ec99a96..705d8c35ff55 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h
@@ -81,6 +81,10 @@ struct img_init_info {
  * @is_earlycb: Indicates if early callback is enabled
  * @sw_goft: offset of GCE buffer
  * @g_swbuf: virtual address of GCE buffer
+ * @ndd_cq_ofst: NDD CQ offset
+ * @ndd_wpe_psp_ofst: NDD WPE PSP offset
+ * @ndd_wpe_fp: NDD WPE file path
+ * @ndd_fp: NDD file path
  *
  * These fields are primarily set by SCP (System Control Processor) and used by
  * the kernel for processing and verifing data.
@@ -92,6 +96,10 @@ struct img_swfrm_info {
 	u8 is_earlycb;
 	u64 sw_goft;
 	void *g_swbuf;
+	u64 ndd_cq_ofst[IMG_MAX_HW];
+	u64 ndd_wpe_psp_ofst[WPE_ENG_NUM];
+	char ndd_wpe_fp[64];
+	char ndd_fp[256];
 } __packed;
 
 /**
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c
index ef86410e3d23..7e5b7cd383f9 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-gce_work.c
@@ -2,6 +2,7 @@
 
 #include "mtk_imgsys-scp.h"
 #include "mtk_imgsys-gce_work.h"
+#include "mtk_imgsys-ndd_debugfs.h"
 
 static void cmdq_cb_done_worker(struct work_struct *work)
 {
@@ -17,6 +18,9 @@ static void cmdq_cb_done_worker(struct work_struct *work)
 	if (!pipe->streaming)
 		return;
 
+	if (gwfrm_info->user_info[0].ndd_fp[0] != '\0')
+		wait_event(gwork->wait_queue, atomic_read(&gwork->state) == WORK_COMPLETED);
+
 	/* send to SCP after frame done & del node from list */
 	swbuf_data.offset = gwfrm_info->req_sbuf_goft;
 	imgsys_scp_send(pipe->imgsys_dev, IPI_IMGSYS_DEQUE_DONE_ID,
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c
index 5daa8f863bd2..c31ada82afcd 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_main.c
@@ -10,6 +10,7 @@
 #include <linux/of_address.h>
 #include "mtk_imgsys-module_common.h"
 #include "mtk_imgsys-module_main.h"
+#include "mtk_imgsys-ndd_debugfs.h"
 
 /********************************************************************
  * Global Define
@@ -147,6 +148,7 @@ void imgsys_main_init(struct mtk_imgsys_dev *imgsys_dev)
 	}
 
 	imgsys_main_hw_init(imgsys_dev);
+	imgsys_ndd_debugfs_init(imgsys_dev);
 }
 
 void imgsys_main_uninit(struct mtk_imgsys_dev *imgsys_dev)
@@ -180,4 +182,6 @@ void imgsys_main_uninit(struct mtk_imgsys_dev *imgsys_dev)
 		iounmap(dip2_reg_base);
 		dip2_reg_base = NULL;
 	}
+
+	imgsys_ndd_debugfs_uninit(imgsys_dev);
 }
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
index a2eea8f4fb3c..1dc28993bc09 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
@@ -25,14 +25,23 @@ enum mtk_imgsys_module {
 };
 
 struct mtk_imgsys_dev;
+struct imgsys_ndd_frm_dump_info;
 
 /**
  * struct module_ops - Operations for a specific module in the MediaTek Image System
+ *
  * @module_id: Identifier for the module.
  * @init: Function pointer to initialize the module.
  *        This function sets the default values for various software-related
  *        parameters and ensures that the module is ready for operation.
  *        Example function: imgsys_dip_init
+ * @ndddump: Function pointer to perform a dump of the module's frame information.
+ *           This function is responsible for dumping frame-related information.
+ *           It is typically used for debugging and diagnostic purposes to analyze
+ *           the state of the system and the frames being processed.
+ *           The dumped information can be used to trace issues or verify the
+ *           correctness of the frame processing pipeline.
+ *           Example function: imgsys_dip_ndd_dump
  * @uninit: Function pointer to uninitialize the module.
  *          This function resets various software-related parameters to ensure
  *          the module is properly cleaned up and ready for shutdown.
@@ -48,6 +57,8 @@ struct mtk_imgsys_dev;
 struct module_ops {
 	int module_id;
 	void (*init)(struct mtk_imgsys_dev *imgsys_dev);
+	void (*ndddump)(struct mtk_imgsys_dev *imgsys_dev,
+			struct imgsys_ndd_frm_dump_info *frm_dump_info);
 	void (*uninit)(struct mtk_imgsys_dev *imgsys_dev);
 };
 #endif /* _MTK_IMGSYS_MODULES_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c
new file mode 100644
index 000000000000..d0c1168fbd06
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Christopher Chen <christopher.chen@mediatek.com>
+ *
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc.h>
+#include <linux/uaccess.h>
+#include <soc/mediatek/smi.h>
+#include "mtk_imgsys-ndd_debugfs.h"
+#include "mtk_imgsys-module_common.h"
+#include "mtk_imgsys-gce_work.h"
+
+#define WPE_ENG_NUM		3
+#define TRAW_ENG_NUM	3
+#define DIP_ENG_NUM		1
+#define PQDIP_ENG_NUM	2
+#define ME_ENG_NUM		1
+
+#define WPE_NDD_SIZE	0x1000
+#define TRAW_NDD_SIZE	0xC000
+#define DIP_NDD_SIZE	0x5F000
+#define PQDIP_NDD_SIZE	0x6000
+#define ME_NDD_SIZE		0xA20
+
+struct ndd_request_t {
+	int fd;
+	struct list_head list;
+} __packed;
+
+struct user_ndd_requests_t {
+	struct list_head ndd_req_list; /* ndd_request_t list */
+	struct mutex lock; /* protect the ndd_req_list list*/
+};
+
+struct ndd_frame_info_t {
+	struct list_head ndd_swfrm_list; /* ndd_swfrm_info_t list */
+	struct mutex lock; /* protect the ndd_swfrm_list list*/
+};
+
+struct ndd_wpe_info_t {
+	char fp[NDD_FP_SIZE];
+	u8 data[WPE_NDD_SIZE];
+};
+
+struct ndd_traw_info_t {
+	char fp[NDD_FP_SIZE];
+	u8 data[TRAW_NDD_SIZE];
+};
+
+struct ndd_dip_info_t {
+	char fp[NDD_FP_SIZE];
+	u8 data[DIP_NDD_SIZE];
+};
+
+struct ndd_pqdip_info_t {
+	char fp[NDD_FP_SIZE];
+	u8 data[PQDIP_NDD_SIZE];
+};
+
+struct ndd_me_info_t {
+	char fp[NDD_FP_SIZE];
+	u8 data[ME_NDD_SIZE];
+};
+
+struct ndd_frm_info_t {
+	struct ndd_wpe_info_t	wpe[WPE_ENG_NUM];
+	struct ndd_traw_info_t	traw[TRAW_ENG_NUM];
+	struct ndd_dip_info_t	dip[DIP_ENG_NUM];
+	struct ndd_pqdip_info_t	pqdip[PQDIP_ENG_NUM];
+	struct ndd_me_info_t	me[ME_ENG_NUM];
+} __packed;
+
+static struct ndd_frame_info_t *ndd_frames;
+
+#if defined(CONFIG_DEBUG_FS)
+#define DEBUGFS_DIR "mtk_imgsys_debug"
+#define DEBUGFS_FILE "mtk_imgsys_ndd"
+#define FILE_PERMISSIONS 0644
+
+static struct dentry *debugfs_dir, *debugfs_file;
+static struct user_ndd_requests_t *ndd_reqs;
+
+static ssize_t debugfs_write(struct file *file, const char __user *user_buffer,
+			     size_t count, loff_t *ppos)
+{
+	char buffer[64];
+	int ret;
+	struct ndd_request_t *current_request;
+
+	if (count >= sizeof(buffer))
+		return -EINVAL;
+
+	if (copy_from_user(buffer, user_buffer, count))
+		return -EFAULT;
+
+	buffer[count] = '\0';
+
+	current_request = kmalloc(sizeof(*current_request), GFP_KERNEL);
+	if (!current_request)
+		return -ENOMEM;
+
+	ret = sscanf(buffer, "fd=%d", &current_request->fd);
+	if (ret != 1)
+		return -EINVAL;
+
+	mutex_lock(&ndd_reqs->lock);
+	list_add_tail(&current_request->list, &ndd_reqs->ndd_req_list);
+	mutex_unlock(&ndd_reqs->lock);
+
+	*ppos += count;
+
+	return count;
+}
+
+static void imgsys_ndd_dump_routine(struct mtk_imgsys_dev *imgsys_dev,
+				    struct imgsys_ndd_frm_dump_info *frm_dump_info)
+{
+	int i = 0;
+	int mid = 0;
+	unsigned int hw_num = 0x1;
+	unsigned int module_copy_ofst = 0;
+	const struct module_ops *imgsys_modules = imgsys_dev->modules;
+
+	dev_dbg(imgsys_dev->dev,
+		"%s: hw comb set: 0x%x\n", __func__, frm_dump_info->hw_comb);
+
+	for (i = 0; hw_num < IMGSYS_ENG_MAX_NUM; i++, hw_num = (0x1 << i)) {
+		switch (hw_num) {
+		case IMGSYS_ENG_WPE_EIS:
+		case IMGSYS_ENG_WPE_TNR:
+		case IMGSYS_ENG_WPE_LITE:
+			module_copy_ofst = (NDD_FP_SIZE + WPE_NDD_SIZE);
+			mid = IMGSYS_MOD_WPE;
+			break;
+		case IMGSYS_ENG_TRAW:
+		case IMGSYS_ENG_LTR:
+		case IMGSYS_ENG_XTR:
+			module_copy_ofst = (NDD_FP_SIZE + TRAW_NDD_SIZE);
+			mid = IMGSYS_MOD_TRAW;
+			break;
+		case IMGSYS_ENG_DIP:
+			module_copy_ofst = (NDD_FP_SIZE + DIP_NDD_SIZE);
+			mid = IMGSYS_MOD_DIP;
+			break;
+		case IMGSYS_ENG_PQDIP_A:
+		case IMGSYS_ENG_PQDIP_B:
+			module_copy_ofst = (NDD_FP_SIZE + PQDIP_NDD_SIZE);
+			mid = IMGSYS_MOD_PQDIP;
+			break;
+		case IMGSYS_ENG_ME:
+			module_copy_ofst = (NDD_FP_SIZE + ME_NDD_SIZE);
+			mid = IMGSYS_MOD_ME;
+			break;
+		default:
+			dev_err(imgsys_dev->dev, "%s get wrong hw id %d\n", __func__, hw_num);
+			break;
+		}
+
+		if (frm_dump_info->hw_comb & hw_num) {
+			frm_dump_info->eng_e = i;
+			if (imgsys_modules[mid].ndddump &&
+			    frm_dump_info->eng_e <= IMGSYS_NDD_ENG_ME)
+				imgsys_modules[mid].ndddump(imgsys_dev, frm_dump_info);
+		} else {
+			if (frm_dump_info->user_buffer)
+				frm_dump_info->user_buffer += module_copy_ofst;
+			else
+				frm_dump_info->user_buffer = NULL;
+		}
+
+		if ((frm_dump_info->hw_comb >> i) == 0)
+			return;
+	}
+}
+
+static ssize_t debugfs_read(struct file *file, char __user *user_buffer,
+			    size_t count, loff_t *ppos)
+{
+	struct ndd_swfrm_info_t *cur_ndd_swfrm = NULL, *swfrm_temp = NULL;
+	struct ndd_request_t *cur_user_req = NULL, *req_temp = NULL;
+	struct img_swfrm_info *subfrm_info = NULL;
+	struct imgsys_ndd_frm_dump_info frm_dump_info = { 0 };
+	struct gce_cb_work_pool *work_pool = NULL;
+	ssize_t read_count = 0;
+	size_t buffer_size = count;
+	bool found = false;
+	int frm, ret = 0;
+	u32 gce_cb_work_idx = MTK_IMGSYS_GCE_CB_MAX_WORK_ITEMS;
+
+	mutex_lock(&ndd_frames->lock);
+
+	list_for_each_entry_safe(cur_ndd_swfrm, swfrm_temp, &ndd_frames->ndd_swfrm_list, list) {
+		mutex_lock(&ndd_reqs->lock);
+		list_for_each_entry_safe(cur_user_req, req_temp, &ndd_reqs->ndd_req_list, list) {
+			if (cur_ndd_swfrm->gwfrm_info &&
+			    cur_ndd_swfrm->gwfrm_info->request_fd == cur_user_req->fd) {
+				found = true;
+				break;
+			}
+		}
+		mutex_unlock(&ndd_reqs->lock);
+
+		if (found) {
+			for (frm = 0; frm < cur_ndd_swfrm->gwfrm_info->total_frmnum; frm++) {
+				subfrm_info = &cur_ndd_swfrm->gwfrm_info->user_info[frm];
+				memset(&frm_dump_info, 0, sizeof(frm_dump_info));
+
+				if (buffer_size < sizeof(struct ndd_frm_info_t)) {
+					ret = -ENOMEM;
+					goto out;
+				}
+
+				if (subfrm_info->ndd_fp[0] == '\0')
+					continue;
+
+				frm_dump_info.user_buffer = user_buffer +
+					sizeof(struct ndd_frm_info_t) * frm;
+				frm_dump_info.hw_comb = subfrm_info->hw_comb;
+				frm_dump_info.cq_ofst = subfrm_info->ndd_cq_ofst;
+				frm_dump_info.wpe_psp_ofst = subfrm_info->ndd_wpe_psp_ofst;
+				frm_dump_info.wpe_fp = subfrm_info->ndd_wpe_fp;
+				frm_dump_info.fp = subfrm_info->ndd_fp;
+
+				imgsys_ndd_dump_routine(cur_ndd_swfrm->imgsys_dev, &frm_dump_info);
+				read_count += sizeof(struct ndd_frm_info_t);
+				buffer_size -= sizeof(struct ndd_frm_info_t);
+			}
+
+			work_pool = cur_ndd_swfrm->imgsys_dev->work_pool;
+			do {
+				gce_cb_work_idx = atomic_read(&cur_ndd_swfrm->gce_cb_work_idx);
+			} while (gce_cb_work_idx == MTK_IMGSYS_GCE_CB_MAX_WORK_ITEMS);
+			atomic_set(&work_pool->work_items[gce_cb_work_idx].state, WORK_COMPLETED);
+			wake_up(&work_pool->work_items[gce_cb_work_idx].wait_queue);
+
+			list_del(&cur_ndd_swfrm->list);
+			kfree(cur_ndd_swfrm);
+			cur_ndd_swfrm = NULL;
+			list_del(&cur_user_req->list);
+			kfree(cur_user_req);
+			cur_user_req = NULL;
+			break;
+		}
+	}
+
+	if (!found)
+		ret = -ENOENT;
+out:
+	mutex_unlock(&ndd_frames->lock);
+
+	return ret == 0 ? read_count : ret;
+}
+
+static const struct file_operations debugfs_fops = {
+	.write = debugfs_write,
+	.read = debugfs_read,
+};
+
+void imgsys_ndd_debugfs_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	debugfs_dir = debugfs_create_dir(DEBUGFS_DIR, NULL);
+	if (!debugfs_dir) {
+		dev_err(imgsys_dev->dev, "%s Failed to create debugfs dir\n", __func__);
+		return;
+	}
+
+	debugfs_file = debugfs_create_file(DEBUGFS_FILE, FILE_PERMISSIONS,
+					   debugfs_dir, NULL, &debugfs_fops);
+	if (!debugfs_file) {
+		dev_err(imgsys_dev->dev, "%s Failed to create debugfs file\n", __func__);
+		return;
+	}
+
+	ndd_frames = kmalloc(sizeof(*ndd_frames), GFP_KERNEL);
+	if (!ndd_frames)
+		return;
+	INIT_LIST_HEAD(&ndd_frames->ndd_swfrm_list);
+	mutex_init(&ndd_frames->lock);
+
+	ndd_reqs = kmalloc(sizeof(*ndd_reqs), GFP_KERNEL);
+	if (!ndd_reqs)
+		return;
+	INIT_LIST_HEAD(&ndd_reqs->ndd_req_list);
+	mutex_init(&ndd_reqs->lock);
+}
+EXPORT_SYMBOL_GPL(imgsys_ndd_debugfs_init);
+
+void imgsys_ndd_debugfs_uninit(struct mtk_imgsys_dev *imgsys_dev)
+{
+	struct ndd_request_t *req, *tmp;
+
+	debugfs_remove(debugfs_file);
+	debugfs_remove(debugfs_dir);
+
+	mutex_lock(&ndd_reqs->lock);
+	list_for_each_entry_safe(req, tmp, &ndd_reqs->ndd_req_list, list) {
+		list_del(&req->list);
+		kfree(req);
+	}
+	mutex_unlock(&ndd_reqs->lock);
+	kfree(ndd_reqs);
+
+	mutex_lock(&ndd_frames->lock);
+	list_for_each_entry_safe(req, tmp, &ndd_frames->ndd_swfrm_list, list) {
+		list_del(&req->list);
+		kfree(req);
+	}
+	mutex_unlock(&ndd_frames->lock);
+	kfree(ndd_frames);
+}
+EXPORT_SYMBOL_GPL(imgsys_ndd_debugfs_uninit);
+#endif
+
+void imgsys_ndd_swfrm_list_add(struct mtk_imgsys_dev *imgsys_dev,
+			       struct swfrm_info *gwfrm_info)
+{
+	struct ndd_swfrm_info_t *new_ndd_swfrm;
+
+	new_ndd_swfrm = kzalloc(sizeof(*new_ndd_swfrm), GFP_KERNEL);
+	if (!new_ndd_swfrm)
+		return;
+
+	new_ndd_swfrm->imgsys_dev = imgsys_dev;
+	new_ndd_swfrm->gwfrm_info = gwfrm_info;
+	atomic_set(&new_ndd_swfrm->gce_cb_work_idx, MTK_IMGSYS_GCE_CB_MAX_WORK_ITEMS);
+
+	gwfrm_info->ndd_swfrm_info = (void *)new_ndd_swfrm;
+
+	mutex_lock(&ndd_frames->lock);
+	list_add_tail(&new_ndd_swfrm->list, &ndd_frames->ndd_swfrm_list);
+	mutex_unlock(&ndd_frames->lock);
+}
+EXPORT_SYMBOL_GPL(imgsys_ndd_swfrm_list_add);
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h
new file mode 100644
index 000000000000..f45cacc7bfff
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-ndd_debugfs.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Christopher Chen <christopher.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_NDD_DEBUGFS_H_
+#define _MTK_IMGSYS_NDD_DEBUGFS_H_
+
+#include "mtk_imgsys-dev.h"
+
+#define NDD_FP_SIZE 256 /* NDD file path size */
+
+enum mtk_imgsys_ndd_eng {
+	IMGSYS_NDD_ENG_WPE_EIS	= 0,
+	IMGSYS_NDD_ENG_WPE_TNR	= 1,
+	IMGSYS_NDD_ENG_WPE_LITE	= 2,
+	IMGSYS_NDD_ENG_ADL_A	= 3,
+	IMGSYS_NDD_ENG_ADL_B	= 4,
+	IMGSYS_NDD_ENG_TRAW	= 5,
+	IMGSYS_NDD_ENG_LTR	= 6,
+	IMGSYS_NDD_ENG_XTR	= 7,
+	IMGSYS_NDD_ENG_DIP	= 8,
+	IMGSYS_NDD_ENG_PQDIP_A	= 9,
+	IMGSYS_NDD_ENG_PQDIP_B	= 10,
+	IMGSYS_NDD_ENG_ME	= 11,
+	IMGSYS_NDD_ENG_MAX_NUM	= 12
+};
+
+struct imgsys_ndd_frm_dump_info {
+	char __user *user_buffer;
+	unsigned int hw_comb;
+	enum mtk_imgsys_ndd_eng eng_e;
+	u64 *cq_ofst;
+	u64 *wpe_psp_ofst;
+	char *wpe_fp;
+	char *fp;
+};
+
+struct ndd_swfrm_info_t {
+	struct mtk_imgsys_dev *imgsys_dev;
+	struct swfrm_info *gwfrm_info;
+	struct list_head list;
+	atomic_t gce_cb_work_idx;
+} __packed;
+
+#if defined(CONFIG_DEBUG_FS)
+void imgsys_ndd_debugfs_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_ndd_debugfs_uninit(struct mtk_imgsys_dev *imgsys_dev);
+#else
+static inline void imgsys_ndd_debugfs_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+}
+
+static inline void imgsys_ndd_debugfs_uninit(struct mtk_imgsys_dev *imgsys_dev)
+{
+}
+#endif
+void imgsys_ndd_swfrm_list_add(struct mtk_imgsys_dev *imgsys_dev,
+			       struct swfrm_info *gwfrm_info);
+#endif /* _MTK_IMGSYS_DEBUG_H_ */
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
index 36088a5bda8e..a87b254cd114 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
@@ -16,6 +16,7 @@
 #include "mtk_imgsys-gce_work.h"
 #include "mtk_header_desc.h"
 #include "mtk_imgsys_v4l2_vnode.h"
+#include "mtk_imgsys-ndd_debugfs.h"
 
 #define FRAME_STATE_INIT		0
 #define FRAME_STATE_HW_TIMEOUT		1
@@ -60,6 +61,7 @@ static void imgsys_cmdq_cb_func(struct imgsys_cmdq_cb_data data)
 	struct mtk_imgsys_dev *imgsys_dev;
 	struct swfrm_info *swfrminfo_cb;
 	struct gce_cb_work *gwork;
+	struct ndd_swfrm_info_t *ndd_swfrm;
 
 	swfrminfo_cb = data.data;
 	pipe = (struct mtk_imgsys_pipe *)swfrminfo_cb->pipe;
@@ -94,6 +96,12 @@ static void imgsys_cmdq_cb_func(struct imgsys_cmdq_cb_data data)
 		gwork->pipe = swfrminfo_cb->pipe;
 		init_waitqueue_head(&gwork->wait_queue);
 
+		if (swfrminfo_cb->user_info[0].ndd_fp[0] != '\0') {
+			ndd_swfrm = (struct ndd_swfrm_info_t *)swfrminfo_cb->ndd_swfrm_info;
+			if (ndd_swfrm)
+				atomic_set(&ndd_swfrm->gce_cb_work_idx, gwork->work_idx);
+		}
+
 		queue_work(req->imgsys_pipe->imgsys_dev->gcecb_wq, &gwork->work);
 	}
 }
@@ -207,6 +215,9 @@ static void imgsys_scp_handler(void *data, unsigned int len, void *priv)
 
 	up(&imgsys_dev->sem);
 
+	if (swfrm_info->user_info[0].ndd_fp[0] != '\0')
+		imgsys_ndd_swfrm_list_add(imgsys_dev, swfrm_info);
+
 	INIT_WORK(&req->runner_work, imgsys_runner_func);
 	queue_work(req->imgsys_pipe->imgsys_dev->runner_wq,
 		   &req->runner_work);
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
index ea2ce03c2619..b0088d4de69c 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
@@ -26,6 +26,7 @@
 #include "modules/mtk_imgsys-traw.h"
 #include "modules/mtk_imgsys-pqdip.h"
 #include "modules/mtk_imgsys-wpe.h"
+#include "modules/mtk_imgsys-me.h"
 #include "mtk_imgsys-of.h"
 #include "mtk_imgsys-vnode_id.h"
 #include "mtk_imgsys_v4l2_vnode.h"
@@ -1846,31 +1847,37 @@ static const struct module_ops imgsys_isp7_modules[] = {
 	[IMGSYS_MOD_IMGMAIN] = {
 		.module_id = IMGSYS_MOD_IMGMAIN,
 		.init = imgsys_main_init,
+		.ndddump = NULL,
 		.uninit = imgsys_main_uninit,
 	},
 	[IMGSYS_MOD_WPE] = {
 		.module_id = IMGSYS_MOD_WPE,
 		.init = imgsys_wpe_init,
+		.ndddump = imgsys_wpe_ndd_dump,
 		.uninit = imgsys_wpe_uninit,
 	},
 	[IMGSYS_MOD_TRAW] = {
 		.module_id = IMGSYS_MOD_TRAW,
 		.init = imgsys_traw_init,
+		.ndddump = imgsys_traw_ndd_dump,
 		.uninit = imgsys_traw_uninit,
 	},
 	[IMGSYS_MOD_DIP] = {
 		.module_id = IMGSYS_MOD_DIP,
 		.init = imgsys_dip_init,
+		.ndddump = imgsys_dip_ndd_dump,
 		.uninit = imgsys_dip_uninit,
 	},
 	[IMGSYS_MOD_PQDIP] = {
 		.module_id = IMGSYS_MOD_PQDIP,
 		.init = imgsys_pqdip_init,
+		.ndddump = imgsys_pqdip_ndd_dump,
 		.uninit = imgsys_pqdip_uninit,
 	},
 	[IMGSYS_MOD_ME] = {
 		.module_id = IMGSYS_MOD_ME,
 		.init = NULL,
+		.ndddump = imgsys_me_ndd_dump,
 		.uninit = NULL,
 	},
 };
-- 
2.45.2


