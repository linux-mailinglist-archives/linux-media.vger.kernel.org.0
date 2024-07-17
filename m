Return-Path: <linux-media+bounces-15080-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C880933D3A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 14:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35342284E44
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 12:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267D018132E;
	Wed, 17 Jul 2024 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Gs3Snzkt"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B731802B2;
	Wed, 17 Jul 2024 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721220893; cv=none; b=B9NjyBqEPsENbEEXpDIf8+SbB/YXIRB32I/EgmT9d4MN9qh1j8v9LmPC+PEMedvol0s8xWTR+ibHNcwk6YDy5B8FKGnospKQ0eXKfVs4MOIJnFXEK83VTpG8hAhlbzKaOG9sS/eqwVFOVaW+XMdXa3UzdIL4WTBjsfjRAif3K0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721220893; c=relaxed/simple;
	bh=DDjL39PJHl9zxI3m9TKAsp0PgmdGhIgLGVOfltPILw0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rEcwYkcij4OhH57l7Fl6GEpF6lQVp9mzY5puKsXkOE8M8acw9yZCYfPSfQDzc8Ccti3JaBFChUPDMI8CwaPakuMpOW1HTd/3QSR0IKW504eqeMoPA8JjrM70YDpY0Vt8CLSz6vz6gVFxGhEdwulnMKM1BVsTfR52nQXPKmI4UNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Gs3Snzkt; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b4e42364443b11ef87684b57767b52b1-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GpBGELc0liRV0IqkvTIno0fYEgcJ9q9P6a+jJZbKWOU=;
	b=Gs3SnzktC4OzoAevytQa5Bj2O7cT5GtQy1FOF1V7YoFJ0g3nFBGWKrquhV+5brztxmBBO6QdTDhvMsCUOyl6tbXEaDZQD+hvFuABBg30wkqPCJ4UQOvqAz7+l6utWz4w7mgWG370HAB4sqLwHhYOWwyDAE7MiY97ug3+WJNp/Iw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:e0c265dd-d7cb-40a0-8fdb-fc54088882d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:cf8a910d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b4e42364443b11ef87684b57767b52b1-20240717
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yelian.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1533893064; Wed, 17 Jul 2024 20:54:30 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 20:54:31 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 20:54:31 +0800
From: 20220614094956 created <yelian.wang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yelian Wang
	<yelian.wang@mediatek.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>
Subject: [PATCH 3/3] media: mediatek: add MT8188 AIE driver
Date: Wed, 17 Jul 2024 20:41:57 +0800
Message-ID: <20240717125426.32660-4-yelian.wang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717125426.32660-1-yelian.wang@mediatek.com>
References: <20240717125426.32660-1-yelian.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Yelian Wang <yelian.wang@mediatek.com>

Add a V4L2 sub-device driver for MT8188 AIE.

Signed-off-by: Yelian Wang <yelian.wang@mediatek.com>
---
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/aie/Kconfig   |   13 +
 drivers/media/platform/mediatek/aie/Makefile  |    5 +
 drivers/media/platform/mediatek/aie/mtk_aie.h | 1012 +++++
 .../media/platform/mediatek/aie/mtk_aie_53.c  | 2031 +++++++++
 .../media/platform/mediatek/aie/mtk_aie_drv.c | 3613 +++++++++++++++++
 7 files changed, 6676 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
 create mode 100644 drivers/media/platform/mediatek/aie/Makefile
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
 create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c

diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
index 84104e2cd024..987c754a76b7 100644
--- a/drivers/media/platform/mediatek/Kconfig
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -7,3 +7,4 @@ source "drivers/media/platform/mediatek/mdp/Kconfig"
 source "drivers/media/platform/mediatek/vcodec/Kconfig"
 source "drivers/media/platform/mediatek/vpu/Kconfig"
 source "drivers/media/platform/mediatek/mdp3/Kconfig"
+source "drivers/media/platform/mediatek/aie/Kconfig"
diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
index 38e6ba917fe5..db8e6d09de4e 100644
--- a/drivers/media/platform/mediatek/Makefile
+++ b/drivers/media/platform/mediatek/Makefile
@@ -4,3 +4,4 @@ obj-y += mdp/
 obj-y += vcodec/
 obj-y += vpu/
 obj-y += mdp3/
