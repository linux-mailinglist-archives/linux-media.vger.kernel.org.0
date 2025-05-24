Return-Path: <linux-media+bounces-33315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA707AC2F8B
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA7E14A551F
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805741E7C10;
	Sat, 24 May 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e4/Sbafw"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CD72628D;
	Sat, 24 May 2025 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087528; cv=none; b=t3Skkn+o93J6DhW3OUlOAmZBqvcyMnH6LG1mMlnmB0UHygTVwa+81KqPuCNCamTCq5YP/CcZulMEqzMJQPjt3BACG9R4FGDqa0ZPPS62K9l/r6iLq/CEcjuKuXP23yas7ptetrco71/e7l6aoBdNBAm1VjLDR4JghqRrZPUWVPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087528; c=relaxed/simple;
	bh=sKxvTiAI2I+14IHRf/brUv2jEtyU6dy4HJeHzviC2L4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJuZdYUcQk7VMPL9WHGHfz+vvzr5YOKefsV543+grb8/sl/PIogrUmciagMnyp1io3zMldj+/UHUqm8Ej6IapvYjr1dY+r2bnpUvUPlvUynbBhuvhr81qBcuEInEQ6RP7X/LgGYpr73UdJ2WGkrHUxYBhlpmKa+jibX+erjelO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=e4/Sbafw; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7b046d26389511f0813e4fe1310efc19-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/z+bsZKsBfIBHHVZrtMwqYH16nsQ/48zaWhfdDZkJ0Y=;
	b=e4/SbafwCFVwwv/QD+EED7S2eB17rsQtJZIMY/UhyBRPiybtlLxAHLZAqc3yr1ubpG2UE+iIsUfbJ00UJRBEtijWPBSgVCIR9EuHI+KjuXzXI7U3vImh74XTs7DWx4iaMayumPCfDTnnTVo3Y0L0jhoBROPRhcl4AELkKTMIOYk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:17ce16b5-a09f-4555-918f-edc04f1b2d64,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:738ded57-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b046d26389511f0813e4fe1310efc19-20250524
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1362999662; Sat, 24 May 2025 19:51:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH v1 07/10] media: mediatek: isp: Add CMDQ support for ImgSys driver
Date: Sat, 24 May 2025 19:49:59 +0800
Message-ID: <20250524115144.3832748-8-olivia.wen@mediatek.com>
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
focusing on CMDQ (Command Queue) support for the MediaTek Image System
driver. CMDQ is essential for managing and executing hardware commands
efficiently, ensuring smooth operation of image processing tasks within
the ImgSys architecture.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../mediatek/isp/isp_7x/imgsys/Makefile       |   1 +
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h  | 502 +++++++++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq.c       | 690 ++++++++++++++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-cmdq.h       |  29 +
 .../isp_7x/imgsys/mtk_imgsys-module_common.h  |  20 +
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.c        |   5 +
 6 files changed, 1247 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
index 26c8c1d39750..c0f0f3a0c38a 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
@@ -2,6 +2,7 @@
 #
 
 mtk_imgsys_util-objs := \