+obj-y += aie/
diff --git a/drivers/media/platform/mediatek/aie/Kconfig b/drivers/media/platform/mediatek/aie/Kconfig
new file mode 100644
index 000000000000..f2fe4bfcdd6a
--- /dev/null
+++ b/drivers/media/platform/mediatek/aie/Kconfig
@@ -0,0 +1,13 @@
+config VIDEO_MTK_AIE
+	tristate "MediaTek AI engine function"
+	depends on OF
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select MEDIA_CONTROLLER_REQUEST_API
+	help
+		Support the AI engine (AIE) feature
+
+		AIE driver is a V4L2 memory-to-memory device driver which
+		provides hardware accelerated face detection function,
+		it can detect different sizes of faces in a raw image.
+
diff --git a/drivers/media/platform/mediatek/aie/Makefile b/drivers/media/platform/mediatek/aie/Makefile
new file mode 100644
index 000000000000..615fb8de8f3e
--- /dev/null
+++ b/drivers/media/platform/mediatek/aie/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+mtk-aie-y += mtk_aie_53.o
+mtk-aie-y += mtk_aie_drv.o
+
+obj-$(CONFIG_VIDEO_MTK_AIE) += mtk-aie.o
diff --git a/drivers/media/platform/mediatek/aie/mtk_aie.h b/drivers/media/platform/mediatek/aie/mtk_aie.h
new file mode 100644
index 000000000000..0a2af547b56b
--- /dev/null
+++ b/drivers/media/platform/mediatek/aie/mtk_aie.h
@@ -0,0 +1,1012 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Fish Wu <fish.wu@mediatek.com>
+ */
+
+#ifndef __MTK_AIE_H__
+#define __MTK_AIE_H__
+
+#include <linux/completion.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+
+// AIE 3.X
+
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+#include "mtk-interconnect.h"
+#endif
+
+// AIE 3.X
+#define MTK_AIE_OPP_SET 1
+#define MTK_AIE_CLK_LEVEL_CNT 4
+
+#define FD_VERSION 1946050
+#define ATTR_VERSION 1929401
+
+#define Y2R_SRC_DST_FORMAT 0
+#define Y2R_IN_W_H 1
+#define Y2R_OUT_W_H 2
+#define Y2R_RA0_RA1_EN 3
+#define Y2R_IN_X_Y_SIZE0 4
+#define Y2R_IN_STRIDE0_BUS_SIZE0 5
+#define Y2R_IN_X_Y_SIZE1 6
+#define Y2R_IN_STRIDE1_BUS_SIZE1 7
+#define Y2R_OUT_X_Y_SIZE0 8
+#define Y2R_OUT_STRIDE0_BUS_SIZE0 9
+#define Y2R_OUT_X_Y_SIZE1 10
+#define Y2R_OUT_STRIDE1_BUS_SIZE1 11
+#define Y2R_OUT_X_Y_SIZE2 12
+#define Y2R_OUT_STRIDE2_BUS_SIZE2 13
+#define Y2R_IN_0 14
+#define Y2R_IN_1 15
+#define Y2R_OUT_0 16
+#define Y2R_OUT_1 17
+#define Y2R_OUT_2 18
+#define Y2R_RS_SEL_SRZ_EN 19
+#define Y2R_X_Y_MAG 20
+#define Y2R_SRZ_HORI_STEP 22
+#define Y2R_SRZ_VERT_STEP 23
+#define Y2R_PADDING_EN_UP_DOWN 26
+#define Y2R_PADDING_RIGHT_LEFT 27
+#define Y2R_CO2_FMT_MODE_EN 28 /* AIE3.0 new */
+#define Y2R_CO2_CROP_X 29 /* AIE3.0 new */
+#define Y2R_CO2_CROP_Y 30 /* AIE3.0 new */
+#define Y2R_CON_IN_BA_MSB 31
+#define Y2R_CON_OUT_BA_MSB 32
+
+#define RS_IN_0 22
+#define RS_IN_1 23
+#define RS_IN_2 24
+#define RS_OUT_0 25
+#define RS_OUT_1 26
+#define RS_OUT_2 27
+#define RS_X_Y_MAG 1
+#define RS_SRZ_HORI_STEP 3
+#define RS_SRZ_VERT_STEP 4
+#define RS_INPUT_W_H 7
+#define RS_OUTPUT_W_H 8
+#define RS_IN_X_Y_SIZE0 10
+#define RS_IN_STRIDE0 11
+#define RS_IN_X_Y_SIZE1 12
+#define RS_IN_STRIDE1 13
+#define RS_IN_X_Y_SIZE2 14
+#define RS_IN_STRIDE2 15
+#define RS_OUT_X_Y_SIZE0 16
+#define RS_OUT_STRIDE0 17
+#define RS_OUT_X_Y_SIZE1 18
+#define RS_OUT_STRIDE1 19
+#define RS_OUT_X_Y_SIZE2 20
+#define RS_OUT_STRIDE2 21
+// AIE 3.X
+#define RS_CON_IN_BA_MSB 28
+#define RS_CON_OUT_BA_MSB 29
+
+#define FD_INPUT_ROTATE 1
+#define FD_CONV_WIDTH_MOD6 2
+#define FD_CONV_IMG_W_H 4
+
+#define FD_IN_IMG_W_H 5
+#define FD_OUT_IMG_W_H 6
+
+#define FD_IN_X_Y_SIZE0 9
+#define FD_IN_X_Y_SIZE1 11
+#define FD_IN_X_Y_SIZE2 13
+#define FD_IN_X_Y_SIZE3 15
+
+#define FD_IN_STRIDE0_BUS_SIZE0 10
+#define FD_IN_STRIDE1_BUS_SIZE1 12
+#define FD_IN_STRIDE2_BUS_SIZE2 14
+#define FD_IN_STRIDE3_BUS_SIZE3 16
+
+#define FD_OUT_X_Y_SIZE0 17
+#define FD_OUT_X_Y_SIZE1 19
+#define FD_OUT_X_Y_SIZE2 21
+#define FD_OUT_X_Y_SIZE3 23
+
+#define FD_OUT_STRIDE0_BUS_SIZE0 18
+#define FD_OUT_STRIDE1_BUS_SIZE1 20
+#define FD_OUT_STRIDE2_BUS_SIZE2 22
+#define FD_OUT_STRIDE3_BUS_SIZE3 24
+
+#define FD_IN_0 27
+#define FD_IN_1 28
+#define FD_IN_2 29
+#define FD_IN_3 30
+
+#define FD_OUT_0 31
+#define FD_OUT_1 32
+#define FD_OUT_2 33
+#define FD_OUT_3 34
+
+#define FD_KERNEL_0 35
+#define FD_KERNEL_1 36
+
+#define FD_RPN_SET 37
+#define FD_IMAGE_COORD 38
+#define FD_IMAGE_COORD_XY_OFST 39 /* AIE3.0 new */
+#define FD_BIAS_ACCU 47 /* AIE3.0 new */
+#define FD_SRZ_FDRZ_RS 48 /* AIE3.0 new */
+#define FD_SRZ_HORI_STEP 49 /* AIE3.0 new */
+#define FD_SRZ_VERT_STEP 50 /* AIE3.0 new */
+#define FD_SRZ_HORI_SUB_INT_OFST 51 /* AIE3.0 new */
+#define FD_SRZ_VERT_SUB_INT_OFST 52 /* AIE3.0 new */
+// AIE 3.X
+#define FD_CON_IN_BA_MSB 53
+#define FD_CON_OUT_BA_MSB 54
+#define FD_CON_KERNEL_BA_MSB 55
+
+#define SRZ_BIT (BIT_MASK(16) | BIT_MASK(12) | BIT_MASK(8) | BIT_MASK(0))
+
+#define FD_LOOP_NUM 87
+#define RPN0_LOOP_NUM 86
+#define RPN1_LOOP_NUM 57
+#define RPN2_LOOP_NUM 28
+
+#define PYM0_START_LOOP 58
+#define PYM1_START_LOOP 29
+#define PYM2_START_LOOP 0
+
+#define ATTR_LOOP_NUM 26
+#define AGE_OUT_RGS 17
+#define GENDER_OUT_RGS 20
+#define INDIAN_OUT_RGS 22
+#define RACE_OUT_RGS 25
+
+#define INPUT_WDMA_WRA_NUM 4
+#define OUTPUT_WDMA_WRA_NUM 4
+#define KERNEL_RDMA_RA_NUM 2
+
+#define MAX_ENQUE_FRAME_NUM 10
+#define PYM_NUM 3
+#define COLOR_NUM 3
+
+#define ATTR_MODE_PYRAMID_WIDTH 128
+#define ATTR_OUT_SIZE 32
+
+/* AIE 2.0 3.X register offset */
+#define AIE_START_REG 0x000
+#define AIE_ENABLE_REG 0x004
+#define AIE_LOOP_REG 0x008
+#define AIE_YUV2RGB_CON_BASE_ADR_REG 0x00c
+#define AIE_RS_CON_BASE_ADR_REG 0x010
+#define AIE_FD_CON_BASE_ADR_REG 0x014
+#define AIE_INT_EN_REG 0x018
+#define AIE_INT_REG 0x01c
+#define AIE_RESULT_0_REG 0x08c
+#define AIE_RESULT_1_REG 0x090
+#define AIE_DMA_CTL_REG 0x094
+
+/* AIE 3.0 register offset */
+#define AIE_YUV2RGB_CON_BASE_ADR_MSB 0x14C
+#define AIE_RS_CON_BASE_ADR_MSB 0x150
+#define AIE_FD_CON_BASE_ADR_MSB 0x154
+
+/* AIE 3.0 FLD register offset */
+#define FLD_EN 0x400
+#define FLD_BASE_ADDR_FACE_0 0x404
+#define FLD_BASE_ADDR_FACE_1 0x408
+#define FLD_BASE_ADDR_FACE_2 0x40C
+#define FLD_BASE_ADDR_FACE_3 0x410
+#define FLD_BASE_ADDR_FACE_4 0x414
+#define FLD_BASE_ADDR_FACE_5 0x418
+#define FLD_BASE_ADDR_FACE_6 0x41C
+#define FLD_BASE_ADDR_FACE_7 0x420
+#define FLD_BASE_ADDR_FACE_8 0x424
+#define FLD_BASE_ADDR_FACE_9 0x428
+#define FLD_BASE_ADDR_FACE_10 0x42C
+#define FLD_BASE_ADDR_FACE_11 0x430
+#define FLD_BASE_ADDR_FACE_12 0x434
+#define FLD_BASE_ADDR_FACE_13 0x438
+#define FLD_BASE_ADDR_FACE_14 0x43C
+
+#define FLD_INFO_0_FACE_0 0x440
+#define FLD_INFO_1_FACE_0 0x444
+#define FLD_INFO_2_FACE_0 0x448
+#define FLD_INFO_0_FACE_1 0x44C
+#define FLD_INFO_1_FACE_1 0x450
+#define FLD_INFO_2_FACE_1 0x454
+#define FLD_INFO_0_FACE_2 0x458
+#define FLD_INFO_1_FACE_2 0x45C
+#define FLD_INFO_2_FACE_2 0x460
+#define FLD_INFO_0_FACE_3 0x464
+#define FLD_INFO_1_FACE_3 0x468
+#define FLD_INFO_2_FACE_3 0x46C
+#define FLD_INFO_0_FACE_4 0x470
+#define FLD_INFO_1_FACE_4 0x474
+#define FLD_INFO_2_FACE_4 0x478
+#define FLD_INFO_0_FACE_5 0x47C
+#define FLD_INFO_1_FACE_5 0x480
+#define FLD_INFO_2_FACE_5 0x484
+#define FLD_INFO_0_FACE_6 0x488
+#define FLD_INFO_1_FACE_6 0x48C
+#define FLD_INFO_2_FACE_6 0x490
+#define FLD_INFO_0_FACE_7 0x494
+#define FLD_INFO_1_FACE_7 0x498
+
+#define FLD_INFO_2_FACE_7 0x4A0
+#define FLD_INFO_0_FACE_8 0x4A4
+#define FLD_INFO_1_FACE_8 0x4A8
+#define FLD_INFO_2_FACE_8 0x4AC
+#define FLD_INFO_0_FACE_9 0x4B0
+#define FLD_INFO_1_FACE_9 0x4B4
+#define FLD_INFO_2_FACE_9 0x4B8
+#define FLD_INFO_0_FACE_10 0x4BC
+#define FLD_INFO_1_FACE_10 0x4C0
+#define FLD_INFO_2_FACE_10 0x4C4
+#define FLD_INFO_0_FACE_11 0x4C8
+#define FLD_INFO_1_FACE_11 0x4CC
+#define FLD_INFO_2_FACE_11 0x4D0
+#define FLD_INFO_0_FACE_12 0x4D4
+#define FLD_INFO_1_FACE_12 0x4D8
+#define FLD_INFO_2_FACE_12 0x4DC
+#define FLD_INFO_0_FACE_13 0x4E0
+#define FLD_INFO_1_FACE_13 0x4E4
+#define FLD_INFO_2_FACE_13 0x4E8
+#define FLD_INFO_0_FACE_14 0x4EC
+#define FLD_INFO_1_FACE_14 0x4F0
+#define FLD_INFO_2_FACE_14 0x4F4
+
+#define FLD_MODEL_PARA0 0x4F8
+#define FLD_MODEL_PARA1 0x4FC
+#define FLD_MODEL_PARA2 0x500
+#define FLD_MODEL_PARA3 0x504
+#define FLD_MODEL_PARA4 0x508
+#define FLD_MODEL_PARA5 0x50C
+#define FLD_MODEL_PARA6 0x510
+#define FLD_MODEL_PARA7 0x514
+#define FLD_MODEL_PARA8 0x518
+#define FLD_MODEL_PARA9 0x51C
+#define FLD_MODEL_PARA10 0x520
+#define FLD_MODEL_PARA11 0x524
+#define FLD_MODEL_PARA12 0x528
+#define FLD_MODEL_PARA13 0x52C
+#define FLD_MODEL_PARA14 0x530
+#define FLD_MODEL_PARA15 0x534
+#define FLD_MODEL_PARA16 0x538
+#define FLD_DEBUG_INFO0 0x53C
+#define FLD_DEBUG_INFO1 0x540
+
+#define FLD_BUSY 0x544
+#define FLD_DONE 0x548
+#define FLD_SRC_WD_HT 0x54C
+
+#define FLD_PL_IN_BASE_ADDR_0_0 0x550
+#define FLD_PL_IN_BASE_ADDR_0_1 0x554
+#define FLD_PL_IN_BASE_ADDR_0_2 0x558
+#define FLD_PL_IN_BASE_ADDR_0_3 0x55C
+#define FLD_PL_IN_BASE_ADDR_0_4 0x560
+#define FLD_PL_IN_BASE_ADDR_0_5 0x564
+#define FLD_PL_IN_BASE_ADDR_0_6 0x568
+#define FLD_PL_IN_BASE_ADDR_0_7 0x56C
+#define FLD_PL_IN_BASE_ADDR_0_8 0x570
+#define FLD_PL_IN_BASE_ADDR_0_9 0x574
+#define FLD_PL_IN_BASE_ADDR_0_10 0x578
+#define FLD_PL_IN_BASE_ADDR_0_11 0x57C
+#define FLD_PL_IN_BASE_ADDR_0_12 0x580
+#define FLD_PL_IN_BASE_ADDR_0_13 0x584
+#define FLD_PL_IN_BASE_ADDR_0_14 0x588
+#define FLD_PL_IN_BASE_ADDR_0_15 0x58C
+#define FLD_PL_IN_BASE_ADDR_0_16 0x590
+#define FLD_PL_IN_BASE_ADDR_0_17 0x594
+#define FLD_PL_IN_BASE_ADDR_0_18 0x598
+#define FLD_PL_IN_BASE_ADDR_0_19 0x59C
+#define FLD_PL_IN_BASE_ADDR_0_20 0x5A0
+#define FLD_PL_IN_BASE_ADDR_0_21 0x5A4
+#define FLD_PL_IN_BASE_ADDR_0_22 0x5A8
+#define FLD_PL_IN_BASE_ADDR_0_23 0x5AC
+#define FLD_PL_IN_BASE_ADDR_0_24 0x5B0
+#define FLD_PL_IN_BASE_ADDR_0_25 0x5B4
+#define FLD_PL_IN_BASE_ADDR_0_26 0x5B8
+#define FLD_PL_IN_BASE_ADDR_0_27 0x5BC
+#define FLD_PL_IN_BASE_ADDR_0_28 0x5C0
+#define FLD_PL_IN_BASE_ADDR_0_29 0x5C4
+
+#define FLD_PL_IN_BASE_ADDR_1_0 0x5C8
+#define FLD_PL_IN_BASE_ADDR_1_1 0x5CC
+#define FLD_PL_IN_BASE_ADDR_1_2 0x5D0
+#define FLD_PL_IN_BASE_ADDR_1_3 0x5D4
+#define FLD_PL_IN_BASE_ADDR_1_4 0x5D8
+#define FLD_PL_IN_BASE_ADDR_1_5 0x5DC
+#define FLD_PL_IN_BASE_ADDR_1_6 0x5E0
+#define FLD_PL_IN_BASE_ADDR_1_7 0x5E4
+#define FLD_PL_IN_BASE_ADDR_1_8 0x5E8
+#define FLD_PL_IN_BASE_ADDR_1_9 0x5EC
+#define FLD_PL_IN_BASE_ADDR_1_10 0x5F0
+#define FLD_PL_IN_BASE_ADDR_1_11 0x5F4
+#define FLD_PL_IN_BASE_ADDR_1_12 0x5F8
+#define FLD_PL_IN_BASE_ADDR_1_13 0x5FC
+#define FLD_PL_IN_BASE_ADDR_1_14 0x600
+#define FLD_PL_IN_BASE_ADDR_1_15 0x604
+#define FLD_PL_IN_BASE_ADDR_1_16 0x608
+#define FLD_PL_IN_BASE_ADDR_1_17 0x60C
+#define FLD_PL_IN_BASE_ADDR_1_18 0x610
+#define FLD_PL_IN_BASE_ADDR_1_19 0x614
+#define FLD_PL_IN_BASE_ADDR_1_20 0x618
+#define FLD_PL_IN_BASE_ADDR_1_21 0x61C
+#define FLD_PL_IN_BASE_ADDR_1_22 0x620
+#define FLD_PL_IN_BASE_ADDR_1_23 0x624
+#define FLD_PL_IN_BASE_ADDR_1_24 0x628
+#define FLD_PL_IN_BASE_ADDR_1_25 0x62C
+#define FLD_PL_IN_BASE_ADDR_1_26 0x630
+#define FLD_PL_IN_BASE_ADDR_1_27 0x634
+#define FLD_PL_IN_BASE_ADDR_1_28 0x638
+#define FLD_PL_IN_BASE_ADDR_1_29 0x63C
+
+#define FLD_PL_IN_BASE_ADDR_2_0 0x640
+#define FLD_PL_IN_BASE_ADDR_2_1 0x644
+#define FLD_PL_IN_BASE_ADDR_2_2 0x648
+#define FLD_PL_IN_BASE_ADDR_2_3 0x64C
+#define FLD_PL_IN_BASE_ADDR_2_4 0x650
+#define FLD_PL_IN_BASE_ADDR_2_5 0x654
+#define FLD_PL_IN_BASE_ADDR_2_6 0x658
+#define FLD_PL_IN_BASE_ADDR_2_7 0x65C
+#define FLD_PL_IN_BASE_ADDR_2_8 0x660
+#define FLD_PL_IN_BASE_ADDR_2_9 0x664
+#define FLD_PL_IN_BASE_ADDR_2_10 0x668
+#define FLD_PL_IN_BASE_ADDR_2_11 0x66C
+#define FLD_PL_IN_BASE_ADDR_2_12 0x670
+#define FLD_PL_IN_BASE_ADDR_2_13 0x674
+#define FLD_PL_IN_BASE_ADDR_2_14 0x678
+#define FLD_PL_IN_BASE_ADDR_2_15 0x67C
+#define FLD_PL_IN_BASE_ADDR_2_16 0x680
+#define FLD_PL_IN_BASE_ADDR_2_17 0x684
+#define FLD_PL_IN_BASE_ADDR_2_18 0x688
+#define FLD_PL_IN_BASE_ADDR_2_19 0x68C
+#define FLD_PL_IN_BASE_ADDR_2_20 0x690
+#define FLD_PL_IN_BASE_ADDR_2_21 0x694
+#define FLD_PL_IN_BASE_ADDR_2_22 0x698
+#define FLD_PL_IN_BASE_ADDR_2_23 0x69C
+#define FLD_PL_IN_BASE_ADDR_2_24 0x6A0
+#define FLD_PL_IN_BASE_ADDR_2_25 0x6A4
+#define FLD_PL_IN_BASE_ADDR_2_26 0x6A8
+#define FLD_PL_IN_BASE_ADDR_2_27 0x6AC
+#define FLD_PL_IN_BASE_ADDR_2_28 0x6B0
+#define FLD_PL_IN_BASE_ADDR_2_29 0x6B4
+
+#define FLD_PL_IN_BASE_ADDR_3_0 0x6B8
+#define FLD_PL_IN_BASE_ADDR_3_1 0x6BC
+#define FLD_PL_IN_BASE_ADDR_3_2 0x6C0
+#define FLD_PL_IN_BASE_ADDR_3_3 0x6C4
+#define FLD_PL_IN_BASE_ADDR_3_4 0x6C8
+#define FLD_PL_IN_BASE_ADDR_3_5 0x6CC
+#define FLD_PL_IN_BASE_ADDR_3_6 0x6D0
+#define FLD_PL_IN_BASE_ADDR_3_7 0x6D4
+#define FLD_PL_IN_BASE_ADDR_3_8 0x6D8
+#define FLD_PL_IN_BASE_ADDR_3_9 0x6DC
+#define FLD_PL_IN_BASE_ADDR_3_10 0x6E0
+#define FLD_PL_IN_BASE_ADDR_3_11 0x6E4
+#define FLD_PL_IN_BASE_ADDR_3_12 0x6E8
+#define FLD_PL_IN_BASE_ADDR_3_13 0x6EC
+#define FLD_PL_IN_BASE_ADDR_3_14 0x6F0
+#define FLD_PL_IN_BASE_ADDR_3_15 0x6F4
+#define FLD_PL_IN_BASE_ADDR_3_16 0x6F8
+#define FLD_PL_IN_BASE_ADDR_3_17 0x6FC
+#define FLD_PL_IN_BASE_ADDR_3_18 0x700
+#define FLD_PL_IN_BASE_ADDR_3_19 0x704
+#define FLD_PL_IN_BASE_ADDR_3_20 0x708
+#define FLD_PL_IN_BASE_ADDR_3_21 0x70C
+#define FLD_PL_IN_BASE_ADDR_3_22 0x710
+#define FLD_PL_IN_BASE_ADDR_3_23 0x714
+#define FLD_PL_IN_BASE_ADDR_3_24 0x718
+#define FLD_PL_IN_BASE_ADDR_3_25 0x71C
+#define FLD_PL_IN_BASE_ADDR_3_26 0x720
+#define FLD_PL_IN_BASE_ADDR_3_27 0x724
+#define FLD_PL_IN_BASE_ADDR_3_28 0x728
+#define FLD_PL_IN_BASE_ADDR_3_29 0x72C
+
+#define FLD_PL_IN_SIZE_0 0x730
+#define FLD_PL_IN_STRIDE_0 0x734
+#define FLD_PL_IN_SIZE_1 0x738
+#define FLD_PL_IN_STRIDE_1 0x73C
+#define FLD_PL_IN_SIZE_2_0 0x740
+#define FLD_PL_IN_STRIDE_2_0 0x744
+#define FLD_PL_IN_SIZE_2_1 0x748
+#define FLD_PL_IN_STRIDE_2_1 0x74C
+#define FLD_PL_IN_SIZE_2_2 0x750
+#define FLD_PL_IN_STRIDE_2_2 0x754
+#define FLD_PL_IN_SIZE_3 0x758
+#define FLD_PL_IN_STRIDE_3 0x75C
+
+#define FLD_SH_IN_BASE_ADDR_0 0x760
+#define FLD_SH_IN_BASE_ADDR_1 0x764
+#define FLD_SH_IN_BASE_ADDR_2 0x768
+#define FLD_SH_IN_BASE_ADDR_3 0x76C
+#define FLD_SH_IN_BASE_ADDR_4 0x770
+#define FLD_SH_IN_BASE_ADDR_5 0x774
+#define FLD_SH_IN_BASE_ADDR_6 0x778
+#define FLD_SH_IN_BASE_ADDR_7 0x77C
+#define FLD_SH_IN_BASE_ADDR_8 0x780
+#define FLD_SH_IN_BASE_ADDR_9 0x784
+#define FLD_SH_IN_BASE_ADDR_10 0x788
+#define FLD_SH_IN_BASE_ADDR_11 0x78C
+#define FLD_SH_IN_BASE_ADDR_12 0x790
+#define FLD_SH_IN_BASE_ADDR_13 0x794
+#define FLD_SH_IN_BASE_ADDR_14 0x798
+#define FLD_SH_IN_BASE_ADDR_15 0x79C
+#define FLD_SH_IN_BASE_ADDR_16 0x7A0
+#define FLD_SH_IN_BASE_ADDR_17 0x7A4
+#define FLD_SH_IN_BASE_ADDR_18 0x7A8
+#define FLD_SH_IN_BASE_ADDR_19 0x7AC
+#define FLD_SH_IN_BASE_ADDR_20 0x7B0
+#define FLD_SH_IN_BASE_ADDR_21 0x7B4
+#define FLD_SH_IN_BASE_ADDR_22 0x7B8
+#define FLD_SH_IN_BASE_ADDR_23 0x7BC
+#define FLD_SH_IN_BASE_ADDR_24 0x7C0
+#define FLD_SH_IN_BASE_ADDR_25 0x7C4
+#define FLD_SH_IN_BASE_ADDR_26 0x7C8
+#define FLD_SH_IN_BASE_ADDR_27 0x7CC
+#define FLD_SH_IN_BASE_ADDR_28 0x7D0
+#define FLD_SH_IN_BASE_ADDR_29 0x7D4
+
+#define FLD_SH_IN_SIZE_0 0x7D8
+#define FLD_SH_IN_STRIDE_0 0x7DC
+#define FLD_TR_OUT_BASE_ADDR_0 0x7E0
+#define FLD_TR_OUT_SIZE_0 0x7E4
+#define FLD_TR_OUT_STRIDE_0 0x7E8
+#define FLD_PP_OUT_BASE_ADDR_0 0x7EC
+#define FLD_PP_OUT_SIZE_0 0x7F0
+#define FLD_PP_OUT_STRIDE_0 0x7F4
+#define FLD_SPARE 0x7F8
+
+#define FLD_BASE_ADDR_FACE_0_7_MSB 0x7FC
+#define FLD_BASE_ADDR_FACE_8_14_MSB 0x800
+
+#define FLD_PL_IN_BASE_ADDR_0_0_7_MSB 0x804
+#define FLD_PL_IN_BASE_ADDR_0_8_15_MSB 0x808
+#define FLD_PL_IN_BASE_ADDR_0_16_23_MSB 0x80C
+#define FLD_PL_IN_BASE_ADDR_0_24_29_MSB 0x810
+
+#define FLD_PL_IN_BASE_ADDR_1_0_7_MSB 0x814
+#define FLD_PL_IN_BASE_ADDR_1_8_15_MSB 0x818
+#define FLD_PL_IN_BASE_ADDR_1_16_23_MSB 0x81C
+#define FLD_PL_IN_BASE_ADDR_1_24_29_MSB 0x820
+
+#define FLD_PL_IN_BASE_ADDR_2_0_7_MSB 0x824
+#define FLD_PL_IN_BASE_ADDR_2_8_15_MSB 0x828
+#define FLD_PL_IN_BASE_ADDR_2_16_23_MSB 0x82C
+#define FLD_PL_IN_BASE_ADDR_2_24_29_MSB 0x830
+
+#define FLD_PL_IN_BASE_ADDR_3_0_7_MSB 0x834
+#define FLD_PL_IN_BASE_ADDR_3_8_15_MSB 0x838
+#define FLD_PL_IN_BASE_ADDR_3_16_23_MSB 0x83C
+#define FLD_PL_IN_BASE_ADDR_3_24_29_MSB 0x840
+
+#define FLD_SH_IN_BASE_ADDR_0_7_MSB 0x844
+#define FLD_SH_IN_BASE_ADDR_8_15_MSB 0x848
+#define FLD_SH_IN_BASE_ADDR_16_23_MSB 0x84C
+#define FLD_SH_IN_BASE_ADDR_24_29_MSB 0x850
+
+#define FLD_BS_IN_BASE_ADDR_0_7_MSB 0x8d4
+#define FLD_BS_IN_BASE_ADDR_8_15_MSB 0x8d8
+
+#define FLD_TR_OUT_BASE_ADDR_0_MSB 0x854
+#define FLD_PP_OUT_BASE_ADDR_0_MSB 0x858
+
+#define FLD_BS_IN_BASE_ADDR_00 0x85C
+#define FLD_BS_IN_BASE_ADDR_01 0x860
+#define FLD_BS_IN_BASE_ADDR_02 0x864
+#define FLD_BS_IN_BASE_ADDR_03 0x868
+#define FLD_BS_IN_BASE_ADDR_04 0x86C
+#define FLD_BS_IN_BASE_ADDR_05 0x870
+#define FLD_BS_IN_BASE_ADDR_06 0x874
+#define FLD_BS_IN_BASE_ADDR_07 0x878
+#define FLD_BS_IN_BASE_ADDR_08 0x87C
+#define FLD_BS_IN_BASE_ADDR_09 0x880
+#define FLD_BS_IN_BASE_ADDR_10 0x884
+#define FLD_BS_IN_BASE_ADDR_11 0x888
+#define FLD_BS_IN_BASE_ADDR_12 0x88C
+#define FLD_BS_IN_BASE_ADDR_13 0x890
+#define FLD_BS_IN_BASE_ADDR_14 0x894
+#define FLD_BS_BIAS 0x8E4
+#define FLD_CV_FM_RANGE_0 0x8E8
+#define FLD_CV_FM_RANGE_1 0x8EC
+#define FLD_CV_PM_RANGE_0 0x8F0
+#define FLD_CV_PM_RANGE_1 0x8F4
+#define FLD_BS_RANGE_0 0x8F8
+#define FLD_BS_RANGE_1 0x8FC
+
+#define MTK_FD_OUTPUT_MIN_WIDTH 16U
+#define MTK_FD_OUTPUT_MIN_HEIGHT 16U
+#define MTK_FD_OUTPUT_MAX_WIDTH 4096U
+#define MTK_FD_OUTPUT_MAX_HEIGHT 4096U
+
+#define MTK_FD_HW_TIMEOUT_IN_MSEC 2000
+#define MAX_FACE_NUM 1024
+#define RLT_NUM 48
+#define GENDER_OUT 32
+
+#define RACE_RST_X_NUM 4
+#define RACE_RST_Y_NUM 64
+#define GENDER_RST_X_NUM 2
+#define GENDER_RST_Y_NUM 64
+#define MRACE_RST_NUM 4
+#define MGENDER_RST_NUM 2
+#define MAGE_RST_NUM 2
+#define MINDIAN_RST_NUM 2
+
+// AIE 3.X
+#define FLD_FOREST 14
+#define FLD_POINT 500
+
+#define FLD_STEP_NUM 6
+#define FLD_MAX_FRAME 15
+
+#define FLD_STEP_BLINK 0
+#define FLD_STEP_CV 1
+#define FLD_STEP_FP 2
+#define FLD_STEP_LEAF 3
+#define FLD_STEP_KM02 4
+#define FLD_STEP_KM13 5
+
+#define FLD_BLINK_WEIGHT_FOREST14_SIZE 6416
+#define FLD_CV_SIZE 19392
+#define FLD_FP_SIZE 80160
+#define FLD_LEAFNODE_SIZE 4608000
+#define FLD_TREE_KM02_SIZE 120000
+#define FLD_TREE_KM13_SIZE 120000
+#define FLD_OUTPUT_SIZE 112
+
+#define FLD_CUR_LANDMARK 11
+
+#define RESULT_SIZE (RLT_NUM * MAX_FACE_NUM)
+
+struct aie_static_info_element {
+	unsigned int fd_wdma_size[OUTPUT_WDMA_WRA_NUM];
+	unsigned int out_xsize_plus_1;
+	unsigned int out_height;
+	unsigned int out_ysize_plus_1_stride2;
+	unsigned int out_stride;
+	unsigned int out_stride_stride2;
+	unsigned int out_width;
+	unsigned int img_width;
+	unsigned int img_height;
+	unsigned int stride2_out_width;
+	unsigned int stride2_out_height;
+	unsigned int out_xsize_plus_1_stride2;
+	unsigned int input_xsize_plus_1;
+};
+
+struct aie_static_info {
+	struct aie_static_info_element inf_elm[FD_LOOP_NUM];
+};
+
+enum aie_state { STATE_NA = 0x0, STATE_INIT = 0x1, STATE_OPEN = 0x2 };
+
+// AIE 3.1
+enum aie_mode { FDMODE = 0, ATTRIBUTEMODE = 1, FLDMODE = 2};
+
+enum aie_format {
+	FMT_NA = 0,
+	FMT_YUV_2P = 1,
+	FMT_YVU_2P = 2,
+	FMT_YUYV = 3,
+	FMT_YVYU = 4,
+	FMT_UYVY = 5,
+	FMT_VYUY = 6,
+	FMT_MONO = 7,
+	// AIE 3.X
+	FMT_YUV420_2P = 8,
+	FMT_YUV420_1P = 9
+};
+
+enum aie_input_degree {
+	DEGREE_0 = 0,
+	DEGREE_90 = 1,
+	DEGREE_270 = 2,
+	DEGREE_180 = 3
+};
+
+/* align v4l2 user space interface */
+struct FDRESULT {
+	u16 anchor_x0[MAX_FACE_NUM];
+	u16 anchor_x1[MAX_FACE_NUM];
+	u16 anchor_y0[MAX_FACE_NUM];
+	u16 anchor_y1[MAX_FACE_NUM];
+	signed short rop_landmark_score0[MAX_FACE_NUM];
+	signed short rop_landmark_score1[MAX_FACE_NUM];
+	signed short rop_landmark_score2[MAX_FACE_NUM];
+	signed short anchor_score[MAX_FACE_NUM];
+	signed short rip_landmark_score0[MAX_FACE_NUM];
+	signed short rip_landmark_score1[MAX_FACE_NUM];
+	signed short rip_landmark_score2[MAX_FACE_NUM];
+	signed short rip_landmark_score3[MAX_FACE_NUM];
+	signed short rip_landmark_score4[MAX_FACE_NUM];
+	signed short rip_landmark_score5[MAX_FACE_NUM];
+	signed short rip_landmark_score6[MAX_FACE_NUM];
+	u16 face_result_index[MAX_FACE_NUM];
+	u16 anchor_index[MAX_FACE_NUM];
+	u32 fd_partial_result;
+};
+
+struct fd_result {
+	u16 fd_pyramid0_num;
+	u16 fd_pyramid1_num;
+	u16 fd_pyramid2_num;
+	u16 fd_total_num;
+	struct FDRESULT PYRAMID0_RESULT;
+	struct FDRESULT PYRAMID1_RESULT;
+	struct FDRESULT PYRAMID2_RESULT;
+};
+
+struct RACERESULT {
+	signed short RESULT[4][64]; // RESULT[Channel][Feature]
+};
+
+struct GENDERRESULT {
+	signed short RESULT[2][64]; // RESULT[Channel][Feature]
+};
+
+struct MERGED_RACERESULT {
+	signed short RESULT[4]; // RESULT[Feature]
+};
+
+struct MERGED_GENDERRESULT {
+	signed short RESULT[2]; // RESULT[Feature]
+};
+
+struct MERGED_AGERESULT {
+	signed short RESULT[2]; // RESULT[Feature]
+};
+
+struct MERGED_IS_INDIANRESULT {
+	signed short RESULT[2]; // RESULT[Feature]
+};
+
+struct attr_result {
+	struct GENDERRESULT GENDER_RESULT;
+	struct RACERESULT RACE_RESULT;
+	struct MERGED_AGERESULT MERGED_AGE_RESULT;
+	struct MERGED_GENDERRESULT MERGED_GENDER_RESULT;
+	struct MERGED_IS_INDIANRESULT MERGED_IS_INDIAN_RESULT;
+	struct MERGED_RACERESULT MERGED_RACE_RESULT;
+};
+
+// AIE 3.X
+struct FLD_LANDMARK {
+	u16 x;
+	u16 y;
+};
+
+struct fld_result {
+	struct FLD_LANDMARK fld_landmark[FLD_CUR_LANDMARK];
+	u16 fld_out_rip;
+	u16 fld_out_rop;
+	u16 confidence;
+	signed short blinkscore;
+};
+
+struct aie_roi {
+	u32 x1;
+	u32 y1;
+	u32 x2;
+	u32 y2;
+};
+
+struct aie_padding {
+	u32 left;
+	u32 right;
+	u32 down;
+	u32 up;
+};
+
+// AIE 3.X
+struct fld_crop_rip_rop {
+	unsigned int fld_in_crop_x1;
+	unsigned int fld_in_crop_y1;
+	unsigned int fld_in_crop_x2;
+	unsigned int fld_in_crop_y2;
+	unsigned int fld_in_rip;
+	unsigned int fld_in_rop;
+};
+
+/* align v4l2 user space interface */
+struct aie_enq_info {
+	unsigned int sel_mode;
+	unsigned int src_img_fmt;
+	unsigned int src_img_width;
+	unsigned int src_img_height;
+	unsigned int src_img_stride;
+	unsigned int pyramid_base_width;
+	unsigned int pyramid_base_height;
+	unsigned int number_of_pyramid;
+	unsigned int rotate_degree;
+	int en_roi;
+	struct aie_roi src_roi;
+	int en_padding;
+	struct aie_padding src_padding;
+	unsigned int freq_level;
+	// AIE 3.X
+	unsigned int fld_face_num;
+	struct fld_crop_rip_rop fld_input[FLD_MAX_FRAME];
+	u32 src_img_addr;
+	u32 src_img_addr_uv;
+	u32 fd_version;
+	u32 attr_version;
+	u32 pose_version;
+	struct fd_result fd_out;
+	struct attr_result attr_out;
+// AIE 3.X
+	struct fld_result fld_out[FLD_MAX_FRAME];
+	u32 irq_status;
+};
+
+struct aie_reg_cfg {
+	u32 rs_adr;
+	u32 yuv2rgb_adr;
+	u32 fd_adr;
+	u32 fd_pose_adr;
+	u32 fd_mode;
+	u32 hw_result;
+	u32 hw_result1;
+	u32 reserved;
+};
+
+struct aie_para {
+	void *fd_fd_cfg_va;
+	void *fd_rs_cfg_va;
+	void *fd_yuv2rgb_cfg_va;
+
+	void *attr_fd_cfg_va[MAX_ENQUE_FRAME_NUM];
+	void *attr_yuv2rgb_cfg_va[MAX_ENQUE_FRAME_NUM];
+
+	void *rs_pym_rst_va[PYM_NUM][COLOR_NUM];
+
+	dma_addr_t fd_fd_cfg_pa;
+	dma_addr_t fd_rs_cfg_pa;
+	dma_addr_t fd_yuv2rgb_cfg_pa;
+
+	dma_addr_t attr_fd_cfg_pa[MAX_ENQUE_FRAME_NUM];
+	dma_addr_t attr_yuv2rgb_cfg_pa[MAX_ENQUE_FRAME_NUM];
+
+	dma_addr_t rs_pym_rst_pa[PYM_NUM][COLOR_NUM];
+
+	u32 sel_mode;
+	u16 max_img_width;
+	u16 max_img_height;
+	u16 img_width;
+	u16 img_height;
+	u16 crop_width;
+	u16 crop_height;
+	u32 src_img_fmt;
+	u32 rotate_degree;
+	s16 rpn_anchor_thrd;
+	u16 pyramid_width;
+	u16 pyramid_height;
+	u16 max_pyramid_width;
+	u16 max_pyramid_height;
+	u16 number_of_pyramid;
+	u32 src_img_addr;
+	u32 src_img_addr_uv;
+};
+
+struct aie_attr_para {
+	u32 w_idx;
+	u32 r_idx;
+	u32 sel_mode[MAX_ENQUE_FRAME_NUM];
+	u16 img_width[MAX_ENQUE_FRAME_NUM];
+	u16 img_height[MAX_ENQUE_FRAME_NUM];
+	u16 crop_width[MAX_ENQUE_FRAME_NUM];
+	u16 crop_height[MAX_ENQUE_FRAME_NUM];
+	u32 src_img_fmt[MAX_ENQUE_FRAME_NUM];
+	u32 rotate_degree[MAX_ENQUE_FRAME_NUM];
+	u32 src_img_addr[MAX_ENQUE_FRAME_NUM];
+	u32 src_img_addr_uv[MAX_ENQUE_FRAME_NUM];
+};
+
+struct aie_fd_dma_para {
+	void *fd_out_hw_va[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM];
+	void *fd_kernel_va[FD_LOOP_NUM][KERNEL_RDMA_RA_NUM];
+	void *attr_out_hw_va[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM];
+	void *attr_kernel_va[ATTR_LOOP_NUM][KERNEL_RDMA_RA_NUM];
+
+	void *age_out_hw_va[MAX_ENQUE_FRAME_NUM];
+	void *gender_out_hw_va[MAX_ENQUE_FRAME_NUM];
+	void *is_indian_out_hw_va[MAX_ENQUE_FRAME_NUM];
+	void *race_out_hw_va[MAX_ENQUE_FRAME_NUM];
+
+	dma_addr_t fd_out_hw_pa[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM];
+	dma_addr_t fd_kernel_pa[FD_LOOP_NUM][KERNEL_RDMA_RA_NUM];
+	dma_addr_t attr_out_hw_pa[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM];
+	dma_addr_t attr_kernel_pa[ATTR_LOOP_NUM][KERNEL_RDMA_RA_NUM];
+
+	dma_addr_t age_out_hw_pa[MAX_ENQUE_FRAME_NUM];
+	dma_addr_t gender_out_hw_pa[MAX_ENQUE_FRAME_NUM];
+	dma_addr_t is_indian_out_hw_pa[MAX_ENQUE_FRAME_NUM];
+	dma_addr_t race_out_hw_pa[MAX_ENQUE_FRAME_NUM];
+};
+
+// AIE 3.X
+struct aie_fd_fld_para {
+	void *fld_step_va[FLD_STEP_NUM][FLD_MAX_FRAME];
+	void *fld_output_va[FLD_MAX_FRAME];
+	dma_addr_t fld_step_pa[FLD_STEP_NUM][FLD_MAX_FRAME];
+	dma_addr_t fld_output_pa[FLD_MAX_FRAME];
+};
+
+struct imem_buf_info {
+	void *va;
+	dma_addr_t pa;
+	unsigned int size;
+	unsigned int reserved;
+};
+
+struct fd_buffer {
+	u32 dma_addr; /* used by DMA HW */
+};
+
+// AIE 3.X
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+struct mtk_aie_dvfs {
+	struct device *dev;
+	struct regulator *reg;
+	unsigned int clklv_num[MTK_AIE_OPP_SET];
+	unsigned int clklv[MTK_AIE_OPP_SET][MTK_AIE_CLK_LEVEL_CNT];
+	unsigned int voltlv[MTK_AIE_OPP_SET][MTK_AIE_CLK_LEVEL_CNT];
+	unsigned int clklv_idx[MTK_AIE_OPP_SET];
+	unsigned int clklv_target[MTK_AIE_OPP_SET];
+	unsigned int cur_volt;
+};
+
+struct mtk_aie_qos_path {
+	struct icc_path *path; /* cmdq event enum value */
+	char dts_name[256];
+	unsigned long long bw;
+};
+
+struct mtk_aie_qos {
+	struct device *dev;
+	struct mtk_aie_qos_path *qos_path;
+};
+#endif
+
+struct aie_clocks {
+	struct clk_bulk_data *clks;
+	unsigned int clk_num;
+};
+
+struct mtk_aie_req_work {
+	struct work_struct work;
+	struct mtk_aie_dev *fd_dev;
+};
+
+#ifdef CONFIG_DEBUG_FS
+struct aie_trace_info {
+	char *dump_buffer;
+	unsigned int dump_size;
+	unsigned int dump_offset;
+	char trigger_dump[3];
+	char *srcdata_buf;
+	unsigned int srcdata_size;
+	char *dstdata_buf;
+	unsigned int dstdata_size;
+};
+#endif
+
+struct mtk_aie_variant {
+	unsigned int hw_version;
+	unsigned int fld_enable;
+	unsigned int y2r_cfg_size;
+	unsigned int rs_cfg_size;
+	unsigned int fd_cfg_size;
+};
+
+struct mtk_aie_dev {
+	struct device *dev;
+	struct mtk_aie_ctx *ctx;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct device *larb;
+	struct aie_para *base_para;
+	struct aie_attr_para *attr_para;
+	struct aie_fd_dma_para *dma_para;
+
+	// AIE 3.X
+	struct aie_fd_fld_para *fld_para;
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+	struct mtk_aie_dvfs *dvfs_info;
+	struct mtk_aie_qos *qos_info;
+#endif
+
+	struct aie_enq_info *aie_cfg;
+	struct workqueue_struct *frame_done_wq;
+	void __iomem *fd_base;
+	const struct mtk_aie_variant *variant;
+
+	/* Input Buffer Pointer */
+	struct imem_buf_info rs_cfg_data;
+	struct imem_buf_info fd_cfg_data;
+	struct imem_buf_info yuv2rgb_cfg_data;
+	/* HW Output Buffer Pointer */
+	struct imem_buf_info rs_output_hw;
+	struct imem_buf_info fd_dma_hw;
+	struct imem_buf_info fd_dma_result_hw;
+	struct imem_buf_info fd_kernel_hw;
+	struct imem_buf_info fd_attr_dma_hw;
+	struct aie_static_info st_info;
+
+	struct aie_reg_cfg reg_cfg;
+
+	// AIE 3.X
+	/* fld fw buffer */
+	struct media_device mdev;
+	struct video_device vfd;
+	struct aie_clocks aie_clk;
+	struct v4l2_device v4l2_dev;
+
+	/* Lock for V4L2 operations */
+	struct mutex vfd_lock;
+	/* Lock for device operations */
+	struct mutex dev_lock;
+	/* Lock for performance optimization */
+	struct mutex fd_lock;
+	struct imem_buf_info fd_fld_step_data;
+	struct imem_buf_info fd_fld_out_hw;
+
+	int irq;
+	struct completion fd_job_finished;
+	struct delayed_work job_timeout_work;
+
+	/* DRAM Buffer Size */
+	unsigned int fd_rs_cfg_size;
+	unsigned int fd_fd_cfg_size;
+	unsigned int fd_yuv2rgb_cfg_size;
+	unsigned int attr_fd_cfg_size;
+	unsigned int attr_yuv2rgb_cfg_size;
+
+	/* HW Output Buffer Size */
+	unsigned int rs_pym_out_size[PYM_NUM];
+	unsigned int fd_dma_max_size;
+	unsigned int fd_dma_rst_max_size;
+	unsigned int fd_fd_kernel_size;
+	unsigned int fd_attr_kernel_size;
+	unsigned int fd_attr_dma_max_size;
+	unsigned int fd_attr_dma_rst_max_size;
+	// AIE 3.X
+	/* fld size */
+	unsigned int fld_step_size;
+	unsigned int fld_out_size;
+
+	wait_queue_head_t flushing_waitq;
+	atomic_t num_composing;
+	struct mtk_aie_req_work req_work;
+	unsigned int fd_state;
+	unsigned int fd_mem_size;
+	u32 fd_stream_count;
+
+#ifdef CONFIG_DEBUG_FS
+	struct aie_trace_info tr_info;
+#endif
+};
+
+struct mtk_aie_ctx {
+	struct mtk_aie_dev *fd_dev;
+	struct device *dev;
+	struct v4l2_fh fh;
+	struct v4l2_ctrl_handler hdl;
+	struct v4l2_pix_format_mplane src_fmt;
+	struct v4l2_meta_format dst_fmt;
+	struct v4l2_ctrl_aie_init user_init;
+	struct v4l2_ctrl_aie_param user_param;
+};
+
+/**************************************************************************/
+/*                   C L A S S    D E C L A R A T I O N                   */
+/**************************************************************************/
+
+void aie_reset(struct mtk_aie_dev *fd);
+int aie_init(struct mtk_aie_dev *fd, struct v4l2_ctrl_aie_init *user_init);
+void aie_uninit(struct mtk_aie_dev *fd);
+void aie_prepare(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
+void aie_execute(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
+void aie_irqhandle(struct mtk_aie_dev *fd);
+void aie_get_fd_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
+void aie_get_attr_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
+void aie_get_fld_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg);
+#endif /*__MTK_AIE_H__*/
diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_53.c b/drivers/media/platform/mediatek/aie/mtk_aie_53.c
new file mode 100644
index 000000000000..a976b23c5576
--- /dev/null
+++ b/drivers/media/platform/mediatek/aie/mtk_aie_53.c
@@ -0,0 +1,2031 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Fish Wu <fish.wu@mediatek.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/remoteproc.h>
+#include <linux/types.h>
+#include <linux/version.h>
+#include <linux/mtk_aie_v4l2_controls.h>
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include <soc/mediatek/smi.h>
+
+#include "mtk_aie.h"
+
+static const struct mtk_aie_variant *mtk_aie_get_variant(struct device *dev);
+
+static struct clk_bulk_data aie_clks[] = {
+	{ .id = "IMG_IPE" },
+	{ .id = "IPE_FDVT" },
+	{ .id = "IPE_TOP" },
+	{ .id = "IPE_SMI_LARB12" },
+};
+
+#ifdef CONFIG_DEBUG_FS
+#define AIE_DUMP_BUFFER_SIZE (1 * 1024 * 1024)
+#define AIE_DEBUG_RAW_DATA_SIZE (1 * 640 * 480)
+static unsigned char srcrawdata[AIE_DEBUG_RAW_DATA_SIZE];
+static unsigned char dstrawdata[AIE_DEBUG_RAW_DATA_SIZE];
+static struct debugfs_blob_wrapper srcdata, dstdata;
+#endif
+
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+#define AIE_QOS_MAX 4
+#define AIE_QOS_RA_IDX 0
+#define AIE_QOS_RB_IDX 1
+#define AIE_QOS_WA_IDX 2
+#define AIE_QOS_WB_IDX 3
+#define AIE_READ_AVG_BW 213
+#define AIE_WRITE_AVG_BW 145
+#endif
+
+#define V4L2_CID_MTK_AIE_MAX 2
+
+static const struct v4l2_pix_format_mplane mtk_aie_img_fmts[] = {
+	{
+		.pixelformat = V4L2_PIX_FMT_NV16M,
+		.num_planes = 2,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_NV61M,
+		.num_planes = 2,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_YUYV,
+		.num_planes = 1,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_YVYU,
+		.num_planes = 1,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_UYVY,
+		.num_planes = 1,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_VYUY,
+		.num_planes = 1,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_GREY,
+		.num_planes = 1,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_NV12M,
+		.num_planes = 2,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_NV12,
+		.num_planes = 1,
+	},
+};
+
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+static const struct mtk_aie_qos_path aie_qos_path[AIE_QOS_MAX] = {
+	{ NULL, "l12_fdvt_rda", 0 },
+	{ NULL, "l12_fdvt_rdb", 0 },
+	{ NULL, "l12_fdvt_wra", 0 },
+	{ NULL, "l12_fdvt_wrb", 0 }
+};
+#endif
+
+#define NUM_FORMATS ARRAY_SIZE(mtk_aie_img_fmts)
+
+static inline struct mtk_aie_ctx *fh_to_ctx(struct v4l2_fh *fh)
+{
+	return container_of(fh, struct mtk_aie_ctx, fh);
+}
+
+static inline struct mtk_aie_ctx *ctrl_to_ctx(const struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct mtk_aie_ctx, hdl);
+}
+
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+static int mtk_aie_mmdvfs_init(struct mtk_aie_dev *fd)
+{
+	u64 freq = 0;
+	int ret = -ENOMEM;
+	int opp_num = 0, opp_idx = 0, idx = 0, volt = 0;
+	struct device_node *np = NULL, *child_np = NULL;
+	struct of_phandle_iterator it;
+
+	fd->dvfs_info = kzalloc(sizeof(*fd->dvfs_info), GFP_KERNEL);
+	if (!fd->dvfs_info)
+		return ret;
+
+	fd->dvfs_info->dev = fd->dev;
+	ret = dev_pm_opp_of_add_table(fd->dvfs_info->dev);
+	if (ret < 0) {
+		dev_err(fd->dvfs_info->dev, "fail to init opp table: %d\n", ret);
+		return ret;
+	}
+
+	fd->dvfs_info->reg =
+		devm_regulator_get(fd->dvfs_info->dev, "dvfsrc-vcore");
+	if (IS_ERR(fd->dvfs_info->reg)) {
+		dev_err(fd->dvfs_info->dev, "can't get dvfsrc-vcore\n");
+		ret = PTR_ERR(fd->dvfs_info->reg);
+		fd->dvfs_info->reg = NULL;
+		return ret;
+	}
+
+	opp_num = regulator_count_voltages(fd->dvfs_info->reg);
+	of_for_each_phandle(&it, ret, fd->dvfs_info->dev->of_node, "operating-points-v2", NULL, 0) {
+		if (!it.node) {
+			dev_err(fd->dvfs_info->dev, "of_node_get fail\n");
+			return ret;
+		}
+		np = of_node_get(it.node);
+
+		do {
+			child_np = of_get_next_available_child(np, child_np);
+			if (child_np) {
+				of_property_read_u64(child_np, "opp-hz", &freq);
+				of_property_read_u32(child_np, "opp-microvolt", &volt);
+				if (freq == 0 || volt == 0) {
+					dev_err(fd->dvfs_info->dev,
+						"%s: [ERROR] parsing zero freq/volt(%d/%d) at idx(%d)\n",
+						__func__,
+						freq,
+						volt,
+						idx
+					);
+					continue;
+				}
+				fd->dvfs_info->clklv[opp_idx][idx] = freq;
+				fd->dvfs_info->voltlv[opp_idx][idx] = volt;
+				dev_dbg(fd->dvfs_info->dev,
+					"[%s] opp=%d, idx=%d, clk=%d volt=%d\n",
+					__func__,
+					opp_idx,
+					idx,
+					fd->dvfs_info->clklv[opp_idx][idx],
+					fd->dvfs_info->voltlv[opp_idx][idx]
+				);
+				idx++;
+			}
+		} while (child_np);
+		fd->dvfs_info->clklv_num[opp_idx] = idx;
+		fd->dvfs_info->clklv_target[opp_idx] = fd->dvfs_info->clklv[opp_idx][0];
+		fd->dvfs_info->clklv_idx[opp_idx] = 0;
+		idx = 0;
+		opp_idx++;
+		of_node_put(np);
+	}
+	fd->dvfs_info->cur_volt = 0;
+
+	return 0;
+}
+
+static void mtk_aie_mmdvfs_uninit(struct mtk_aie_dev *fd)
+{
+	int volt = 0;
+
+	if (fd->dvfs_info) {
+		fd->dvfs_info->cur_volt = volt;
+
+		regulator_set_voltage(fd->dvfs_info->reg, volt, INT_MAX);
+
+		kfree(fd->dvfs_info);
+	}
+}
+
+static void mtk_aie_mmdvfs_set(struct mtk_aie_dev *fd, bool is_set,
+			       unsigned int level)
+{
+	int volt = 0, idx = 0, opp_idx = 0;
+
+	if (is_set) {
+		if (level < fd->dvfs_info->clklv_num[opp_idx])
+			idx = level;
+	}
+	volt = fd->dvfs_info->voltlv[opp_idx][idx];
+
+	if (fd->dvfs_info->cur_volt != volt) {
+		dev_dbg(fd->dvfs_info->dev,
+			"[%s] volt change opp=%d, idx=%d, clk=%d volt=%d\n",
+			__func__,
+			opp_idx,
+			idx,
+			fd->dvfs_info->clklv[opp_idx][idx],
+			fd->dvfs_info->voltlv[opp_idx][idx]
+		);
+		regulator_set_voltage(fd->dvfs_info->reg, volt, INT_MAX);
+		fd->dvfs_info->cur_volt = volt;
+	}
+}
+
+static int mtk_aie_mmqos_init(struct mtk_aie_dev *fd)
+{
+	int idx = 0;
+	int ret = -ENOMEM;
+
+	fd->qos_info = kzalloc(sizeof(*fd->qos_info), GFP_KERNEL);
+	if (!fd->qos_info)
+		return ret;
+
+	fd->qos_info->dev = fd->dev;
+	fd->qos_info->qos_path = (struct mtk_aie_qos_path *)aie_qos_path;
+
+	for (idx = 0; idx < AIE_QOS_MAX; idx++) {
+		fd->qos_info->qos_path[idx].path =
+			of_mtk_icc_get(fd->qos_info->dev, fd->qos_info->qos_path[idx].dts_name);
+		fd->qos_info->qos_path[idx].bw = 0;
+		dev_dbg(fd->qos_info->dev,
+			"[%s] idx=%d, path=%p, name=%s, bw=%llu\n",
+			__func__,
+			idx,
+			fd->qos_info->qos_path[idx].path,
+			fd->qos_info->qos_path[idx].dts_name,
+			fd->qos_info->qos_path[idx].bw
+		);
+	}
+	return 0;
+}
+
+static void mtk_aie_mmqos_uninit(struct mtk_aie_dev *fd)
+{
+	int idx = 0;
+
+	if (fd->qos_info) {
+		for (idx = 0; idx < AIE_QOS_MAX; idx++) {
+			if (!fd->qos_info->qos_path[idx].path) {
+				dev_dbg(fd->qos_info->dev,
+					"[%s] path of idx(%d) is NULL\n",
+					__func__,
+					idx
+				);
+				continue;
+			}
+			dev_dbg(fd->qos_info->dev,
+				"[%s] idx=%d, path=%p, bw=%llu\n",
+				__func__,
+				idx,
+				fd->qos_info->qos_path[idx].path,
+				fd->qos_info->qos_path[idx].bw
+			);
+			fd->qos_info->qos_path[idx].bw = 0;
+			mtk_icc_set_bw(fd->qos_info->qos_path[idx].path, 0, 0);
+		}
+		kfree(fd->qos_info);
+	}
+}
+
+static void mtk_aie_mmqos_set(struct mtk_aie_dev *fd, bool is_set)
+{
+	int r_bw = 0;
+	int w_bw = 0;
+	int idx = 0;
+
+	if (is_set) {
+		r_bw = AIE_READ_AVG_BW;
+		w_bw = AIE_WRITE_AVG_BW;
+	}
+
+	for (idx = 0; idx < AIE_QOS_MAX; idx++) {
+		if (!fd->qos_info->qos_path[idx].path) {
+			dev_dbg(fd->qos_info->dev,
+				"[%s] path of idx(%d) is NULL\n",
+				__func__,
+				idx
+			);
+			continue;
+		}
+
+		if (idx == AIE_QOS_RA_IDX &&
+		    fd->qos_info->qos_path[idx].bw != r_bw) {
+			dev_dbg(fd->qos_info->dev,
+				"[%s] idx=%d, path=%p, bw=%llu/%d,\n",
+				__func__,
+				idx,
+				fd->qos_info->qos_path[idx].path,
+				fd->qos_info->qos_path[idx].bw,
+				r_bw
+			);
+			fd->qos_info->qos_path[idx].bw = r_bw;
+			mtk_icc_set_bw(fd->qos_info->qos_path[idx].path,
+				       MBps_to_icc(fd->qos_info->qos_path[idx].bw),
+				       0
+			);
+		}
+
+		if (idx == AIE_QOS_WA_IDX &&
+		    fd->qos_info->qos_path[idx].bw != w_bw) {
+			dev_dbg(fd->qos_info->dev,
+				"[%s] idx=%d, path=%p, bw=%llu/%d,\n",
+				__func__,
+				idx,
+				fd->qos_info->qos_path[idx].path,
+				fd->qos_info->qos_path[idx].bw,
+				w_bw
+			);
+			fd->qos_info->qos_path[idx].bw = w_bw;
+			mtk_icc_set_bw(fd->qos_info->qos_path[idx].path,
+				       MBps_to_icc(fd->qos_info->qos_path[idx].bw),
+				       0
+			);
+		}
+	}
+}
+#endif
+
+static int mtk_aie_hw_enable(struct mtk_aie_dev *fd)
+{
+	struct mtk_aie_ctx *ctx = fd->ctx;
+
+	/* initial value */
+	dev_info(fd->dev, "init param : max w:%d, max h:%d",
+		 ctx->user_init.max_img_width, ctx->user_init.max_img_height);
+
+	dev_info(fd->dev, "init param : p_w:%d, p_h:%d, f thread:%d",
+		 ctx->user_init.pyramid_width,
+		 ctx->user_init.pyramid_height,
+		 ctx->user_init.feature_threshold);
+
+	return aie_init(fd, &ctx->user_init);
+}
+
+static void mtk_aie_hw_job_finish(struct mtk_aie_dev *fd,
+				  enum vb2_buffer_state vb_state)
+{
+	struct mtk_aie_ctx *ctx = NULL;
+	struct vb2_v4l2_buffer *src_vbuf = NULL, *dst_vbuf = NULL;
+
+	pm_runtime_put(fd->dev);
+	ctx = v4l2_m2m_get_curr_priv(fd->m2m_dev);
+	if (!ctx) {
+		dev_err(fd->dev, "Failed to do v4l2_m2m_get_curr_priv!\n");
+	} else {
+		src_vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		dst_vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		if (src_vbuf && dst_vbuf)
+			v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, true);
+		if (src_vbuf)
+			v4l2_m2m_buf_done(src_vbuf, vb_state);
+		if (dst_vbuf)
+			v4l2_m2m_buf_done(dst_vbuf, vb_state);
+		if (src_vbuf && dst_vbuf)
+			v4l2_m2m_job_finish(fd->m2m_dev, ctx->fh.m2m_ctx);
+	}
+	complete_all(&fd->fd_job_finished);
+}
+
+static int mtk_aie_hw_connect(struct mtk_aie_dev *fd)
+{
+	if (mtk_aie_hw_enable(fd))
+		return -EINVAL;
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+	mtk_aie_mmdvfs_set(fd, 1, 0);
+	mtk_aie_mmqos_set(fd, 1);
+#endif
+
+	return 0;
+}
+
+static void mtk_aie_hw_disconnect(struct mtk_aie_dev *fd)
+{
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+	mtk_aie_mmqos_set(fd, 0);
+	mtk_aie_mmdvfs_set(fd, 0, 0);
+#endif
+	aie_uninit(fd);
+}
+
+static int mtk_aie_hw_job_exec(struct mtk_aie_dev *fd)
+{
+	pm_runtime_get_sync(fd->dev);
+
+	reinit_completion(&fd->fd_job_finished);
+	schedule_delayed_work(&fd->job_timeout_work,
+			      msecs_to_jiffies(MTK_FD_HW_TIMEOUT_IN_MSEC)
+	);
+
+	return 0;
+}
+
+static int mtk_aie_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	if (v4l2_buf->field == V4L2_FIELD_ANY)
+		v4l2_buf->field = V4L2_FIELD_NONE;
+	if (v4l2_buf->field != V4L2_FIELD_NONE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mtk_aie_vb2_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vq);
+	struct device *dev = ctx->dev;
+	struct v4l2_pix_format_mplane *pixfmt = NULL;
+	int ret = 0;
+
+	switch (vq->type) {
+	case V4L2_BUF_TYPE_META_CAPTURE:
+		if (vb2_plane_size(vb, 0) < ctx->dst_fmt.buffersize) {
+			dev_err(dev, "meta size %lu is too small\n", vb2_plane_size(vb, 0));
+			ret = -EINVAL;
+		} else {
+			vb2_set_plane_payload(vb, 0, ctx->dst_fmt.buffersize);
+		}
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		pixfmt = &ctx->src_fmt;
+
+		if (vbuf->field == V4L2_FIELD_ANY)
+			vbuf->field = V4L2_FIELD_NONE;
+
+		if (vb->num_planes > 2 || vbuf->field != V4L2_FIELD_NONE) {
+			dev_dbg(dev,
+				"plane %d or field %d not supported\n",
+				vb->num_planes,
+				vbuf->field
+			);
+			ret = -EINVAL;
+		}
+
+		if (vb2_plane_size(vb, 0) < pixfmt->plane_fmt[0].sizeimage) {
+			dev_dbg(dev,
+				"plane 0 %lu is too small than %x\n",
+				vb2_plane_size(vb, 0),
+				pixfmt->plane_fmt[0].sizeimage
+			);
+			ret = -EINVAL;
+		} else {
+			vb2_set_plane_payload(vb, 0, pixfmt->plane_fmt[0].sizeimage);
+		}
+
+		if (pixfmt->num_planes == 2 &&
+		    vb2_plane_size(vb, 1) < pixfmt->plane_fmt[1].sizeimage) {
+			dev_dbg(dev,
+				"plane 1 %lu is too small than %x\n",
+				vb2_plane_size(vb, 1),
+				pixfmt->plane_fmt[1].sizeimage
+			);
+			ret = -EINVAL;
+		} else {
+			vb2_set_plane_payload(vb, 1, pixfmt->plane_fmt[1].sizeimage);
+		}
+		break;
+	}
+
+	return ret;
+}
+
+static void mtk_aie_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int mtk_aie_vb2_queue_setup(struct vb2_queue *vq,
+				   unsigned int *num_buffers,
+				   unsigned int *num_planes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vq);
+	struct device *dev = ctx->dev;
+	unsigned int size[2] = { 0, 0 };
+	unsigned int plane = 0;
+
+	switch (vq->type) {
+	case V4L2_BUF_TYPE_META_CAPTURE:
+		size[0] = ctx->dst_fmt.buffersize;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		size[0] = ctx->src_fmt.plane_fmt[0].sizeimage;
+		size[1] = ctx->src_fmt.plane_fmt[1].sizeimage;
+		break;
+	}
+
+	dev_info(dev, "vq type =%d, size[0]=%d, size[1]=%d\n", vq->type, size[0], size[1]);
+
+	if (*num_planes > 2)
+		return -EINVAL;
+
+	*num_buffers = clamp_val(*num_buffers, 1, VB2_MAX_FRAME);
+
+	if (*num_planes == 0) {
+		if (vq->type == V4L2_BUF_TYPE_META_CAPTURE) {
+			sizes[0] = ctx->dst_fmt.buffersize;
+			*num_planes = 1;
+			return 0;
+		}
+
+		*num_planes = ctx->src_fmt.num_planes;
+		if (*num_planes > 2)
+			return -EINVAL;
+		for (plane = 0; plane < *num_planes; plane++)
+			sizes[plane] = ctx->src_fmt.plane_fmt[plane].sizeimage;
+
+		return 0;
+	}
+
+	return 0;
+}
+
+static int mtk_aie_vb2_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vq);
+	struct mtk_aie_dev *fd = NULL;
+
+	if (!ctx)
+		return -EINVAL;
+
+	fd = ctx->fd_dev;
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		fd->fd_stream_count++;
+		if (fd->fd_stream_count == 1)
+			return mtk_aie_hw_connect(ctx->fd_dev);
+	}
+
+	return 0;
+}
+
+static void aie_dumpinfo(struct mtk_aie_dev *fd)
+{
+	unsigned int i = 0;
+	u32 *cfg_value = NULL;
+
+	for (i = 0; i < 0x158; i = i + 4) {
+		fd->tr_info.dump_offset +=
+			scnprintf(fd->tr_info.dump_buffer + fd->tr_info.dump_offset,
+				  fd->tr_info.dump_size - fd->tr_info.dump_offset,
+				  "Reg: %x %x\n",
+				  i,
+				  readl(fd->fd_base + i)
+			);
+	}
+	for (i = 0x200; i < 0x3F8; i = i + 4) {
+		fd->tr_info.dump_offset +=
+			scnprintf(fd->tr_info.dump_buffer + fd->tr_info.dump_offset,
+				  fd->tr_info.dump_size - fd->tr_info.dump_offset,
+				  "Dma Reg: %x %x\n",
+				  i,
+				  readl(fd->fd_base + i)
+			);
+	}
+	if (fd->aie_cfg->sel_mode == FDMODE) {
+		cfg_value = (u32 *)fd->base_para->fd_yuv2rgb_cfg_va;
+		for (i = 0; i < fd->fd_yuv2rgb_cfg_size / 4; i++) {
+			fd->tr_info.dump_offset +=
+				scnprintf(fd->tr_info.dump_buffer + fd->tr_info.dump_offset,
+					  fd->tr_info.dump_size - fd->tr_info.dump_offset,
+					  "YUV config: %x, %x\n",
+					  i,
+					  cfg_value[i]
+				);
+		}
+		cfg_value = (u32 *)fd->base_para->fd_rs_cfg_va;
+		for (i = 0; i < fd->fd_rs_cfg_size / 4; i++) {
+			fd->tr_info.dump_offset +=
+				scnprintf(fd->tr_info.dump_buffer + fd->tr_info.dump_offset,
+					  fd->tr_info.dump_size - fd->tr_info.dump_offset,
+					  "RS config: %x, %x\n",
+					  i,
+					  cfg_value[i]
+				);
+		}
+		cfg_value = (u32 *)fd->base_para->fd_fd_cfg_va;
+		for (i = 0; i < fd->fd_fd_cfg_size / 4; i++) {
+			fd->tr_info.dump_offset +=
+				scnprintf(fd->tr_info.dump_buffer + fd->tr_info.dump_offset,
+					  fd->tr_info.dump_size - fd->tr_info.dump_offset,
+					  "FD config: %x, %x\n",
+					  i,
+					  cfg_value[i]
+				);
+		}
+	}
+
+	if (fd->aie_cfg->sel_mode == ATTRIBUTEMODE) {
+		cfg_value = (u32 *)fd->base_para->attr_yuv2rgb_cfg_va;
+		for (i = 0; i < fd->fd_yuv2rgb_cfg_size / 4; i++) {
+			fd->tr_info.dump_offset +=
+				scnprintf(fd->tr_info.dump_buffer + fd->tr_info.dump_offset,
+					  fd->tr_info.dump_size - fd->tr_info.dump_offset,
+					  "YUV config: %x, %x\n",
+					  i,
+					  cfg_value[i]
+				);
+		}
+		cfg_value = (u32 *)fd->base_para->attr_fd_cfg_va;
+		for (i = 0; i < fd->fd_fd_cfg_size / 4; i++) {
+			fd->tr_info.dump_offset +=
+				scnprintf(fd->tr_info.dump_buffer + fd->tr_info.dump_offset,
+					  fd->tr_info.dump_size - fd->tr_info.dump_offset,
+					  "FD config: %x, %x\n",
+					  i,
+					  cfg_value[i]
+				);
+		}
+	}
+
+	if (fd->tr_info.srcdata_size <= AIE_DEBUG_RAW_DATA_SIZE)
+		memcpy(srcrawdata, fd->tr_info.srcdata_buf, fd->tr_info.srcdata_size);
+
+	if (fd->tr_info.dstdata_size <= AIE_DEBUG_RAW_DATA_SIZE)
+		memcpy(dstrawdata, fd->tr_info.dstdata_buf, fd->tr_info.dstdata_size);
+}
+
+static void mtk_aie_job_timeout_work(struct work_struct *work)
+{
+	struct mtk_aie_dev *fd =
+		container_of(work, struct mtk_aie_dev, job_timeout_work.work);
+
+	dev_err(fd->dev, "FD Job timeout!");
+
+	dev_dbg(fd->dev,
+		"%s result result1: %x, %x, %x",
+		__func__,
+		readl(fd->fd_base + AIE_RESULT_0_REG),
+		readl(fd->fd_base + AIE_RESULT_1_REG),
+		readl(fd->fd_base + AIE_DMA_CTL_REG)
+	);
+
+	fd->aie_cfg->irq_status = readl(fd->fd_base + AIE_INT_EN_REG);
+
+#ifdef CONFIG_DEBUG_FS
+	if (fd->aie_cfg->irq_status & 0x00010000 ||
+	    fd->aie_cfg->irq_status & 0x00100000 ||
+	    fd->aie_cfg->irq_status & 0x01000000)
+		aie_dumpinfo(fd);
+#endif
+
+	if (fd->aie_cfg->sel_mode == ATTRIBUTEMODE)
+		dev_dbg(fd->dev,
+			"[ATTRMODE] w_idx = %d, r_idx = %d\n",
+			fd->attr_para->w_idx,
+			fd->attr_para->r_idx
+		);
+
+	aie_irqhandle(fd);
+	aie_reset(fd);
+	atomic_dec(&fd->num_composing);
+	mtk_aie_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
+	wake_up(&fd->flushing_waitq);
+}
+
+static int mtk_aie_job_wait_finish(struct mtk_aie_dev *fd)
+{
+	return wait_for_completion_timeout(&fd->fd_job_finished, msecs_to_jiffies(1000));
+}
+
+static void mtk_aie_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vq);
+	struct mtk_aie_dev *fd = ctx->fd_dev;
+	struct vb2_v4l2_buffer *vb = NULL;
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct v4l2_m2m_queue_ctx *queue_ctx;
+
+	if (!mtk_aie_job_wait_finish(fd))
+		dev_info(fd->dev, "wait job finish timeout\n");
+
+	if (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		fd->fd_stream_count--;
+		if (fd->fd_stream_count > 0)
+			dev_info(fd->dev, "stop: fd_stream_count = %d\n", fd->fd_stream_count);
+		else
+			mtk_aie_hw_disconnect(fd);
+	}
+
+	queue_ctx = V4L2_TYPE_IS_OUTPUT(vq->type) ? &m2m_ctx->out_q_ctx :
+						    &m2m_ctx->cap_q_ctx;
+	while ((vb = v4l2_m2m_buf_remove(queue_ctx)))
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
+}
+
+static void mtk_aie_vb2_request_complete(struct vb2_buffer *vb)
+{
+	struct mtk_aie_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
+}
+
+static int mtk_aie_querycap(struct file *file, void *fh,
+			    struct v4l2_capability *cap)
+{
+	struct mtk_aie_dev *fd = video_drvdata(file);
+	struct device *dev = fd->dev;
+
+	strscpy(cap->driver, dev_driver_string(dev), sizeof(cap->driver));
+	strscpy(cap->card, dev_driver_string(dev), sizeof(cap->card));
+
+	cap->device_caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+			   V4L2_CAP_STREAMING | V4L2_CAP_META_CAPTURE;
+	cap->capabilities = V4L2_CAP_DEVICE_CAPS | cap->device_caps;
+
+	return 0;
+}
+
+static int mtk_aie_enum_fmt_out_mp(struct file *file, void *fh,
+				   struct v4l2_fmtdesc *f)
+{
+	if (f->index >= NUM_FORMATS)
+		return -EINVAL;
+
+	f->pixelformat = mtk_aie_img_fmts[f->index].pixelformat;
+	return 0;
+}
+
+static void mtk_aie_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
+				   const struct v4l2_pix_format_mplane *sfmt)
+{
+	dfmt->field = V4L2_FIELD_NONE;
+	dfmt->colorspace = V4L2_COLORSPACE_BT2020;
+	dfmt->num_planes = sfmt->num_planes;
+	dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+	dfmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
+	dfmt->pixelformat = sfmt->pixelformat;
+
+	/* Keep user setting as possible */
+	dfmt->width = clamp(dfmt->width, MTK_FD_OUTPUT_MIN_WIDTH,
+			    MTK_FD_OUTPUT_MAX_WIDTH);
+	dfmt->height = clamp(dfmt->height, MTK_FD_OUTPUT_MIN_HEIGHT,
+			     MTK_FD_OUTPUT_MAX_HEIGHT);
+
+	dfmt->plane_fmt[0].bytesperline = ALIGN(dfmt->width, 16);
+	dfmt->plane_fmt[1].bytesperline = ALIGN(dfmt->width, 16);
+
+	if (sfmt->num_planes == 2) {
+		dfmt->plane_fmt[0].sizeimage =
+			dfmt->height * dfmt->plane_fmt[0].bytesperline;
+		if (sfmt->pixelformat == V4L2_PIX_FMT_NV12M)
+			dfmt->plane_fmt[1].sizeimage =
+				dfmt->height * dfmt->plane_fmt[1].bytesperline /
+				2;
+		else
+			dfmt->plane_fmt[1].sizeimage =
+				dfmt->height * dfmt->plane_fmt[1].bytesperline;
+	} else {
+		if (sfmt->pixelformat == V4L2_PIX_FMT_NV12)
+			dfmt->plane_fmt[0].sizeimage =
+				dfmt->height * dfmt->plane_fmt[0].bytesperline *
+				3 / 2;
+		else
+			dfmt->plane_fmt[0].sizeimage =
+				dfmt->height * dfmt->plane_fmt[0].bytesperline;
+	}
+}
+
+static const struct v4l2_pix_format_mplane *mtk_aie_find_fmt(u32 format)
+{
+	unsigned int i = 0;
+
+	for (i = 0; i < NUM_FORMATS; i++) {
+		if (mtk_aie_img_fmts[i].pixelformat == format)
+			return &mtk_aie_img_fmts[i];
+	}
+
+	return NULL;
+}
+
+static int mtk_aie_try_fmt_out_mp(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct v4l2_pix_format_mplane *fmt = NULL;
+
+	fmt = mtk_aie_find_fmt(pix_mp->pixelformat);
+	if (!fmt)
+		fmt = &mtk_aie_img_fmts[0]; /* Get default img fmt */
+
+	mtk_aie_fill_pixfmt_mp(pix_mp, fmt);
+	return 0;
+}
+
+static int mtk_aie_g_fmt_out_mp(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_aie_ctx *ctx = fh_to_ctx(fh);
+
+	f->fmt.pix_mp = ctx->src_fmt;
+
+	return 0;
+}
+
+static int mtk_aie_s_fmt_out_mp(struct file *file, void *fh,
+				struct v4l2_format *f)
+{
+	struct mtk_aie_ctx *ctx = fh_to_ctx(fh);
+	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	struct mtk_aie_dev *fd = ctx->fd_dev;
+	const struct v4l2_pix_format_mplane *fmt = NULL;
+
+	if (!vq) {
+		dev_err(fd->dev, "%s vq is NULL!\n", __func__);
+		return -EINVAL;
+	}
+
+	/* Change not allowed if queue is streaming. */
+	if (vb2_is_streaming(vq))
+		return -EBUSY;
+
+	fmt = mtk_aie_find_fmt(f->fmt.pix_mp.pixelformat);
+	if (!fmt)
+		fmt = &mtk_aie_img_fmts[0]; /* Get default img fmt */
+	else if (&fd->ctx->fh != file->private_data)
+		return -EBUSY;
+	if (fd->ctx != ctx)
+		fd->ctx = ctx;
+
+	mtk_aie_fill_pixfmt_mp(&f->fmt.pix_mp, fmt);
+	ctx->src_fmt = f->fmt.pix_mp;
+
+	return 0;
+}
+
+static int mtk_aie_enum_fmt_meta_cap(struct file *file, void *fh,
+				     struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	strscpy(f->description, "Face detection result",
+		sizeof(f->description));
+
+	f->pixelformat = V4L2_META_FMT_MTFD_RESULT;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int mtk_aie_g_fmt_meta_cap(struct file *file, void *fh,
+				  struct v4l2_format *f)
+{
+	f->fmt.meta.dataformat = V4L2_META_FMT_MTFD_RESULT;
+	f->fmt.meta.buffersize = sizeof(struct aie_enq_info);
+
+	return 0;
+}
+
+static const struct vb2_ops mtk_aie_vb2_ops = {
+	.queue_setup = mtk_aie_vb2_queue_setup,
+	.buf_out_validate = mtk_aie_vb2_buf_out_validate,
+	.buf_prepare = mtk_aie_vb2_buf_prepare,
+	.buf_queue = mtk_aie_vb2_buf_queue,
+	.start_streaming = mtk_aie_vb2_start_streaming,
+	.stop_streaming = mtk_aie_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_request_complete = mtk_aie_vb2_request_complete,
+};
+
+static const struct v4l2_ioctl_ops mtk_aie_v4l2_video_out_ioctl_ops = {
+	.vidioc_querycap = mtk_aie_querycap,
+	.vidioc_enum_fmt_vid_out = mtk_aie_enum_fmt_out_mp,
+	.vidioc_g_fmt_vid_out_mplane = mtk_aie_g_fmt_out_mp,
+	.vidioc_s_fmt_vid_out_mplane = mtk_aie_s_fmt_out_mp,
+	.vidioc_try_fmt_vid_out_mplane = mtk_aie_try_fmt_out_mp,
+	.vidioc_enum_fmt_meta_cap = mtk_aie_enum_fmt_meta_cap,
+	.vidioc_g_fmt_meta_cap = mtk_aie_g_fmt_meta_cap,
+	.vidioc_s_fmt_meta_cap = mtk_aie_g_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap = mtk_aie_g_fmt_meta_cap,
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static int mtk_aie_queue_init(void *priv, struct vb2_queue *src_vq,
+			      struct vb2_queue *dst_vq)
+{
+	struct mtk_aie_ctx *ctx = priv;
+	int ret = -EINVAL;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->supports_requests = true;
+	src_vq->drv_priv = ctx;
+	src_vq->ops = &mtk_aie_vb2_ops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &ctx->fd_dev->vfd_lock;
+	src_vq->dev = ctx->fd_dev->v4l2_dev.dev;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_META_CAPTURE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->ops = &mtk_aie_vb2_ops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &ctx->fd_dev->vfd_lock;
+	dst_vq->dev = ctx->fd_dev->v4l2_dev.dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static int mtk_aie_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_aie_ctx *ctx = ctrl_to_ctx(ctrl);
+	struct v4l2_ctrl_aie_init *p_aie_init = NULL;
+	struct v4l2_ctrl_aie_param *p_aie_param = NULL;
+
+	if (!ctx)
+		return -EINVAL;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MTK_AIE_INIT:
+		p_aie_init = ctrl->p_new.p;
+		memcpy(&ctx->user_init, p_aie_init, sizeof(struct v4l2_ctrl_aie_init));
+		break;
+
+	case V4L2_CID_MTK_AIE_PARAM:
+		p_aie_param = ctrl->p_new.p;
+		memcpy(&ctx->user_param, p_aie_param, sizeof(struct v4l2_ctrl_aie_param));
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops aie_ctrl_ops = {
+	.s_ctrl = mtk_aie_s_ctrl,
+};
+
+static void mtk_aie_ctrl_type_op_init(const struct v4l2_ctrl *ctrl,
+				      u32 from_idx, union v4l2_ctrl_ptr ptr)
+{
+	struct v4l2_ctrl_aie_init *p_aie_init = NULL;
+	struct v4l2_ctrl_aie_param *p_aie_param = NULL;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MTK_AIE_INIT:
+		p_aie_init = ptr.p;
+		memset(p_aie_init, 0, sizeof(struct v4l2_ctrl_aie_init));
+		break;
+
+	case V4L2_CID_MTK_AIE_PARAM:
+		p_aie_param = ptr.p;
+		memset(p_aie_param, 0, sizeof(struct v4l2_ctrl_aie_param));
+		break;
+
+	default:
+		break;
+	}
+}
+
+static int mtk_aie_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
+					 union v4l2_ctrl_ptr ptr)
+{
+	struct mtk_aie_ctx *ctx = ctrl_to_ctx(ctrl);
+	struct mtk_aie_dev *fd = NULL;
+	struct v4l2_ctrl_aie_init *p_aie_init = NULL;
+	struct v4l2_ctrl_aie_param *p_aie_param = NULL;
+
+	if (!ctx)
+		return -EINVAL;
+
+	fd = ctx->fd_dev;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MTK_AIE_PARAM:
+		p_aie_param = ptr.p;
+
+		switch (p_aie_param->fd_mode) {
+		case FDMODE:
+		case ATTRIBUTEMODE:
+		case FLDMODE:
+			break;
+		default:
+			dev_err(ctx->dev, "AIE err:  mode: %d\n", p_aie_param->fd_mode);
+				return -EINVAL;
+		}
+
+		switch (p_aie_param->src_img_fmt) {
+		case FMT_YUV_2P:
+		case FMT_YVU_2P:
+		case FMT_YUYV:
+		case FMT_YVYU:
+		case FMT_UYVY:
+		case FMT_VYUY:
+		case FMT_MONO:
+		case FMT_YUV420_2P:
+		case FMT_YUV420_1P:
+			break;
+		default:
+			dev_err(ctx->dev, "AIE err:  fmt: %d\n", p_aie_param->src_img_fmt);
+			return -EINVAL;
+		}
+
+		if (p_aie_param->src_img_width >
+				fd->base_para->max_img_width ||
+			p_aie_param->src_img_height >
+				fd->base_para->max_img_height ||
+			p_aie_param->src_img_width == 0 ||
+			p_aie_param->src_img_height == 0) {
+			dev_err(fd->dev, "AIE err: Src_WD: %d Src_HT: %d\n",
+				p_aie_param->src_img_width,
+				p_aie_param->src_img_height);
+
+			dev_err(fd->dev,
+				"AIE err: MAX_Src_WD: %d MAX_Src_HT: %d\n",
+				fd->base_para->max_img_width,
+				fd->base_para->max_img_height);
+
+			return -EINVAL;
+		}
+
+		if (p_aie_param->pyramid_base_width
+				> fd->base_para->max_pyramid_width ||
+			p_aie_param->pyramid_base_height
+				> fd->base_para->max_pyramid_height ||
+			p_aie_param->number_of_pyramid > 3 ||
+			p_aie_param->number_of_pyramid <= 0) {
+			dev_err(fd->dev, "AIE err: base w: %d h: %d num: %d\n",
+				p_aie_param->pyramid_base_width,
+				p_aie_param->pyramid_base_height,
+				p_aie_param->number_of_pyramid);
+
+			dev_err(fd->dev, "AIE err: max w: %d h: %d\n",
+				fd->base_para->max_pyramid_width,
+				fd->base_para->max_pyramid_height);
+
+			return -EINVAL;
+		}
+
+		break;
+
+	case V4L2_CID_MTK_AIE_INIT:
+		p_aie_init = ptr.p;
+		if (!p_aie_init->max_img_width || !p_aie_init->max_img_height ||
+		    !p_aie_init->pyramid_width || !p_aie_init->pyramid_height) {
+			dev_err(fd->dev,
+				"AIE INIT err: max_w: %d max_h: %d, p_w: %d p_h: %d\n",
+				p_aie_init->max_img_width, p_aie_init->max_img_height,
+				p_aie_init->pyramid_width, p_aie_init->pyramid_height);
+
+			return -EINVAL;
+		}
+
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_type_ops aie_ctrl_type_ops = {
+	.equal = v4l2_ctrl_type_op_equal,
+	.init = mtk_aie_ctrl_type_op_init,
+	.log = v4l2_ctrl_type_op_log,
+	.validate = mtk_aie_ctrl_type_op_validate,
+};
+
+static struct v4l2_ctrl_config mtk_aie_controls[] = {
+	{
+		.ops = &aie_ctrl_ops,
+		.type_ops = &aie_ctrl_type_ops,
+		.id = V4L2_CID_MTK_AIE_INIT,
+		.name = "FD detection init",
+		.type = V4L2_CTRL_TYPE_AIE_INIT,
+		.elem_size = sizeof(struct v4l2_ctrl_aie_init),
+	},
+	{
+		.ops = &aie_ctrl_ops,
+		.type_ops = &aie_ctrl_type_ops,
+		.id = V4L2_CID_MTK_AIE_PARAM,
+		.name = "FD detection param",
+		.type = V4L2_CTRL_TYPE_AIE_PARAM,
+		.elem_size = sizeof(struct v4l2_ctrl_aie_param),
+	},
+};
+
+static int mtk_aie_ctrls_setup(struct mtk_aie_ctx *ctx)
+{
+	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
+	int i;
+
+	v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_AIE_MAX);
+	if (hdl->error)
+		return hdl->error;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_aie_controls); i++) {
+		v4l2_ctrl_new_custom(hdl, &mtk_aie_controls[i], ctx);
+		if (hdl->error) {
+			v4l2_ctrl_handler_free(hdl);
+			dev_err(ctx->dev, "Failed to register controls:%d", i);
+			return hdl->error;
+		}
+	}
+
+	ctx->fh.ctrl_handler = &ctx->hdl;
+	v4l2_ctrl_handler_setup(hdl);
+
+	return 0;
+}
+
+static void init_ctx_fmt(struct mtk_aie_ctx *ctx)
+{
+	struct v4l2_pix_format_mplane *src_fmt = &ctx->src_fmt;
+	struct v4l2_meta_format *dst_fmt = &ctx->dst_fmt;
+
+	/* Initialize M2M source fmt */
+	src_fmt->width = MTK_FD_OUTPUT_MAX_WIDTH;
+	src_fmt->height = MTK_FD_OUTPUT_MAX_HEIGHT;
+	mtk_aie_fill_pixfmt_mp(src_fmt, &mtk_aie_img_fmts[0]);
+
+	/* Initialize M2M destination fmt */
+	dst_fmt->buffersize = sizeof(struct aie_enq_info);
+	dst_fmt->dataformat = V4L2_META_FMT_MTFD_RESULT;
+}
+
+/*
+ * V4L2 file operations.
+ */
+static int mtk_vfd_open(struct file *filp)
+{
+	struct mtk_aie_dev *fd = video_drvdata(filp);
+	struct video_device *vdev = video_devdata(filp);
+	struct mtk_aie_ctx *ctx = NULL;
+	int ret = -EINVAL;
+
+	mutex_lock(&fd->dev_lock);
+
+	if (fd->fd_state & STATE_OPEN) {
+		dev_info(fd->dev, "vfd_open again");
+		ret =  -EBUSY;
+		goto err_unlock;
+	}
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		ret =  -ENOMEM;
+		goto err_unlock;
+	}
+
+	ctx->fd_dev = fd;
+	ctx->dev = fd->dev;
+	fd->ctx = ctx;
+
+	v4l2_fh_init(&ctx->fh, vdev);
+	filp->private_data = &ctx->fh;
+
+	init_ctx_fmt(ctx);
+
+	ret = mtk_aie_ctrls_setup(ctx);
+	if (ret) {
+		dev_err(ctx->dev, "Failed to set up controls:%d\n", ret);
+		goto err_fh_exit;
+	}
+	ctx->fh.m2m_ctx =
+		v4l2_m2m_ctx_init(fd->m2m_dev, ctx, &mtk_aie_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		goto err_free_ctrl_handler;
+	}
+	v4l2_fh_add(&ctx->fh);
+	fd->fd_state |= STATE_OPEN;
+
+	mutex_unlock(&fd->dev_lock);
+
+	return 0;
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&ctx->hdl);
+err_fh_exit:
+	v4l2_fh_exit(&ctx->fh);
+	kfree(ctx);
+err_unlock:
+	mutex_unlock(&fd->dev_lock);
+
+	return ret;
+}
+
+static int mtk_vfd_release(struct file *filp)
+{
+	struct mtk_aie_ctx *ctx =
+		container_of(filp->private_data, struct mtk_aie_ctx, fh);
+	struct mtk_aie_dev *fd = video_drvdata(filp);
+
+	mutex_lock(&fd->dev_lock);
+
+	fd->fd_state &= ~STATE_OPEN;
+
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_ctrl_handler_free(&ctx->hdl);
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+
+	kfree(ctx);
+
+	mutex_unlock(&fd->dev_lock);
+
+	return 0;
+}
+
+static __poll_t mtk_vfd_fop_poll(struct file *file, poll_table *wait)
+{
+	struct mtk_aie_ctx *ctx =
+		container_of(file->private_data, struct mtk_aie_ctx, fh);
+
+	struct mtk_aie_dev *fd = ctx->fd_dev;
+
+	if (fd->fd_state & STATE_INIT) {
+		if (!mtk_aie_job_wait_finish(ctx->fd_dev)) {
+			dev_info(ctx->dev, "wait job finish timeout from poll\n");
+			return EPOLLERR;
+		}
+	}
+
+	return v4l2_m2m_fop_poll(file, wait);
+}
+
+static const struct v4l2_file_operations fd_video_fops = {
+	.owner = THIS_MODULE,
+	.open = mtk_vfd_open,
+	.release = mtk_vfd_release,
+	.poll = mtk_vfd_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static int mtk_aie_job_ready(void *priv)
+{
+	struct mtk_aie_ctx *ctx = priv;
+	struct mtk_aie_dev *fd = ctx->fd_dev;
+	struct vb2_v4l2_buffer *src_buf = NULL, *dst_buf = NULL;
+	struct fd_buffer src_img[2] = {};
+	void *plane_vaddr = NULL;
+	int ret = 1;
+
+	if (!ctx->fh.m2m_ctx) {
+		dev_info(fd->dev, "Memory-to-memory context is NULL\n");
+		return 0;
+	}
+
+	if (!(fd->fd_state & STATE_OPEN)) {
+		dev_err(fd->dev, "%s fd state fail: %d\n", __func__, fd->fd_state);
+		return 0;
+	}
+
+	mutex_lock(&fd->fd_lock);
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	if (!src_buf || !dst_buf) {
+		dev_err(fd->dev, "src or dst buf is NULL\n");
+		ret = 0;
+		goto err_unlock;
+	}
+
+	if (!(fd->fd_state & STATE_INIT)) {
+		dev_err(fd->dev, "%s fd state fail: %d\n", __func__, fd->fd_state);
+		ret = 0;
+		goto err_unlock;
+	}
+
+	plane_vaddr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
+	if (!plane_vaddr) {
+		dev_info(fd->dev, "Failed to get plane virtual address\n");
+		ret = 0;
+		goto err_unlock;
+	}
+
+#ifdef CONFIG_DEBUG_FS
+	fd->tr_info.srcdata_buf = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
+	fd->tr_info.srcdata_size = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
+	fd->tr_info.dstdata_buf = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
+	fd->tr_info.dstdata_size = vb2_get_plane_payload(&dst_buf->vb2_buf, 0);
+#endif
+
+	v4l2_ctrl_request_setup(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
+
+	fd->aie_cfg = (struct aie_enq_info *)plane_vaddr;
+
+	memset(fd->aie_cfg, 0, sizeof(struct aie_enq_info));
+
+	memcpy(fd->aie_cfg, &ctx->user_param, sizeof(struct v4l2_ctrl_aie_param));
+
+	if (fd->variant->fld_enable) {
+		fd->aie_cfg->fld_face_num = ctx->user_param.fld_face_num;
+		memcpy(fd->aie_cfg->fld_input,
+		       ctx->user_param.fld_input,
+		       FLD_MAX_FRAME * sizeof(struct fld_crop_rip_rop)
+		);
+	}
+
+	src_img[0].dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+
+	if (ctx->src_fmt.num_planes == 2) {
+		src_img[1].dma_addr =
+			vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 1);
+	}
+
+	if ((fd->aie_cfg->sel_mode == FDMODE || fd->aie_cfg->sel_mode == ATTRIBUTEMODE) &&
+	    fd->aie_cfg->src_img_fmt == FMT_YUV420_1P) {
+		src_img[1].dma_addr =
+			src_img[0].dma_addr +
+			ctx->user_param.src_img_stride *
+			ctx->user_param.src_img_height;
+	}
+
+	fd->aie_cfg->src_img_addr = src_img[0].dma_addr;
+	fd->aie_cfg->src_img_addr_uv = src_img[1].dma_addr;
+
+	aie_prepare(fd, fd->aie_cfg);
+
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+	mtk_aie_mmdvfs_set(fd, 1, fd->aie_cfg->freq_level);
+#endif
+
+err_unlock:
+	mutex_unlock(&fd->fd_lock);
+
+	if (src_buf) {
+		/* Complete request controls if any */
+		v4l2_ctrl_request_complete(src_buf->vb2_buf.req_obj.req, &ctx->hdl);
+	}
+
+	return ret;
+}
+
+static void mtk_aie_device_run(void *priv)
+{
+	struct mtk_aie_ctx *ctx = priv;
+	struct mtk_aie_dev *fd = ctx->fd_dev;
+	int ret = 0;
+
+	ret = mtk_aie_job_ready(priv);
+	if (ret != 1) {
+		dev_err(fd->dev, "Failed to run job ready\n");
+		return;
+	}
+
+	atomic_inc(&fd->num_composing);
+	mtk_aie_hw_job_exec(fd);
+	aie_execute(fd, fd->aie_cfg);
+}
+
+static struct v4l2_m2m_ops fd_m2m_ops = {
+	.device_run = mtk_aie_device_run,
+};
+
+static const struct media_device_ops fd_m2m_media_ops = {
+	.req_validate = vb2_request_validate,
+	.req_queue = v4l2_m2m_request_queue,
+};
+
+static int mtk_aie_video_device_register(struct mtk_aie_dev *fd)
+{
+	struct video_device *vfd = &fd->vfd;
+	struct v4l2_m2m_dev *m2m_dev = fd->m2m_dev;
+	struct device *dev = fd->dev;
+	int ret = -EINVAL;
+
+	vfd->fops = &fd_video_fops;
+	vfd->release = video_device_release_empty;
+	vfd->lock = &fd->vfd_lock;
+	vfd->v4l2_dev = &fd->v4l2_dev;
+	vfd->vfl_dir = VFL_DIR_M2M;
+	vfd->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_OUTPUT_MPLANE |
+			   V4L2_CAP_META_CAPTURE;
+	vfd->ioctl_ops = &mtk_aie_v4l2_video_out_ioctl_ops;
+
+	strscpy(vfd->name, dev_driver_string(dev), sizeof(vfd->name));
+
+	video_set_drvdata(vfd, fd);
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
+	if (ret) {
+		dev_err(dev, "Failed to register video device\n");
+		goto err_free_dev;
+	}
+#ifdef CONFIG_MEDIA_CONTROLLER
+	ret = v4l2_m2m_register_media_controller(m2m_dev, vfd, MEDIA_ENT_F_PROC_VIDEO_STATISTICS);
+	if (ret) {
+		dev_err(dev, "Failed to init mem2mem media controller\n");
+		goto err_unreg_video;
+	}
+#endif
+	return 0;
+#ifdef CONFIG_MEDIA_CONTROLLER
+err_unreg_video:
+	video_unregister_device(vfd);
+#endif
+err_free_dev:
+	return ret;
+}
+
+static int mtk_aie_dev_v4l2_init(struct mtk_aie_dev *fd)
+{
+#ifdef CONFIG_MEDIA_CONTROLLER
+	struct media_device *mdev = &fd->mdev;
+#endif
+	struct device *dev = fd->dev;
+	int ret = -EINVAL;
+
+	ret = v4l2_device_register(dev, &fd->v4l2_dev);
+	if (ret) {
+		dev_err(dev, "Failed to register v4l2 device\n");
+		return ret;
+	}
+
+	fd->m2m_dev = v4l2_m2m_init(&fd_m2m_ops);
+	if (IS_ERR(fd->m2m_dev)) {
+		dev_err(dev, "Failed to init mem2mem device\n");
+		ret = PTR_ERR(fd->m2m_dev);
+		goto err_unreg_v4l2_dev;
+	}
+#ifdef CONFIG_MEDIA_CONTROLLER
+	mdev->dev = dev;
+	strscpy(mdev->model, dev_driver_string(dev), sizeof(mdev->model));
+	media_device_init(mdev);
+	mdev->ops = &fd_m2m_media_ops;
+	fd->v4l2_dev.mdev = mdev;
+#endif
+
+	ret = mtk_aie_video_device_register(fd);
+	if (ret)
+		goto err_cleanup_mdev;
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+	ret = media_device_register(mdev);
+	if (ret) {
+		dev_err(dev, "Failed to register mem2mem media device\n");
+		goto err_unreg_vdev;
+	}
+#endif
+	return 0;
+
+#ifdef CONFIG_MEDIA_CONTROLLER
+err_unreg_vdev:
+	v4l2_m2m_unregister_media_controller(fd->m2m_dev);
+	video_unregister_device(&fd->vfd);
+#endif
+err_cleanup_mdev:
+#ifdef CONFIG_MEDIA_CONTROLLER
+	media_device_cleanup(mdev);
+#endif
+	v4l2_m2m_release(fd->m2m_dev);
+err_unreg_v4l2_dev:
+	v4l2_device_unregister(&fd->v4l2_dev);
+	return ret;
+}
+
+static void mtk_aie_video_device_unregister(struct mtk_aie_dev *fd)
+{
+#ifdef CONFIG_MEDIA_CONTROLLER
+	v4l2_m2m_unregister_media_controller(fd->m2m_dev);
+#endif
+	video_unregister_device(&fd->vfd);
+#ifdef CONFIG_MEDIA_CONTROLLER
+	media_device_cleanup(&fd->mdev);
+#endif
+	v4l2_m2m_release(fd->m2m_dev);
+	v4l2_device_unregister(&fd->v4l2_dev);
+}
+
+static void mtk_aie_frame_done_worker(struct work_struct *work)
+{
+	struct mtk_aie_req_work *req_work = (struct mtk_aie_req_work *)work;
+	struct mtk_aie_dev *fd = (struct mtk_aie_dev *)req_work->fd_dev;
+
+	if (fd->reg_cfg.fd_mode == FDMODE) {
+		fd->reg_cfg.hw_result = readl(fd->fd_base + AIE_RESULT_0_REG);
+		fd->reg_cfg.hw_result1 = readl(fd->fd_base + AIE_RESULT_1_REG);
+	}
+
+	mutex_lock(&fd->fd_lock);
+
+	switch (fd->aie_cfg->sel_mode) {
+	case FDMODE:
+		aie_get_fd_result(fd, fd->aie_cfg);
+		break;
+	case ATTRIBUTEMODE:
+		aie_get_attr_result(fd, fd->aie_cfg);
+		break;
+	case FLDMODE:
+		if (fd->variant->fld_enable)
+			aie_get_fld_result(fd, fd->aie_cfg);
+		break;
+	default:
+		dev_dbg(fd->dev, "Wrong sel_mode\n");
+		break;
+	}
+
+	mutex_unlock(&fd->fd_lock);
+
+#ifdef CONFIG_DEBUG_FS
+	if (fd->tr_info.trigger_dump[0] != '0') {
+		cancel_delayed_work(&fd->job_timeout_work);
+		aie_irqhandle(fd);
+		aie_reset(fd);
+		atomic_dec(&fd->num_composing);
+		mtk_aie_hw_job_finish(fd, VB2_BUF_STATE_ERROR);
+		wake_up(&fd->flushing_waitq);
+		aie_dumpinfo(fd);
+		fd->tr_info.trigger_dump[0] = '0';
+		return;
+	}
+#endif
+	if (!cancel_delayed_work(&fd->job_timeout_work))
+		return;
+
+	atomic_dec(&fd->num_composing);
+	mtk_aie_hw_job_finish(fd, VB2_BUF_STATE_DONE);
+	wake_up(&fd->flushing_waitq);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int aie_dbg_dump_open(struct inode *inode, struct file *file)
+{
+	file->private_data = inode->i_private;
+	return 0;
+}
+
+static ssize_t aie_dbg_dump_read(struct file *file, char __user *buf,
+				 size_t len, loff_t *ppos)
+{
+	struct mtk_aie_dev *fd = file->private_data;
+	ssize_t ret_size = 0;
+
+	ret_size = simple_read_from_buffer(buf, len, ppos,
+					   fd->tr_info.dump_buffer,
+					   fd->tr_info.dump_offset);
+
+	return ret_size;
+}
+
+static const struct file_operations aie_debug_dump_fops = {
+	.owner = THIS_MODULE,
+	.open = aie_dbg_dump_open,
+	.read = aie_dbg_dump_read,
+};
+
+static int aie_dbg_trigger_open(struct inode *inode, struct file *file)
+{
+	file->private_data = inode->i_private;
+	return 0;
+}
+
+static ssize_t aie_dbg_trigger_write(struct file *file, const char __user *buf,
+				     size_t len, loff_t *ppos)
+{
+	struct mtk_aie_dev *fd = file->private_data;
+	size_t ret = -EINVAL;
+
+	if (*ppos > sizeof(fd->tr_info.trigger_dump))
+		return -EINVAL;
+
+	ret = simple_write_to_buffer(fd->tr_info.trigger_dump,
+				     sizeof(fd->tr_info.trigger_dump), ppos,
+				     buf, len);
+
+	return ret;
+}
+
+static ssize_t aie_dbg_trigger_read(struct file *file, char __user *buf,
+				    size_t len, loff_t *ppos)
+{
+	struct mtk_aie_dev *fd = file->private_data;
+
+	return simple_read_from_buffer(buf, len, ppos,
+				       fd->tr_info.trigger_dump,
+				       sizeof(fd->tr_info.trigger_dump));
+}
+
+static const struct file_operations aie_debug_trigger_fops = {
+	.owner = THIS_MODULE,
+	.open = aie_dbg_trigger_open,
+	.write = aie_dbg_trigger_write,
+	.read = aie_dbg_trigger_read,
+};
+
+static struct dentry *aie_debugfs_dump, *aie_debugfs_trigger,
+	*aie_debugfs_srcdata, *aie_debugfs_dstdata, *aie_debugfs_root;
+#endif
+
+#ifdef CONFIG_DEBUG_FS
+static int mtk_aie_debugfs_init(struct mtk_aie_dev *fd)
+{
+	aie_debugfs_root = debugfs_create_dir("mtk_aie", NULL);
+	if (!aie_debugfs_root)
+		return -ENOMEM;
+
+	aie_debugfs_dump = debugfs_create_file("dumpinfo",
+					       0444,
+					       aie_debugfs_root,
+					       fd,
+					       &aie_debug_dump_fops
+				);
+	if (!aie_debugfs_dump)
+		return -ENOMEM;
+
+	aie_debugfs_trigger = debugfs_create_file("trigger_dump",
+						  0444,
+						  aie_debugfs_root,
+						  fd,
+						  &aie_debug_trigger_fops
+				);
+	if (!aie_debugfs_trigger)
+		return -ENOMEM;
+
+	srcdata.data = (void *)srcrawdata;
+	srcdata.size = AIE_DEBUG_RAW_DATA_SIZE;
+
+	aie_debugfs_srcdata = debugfs_create_blob("srcdata.raw",
+						  0444,
+						  aie_debugfs_root,
+						  &srcdata
+				);
+	if (!aie_debugfs_srcdata)
+		return -ENOMEM;
+
+	dstdata.data = (void *)dstrawdata;
+	dstdata.size = AIE_DEBUG_RAW_DATA_SIZE;
+
+	aie_debugfs_dstdata = debugfs_create_blob("dstdata.raw",
+						  0444,
+						  aie_debugfs_root,
+						  &dstdata
+				);
+	if (!aie_debugfs_dstdata)
+		return -ENOMEM;
+
+	fd->tr_info.dump_size = AIE_DUMP_BUFFER_SIZE;
+	fd->tr_info.dump_buffer =
+		kmalloc(fd->tr_info.dump_size, GFP_KERNEL);
+	if (!fd->tr_info.dump_buffer)
+		return -ENOMEM;
+
+	fd->tr_info.trigger_dump[0] = '0';
+	fd->tr_info.trigger_dump[1] = '\n';
+	fd->tr_info.trigger_dump[2] = '\0';
+
+	return 0;
+}
+
+static void mtk_aie_debugfs_free(struct platform_device *pdev)
+{
+	struct mtk_aie_dev *fd = dev_get_drvdata(&pdev->dev);
+
+	kfree(fd->tr_info.dump_buffer);
+	fd->tr_info.dump_buffer = NULL;
+
+	debugfs_remove_recursive(aie_debugfs_root);
+	aie_debugfs_root = NULL;
+}
+#else
+static int mtk_aie_debugfs_init(struct mtk_aie_dev *fd)
+{
+	return 0;
+}
+
+static void mtk_aie_debugfs_free(struct platform_device *pdev)
+{
+}
+#endif
+
+static int mtk_aie_resource_init(struct mtk_aie_dev *fd)
+{
+	int ret = 0;
+
+	mutex_init(&fd->vfd_lock);
+	mutex_init(&fd->dev_lock);
+	mutex_init(&fd->fd_lock);
+
+	init_completion(&fd->fd_job_finished);
+	complete_all(&fd->fd_job_finished);
+	INIT_DELAYED_WORK(&fd->job_timeout_work, mtk_aie_job_timeout_work);
+	init_waitqueue_head(&fd->flushing_waitq);
+	atomic_set(&fd->num_composing, 0);
+	fd->fd_stream_count = 0;
+
+	fd->frame_done_wq = alloc_ordered_workqueue(dev_name(fd->dev),
+						    WQ_HIGHPRI | WQ_FREEZABLE
+				);
+	if (!fd->frame_done_wq) {
+		dev_err(fd->dev, "failed to alloc frame_done workqueue\n");
+		mutex_destroy(&fd->vfd_lock);
+		mutex_destroy(&fd->dev_lock);
+		mutex_destroy(&fd->fd_lock);
+		return -ENOMEM;
+	}
+
+	INIT_WORK(&fd->req_work.work, mtk_aie_frame_done_worker);
+	fd->req_work.fd_dev = fd;
+
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+	ret = mtk_aie_mmdvfs_init(fd);
+	if (ret)
+		return ret;
+	ret = mtk_aie_mmqos_init(fd);
+	if (ret)
+		return ret;
+	}
+#endif
+	return ret;
+}
+
+static void mtk_aie_resource_free(struct platform_device *pdev)
+{
+	struct mtk_aie_dev *fd = dev_get_drvdata(&pdev->dev);
+
+#ifdef CONFIG_INTERCONNECT_MTK_EXTENSION
+	mtk_aie_mmdvfs_uninit(fd);
+	mtk_aie_mmqos_uninit(fd);
+#endif
+	if (fd->frame_done_wq)
+		destroy_workqueue(fd->frame_done_wq);
+	fd->frame_done_wq = NULL;
+	mutex_destroy(&fd->vfd_lock);
+	mutex_destroy(&fd->dev_lock);
+	mutex_destroy(&fd->fd_lock);
+}
+
+static irqreturn_t mtk_aie_irq(int irq, void *data)
+{
+	struct mtk_aie_dev *fd = (struct mtk_aie_dev *)data;
+
+	aie_irqhandle(fd);
+
+	queue_work(fd->frame_done_wq, &fd->req_work.work);
+
+	return IRQ_HANDLED;
+}
+
+static int mtk_aie_probe(struct platform_device *pdev)
+{
+	struct mtk_aie_dev *fd = NULL;
+	struct device *dev = &pdev->dev;
+
+	int irq = -1;
+	int ret = -EINVAL;
+
+	fd = devm_kzalloc(&pdev->dev, sizeof(struct mtk_aie_dev), GFP_KERNEL);
+	if (!fd)
+		return -ENOMEM;
+
+	fd->variant = mtk_aie_get_variant(dev);
+	if (!fd->variant)
+		return -ENODEV;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
+	if (ret) {
+		dev_err(dev, "%s: No suitable DMA available\n", __func__);
+		return ret;
+	}
+
+	dev_set_drvdata(dev, fd);
+	fd->dev = dev;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		dev_err(dev, "Failed to get irq by platform: %d\n", irq);
+		return irq;
+	}
+
+	ret = devm_request_irq(dev,
+			       irq,
+			       mtk_aie_irq,
+			       IRQF_SHARED,
+			       dev_driver_string(dev),
+			       fd
+		);
+	if (ret) {
+		dev_err(dev, "Failed to request irq\n");
+		return ret;
+	}
+	fd->irq = irq;
+
+	fd->fd_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(fd->fd_base)) {
+		dev_err(dev, "Failed to get fd reg base\n");
+		return PTR_ERR(fd->fd_base);
+	}
+
+	fd->aie_clk.clk_num = ARRAY_SIZE(aie_clks);
+	fd->aie_clk.clks = aie_clks;
+	ret = devm_clk_bulk_get(&pdev->dev, fd->aie_clk.clk_num, fd->aie_clk.clks);
+	if (ret) {
+		dev_err(dev, "failed to get raw clock:%d\n", ret);
+		return ret;
+	}
+
+	ret = mtk_aie_debugfs_init(fd);
+	if (ret)
+		goto err_free;
+
+	ret = mtk_aie_resource_init(fd);
+	if (ret)
+		goto err_free;
+	pm_runtime_enable(dev);
+	ret = mtk_aie_dev_v4l2_init(fd);
+	if (ret)
+		goto err_free;
+	dev_info(dev, "AIE : Success to %s\n", __func__);
+
+	return 0;
+
+err_free:
+	pm_runtime_disable(&pdev->dev);
+	mtk_aie_resource_free(pdev);
+
+	return ret;
+}
+
+static void mtk_aie_remove(struct platform_device *pdev)
+{
+	struct mtk_aie_dev *fd = dev_get_drvdata(&pdev->dev);
+
+	mtk_aie_video_device_unregister(fd);
+	pm_runtime_disable(&pdev->dev);
+	mtk_aie_debugfs_free(pdev);
+	mtk_aie_resource_free(pdev);
+
+#ifdef CONFIG_DEBUG_FS
+	kfree(fd->tr_info.dump_buffer);
+#endif
+}
+
+static int mtk_aie_suspend(struct device *dev)
+{
+	struct mtk_aie_dev *fd = dev_get_drvdata(dev);
+	int ret = -EINVAL, num = 0;
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	num = atomic_read(&fd->num_composing);
+	dev_info(dev, "%s: suspend aie job start, num(%d)\n", __func__, num);
+
+	ret = wait_event_timeout(fd->flushing_waitq,
+				 !(num = atomic_read(&fd->num_composing)),
+				 msecs_to_jiffies(MTK_FD_HW_TIMEOUT_IN_MSEC)
+		);
+	if (!ret && num) {
+		dev_dbg(dev,
+			"%s: flushing aie job timeout num %d\n",
+			__func__,
+			num
+		);
+
+		return -EBUSY;
+	}
+
+	dev_info(dev, "%s: suspend aie job end num(%d)\n", __func__, num);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int mtk_aie_resume(struct device *dev)
+{
+	int ret = -EINVAL;
+
+	dev_info(dev, "%s: resume aie job start)\n", __func__);
+
+	if (pm_runtime_suspended(dev)) {
+		dev_info(dev,
+			 "%s: pm_runtime_suspended is true, no action\n",
+			 __func__
+		);
+		return 0;
+	}
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "%s: resume aie job end)\n", __func__);
+	return 0;
+}
+
+static int mtk_aie_runtime_suspend(struct device *dev)
+{
+	struct mtk_aie_dev *fd = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(fd->aie_clk.clk_num, fd->aie_clk.clks);
+
+	return 0;
+}
+
+static int mtk_aie_runtime_resume(struct device *dev)
+{
+	struct mtk_aie_dev *fd = dev_get_drvdata(dev);
+	int ret = -EINVAL;
+
+	ret = clk_bulk_prepare_enable(fd->aie_clk.clk_num, fd->aie_clk.clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clock:%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtk_aie_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_aie_suspend, mtk_aie_resume)
+	SET_RUNTIME_PM_OPS(mtk_aie_runtime_suspend, mtk_aie_runtime_resume, NULL)
+};
+
+static const struct mtk_aie_variant aie_30_drvdata = {
+	.hw_version = 30,
+	.fld_enable = 0,
+	.y2r_cfg_size = 32,
+	.rs_cfg_size = 28,
+	.fd_cfg_size = 54,
+};
+
+static const struct mtk_aie_variant aie_31_drvdata = {
+	.hw_version = 31,
+	.fld_enable = 1,
+	.y2r_cfg_size = 34,
+	.rs_cfg_size = 30,
+	.fd_cfg_size = 56,
+};
+
+static const struct of_device_id mtk_aie_of_ids[] = {
+	{
+		.compatible = "mediatek,aie-hw3.0",
+		.data = &aie_30_drvdata,
+	},
+	{
+		.compatible = "mediatek,aie-hw3.1",
+		.data = &aie_31_drvdata,
+	},
+	{ /* end of list */ },
+};
+MODULE_DEVICE_TABLE(of, mtk_aie_of_ids);
+
+static const struct mtk_aie_variant *mtk_aie_get_variant(struct device *dev)
+{
+	const struct mtk_aie_variant *driver_data = NULL;
+	const struct of_device_id *match = NULL;
+
+	match = of_match_node(mtk_aie_of_ids, dev->of_node);
+
+	if (match)
+		driver_data = (const struct mtk_aie_variant *)match->data;
+	else
+		return &aie_30_drvdata;
+
+	return driver_data;
+}
+
+static struct platform_driver mtk_aie_driver = {
+	.probe = mtk_aie_probe,
+	.remove = mtk_aie_remove,
+	.driver = {
+			.name = "mtk-aie-5.3",
+			.of_match_table = of_match_ptr(mtk_aie_of_ids),
+			.pm = pm_ptr(&mtk_aie_pm_ops),
+	}
+};
+
+module_platform_driver(mtk_aie_driver);
+MODULE_AUTHOR("Fish Wu <fish.wu@mediatek.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek AIE driver");
diff --git a/drivers/media/platform/mediatek/aie/mtk_aie_drv.c b/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
new file mode 100644
index 000000000000..2d1fc5760f8d
--- /dev/null
+++ b/drivers/media/platform/mediatek/aie/mtk_aie_drv.c
@@ -0,0 +1,3613 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Fish Wu <fish.wu@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/mtk_aie_v4l2_controls.h>
+
+#include "mtk_aie.h"
+
+static const unsigned int fd_wdma_en[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
+	{ 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 0, 1, 0 }, { 1, 0, 0, 0 },
+	{ 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 },
+	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 0, 1, 0 },
+	{ 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 0, 0, 0 },
+	{ 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 },
+	{ 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 1, 0 },
+	{ 1, 0, 1, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 },
+	{ 1, 0, 0, 0 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }
+};
+
+static const unsigned int out_stride_size[FD_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
+	{ 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 0, 2, 0 }, { 1, 0, 0, 0 },
+	{ 1, 1, 2, 2 }, { 1, 1, 2, 2 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 1, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 }, { 1, 1, 1, 1 },
+	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
+	{ 3, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 0, 2, 0 },
+	{ 1, 0, 0, 0 }, { 1, 1, 2, 2 }, { 1, 1, 2, 2 }, { 1, 0, 0, 0 },
+	{ 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 },
+	{ 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 0, 0, 0 }, { 3, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 2, 0 },
+	{ 1, 0, 2, 0 }, { 1, 0, 0, 0 }, { 1, 1, 2, 2 }, { 1, 1, 2, 2 },
+	{ 1, 0, 0, 0 }, { 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 2, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 1, 1, 1 }, { 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 3, 0, 0, 0 }
+};
+
+static const unsigned int fd_ker_rdma_size[FD_LOOP_NUM][KERNEL_RDMA_RA_NUM] = {
+	{ 240, 240 },	{ 1168, 1168 }, { 1168, 1168 }, { 272, 272 },
+	{ 2320, 2320 }, { 2080, 2080 }, { 1040, 1040 }, { 4624, 4624 },
+	{ 3104, 3104 }, { 9232, 9232 }, { 4624, 4624 }, { 4128, 4128 },
+	{ 1040, 1040 }, { 4624, 4624 }, { 4624, 4624 }, { 1552, 1552 },
+	{ 4624, 4624 }, { 4624, 4624 }, { 4128, 4128 }, { 1040, 1040 },
+	{ 1040, 1040 }, { 528, 528 },	{ 4160, 4160 }, { 4160, 4160 },
+	{ 2080, 2080 }, { 2080, 2080 }, { 2080, 2080 }, { 1040, 1040 },
+	{ 0, 0 },	{ 240, 240 },	{ 1168, 1168 }, { 1168, 1168 },
+	{ 272, 272 },	{ 2320, 2320 }, { 2080, 2080 }, { 1040, 1040 },
+	{ 4624, 4624 }, { 3104, 3104 }, { 9232, 9232 }, { 4624, 4624 },
+	{ 4128, 4128 }, { 1040, 1040 }, { 4624, 4624 }, { 4624, 4624 },
+	{ 1552, 1552 }, { 4624, 4624 }, { 4624, 4624 }, { 4128, 4128 },
+	{ 1040, 1040 }, { 1040, 1040 }, { 528, 528 },	{ 4160, 4160 },
+	{ 4160, 4160 }, { 2080, 2080 }, { 2080, 2080 }, { 2080, 2080 },
+	{ 1040, 1040 }, { 0, 0 },	{ 240, 240 },	{ 1168, 1168 },
+	{ 1168, 1168 }, { 272, 272 },	{ 2320, 2320 }, { 2080, 2080 },
+	{ 1040, 1040 }, { 4624, 4624 }, { 3104, 3104 }, { 9232, 9232 },
+	{ 4624, 4624 }, { 4128, 4128 }, { 1040, 1040 }, { 4624, 4624 },
+	{ 4624, 4624 }, { 1552, 1552 }, { 4624, 4624 }, { 4624, 4624 },
+	{ 4128, 4128 }, { 1040, 1040 }, { 1040, 1040 }, { 528, 528 },
+	{ 4160, 4160 }, { 4160, 4160 }, { 2080, 2080 }, { 2080, 2080 },
+	{ 2080, 2080 }, { 1040, 1040 }, { 0, 0 }
+};
+
+static const unsigned int fd_out_stride2_in[FD_LOOP_NUM] = {
+	0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
+	0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+};
+
+static const unsigned int fd_stride[FD_LOOP_NUM] = {
+	2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+	1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1,
+	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
+};
+
+static const unsigned int fd_maxpool[FD_LOOP_NUM] = {
+	0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+};
+
+static const unsigned int out_2size[FD_LOOP_NUM] = {
+	0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1,
+	0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+};
+
+static const unsigned int in_ch_pack[FD_LOOP_NUM] = {
+	1,  16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
+	32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0,  1,	16, 16, 16, 16, 16, 32,
+	32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
+	32, 32, 32, 0,	1,  16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32,
+	32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 0
+};
+
+static const unsigned int outlayer[FD_LOOP_NUM] = {
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
+	1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
+};
+
+static const unsigned int out_ch_pack[FD_LOOP_NUM] = {
+	16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,
+	32, 16, 16, 16, 32, 32, 32, 32, 32, 32, 0,  16, 16, 16, 16, 16, 32, 32,
+	32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 16, 16, 16, 32, 32, 32,
+	32, 32, 32, 0,	16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32,
+	32, 32, 32, 32, 32, 16, 16, 16, 32, 32, 32, 32, 32, 32, 0
+};
+
+static const unsigned int anchor_en_num[FD_LOOP_NUM] = {
+	5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
+	5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
+	5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
+	5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
+};
+
+/* [loop][ch][output_index] */
+static const signed int fd_rdma_en[FD_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] = {
+	{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
+	{ { 0, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 1, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 1, 0 }, { 2, 0 }, { -1, -1 }, { -1, -1 } },
+	{ { 3, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 1, 2 }, { 2, 2 }, { 4, 2 }, { 4, 3 } },
+	{ { 5, 0 }, { 5, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 6, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 5, 0 }, { 5, 1 }, { 7, 0 }, { -1, -1 } },
+	{ { 8, 0 }, { 8, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 9, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 5, 2 }, { 5, 3 }, { 7, 2 }, { 10, 2 } },
+	{ { 11, 0 }, { 11, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 12, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 13, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 11, 0 }, { 11, 1 }, { 14, 0 }, { -1, -1 } },
+	{ { 15, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 16, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 11, 0 }, { 11, 1 }, { 14, 0 }, { 17, 0 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { 18, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 19, 0 }, { 22, 0 }, { 22, 1 }, { 25, 0 } },
+	{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
+	{ { 29, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 30, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 30, 0 }, { 31, 0 }, { -1, -1 }, { -1, -1 } },
+	{ { 32, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 30, 2 }, { 31, 2 }, { 33, 2 }, { 33, 3 } },
+	{ { 34, 0 }, { 34, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 35, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 34, 0 }, { 34, 1 }, { 36, 0 }, { -1, -1 } },
+	{ { 37, 0 }, { 37, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 38, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 34, 2 }, { 34, 3 }, { 36, 2 }, { 39, 2 } },
+	{ { 40, 0 }, { 40, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 41, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 42, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 40, 0 }, { 40, 1 }, { 43, 0 }, { -1, -1 } },
+	{ { 44, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 45, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 40, 0 }, { 40, 1 }, { 43, 0 }, { 46, 0 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 47, 0 }, { 47, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 48, 0 }, { 51, 0 }, { 51, 1 }, { 54, 0 } },
+	{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
+	{ { 58, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 59, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 59, 0 }, { 60, 0 }, { -1, -1 }, { -1, -1 } },
+	{ { 61, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 59, 2 }, { 60, 2 }, { 62, 2 }, { 62, 3 } },
+	{ { 63, 0 }, { 63, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 64, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 63, 0 }, { 63, 1 }, { 65, 0 }, { -1, -1 } },
+	{ { 66, 0 }, { 66, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 67, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 63, 2 }, { 63, 3 }, { 65, 2 }, { 68, 2 } },
+	{ { 69, 0 }, { 69, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 70, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 71, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 69, 0 }, { 69, 1 }, { 72, 0 }, { -1, -1 } },
+	{ { 73, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 74, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 69, 0 }, { 69, 1 }, { 72, 0 }, { 75, 0 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 76, 0 }, { 76, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 77, 0 }, { 80, 0 }, { 80, 1 }, { 83, 0 } }
+};
+
+static const unsigned int attr_wdma_en[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
+	{ 1, 0, 1, 0 }, { 1, 0, 1, 0 }, { 1, 0, 0, 0 }, { 1, 1, 1, 1 },
+	{ 1, 1, 1, 1 }, { 1, 0, 1, 0 }, { 1, 1, 0, 0 }, { 1, 0, 1, 0 },
+	{ 1, 1, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 1, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 }, { 1, 0, 0, 0 },
+	{ 1, 0, 0, 0 }, { 1, 0, 0, 0 }
+};
+
+static const unsigned int
+	attr_ker_rdma_size[ATTR_LOOP_NUM][KERNEL_RDMA_RA_NUM] = {
+		{ 240, 240 },	{ 1168, 1168 }, { 272, 272 },	{ 2320, 2320 },
+		{ 2080, 2080 }, { 9232, 9232 }, { 3104, 3104 }, { 9232, 9232 },
+		{ 4128, 4128 }, { 1040, 1040 }, { 4624, 4624 }, { 4624, 4624 },
+		{ 1552, 1552 }, { 4624, 4624 }, { 4624, 4624 }, { 4128, 4128 },
+		{ 9232, 9232 }, { 272, 272 },	{ 9232, 9232 }, { 2320, 2320 },
+		{ 144, 144 },	{ 9232, 9232 }, { 272, 272 },	{ 9232, 9232 },
+		{ 2320, 2320 }, { 144, 144 }
+	};
+
+static const unsigned int attr_out_stride2_as_in[ATTR_LOOP_NUM] = {
+	0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
+};
+
+static const unsigned int attr_fd_stride[ATTR_LOOP_NUM] = { /* H */
+							    2, 1, 1, 1, 1, 1, 1,
+							    1, 1, 1, 1, 1, 1, 1,
+							    1, 1, 1, 1, 1, 1, 1,
+							    1, 1, 1, 1, 1
+};
+
+static const unsigned int attr_fd_maxpool[ATTR_LOOP_NUM] = { /* L */
+							     1, 0, 0, 0, 0, 0,
+							     0, 0, 0, 0, 0, 0,
+							     0, 0, 0, 0, 0, 0,
+							     0, 0, 0, 0, 0, 0,
+							     0, 0
+};
+
+static const unsigned int attr_out_2size[ATTR_LOOP_NUM] = { /* O */
+							    1, 1, 0, 1, 1, 1, 0,
+							    1, 0, 0, 0, 0, 0, 0,
+							    0, 0, 0, 0, 0, 0, 0,
+							    0, 0, 0, 0, 0
+};
+
+/* [loop][ch][output_index] */
+static const signed int attr_rdma_en[ATTR_LOOP_NUM][INPUT_WDMA_WRA_NUM][2] = {
+	{ { 99, 99 }, { 99, 99 }, { 99, 99 }, { -1, -1 } },
+	{ { 0, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 0, 0 }, { 1, 0 }, { -1, -1 }, { -1, -1 } },
+	{ { 2, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 0, 2 }, { 1, 2 }, { 3, 2 }, { 3, 3 } },
+	{ { 4, 0 }, { 4, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 4, 0 }, { 4, 1 }, { 5, 0 }, { -1, -1 } },
+	{ { 6, 0 }, { 6, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 4, 2 }, { 4, 3 }, { 5, 2 }, { 7, 2 } },
+	{ { 8, 0 }, { 8, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 9, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 10, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 8, 0 }, { 8, 1 }, { 11, 0 }, { -1, -1 } },
+	{ { 12, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 13, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 8, 0 }, { 8, 1 }, { 11, 0 }, { 14, 0 } },
+	{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 16, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 18, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 19, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 21, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 15, 0 }, { 15, 1 }, { -1, -1 }, { -1, -1 } },
+	{ { 23, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } },
+	{ { 24, 0 }, { -1, -1 }, { -1, -1 }, { -1, -1 } }
+};
+
+static const unsigned int attr_wdma_size[ATTR_LOOP_NUM][OUTPUT_WDMA_WRA_NUM] = {
+	{ 16384, 0, 4096, 0 },
+	{ 16384, 0, 4096, 0 },
+	{ 16384, 0, 0, 0 },
+	{ 16384, 16384, 4096, 4096 },
+	{ 8192, 8192, 2048, 2048 },
+	{ 8192, 0, 2048, 0 },
+	{ 8192, 8192, 0, 0 },
+	{ 8192, 0, 2048, 0 },
+	{ 2048, 2048, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 2048, 2048, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 0, 0, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 1024, 0, 0, 0 },
+	{ 0, 0, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 0, 0, 0, 0 },
+	{ 2048, 0, 0, 0 },
+	{ 1024, 0, 0, 0 },
+	{ 0, 0, 0, 0 }
+};
+
+static const unsigned int fld_step_align_size[FLD_STEP_NUM][FLD_MAX_FRAME] = {
+	{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6528 },
+	{ 1536, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,
+	  1280, 1280, 1280, 1280 },
+	{ 5376, 5376, 5376, 5376, 5376, 5376, 5376, 5376, 5376, 5376, 5376,
+	  5376, 5376, 5376, 5376 },
+	{ 307200, 307200, 307200, 307200, 307200, 307200, 307200, 307200,
+	  307200, 307200, 307200, 307200, 307200, 307200, 307200 },
+	{ 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064,
+	  8064, 8064, 8064, 8064 },
+	{ 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064, 8064,
+	  8064, 8064, 8064, 8064 }
+};
+
+static const unsigned int fld_face_info_0[FLD_MAX_FRAME] = {
+	FLD_INFO_0_FACE_0,  FLD_INFO_0_FACE_1,	FLD_INFO_0_FACE_2,
+	FLD_INFO_0_FACE_3,  FLD_INFO_0_FACE_4,	FLD_INFO_0_FACE_5,
+	FLD_INFO_0_FACE_6,  FLD_INFO_0_FACE_7,	FLD_INFO_0_FACE_8,
+	FLD_INFO_0_FACE_9,  FLD_INFO_0_FACE_10, FLD_INFO_0_FACE_11,
+	FLD_INFO_0_FACE_12, FLD_INFO_0_FACE_13, FLD_INFO_0_FACE_14
+};
+
+static const unsigned int fld_face_info_1[FLD_MAX_FRAME] = {
+	FLD_INFO_1_FACE_0,  FLD_INFO_1_FACE_1,	FLD_INFO_1_FACE_2,
+	FLD_INFO_1_FACE_3,  FLD_INFO_1_FACE_4,	FLD_INFO_1_FACE_5,
+	FLD_INFO_1_FACE_6,  FLD_INFO_1_FACE_7,	FLD_INFO_1_FACE_8,
+	FLD_INFO_1_FACE_9,  FLD_INFO_1_FACE_10, FLD_INFO_1_FACE_11,
+	FLD_INFO_1_FACE_12, FLD_INFO_1_FACE_13, FLD_INFO_1_FACE_14
+};
+
+static const unsigned int fld_face_info_2[FLD_MAX_FRAME] = {
+	FLD_INFO_2_FACE_0,  FLD_INFO_2_FACE_1,	FLD_INFO_2_FACE_2,
+	FLD_INFO_2_FACE_3,  FLD_INFO_2_FACE_4,	FLD_INFO_2_FACE_5,
+	FLD_INFO_2_FACE_6,  FLD_INFO_2_FACE_7,	FLD_INFO_2_FACE_8,
+	FLD_INFO_2_FACE_9,  FLD_INFO_2_FACE_10, FLD_INFO_2_FACE_11,
+	FLD_INFO_2_FACE_12, FLD_INFO_2_FACE_13, FLD_INFO_2_FACE_14
+};
+
+static u32 aie_cmb_u16(u16 low, u16 high)
+{
+	return ((u32)high << 16) | low;
+}
+
+static u32 aie_cmb_stride(u16 low, u16 high)
+{
+	return ((u32)high << 16) | (low & 0x000F);
+}
+
+static inline u16 dif_x(const struct aie_enq_info *aie_cfg)
+{
+	return (u16)(aie_cfg->src_roi.x2 - aie_cfg->src_roi.x1);
+}
+
+static inline u16 dif_y(const struct aie_enq_info *aie_cfg)
+{
+	return (u16)(aie_cfg->src_roi.y2 - aie_cfg->src_roi.y1);
+}
+
+static inline void set_cmb_cfg(u32 *tbl, u16 index, u16 stride)
+{
+	tbl[index] = aie_cmb_u16(tbl[index], stride);
+}
+
+static inline void set_cmbst_cfg(u32 *tbl, u16 index, u16 stride)
+{
+	tbl[index] = aie_cmb_stride(tbl[index], stride);
+}
+
+static int aie_imem_alloc(struct mtk_aie_dev *fd, u32 size,
+			  struct imem_buf_info *bufinfo)
+{
+	struct device *dev = fd->dev;
+	void *va = NULL;
+	dma_addr_t dma_handle = 0;
+
+	if (size == 0) {
+		dev_dbg(fd->dev, "%s: size(%d)\n", __func__, size);
+		return -EINVAL;
+	}
+
+	fd->fd_mem_size += size;
+
+	va = dma_alloc_coherent(dev, size, &dma_handle, GFP_KERNEL);
+	if (!va || dma_handle == 0)
+		return -ENOMEM;
+
+	bufinfo->va = va;
+	bufinfo->pa = dma_handle;
+	bufinfo->size = size;
+
+	dev_dbg(fd->dev,
+		"%s: vAddr(0x%p) pAddr(0x%pad) size(%d)\n",
+		__func__,
+		va,
+		&dma_handle,
+		size
+	);
+
+	return 0;
+}
+
+static void aie_imem_free(struct mtk_aie_dev *fd, struct imem_buf_info *bufinfo)
+{
+	dev_dbg(fd->dev,
+		"%s: vAddr(0x%p) pAddr(0x%pad) size(%d)\n",
+		__func__,
+		bufinfo->va,
+		&bufinfo->pa,
+		bufinfo->size
+	);
+
+	if (bufinfo->va)
+		dma_free_coherent(fd->dev,
+				  bufinfo->size,
+				  bufinfo->va,
+				  bufinfo->pa
+		);
+}
+
+static void aie_init_table(struct mtk_aie_dev *fd, u16 pym_width,
+			   u16 pym_height)
+{
+	int i = 0;
+	struct aie_static_info *pstv = &fd->st_info;
+
+	pstv->inf_elm[PYM2_START_LOOP].img_width = pym_width / 4;
+	pstv->inf_elm[PYM2_START_LOOP].img_height = pym_height / 4;
+
+	pstv->inf_elm[PYM1_START_LOOP].img_width = pym_width / 2;
+	pstv->inf_elm[PYM1_START_LOOP].img_height = pym_height / 2;
+
+	pstv->inf_elm[PYM0_START_LOOP].img_width = pym_width;
+	pstv->inf_elm[PYM0_START_LOOP].img_height = pym_height;
+
+	for (i = 0; i < FD_LOOP_NUM; i++) {
+		if (i != PYM2_START_LOOP && i != PYM1_START_LOOP && i != PYM0_START_LOOP) {
+			if (fd_out_stride2_in[i] == 1) {
+				pstv->inf_elm[i].img_width =
+					pstv->inf_elm[i - 1].stride2_out_width;
+				pstv->inf_elm[i].img_height =
+					pstv->inf_elm[i - 1].stride2_out_height;
+			} else {
+				pstv->inf_elm[i].img_width =
+					pstv->inf_elm[i - 1].out_width;
+				pstv->inf_elm[i].img_height =
+					pstv->inf_elm[i - 1].out_height;
+			}
+		}
+
+		if (fd_maxpool[i] == 1 && fd_stride[i] == 1) {
+			pstv->inf_elm[i].out_width =
+				(pstv->inf_elm[i].img_width - 1) / (2 * fd_maxpool[i]) + 1;
+			pstv->inf_elm[i].out_height =
+				(pstv->inf_elm[i].img_height - 1) / (2 * fd_maxpool[i]) + 1;
+		} else {
+			pstv->inf_elm[i].out_width =
+				(pstv->inf_elm[i].img_width - 1) /
+					(fd_stride[i] + 2 * fd_maxpool[i]) + 1;
+			pstv->inf_elm[i].out_height =
+				(pstv->inf_elm[i].img_height - 1) /
+					(fd_stride[i] + 2 * fd_maxpool[i]) + 1;
+		}
+
+		pstv->inf_elm[i].stride2_out_width =
+			((pstv->inf_elm[i].out_width - 1) / 2 + 1) * out_2size[i];
+		pstv->inf_elm[i].stride2_out_height =
+			((pstv->inf_elm[i].out_height - 1) / 2 + 1) * out_2size[i];
+
+		if (outlayer[i] == 1) {
+			pstv->inf_elm[i].out_xsize_plus_1 =
+				pstv->inf_elm[i].out_width * out_ch_pack[i] * 2;
+			pstv->inf_elm[i].out_stride =
+				round_up(pstv->inf_elm[i].out_xsize_plus_1 * anchor_en_num[i], 16);
+			pstv->inf_elm[i].out_xsize_plus_1_stride2 =
+				((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
+				out_ch_pack[i] * 2 * out_2size[i];
+		} else {
+			pstv->inf_elm[i].out_xsize_plus_1 =
+				pstv->inf_elm[i].out_width * out_ch_pack[i];
+			pstv->inf_elm[i].out_stride =
+				round_up(pstv->inf_elm[i].out_xsize_plus_1, 16);
+			pstv->inf_elm[i].out_xsize_plus_1_stride2 =
+				((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
+				out_ch_pack[i] * out_2size[i];
+		}
+
+		pstv->inf_elm[i].out_stride_stride2 =
+				round_up(pstv->inf_elm[i].out_xsize_plus_1_stride2, 16);
+
+		if (out_2size[i] == 1)
+			pstv->inf_elm[i].out_ysize_plus_1_stride2 =
+				(pstv->inf_elm[i].out_height - 1) / 2 + 1;
+		else
+			pstv->inf_elm[i].out_ysize_plus_1_stride2 =
+				pstv->inf_elm[i].out_height;
+
+		if (fd_wdma_en[i][0]) {
+			if (i == RPN2_LOOP_NUM || i == RPN1_LOOP_NUM || i == RPN0_LOOP_NUM)
+				pstv->inf_elm[i].fd_wdma_size[0] =
+					RESULT_SIZE;
+			else
+				pstv->inf_elm[i].fd_wdma_size[0] =
+					pstv->inf_elm[i].out_height *
+					pstv->inf_elm[i].out_stride;
+		}
+
+		if (outlayer[i] == 1) {
+			if (fd_wdma_en[i][1])
+				pstv->inf_elm[i].fd_wdma_size[1] =
+					pstv->inf_elm[i].fd_wdma_size[0];
+			if (fd_wdma_en[i][2])
+				pstv->inf_elm[i].fd_wdma_size[2] =
+					pstv->inf_elm[i].fd_wdma_size[0];
+			if (fd_wdma_en[i][3])
+				pstv->inf_elm[i].fd_wdma_size[3] =
+					pstv->inf_elm[i].fd_wdma_size[0];
+		} else if (i == RPN2_LOOP_NUM || i == RPN1_LOOP_NUM || i == RPN0_LOOP_NUM) {
+			pstv->inf_elm[i].fd_wdma_size[0] = RESULT_SIZE;
+		} else {
+			if (fd_wdma_en[i][1])
+				pstv->inf_elm[i].fd_wdma_size[1] =
+					pstv->inf_elm[i].out_height *
+					pstv->inf_elm[i].out_stride;
+			if (fd_wdma_en[i][2])
+				pstv->inf_elm[i].fd_wdma_size[2] =
+					pstv->inf_elm[i].out_ysize_plus_1_stride2 *
+					pstv->inf_elm[i].out_stride_stride2;
+			if (fd_wdma_en[i][3])
+				pstv->inf_elm[i].fd_wdma_size[3] =
+					pstv->inf_elm[i].out_ysize_plus_1_stride2 *
+					pstv->inf_elm[i].out_stride_stride2;
+		}
+
+		if (in_ch_pack[i] == 1)
+			pstv->inf_elm[i].input_xsize_plus_1 =
+				round_up(pstv->inf_elm[i].img_width, 8);
+		else
+			pstv->inf_elm[i].input_xsize_plus_1 =
+				pstv->inf_elm[i].img_width * in_ch_pack[i];
+	}
+}
+
+static void aie_update_table(struct mtk_aie_dev *fd, u16 pym_width,
+			     u16 pym_height)
+{
+	int i = 0;
+	struct aie_static_info *pstv = &fd->st_info;
+
+	pstv->inf_elm[PYM2_START_LOOP].img_width = pym_width / 4;
+	pstv->inf_elm[PYM2_START_LOOP].img_height = pym_height / 4;
+
+	pstv->inf_elm[PYM1_START_LOOP].img_width = pym_width / 2;
+	pstv->inf_elm[PYM1_START_LOOP].img_height = pym_height / 2;
+
+	pstv->inf_elm[PYM0_START_LOOP].img_width = pym_width;
+	pstv->inf_elm[PYM0_START_LOOP].img_height = pym_height;
+
+	for (i = 0; i < FD_LOOP_NUM; i++) {
+		if (i != PYM2_START_LOOP && i != PYM1_START_LOOP &&
+		    i != PYM0_START_LOOP) {
+			if (fd_out_stride2_in[i] == 1) {
+				pstv->inf_elm[i].img_width =
+					pstv->inf_elm[i - 1].stride2_out_width;
+				pstv->inf_elm[i].img_height =
+					pstv->inf_elm[i - 1].stride2_out_height;
+			} else {
+				pstv->inf_elm[i].img_width =
+					pstv->inf_elm[i - 1].out_width;
+				pstv->inf_elm[i].img_height =
+					pstv->inf_elm[i - 1].out_height;
+			}
+		}
+
+		if (fd_maxpool[i] == 1 && fd_stride[i] == 1) {
+			pstv->inf_elm[i].out_width =
+				(pstv->inf_elm[i].img_width - 1) /
+					(2 * fd_maxpool[i]) +
+				1;
+			pstv->inf_elm[i].out_height =
+				(pstv->inf_elm[i].img_height - 1) /
+					(2 * fd_maxpool[i]) +
+				1;
+		} else {
+			pstv->inf_elm[i].out_width =
+				(pstv->inf_elm[i].img_width - 1) /
+					(fd_stride[i] + 2 * fd_maxpool[i]) +
+				1;
+			pstv->inf_elm[i].out_height =
+				(pstv->inf_elm[i].img_height - 1) /
+					(fd_stride[i] + 2 * fd_maxpool[i]) +
+				1;
+		}
+
+		pstv->inf_elm[i].stride2_out_width =
+			((pstv->inf_elm[i].out_width - 1) / 2 + 1) *
+			out_2size[i];
+		pstv->inf_elm[i].stride2_out_height =
+			((pstv->inf_elm[i].out_height - 1) / 2 + 1) *
+			out_2size[i];
+
+		if (outlayer[i] == 1) {
+			pstv->inf_elm[i].out_xsize_plus_1 =
+				pstv->inf_elm[i].out_width *
+				out_ch_pack[i] * 2;
+			pstv->inf_elm[i].out_stride =
+				round_up(pstv->inf_elm[i].out_xsize_plus_1 * anchor_en_num[i], 16);
+			pstv->inf_elm[i].out_xsize_plus_1_stride2 =
+				((pstv->inf_elm[i].out_width - 1) / 2 +
+				 1) *
+				out_ch_pack[i] * 2 * out_2size[i];
+		} else {
+			pstv->inf_elm[i].out_xsize_plus_1 =
+				pstv->inf_elm[i].out_width *
+				out_ch_pack[i];
+			pstv->inf_elm[i].out_stride =
+				round_up(pstv->inf_elm[i].out_xsize_plus_1, 16);
+			pstv->inf_elm[i].out_xsize_plus_1_stride2 =
+				((pstv->inf_elm[i].out_width - 1) / 2 +
+				 1) *
+				out_ch_pack[i] * out_2size[i];
+		}
+
+		pstv->inf_elm[i].out_stride_stride2 =
+			round_up(pstv->inf_elm[i].out_xsize_plus_1_stride2, 16);
+
+		if (out_2size[i] == 1)
+			pstv->inf_elm[i].out_ysize_plus_1_stride2 =
+				(pstv->inf_elm[i].out_height - 1) / 2 + 1;
+		else
+			pstv->inf_elm[i].out_ysize_plus_1_stride2 =
+				pstv->inf_elm[i].out_height;
+
+		if (in_ch_pack[i] == 1)
+			pstv->inf_elm[i].input_xsize_plus_1 =
+				round_up(pstv->inf_elm[i].img_width, 8);
+		else
+			pstv->inf_elm[i].input_xsize_plus_1 =
+				pstv->inf_elm[i].img_width * in_ch_pack[i];
+	}
+}
+
+static void aie_update_buf_params(struct mtk_aie_dev *fd, u16 max_img_width,
+				  u16 max_img_height)
+{
+	u8 i = 0, j = 0;
+	struct aie_static_info *pstv = &fd->st_info;
+
+	fd->base_para->max_img_width = max_img_width;
+	fd->base_para->max_img_height = max_img_height;
+	fd->fd_dma_max_size = 0;
+	fd->fd_dma_rst_max_size = 0;
+	fd->fd_fd_kernel_size = 0;
+	fd->fd_attr_kernel_size = 0;
+	fd->fd_attr_dma_max_size = 0;
+	fd->fd_attr_dma_rst_max_size = 0;
+
+	/* FDMODE Dram Buffer Size */
+	fd->fd_rs_cfg_size = 4 * fd->variant->rs_cfg_size * 2;
+	fd->fd_fd_cfg_size = 4 * fd->variant->fd_cfg_size * FD_LOOP_NUM;
+	fd->fd_yuv2rgb_cfg_size = 4 * fd->variant->y2r_cfg_size;
+
+	/* ATTRMODE Dram Buffer Size */
+	fd->attr_fd_cfg_size = 4 * fd->variant->fd_cfg_size * ATTR_LOOP_NUM;
+	fd->attr_yuv2rgb_cfg_size = 4 * fd->variant->y2r_cfg_size;
+
+	/* HW Output Buffer Size */
+	fd->rs_pym_out_size[0] = fd->base_para->max_pyramid_width *
+				 fd->base_para->max_pyramid_height;
+	fd->rs_pym_out_size[1] = fd->rs_pym_out_size[0] / 2;
+	fd->rs_pym_out_size[2] = fd->rs_pym_out_size[0] / 4;
+
+	/* FDMODE Dram Buffer Size */
+	for (i = 0; i < FD_LOOP_NUM; i++) {
+		for (j = 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
+			if (fd_wdma_en[i][j]) {
+				if ((i == RPN2_LOOP_NUM || i == RPN1_LOOP_NUM ||
+				     i == RPN0_LOOP_NUM) && j == 0) {
+					fd->fd_dma_rst_max_size +=
+						pstv->inf_elm[i]
+							.fd_wdma_size[j];
+				} else {
+					fd->fd_dma_max_size +=
+						pstv->inf_elm[i]
+							.fd_wdma_size[j];
+				}
+			}
+		}
+	}
+
+	for (i = 0; i < FD_LOOP_NUM; i++) {
+		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
+			if (fd_ker_rdma_size[i][j])
+				fd->fd_fd_kernel_size += fd_ker_rdma_size[i][j];
+		}
+	}
+
+	/* ATTRMODE Dram Buffer Size */
+	for (i = 0; i < ATTR_LOOP_NUM; i++) {
+		for (j = 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
+			if (attr_wdma_en[i][j]) {
+				if ((i == AGE_OUT_RGS || i == GENDER_OUT_RGS ||
+				     i == INDIAN_OUT_RGS || i == RACE_OUT_RGS) && j == 0) {
+					fd->fd_attr_dma_rst_max_size +=
+						ATTR_OUT_SIZE *
+						MAX_ENQUE_FRAME_NUM;
+				} else {
+					fd->fd_attr_dma_max_size +=
+						attr_wdma_size[i][j];
+				}
+			}
+		}
+	}
+
+	for (i = 0; i < ATTR_LOOP_NUM; i++) {
+		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++)
+			fd->fd_attr_kernel_size += attr_ker_rdma_size[i][j];
+	}
+
+	/* FD Pose secure result output buffer: result size * 3 loops */
+	fd->fd_dma_rst_max_size += RESULT_SIZE * 3;
+
+	if (fd->variant->fld_enable) {
+		/* fld size */
+		fd->fld_step_size = 0;
+		for (i = 0; i < FLD_STEP_NUM; i++)
+			for (j = 0; j < FLD_MAX_FRAME; j++)
+				fd->fld_step_size += fld_step_align_size[i][j];
+
+		fd->fld_out_size = FLD_OUTPUT_SIZE * FLD_MAX_FRAME;
+	}
+}
+
+static int aie_alloc_dram_buf(struct mtk_aie_dev *fd)
+{
+	int ret = -EINVAL;
+	u8 i = 0;
+	u32 alloc_size = 0;
+
+	/* RS DRAM */
+	alloc_size = fd->fd_rs_cfg_size;
+	dev_dbg(fd->dev, "RS CFG:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->rs_cfg_data);
+	if (ret)
+		goto dma_alloc_fail;
+	/* FD MODE */
+	fd->base_para->fd_rs_cfg_pa = fd->rs_cfg_data.pa;
+	fd->base_para->fd_rs_cfg_va = fd->rs_cfg_data.va;
+
+	/* FD DRAM */
+	alloc_size =
+		fd->fd_fd_cfg_size + fd->attr_fd_cfg_size * MAX_ENQUE_FRAME_NUM;
+	dev_dbg(fd->dev, "FD CFG:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_cfg_data);
+	if (ret)
+		goto dma_alloc_fail;
+	/* FD MODE */
+	fd->base_para->fd_fd_cfg_pa = fd->fd_cfg_data.pa;
+	fd->base_para->fd_fd_cfg_va = fd->fd_cfg_data.va;
+	/* ATTR MODE */
+	fd->base_para->attr_fd_cfg_pa[0] =
+		fd->base_para->fd_fd_cfg_pa + fd->fd_fd_cfg_size;
+	fd->base_para->attr_fd_cfg_va[0] =
+		fd->base_para->fd_fd_cfg_va + fd->fd_fd_cfg_size;
+
+	for (i = 1; i < MAX_ENQUE_FRAME_NUM; i++) {
+		fd->base_para->attr_fd_cfg_pa[i] =
+			fd->base_para->attr_fd_cfg_pa[i - 1] +
+			fd->attr_fd_cfg_size;
+		fd->base_para->attr_fd_cfg_va[i] =
+			fd->base_para->attr_fd_cfg_va[i - 1] +
+			fd->attr_fd_cfg_size;
+	}
+
+	/* YUV2RGB DRAM */
+	alloc_size = fd->fd_yuv2rgb_cfg_size +
+		     fd->attr_yuv2rgb_cfg_size * MAX_ENQUE_FRAME_NUM;
+	dev_dbg(fd->dev, "YUV2RGB CFG:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->yuv2rgb_cfg_data);
+	if (ret)
+		goto dma_alloc_fail;
+	/* FD MODE */
+	fd->base_para->fd_yuv2rgb_cfg_pa = fd->yuv2rgb_cfg_data.pa;
+	fd->base_para->fd_yuv2rgb_cfg_va = fd->yuv2rgb_cfg_data.va;
+
+	/* ATTR MODE */
+	fd->base_para->attr_yuv2rgb_cfg_pa[0] =
+		fd->base_para->fd_yuv2rgb_cfg_pa + fd->fd_yuv2rgb_cfg_size;
+	fd->base_para->attr_yuv2rgb_cfg_va[0] =
+		fd->base_para->fd_yuv2rgb_cfg_va + fd->fd_yuv2rgb_cfg_size;
+
+	for (i = 1; i < MAX_ENQUE_FRAME_NUM; i++) {
+		fd->base_para->attr_yuv2rgb_cfg_pa[i] =
+			fd->base_para->attr_yuv2rgb_cfg_pa[i - 1] +
+			fd->attr_yuv2rgb_cfg_size;
+		fd->base_para->attr_yuv2rgb_cfg_va[i] =
+			fd->base_para->attr_yuv2rgb_cfg_va[i - 1] +
+			fd->attr_yuv2rgb_cfg_size;
+	}
+
+	return ret;
+dma_alloc_fail:
+	aie_imem_free(fd, &fd->fd_cfg_data);
+	aie_imem_free(fd, &fd->rs_cfg_data);
+
+	return ret;
+}
+
+static int aie_alloc_output_buf(struct mtk_aie_dev *fd)
+{
+	int ret = -EINVAL;
+	u32 alloc_size = 0;
+	int i, j, pa_off = 0, va_off = 0;
+
+	for (i = 0; i < PYM_NUM; i++)
+		alloc_size += fd->rs_pym_out_size[i] * 3;
+	dev_dbg(fd->dev, "RS OUT:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->rs_output_hw);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < PYM_NUM; i++) {
+		for (j = 0; j < COLOR_NUM; j++) {
+			fd->base_para->rs_pym_rst_pa[i][j] =
+				fd->rs_output_hw.pa + pa_off;
+			pa_off += fd->rs_pym_out_size[i];
+
+			fd->base_para->rs_pym_rst_va[i][j] =
+				fd->rs_output_hw.va + va_off;
+			va_off += fd->rs_pym_out_size[i];
+		}
+	}
+
+	return ret;
+}
+
+static void aie_alloc_normal(struct mtk_aie_dev *fd, int start, int end)
+{
+	int i = 0, j = 0;
+	int pi = 0, pj = 0;
+	struct aie_static_info *pstv = &fd->st_info;
+
+	if (start <= 0 || end <= start || end >= FD_LOOP_NUM) {
+		dev_err(fd->dev, "%s: start = %d, end = %d\n", __func__, start, end);
+		return;
+	}
+
+	pi = start - 1;
+	pj = 0;
+	for (i = start; i < end + 1; i++) {
+		for (j = 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
+			if (fd_wdma_en[i][j]) {
+				fd->dma_para->fd_out_hw_pa[i][j] =
+					fd->dma_para->fd_out_hw_pa[pi][pj] +
+					pstv->inf_elm[pi].fd_wdma_size[pj];
+				pi = i;
+				pj = j;
+			}
+		}
+	}
+}
+
+static int aie_alloc_fddma_buf(struct mtk_aie_dev *fd)
+{
+	int ret = -EINVAL;
+	u32 alloc_size = 0;
+
+	alloc_size = fd->fd_dma_max_size;
+	dev_dbg(fd->dev, "FD DMA:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_dma_hw);
+	if (ret)
+		goto dma_alloc_fail;
+	alloc_size = fd->fd_fd_kernel_size + fd->fd_attr_kernel_size;
+	dev_dbg(fd->dev, "FD KERNEL:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_kernel_hw);
+	if (ret)
+		goto dma_alloc_fail;
+
+	alloc_size = fd->fd_attr_dma_max_size;
+	dev_dbg(fd->dev, "ATTR DMA:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_attr_dma_hw);
+	if (ret)
+		goto dma_alloc_fail;
+
+	alloc_size = fd->fd_dma_rst_max_size + fd->fd_attr_dma_rst_max_size;
+	dev_dbg(fd->dev, "RESULT DMA:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_dma_result_hw);
+	if (ret)
+		goto dma_alloc_fail;
+
+	return 0;
+
+dma_alloc_fail:
+	aie_imem_free(fd, &fd->fd_attr_dma_hw);
+	aie_imem_free(fd, &fd->fd_kernel_hw);
+	aie_imem_free(fd, &fd->fd_dma_hw);
+
+	return ret;
+}
+
+static int aie_alloc_fld_buf(struct mtk_aie_dev *fd)
+{
+	int ret = -EINVAL;
+	u32 alloc_size = 0;
+
+	alloc_size = fd->fld_step_size;
+	dev_dbg(fd->dev, "FLD STEP:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_fld_step_data);
+	if (ret)
+		return ret;
+
+	alloc_size = fd->fld_out_size;
+	dev_dbg(fd->dev, "FLD OUT:");
+	ret = aie_imem_alloc(fd, alloc_size, &fd->fd_fld_out_hw);
+	if (ret)
+		goto fld_step;
+
+	return 0;
+fld_step:
+	aie_imem_free(fd, &fd->fd_fld_step_data);
+
+	return ret;
+}
+
+static void aie_arrange_fddma_buf(struct mtk_aie_dev *fd)
+{
+	void *current_va = NULL;
+	dma_addr_t current_pa = 0;
+	struct aie_static_info *pstv = &fd->st_info;
+	u8 i = 0, j = 0;
+
+	/* 0~18 */
+	fd->dma_para->fd_out_hw_pa[0][0] = fd->fd_dma_hw.pa;
+	aie_alloc_normal(fd, 1, 18);
+
+	/* 19~27 */
+	fd->dma_para->fd_out_hw_pa[19][0] =
+		fd->dma_para->fd_out_hw_pa[18][1] +
+		pstv->inf_elm[18].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[19][1] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		pstv->inf_elm[19].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[20][0] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		2 * pstv->inf_elm[20].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[20][1] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		3 * pstv->inf_elm[20].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[21][0] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		4 * pstv->inf_elm[21].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[22][0] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		pstv->inf_elm[19].fd_wdma_size[0] +
+		pstv->inf_elm[19].fd_wdma_size[1] +
+		pstv->inf_elm[20].fd_wdma_size[0] +
+		pstv->inf_elm[20].fd_wdma_size[1] +
+		pstv->inf_elm[21].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[22][1] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		pstv->inf_elm[22].fd_wdma_size[0] +
+		pstv->inf_elm[22].fd_wdma_size[2] +
+		pstv->inf_elm[23].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[22][2] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		pstv->inf_elm[22].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[22][3] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		pstv->inf_elm[22].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[23][0] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		2 * pstv->inf_elm[23].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[23][1] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		2 * pstv->inf_elm[23].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[23][2] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		3 * pstv->inf_elm[23].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[23][3] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		3 * pstv->inf_elm[23].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[24][0] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		4 * pstv->inf_elm[24].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[24][1] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		4 * pstv->inf_elm[24].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[25][0] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		pstv->inf_elm[22].fd_wdma_size[1] +
+		pstv->inf_elm[22].fd_wdma_size[3] +
+		pstv->inf_elm[23].fd_wdma_size[1] +
+		pstv->inf_elm[23].fd_wdma_size[3] +
+		pstv->inf_elm[24].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[25][1] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		pstv->inf_elm[25].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[26][0] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		2 * pstv->inf_elm[26].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[26][1] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		3 * pstv->inf_elm[26].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[27][0] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		4 * pstv->inf_elm[27].out_xsize_plus_1;
+
+	/* 29~47 */
+	fd->dma_para->fd_out_hw_pa[29][0] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		pstv->inf_elm[25].fd_wdma_size[0] +
+		pstv->inf_elm[25].fd_wdma_size[1] +
+		pstv->inf_elm[26].fd_wdma_size[0] +
+		pstv->inf_elm[26].fd_wdma_size[1] +
+		pstv->inf_elm[27].fd_wdma_size[0];
+	aie_alloc_normal(fd, 30, 47);
+
+	/* 48~56 */
+	fd->dma_para->fd_out_hw_pa[48][0] =
+		fd->dma_para->fd_out_hw_pa[47][1] +
+		pstv->inf_elm[47].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[48][1] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		pstv->inf_elm[48].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[49][0] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		2 * pstv->inf_elm[49].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[49][1] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		3 * pstv->inf_elm[49].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[50][0] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		4 * pstv->inf_elm[50].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[51][0] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		pstv->inf_elm[48].fd_wdma_size[0] +
+		pstv->inf_elm[48].fd_wdma_size[1] +
+		pstv->inf_elm[49].fd_wdma_size[0] +
+		pstv->inf_elm[49].fd_wdma_size[1] +
+		pstv->inf_elm[50].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[51][1] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		pstv->inf_elm[51].fd_wdma_size[0] +
+		pstv->inf_elm[51].fd_wdma_size[2] +
+		pstv->inf_elm[52].fd_wdma_size[0] +
+		pstv->inf_elm[52].fd_wdma_size[2] +
+		pstv->inf_elm[53].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[51][2] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		pstv->inf_elm[51].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[51][3] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		pstv->inf_elm[51].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[52][0] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		2 * pstv->inf_elm[52].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[52][1] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		2 * pstv->inf_elm[52].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[52][2] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		3 * pstv->inf_elm[52].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[52][3] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		3 * pstv->inf_elm[52].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[53][0] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		4 * pstv->inf_elm[53].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[53][1] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		4 * pstv->inf_elm[53].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[54][0] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		pstv->inf_elm[51].fd_wdma_size[1] +
+		pstv->inf_elm[51].fd_wdma_size[3] +
+		pstv->inf_elm[52].fd_wdma_size[1] +
+		pstv->inf_elm[52].fd_wdma_size[3] +
+		pstv->inf_elm[53].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[54][1] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		pstv->inf_elm[54].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[55][0] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		2 * pstv->inf_elm[55].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[55][1] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		3 * pstv->inf_elm[55].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[56][0] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		4 * pstv->inf_elm[56].out_xsize_plus_1;
+
+	/* 58~76 */
+	fd->dma_para->fd_out_hw_pa[58][0] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		pstv->inf_elm[54].fd_wdma_size[0] +
+		pstv->inf_elm[54].fd_wdma_size[1] +
+		pstv->inf_elm[55].fd_wdma_size[0] +
+		pstv->inf_elm[55].fd_wdma_size[1] +
+		pstv->inf_elm[56].fd_wdma_size[0];
+	aie_alloc_normal(fd, 59, 76);
+
+	/* 77~85 */
+	fd->dma_para->fd_out_hw_pa[77][0] =
+		fd->dma_para->fd_out_hw_pa[76][1] +
+		pstv->inf_elm[76].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[77][1] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		pstv->inf_elm[77].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[78][0] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		2 * pstv->inf_elm[78].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[78][1] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		3 * pstv->inf_elm[78].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[79][0] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		4 * pstv->inf_elm[79].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[80][0] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		pstv->inf_elm[77].fd_wdma_size[0] +
+		pstv->inf_elm[77].fd_wdma_size[1] +
+		pstv->inf_elm[78].fd_wdma_size[0] +
+		pstv->inf_elm[78].fd_wdma_size[1] +
+		pstv->inf_elm[79].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[80][1] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		pstv->inf_elm[80].fd_wdma_size[0] +
+		pstv->inf_elm[80].fd_wdma_size[2] +
+		pstv->inf_elm[81].fd_wdma_size[0] +
+		pstv->inf_elm[81].fd_wdma_size[2] +
+		pstv->inf_elm[82].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[80][2] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		pstv->inf_elm[80].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[80][3] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		pstv->inf_elm[80].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[81][0] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		2 * pstv->inf_elm[81].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[81][1] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		2 * pstv->inf_elm[81].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[81][2] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		3 * pstv->inf_elm[81].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[81][3] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		3 * pstv->inf_elm[81].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[82][0] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		4 * pstv->inf_elm[82].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[82][1] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		4 * pstv->inf_elm[82].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[83][0] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		pstv->inf_elm[80].fd_wdma_size[1] +
+		pstv->inf_elm[80].fd_wdma_size[3] +
+		pstv->inf_elm[81].fd_wdma_size[1] +
+		pstv->inf_elm[81].fd_wdma_size[3] +
+		pstv->inf_elm[82].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[83][1] =
+		fd->dma_para->fd_out_hw_pa[83][0] +
+		pstv->inf_elm[83].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[84][0] =
+		fd->dma_para->fd_out_hw_pa[83][0] +
+		2 * pstv->inf_elm[84].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[84][1] =
+		fd->dma_para->fd_out_hw_pa[83][0] +
+		3 * pstv->inf_elm[84].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[85][0] =
+		fd->dma_para->fd_out_hw_pa[83][0] +
+		4 * pstv->inf_elm[85].out_xsize_plus_1;
+
+	/* VA : except 28, 57, 86 */
+	/* 0~86 */
+	fd->dma_para->fd_out_hw_va[0][0] = fd->fd_dma_hw.va;
+	for (i = 1; i < FD_LOOP_NUM; i++) {
+		if (i == RPN2_LOOP_NUM || i == RPN1_LOOP_NUM ||
+		    i == RPN0_LOOP_NUM)
+			continue;
+		for (j = 0; j < 4; j++) {
+			if (fd_wdma_en[i][j]) {
+				fd->dma_para->fd_out_hw_va[i][j] =
+					fd->fd_dma_hw.va +
+					fd->dma_para->fd_out_hw_pa[i][j] -
+					fd->fd_dma_hw.pa;
+			}
+		}
+	}
+
+	current_pa = fd->dma_para->fd_out_hw_pa[83][0] +
+		    pstv->inf_elm[83].fd_wdma_size[0] +
+		    pstv->inf_elm[83].fd_wdma_size[1] +
+		    pstv->inf_elm[84].fd_wdma_size[0] +
+		    pstv->inf_elm[84].fd_wdma_size[1] +
+		    pstv->inf_elm[85].fd_wdma_size[0];
+	current_va = fd->dma_para->fd_out_hw_va[83][0] +
+		    pstv->inf_elm[83].fd_wdma_size[0] +
+		    pstv->inf_elm[83].fd_wdma_size[1] +
+		    pstv->inf_elm[84].fd_wdma_size[0] +
+		    pstv->inf_elm[84].fd_wdma_size[1] +
+		    pstv->inf_elm[85].fd_wdma_size[0];
+
+	dev_dbg(fd->dev,
+		"%s: current VA = %p PA = 0x%pad\n",
+		__func__,
+		current_va,
+		&current_pa
+	);
+}
+
+static void aie_arrange_kernel_buf(struct mtk_aie_dev *fd)
+{
+	void *current_va = NULL;
+	dma_addr_t current_pa = 0;
+	u8 i = 0, j = 0;
+
+	current_pa = fd->fd_kernel_hw.pa;
+	current_va = fd->fd_kernel_hw.va;
+
+	for (i = 0; i < FD_LOOP_NUM; i++) {
+		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
+			if (fd_ker_rdma_size[i][j]) {
+				fd->dma_para->fd_kernel_pa[i][j] = current_pa;
+				fd->dma_para->fd_kernel_va[i][j] = current_va;
+				current_pa += fd_ker_rdma_size[i][j];
+				current_va += fd_ker_rdma_size[i][j];
+			}
+		}
+	}
+
+	for (i = 0; i < ATTR_LOOP_NUM; i++) {
+		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
+			fd->dma_para->attr_kernel_pa[i][j] = current_pa;
+			fd->dma_para->attr_kernel_va[i][j] = current_va;
+			current_pa += attr_ker_rdma_size[i][j];
+			current_va += attr_ker_rdma_size[i][j];
+		}
+	}
+
+	dev_dbg(fd->dev,
+		"%s: current VA = %p PA = 0x%pad\n",
+		__func__,
+		current_va,
+		&current_pa
+	);
+}
+
+static void aie_arrange_attrdma_buf(struct mtk_aie_dev *fd)
+{
+	void *current_va = NULL;
+	dma_addr_t current_pa = 0;
+	u8 i = 0, j = 0;
+
+	current_pa = fd->fd_attr_dma_hw.pa;
+	current_va = fd->fd_attr_dma_hw.va;
+
+	/* attribute mode */
+	for (i = 0; i < ATTR_LOOP_NUM; i++) {
+		for (j = 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
+			if (attr_wdma_en[i][j]) {
+				fd->dma_para->attr_out_hw_pa[i][j] = current_pa;
+				fd->dma_para->attr_out_hw_va[i][j] = current_va;
+				current_pa += attr_wdma_size[i][j];
+				current_va += attr_wdma_size[i][j];
+			}
+		}
+	}
+
+	dev_dbg(fd->dev,
+		"%s: current VA = %p PA = 0x%pad\n",
+		__func__,
+		current_va,
+		&current_pa
+	);
+}
+
+static void aie_arrange_result_dma_buf(struct mtk_aie_dev *fd)
+{
+	void *currentresult_va = NULL;
+	dma_addr_t currentresult_pa = 0;
+	u8 i = 0;
+	struct aie_static_info *pstv = &fd->st_info;
+
+	currentresult_pa = fd->fd_dma_result_hw.pa;
+	currentresult_va = fd->fd_dma_result_hw.va;
+
+	fd->dma_para->fd_out_hw_pa[RPN2_LOOP_NUM][0] = currentresult_pa;
+	fd->dma_para->fd_out_hw_va[RPN2_LOOP_NUM][0] = currentresult_va;
+	currentresult_pa += pstv->inf_elm[RPN2_LOOP_NUM].fd_wdma_size[0];
+	currentresult_va += pstv->inf_elm[RPN2_LOOP_NUM].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[RPN1_LOOP_NUM][0] = currentresult_pa;
+	fd->dma_para->fd_out_hw_va[RPN1_LOOP_NUM][0] = currentresult_va;
+	currentresult_pa += pstv->inf_elm[RPN1_LOOP_NUM].fd_wdma_size[0];
+	currentresult_va += pstv->inf_elm[RPN1_LOOP_NUM].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[RPN0_LOOP_NUM][0] = currentresult_pa;
+	fd->dma_para->fd_out_hw_va[RPN0_LOOP_NUM][0] = currentresult_va;
+	currentresult_pa += pstv->inf_elm[RPN0_LOOP_NUM].fd_wdma_size[0];
+	currentresult_va += pstv->inf_elm[RPN0_LOOP_NUM].fd_wdma_size[0];
+
+	fd->dma_para->attr_out_hw_pa[AGE_OUT_RGS][0] = currentresult_pa;
+	fd->dma_para->attr_out_hw_va[AGE_OUT_RGS][0] = currentresult_va;
+	currentresult_pa += ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
+	currentresult_va += ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
+	fd->dma_para->attr_out_hw_pa[GENDER_OUT_RGS][0] = currentresult_pa;
+	fd->dma_para->attr_out_hw_va[GENDER_OUT_RGS][0] = currentresult_va;
+	currentresult_pa += ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
+	currentresult_va += ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
+	fd->dma_para->attr_out_hw_pa[INDIAN_OUT_RGS][0] = currentresult_pa;
+	fd->dma_para->attr_out_hw_va[INDIAN_OUT_RGS][0] = currentresult_va;
+	currentresult_pa += ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
+	currentresult_va += ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
+	fd->dma_para->attr_out_hw_pa[RACE_OUT_RGS][0] = currentresult_pa;
+	fd->dma_para->attr_out_hw_va[RACE_OUT_RGS][0] = currentresult_va;
+	currentresult_pa += ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
+	currentresult_va += ATTR_OUT_SIZE * MAX_ENQUE_FRAME_NUM;
+
+	/* need to prepare 10 buffers to store 10 times result */
+	fd->dma_para->age_out_hw_pa[0] =
+		fd->dma_para->attr_out_hw_pa[AGE_OUT_RGS][0];
+	fd->dma_para->age_out_hw_va[0] =
+		fd->dma_para->attr_out_hw_va[AGE_OUT_RGS][0];
+	fd->dma_para->gender_out_hw_pa[0] =
+		fd->dma_para->attr_out_hw_pa[GENDER_OUT_RGS][0];
+	fd->dma_para->gender_out_hw_va[0] =
+		fd->dma_para->attr_out_hw_va[GENDER_OUT_RGS][0];
+	fd->dma_para->is_indian_out_hw_pa[0] =
+		fd->dma_para->attr_out_hw_pa[INDIAN_OUT_RGS][0];
+	fd->dma_para->is_indian_out_hw_va[0] =
+		fd->dma_para->attr_out_hw_va[INDIAN_OUT_RGS][0];
+	fd->dma_para->race_out_hw_pa[0] =
+		fd->dma_para->attr_out_hw_pa[RACE_OUT_RGS][0];
+	fd->dma_para->race_out_hw_va[0] =
+		fd->dma_para->attr_out_hw_va[RACE_OUT_RGS][0];
+
+	for (i = 1; i < MAX_ENQUE_FRAME_NUM; i++) {
+		fd->dma_para->age_out_hw_pa[i] =
+			fd->dma_para->age_out_hw_pa[i - 1] + ATTR_OUT_SIZE;
+		fd->dma_para->age_out_hw_va[i] =
+			fd->dma_para->age_out_hw_va[i - 1] + ATTR_OUT_SIZE;
+		fd->dma_para->gender_out_hw_pa[i] =
+			fd->dma_para->gender_out_hw_pa[i - 1] + ATTR_OUT_SIZE;
+		fd->dma_para->gender_out_hw_va[i] =
+			fd->dma_para->gender_out_hw_va[i - 1] + ATTR_OUT_SIZE;
+		fd->dma_para->is_indian_out_hw_pa[i] =
+			fd->dma_para->is_indian_out_hw_pa[i - 1] + ATTR_OUT_SIZE;
+		fd->dma_para->is_indian_out_hw_va[i] =
+			fd->dma_para->is_indian_out_hw_va[i - 1] + ATTR_OUT_SIZE;
+		fd->dma_para->race_out_hw_pa[i] =
+			fd->dma_para->race_out_hw_pa[i - 1] + ATTR_OUT_SIZE;
+		fd->dma_para->race_out_hw_va[i] =
+			fd->dma_para->race_out_hw_va[i - 1] + ATTR_OUT_SIZE;
+	}
+
+	memset(fd->fd_dma_result_hw.va, 0, fd->fd_dma_result_hw.size);
+
+	dev_dbg(fd->dev,
+		"%s: current VA = %p PA = 0x%pad\n",
+		__func__,
+		currentresult_va,
+		&currentresult_pa
+	);
+}
+
+static void aie_arrange_fld_buf(struct mtk_aie_dev *fd)
+{
+	u8 i = 0, j = 0;
+	unsigned int offset = 0;
+
+	for (i = 0; i < FLD_STEP_NUM; i++) {
+		for (j = 0; j < FLD_MAX_FRAME; j++) {
+			fd->fld_para->fld_step_va[i][j] =
+				fd->fd_fld_step_data.va + offset;
+			fd->fld_para->fld_step_pa[i][j] =
+				fd->fd_fld_step_data.pa + offset;
+			offset += fld_step_align_size[i][j];
+		}
+	}
+
+	for (i = 0, offset = 0; i < FLD_MAX_FRAME; i++) {
+		fd->fld_para->fld_output_va[i] = fd->fd_fld_out_hw.va + offset;
+		fd->fld_para->fld_output_pa[i] = fd->fd_fld_out_hw.pa + offset;
+		offset += FLD_OUTPUT_SIZE;
+	}
+}
+
+static void aie_update_fddma_buf(struct mtk_aie_dev *fd)
+{
+	struct aie_static_info *pstv = &fd->st_info;
+	u8 i = 0, j = 0;
+
+	/* 19~27 */
+	fd->dma_para->fd_out_hw_pa[19][0] =
+		fd->dma_para->fd_out_hw_pa[18][1] +
+		pstv->inf_elm[18].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[19][1] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		pstv->inf_elm[19].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[20][0] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		2 * pstv->inf_elm[20].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[20][1] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		3 * pstv->inf_elm[20].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[21][0] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		4 * pstv->inf_elm[21].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[22][0] =
+		fd->dma_para->fd_out_hw_pa[19][0] +
+		pstv->inf_elm[19].fd_wdma_size[0] +
+		pstv->inf_elm[19].fd_wdma_size[1] +
+		pstv->inf_elm[20].fd_wdma_size[0] +
+		pstv->inf_elm[20].fd_wdma_size[1] +
+		pstv->inf_elm[21].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[22][1] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		pstv->inf_elm[22].fd_wdma_size[0] +
+		pstv->inf_elm[22].fd_wdma_size[2] +
+		pstv->inf_elm[23].fd_wdma_size[0] +
+		pstv->inf_elm[23].fd_wdma_size[2] +
+		pstv->inf_elm[24].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[22][2] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		pstv->inf_elm[22].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[22][3] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		pstv->inf_elm[22].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[23][0] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		2 * pstv->inf_elm[23].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[23][1] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		2 * pstv->inf_elm[23].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[23][2] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		3 * pstv->inf_elm[23].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[23][3] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		3 * pstv->inf_elm[23].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[24][0] =
+		fd->dma_para->fd_out_hw_pa[22][0] +
+		4 * pstv->inf_elm[24].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[24][1] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		4 * pstv->inf_elm[24].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[25][0] =
+		fd->dma_para->fd_out_hw_pa[22][1] +
+		pstv->inf_elm[22].fd_wdma_size[1] +
+		pstv->inf_elm[22].fd_wdma_size[3] +
+		pstv->inf_elm[23].fd_wdma_size[1] +
+		pstv->inf_elm[23].fd_wdma_size[3] +
+		pstv->inf_elm[24].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[25][1] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		pstv->inf_elm[25].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[26][0] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		2 * pstv->inf_elm[26].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[26][1] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		3 * pstv->inf_elm[26].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[27][0] =
+		fd->dma_para->fd_out_hw_pa[25][0] +
+		4 * pstv->inf_elm[27].out_xsize_plus_1;
+
+	/* 48~56 */
+	fd->dma_para->fd_out_hw_pa[48][0] =
+		fd->dma_para->fd_out_hw_pa[47][1] +
+		pstv->inf_elm[47].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[48][1] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		pstv->inf_elm[48].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[49][0] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		2 * pstv->inf_elm[49].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[49][1] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		3 * pstv->inf_elm[49].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[50][0] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		4 * pstv->inf_elm[50].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[51][0] =
+		fd->dma_para->fd_out_hw_pa[48][0] +
+		pstv->inf_elm[48].fd_wdma_size[0] +
+		pstv->inf_elm[48].fd_wdma_size[1] +
+		pstv->inf_elm[49].fd_wdma_size[0] +
+		pstv->inf_elm[49].fd_wdma_size[1] +
+		pstv->inf_elm[50].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[51][1] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		pstv->inf_elm[51].fd_wdma_size[0] +
+		pstv->inf_elm[51].fd_wdma_size[2] +
+		pstv->inf_elm[52].fd_wdma_size[0] +
+		pstv->inf_elm[52].fd_wdma_size[2] +
+		pstv->inf_elm[53].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[51][2] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		pstv->inf_elm[51].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[51][3] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		pstv->inf_elm[51].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[52][0] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		2 * pstv->inf_elm[52].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[52][1] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		2 * pstv->inf_elm[52].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[52][2] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		3 * pstv->inf_elm[52].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[52][3] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		3 * pstv->inf_elm[52].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[53][0] =
+		fd->dma_para->fd_out_hw_pa[51][0] +
+		4 * pstv->inf_elm[53].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[53][1] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		4 * pstv->inf_elm[53].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[54][0] =
+		fd->dma_para->fd_out_hw_pa[51][1] +
+		pstv->inf_elm[51].fd_wdma_size[1] +
+		pstv->inf_elm[51].fd_wdma_size[3] +
+		pstv->inf_elm[52].fd_wdma_size[1] +
+		pstv->inf_elm[52].fd_wdma_size[3] +
+		pstv->inf_elm[53].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[54][1] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		pstv->inf_elm[54].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[55][0] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		2 * pstv->inf_elm[55].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[55][1] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		3 * pstv->inf_elm[55].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[56][0] =
+		fd->dma_para->fd_out_hw_pa[54][0] +
+		4 * pstv->inf_elm[56].out_xsize_plus_1;
+	/* 77~85 */
+	fd->dma_para->fd_out_hw_pa[77][0] =
+		fd->dma_para->fd_out_hw_pa[76][1] +
+		pstv->inf_elm[76].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[77][1] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		pstv->inf_elm[77].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[78][0] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		2 * pstv->inf_elm[78].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[78][1] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		3 * pstv->inf_elm[78].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[79][0] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		4 * pstv->inf_elm[79].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[80][0] =
+		fd->dma_para->fd_out_hw_pa[77][0] +
+		pstv->inf_elm[77].fd_wdma_size[0] +
+		pstv->inf_elm[77].fd_wdma_size[1] +
+		pstv->inf_elm[78].fd_wdma_size[0] +
+		pstv->inf_elm[78].fd_wdma_size[1] +
+		pstv->inf_elm[79].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[80][1] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		pstv->inf_elm[80].fd_wdma_size[0] +
+		pstv->inf_elm[80].fd_wdma_size[2] +
+		pstv->inf_elm[81].fd_wdma_size[0] +
+		pstv->inf_elm[81].fd_wdma_size[2] +
+		pstv->inf_elm[82].fd_wdma_size[0];
+	fd->dma_para->fd_out_hw_pa[80][2] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		pstv->inf_elm[80].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[80][3] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		pstv->inf_elm[80].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[81][0] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		2 * pstv->inf_elm[81].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[81][1] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		2 * pstv->inf_elm[81].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[81][2] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		3 * pstv->inf_elm[81].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[81][3] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		3 * pstv->inf_elm[81].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[82][0] =
+		fd->dma_para->fd_out_hw_pa[80][0] +
+		4 * pstv->inf_elm[82].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[82][1] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		4 * pstv->inf_elm[82].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[83][0] =
+		fd->dma_para->fd_out_hw_pa[80][1] +
+		pstv->inf_elm[80].fd_wdma_size[1] +
+		pstv->inf_elm[80].fd_wdma_size[3] +
+		pstv->inf_elm[81].fd_wdma_size[1] +
+		pstv->inf_elm[81].fd_wdma_size[3] +
+		pstv->inf_elm[82].fd_wdma_size[1];
+	fd->dma_para->fd_out_hw_pa[83][1] =
+		fd->dma_para->fd_out_hw_pa[83][0] +
+		pstv->inf_elm[83].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[84][0] =
+		fd->dma_para->fd_out_hw_pa[83][0] +
+		2 * pstv->inf_elm[84].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[84][1] =
+		fd->dma_para->fd_out_hw_pa[83][0] +
+		3 * pstv->inf_elm[84].out_xsize_plus_1;
+	fd->dma_para->fd_out_hw_pa[85][0] =
+		fd->dma_para->fd_out_hw_pa[83][0] +
+		4 * pstv->inf_elm[85].out_xsize_plus_1;
+
+	/* VA : except 28, 57, 86 */
+	/* 0~86 */
+	fd->dma_para->fd_out_hw_va[0][0] = fd->fd_dma_hw.va;
+	for (i = 1; i < FD_LOOP_NUM; i++) {
+		if (i == RPN2_LOOP_NUM || i == RPN1_LOOP_NUM ||
+		    i == RPN0_LOOP_NUM)
+			continue;
+		for (j = 0; j < 4; j++) {
+			if (fd_wdma_en[i][j]) {
+				fd->dma_para->fd_out_hw_va[i][j] =
+					fd->fd_dma_hw.va +
+					fd->dma_para->fd_out_hw_pa[i][j] -
+					fd->fd_dma_hw.pa;
+			}
+		}
+	}
+}
+
+static void aie_free_dram_buf(struct mtk_aie_dev *fd)
+{
+	aie_imem_free(fd, &fd->rs_cfg_data);
+	aie_imem_free(fd, &fd->fd_cfg_data);
+	aie_imem_free(fd, &fd->yuv2rgb_cfg_data);
+}
+
+static void aie_free_output_buf(struct mtk_aie_dev *fd)
+{
+	aie_imem_free(fd, &fd->rs_output_hw);
+}
+
+static void aie_free_fddma_buf(struct mtk_aie_dev *fd)
+{
+	aie_imem_free(fd, &fd->fd_dma_hw);
+	aie_imem_free(fd, &fd->fd_kernel_hw);
+	aie_imem_free(fd, &fd->fd_attr_dma_hw);
+	aie_imem_free(fd, &fd->fd_dma_result_hw);
+}
+
+static void aie_free_fld_buf(struct mtk_aie_dev *fd)
+{
+	aie_imem_free(fd, &fd->fd_fld_step_data);
+	aie_imem_free(fd, &fd->fd_fld_out_hw);
+}
+
+static int aie_copy_fw(struct mtk_aie_dev *fd, const char *name, void *buf,
+		       unsigned int size)
+{
+	int ret = -EINVAL;
+	const struct firmware *fw = NULL;
+
+	ret = request_firmware(&fw, name, fd->dev);
+	if (ret == 0) {
+		if (size >= fw->size)
+			memcpy(buf, fw->data, fw->size);
+		else
+			ret = -EINVAL;
+	}
+
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int aie_load_fw(struct mtk_aie_dev *fd)
+{
+	u8 i = 0, j = 0;
+	int ret = -EINVAL;
+	char name[128] = {};
+	char *sel_folder = NULL;
+	char *mp_fw30_folder = "aie_mp_fw";
+	char *mp_fw31_folder = "aie_mp_fw31";
+
+	if (fd->variant->hw_version == 30)
+		sel_folder = mp_fw30_folder;
+	else if (fd->variant->hw_version == 31)
+		sel_folder = mp_fw31_folder;
+	else
+		return -EINVAL;
+
+	ret = sprintf(name, "%s/config/aie_fd_fd_config.bin", sel_folder);
+	if (ret < 0)
+		return ret;
+
+	ret = aie_copy_fw(fd,
+			  name,
+			  fd->base_para->fd_fd_cfg_va,
+			  fd->fd_fd_cfg_size
+		);
+	if (ret)
+		return ret;
+
+	ret = sprintf(name, "%s/config/aie_fd_rs_config.bin", sel_folder);
+	if (ret < 0)
+		return ret;
+
+	ret = aie_copy_fw(fd,
+			  name,
+			  fd->base_para->fd_rs_cfg_va,
+			  fd->fd_rs_cfg_size
+		);
+	if (ret)
+		return ret;
+
+	ret = sprintf(name, "%s/config/aie_fd_yuv2rgb_config.bin", sel_folder);
+	if (ret < 0)
+		return ret;
+
+	ret = aie_copy_fw(fd,
+			  name,
+			  fd->base_para->fd_yuv2rgb_cfg_va,
+			  fd->fd_yuv2rgb_cfg_size
+		);
+	if (ret)
+		return ret;
+
+	ret = sprintf(name, "%s/config/aie_attr_fd_config.bin", sel_folder);
+	if (ret < 0)
+		return ret;
+
+	ret = aie_copy_fw(fd,
+			  name,
+			  fd->base_para->attr_fd_cfg_va[0],
+			  fd->attr_fd_cfg_size
+		);
+	if (ret)
+		return ret;
+
+	ret = sprintf(name, "%s/config/aie_attr_yuv2rgb_config.bin", sel_folder);
+	if (ret < 0)
+		return ret;
+
+	ret = aie_copy_fw(fd,
+			  name,
+			  fd->base_para->attr_yuv2rgb_cfg_va[0],
+			  fd->attr_yuv2rgb_cfg_size
+		);
+	if (ret)
+		return ret;
+
+	for (i = 1; i < MAX_ENQUE_FRAME_NUM; i++) {
+		memcpy(fd->base_para->attr_fd_cfg_va[i],
+		       fd->base_para->attr_fd_cfg_va[0], fd->attr_fd_cfg_size);
+		memcpy(fd->base_para->attr_yuv2rgb_cfg_va[i],
+		       fd->base_para->attr_yuv2rgb_cfg_va[0],
+		       fd->attr_yuv2rgb_cfg_size);
+	}
+
+	for (i = 0; i < FD_LOOP_NUM; i++) {
+		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
+			if (fd_ker_rdma_size[i][j]) {
+				ret = sprintf(name,
+					      "%s/kernel/aie_fd_kernel_bias_loop%02d_%d.bin",
+					      sel_folder,
+					      i,
+					      j
+					);
+				if (ret < 0)
+					return ret;
+
+				ret = aie_copy_fw(fd,
+						  name,
+						  fd->dma_para->fd_kernel_va[i][j],
+						  fd_ker_rdma_size[i][j]
+					);
+				if (ret)
+					return ret;
+			}
+		}
+	}
+
+	for (i = 0; i < ATTR_LOOP_NUM; i++) {
+		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
+			ret = sprintf(name,
+				      "%s/kernel/aie_attr_kernel_bias_loop%02d_%d.bin",
+				      sel_folder,
+				      i,
+				      j
+				);
+			if (ret < 0)
+				return ret;
+
+			ret = aie_copy_fw(fd,
+					  name,
+					  fd->dma_para->attr_kernel_va[i][j],
+					  attr_ker_rdma_size[i][j]
+				);
+			if (ret)
+				return ret;
+		}
+	}
+
+	if (fd->variant->fld_enable) {
+		ret = sprintf(name, "%s/config/aie_fld_blink_weight_forest14.bin", sel_folder);
+		if (ret < 0)
+			return ret;
+
+		ret = aie_copy_fw(fd,
+				  name,
+				  fd->fld_para->fld_step_va[FLD_STEP_BLINK][14],
+				  fld_step_align_size[FLD_STEP_BLINK][14]
+			);
+		if (ret)
+			return ret;
+
+		for (j = 0; j < FLD_MAX_FRAME; j++) {
+			ret = sprintf(name,
+				      "%s/config/aie_fld_cv_forest%02d_iom3.bin",
+				      sel_folder,
+				      j
+				);
+			if (ret < 0)
+				return ret;
+
+			ret = aie_copy_fw(fd,
+					  name,
+					  fd->fld_para->fld_step_va[FLD_STEP_CV][j],
+					  fld_step_align_size[FLD_STEP_CV][j]
+				);
+			if (ret)
+				return ret;
+		}
+
+		for (j = 0; j < FLD_MAX_FRAME; j++) {
+			ret = sprintf(name,
+				      "%s/config/aie_fld_fp_forest%02d_om45.bin",
+				      sel_folder,
+				      j
+				);
+			if (ret < 0)
+				return ret;
+
+			ret = aie_copy_fw(fd,
+					  name,
+					  fd->fld_para->fld_step_va[FLD_STEP_FP][j],
+					  fld_step_align_size[FLD_STEP_FP][j]
+				);
+			if (ret)
+				return ret;
+		}
+
+		for (j = 0; j < FLD_MAX_FRAME; j++) {
+			ret = sprintf(name,
+				      "%s/config/aie_fld_leafnode_forest%02d.bin",
+				      sel_folder,
+				      j
+				);
+			if (ret < 0)
+				return ret;
+
+			ret = aie_copy_fw(fd,
+					  name,
+					  fd->fld_para->fld_step_va[FLD_STEP_LEAF][j],
+					  fld_step_align_size[FLD_STEP_LEAF][j]
+				);
+			if (ret)
+				return ret;
+		}
+
+		for (j = 0; j < FLD_MAX_FRAME; j++) {
+			ret = sprintf(name,
+				      "%s/config/aie_fld_tree_forest%02d_km02.bin",
+				      sel_folder,
+				      j
+				);
+			if (ret < 0)
+				return ret;
+			ret = aie_copy_fw(fd,
+					  name,
+					  fd->fld_para->fld_step_va[FLD_STEP_KM02][j],
+					  fld_step_align_size[FLD_STEP_KM02][j]
+				);
+			if (ret)
+				return ret;
+		}
+
+		for (j = 0; j < FLD_MAX_FRAME; j++) {
+			ret = sprintf(name,
+				      "%s/config/aie_fld_tree_forest%02d_km13.bin",
+				      sel_folder,
+				      j
+				);
+			if (ret < 0)
+				return ret;
+			ret = aie_copy_fw(fd,
+					  name,
+					  fd->fld_para->fld_step_va[FLD_STEP_KM13][j],
+					  fld_step_align_size[FLD_STEP_KM13][j]
+				);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+static void aie_reset_output_buf(struct mtk_aie_dev *fd,
+				 struct aie_enq_info *aie_cfg)
+{
+	if (aie_cfg->sel_mode == FDMODE) {
+		memset(fd->rs_output_hw.va, 0, fd->rs_output_hw.size);
+		memset(fd->dma_para->fd_out_hw_va[RPN0_LOOP_NUM][0], 0,
+		       RESULT_SIZE);
+		memset(fd->dma_para->fd_out_hw_va[RPN1_LOOP_NUM][0], 0,
+		       RESULT_SIZE);
+		memset(fd->dma_para->fd_out_hw_va[RPN2_LOOP_NUM][0], 0,
+		       RESULT_SIZE);
+	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
+		memset(fd->base_para->rs_pym_rst_va[0][0], 0,
+		       fd->rs_pym_out_size[0]);
+		memset(fd->base_para->rs_pym_rst_va[0][1], 0,
+		       fd->rs_pym_out_size[0]);
+		memset(fd->base_para->rs_pym_rst_va[0][2], 0,
+		       fd->rs_pym_out_size[0]);
+	} else if (aie_cfg->sel_mode == FLDMODE) {
+		if (fd->variant->fld_enable)
+			memset(fd->fld_para->fld_output_va[0], 0,
+			       FLD_MAX_FRAME * FLD_OUTPUT_SIZE);
+	}
+}
+
+static int aie_update_cfg(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
+{
+	int crop_width = 0;
+	int crop_height = 0;
+
+	crop_width = aie_cfg->src_img_width;
+	crop_height = aie_cfg->src_img_height;
+
+	if (aie_cfg->en_roi) {
+		crop_width = dif_x(aie_cfg) + 1;
+		crop_height = dif_y(aie_cfg) + 1;
+	}
+
+	if (crop_width == 0 || crop_height == 0) {
+		dev_err(fd->dev, "AIE error:crop size is wrong");
+		return -EINVAL;
+	}
+
+	if (aie_cfg->en_padding) {
+		crop_width = crop_width + aie_cfg->src_padding.right +
+			     aie_cfg->src_padding.left;
+		crop_height = crop_height + aie_cfg->src_padding.up +
+			      aie_cfg->src_padding.down;
+	}
+
+	if (aie_cfg->sel_mode == FDMODE) {
+		fd->base_para->sel_mode = aie_cfg->sel_mode;
+		fd->base_para->crop_width = crop_width;
+		fd->base_para->crop_height = crop_height;
+		fd->base_para->src_img_addr = aie_cfg->src_img_addr;
+		fd->base_para->src_img_addr_uv = aie_cfg->src_img_addr_uv;
+		fd->base_para->img_width = aie_cfg->src_img_width;
+		fd->base_para->img_height = aie_cfg->src_img_height;
+		fd->base_para->src_img_fmt = aie_cfg->src_img_fmt;
+		fd->base_para->rotate_degree = aie_cfg->rotate_degree;
+	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
+		fd->attr_para->sel_mode[fd->attr_para->w_idx] =
+			aie_cfg->sel_mode;
+		fd->attr_para->crop_width[fd->attr_para->w_idx] = crop_width;
+		fd->attr_para->crop_height[fd->attr_para->w_idx] = crop_height;
+		fd->attr_para->src_img_addr[fd->attr_para->w_idx] =
+			aie_cfg->src_img_addr;
+		fd->attr_para->src_img_addr_uv[fd->attr_para->w_idx] =
+			aie_cfg->src_img_addr_uv;
+		fd->attr_para->img_width[fd->attr_para->w_idx] =
+			aie_cfg->src_img_width;
+		fd->attr_para->img_height[fd->attr_para->w_idx] =
+			aie_cfg->src_img_height;
+		fd->attr_para->src_img_fmt[fd->attr_para->w_idx] =
+			aie_cfg->src_img_fmt;
+		fd->attr_para->rotate_degree[fd->attr_para->w_idx] =
+			aie_cfg->rotate_degree;
+	}
+
+	return 0;
+}
+
+static int aie_config_y2r(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg,
+			  int mode)
+{
+	u32 img_addr = 0;
+	u32 img_addr_UV = 0;
+	u32 img_off = 0;
+	u32 img_off_uv = 0;
+	u32 *yuv2rgb_cfg = NULL;
+	u32 srcbuf, srcbuf_UV = 0;
+	u16 xmag_0 = 0, ymag_0 = 0;
+	u16 pym0_out_w = 0;
+	u16 pym0_out_h = 0;
+	u16 stride_pym0_out_w = 0;
+	u16 sr_crp_w = 0;
+	u16 sr_crp_h = 0;
+	u16 y1_stride = 0;
+
+	if (!aie_cfg->en_roi) {
+		img_off = 0;
+		img_off_uv = 0;
+	} else {
+		if (aie_cfg->src_img_fmt == FMT_MONO ||
+		    aie_cfg->src_img_fmt == FMT_YUV_2P ||
+		    aie_cfg->src_img_fmt == FMT_YVU_2P) {
+			y1_stride = aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
+			img_off = y1_stride + aie_cfg->src_roi.x1;
+			img_off_uv = y1_stride + aie_cfg->src_roi.x1;
+		} else if (aie_cfg->src_img_fmt == FMT_YUV420_2P ||
+			   aie_cfg->src_img_fmt == FMT_YUV420_1P) {
+			y1_stride = aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
+			img_off = y1_stride + aie_cfg->src_roi.x1;
+			img_off_uv = y1_stride / 2 + aie_cfg->src_roi.x1;
+		} else if (aie_cfg->src_img_fmt == FMT_YUYV ||
+			   aie_cfg->src_img_fmt == FMT_YVYU ||
+			   aie_cfg->src_img_fmt == FMT_UYVY ||
+			   aie_cfg->src_img_fmt == FMT_VYUY) {
+			y1_stride = aie_cfg->src_img_stride * aie_cfg->src_roi.y1;
+			img_off = y1_stride + aie_cfg->src_roi.x1 * 2;
+			img_off_uv = y1_stride + aie_cfg->src_roi.x1 * 2;
+		} else {
+			dev_err(fd->dev,
+				"AIE error: Unsupport input format %d",
+				aie_cfg->src_img_fmt
+				);
+			return -EINVAL;
+		}
+	}
+
+	img_addr = aie_cfg->src_img_addr + img_off;
+	img_addr_UV = aie_cfg->src_img_addr_uv + img_off_uv;
+
+	srcbuf = img_addr;
+	if (aie_cfg->src_img_fmt == FMT_YUV420_2P ||
+	    aie_cfg->src_img_fmt == FMT_YUV420_1P ||
+	    aie_cfg->src_img_fmt == FMT_YUV_2P ||
+	    aie_cfg->src_img_fmt == FMT_YVU_2P)
+		srcbuf_UV = img_addr_UV;
+	else
+		srcbuf_UV = 0;
+
+	if (mode == FDMODE) {
+		sr_crp_w = fd->base_para->crop_width;
+		sr_crp_h = fd->base_para->crop_height;
+		yuv2rgb_cfg = (u32 *)fd->base_para->fd_yuv2rgb_cfg_va;
+		pym0_out_w = fd->base_para->pyramid_width;
+	} else {/* for ATTRIBUTEMODE mode */
+		sr_crp_w = fd->attr_para->crop_width[fd->attr_para->w_idx];
+		sr_crp_h = fd->attr_para->crop_height[fd->attr_para->w_idx];
+		yuv2rgb_cfg =
+			(u32 *)fd->base_para
+				->attr_yuv2rgb_cfg_va[fd->attr_para->w_idx];
+		pym0_out_w = ATTR_MODE_PYRAMID_WIDTH;
+	}
+
+	pym0_out_h = pym0_out_w * sr_crp_h / sr_crp_w;
+
+	if (pym0_out_w != 0) {
+		xmag_0 = 512 * sr_crp_w / pym0_out_w;
+		ymag_0 = xmag_0;
+	} else {
+		xmag_0 = 0;
+		ymag_0 = 0;
+	}
+
+	yuv2rgb_cfg[Y2R_SRC_DST_FORMAT] =
+		(yuv2rgb_cfg[Y2R_SRC_DST_FORMAT] & 0xFFFFFFF8) |
+		((aie_cfg->src_img_fmt) & 0x7);
+	if (aie_cfg->src_img_fmt == FMT_YUV420_2P ||
+	    aie_cfg->src_img_fmt == FMT_YUV420_1P) { /* for match patten */
+		yuv2rgb_cfg[Y2R_SRC_DST_FORMAT] =
+			(yuv2rgb_cfg[Y2R_SRC_DST_FORMAT] & 0xFFFFFFF8) |
+			((0x3) & 0x7);
+	}
+	yuv2rgb_cfg[Y2R_IN_W_H] = (yuv2rgb_cfg[Y2R_IN_W_H] & 0xF800F800) |
+				  ((sr_crp_w << 16) & 0x7FF0000) |
+				  (sr_crp_h & 0x7FF);
+	yuv2rgb_cfg[Y2R_OUT_W_H] = (yuv2rgb_cfg[Y2R_OUT_W_H] & 0xF800F800) |
+				   ((pym0_out_w << 16) & 0x7FF0000) |
+				   (pym0_out_h & 0x7FF);
+
+	if (aie_cfg->src_img_fmt == FMT_YUV_2P ||
+	    aie_cfg->src_img_fmt == FMT_YVU_2P) { /* 2 plane */
+		yuv2rgb_cfg[Y2R_RA0_RA1_EN] =
+			(yuv2rgb_cfg[Y2R_RA0_RA1_EN] & 0xFFFFFFEE) | 0x11;
+		if (aie_cfg->en_roi) {
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] = aie_cmb_u16(dif_x(aie_cfg), dif_y(aie_cfg));
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] = aie_cmb_u16(dif_x(aie_cfg), dif_y(aie_cfg));
+		} else {
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =
+				aie_cmb_u16(sr_crp_w - 1, sr_crp_h - 1);
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =
+				aie_cmb_u16(sr_crp_w - 1, sr_crp_h - 1);
+		}
+		yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] =
+			(yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] & 0xFFF0) |
+			((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x1;
+		yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] =
+			(yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] & 0xFFF0) |
+			((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x1;
+	} else if (aie_cfg->src_img_fmt == FMT_MONO) {
+		yuv2rgb_cfg[Y2R_RA0_RA1_EN] =
+			(yuv2rgb_cfg[Y2R_RA0_RA1_EN] & 0xFFFFFFEE) | 0x01;
+		if (aie_cfg->en_roi) {
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] = aie_cmb_u16(dif_x(aie_cfg), dif_y(aie_cfg));
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] = aie_cmb_u16(dif_x(aie_cfg), dif_y(aie_cfg));
+		} else {
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =
+				aie_cmb_u16(sr_crp_w - 1, sr_crp_h - 1);
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] =
+				aie_cmb_u16(sr_crp_w - 1, sr_crp_h - 1);
+		}
+		yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] =
+			(yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] & 0xFFF0) |
+			((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x0;
+		yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] =
+			(yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] & 0xFFF0) |
+			((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x0;
+	} else if (aie_cfg->src_img_fmt == FMT_YUYV ||
+		   aie_cfg->src_img_fmt == FMT_YVYU ||
+		   aie_cfg->src_img_fmt == FMT_UYVY ||
+		   aie_cfg->src_img_fmt == FMT_VYUY) { /* 1 plane */
+		yuv2rgb_cfg[Y2R_RA0_RA1_EN] =
+			(yuv2rgb_cfg[Y2R_RA0_RA1_EN] & 0xFFFFFFEE) | 0x1;
+		if (aie_cfg->en_roi) {
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] = aie_cmb_u16(2 * (dif_x(aie_cfg) + 1) - 1,
+								    dif_y(aie_cfg)
+							);
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] = aie_cmb_u16(2 * (dif_x(aie_cfg) + 1) - 1,
+								    dif_y(aie_cfg)
+							);
+		} else {
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] = aie_cmb_u16(2 * sr_crp_w - 1, sr_crp_h - 1);
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] = aie_cmb_u16(2 * sr_crp_w - 1, sr_crp_h - 1);
+		}
+		yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] =
+			(yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] & 0xFFF0) |
+			((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x3;
+		yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] =
+			(yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] & 0xFFF0) |
+			((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x3;
+	}
+
+	/* AIE3.0 */
+	if (aie_cfg->src_img_fmt == FMT_YUV420_2P ||
+	    aie_cfg->src_img_fmt == FMT_YUV420_1P) {
+		yuv2rgb_cfg[Y2R_RA0_RA1_EN] =
+			(yuv2rgb_cfg[Y2R_RA0_RA1_EN] & 0xFFFFFFEE) | 0x11;
+		if (aie_cfg->en_roi) {
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] = aie_cmb_u16(dif_x(aie_cfg), dif_y(aie_cfg));
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] = aie_cmb_u16(dif_x(aie_cfg),
+								    dif_y(aie_cfg) / 2
+							);
+		} else {
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE0] =
+				aie_cmb_u16(sr_crp_w - 1, sr_crp_h - 1);
+			yuv2rgb_cfg[Y2R_IN_X_Y_SIZE1] = aie_cmb_u16(sr_crp_w - 1,
+								    sr_crp_h / 2 - 1
+							);
+		}
+		yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] =
+			(yuv2rgb_cfg[Y2R_IN_STRIDE0_BUS_SIZE0] & 0xFFF0) |
+			((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x0;
+		yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] =
+			(yuv2rgb_cfg[Y2R_IN_STRIDE1_BUS_SIZE1] & 0xFFF0) |
+			((aie_cfg->src_img_stride << 16) & 0xFFFF0000) | 0x0;
+
+		yuv2rgb_cfg[Y2R_CO2_FMT_MODE_EN] =
+			(yuv2rgb_cfg[Y2R_CO2_FMT_MODE_EN] & 0xFFFFFFFE) | 0x01;
+		if (aie_cfg->en_roi) {
+			yuv2rgb_cfg[Y2R_CO2_CROP_X] = aie_cmb_u16(0, dif_x(aie_cfg));
+			yuv2rgb_cfg[Y2R_CO2_CROP_Y] = aie_cmb_u16(0, dif_y(aie_cfg));
+		} else {
+			yuv2rgb_cfg[Y2R_CO2_CROP_X] =
+				aie_cmb_u16(0, sr_crp_w - 1);
+			yuv2rgb_cfg[Y2R_CO2_CROP_Y] =
+				aie_cmb_u16(0, sr_crp_h - 1);
+		}
+	} else {
+		yuv2rgb_cfg[Y2R_CO2_FMT_MODE_EN] =
+			(yuv2rgb_cfg[Y2R_CO2_FMT_MODE_EN] & 0xFFFFFFFE);
+
+		if (aie_cfg->en_roi) {
+			yuv2rgb_cfg[Y2R_CO2_CROP_X] = aie_cmb_u16(0, dif_x(aie_cfg));
+			yuv2rgb_cfg[Y2R_CO2_CROP_Y] = aie_cmb_u16(0, dif_y(aie_cfg));
+		} else {
+			yuv2rgb_cfg[Y2R_CO2_CROP_X] =
+				aie_cmb_u16(0, sr_crp_w - 1);
+			yuv2rgb_cfg[Y2R_CO2_CROP_Y] =
+				aie_cmb_u16(0, sr_crp_h - 1);
+		}
+	}
+
+	stride_pym0_out_w = round_up(pym0_out_w, 8);
+
+	yuv2rgb_cfg[Y2R_OUT_X_Y_SIZE0] =
+		aie_cmb_u16(pym0_out_w - 1, pym0_out_h - 1);
+	set_cmb_cfg(yuv2rgb_cfg, Y2R_OUT_STRIDE0_BUS_SIZE0, stride_pym0_out_w);
+	yuv2rgb_cfg[Y2R_OUT_X_Y_SIZE1] =
+		aie_cmb_u16(pym0_out_w - 1, pym0_out_h - 1);
+	set_cmb_cfg(yuv2rgb_cfg, Y2R_OUT_STRIDE1_BUS_SIZE1, stride_pym0_out_w);
+	yuv2rgb_cfg[Y2R_OUT_X_Y_SIZE2] =
+		aie_cmb_u16(pym0_out_w - 1, pym0_out_h - 1);
+	set_cmb_cfg(yuv2rgb_cfg, Y2R_OUT_STRIDE2_BUS_SIZE2, stride_pym0_out_w);
+
+	if (aie_cfg->en_padding) {
+		yuv2rgb_cfg[Y2R_PADDING_EN_UP_DOWN] =
+			1 | ((aie_cfg->src_padding.up << 4) & 0x1FF0) |
+			((aie_cfg->src_padding.down << 16) & 0x01FF0000);
+		yuv2rgb_cfg[Y2R_PADDING_RIGHT_LEFT] =
+			(aie_cfg->src_padding.right & 0x01FF) |
+			((aie_cfg->src_padding.left << 16) & 0x01FF0000);
+	} else {
+		yuv2rgb_cfg[Y2R_PADDING_EN_UP_DOWN] = 0;
+		yuv2rgb_cfg[Y2R_PADDING_RIGHT_LEFT] = 0;
+	}
+
+	yuv2rgb_cfg[Y2R_IN_0] = srcbuf;
+	yuv2rgb_cfg[Y2R_IN_1] = srcbuf_UV;
+
+	yuv2rgb_cfg[Y2R_OUT_0] = (u32)fd->base_para->rs_pym_rst_pa[0][0];
+	yuv2rgb_cfg[Y2R_OUT_1] = (u32)fd->base_para->rs_pym_rst_pa[0][1];
+	yuv2rgb_cfg[Y2R_OUT_2] = (u32)fd->base_para->rs_pym_rst_pa[0][2];
+
+	yuv2rgb_cfg[Y2R_X_Y_MAG] = (xmag_0 & 0x3FFF) |
+				   ((ymag_0 << 16) & 0x3FFF0000);
+
+	if (sr_crp_w >= pym0_out_w) { /* down scale AIE1.0 by FRZ */
+		yuv2rgb_cfg[Y2R_RS_SEL_SRZ_EN] =
+			(yuv2rgb_cfg[Y2R_RS_SEL_SRZ_EN] & 0x00100070);
+		yuv2rgb_cfg[Y2R_SRZ_HORI_STEP] = 0;
+		yuv2rgb_cfg[Y2R_SRZ_VERT_STEP] = 0;
+	} else { /* SRZ */
+		/* 0: FDRZ for down scaling */
+		/* 1: SRZ for up scaling */
+		yuv2rgb_cfg[Y2R_RS_SEL_SRZ_EN] =
+			(yuv2rgb_cfg[Y2R_RS_SEL_SRZ_EN] & 0x00100070) | SRZ_BIT;
+		yuv2rgb_cfg[Y2R_SRZ_HORI_STEP] =
+			((sr_crp_w - 1) << 15) / (pym0_out_w - 1);
+		yuv2rgb_cfg[Y2R_SRZ_VERT_STEP] =
+			((sr_crp_h - 1) << 15) / (pym0_out_h - 1);
+	}
+
+	if (fd->variant->hw_version == 31) {
+		yuv2rgb_cfg[Y2R_CON_IN_BA_MSB] = (u32)0x02020202;
+		yuv2rgb_cfg[Y2R_CON_OUT_BA_MSB] = (u32)0x02020202;
+	}
+
+	return 0;
+}
+
+static int aie_config_rs(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
+{
+	u32 *rs_cfg = NULL;
+	u32 *rs_tbl[2] = { NULL, NULL };
+	u16 xmag_0 = 0, ymag_0 = 0;
+	u16 pym_out_w[3] = { 0, 0, 0 };
+	u16 pym_out_h[3] = { 0, 0, 0 };
+	u16 round_w = 0;
+	u16 sr_crp_w = 0;
+	u16 sr_crp_h = 0;
+	int i = 0;
+
+	sr_crp_w = fd->base_para->crop_width;
+	sr_crp_h = fd->base_para->crop_height;
+
+	rs_cfg = (u32 *)fd->base_para->fd_rs_cfg_va;
+
+	pym_out_w[0] = fd->base_para->pyramid_width;
+	pym_out_w[1] = pym_out_w[0] >> 1;
+	pym_out_w[2] = pym_out_w[1] >> 1;
+
+	pym_out_h[0] = pym_out_w[0] * sr_crp_h / sr_crp_w;
+	pym_out_h[1] = pym_out_h[0] >> 1;
+	pym_out_h[2] = pym_out_h[1] >> 1;
+
+	for (i = 0; i < 2; i++) {
+		rs_tbl[i] = rs_cfg + fd->variant->rs_cfg_size * i;
+
+		rs_tbl[i][RS_IN_0] = (u32)fd->base_para->rs_pym_rst_pa[i][0];
+		rs_tbl[i][RS_IN_1] = (u32)fd->base_para->rs_pym_rst_pa[i][1];
+		rs_tbl[i][RS_IN_2] = (u32)fd->base_para->rs_pym_rst_pa[i][2];
+
+		rs_tbl[i][RS_OUT_0] =
+			(u32)fd->base_para->rs_pym_rst_pa[i + 1][0];
+		rs_tbl[i][RS_OUT_1] =
+			(u32)fd->base_para->rs_pym_rst_pa[i + 1][1];
+		rs_tbl[i][RS_OUT_2] =
+			(u32)fd->base_para->rs_pym_rst_pa[i + 1][2];
+
+		rs_tbl[i][RS_INPUT_W_H] =
+			(rs_tbl[i][RS_INPUT_W_H] & 0xF800F800) |
+			(pym_out_h[i] & 0x7FF) |
+			((pym_out_w[i] << 16) & 0x7FF0000);
+		rs_tbl[i][RS_OUTPUT_W_H] =
+			(rs_tbl[i][RS_OUTPUT_W_H] & 0xF800F800) |
+			(pym_out_h[i + 1] & 0x7FF) |
+			((pym_out_w[i + 1] << 16) & 0x7FF0000);
+		rs_tbl[i][RS_IN_X_Y_SIZE0] =
+			aie_cmb_u16(pym_out_w[i] - 1, pym_out_h[i] - 1);
+		rs_tbl[i][RS_IN_X_Y_SIZE1] =
+			aie_cmb_u16(pym_out_w[i] - 1, pym_out_h[i] - 1);
+		rs_tbl[i][RS_IN_X_Y_SIZE2] =
+			aie_cmb_u16(pym_out_w[i] - 1, pym_out_h[i] - 1);
+		set_cmb_cfg(rs_tbl[i], RS_IN_STRIDE0, pym_out_w[i]);
+		set_cmb_cfg(rs_tbl[i], RS_IN_STRIDE1, pym_out_w[i]);
+		set_cmb_cfg(rs_tbl[i], RS_IN_STRIDE2, pym_out_w[i]);
+		rs_tbl[i][RS_OUT_X_Y_SIZE0] = aie_cmb_u16(pym_out_w[i + 1] - 1,
+							  pym_out_h[i + 1] - 1
+						);
+		rs_tbl[i][RS_OUT_X_Y_SIZE1] = aie_cmb_u16(pym_out_w[i + 1] - 1,
+							  pym_out_h[i + 1] - 1
+						);
+		rs_tbl[i][RS_OUT_X_Y_SIZE2] = aie_cmb_u16(pym_out_w[i + 1] - 1,
+							  pym_out_h[i + 1] - 1
+						);
+
+		if (i == 0)
+			round_w = pym_out_w[i + 1];
+		else
+			round_w = round_up(pym_out_w[i + 1], 8);
+
+		set_cmb_cfg(rs_tbl[i], RS_OUT_STRIDE0, round_w);
+		set_cmb_cfg(rs_tbl[i], RS_OUT_STRIDE1, round_w);
+		set_cmb_cfg(rs_tbl[i], RS_OUT_STRIDE2, round_w);
+
+		xmag_0 = 512 * pym_out_w[i] / pym_out_w[i + 1];
+		ymag_0 = xmag_0;
+
+		rs_tbl[i][RS_X_Y_MAG] = (xmag_0 & 0x3FFF) |
+					((ymag_0 << 16) & 0x3FFF0000);
+
+		if (fd->variant->hw_version == 31) {
+			rs_tbl[i][RS_CON_IN_BA_MSB] = (u32)0x02020202;
+			rs_tbl[i][RS_CON_OUT_BA_MSB] = (u32)0x02020202;
+		}
+	}
+
+	return 0;
+}
+
+static int aie_config_network(struct mtk_aie_dev *fd,
+			      struct aie_enq_info *aie_cfg)
+{
+	u16 conv_width = 0;
+	u16 conv_height = 0;
+	u8 i = 0;
+	u8 j = 0;
+	u8 uch = 0;
+	u8 uloop = 0;
+	u16 fd_xsize[4] = { 0, 0, 0, 0 };
+	void *fd_cfg = NULL;
+	u32 *fd_cur_cfg = NULL;
+	u32 *fd_cur_set = NULL;
+	u16 pyramid0_out_w = 0;
+	u16 pyramid0_out_h = 0;
+	u16 pyramid1_out_h = 0;
+	u16 pyramid2_out_h = 0;
+	u16 input_height = 0;
+	u16 out_height = 0;
+	u16 out_ysize_plus_1 = 0;
+	u16 out_ysize_plus_1_stride2 = 0;
+	u32 sr_crp_w = 0;
+	u32 sr_crp_h = 0;
+	struct aie_static_info *pstv = &fd->st_info;
+	u32 cal_x = 0;
+	u32 cal_y = 0;
+
+	sr_crp_w = fd->base_para->crop_width;
+	sr_crp_h = fd->base_para->crop_height;
+
+	pyramid0_out_w = fd->base_para->pyramid_width;
+	pyramid0_out_h = pyramid0_out_w * sr_crp_h / sr_crp_w;
+
+	pyramid1_out_h = pyramid0_out_h / 2;
+	pyramid2_out_h = pyramid1_out_h / 2;
+
+	fd_cfg = fd->base_para->fd_fd_cfg_va;
+
+	for (i = 0; i < FD_LOOP_NUM; i++) {
+		fd_cur_cfg = (u32 *)fd_cfg + fd->variant->fd_cfg_size * i;
+		fd_cur_cfg[FD_INPUT_ROTATE] =
+			(fd_cur_cfg[FD_INPUT_ROTATE] & 0xFFFF0FFF) |
+			((aie_cfg->rotate_degree << 12) & 0x3000);
+
+		if (i == 0)
+			input_height = pyramid2_out_h;
+		else if (i == (RPN2_LOOP_NUM + 1))
+			input_height = pyramid1_out_h;
+		else if (i == (RPN1_LOOP_NUM + 1))
+			input_height = pyramid0_out_h;
+		else
+			if (fd_out_stride2_in[i] == 0)
+				input_height = out_height;
+			else
+				input_height = (out_height + 1) / 2;
+
+		if (fd_maxpool[i] == 1 && fd_stride[i] == 1)
+			out_height =
+				DIV_ROUND_UP(input_height, 2 * fd_maxpool[i]);
+		else
+			out_height = DIV_ROUND_UP(input_height, fd_stride[i] + 2 * fd_maxpool[i]);
+
+		if (i == RPN0_LOOP_NUM || i == RPN1_LOOP_NUM ||
+		    i == RPN2_LOOP_NUM) {
+			conv_width = fd->base_para->img_width;
+			conv_height = fd->base_para->img_height;
+			fd_xsize[0] = pstv->inf_elm[i].img_width * 2 * 16 *
+					      anchor_en_num[i] -
+				      1;
+			fd_xsize[3] = pstv->inf_elm[i].img_width * 2 * 32 *
+					      anchor_en_num[i] - 1;
+			fd_xsize[2] = fd_xsize[3];
+			fd_xsize[1] = fd_xsize[2];
+		} else {
+			conv_width = DIV_ROUND_UP(pstv->inf_elm[i].img_width, fd_stride[i]);
+			conv_height = DIV_ROUND_UP(input_height, fd_stride[i]);
+
+			fd_xsize[3] = pstv->inf_elm[i].input_xsize_plus_1 - 1;
+			fd_xsize[2] = fd_xsize[3];
+			fd_xsize[1] = fd_xsize[2];
+			fd_xsize[0] = fd_xsize[1];
+		}
+
+		fd_cur_cfg[FD_CONV_WIDTH_MOD6] =
+			(fd_cur_cfg[FD_CONV_WIDTH_MOD6] & 0xFF8FFFFF) |
+			(((conv_width % 6) << 20) & 0x00700000);
+		fd_cur_cfg[FD_CONV_IMG_W_H] =
+			aie_cmb_u16(conv_height, conv_width);
+
+		fd_cur_cfg[FD_IN_IMG_W_H] = aie_cmb_u16(input_height, pstv->inf_elm[i].img_width);
+		fd_cur_cfg[FD_OUT_IMG_W_H] = aie_cmb_u16(out_height, pstv->inf_elm[i].out_width);
+
+		if (fd_rdma_en[i][0][0] != -1) {
+			for (j = 0; j < 4; j++) {
+				fd_cur_cfg[FD_IN_X_Y_SIZE0 + 2 * j] =
+					aie_cmb_u16(fd_xsize[j], input_height - 1);
+				set_cmbst_cfg(fd_cur_cfg,
+					      FD_IN_STRIDE0_BUS_SIZE0 + 2 * j,
+					      fd_xsize[j] + 1
+				);
+			}
+		}
+
+		out_ysize_plus_1 = out_height - 1;
+		out_ysize_plus_1_stride2 = (out_height + 1) / 2 - 1;
+
+		for (j = 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
+			fd_cur_set = fd_cur_cfg + 2 * j;
+			if (!fd_wdma_en[i][j])
+				continue;
+
+			if (out_stride_size[i][j] == 1) {
+				fd_cur_set[FD_OUT_X_Y_SIZE0] =
+					aie_cmb_u16(pstv->inf_elm[i].out_xsize_plus_1 - 1,
+						    out_ysize_plus_1
+					);
+				set_cmbst_cfg(fd_cur_set,
+					      FD_OUT_STRIDE0_BUS_SIZE0,
+					      pstv->inf_elm[i].out_stride
+				);
+			} else if (out_stride_size[i][j] == 2) {
+				fd_cur_set[FD_OUT_X_Y_SIZE0] =
+					aie_cmb_u16(pstv->inf_elm[i].out_xsize_plus_1_stride2 - 1,
+						    out_ysize_plus_1_stride2
+					);
+				set_cmbst_cfg(fd_cur_set,
+					      FD_OUT_STRIDE0_BUS_SIZE0,
+					      pstv->inf_elm[i].out_stride_stride2
+				);
+			}
+		}
+
+		if (i == RPN0_LOOP_NUM || i == RPN1_LOOP_NUM || i == RPN2_LOOP_NUM)
+			set_cmb_cfg(fd_cur_cfg, FD_RPN_SET, fd->base_para->rpn_anchor_thrd);
+
+		if (i == RPN0_LOOP_NUM) {
+			cal_x = ((sr_crp_w << 10) * 100 /
+				 (int)fd->base_para->pyramid_width) >>
+				10;
+			cal_y = cal_x * 512 / 100;
+			fd_cur_cfg[FD_IMAGE_COORD] =
+				(fd_cur_cfg[FD_IMAGE_COORD] & 0xF) |
+				((cal_y << 4) & 0x7FFF0);
+			fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] = 0;
+			if (aie_cfg->en_roi) {
+				fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =
+					(aie_cfg->src_roi.x1 -
+					 aie_cfg->src_padding.left) |
+					(aie_cfg->src_roi.y1 -
+					 aie_cfg->src_padding.up)
+						<< 16;
+			}
+		} else if (i == RPN1_LOOP_NUM) {
+			cal_x = ((sr_crp_w << 10) * 100 /
+				 (int)fd->base_para->pyramid_width) >>
+				10;
+			cal_y = cal_x * 2 * 512 / 100;
+			fd_cur_cfg[FD_IMAGE_COORD] =
+				(fd_cur_cfg[FD_IMAGE_COORD] & 0xF) |
+				((cal_y << 4) & 0x7FFF0);
+			fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] = 0;
+			if (aie_cfg->en_roi) {
+				fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =
+					(aie_cfg->src_roi.x1 -
+					 aie_cfg->src_padding.left) |
+					(aie_cfg->src_roi.y1 -
+					 aie_cfg->src_padding.up)
+						<< 16;
+			}
+		} else if (i == RPN2_LOOP_NUM) {
+			cal_x = ((sr_crp_w << 10) * 100 /
+				 (int)fd->base_para->pyramid_width) >>
+				10;
+			cal_y = cal_x * 4 * 512 / 100;
+			fd_cur_cfg[FD_IMAGE_COORD] =
+				(fd_cur_cfg[FD_IMAGE_COORD] & 0xF) |
+				((cal_y << 4) & 0x7FFF0);
+			fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] = 0;
+			if (aie_cfg->en_roi) {
+				fd_cur_cfg[FD_IMAGE_COORD_XY_OFST] =
+					(aie_cfg->src_roi.x1 -
+					 aie_cfg->src_padding.left) |
+					(aie_cfg->src_roi.y1 -
+					 aie_cfg->src_padding.up)
+						<< 16;
+			}
+		}
+
+		/* IN_FM_BASE_ADR */
+		if (i == 0) {
+			fd_cur_cfg[FD_IN_0] =
+				(u32)(fd->base_para->rs_pym_rst_pa[2][0]);
+			fd_cur_cfg[FD_IN_1] =
+				(u32)(fd->base_para->rs_pym_rst_pa[2][1]);
+			fd_cur_cfg[FD_IN_2] =
+				(u32)(fd->base_para->rs_pym_rst_pa[2][2]);
+		} else if (i == (RPN2_LOOP_NUM + 1)) {
+			fd_cur_cfg[FD_IN_0] =
+				(u32)(fd->base_para->rs_pym_rst_pa[1][0]);
+			fd_cur_cfg[FD_IN_1] =
+				(u32)(fd->base_para->rs_pym_rst_pa[1][1]);
+			fd_cur_cfg[FD_IN_2] =
+				(u32)(fd->base_para->rs_pym_rst_pa[1][2]);
+		} else if (i == (RPN1_LOOP_NUM + 1)) {
+			fd_cur_cfg[FD_IN_0] =
+				(u32)(fd->base_para->rs_pym_rst_pa[0][0]);
+			fd_cur_cfg[FD_IN_1] =
+				(u32)(fd->base_para->rs_pym_rst_pa[0][1]);
+			fd_cur_cfg[FD_IN_2] =
+				(u32)(fd->base_para->rs_pym_rst_pa[0][2]);
+		} else {
+			for (j = 0; j < INPUT_WDMA_WRA_NUM; j++) {
+				if (fd_rdma_en[i][j][0] != -1) {
+					uloop = fd_rdma_en[i][j][0];
+					uch = fd_rdma_en[i][j][1];
+					fd_cur_cfg[FD_IN_0 + j] =
+						(u32)(fd->dma_para->fd_out_hw_pa
+							      [uloop][uch]);
+				}
+			}
+		}
+
+		/* OUT_FM_BASE_ADR */
+		for (j = 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
+			if (fd_wdma_en[i][j])
+				fd_cur_cfg[FD_OUT_0 + j] =
+					(u32)(fd->dma_para->fd_out_hw_pa[i][j]);
+		}
+
+		/* KERNEL_BASE_ADR */
+		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
+			if (fd_ker_rdma_size[i][j])
+				fd_cur_cfg[FD_KERNEL_0 + j] =
+					(u32)(fd->dma_para->fd_kernel_pa[i][j]);
+		}
+
+		if (fd->variant->hw_version == 31) {
+			fd_cur_cfg[FD_CON_IN_BA_MSB] = (u32)0x02020202;
+			fd_cur_cfg[FD_CON_OUT_BA_MSB] = (u32)0x02020202;
+			fd_cur_cfg[FD_CON_KERNEL_BA_MSB] = (u32)0x00000202;
+		}
+	}
+
+	return 0;
+}
+
+static int aie_config_attr_network(struct mtk_aie_dev *fd,
+				   struct aie_enq_info *aie_cfg)
+{
+	bool is_regression_loop = false;
+	void *fd_cfg = NULL;
+	u32 *fd_cur_cfg = NULL;
+	u16 fd_input_ht = 0, fd_output_ht = 0;
+	u16 fd_out_y[4] = { 0, 0, 0, 0 };
+	u8 i = 0, j = 0;
+	u8 uloop = 0, uch = 0, uidx = 0;
+	u16 pyramid0_out_w = 0, pyramid0_out_h = 0;
+	int fd_conv_ht = 0;
+	u16 sr_crp_w = 0;
+	u16 sr_crp_h = 0;
+
+	sr_crp_w = fd->attr_para->crop_width[fd->attr_para->w_idx];
+	sr_crp_h = fd->attr_para->crop_height[fd->attr_para->w_idx];
+
+	pyramid0_out_w = ATTR_MODE_PYRAMID_WIDTH;
+	pyramid0_out_h = pyramid0_out_w * sr_crp_h / sr_crp_w;
+
+	fd_cfg = fd->base_para->attr_fd_cfg_va[fd->attr_para->w_idx];
+
+	for (i = 0; i < ATTR_LOOP_NUM; i++) {
+		fd_cur_cfg = (u32 *)fd_cfg + fd->variant->fd_cfg_size * i;
+		fd_cur_cfg[FD_INPUT_ROTATE] =
+			(fd_cur_cfg[FD_INPUT_ROTATE] & 0xFFFF0FFF) |
+			((aie_cfg->rotate_degree << 12) & 0x3000);
+		if (i == 0)
+			fd_input_ht = pyramid0_out_h;
+		else
+			if (attr_out_stride2_as_in[i] == 0)
+				fd_input_ht = fd_output_ht;
+			else if (attr_out_stride2_as_in[i] == 1)
+				fd_input_ht = (fd_output_ht + 1) / 2;
+
+		fd_output_ht = DIV_ROUND_UP(fd_input_ht,
+					    attr_fd_stride[i] +
+					    2 * attr_fd_maxpool[i]
+				);
+		fd_conv_ht = DIV_ROUND_UP(fd_input_ht, attr_fd_stride[i]);
+
+		fd_cur_cfg[FD_CONV_IMG_W_H] =
+			(fd_cur_cfg[FD_CONV_IMG_W_H] & 0xFFFF0000) |
+			(fd_conv_ht & 0xFFFF);
+		fd_cur_cfg[FD_IN_IMG_W_H] =
+			(fd_cur_cfg[FD_IN_IMG_W_H] & 0xFFFF0000) |
+			(fd_input_ht & 0xFFFF);
+		fd_cur_cfg[FD_OUT_IMG_W_H] =
+			(fd_cur_cfg[FD_OUT_IMG_W_H] & 0xFFFF0000) |
+			(fd_output_ht & 0xFFFF);
+		set_cmb_cfg(fd_cur_cfg, FD_IN_X_Y_SIZE0, fd_input_ht - 1);
+		set_cmb_cfg(fd_cur_cfg, FD_IN_X_Y_SIZE1, fd_input_ht - 1);
+		set_cmb_cfg(fd_cur_cfg, FD_IN_X_Y_SIZE2, fd_input_ht - 1);
+		set_cmb_cfg(fd_cur_cfg, FD_IN_X_Y_SIZE3, fd_input_ht - 1);
+
+		is_regression_loop = (i == AGE_OUT_RGS || i == GENDER_OUT_RGS ||
+				    i == INDIAN_OUT_RGS || i == RACE_OUT_RGS);
+
+		if (is_regression_loop) {
+			fd_out_y[0] = 0;
+			fd_out_y[1] = 0;
+			fd_out_y[2] = 0;
+			fd_out_y[3] = 0;
+		} else {
+			fd_out_y[0] = fd_output_ht - 1;
+			fd_out_y[1] = fd_output_ht - 1;
+			if (attr_out_2size[i] == 0) {
+				fd_out_y[2] = fd_output_ht - 1;
+				fd_out_y[3] = fd_output_ht - 1;
+			} else {
+				fd_out_y[2] = (fd_output_ht + 1) / 2 - 1;
+				fd_out_y[3] = (fd_output_ht + 1) / 2 - 1;
+			}
+		}
+
+		for (j = 0; j < 4; j++)
+			set_cmb_cfg(fd_cur_cfg, FD_OUT_X_Y_SIZE0 + 2 * j, fd_out_y[j]);
+
+		/* IN_FM_BASE_ADR */
+		if (i == 0) {
+			fd_cur_cfg[FD_IN_0] =
+				(u32)(fd->base_para->rs_pym_rst_pa[0][0]);
+			fd_cur_cfg[FD_IN_1] =
+				(u32)(fd->base_para->rs_pym_rst_pa[0][1]);
+			fd_cur_cfg[FD_IN_2] =
+				(u32)(fd->base_para->rs_pym_rst_pa[0][2]);
+		} else {
+			for (j = 0; j < INPUT_WDMA_WRA_NUM; j++) {
+				if (attr_rdma_en[i][j][0] != -1) {
+					uloop = attr_rdma_en[i][j][0];
+					uch = attr_rdma_en[i][j][1];
+					fd_cur_cfg[FD_IN_0 + j] =
+						(u32)(fd->dma_para->attr_out_hw_pa
+							      [uloop][uch]);
+				}
+			}
+		}
+
+		/* OUT_FM_BASE_ADR */
+		for (j = 0; j < OUTPUT_WDMA_WRA_NUM; j++) {
+			if (attr_wdma_en[i][j]) {
+				uidx = fd->attr_para->w_idx;
+				if (i == AGE_OUT_RGS && j == 0)
+					fd_cur_cfg[FD_OUT_0 + j] =
+						(u32)(fd->dma_para->age_out_hw_pa
+							      [uidx]);
+				else if (i == GENDER_OUT_RGS && j == 0)
+					fd_cur_cfg[FD_OUT_0 + j] =
+						(u32)(fd->dma_para
+							      ->gender_out_hw_pa
+								      [uidx]);
+				else if (i == INDIAN_OUT_RGS && j == 0)
+					fd_cur_cfg[FD_OUT_0 + j] =
+						(u32)(fd->dma_para
+							      ->is_indian_out_hw_pa
+								      [uidx]);
+				else if (i == RACE_OUT_RGS && j == 0)
+					fd_cur_cfg[FD_OUT_0 + j] =
+						(u32)(fd->dma_para
+							      ->race_out_hw_pa
+								      [uidx]);
+				else
+					fd_cur_cfg[FD_OUT_0 + j] =
+						(u32)(fd->dma_para
+							      ->attr_out_hw_pa
+								      [i][j]);
+			}
+		}
+
+		/* KERNEL_BASE_ADR */
+		for (j = 0; j < KERNEL_RDMA_RA_NUM; j++) {
+			fd_cur_cfg[FD_KERNEL_0 + j] =
+				(u32)(fd->dma_para->attr_kernel_pa[i][j]);
+		}
+
+		if (fd->variant->hw_version == 31) {
+			fd_cur_cfg[FD_CON_IN_BA_MSB] = (u32)0x02020202;
+			fd_cur_cfg[FD_CON_OUT_BA_MSB] = (u32)0x02020202;
+			fd_cur_cfg[FD_CON_KERNEL_BA_MSB] = (u32)0x00000202;
+		}
+	}
+	return 0;
+}
+
+static int aie_config_dram(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
+{
+	int ret = -EINVAL;
+
+	if (aie_cfg->sel_mode == FDMODE) {
+		ret = aie_config_y2r(fd, aie_cfg, aie_cfg->sel_mode);
+		if (ret)
+			return ret;
+
+		ret = aie_config_rs(fd, aie_cfg);
+		if (ret)
+			return ret;
+
+		ret = aie_config_network(fd, aie_cfg);
+		if (ret)
+			return ret;
+
+	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
+		ret = aie_config_y2r(fd, aie_cfg, aie_cfg->sel_mode);
+		if (ret)
+			return ret;
+
+		ret = aie_config_attr_network(fd, aie_cfg);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+void aie_reset(struct mtk_aie_dev *fd)
+{
+	writel(0x30000, fd->fd_base + AIE_START_REG);
+	writel(0x0, fd->fd_base + AIE_START_REG);
+}
+
+int aie_init(struct mtk_aie_dev *fd, struct v4l2_ctrl_aie_init *user_init)
+{
+	int ret = -ENOMEM;
+	int i = 0, j = 0;
+
+	if (fd->fd_state & STATE_INIT) {
+		dev_err(fd->dev, "%s fd state: %d\n", __func__, fd->fd_state);
+		return -EINVAL;
+	}
+
+	fd->fd_state &= ~STATE_INIT;
+	fd->fd_mem_size = 0;
+
+	fd->base_para = kmalloc(sizeof(*fd->base_para), GFP_KERNEL);
+	if (!fd->base_para)
+		goto kmalloc_fail;
+
+	fd->attr_para = kmalloc(sizeof(*fd->attr_para), GFP_KERNEL);
+	if (!fd->attr_para)
+		goto kmalloc_fail;
+
+	fd->dma_para = kmalloc(sizeof(*fd->dma_para), GFP_KERNEL);
+	if (!fd->dma_para)
+		goto kmalloc_fail;
+
+	if (fd->variant->fld_enable) {
+		fd->fld_para =
+			kmalloc(sizeof(*fd->fld_para), GFP_KERNEL);
+		if (!fd->fld_para)
+			goto kmalloc_fail;
+	}
+
+	fd->base_para->rpn_anchor_thrd =
+		(signed short)(user_init->feature_threshold & 0x0000FFFF);
+	fd->base_para->pyramid_width = user_init->pyramid_width;
+	fd->base_para->pyramid_height = user_init->pyramid_height;
+	fd->base_para->max_pyramid_width = user_init->pyramid_width;
+	fd->base_para->max_pyramid_height = user_init->pyramid_height;
+
+	fd->base_para->fd_fd_cfg_va = NULL;
+	fd->base_para->fd_rs_cfg_va = NULL;
+	fd->base_para->fd_yuv2rgb_cfg_va = NULL;
+	for (i = 0; i < MAX_ENQUE_FRAME_NUM; i++)
+		fd->base_para->attr_fd_cfg_va[i] = NULL;
+	for (i = 0; i < MAX_ENQUE_FRAME_NUM; i++)
+		fd->base_para->attr_yuv2rgb_cfg_va[i] = NULL;
+	for (i = 0; i < PYM_NUM; i++)
+		for (j = 0; j < COLOR_NUM; j++)
+			fd->base_para->rs_pym_rst_va[i][j] = NULL;
+
+	memset(&fd->st_info, 0, sizeof(struct aie_static_info));
+	aie_init_table(fd, fd->base_para->max_pyramid_width,
+		       fd->base_para->max_pyramid_height);
+	aie_update_buf_params(fd, user_init->max_img_width,
+			      user_init->max_img_height);
+	ret = aie_alloc_dram_buf(fd);
+	if (ret)
+		goto free_all;
+
+	ret = aie_alloc_output_buf(fd);
+	if (ret)
+		goto free_all;
+
+	ret = aie_alloc_fddma_buf(fd);
+	if (ret)
+		goto free_all;
+
+	if (fd->variant->fld_enable) {
+		ret = aie_alloc_fld_buf(fd);
+		if (ret)
+			goto free_all;
+	}
+
+	aie_arrange_fddma_buf(fd);
+	aie_arrange_kernel_buf(fd);
+	aie_arrange_attrdma_buf(fd);
+	aie_arrange_result_dma_buf(fd);
+
+	if (fd->variant->fld_enable)
+		aie_arrange_fld_buf(fd);
+
+	ret = aie_load_fw(fd);
+	if (ret) {
+		dev_err(fd->dev, "Failed to load aie fw\n");
+		goto free_all;
+	}
+
+	fd->attr_para->r_idx = 0;
+	fd->attr_para->w_idx = 0;
+
+	fd->fd_state |= STATE_INIT;
+
+	dev_info(fd->dev, "%s: fd_mem_size(%d)\n", __func__, fd->fd_mem_size);
+
+	return ret;
+
+free_all:
+	aie_free_dram_buf(fd);
+	aie_free_output_buf(fd);
+	aie_free_fddma_buf(fd);
+	if (fd->variant->fld_enable)
+		aie_free_fld_buf(fd);
+
+kmalloc_fail:
+	kfree(fd->base_para);
+	kfree(fd->attr_para);
+	kfree(fd->dma_para);
+	kfree(fd->fld_para);
+
+	dev_err(fd->dev, "Failed to init aie\n");
+
+	return ret;
+}
+
+void aie_uninit(struct mtk_aie_dev *fd)
+{
+	fd->fd_state &= ~STATE_INIT;
+
+	aie_free_dram_buf(fd);
+	aie_free_output_buf(fd);
+	aie_free_fddma_buf(fd);
+
+	if (fd->variant->fld_enable)
+		aie_free_fld_buf(fd);
+
+	kfree(fd->base_para);
+	kfree(fd->attr_para);
+	kfree(fd->dma_para);
+	kfree(fd->fld_para);
+}
+
+void aie_prepare(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
+{
+	if (fd->variant->fld_enable) {
+		if (aie_cfg->sel_mode == FLDMODE) { /* FLD don't need to prepare buf */
+			dev_dbg(fd->dev, "FLD, Mode: %d", aie_cfg->sel_mode);
+			return;
+		}
+	}
+
+	memset(&fd->reg_cfg, 0, sizeof(struct aie_reg_cfg));
+
+	if (aie_cfg->pyramid_base_width == 0) {
+		fd->base_para->pyramid_width = fd->base_para->max_pyramid_width;
+		fd->base_para->pyramid_height =
+			fd->base_para->max_pyramid_height;
+		fd->base_para->number_of_pyramid = 3;
+	} else {
+		fd->base_para->pyramid_height =
+			fd->base_para->max_pyramid_height;
+		fd->base_para->number_of_pyramid = aie_cfg->number_of_pyramid;
+		if (aie_cfg->pyramid_base_width !=
+		    fd->base_para->pyramid_width) {
+			dev_dbg(fd->dev,
+				"pre: %d cur: %d num: %d\n",
+				fd->base_para->pyramid_width,
+				aie_cfg->pyramid_base_width,
+				fd->base_para->number_of_pyramid
+			);
+			fd->base_para->pyramid_width =
+				aie_cfg->pyramid_base_width;
+			aie_update_table(fd, fd->base_para->pyramid_width,
+					 fd->base_para->pyramid_height);
+			aie_update_fddma_buf(fd);
+		}
+	}
+
+	aie_reset_output_buf(fd, aie_cfg);
+
+	fd->reg_cfg.fd_mode = aie_cfg->sel_mode;
+	if (aie_cfg->sel_mode == FDMODE) {
+		fd->reg_cfg.rs_adr = (u32)fd->base_para->fd_rs_cfg_pa;
+		fd->reg_cfg.yuv2rgb_adr = (u32)fd->base_para->fd_yuv2rgb_cfg_pa;
+		fd->reg_cfg.fd_adr = (u32)fd->base_para->fd_fd_cfg_pa +
+							 fd->variant->fd_cfg_size * 4 *
+							 FD_LOOP_NUM / 3 *
+							 (3 - aie_cfg->number_of_pyramid);
+
+	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
+		fd->reg_cfg.yuv2rgb_adr =
+			(u32)fd->base_para->attr_yuv2rgb_cfg_pa[fd->attr_para->w_idx];
+		fd->reg_cfg.fd_adr =
+			(u32)fd->base_para->attr_fd_cfg_pa[fd->attr_para->w_idx];
+	} else {
+		dev_err(fd->dev, "AIE error, Mode: %d", aie_cfg->sel_mode);
+	}
+
+	aie_update_cfg(fd, aie_cfg);
+
+	aie_config_dram(fd, aie_cfg);
+
+	if (aie_cfg->sel_mode == ATTRIBUTEMODE)
+		fd->attr_para->w_idx =
+			(fd->attr_para->w_idx + 1) % MAX_ENQUE_FRAME_NUM;
+}
+
+void aie_execute(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
+{
+	unsigned int loop_num = 0;
+	unsigned int loop_reg_val = 0;
+	unsigned int i = 0;
+
+	if (aie_cfg->sel_mode == FDMODE) {
+		writel(0x0, fd->fd_base + AIE_START_REG);
+		writel(0x00000111, fd->fd_base + AIE_ENABLE_REG);
+		loop_num = FD_LOOP_NUM / 3 * (aie_cfg->number_of_pyramid);
+		loop_reg_val = (loop_num << 8) |
+			       (aie_cfg->number_of_pyramid - 1);
+		writel(loop_reg_val, fd->fd_base + AIE_LOOP_REG);
+		writel(0x1, fd->fd_base + AIE_INT_EN_REG);
+		writel(fd->reg_cfg.rs_adr,
+		       fd->fd_base + AIE_RS_CON_BASE_ADR_REG);
+		writel(fd->reg_cfg.fd_adr,
+		       fd->fd_base + AIE_FD_CON_BASE_ADR_REG);
+		writel(fd->reg_cfg.yuv2rgb_adr,
+		       fd->fd_base + AIE_YUV2RGB_CON_BASE_ADR_REG);
+
+		if (fd->variant->hw_version == 31) {
+			writel(0x00000002,
+			       fd->fd_base + AIE_YUV2RGB_CON_BASE_ADR_MSB);
+			writel(0x00000002,
+			       fd->fd_base + AIE_RS_CON_BASE_ADR_MSB);
+			writel(0x00000002,
+			       fd->fd_base + AIE_FD_CON_BASE_ADR_MSB);
+		}
+
+		writel(0x1, fd->fd_base + AIE_START_REG);
+	} else if (aie_cfg->sel_mode == ATTRIBUTEMODE) {
+		writel(0x0, fd->fd_base + AIE_START_REG);
+		writel(0x00000101, fd->fd_base + AIE_ENABLE_REG);
+		writel(0x00001A00, fd->fd_base + AIE_LOOP_REG);
+		writel(0x1, fd->fd_base + AIE_INT_EN_REG);
+		writel(fd->reg_cfg.rs_adr,
+		       fd->fd_base + AIE_RS_CON_BASE_ADR_REG);
+		writel(fd->reg_cfg.fd_adr,
+		       fd->fd_base + AIE_FD_CON_BASE_ADR_REG);
+		writel(fd->reg_cfg.yuv2rgb_adr,
+		       fd->fd_base + AIE_YUV2RGB_CON_BASE_ADR_REG);
+
+		if (fd->variant->hw_version == 31) {
+			writel(0x00000002,
+			       fd->fd_base + AIE_YUV2RGB_CON_BASE_ADR_MSB);
+			writel(0x00000002,
+			       fd->fd_base + AIE_RS_CON_BASE_ADR_MSB);
+			writel(0x00000002,
+			       fd->fd_base + AIE_FD_CON_BASE_ADR_MSB);
+		}
+
+		writel(0x1, fd->fd_base + AIE_START_REG);
+	} else if (aie_cfg->sel_mode == FLDMODE) {
+		if (fd->variant->fld_enable) {
+			writel(0x10, fd->fd_base + AIE_START_REG);
+			writel(0x00011111, fd->fd_base + AIE_DMA_CTL_REG);
+			writel(0x01111111, fd->fd_base + FLD_EN);
+			writel(0x1, fd->fd_base + AIE_INT_EN_REG);
+			for (i = 0; i < aie_cfg->fld_face_num; i++) {
+				writel(aie_cfg->src_img_addr,
+				       fd->fd_base + FLD_BASE_ADDR_FACE_0 +
+					       i * 0x4);
+				writel(aie_cfg->fld_input[i].fld_in_crop_x1
+						       << 16 |
+					       aie_cfg->fld_input[i]
+						       .fld_in_crop_y1,
+				       fd->fd_base + fld_face_info_0[i]);
+				writel(aie_cfg->fld_input[i].fld_in_crop_x2
+						       << 16 |
+					       aie_cfg->fld_input[i]
+						       .fld_in_crop_y2,
+				       fd->fd_base + fld_face_info_1[i]);
+				writel(aie_cfg->fld_input[i].fld_in_rip << 4 |
+					       aie_cfg->fld_input[i].fld_in_rop,
+				       fd->fd_base + fld_face_info_2[i]);
+			}
+
+			writel(aie_cfg->fld_face_num << 28 | FLD_FOREST << 16 |
+				       FLD_POINT,
+			       fd->fd_base + FLD_MODEL_PARA1);
+			writel(13 << 16 | 0xfe9,
+			       fd->fd_base + FLD_MODEL_PARA14);
+
+			writel(aie_cfg->src_img_width << 16 |
+				       aie_cfg->src_img_height,
+			       fd->fd_base + FLD_SRC_WD_HT);
+
+			/*input settings*/
+			writel(0x007c003f, fd->fd_base + FLD_PL_IN_SIZE_0);
+			writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_0);
+			writel(0x007c003f, fd->fd_base + FLD_PL_IN_SIZE_1);
+			writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_1);
+			writel(0x0016003f, fd->fd_base + FLD_PL_IN_SIZE_2_0);
+			writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_2_0);
+			writel(0x0013003f, fd->fd_base + FLD_PL_IN_SIZE_2_1);
+			writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_2_1);
+			writel(0x0013003f, fd->fd_base + FLD_PL_IN_SIZE_2_2);
+			writel(0x0040000f, fd->fd_base + FLD_PL_IN_STRIDE_2_2);
+			writel(0x00a6001f, fd->fd_base + FLD_PL_IN_SIZE_3);
+			writel(0x0020000f, fd->fd_base + FLD_PL_IN_STRIDE_3);
+
+			/*output setting*/
+			writel((2400 * aie_cfg->fld_face_num - 1) << 16 | 127,
+			       fd->fd_base + FLD_SH_IN_SIZE_0);
+			writel(0x0010000f, fd->fd_base + FLD_SH_IN_STRIDE_0);
+			writel(fd->fld_para->fld_output_pa[0],
+			       fd->fd_base + FLD_TR_OUT_BASE_ADDR_0);
+			writel((aie_cfg->fld_face_num - 1) << 16 | 0x6f,
+			       fd->fd_base + FLD_TR_OUT_SIZE_0);
+			writel(0x0070000f, fd->fd_base + FLD_TR_OUT_STRIDE_0);
+			writel(fd->fld_para->fld_output_pa[0],
+			       fd->fd_base + FLD_PP_OUT_BASE_ADDR_0);
+			writel((aie_cfg->fld_face_num - 1) << 16 | 0x6f,
+			       fd->fd_base + FLD_PP_OUT_SIZE_0);
+			writel(0x0070000f, fd->fd_base + FLD_PP_OUT_STRIDE_0);
+
+			/*cv score*/
+			writel(0x00000001, fd->fd_base + FLD_BS_BIAS);
+			writel(0x0000b835,
+			       fd->fd_base + FLD_CV_FM_RANGE_0); // 8E8
+			writel(0xffff5cba,
+			       fd->fd_base + FLD_CV_FM_RANGE_1); // 8EC
+			writel(0x00005ed5,
+			       fd->fd_base + FLD_CV_PM_RANGE_0); // 8F0
+			writel(0xffff910d,
+			       fd->fd_base + FLD_CV_PM_RANGE_1); // 8F4
+			writel(0x0000031e, fd->fd_base + FLD_BS_RANGE_0); // 8F8
+			writel(0xfffffcae, fd->fd_base + FLD_BS_RANGE_1); // 8FC
+
+			/* 6 steps */
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_BLINK][14],
+			       fd->fd_base + FLD_BS_IN_BASE_ADDR_14);
+
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][0],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_0);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][1],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_1);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][2],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_2);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][3],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_3);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][4],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_4);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][5],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_5);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][6],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_6);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][7],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_7);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][8],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_8);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][9],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_9);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][10],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_10);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][11],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_11);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][12],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_12);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][13],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_13);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_CV][14],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_14);
+
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][0],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_0);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][1],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_1);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][2],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_2);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][3],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_3);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][4],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_4);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][5],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_5);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][6],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_6);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][7],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_7);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][8],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_8);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][9],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_9);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][10],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_10);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][11],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_11);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][12],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_12);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][13],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_13);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_FP][14],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_14);
+
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][0],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_0);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][1],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_1);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][2],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_2);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][3],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_3);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][4],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_4);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][5],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_5);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][6],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_6);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][7],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_7);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][8],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_8);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][9],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_9);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][10],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_10);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][11],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_11);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][12],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_12);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][13],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_13);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_LEAF][14],
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_14);
+
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][0],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_0);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][1],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_1);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][2],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_2);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][3],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_3);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][4],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_4);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][5],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_5);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][6],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_6);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][7],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_7);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][8],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_8);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][9],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_9);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][10],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_10);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][11],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_11);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][12],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_12);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][13],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_13);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM02][14],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_14);
+
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][0],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_0);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][1],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_1);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][2],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_2);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][3],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_3);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][4],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_4);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][5],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_5);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][6],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_6);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][7],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_7);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][8],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_8);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][9],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_9);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][10],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_10);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][11],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_11);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][12],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_12);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][13],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_13);
+			writel(fd->fld_para->fld_step_pa[FLD_STEP_KM13][14],
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_14);
+
+			/* */
+			writel(0x22222222,
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_0_7_MSB);
+			writel(0x02222222,
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_0_8_15_MSB);
+
+			writel(0x22222222,
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_0_7_MSB);
+			writel(0x02222222,
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_1_8_15_MSB);
+
+			writel(0x22222222,
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_0_7_MSB);
+			writel(0x02222222,
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_2_8_15_MSB);
+
+			writel(0x22222222,
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_0_7_MSB);
+			writel(0x02222222,
+			       fd->fd_base + FLD_PL_IN_BASE_ADDR_3_8_15_MSB);
+
+			writel(0x22222222,
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_0_7_MSB);
+			writel(0x02222222,
+			       fd->fd_base + FLD_SH_IN_BASE_ADDR_8_15_MSB);
+
+			writel(0x02000000,
+			       fd->fd_base + FLD_BS_IN_BASE_ADDR_8_15_MSB);
+
+			writel(0x22222222,
+			       fd->fd_base + FLD_BASE_ADDR_FACE_0_7_MSB);
+			writel(0x02222222,
+			       fd->fd_base + FLD_BASE_ADDR_FACE_8_14_MSB);
+			writel(0x00000002,
+			       fd->fd_base + FLD_TR_OUT_BASE_ADDR_0_MSB);
+			writel(0x00000002,
+			       fd->fd_base + FLD_PP_OUT_BASE_ADDR_0_MSB);
+
+			/*fld mode + trigger start*/
+			writel(0x11, fd->fd_base + AIE_START_REG);
+		}
+	}
+}
+
+void aie_irqhandle(struct mtk_aie_dev *fd)
+{
+	writel(0x0, fd->fd_base + AIE_START_REG);
+
+	/* interrupt read clear */
+	readl(fd->fd_base + AIE_INT_REG);
+}
+
+static u16 aie_get_hi16(unsigned int value)
+{
+	return (value & 0xFFFF0000) >> 16;
+}
+
+static u16 aie_get_lo16(unsigned int value)
+{
+	return value & 0xFFFF;
+}
+
+static signed short aie_refine_s16_value(signed short value)
+{
+	s16 result = 0;
+
+	if ((value & 0x200) >> 9)
+		result = (value | 0xFE00);
+	else
+		result = value;
+
+	return result;
+}
+
+/* return aie_cfg to user space */
+void aie_get_fd_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
+{
+	void *fd_pym_result[PYM_NUM] = { NULL, NULL, NULL };
+	unsigned int *pto12 = NULL;
+	unsigned int i = 0, j = 0;
+	struct FDRESULT *prst = NULL;
+	signed short landmark = 0;
+	struct aie_enq_info *tmp_aie_cfg = NULL;
+	u32 fd_result_hw = 0, fd_result_1_hw = 0;
+	u32 fd_total_num = 0;
+	u32 fd_pyramid_num[PYM_NUM] = { 0, 0, 0 };
+
+	aie_cfg->sel_mode = fd->base_para->sel_mode;
+	aie_cfg->rotate_degree = fd->base_para->rotate_degree;
+	aie_cfg->src_img_addr = fd->base_para->src_img_addr;
+	aie_cfg->src_img_addr_uv = fd->base_para->src_img_addr_uv;
+	aie_cfg->src_img_width = fd->base_para->img_width;
+	aie_cfg->src_img_height = fd->base_para->img_height;
+	aie_cfg->src_img_fmt = fd->base_para->src_img_fmt;
+	aie_cfg->fd_version = FD_VERSION;
+	aie_cfg->attr_version = ATTR_VERSION;
+
+	aie_cfg->irq_status = readl(fd->fd_base + AIE_INT_EN_REG);
+
+	fd_result_hw = fd->reg_cfg.hw_result;
+	fd_result_1_hw = fd->reg_cfg.hw_result1;
+	fd_total_num = fd_result_hw & 0xFFF;
+	fd_pyramid_num[0] = (fd_result_hw & 0xFFF0000) >> 16;
+	fd_pyramid_num[1] = fd_result_1_hw & 0xFFF;
+	fd_pyramid_num[2] = (fd_result_1_hw & 0xFFF0000) >> 16;
+
+	if (fd_total_num == 0)
+		goto nothing_out;
+
+	tmp_aie_cfg =  aie_cfg;
+
+	tmp_aie_cfg->fd_out.fd_total_num = fd_total_num;
+	tmp_aie_cfg->fd_out.fd_pyramid0_num = fd_pyramid_num[0];
+	tmp_aie_cfg->fd_out.fd_pyramid1_num = fd_pyramid_num[1];
+	tmp_aie_cfg->fd_out.fd_pyramid2_num = fd_pyramid_num[2];
+
+	switch (tmp_aie_cfg->number_of_pyramid) {
+	case 1:
+		fd_pym_result[2] = fd->dma_para->fd_out_hw_va[RPN0_LOOP_NUM][0];
+		break;
+	case 2:
+		fd_pym_result[1] = fd->dma_para->fd_out_hw_va[RPN0_LOOP_NUM][0];
+		fd_pym_result[2] = fd->dma_para->fd_out_hw_va[RPN1_LOOP_NUM][0];
+		break;
+	case 3:
+		fd_pym_result[0] = fd->dma_para->fd_out_hw_va[RPN0_LOOP_NUM][0];
+		fd_pym_result[1] = fd->dma_para->fd_out_hw_va[RPN1_LOOP_NUM][0];
+		fd_pym_result[2] = fd->dma_para->fd_out_hw_va[RPN2_LOOP_NUM][0];
+		break;
+	default:
+		dev_err(fd->dev, "Wrong number_of_pyramid\n");
+		goto nothing_out;
+	}
+
+	for (i = 0; i < 3; i++) {
+		for (j = 0; j < fd_pyramid_num[i]; j++) {
+			if (i == 0)
+				prst = &tmp_aie_cfg->fd_out.PYRAMID0_RESULT;
+			else if (i == 1)
+				prst = &tmp_aie_cfg->fd_out.PYRAMID1_RESULT;
+			else if (i == 2)
+				prst = &tmp_aie_cfg->fd_out.PYRAMID2_RESULT;
+
+			pto12 = (unsigned int *)fd_pym_result[i] + 12 * j;
+
+			prst->anchor_x0[j] = aie_get_lo16(*(pto12 + 0));
+			prst->anchor_y0[j] = aie_get_hi16(*(pto12 + 0));
+			prst->anchor_x1[j] = aie_get_lo16(*(pto12 + 1));
+			prst->anchor_y1[j] = aie_get_hi16(*(pto12 + 1));
+
+			if (prst->anchor_x1[j] == 0 ||
+			    prst->anchor_y1[j] == 0) {
+				dev_err(fd->dev,
+					"wrong coordinate: i=%d j=%d M:%d %d %d %d\n",
+					i,
+					j,
+					prst->anchor_x0[j],
+					prst->anchor_x1[j],
+					prst->anchor_y0[j],
+					prst->anchor_y1[j]
+				);
+				goto nothing_out;
+			}
+
+			/* ROP result at 1st run */
+			landmark = (*(pto12 + 2) & 0x3FF);
+			prst->rop_landmark_score0[j] =
+				aie_refine_s16_value(landmark);
+			landmark = ((*(pto12 + 2) & 0xFFC00) >> 10);
+			prst->rop_landmark_score1[j] =
+				aie_refine_s16_value(landmark);
+			landmark = ((*(pto12 + 2) & 0x3FF00000) >> 20);
+			prst->rop_landmark_score2[j] =
+				aie_refine_s16_value(landmark);
+
+			prst->anchor_score[j] =
+				aie_refine_s16_value(*(pto12 + 9) & 0x3FF);
+
+			/* RIP result at 1st run */
+			landmark = ((*(pto12 + 9) & 0xFFC00) >> 10);
+			prst->rip_landmark_score0[j] =
+				aie_refine_s16_value(landmark);
+			landmark = ((*(pto12 + 9) & 0x3FF00000) >> 20);
+			prst->rip_landmark_score1[j] =
+				aie_refine_s16_value(landmark);
+			landmark = ((*(pto12 + 9) & 0xC0000000) >> 30) |
+				   ((*(pto12 + 10) & 0xFF) << 2);
+			prst->rip_landmark_score2[j] =
+				aie_refine_s16_value(landmark);
+			landmark = ((*(pto12 + 10) & 0x3FF00) >> 8);
+			prst->rip_landmark_score3[j] =
+				aie_refine_s16_value(landmark);
+			landmark = ((*(pto12 + 10) & 0xFFC0000) >> 18);
+			prst->rip_landmark_score4[j] =
+				aie_refine_s16_value(landmark);
+			landmark = ((*(pto12 + 10) & 0xF0000000) >> 28) |
+				   ((*(pto12 + 11) & 0x3F) << 4);
+			prst->rip_landmark_score5[j] =
+				aie_refine_s16_value(landmark);
+			landmark = ((*(pto12 + 11) & 0xFFC0) >> 6);
+			prst->rip_landmark_score6[j] =
+				aie_refine_s16_value(landmark);
+			prst->face_result_index[j] =
+				((*(pto12 + 11) & 0xFFF0000) >> 16);
+			prst->anchor_index[j] =
+				((*(pto12 + 11) & 0x70000000) >> 28);
+
+			prst->fd_partial_result = fd_pyramid_num[i];
+		}
+	}
+	return;
+nothing_out:
+	// Ensure that user mode does not receive an inappropriate result structure
+	memset(&aie_cfg->fd_out, 0, sizeof(struct fd_result));
+}
+
+void aie_get_attr_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
+{
+	u32 *attr_race_result = NULL, *attr_gender_result = NULL;
+	u32 *attr_age_result = NULL, *attr_is_indian_result = NULL;
+
+	aie_cfg->sel_mode = fd->attr_para->sel_mode[fd->attr_para->r_idx];
+	aie_cfg->rotate_degree =
+		fd->attr_para->rotate_degree[fd->attr_para->r_idx];
+	aie_cfg->src_img_addr =
+		fd->attr_para->src_img_addr[fd->attr_para->r_idx];
+	aie_cfg->src_img_addr_uv =
+		fd->attr_para->src_img_addr_uv[fd->attr_para->r_idx];
+	aie_cfg->src_img_width = fd->attr_para->img_width[fd->attr_para->r_idx];
+	aie_cfg->src_img_height =
+		fd->attr_para->img_height[fd->attr_para->r_idx];
+	aie_cfg->src_img_fmt = fd->attr_para->src_img_fmt[fd->attr_para->r_idx];
+	aie_cfg->fd_version = FD_VERSION;
+	aie_cfg->attr_version = ATTR_VERSION;
+
+	aie_cfg->irq_status = readl(fd->fd_base + AIE_INT_EN_REG);
+
+	/* 64 feature * 32 bytes */
+	attr_age_result =
+		(u32 *)fd->dma_para->age_out_hw_va[fd->attr_para->r_idx];
+	attr_gender_result =
+		(u32 *)fd->dma_para->gender_out_hw_va[fd->attr_para->r_idx];
+	attr_is_indian_result =
+		(u32 *)fd->dma_para->is_indian_out_hw_va[fd->attr_para->r_idx];
+	attr_race_result =
+		(u32 *)fd->dma_para->race_out_hw_va[fd->attr_para->r_idx];
+
+	aie_cfg->attr_out.MERGED_AGE_RESULT.RESULT[0] =
+		aie_get_lo16(*attr_age_result);
+	aie_cfg->attr_out.MERGED_AGE_RESULT.RESULT[1] =
+		aie_get_hi16(*attr_age_result);
+
+	aie_cfg->attr_out.MERGED_GENDER_RESULT.RESULT[0] =
+		aie_get_lo16(*attr_gender_result);
+	aie_cfg->attr_out.MERGED_GENDER_RESULT.RESULT[1] =
+		aie_get_hi16(*attr_gender_result);
+
+	aie_cfg->attr_out.MERGED_IS_INDIAN_RESULT.RESULT[0] =
+		aie_get_lo16(*attr_is_indian_result);
+	aie_cfg->attr_out.MERGED_IS_INDIAN_RESULT.RESULT[1] =
+		aie_get_hi16(*attr_is_indian_result);
+
+	aie_cfg->attr_out.MERGED_RACE_RESULT.RESULT[0] =
+		aie_get_lo16(*attr_race_result);
+	aie_cfg->attr_out.MERGED_RACE_RESULT.RESULT[1] =
+		aie_get_hi16(*attr_race_result);
+	aie_cfg->attr_out.MERGED_RACE_RESULT.RESULT[2] =
+		aie_get_lo16(*(attr_race_result + 1));
+
+	fd->attr_para->r_idx = (fd->attr_para->r_idx + 1) % MAX_ENQUE_FRAME_NUM;
+}
+
+void aie_get_fld_result(struct mtk_aie_dev *fd, struct aie_enq_info *aie_cfg)
+{
+	int i = 0, j = 0;
+	u16 *out_parsing = NULL;
+	u8 fld_rlt[FLD_MAX_FRAME][FLD_OUTPUT_SIZE];
+
+	aie_cfg->irq_status = readl(fd->fd_base + AIE_INT_EN_REG);
+
+	memcpy(fld_rlt, fd->fld_para->fld_output_va[0], sizeof(fld_rlt));
+
+	for (j = 0; j < aie_cfg->fld_face_num; j++) {
+		out_parsing = (unsigned short *)&fld_rlt[j][0];
+		for (i = 0; i < FLD_CUR_LANDMARK; i++) {
+			aie_cfg->fld_out[j].fld_landmark[i].x = *out_parsing;
+			aie_cfg->fld_out[j].fld_landmark[i].y =
+				*(out_parsing + 1);
+
+			if (i % 2)
+				out_parsing = out_parsing + 6;
+			else
+				out_parsing = out_parsing + 2;
+		}
+		out_parsing = (unsigned short *)&fld_rlt[j][0];
+		if (FLD_CUR_LANDMARK % 2)
+			out_parsing =
+				out_parsing + ((FLD_CUR_LANDMARK + 1) / 2) * 8;
+		else
+			out_parsing = out_parsing + (FLD_CUR_LANDMARK / 2) * 8;
+
+		aie_cfg->fld_out[j].fld_out_rop = *out_parsing;
+		aie_cfg->fld_out[j].fld_out_rip = *(out_parsing + 1);
+		aie_cfg->fld_out[j].confidence = *(out_parsing + 2);
+		aie_cfg->fld_out[j].blinkscore = *(out_parsing + 3);
+	}
+}
-- 
2.34.1