+mtk_imgsys-cmdq.o \
 mtk_imgsys-module_main.o \
 mtk_imgsys-of.o \
 mtk_imgsys-formats.o \
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h
new file mode 100644
index 000000000000..801a12e70bac
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq-plat.h
@@ -0,0 +1,502 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Daniel Huang <daniel.huang@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_CMDQ_PLAT_H_
+#define _MTK_IMGSYS_CMDQ_PLAT_H_
+
+#include "mtk_imgsys-cmdq.h"
+
+/* Maximum number of frame blocks for GCE recording */
+#define GCE_REC_MAX_FRAME_BLOCK	40
+
+/* Maximum number of tile blocks for GCE recording */
+#define GCE_REC_MAX_TILE_BLOCK	40
+
+/* Maximum number of label counts for GCE recording */
+#define GCE_REC_MAX_LABEL_COUNT	2048
+
+/* Maximum number of image system engines */
+#define IMGSYS_ENG_MAX 10
+
+/* Start address of the image system register */
+#define IMGSYS_REG_START 0x15000000
+
+/* End address of the image system register */
+#define IMGSYS_REG_END 0x1570FFFF
+
+/* Number of normal camera's thread */
+#define IMGSYS_NOR_THD 10
+
+/* Define the constants for buffer validation */
+#define HEADER_CODE	0x5A5A5A5A
+#define CHECK_PRE	0x55AA55AA
+#define CHECK_POST	0xAA55AA55
+#define FOOTER_CODE	0xA5A5A5A5
+
+/* Enumeration for Image System (IMGSYS) events */
+enum mtk_imgsys_event {
+	/* HW event */
+	/* TRAW frame done events */
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_0 = 0,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_1,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_2,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_3,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_4,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_5,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_6,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_7,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_8,
+	IMGSYS_EVENT_TRAW0_CQ_THR_DONE_9,
+	/* LTRAW frame done events */
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_0,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_1,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_2,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_3,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_4,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_5,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_6,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_7,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_8,
+	IMGSYS_EVENT_TRAW1_CQ_THR_DONE_9,
+	/* XTRAW frame done events */
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_0,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_1,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_2,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_3,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_4,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_5,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_6,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_7,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_8,
+	IMGSYS_EVENT_XTRAW_CQ_THR_DONE_9,
+	/* DIP frame done events */
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_0,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_1,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_2,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_3,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_4,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_5,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_6,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_7,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_8,
+	IMGSYS_EVENT_DIP_CQ_THR_DONE_9,
+	/* PQ_DIP_A frame done events */
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_0,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_1,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_2,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_3,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_4,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_5,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_6,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_7,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_8,
+	IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_9,
+	/* PQ_DIP_B frame done events */
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_0,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_1,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_2,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_3,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_4,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_5,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_6,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_7,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_8,
+	IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_9,
+	/* WPE_EIS frame done events */
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_0,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_1,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_2,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_3,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_4,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_5,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_6,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_7,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_8,
+	IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_9,
+	/* WPE_TNR frame done events */
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_0,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_1,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_2,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_3,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_4,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_5,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_6,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_7,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_8,
+	IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_9,
+	/* WPE_LITE frame done events */
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_0,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_1,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_2,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_3,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_4,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_5,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_6,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_7,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_8,
+	IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_9,
+	/* ME done events */
+	IMGSYS_EVENT_IMGSYS_IPE_ME_DONE,
+	/* SW events */
+	IMGSYS_EVENT_SYNC_TOKEN_START,
+	IMGSYS_EVENT_SYNC_TOKEN_WPE_EIS = IMGSYS_EVENT_SYNC_TOKEN_START,
+	IMGSYS_EVENT_SYNC_TOKEN_WPE_TNR,
+	IMGSYS_EVENT_SYNC_TOKEN_WPE_LITE,
+	IMGSYS_EVENT_SYNC_TOKEN_TRAW,
+	IMGSYS_EVENT_SYNC_TOKEN_LTRAW,
+	IMGSYS_EVENT_SYNC_TOKEN_XTRAW,
+	IMGSYS_EVENT_SYNC_TOKEN_DIP,
+	IMGSYS_EVENT_SYNC_TOKEN_PQDIP_A,
+	IMGSYS_EVENT_SYNC_TOKEN_PQDIP_B,
+	IMGSYS_EVENT_SYNC_TOKEN_IPESYS_ME,
+	IMGSYS_EVENT_SYNC_TOKEN_APUSYS_APU,
+	IMGSYS_EVENT_SYNC_TOKEN_VSS_TRAW,
+	IMGSYS_EVENT_SYNC_TOKEN_VSS_LTRAW,
+	IMGSYS_EVENT_SYNC_TOKEN_VSS_XTRAW,
+	IMGSYS_EVENT_SYNC_TOKEN_VSS_DIP,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_START,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_1 = IMGSYS_EVENT_SYNC_TOKEN_POOL_START,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_2,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_3,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_4,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_5,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_6,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_7,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_8,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_9,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_10,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_11,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_12,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_13,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_14,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_15,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_16,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_17,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_18,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_19,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_20,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_21,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_22,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_23,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_24,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_25,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_26,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_27,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_28,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_29,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_30,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_31,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_32,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_33,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_34,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_35,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_36,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_37,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_38,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_39,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_40,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_41,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_42,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_43,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_44,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_45,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_46,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_47,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_48,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_49,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_50,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_51,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_52,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_53,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_54,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_55,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_56,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_57,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_58,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_59,
+	IMGSYS_EVENT_SYNC_TOKEN_POOL_60,
+	IMGSYS_EVENT_SYNC_TOKEN_END = IMGSYS_EVENT_SYNC_TOKEN_POOL_60,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_1,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_2,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_3,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_4,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_5,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_6,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_7,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_8,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_9,
+	IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_10,
+	IMGSYS_EVENT_SYNC_TOKEN_TZMP_ISP_WAIT,
+	IMGSYS_EVENT_SYNC_TOKEN_TZMP_ISP_SET,
+	IMGSYS_EVENT_MAX
+};
+
+/* Structure to represent an IMGSYS event */
+struct imgsys_event_table {
+	u16 event;
+	char dts_name[256];
+};
+
+/* Event table for Image System (IMGSYS) */
+static struct imgsys_event_table imgsys_event[] = {
+	/* TRAW frame done events */
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_0, "traw_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_1, "traw_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_2, "traw_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_3, "traw_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_4, "traw_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_5, "traw_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_6, "traw_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_7, "traw_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_8, "traw_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_TRAW0_CQ_THR_DONE_9, "traw_cq_thread9_frame_done"},
+	/* LTRAW frame done events */
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_0, "ltraw_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_1, "ltraw_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_2, "ltraw_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_3, "ltraw_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_4, "ltraw_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_5, "ltraw_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_6, "ltraw_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_7, "ltraw_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_8, "ltraw_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_TRAW1_CQ_THR_DONE_9, "ltraw_cq_thread9_frame_done"},
+	/* XTRAW frame done events */
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_0, "xtraw_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_1, "xtraw_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_2, "xtraw_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_3, "xtraw_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_4, "xtraw_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_5, "xtraw_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_6, "xtraw_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_7, "xtraw_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_8, "xtraw_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_XTRAW_CQ_THR_DONE_9, "xtraw_cq_thread9_frame_done"},
+	/* DIP frame done events */
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_0, "dip_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_1, "dip_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_2, "dip_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_3, "dip_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_4, "dip_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_5, "dip_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_6, "dip_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_7, "dip_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_8, "dip_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_DIP_CQ_THR_DONE_9, "dip_cq_thread9_frame_done"},
+	/* PQ_DIP_A frame done events */
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_0, "pqa_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_1, "pqa_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_2, "pqa_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_3, "pqa_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_4, "pqa_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_5, "pqa_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_6, "pqa_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_7, "pqa_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_8, "pqa_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_A_CQ_THR_DONE_9, "pqa_cq_thread9_frame_done"},
+	/* PQ_DIP_B frame done events */
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_0, "pqb_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_1, "pqb_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_2, "pqb_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_3, "pqb_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_4, "pqb_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_5, "pqb_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_6, "pqb_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_7, "pqb_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_8, "pqb_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_PQDIP_B_CQ_THR_DONE_9, "pqb_cq_thread9_frame_done"},
+	/* WPE_EIS frame done events */
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_0, "wpe_eis_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_1, "wpe_eis_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_2, "wpe_eis_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_3, "wpe_eis_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_4, "wpe_eis_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_5, "wpe_eis_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_6, "wpe_eis_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_7, "wpe_eis_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_8, "wpe_eis_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_WPE_EIS_CQ_THR_DONE_9, "wpe_eis_cq_thread9_frame_done"},
+	/* WPE_TNR frame done events */
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_0, "wpe_tnr_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_1, "wpe_tnr_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_2, "wpe_tnr_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_3, "wpe_tnr_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_4, "wpe_tnr_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_5, "wpe_tnr_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_6, "wpe_tnr_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_7, "wpe_tnr_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_8, "wpe_tnr_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_WPE_TNR_CQ_THR_DONE_9, "wpe_tnr_cq_thread9_frame_done"},
+	/* WPE_LITE frame done events */
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_0, "wpe_lite_cq_thread0_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_1, "wpe_lite_cq_thread1_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_2, "wpe_lite_cq_thread2_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_3, "wpe_lite_cq_thread3_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_4, "wpe_lite_cq_thread4_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_5, "wpe_lite_cq_thread5_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_6, "wpe_lite_cq_thread6_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_7, "wpe_lite_cq_thread7_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_8, "wpe_lite_cq_thread8_frame_done"},
+	{ IMGSYS_EVENT_WPE_LITE_CQ_THR_DONE_9, "wpe_lite_cq_thread9_frame_done"},
+	/* ME done events */
+	{ IMGSYS_EVENT_IMGSYS_IPE_ME_DONE, "me_done"},
+	/* SW events */
+	{ IMGSYS_EVENT_SYNC_TOKEN_WPE_EIS, "wpe_eis_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_WPE_TNR, "wpe_tnr_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_WPE_LITE, "wpe_lite_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_TRAW, "traw_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_LTRAW, "ltraw_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_XTRAW, "xtraw_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_DIP, "dip_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_PQDIP_A, "pqdip_a_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_PQDIP_B, "pqdip_b_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_IPESYS_ME, "me_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_APUSYS_APU, "apu_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_VSS_TRAW, "vss_traw_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_VSS_LTRAW, "vss_ltraw_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_VSS_XTRAW, "vss_xtraw_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_VSS_DIP, "vss_dip_sync_token"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_1, "sw_sync_token_pool_1"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_2, "sw_sync_token_pool_2"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_3, "sw_sync_token_pool_3"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_4, "sw_sync_token_pool_4"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_5, "sw_sync_token_pool_5"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_6, "sw_sync_token_pool_6"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_7, "sw_sync_token_pool_7"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_8, "sw_sync_token_pool_8"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_9, "sw_sync_token_pool_9"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_10, "sw_sync_token_pool_10"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_11, "sw_sync_token_pool_11"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_12, "sw_sync_token_pool_12"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_13, "sw_sync_token_pool_13"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_14, "sw_sync_token_pool_14"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_15, "sw_sync_token_pool_15"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_16, "sw_sync_token_pool_16"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_17, "sw_sync_token_pool_17"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_18, "sw_sync_token_pool_18"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_19, "sw_sync_token_pool_19"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_20, "sw_sync_token_pool_20"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_21, "sw_sync_token_pool_21"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_22, "sw_sync_token_pool_22"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_23, "sw_sync_token_pool_23"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_24, "sw_sync_token_pool_24"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_25, "sw_sync_token_pool_25"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_26, "sw_sync_token_pool_26"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_27, "sw_sync_token_pool_27"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_28, "sw_sync_token_pool_28"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_29, "sw_sync_token_pool_29"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_30, "sw_sync_token_pool_30"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_31, "sw_sync_token_pool_31"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_32, "sw_sync_token_pool_32"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_33, "sw_sync_token_pool_33"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_34, "sw_sync_token_pool_34"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_35, "sw_sync_token_pool_35"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_36, "sw_sync_token_pool_36"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_37, "sw_sync_token_pool_37"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_38, "sw_sync_token_pool_38"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_39, "sw_sync_token_pool_39"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_40, "sw_sync_token_pool_40"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_41, "sw_sync_token_pool_41"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_42, "sw_sync_token_pool_42"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_43, "sw_sync_token_pool_43"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_44, "sw_sync_token_pool_44"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_45, "sw_sync_token_pool_45"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_46, "sw_sync_token_pool_46"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_47, "sw_sync_token_pool_47"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_48, "sw_sync_token_pool_48"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_49, "sw_sync_token_pool_49"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_50, "sw_sync_token_pool_50"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_51, "sw_sync_token_pool_51"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_52, "sw_sync_token_pool_52"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_53, "sw_sync_token_pool_53"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_54, "sw_sync_token_pool_54"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_55, "sw_sync_token_pool_55"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_56, "sw_sync_token_pool_56"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_57, "sw_sync_token_pool_57"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_58, "sw_sync_token_pool_58"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_59, "sw_sync_token_pool_59"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_POOL_60, "sw_sync_token_pool_60"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_1, "sw_sync_token_camsys_pool_1"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_2, "sw_sync_token_camsys_pool_2"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_3, "sw_sync_token_camsys_pool_3"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_4, "sw_sync_token_camsys_pool_4"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_5, "sw_sync_token_camsys_pool_5"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_6, "sw_sync_token_camsys_pool_6"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_7, "sw_sync_token_camsys_pool_7"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_8, "sw_sync_token_camsys_pool_8"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_9, "sw_sync_token_camsys_pool_9"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_CAMSYS_POOL_10, "sw_sync_token_camsys_pool_10"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_TZMP_ISP_WAIT, "sw_sync_token_tzmp_isp_wait"},
+	{ IMGSYS_EVENT_SYNC_TOKEN_TZMP_ISP_SET, "sw_sync_token_tzmp_isp_set"},
+	{ IMGSYS_EVENT_MAX, "imgsys_event_max"},
+};
+
+/* Structure to record block information */
+struct block_record {
+	u32 label_min;	/* Minimum label value */
+	u32 label_max;	/* Maximum label value */
+	u32 label_count;	/* Count of labels */
+	u32 cmd_offset;	/* Offset of the command */
+	u32 cmd_length;	/* Length of the command */
+};
+
+/* Enumeration for GCE recording block types */
+enum gce_rec_block_enum {
+	GCE_REC_NONE_BLOCK = -1,	/* No block */
+	GCE_REC_FRAME_BLOCK = 0,	/* Frame block */
+	GCE_REC_TILE_BLOCK	/* Tile block */
+};
+
+/* Enumeration for GCE recording modes */
+enum gce_rec_mode_enum {
+	GCE_REC_APPEND_MODE = 0,	/* Append mode */
+	GCE_REC_REPLACE_MODE	/* Replace mode */
+};
+
+/**
+ *This structure is utilized by the SCP (Secondary Control Processor),
+ * which is another CPU in the system. It contains necessary information
+ * for managing software frames across different processing units.
+ */
+struct gce_recorder {
+	u32 header_code;	/* Header guard word */
+	u32 cmd_offset;	/* Command offset */
+	u32 check_pre;	/* Pre-check guard word */
+	u32 *p_output;	/* Output buffer pointer */
+	u32 check_post;	/* Post-check guard word */
+	u32 *p_buffer;	/* Buffer pointer */
+	u32 max_length;	/* Maximum length of the buffer */
+	u32 curr_length;	/* Current length of the buffer */
+
+	struct block_record frame_record[GCE_REC_MAX_FRAME_BLOCK]; /* Frame block records */
+	u32 frame_block;	/* Number of frame blocks */
+	u32 curr_frame;	/* Current frame block index */
+
+	struct block_record tile_record[GCE_REC_MAX_TILE_BLOCK];   /* Tile block records */
+	u32 tile_block;	/* Number of tile blocks */
+	u32 curr_tile;	/* Current tile block index */
+
+	enum gce_rec_block_enum curr_block;	/* Current block type */
+	enum gce_rec_mode_enum curr_mode;	/* Current recording mode */
+
+	u32 orig_index;	/* Original index */
+	u32 *p_orig_out;	/* Original output buffer pointer */
+	u32 curr_label;	/* Current label index */
+
+	enum gce_rec_block_enum label_block;	/* Current label block type */
+
+	u32 frame_label[GCE_REC_MAX_LABEL_COUNT];	/* Frame labels */
+	u32 frame_count;	/* Number of frame labels */
+
+	u32 tile_label[GCE_REC_MAX_LABEL_COUNT];  /* Tile labels */
+	u32 tile_count;	/* Number of tile labels */
+
+	u32 footer_code;	/* Footer guard word */
+};
+#endif /* _MTK_IMGSYS_CMDQ_PLAT_H_ */
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.c
new file mode 100644
index 000000000000..7628ade90b6b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.c
@@ -0,0 +1,690 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Daniel Huang <daniel.huang@mediatek.com>
+ *
+ */
+#include <linux/dma-mapping.h>
+#include <linux/mailbox_controller.h>
+#include <linux/math64.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <linux/vmalloc.h>
+#include "mtk_imgsys-cmdq.h"
+#include "mtk_imgsys-cmdq-plat.h"
+#include "mtk_imgsys-module_common.h"
+
+#define MAX_FRAME_IN_TASK 64
+#define CMDQ_BUF_SIZE 0x4000
+
+static struct workqueue_struct *imgsys_cmdq_wq;
+static u32 is_stream_off;
+
+/**
+ * enum mtk_imgsys_cmd - Commands for image system operations
+ * @IMGSYS_CMD_WRITE: Write operation
+ * @IMGSYS_CMD_POLL: Poll operation
+ * @IMGSYS_CMD_WAIT: Wait operation
+ * @IMGSYS_CMD_UPDATE: Update operation
+ * @IMGSYS_CMD_ACQUIRE: Acquire operation
+ * @IMGSYS_CMD_STOP: Stop operation
+ *
+ * This enumeration defines the various commands that determine how to use the
+ * cmdq API for image system operations.
+ */
+enum mtk_imgsys_cmd {
+	IMGSYS_CMD_WRITE,
+	IMGSYS_CMD_POLL,
+	IMGSYS_CMD_WAIT,
+	IMGSYS_CMD_UPDATE,
+	IMGSYS_CMD_ACQUIRE,
+	IMGSYS_CMD_STOP
+};
+
+/**
+ * struct access - Access parameters for image system commands
+ * @address: Memory address to access
+ * @value: Value to write to the memory address
+ * @mask: Mask for the value
+ *
+ * This structure defines the parameters for memory access operations used by
+ * IMGSYS_CMD_WRITE and IMGSYS_CMD_POLL commands.
+ */
+struct access {
+	u64 address;
+	u32 value;
+	u32 mask;
+} __packed;
+
+/**
+ * struct event - Event parameters for image system commands
+ * @event: Event identifier
+ * @action: Action to perform for the event
+ *
+ * This structure defines the parameters for event-based operations used by
+ * IMGSYS_CMD_WAIT, IMGSYS_CMD_UPDATE and IMGSYS_CMD_ACQUIRE commands.
+ */
+struct event {
+	u32 event;
+	u32 action;
+} __packed;
+
+/**
+ * struct command - Command structure for image system operations
+ * @opcode: Operation code (command)
+ * @param: Union of parameters for different commands
+ *     @write: Parameters for write command
+ *     @poll: Parameters for poll command
+ *     @wait: Parameters for wait command
+ *     @update: Parameters for update command
+ *     @acquire: Parameters for acquire command
+ *
+ * This structure is used to store the instructions and parameters for how to
+ * use the cmdq driver.
+ */
+struct command {
+	enum mtk_imgsys_cmd opcode;
+	union {
+		struct access write;
+		struct access poll;
+		struct event wait;
+		struct event update;
+		struct event acquire;
+	} param;
+} __packed;
+
+/**
+ * struct mtk_imgsys_cb_param - Callback parameters for image system commands
+ * @cmdq_cb_work: Work structure for command queue callback
+ * @pkt: Command packet
+ * @frm_info: Pointer to frame information
+ * @imgsys_dev: Pointer to image system device
+ * @clt: Pointer to command queue client
+ * @user_cmdq_cb: User-defined command queue callback function
+ * @err: Error code
+ * @frm_idx: Frame index
+ * @frm_num: Number of frames
+ * @blk_idx: Block index
+ * @blk_num: Number of blocks
+ * @is_earlycb: Indicates if it is an early callback
+ * @group_id: Group identifier
+ * @thd_idx: Thread index
+ * @task_id: Task identifier
+ * @task_num: Number of tasks
+ * @task_cnt: Task count
+ * @pkt_ofst: Array of packet offsets for frames in task
+ * @is_blk_last: Indicates if it is the last block
+ * @is_frm_last: Indicates if it is the last frame
+ * @is_task_last: Indicates if it is the last task
+ *
+ * This structure defines the parameters for callbacks related to
+ * image system commands.
+ */
+struct mtk_imgsys_cb_param {
+	struct work_struct cmdq_cb_work;
+	struct cmdq_pkt pkt;
+	struct swfrm_info *frm_info;
+	struct mtk_imgsys_dev *imgsys_dev;
+	struct cmdq_client *clt;
+	void (*user_cmdq_cb)(struct imgsys_cmdq_cb_data data);
+	s32 err;
+	u32 frm_idx;
+	u32 frm_num;
+	u32 blk_idx;
+	u32 blk_num;
+	u32 is_earlycb;
+	s32 group_id;
+	u32 thd_idx;
+	u32 task_id;
+	u32 task_num;
+	u32 task_cnt;
+	size_t pkt_ofst[MAX_FRAME_IN_TASK];
+	bool is_blk_last;
+	bool is_frm_last;
+	bool is_task_last;
+};
+
+static void imgsys_cmdq_task_cb(struct mbox_client *cl, void *mssg);
+static struct cmdq_client *imgsys_clt[IMGSYS_ENG_MAX];
+
+void imgsys_cmdq_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	struct device *dev = imgsys_dev->dev;
+	u32 idx = 0;
+
+	/* Only first user has to allocate the work queue */
+	if (!imgsys_cmdq_wq) {
+		imgsys_cmdq_wq =
+			alloc_ordered_workqueue("%s", __WQ_LEGACY |
+						WQ_MEM_RECLAIM |
+						WQ_FREEZABLE,
+						"imgsys_cmdq_cb_wq");
+		if (!imgsys_cmdq_wq) {
+			dev_dbg(imgsys_dev->dev,
+				"%s:allcate cmdq callback work queue fail!\n",
+				__func__);
+			return;
+		}
+	}
+
+	/* Request mailbox channels for each IMGSYS engine */
+	for (idx = 0; idx < IMGSYS_ENG_MAX; idx++) {
+		imgsys_clt[idx] = kzalloc(sizeof(*imgsys_clt[idx]), GFP_KERNEL);
+		if (!imgsys_clt[idx])
+			return;
+
+		imgsys_clt[idx]->client.dev = dev;
+		imgsys_clt[idx]->client.tx_block = false;
+		imgsys_clt[idx]->client.knows_txdone = true;
+		imgsys_clt[idx]->client.rx_callback = imgsys_cmdq_task_cb;
+		imgsys_clt[idx]->chan =
+		mbox_request_channel(&imgsys_clt[idx]->client, idx);
+	}
+
+	/* Parse events from dts */
+	for (idx = 0; idx < IMGSYS_EVENT_MAX; idx++)
+		of_property_read_u16(dev->of_node,
+				     imgsys_event[idx].dts_name,
+				     &imgsys_event[idx].event);
+}
+
+void imgsys_cmdq_release(struct mtk_imgsys_dev *imgsys_dev)
+{
+	u32 idx = 0;
+
+	/* Destroy cmdq client */
+	for (idx = 0; idx < IMGSYS_ENG_MAX; idx++) {
+		cmdq_mbox_destroy(imgsys_clt[idx]);
+		imgsys_clt[idx] = NULL;
+	}
+
+	/* Release work_quque */
+	flush_workqueue(imgsys_cmdq_wq);
+	destroy_workqueue(imgsys_cmdq_wq);
+	imgsys_cmdq_wq = NULL;
+}
+
+void imgsys_cmdq_streamon(struct mtk_imgsys_dev *imgsys_dev)
+{
+	dev_info(imgsys_dev->dev, "%s: cmdq stream on (%d)\n", __func__, is_stream_off);
+	is_stream_off = 0;
+}
+
+void imgsys_cmdq_streamoff(struct mtk_imgsys_dev *imgsys_dev)
+{
+	dev_info(imgsys_dev->dev, "%s: cmdq stream off (%d)\n", __func__, is_stream_off);
+	is_stream_off = 1;
+}
+
+static void imgsys_cmdq_cmd_dump(struct swfrm_info *frm_info, u32 frm_idx)
+{
+	struct gce_recorder *cmd_buf = NULL;
+	struct command *cmd = NULL;
+	u32 cmd_num = 0;
+	u32 cmd_idx = 0;
+
+	cmd_buf = (struct gce_recorder *)frm_info->user_info[frm_idx].g_swbuf;
+	cmd_num = cmd_buf->curr_length / sizeof(struct command);
+
+	if (sizeof(struct gce_recorder) != (u64)cmd_buf->cmd_offset) {
+		pr_info("%s: [ERROR] cmd offset is not match (0x%x/0x%zx)!\n",
+			__func__, cmd_buf->cmd_offset,
+			sizeof(struct gce_recorder));
+		return;
+	}
+
+	cmd = (struct command *)((char *)(frm_info->user_info[frm_idx].g_swbuf) +
+		(unsigned long)(cmd_buf->cmd_offset));
+
+	for (cmd_idx = 0; cmd_idx < cmd_num; cmd_idx++) {
+		switch (cmd[cmd_idx].opcode) {
+		case IMGSYS_CMD_WRITE:
+			pr_info("WRITE with addr(0x%08llx) value(0x%08x) mask(0x%08x)\n",
+				cmd[cmd_idx].param.write.address,
+				cmd[cmd_idx].param.write.value,
+				cmd[cmd_idx].param.write.mask);
+			break;
+		case IMGSYS_CMD_POLL:
+			pr_info("POLL with addr(0x%08llx) value(0x%08x) mask(0x%08x)\n",
+				cmd[cmd_idx].param.poll.address,
+				cmd[cmd_idx].param.poll.value,
+				cmd[cmd_idx].param.poll.mask);
+			break;
+		case IMGSYS_CMD_WAIT:
+			pr_info("WAIT event(%d/%d) action(%d)\n",
+				cmd[cmd_idx].param.wait.event,
+				imgsys_event[cmd[cmd_idx].param.wait.event].event,
+				cmd[cmd_idx].param.wait.action);
+			break;
+		case IMGSYS_CMD_UPDATE:
+			pr_info("UPDATE event(%d/%d) action(%d)\n",
+				cmd[cmd_idx].param.update.event,
+				imgsys_event[cmd[cmd_idx].param.update.event].event,
+				cmd[cmd_idx].param.update.action);
+			break;
+		case IMGSYS_CMD_ACQUIRE:
+			pr_info("ACQUIRE event(%d/%d) action(%d)\n",
+				cmd[cmd_idx].param.acquire.event,
+				imgsys_event[cmd[cmd_idx].param.acquire.event].event,
+				cmd[cmd_idx].param.acquire.action);
+			break;
+		case IMGSYS_CMD_STOP:
+			pr_info("%s: End Of Cmd!\n", __func__);
+			break;
+		default:
+			pr_info("%s: [ERROR]Not Support Cmd(%d)!\n",
+				__func__, cmd[cmd_idx].opcode);
+			break;
+		}
+	}
+}
+
+static void imgsys_cmdq_cb_work(struct work_struct *work)
+{
+	struct mtk_imgsys_cb_param *cb_param = NULL;
+	struct mtk_imgsys_dev *imgsys_dev = NULL;
+	u32 cb_frm_cnt;
+
+	cb_param = container_of(work, struct mtk_imgsys_cb_param, cmdq_cb_work);
+	imgsys_dev = cb_param->imgsys_dev;
+
+	if (cb_param->err != 0) {
+		pr_info("%s: [ERROR] cb(%p) cb_cnt(%d) req fd/no(%d/%d) error(%d).\n",
+			__func__, cb_param,
+			cb_param->frm_info->cb_frmcnt,
+			cb_param->frm_info->request_fd,
+			cb_param->frm_info->request_no,
+			cb_param->err);
+
+		pr_info("%s: Frame Info: frm(%d/%d) blk(%d/%d) earlycb(%d) lst(%d/%d/%d).\n",
+			__func__, cb_param->frm_idx, cb_param->frm_num,
+			cb_param->blk_idx, cb_param->blk_num, cb_param->is_earlycb,
+			cb_param->is_blk_last, cb_param->is_frm_last, cb_param->is_task_last);
+
+		pr_info("%s: CMDQ Info: task(%d/%d/%d) ofst(%zx/%zx/%zx/%zx/%zx).\n",
+			__func__, cb_param->task_id, cb_param->task_num, cb_param->task_cnt,
+			cb_param->pkt_ofst[0], cb_param->pkt_ofst[1], cb_param->pkt_ofst[2],
+			cb_param->pkt_ofst[3], cb_param->pkt_ofst[4]);
+	}
+
+	if (is_stream_off == 1)
+		pr_info("%s: [ERROR] cb(%p) pipe already streamoff(%d)!\n",
+			__func__, cb_param, is_stream_off);
+
+	cb_param->frm_info->cb_frmcnt++;
+	cb_frm_cnt = cb_param->frm_info->cb_frmcnt;
+
+	if (cb_param->is_blk_last && cb_param->user_cmdq_cb &&
+	    (cb_param->frm_info->total_taskcnt == cb_frm_cnt ||
+		cb_param->is_earlycb)) {
+		struct imgsys_cmdq_cb_data user_cb_data;
+
+		user_cb_data.cmdq_data.sta = cb_param->err;
+		user_cb_data.cmdq_data.pkt = NULL;
+		user_cb_data.data = (void *)cb_param->frm_info;
+		cb_param->user_cmdq_cb(user_cb_data);
+	}
+
+	cmdq_pkt_destroy(cb_param->clt, &cb_param->pkt);
+	vfree(cb_param);
+}
+
+static void imgsys_cmdq_task_cb(struct mbox_client *cl, void *mssg)
+{
+	struct cmdq_cb_data *data = mssg;
+	struct mtk_imgsys_cb_param *cb_param =
+		container_of(data->pkt, struct mtk_imgsys_cb_param, pkt);
+
+	struct mtk_imgsys_pipe *pipe;
+	u32 frm_idx = 0;
+
+	cb_param->err = data->sta;
+
+	pr_debug("%s: Receive cb(%p) with sta(%d) for frm(%d/%d)\n",
+		 __func__, cb_param, data->sta, cb_param->frm_idx,
+		 cb_param->frm_num);
+
+	if (cb_param->err != 0) {
+		frm_idx = cb_param->frm_idx;
+		pr_info("%s: [ERROR] cb(%p) error info(%d).\n",
+			__func__, cb_param, cb_param->err);
+
+		pr_info("%s: Frame Info: frm(%d/%d) blk(%d/%d) earlycb(%d) lst(%d/%d/%d).\n",
+			__func__, cb_param->frm_idx, cb_param->frm_num,
+			cb_param->blk_idx, cb_param->blk_num, cb_param->is_earlycb,
+			cb_param->is_blk_last, cb_param->is_frm_last, cb_param->is_task_last);
+
+		pr_info("%s: CMDQ Info: task(%d/%d/%d) ofst(%zx/%zx/%zx/%zx/%zx).\n",
+			__func__, cb_param->task_id, cb_param->task_num, cb_param->task_cnt,
+			cb_param->pkt_ofst[0], cb_param->pkt_ofst[1], cb_param->pkt_ofst[2],
+			cb_param->pkt_ofst[3], cb_param->pkt_ofst[4]);
+
+		if (is_stream_off == 1)
+			pr_info("%s: [ERROR] cb(%p) pipe had been turned off(%d)!\n",
+				__func__, cb_param, is_stream_off);
+
+		pipe = (struct mtk_imgsys_pipe *)cb_param->frm_info->pipe;
+		if (!pipe->streaming) {
+			pr_info("%s: [ERROR] cb(%p): pipe already streamoff\n",
+				__func__, cb_param);
+		}
+
+		imgsys_cmdq_cmd_dump(cb_param->frm_info, frm_idx);
+	}
+
+	INIT_WORK(&cb_param->cmdq_cb_work, imgsys_cmdq_cb_work);
+	queue_work(imgsys_cmdq_wq, &cb_param->cmdq_cb_work);
+}
+
+static int imgsys_cmdq_parser(struct cmdq_pkt *pkt,
+			      struct command *cmd, u32 cmd_num)
+{
+	bool stop = false;
+	int count = 0;
+	u32 event_id;
+
+	do {
+		switch (cmd->opcode) {
+		case IMGSYS_CMD_WRITE:
+			if (cmd->param.write.address < IMGSYS_REG_START ||
+			    cmd->param.write.address > IMGSYS_REG_END) {
+				pr_info("%s: [ERROR] WRITE: wrong address(0x%08llx)!\n",
+					__func__, cmd->param.poll.address);
+				return -1;
+			}
+			pr_debug("%s: WRITE with addr(0x%08llx) value(0x%08x) mask(0x%08x)\n",
+				 __func__, cmd->param.write.address,
+				 cmd->param.write.value,
+				 cmd->param.write.mask);
+
+			cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX0,
+					CMDQ_ADDR_HIGH(cmd->param.write.address));
+			if (cmd->param.write.mask != GENMASK(31, 0))
+				cmdq_pkt_write_s_mask_value(pkt, CMDQ_THR_SPR_IDX0,
+							    CMDQ_ADDR_LOW(cmd->param.write.address),
+							    cmd->param.write.value,
+							    cmd->param.write.mask);
+			else
+				cmdq_pkt_write_s_value(pkt, CMDQ_THR_SPR_IDX0,
+						       CMDQ_ADDR_LOW(cmd->param.write.address),
+						       cmd->param.write.value);
+			break;
+		case IMGSYS_CMD_POLL:
+			if (cmd->param.poll.address < IMGSYS_REG_START ||
+			    cmd->param.poll.address > IMGSYS_REG_END) {
+				pr_info("%s: [ERROR] POLL: wrong address(0x%08llx)!\n",
+					__func__, cmd->param.poll.address);
+				return -1;
+			}
+			pr_debug("%s: POLL with addr(0x%08llx) value(0x%08x) mask(0x%08x)\n",
+				 __func__, cmd->param.poll.address,
+				 cmd->param.poll.value, cmd->param.poll.mask);
+
+			cmdq_pkt_poll_addr(pkt, cmd->param.poll.address,
+					   cmd->param.poll.value,
+					   cmd->param.poll.mask);
+			break;
+		case IMGSYS_CMD_WAIT:
+			event_id = cmd->param.wait.event;
+			if (event_id >= IMGSYS_EVENT_MAX) {
+				pr_info("%s: [ERROR] WAIT: wrong event(%d)!\n",
+					__func__, event_id);
+				return -1;
+			}
+			pr_debug("%s: WAIT event(%d/%d) action(%d)\n",
+				 __func__, event_id,
+				 imgsys_event[event_id].event,
+				 cmd->param.wait.action);
+
+			if (cmd->param.wait.action == 1)
+				cmdq_pkt_wfe(pkt, imgsys_event[event_id].event, true);
+			else if (cmd->param.wait.action == 0)
+				cmdq_pkt_wfe(pkt, imgsys_event[event_id].event, false);
+
+			break;
+		case IMGSYS_CMD_UPDATE:
+			event_id = cmd->param.update.event;
+			if (event_id >= IMGSYS_EVENT_MAX) {
+				pr_info("%s: [ERROR] UPDATE: wrong event(%d)!\n",
+					__func__, event_id);
+				return -1;
+			}
+
+			pr_debug("%s: UPDATE event(%d/%d) action(%d)\n",
+				 __func__, event_id,
+				 imgsys_event[event_id].event,
+				 cmd->param.update.action);
+
+			if (cmd->param.update.action == 1)
+				cmdq_pkt_set_event(pkt, imgsys_event[event_id].event);
+			else if (cmd->param.update.action == 0)
+				cmdq_pkt_clear_event(pkt, imgsys_event[event_id].event);
+
+			break;
+		case IMGSYS_CMD_ACQUIRE:
+			event_id = cmd->param.acquire.event;
+			if (event_id >= IMGSYS_EVENT_MAX) {
+				pr_info("%s: [ERROR] ACQUIRE: wrong event(%d)!\n",
+					__func__, event_id);
+				return -1;
+			}
+
+			pr_debug("%s: ACQUIRE event(%d/%d) action(%d)\n",
+				 __func__, event_id,
+				 imgsys_event[event_id].event,
+				 cmd->param.acquire.action);
+
+			cmdq_pkt_acquire_event(pkt, imgsys_event[event_id].event);
+			break;
+		case IMGSYS_CMD_STOP:
+			pr_debug("%s: End Of Cmd!\n", __func__);
+			stop = true;
+			break;
+		default:
+			pr_info("%s: [ERROR] Not Support Cmd(%d)!\n", __func__, cmd->opcode);
+			return -1;
+		}
+		cmd++;
+		count++;
+	} while ((!stop) && (count < cmd_num));
+
+	return count;
+}
+
+int imgsys_cmdq_sendtask(struct mtk_imgsys_dev *imgsys_dev,
+			 struct swfrm_info *frm_info,
+			 void (*cmdq_cb)(struct imgsys_cmdq_cb_data data))
+{
+	struct cmdq_client *clt = NULL;
+	struct gce_recorder *cmd_buf = NULL;
+	struct command *cmd = NULL;
+	struct mtk_imgsys_cb_param *cb_param = NULL;
+	u32 cmd_num = 0;
+	u32 cmd_idx = 0;
+	u32 blk_idx = 0; /* For Vss block cnt */
+	u32 thd_idx = 0;
+	u32 hw_comb = 0;
+	int ret = 0, ret_flush = 0;
+	u32 frm_num = 0, frm_idx = 0;
+	bool is_pack = 0;
+	u32 task_idx = 0;
+	u32 task_id = 0;
+	u32 task_num = 0;
+	u32 task_cnt = 0;
+	size_t pkt_ofst[MAX_FRAME_IN_TASK] = {0};
+
+	frm_num = frm_info->total_frmnum;
+	frm_info->cb_frmcnt = 0;
+	frm_info->total_taskcnt = 0;
+
+	for (frm_idx = 0; frm_idx < frm_num; frm_idx++) {
+		cmd_buf = (struct gce_recorder *)frm_info->user_info[frm_idx].g_swbuf;
+
+		/* Validate the GCE recorder structure */
+		if (cmd_buf->header_code != HEADER_CODE ||
+		    cmd_buf->check_pre != CHECK_PRE ||
+		    cmd_buf->check_post != CHECK_POST ||
+		    cmd_buf->footer_code != FOOTER_CODE) {
+			pr_info("%s: Incorrect guard word: %08x/%08x/%08x/%08x",
+				__func__, cmd_buf->header_code, cmd_buf->check_pre,
+				cmd_buf->check_post, cmd_buf->footer_code);
+			return -1;
+		}
+
+		cmd_num = cmd_buf->curr_length / sizeof(struct command);
+		cmd = (struct command *)((char *)frm_info->user_info[frm_idx].g_swbuf
+		      + (unsigned long)cmd_buf->cmd_offset);
+
+		hw_comb = frm_info->user_info[frm_idx].hw_comb;
+
+		if (is_pack == 0) {
+			if (frm_info->group_id == -1) {
+				/* Choose cmdq_client base on hw scenario */
+				for (thd_idx = 0; thd_idx < IMGSYS_ENG_MAX; thd_idx++) {
+					if (hw_comb & 0x1) {
+						clt = imgsys_clt[thd_idx];
+						pr_debug("%s: mbox thread (%d, %p)\n",
+							 __func__, thd_idx, clt);
+						pr_debug("%s: frm(%d/%d)\n",
+							 __func__, frm_idx, frm_num);
+						break;
+					}
+					hw_comb = hw_comb >> 1;
+				}
+				/* This segment can be removed since user had set dependency */
+				if (frm_info->user_info[frm_idx].hw_comb & IMGSYS_ENG_DIP) {
+					thd_idx = 4;
+					clt = imgsys_clt[thd_idx];
+				}
+			} else {
+				if (frm_info->group_id >= 0 &&
+				    frm_info->group_id < IMGSYS_NOR_THD) {
+					thd_idx = frm_info->group_id;
+					clt = imgsys_clt[thd_idx];
+				} else {
+					pr_info("%s: [ERROR] Group id(%d) is not in range(%d).\n",
+						__func__, frm_info->group_id, IMGSYS_NOR_THD);
+					pr_info("%s: [ERROR] Frame Info: frm(%d/%d) hw_comb(%d).\n",
+						__func__, frm_idx, frm_num,
+						frm_info->user_info[frm_idx].hw_comb);
+					return -1;
+				}
+			}
+
+			/* This is work around for low latency flow. */
+			/* If we change to request base,			 */
+			/* we don't have to take this condition into account.	*/
+			if (frm_info->sync_id != -1) {
+				thd_idx = 0;
+				clt = imgsys_clt[thd_idx];
+			}
+
+			if (!clt) {
+				pr_info("%s: [ERROR] No HW Found (0x%x) for frm(%d/%d)!\n",
+					__func__, frm_info->user_info[frm_idx].hw_comb,
+					frm_idx, frm_num);
+				return -1;
+			}
+		}
+
+		cmd_idx = 0;
+
+		for (blk_idx = 0; blk_idx < cmd_buf->frame_block; blk_idx++) {
+			if (is_pack == 0) {
+				/* Prepare cb param */
+				cb_param = vzalloc(sizeof(*cb_param));
+				if (!cb_param)
+					return -1;
+
+				/* create pkt and hook clt as pkt's private data */
+				if (cmdq_pkt_create(clt, &cb_param->pkt, CMDQ_BUF_SIZE)) {
+					vfree(cb_param);
+					pr_info("%s: [ERROR] Id %d imgsys_create_pkt fail!\n",
+						__func__, blk_idx);
+					return -1;
+				}
+			}
+
+			ret = imgsys_cmdq_parser(&cb_param->pkt, &cmd[cmd_idx], cmd_num);
+
+			if (ret < 0) {
+				pr_info("%s: [ERROR] Parsing fail. cmd(%d/%d) frm(%d/%d/%d)\n",
+					__func__, cmd_idx, cmd[cmd_idx].opcode,
+					blk_idx, frm_idx, frm_num);
+
+				cmdq_pkt_destroy(clt, &cb_param->pkt);
+				vfree(cb_param);
+				goto sendtask_done;
+			}
+			cmd_idx += ret;
+
+			/* Check for packing gce task */
+			pkt_ofst[task_cnt] = cb_param->pkt.cmd_buf_size - CMDQ_INST_SIZE;
+			task_cnt++;
+			if (frm_info->user_info[frm_idx].is_time_shared ||
+			    frm_info->user_info[frm_idx].is_earlycb ||
+			    frm_idx + 1 == frm_num) {
+				task_num++;
+				cb_param->frm_info = frm_info;
+				cb_param->frm_idx = frm_idx;
+				cb_param->frm_num = frm_num;
+				cb_param->user_cmdq_cb = cmdq_cb;
+				if ((blk_idx + 1) == cmd_buf->frame_block)
+					cb_param->is_blk_last = 1;
+				else
+					cb_param->is_blk_last = 0;
+				if ((frm_idx + 1) == frm_num)
+					cb_param->is_frm_last = 1;
+				else
+					cb_param->is_frm_last = 0;
+				cb_param->blk_idx = blk_idx;
+				cb_param->blk_num = cmd_buf->frame_block;
+				cb_param->is_earlycb = frm_info->user_info[frm_idx].is_earlycb;
+				cb_param->group_id = frm_info->group_id;
+				cb_param->imgsys_dev = imgsys_dev;
+				cb_param->thd_idx = thd_idx;
+				cb_param->clt = clt;
+				cb_param->task_cnt = task_cnt;
+				for (task_idx = 0; task_idx < task_cnt; task_idx++)
+					cb_param->pkt_ofst[task_idx] = pkt_ofst[task_idx];
+				task_cnt = 0;
+				cb_param->task_id = task_id;
+				task_id++;
+				if (cb_param->is_blk_last && cb_param->is_frm_last) {
+					cb_param->is_task_last = 1;
+					cb_param->task_num = task_num;
+					frm_info->total_taskcnt = task_num;
+				} else {
+					cb_param->is_task_last = 0;
+					cb_param->task_num = 0;
+				}
+
+				/* flush synchronized, block API */
+				cmdq_pkt_eoc(&cb_param->pkt);
+				cmdq_pkt_jump_rel(&cb_param->pkt, CMDQ_INST_SIZE,
+						  cmdq_get_shift_pa(clt->chan));
+				dma_sync_single_for_device(clt->chan->mbox->dev,
+							   cb_param->pkt.pa_base,
+							   cb_param->pkt.cmd_buf_size,
+							   DMA_TO_DEVICE);
+
+				mbox_send_message(clt->chan, &cb_param->pkt);
+				mbox_client_txdone(clt->chan, 0);
+				if (ret_flush < 0)
+					pr_info("%s: [ERROR] Frame(%d/%d) flushing fail(%d).\n",
+						__func__, ret_flush, frm_idx, frm_num);
+				is_pack = 0;
+			} else {
+				dev_info(imgsys_dev->dev, "%s:is_pack = 1", __func__);
+				is_pack = 1;
+			}
+		}
+	}
+
+sendtask_done:
+	return 0;
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.h
new file mode 100644
index 000000000000..47bbd6735d0b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-cmdq.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Daniel Huang <daniel.huang@mediatek.com>
+ *
+ */
+#ifndef _MTK_IMGSYS_CMDQ_H_
+#define _MTK_IMGSYS_CMDQ_H_
+
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+#include "mtk_imgsys-dev.h"
+
+/* Structure to hold command queue callback data */
+struct imgsys_cmdq_cb_data {
+	struct cmdq_cb_data cmdq_data; /* Command queue data */
+	void *data;                    /* Additional data */
+};
+
+void imgsys_cmdq_streamon(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_cmdq_streamoff(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_cmdq_init(struct mtk_imgsys_dev *imgsys_dev);
+void imgsys_cmdq_release(struct mtk_imgsys_dev *imgsys_dev);
+int imgsys_cmdq_sendtask(struct mtk_imgsys_dev *imgsys_dev,
+			 struct swfrm_info *frm_info,
+			 void (*cmdq_cb)(struct imgsys_cmdq_cb_data data));
+
+#endif /* _MTK_IMGSYS_CMDQ_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h
index dd02a8fa28d4..3918e360a5a0 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_common.h
@@ -39,6 +39,26 @@
 #define CQ_THRX_CTL_MODE	BIT(4)
 #define CQ_THRX_CTL			(CQ_THRX_CTL_EN | CQ_THRX_CTL_MODE)
 
+/**
+ * enum mtk_imgsys_engine_bitmask - Bitmasks for supported hardware engines
+ *
+ * This enumeration defines the bitmasks for the supported hardware engines in
+ * the image system.
+ */
+enum mtk_imgsys_engine_bitmask {
+	IMGSYS_ENG_WPE_EIS	=	0x00000001, /* Bitmask for WPE EIS engine */
+	IMGSYS_ENG_WPE_TNR	=	0x00000002, /* Bitmask for WPE TNR engine */
+	IMGSYS_ENG_WPE_LITE	=	0x00000004, /* Bitmask for WPE Lite engine */
+	IMGSYS_ENG_TRAW		=	0x00000020, /* Bitmask for TRAW engine */
+	IMGSYS_ENG_LTR		=	0x00000040, /* Bitmask for LTR engine */
+	IMGSYS_ENG_XTR		=	0x00000080, /* Bitmask for XTR engine */
+	IMGSYS_ENG_DIP		=	0x00000100, /* Bitmask for DIP engine */
+	IMGSYS_ENG_PQDIP_A	=	0x00000200, /* Bitmask for PQDIP A engine */
+	IMGSYS_ENG_PQDIP_B	=	0x00000400, /* Bitmask for PQDIP B engine */
+	IMGSYS_ENG_ME		=	0x00000800, /* Bitmask for ME engine */
+	IMGSYS_ENG_MAX_NUM	=	0x00001000 /* Maximum bitmask value */
+};
+
 /**
  * enum mtk_imgsys_reg_id
  *
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
index 9f118491b37d..184f0e3a4d3b 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
@@ -9,6 +9,7 @@
 #include <linux/pm_runtime.h>
 #include "mtk_imgsys-sys.h"
 #include "mtk_imgsys-dev.h"
+#include "mtk_imgsys-cmdq.h"
 
 static int mtk_imgsys_hw_connect(struct mtk_imgsys_dev *imgsys_dev)
 {
@@ -26,6 +27,8 @@ static int mtk_imgsys_hw_connect(struct mtk_imgsys_dev *imgsys_dev)
 
 	kref_init(&imgsys_dev->init_kref);
 
+	/* calling cmdq stream on */
+	imgsys_cmdq_streamon(imgsys_dev);
 	return 0;
 }
 
@@ -43,6 +46,8 @@ static void module_uninit(struct kref *kref)
 
 static void mtk_imgsys_hw_disconnect(struct mtk_imgsys_dev *imgsys_dev)
 {
+	/* calling cmdq stream off */
+	imgsys_cmdq_streamoff(imgsys_dev);
 	kref_put(&imgsys_dev->init_kref, module_uninit);
 }
 
-- 
2.45.2


