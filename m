Return-Path: <linux-media+bounces-19317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 499E7996850
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 13:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739DB1F236A9
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 11:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B551940B3;
	Wed,  9 Oct 2024 11:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WTLLc3/v"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E40A1917E3;
	Wed,  9 Oct 2024 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472589; cv=none; b=nUcGsAy3FhSeUteLs/GkIgrJI8KohYNTbI3XPFS7elY0qT6V7c9luJF+oOocBGzbokEqtnDJepthHmDPSTNgLK6ocLq/1DBLkNPvTS5zE4n3PbpM8i2MibC1io70EA1idhRNShz7YUP4USxu8605zaUbfVf331f052z9hQAG04Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472589; c=relaxed/simple;
	bh=l7kxzYmLzNEGxMH//98GEqmqz7adRHeEjStw695dbzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P0QKmB/Cl8miGqZn5WsMxCMwB+UEwiEuY6yhR45B7CgvA57YU3ls6n5SIwntxxNe3tP5ZyI0QQEA0SVlTyskRmrRxIy7eFSNzSqTVfzjb9LiQR9IpOaiwd5zSIKm+ov0pFsyRTdntS7DEiAF0vkURpQHPxuW3O2wpJgh7movAf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WTLLc3/v; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e3243378862f11ef88ecadb115cee93b-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0VuqLarItLYDrY4ulRpQt6clWO5FgklO7PyHifwu5X0=;
	b=WTLLc3/vwpcE2aZvNfkQBDkuVik1RQ7oAef22xTEFLorYZaTjIS7Neaa5PNHY+aFHPfgBndBFT+4zE86auoqs4p93RZB9wbzuj76ojsnUtxa+eXQA6REqnX8CbYMKKwPkBI/FFvA3PPLsLuENNfIRERC1E0HLAn5OxIoiFiVKpM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:92f72cc9-0dd3-4e20-bbc6-8191ca0f9692,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:3a8a0041-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e3243378862f11ef88ecadb115cee93b-20241009
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <shu-hsiang.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1900561142; Wed, 09 Oct 2024 19:16:10 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 19:16:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:16:08 +0800
From: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>, <yunkec@chromium.org>, <shun-yi.wang@mediatek.com>,
	Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Subject: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Date: Wed, 9 Oct 2024 19:15:47 +0800
Message-ID: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--22.759400-8.000000
X-TMASE-MatchedRID: z3tGnJ59QgwjC5wW0aMJWG3NvezwBrVmNNuh+5zmS69fGNbhMhMRcpqb
	MiXJH8nx00qMv6F9X+6haDFxW9qw7zP6pt+J6m1m0C5BWPk1/EF1ZrYdf6+oJN9RlPzeVuQQkVx
	Pq+4YGBEtIcNCL+1lT7L0CwDGT5MlADAYgCjdKFvU3m2KoscyC7LiLKO9VZOi8rXw7/nLp58HiC
	Fmyfp2MIMsP+XBS+etzsaP39ElYThq+Lkur34drWxxOjnyr8CbFk73i4rVVIFBQfUgydCNn174o
	4FL+8GyQOM0NwAMF4k4FWFUYgGHGBF4l1oN/bmOB7TqRAYVohbbKTxp3+WtIDb9TB28UbkiEWEB
	IibfYRLZoTly3PGW4HNLZaN7B77MoT61G3YSs7mVOwZbcOalSwreImldQ5BDfc8MDDp7ngeEY2+
	qvfbJSbPFJkbfigk4TdO3nD4mIn8DcLqIJgk0tyYRREGYqtmUjiWciALpTNMY0A95tjAn+1UUam
	jc+3TC1KN/0FTZ6dFvKnkxoTqLSpLwwU+EaJP04RtSDjG+z7Auhg66Itb65ci9AjK6C8p1t9zUw
	xhckRFv/6+1g7VW3j0v5c2s0m9MAzA5lRc6UniHZXNSWjgdUzcah+QZUHeOOu8B7pM3AuUQtsfG
	305+H9gjcRUxmHvDjxdoJIBed+Um4SY1UdFN+Y+YSzwl92XTz+tKvxV+YbATb/3sT17MXM1Xk2r
	63LS+xkNDM5+z4N0t7QCTmkVcWc0C5Uci3F0GwVaayvK71l/QpOLaYmAnSNiQJkdS260msqi63S
	rtewlNZmYh6DtgzcfGGslQqEob932fm8yB1Z6eAiCmPx4NwGmRqNBHmBveg6X7YSXnSlqZv9WvR
	V/RbgtuKBGekqUpOlxBO2IcOBaUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--22.759400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	6D027AF76D068496F2B10E0E0B54BEED2A883E61A9E9DDB663CE0E552F10514F2000:8

Introduces utility files for the MediaTek ISP7.x camsys driver. These
utilities provide essential platform definitions, debugging tools, and
management functions to support ISP operations and SCP communication.
Key functionalities include:
1.Hardware pipeline and register definitions for managing image
processing modules.
2.DMA debugging utilities and buffer management functions.
3.Definitions of supported image formats for proper data handling.
4.IPI and SCP communication structures for module state management and
configuring ISP.
5.Metadata parameters for configuring image processing.

Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
---
 .../mediatek/isp/isp_7x/camsys/mtk_cam-defs.h |  168 ++
 .../isp/isp_7x/camsys/mtk_cam-dmadbg.h        |  721 +++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h  |   87 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h  |  233 ++
 .../isp/isp_7x/camsys/mtk_cam-meta-mt8188.h   | 2436 +++++++++++++++++
 .../isp/isp_7x/camsys/mtk_cam-plat-util.c     |  207 ++
 .../isp/isp_7x/camsys/mtk_cam-plat-util.h     |   16 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.c |  393 +++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.h |   28 +
 .../isp/isp_7x/camsys/mtk_cam-regs-mt8188.h   |  382 +++
 10 files changed, 4671 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-dmadbg.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h
new file mode 100644
index 000000000000..7d4ad189b9fc
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h
@@ -0,0 +1,168 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTKCAM_DEFS_H
+#define __MTKCAM_DEFS_H
+/**
+ *  This definition is for the following version:
+ *
+ *  MTK_CAM_IPI_VERSION_MAJOR: 0
+ *  MTK_CAM_IPI_VERSION_MINOR: 1
+ */
+
+#include <linux/types.h>
+#include "mtk_cam-fmt.h"
+
+/*
+ * Note:
+ *	Following definitions are used in IPI-messaging.
+ *	Values are used in software control flow only and cannot be applied to
+ *	hw registers directly.
+ */
+
+/* camsys hw pipelines */
+enum mtkcam_pipe_subdev {
+	MTKCAM_SUBDEV_RAW_START = 0,
+	MTKCAM_SUBDEV_RAW_0	= MTKCAM_SUBDEV_RAW_START,
+	MTKCAM_SUBDEV_RAW_1,
+	MTKCAM_SUBDEV_RAW_2,
+	MTKCAM_SUBDEV_RAW_END,
+	MTKCAM_SUBDEV_MAX = MTKCAM_SUBDEV_RAW_END,
+};
+
+#define MTKCAM_SUBDEV_RAW_MASK (BIT(MTKCAM_SUBDEV_RAW_0) | \
+				BIT(MTKCAM_SUBDEV_RAW_1) | \
+				BIT(MTKCAM_SUBDEV_RAW_2))
+
+static inline int is_raw_subdev(unsigned char subdev_id)
+{
+	return (subdev_id == MTKCAM_SUBDEV_RAW_0 ||
+		subdev_id == MTKCAM_SUBDEV_RAW_1 ||
+		subdev_id == MTKCAM_SUBDEV_RAW_2);
+}
+
+enum mtkcam_pipe_dev {
+	MTKCAM_PIPE_RAW_A	= 0,
+	MTKCAM_PIPE_RAW_B,
+	MTKCAM_PIPE_RAW_C,
+	MTKCAM_PIPE_MAX
+};
+
+enum mtkcam_ipi_raw_video_id {
+	MTKCAM_IPI_RAW_ID_UNKNOWN	= 0,
+	MTKCAM_IPI_RAW_RAWI_2,		/* RAWI_R2 */
+	MTKCAM_IPI_RAW_RAWI_3,		/* RAWI_R3 */
+	MTKCAM_IPI_RAW_RAWI_5,		/* RAWI_R5 */
+	MTKCAM_IPI_RAW_RAWI_6,		/* RAWI_R6 */
+	MTKCAM_IPI_RAW_IMGO,		/* IMGO_R1 */
+	MTKCAM_IPI_RAW_UFEO,		/* UFEO_R1 */
+	MTKCAM_IPI_RAW_RRZO,		/* RRZO_R1 */
+	MTKCAM_IPI_RAW_UFGO,		/* UFGO_R1 */
+	MTKCAM_IPI_RAW_YUVO_1,		/* YUVO_R1 */
+	MTKCAM_IPI_RAW_YUVO_2,		/* YUVO_R2 */
+	MTKCAM_IPI_RAW_YUVO_3,		/* YUVO_R3 */
+	MTKCAM_IPI_RAW_YUVO_4,		/* YUVO_R4 */
+	MTKCAM_IPI_RAW_YUVO_5,		/* YUVO_R5 */
+	MTKCAM_IPI_RAW_RZH1N2TO_2,	/* RZH1N2TO_R2 */
+	MTKCAM_IPI_RAW_DRZS4NO_1,	/* DRZS4NO_R1 */
+	MTKCAM_IPI_RAW_DRZS4NO_2,	/* DRZS4NO_R2 */
+	MTKCAM_IPI_RAW_DRZS4NO_3,	/* DRZS4NO_R3 */
+	MTKCAM_IPI_RAW_RZH1N2TO_3,	/* RZH1N2TO_R3 */
+	MTKCAM_IPI_RAW_RZH1N2TO_1,	/* RZH1N2TO_R1 */
+	MTKCAM_IPI_RAW_META_STATS_CFG,	/* All settings */
+	MTKCAM_IPI_RAW_META_STATS_0,	/* statistics */
+
+	/*
+	 * MTKCAM_IPI_RAW_META_STATS_1 is for AFO only, the buffer can be
+	 * dequeued once we got the  dma done.
+	 */
+	MTKCAM_IPI_RAW_META_STATS_1,
+
+	/* statistics may be pass to DIP */
+	MTKCAM_IPI_RAW_META_STATS_2,
+	MTKCAM_IPI_RAW_ID_MAX,
+};
+
+/* Supported bayer pixel order */
+enum mtkcam_ipi_bayer_pxl_id {
+	MTKCAM_IPI_BAYER_PXL_ID_B		= 0,
+	MTKCAM_IPI_BAYER_PXL_ID_GB		= 1,
+	MTKCAM_IPI_BAYER_PXL_ID_GR		= 2,
+	MTKCAM_IPI_BAYER_PXL_ID_R		= 3,
+	MTKCAM_IPI_BAYER_PXL_ID_UNKNOWN		= 4,
+};
+
+/* special input patterns */
+enum mtkcam_ipi_sensor_pattern {
+	MTKCAM_IPI_SENSOR_PATTERN_NORMAL		= 0,
+	MTKCAM_IPI_SENSOR_PATTERN_DUAL_PIX		= 1,
+	MTKCAM_IPI_SENSOR_PATTERN_QUADCODE		= 2,
+	MTKCAM_IPI_SENSOR_PATTERN_4CELL			= 3,
+	MTKCAM_IPI_SENSOR_PATTERN_MONO			= 4,
+	MTKCAM_IPI_SENSOR_PATTERN_IVHDR			= 5,
+	MTKCAM_IPI_SENSOR_PATTERN_ZVHDR			= 6,
+	MTKCAM_IPI_SENSOR_PATTERN_4CELL_IVHDR		= 7,
+	MTKCAM_IPI_SENSOR_PATTERN_4CELL_ZVHDR		= 8,
+	MTKCAM_IPI_SENSOR_PATTERN_DUAL_PIX_IVHDR	= 9,
+	MTKCAM_IPI_SENSOR_PATTERN_DUAL_PIX_ZVHDR	= 10,
+	MTKCAM_IPI_SENSOR_PATTERN_YUV			= 11,
+	MTKCAM_IPI_SENSOR_PATTERN_NORMAL_PD		= 12,
+};
+
+enum mtkcam_ipi_raw_path_control {
+	MTKCAM_IPI_IMGO_UNPROCESSED		= 0,
+	MTKCAM_IPI_IMGO_AFTER_BPC,
+	MTKCAM_IPI_IMGO_AFTER_FRZ,
+	MTKCAM_IPI_IMGO_AFTER_FUS,
+	MTKCAM_IPI_IMGO_AFTER_DGN,
+	MTKCAM_IPI_IMGO_AFTER_LSC,
+	MTKCAM_IPI_IMGO_AFTER_HLR,
+	MTKCAM_IPI_IMGO_AFTER_LTM,
+	MTKCAM_IPI_IMGO_FULLY_PROCESSED = MTKCAM_IPI_IMGO_AFTER_LTM,
+};
+
+/* For LBIT_MODE G2 */
+enum mtkcam_ipi_sw_feature_control {
+	MTKCAM_IPI_SW_FEATURE_NORMAL		= 0,
+	/* Normal */
+};
+
+enum mtkcam_ipi_hw_path_control {
+	MTKCAM_IPI_HW_PATH_ON_THE_FLY			= 0,
+	/* TG direct link */
+	MTKCAM_IPI_HW_PATH_ON_THE_FLY_M2M		= 1,
+	/* On device tuning */
+	MTKCAM_IPI_HW_PATH_OFFLINE_M2M			= 7,
+	/* SW trigger rawi */
+};
+
+enum mtkcam_ipi_meta_valid_num_control {
+	MTKCAM_IPI_FBCX_AAO = 0,
+	MTKCAM_IPI_FBCX_AAHO,
+	MTKCAM_IPI_FBCX_AFO,
+	MTKCAM_IPI_FBCX_TSFSO_1,
+	MTKCAM_IPI_FBCX_TSFSO_2,
+	MTKCAM_IPI_FBCX_LTMSO,
+	MTKCAM_IPI_FBCX_FLKO,
+	MTKCAM_IPI_FBCX_ACTSO,
+	MTKCAM_IPI_FBCX_PDO,
+	MTKCAM_IPI_FBCX_TNCSYO,
+	MTKCAM_IPI_FBCX_RZH1N2TO_R1,
+	MTKCAM_IPI_FBCX_RZH1N2TO_R2,
+	MTKCAM_IPI_FBCX_RZH1N2TO_R3,
+	MTKCAM_IPI_FBCX_LAST,
+};
+
+enum {
+	BIN_AUTO	= 0,
+	BIN_OFF		= BIN_AUTO,
+	BIN_ON		= (1 << 0),
+	CBN_2X2_ON	= (1 << 4),
+	CBN_3X3_ON	= (1 << 5),
+	CBN_4X4_ON	= (1 << 6),
+	QBND_ON		= (1 << 8)
+};
+
+#endif /* __MTKCAM_DEFS_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-dmadbg.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-dmadbg.h
new file mode 100644
index 000000000000..83e92316add6
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-dmadbg.h
@@ -0,0 +1,721 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_RAW_DMADBG_H
+#define __MTK_CAM_RAW_DMADBG_H
+
+#include "mtk_cam-raw_debug.h"
+
+static __maybe_unused struct dma_debug_item dbg_RAWI_R2[] = {
+	{0x00000000, "rawi_r2 32(hex) 0000"},
+	{0x00000100, "rawi_r2 state_checksum"},
+	{0x00000200, "rawi_r2 line_pix_cnt_tmp"},
+	{0x00000300, "rawi_r2 line_pix_cnt"},
+	{0x00000500, "rawi_r2 smi_debug_data (case 0)"},
+	{0x00010600, "rawi_r2 aff(fifo)_debug_data (case 1)"},
+	{0x00030600, "rawi_r2 aff(fifo)_debug_data (case 3)"},
+	{0x01000040, "rawi_r2_smi / plane-0 / data-crc"},
+	{0x01000041, "rawi_r2_smi / plane-0 / addr-crc"},
+	{0x00000080, "rawi_r2_smi / smi_latency_mon output"},
+	{0x000000A0, "rawi_r2_smi / plane-0 / { len-cnt, dle-cnt }"},
+	{0x000000C0, "rawi_r2_smi / plane-0 / maddr_max record"},
+	{0x000000C1, "rawi_r2_smi / plane-0 / maddr_min record"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_RAWI_R2_UFD[] = {
+	{0x00000001, "rawi_r2 ufd 32(hex) 0000"},
+	{0x00000101, "rawi_r2 ufd state_checksum"},
+	{0x00000201, "rawi_r2 ufd line_pix_cnt_tmp"},
+	{0x00000301, "rawi_r2 ufd line_pix_cnt"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_RAWI_R3[] = {
+	{0x00000003, "rawi_r3 32(hex) 0000"},
+	{0x00000103, "rawi_r3 state_checksum"},
+	{0x00000203, "rawi_r3 line_pix_cnt_tmp"},
+	{0x00000303, "rawi_r3 line_pix_cnt"},
+	{0x00000503, "rawi_r3 smi_debug_data (case 0)"},
+	{0x00010603, "rawi_r3 aff(fifo)_debug_data (case 1)"},
+	{0x00030603, "rawi_r3 aff(fifo)_debug_data (case 3)"},
+	{0x01000043, "rawi_r3_smi / plane-0 / data-crc"},
+	{0x01000044, "rawi_r3_smi / plane-0 / addr-crc"},
+	{0x00000082, "rawi_r3_smi / smi_latency_mon output"},
+	{0x000000A2, "rawi_r3_smi / plane-0 / { len-cnt, dle-cnt }"},
+	{0x000002C0, "rawi_r3_smi / plane-0 / maddr_max record"},
+	{0x000002C1, "rawi_r3_smi / plane-0 / maddr_min record"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_IMGO_R1[] = {
+	{0x00000019, "imgo_r1 32(hex) 0000"},
+	{0x00000119, "imgo_r1 state_checksum"},
+	{0x00000219, "imgo_r1 line_pix_cnt_tmp"},
+	{0x00000319, "imgo_r1 line_pix_cnt"},
+	{0x00000819, "imgo_r1 smi_debug_data (case 0)"},
+	{0x00010719, "imgo_r1 aff(fifo)_debug_data (case 1)"},
+	{0x00030719, "imgo_r1 aff(fifo)_debug_data (case 3)"},
+
+	{0x01000059, "imgo_r1_smi / plane-0 - imgo_r1 / data-crc"},
+
+	{0x0000008B, "imgo_r1_smi / smi_latency_mon output"},
+
+	{0x000000AB, "imgo_r1_smi / plane-0 / {len-cnt, dle-cnt}"},
+	{0x000000AC, "imgo_r1_smi / plane-0 / {load_com-cnt, bvalid-cnt}"},
+
+	{0x000013C0, "imgo_r1_smi / plane-0 / maddr_max record"},
+	{0x000013C1, "imgo_r1_smi / plane-0 / maddr_min record"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_AAHO_R1[] = {
+	{0x0000001B, "32(hex) 0000"},
+	{0x0000011B, "state_checksum"},
+	{0x0000021B, "line_pix_cnt_tmp"},
+	{0x0000031B, "line_pix_cnt"},
+	{0x0000081B, "smi_debug_data (case 0)"},
+	{0x0001071B, "aff(fifo)_debug_data (case 1)"},
+	{0x0003071B, "aff(fifo)_debug_data (case 3)"},
+
+	{0x0100005B, "fho_r1_smi / plane-1 - aaho_r1 / data-crc"},
+
+	{0x000000AD, "fho_r1_smi / plane-0 - fho_r1 / len-cnt, dle-cnt"},
+	{0x000000AE, "fho_r1_smi / plane-0 - fho_r1 / load_com-cnt, bvalid-cnt"},
+	{0x000000AF, "fho_r1_smi / plane-1 - aaho_r1 / len-cnt, dle-cnt"},
+	{0x000000B0, "fho_r1_smi / plane-1 - aaho_r1 / load_com-cnt, bvalid-cnt"},
+	{0x000000B1, "fho_r1_smi / plane-2 - pdo_r1 / len-cnt, dle-cnt"},
+	{0x000000B2, "fho_r1_smi / plane-2 - pdo_r1 / load_com-cnt, bvalid-cnt"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_PDO_R1[] = {
+	{0x0000001C, "32(hex) 0000"},
+	{0x0000011C, "state_checksum"},
+	{0x0000021C, "line_pix_cnt_tmp"},
+	{0x0000031C, "line_pix_cnt"},
+	{0x0000081C, "smi_debug_data (case 0)"},
+	{0x0001071C, "aff(fifo)_debug_data (case 1)"},
+	{0x0003071C, "aff(fifo)_debug_data (case 3)"},
+
+	{0x000000AD, "fho_r1_smi / plane-0 - fho_r1 / len-cnt, dle-cnt"},
+	{0x000000AE, "fho_r1_smi / plane-0 - fho_r1 / load_com-cnt, bvalid-cnt"},
+	{0x000000AF, "fho_r1_smi / plane-1 - aaho_r1 / len-cnt, dle-cnt"},
+	{0x000000B0, "fho_r1_smi / plane-1 - aaho_r1 / load_com-cnt, bvalid-cnt"},
+	{0x000000B1, "fho_r1_smi / plane-2 - pdo_r1 / len-cnt, dle-cnt"},
+	{0x000000B2, "fho_r1_smi / plane-2 - pdo_r1 / load_com-cnt, bvalid-cnt"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_PDI_R1[] = {
+	{0x00000014, "pdi_r1 32(hex) 0000"},
+	{0x00000114, "pdi_r1 state_checksum"},
+	{0x00000214, "pdi_r1 line_pix_cnt_tmp"},
+	{0x00000314, "pdi_r1 line_pix_cnt"},
+	{0x00000414, "pdi_r1 important_status"},
+	{0x00000514, "pdi_r1 cmd_data_cnt"},
+	{0x00000614, "pdi_r1 tilex_byte_cnt"},
+	{0x00000714, "pdi_r1 tiley_cnt"},
+	{0x00000814, "pdi_r1 burst_line_cnt"},
+};
+
+// M4U_PORT CAM3_YUVO_R1: yuvo_r1 + yuvbo_r1
+static __maybe_unused struct dma_debug_item dbg_YUVO_R1[] = {
+	{0x00000000, "yuvo_r1 32(hex) 0000"},
+	{0x00000100, "yuvo_r1 state_checksum"},
+	{0x00000200, "yuvo_r1 line_pix_cnt_tmp"},
+	{0x00000300, "yuvo_r1 line_pix_cnt"},
+	{0x00000800, "yuvo_r1 smi_debug_data (case 0)"},
+	{0x00010700, "yuvo_r1 aff(fifo)_debug_data (case 1)"},
+	{0x00030700, "yuvo_r1 aff(fifo)_debug_data (case 3)"},
+
+	{0x00000001, "yuvbo_r1 32(hex) 0000"},
+	{0x00000101, "yuvbo_r1 state_checksum"},
+	{0x00000201, "yuvbo_r1 line_pix_cnt_tmp"},
+	{0x00000301, "yuvbo_r1 line_pix_cnt"},
+	{0x00000801, "yuvbo_r1 smi_debug_data (case 0)"},
+	{0x00010701, "yuvbo_r1 aff(fifo)_debug_data (case 1)"},
+	{0x00030701, "yuvbo_r1 aff(fifo)_debug_data (case 3)"},
+
+	{0x01000040, "yuvo_r1_smi / plane-0 - yuvo_r1 / data-crc"},
+	{0x01000041, "yuvo_r1_smi / plane-1 - yuvbo_r1 / data-crc"},
+
+	{0x00000080, "yuvo_r1_smi / smi_latency_mon output"},
+
+	{0x000000AD, "yuvo_r1_smi / plane-0 - yuvo_r1 / { len-cnt, dle-cnt }"},
+	{0x000000AE, "yuvo_r1_smi / plane-0 - yuvo_r1 / { load_com-cnt, bvalid-cnt }"},
+	{0x000000AF, "yuvo_r1_smi / plane-1 - yuvbo_r1 / { len-cnt, dle-cnt }"},
+	{0x000000B0, "yuvo_r1_smi / plane-1 - yuvbo_r1 / { load_com-cnt, bvalid-cnt }"},
+
+	{0x000000C0,
+	 "yuvo_r1_smi / plane-0 - yuvo_r1_smi / plane-0 - yuvo_r1 / maddr_max"},
+	{0x000000C1,
+	 "yuvo_r1_smi / plane-0 - yuvo_r1_smi / plane-0 - yuvo_r1 / maddr_min"},
+	{0x000001C0,
+	 "yuvo_r1_smi / plane-1 - yuvo_r1_smi / plane-0 - yuvbo_r1 / maddr_max"},
+	{0x000001C1,
+	 "yuvo_r1_smi / plane-1 - yuvo_r1_smi / plane-0 - yuvbo_r1 / maddr_min"},
+};
+
+// M4U_PORT CAM3_YUVO_R3: yuvo_r3 + yuvbo_r3
+static __maybe_unused struct dma_debug_item dbg_YUVO_R3[] = {
+	{0x00000004, "yuvo_r3 32(hex) 0000"},
+	{0x00000104, "yuvo_r3 state_checksum"},
+	{0x00000204, "yuvo_r3 line_pix_cnt_tmp"},
+	{0x00000304, "yuvo_r3 line_pix_cnt"},
+	{0x00000804, "smi_debug_data (case 0)"},
+	{0x00010704, "aff(fifo)_debug_data (case 1)"},
+	{0x00030704, "aff(fifo)_debug_data (case 3)"},
+
+	{0x00000005, "yuvbo_r3 32(hex) 0000"},
+	{0x00000105, "yuvbo_r3 state_checksum"},
+	{0x00000205, "yuvbo_r3 line_pix_cnt_tmp"},
+	{0x00000305, "yuvbo_r3 line_pix_cnt"},
+	{0x00000805, "yuvbo_r3 smi_debug_data (case 0)"},
+	{0x00010705, "yuvbo_r3 aff(fifo)_debug_data (case 1)"},
+	{0x00030705, "yuvbo_r3 aff(fifo)_debug_data (case 3)"},
+
+	{0x01000042, "yuvo_r3_smi / plane-0 - yuvo_r3 / data-crc"},
+	{0x01000043, "yuvo_r3_smi / plane-1 - yuvbo_r1 / data-crc"},
+
+	{0x00000081, "yuvo_r3_smi / smi_latency_mon output"},
+
+	{0x000000B1, "yuvo_r3_smi / plane-0 - yuvo_r3 / { len-cnt, dle-cnt }"},
+	{0x000000B2, "yuvo_r3_smi / plane-0 - yuvo_r3 / { load_com-cnt, bvalid-cnt }"},
+	{0x000000B3, "yuvo_r3_smi / plane-1 - yuvbo_r3 / { len-cnt, dle-cnt }"},
+	{0x000000B4, "yuvo_r3_smi / plane-1 - yuvbo_r3 / { load_com-cnt, bvalid-cnt }"},
+
+	{0x000002C0,
+	 "yuvo_r3_smi / plane-0 - yuvo_r3_smi / plane-0 - yuvo_r3 / maddr_max"},
+	{0x000002C1,
+	 "yuvo_r3_smi / plane-0 - yuvo_r3_smi / plane-0 - yuvo_r3 / maddr_min"},
+	{0x000003C0,
+	 "yuvo_r3_smi / plane-1 - yuvo_r3_smi / plane-0 - yuvbo_r3 / maddr_max"},
+	{0x000003C1,
+	 "yuvo_r3_smi / plane-1 - yuvo_r3_smi / plane-0 - yuvbo_r3 / maddr_min"},
+};
+
+// M4U_PORT CAM3_YUVCO_R1: yuvco_r1 + yuvdo_r1 + yuvco_r3 + yuvdo_r3
+static __maybe_unused struct dma_debug_item dbg_YUVCO_R1[] = {
+	{0x00000002, "yuvco_r1 32(hex) 0000"},
+	{0x00000102, "yuvco_r1 state_checksum"},
+	{0x00000202, "yuvco_r1 line_pix_cnt_tmp"},
+	{0x00000302, "yuvco_r1 line_pix_cnt"},
+	{0x00000802, "yuvco_r1 smi_debug_data (case 0)"},
+	{0x00010702, "yuvco_r1 aff(fifo)_debug_data (case 1)"},
+	{0x00030702, "yuvco_r1 aff(fifo)_debug_data (case 3)"},
+
+	{0x00000003, "yuvdo_r1 32(hex) 0000"},
+	{0x00000103, "yuvdo_r1 state_checksum"},
+	{0x00000203, "yuvdo_r1 line_pix_cnt_tmp"},
+	{0x00000303, "yuvdo_r1 line_pix_cnt"},
+	{0x00000803, "yuvdo_r1 smi_debug_data (case 0)"},
+	{0x00010703, "yuvdo_r1 aff(fifo)_debug_data (case 1)"},
+	{0x00030703, "yuvdo_r1 aff(fifo)_debug_data (case 3)"},
+
+	{0x01000044, "yuvco_r1_smi / plane-0 - yuvco_r1 / data-crc"},
+	{0x01000045, "yuvco_r1_smi / plane-1 - yuvco_r1 / data-crc"},
+	{0x01000046, "yuvco_r1_smi / plane-2 - yuvco_r1 / data-crc"},
+	{0x01000047, "yuvco_r1_smi / plane-3 - yuvco_r1 / data-crc"},
+
+	{0x00000082, "yuvco_r1_smi / smi_latency_mon output"},
+
+	{0x000004C0,
+	 "yuvco_r1_smi / plane-0 - yuvco_r1_smi / plane-0 - yuvco_r1 / maddr_max"},
+	{0x000004C1,
+	 "yuvco_r1_smi / plane-0 - yuvco_r1_smi / plane-0 - yuvco_r1 / maddr_min"},
+	{0x000005C0,
+	 "yuvco_r1_smi / plane-1 - yuvco_r1_smi / plane-0 - yuvdo_r1 / maddr_max"},
+	{0x000005C1,
+	 "yuvco_r1_smi / plane-1 - yuvco_r1_smi / plane-0 - yuvdo_r1 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_YUVCO_R3[] = {
+	{0x00000006, "yuvco_r3 32(hex) 0000"},
+	{0x00000106, "yuvco_r3 state_checksum"},
+	{0x00000206, "yuvco_r3 line_pix_cnt_tmp"},
+	{0x00000306, "yuvco_r3 line_pix_cnt"},
+	{0x00000806, "yuvco_r3 smi_debug_data (case 0)"},
+	{0x00010706, "yuvco_r3 aff(fifo)_debug_data (case 1)"},
+	{0x00030706, "yuvco_r3 aff(fifo)_debug_data (case 3)"},
+
+	{0x00000007, "yuvdo_r3 32(hex) 0000"},
+	{0x00000107, "yuvdo_r3 state_checksum"},
+	{0x00000207, "yuvdo_r3 line_pix_cnt_tmp"},
+	{0x00000307, "yuvdo_r3 line_pix_cnt"},
+	{0x00000807, "yuvdo_r3 smi_debug_data (case 0)"},
+	{0x00010707, "yuvdo_r3 aff(fifo)_debug_data (case 1)"},
+	{0x00030707, "yuvdo_r3 aff(fifo)_debug_data (case 3)"},
+
+	{0x01000044, "yuvco_r1_smi / plane-0 - yuvco_r1 / data-crc"},
+	{0x01000045, "yuvco_r1_smi / plane-1 - yuvco_r1 / data-crc"},
+	{0x01000046, "yuvco_r1_smi / plane-2 - yuvco_r1 / data-crc"},
+	{0x01000047, "yuvco_r1_smi / plane-3 - yuvco_r1 / data-crc"},
+
+	{0x00000082, "yuvco_r1_smi / smi_latency_mon output"},
+
+	{0x000006C0,
+	 "yuvco_r1_smi / plane-2 - yuvco_r1_smi / plane-0 - yuvco_r3 / maddr_max"},
+	{0x000006C1,
+	 "yuvco_r1_smi / plane-2 - yuvco_r1_smi / plane-0 - yuvco_r3 / maddr_max"},
+	{0x000007C0,
+	 "yuvco_r1_smi / plane-3 - yuvco_r1_smi / plane-0 - yuvdo_r3 / maddr_max"},
+	{0x000007C1,
+	 "yuvco_r1_smi / plane-3 - yuvco_r1_smi / plane-0 - yuvdo_r3 / maddr_min"},
+};
+
+// M4U_PORT CAM3_YUVO_R2: yuvo_r2 + yuvbo_r2 + yuvo_r4 + yuvbo_r4 + yuvo_r5 + yuvbo_r5
+static __maybe_unused struct dma_debug_item dbg_YUVO_R2[] = {
+	{0x00000008, "yuvo_r2 32(hex) 0000"},
+	{0x00000108, "yuvo_r2 state_checksum"},
+	{0x00000208, "yuvo_r2 line_pix_cnt_tmp"},
+	{0x00000308, "yuvo_r2 line_pix_cnt"},
+	{0x00000408, "yuvo_r2 important_status"},
+	{0x00000508, "yuvo_r2 cmd_data_cnt"},
+	{0x00000608, "yuvo_r2 cmd_cnt_for_bvalid_phase"},
+	{0x00000708, "yuvo_r2 input_h_cnt"},
+	{0x00000808, "yuvo_r2 input_v_cnt"},
+	{0x00000908, "yuvo_r2 xfer_y_cnt"},
+
+	{0x00000009, "yuvbo_r2 32(hex) 0000"},
+	{0x00000109, "yuvbo_r2 state_checksum"},
+	{0x00000209, "yuvbo_r2 line_pix_cnt_tmp"},
+	{0x00000309, "yuvbo_r2 line_pix_cnt"},
+	{0x00000409, "yuvbo_r2 important_status"},
+	{0x00000509, "yuvbo_r2 cmd_data_cnt"},
+	{0x00000609, "yuvbo_r2 cmd_cnt_for_bvalid_phase"},
+	{0x00000709, "yuvbo_r2 input_h_cnt"},
+	{0x00000809, "yuvbo_r2 input_v_cnt"},
+	{0x00000909, "yuvbo_r2 xfer_y_cnt"},
+
+	{0x01000048, "yuvo_r2_smi / plane-0 - yuvo_r2 / data-crc"},
+	{0x01000049, "yuvo_r2_smi / plane-1 - yuvbo_r2 / data-crc"},
+
+	{0x00000083, "yuvo_r2_smi / smi_latency_mon output"},
+
+	{0x000008C0,
+	 "yuvo_r2_smi / plane-0 - yuvo_r2_smi / plane-1 - cqi_r3 / maddr_max"},
+	{0x000008C1,
+	 "yuvo_r2_smi / plane-0 - yuvo_r2_smi / plane-1 - cqi_r3 / maddr_min"},
+	{0x000009C0,
+	 "yuvo_r2_smi / plane-1 - yuvo_r2_smi / plane-1 - cqi_r4 / maddr_max"},
+	{0x000009C1,
+	 "yuvo_r2_smi / plane-1 - yuvo_r2_smi / plane-1 - cqi_r4 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_YUVO_R4[] = {
+	{0x0000000A, "yuvo_r4 32(hex) 0000"},
+	{0x0000010A, "yuvo_r4 state_checksum"},
+	{0x0000020A, "yuvo_r4 line_pix_cnt_tmp"},
+	{0x0000030A, "yuvo_r4 line_pix_cnt"},
+	{0x0000040A, "yuvo_r4 important_status"},
+	{0x0000050A, "yuvo_r4 cmd_data_cnt"},
+	{0x0000060A, "yuvo_r4 cmd_cnt_for_bvalid_phase"},
+	{0x0000070A, "yuvo_r4 input_h_cnt"},
+	{0x0000080A, "yuvo_r4 input_v_cnt"},
+	{0x0000090A, "yuvo_r4 xfer_y_cnt"},
+
+	{0x0000000B, "yuvbo_r4 32(hex) 0000"},
+	{0x0000010B, "yuvbo_r4 state_checksum"},
+	{0x0000020B, "yuvbo_r4 line_pix_cnt_tmp"},
+	{0x0000030B, "yuvbo_r4 line_pix_cnt"},
+	{0x0000040B, "yuvbo_r4 important_status"},
+	{0x0000050B, "yuvbo_r4 cmd_data_cnt"},
+	{0x0000060B, "yuvbo_r4 cmd_cnt_for_bvalid_phase"},
+	{0x0000070B, "yuvbo_r4 input_h_cnt"},
+	{0x0000080B, "yuvbo_r4 input_v_cnt"},
+	{0x0000090B, "yuvbo_r4 xfer_y_cnt"},
+
+	{0x0100004A, "yuvo_r2_smi / plane-2 - yuvo_r4 / data-crc"},
+	{0x0100004B, "yuvo_r2_smi / plane-3 - yuvbo_r4 / data-crc"},
+
+	{0x00000083, "yuvo_r2_smi / smi_latency_mon output"},
+
+	{0x00000AC0,
+	 "yuvo_r2_smi / plane-2 - yuvo_r2_smi / plane-0 - lsci_r1 / maddr_max"},
+	{0x00000AC1,
+	 "yuvo_r2_smi / plane-2 - yuvo_r2_smi / plane-0 - lsci_r1 / maddr_min"},
+	{0x00000BC0,
+	 "yuvo_r2_smi / plane-3 - yuvo_r2_smi / plane-0 - bpci_r1 / maddr_max"},
+	{0x00000BC1,
+	 "yuvo_r2_smi / plane-3 - yuvo_r2_smi / plane-0 - bpci_r1 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_YUVO_R5[] = {
+	{0x0000000C, "yuvo_r5 32(hex) 0000"},
+	{0x0000010C, "yuvo_r5 state_checksum"},
+	{0x0000020C, "yuvo_r5 line_pix_cnt_tmp"},
+	{0x0000030C, "yuvo_r5 line_pix_cnt"},
+	{0x0000040C, "yuvo_r5 important_status"},
+	{0x0000050C, "yuvo_r5 cmd_data_cnt"},
+	{0x0000060C, "yuvo_r5 cmd_cnt_for_bvalid_phase"},
+	{0x0000070C, "yuvo_r5 input_h_cnt"},
+	{0x0000080C, "yuvo_r5 input_v_cnt"},
+	{0x0000090C, "yuvo_r5 xfer_y_cnt"},
+
+	{0x0000000D, "yuvbo_r5 32(hex) 0000"},
+	{0x0000010D, "yuvbo_r5 state_checksum"},
+	{0x0000020D, "yuvbo_r5 line_pix_cnt_tmp"},
+	{0x0000030D, "yuvbo_r5 line_pix_cnt"},
+	{0x0000040D, "yuvbo_r5 important_status"},
+	{0x0000050D, "yuvbo_r5 cmd_data_cnt"},
+	{0x0000060D, "yuvbo_r5 cmd_cnt_for_bvalid_phase"},
+	{0x0000070D, "yuvbo_r5 input_h_cnt"},
+	{0x0000080D, "yuvbo_r5 input_v_cnt"},
+	{0x0000090D, "yuvbo_r5 xfer_y_cnt"},
+
+	{0x0100004C, "yuvo_r2_smi / plane-4 - yuvo_r5 / data-crc"},
+	{0x0100004D, "yuvo_r2_smi / plane-5 - yuvbo_r5 / data-crc"},
+
+	{0x00000083, "yuvo_r2_smi / smi_latency_mon output"},
+
+	{0x00000CC0,
+	 "yuvo_r2_smi / plane-4 - yuvo_r2_smi / plane-1 - bpci_r2 / maddr_max"},
+	{0x00000CC1,
+	 "yuvo_r2_smi / plane-4 - yuvo_r2_smi / plane-1 - bpci_r2 / maddr_min"},
+	{0x00000DC0,
+	 "yuvo_r2_smi / plane-5 - yuvo_r2_smi / plane-2 - bpci_r3 / maddr_max"},
+	{0x00000DC1,
+	 "yuvo_r2_smi / plane-5 - yuvo_r2_smi / plane-2 - bpci_r3 / maddr_min"},
+};
+
+// M4U_PORT CAM3_RZH1N2TO_R1: rzh1n2to_r1 + rzh1n2tbo_r1 + rzh1n2to_r2 + rzh1n2to_r3 + rzh1n2tbo_r3
+static __maybe_unused struct dma_debug_item dbg_RZH1N2TO_R1[] = {
+	{0x0000000E, "rzh1n2to_r1 32(hex) 0000"},
+	{0x0000010E, "rzh1n2to_r1 state_checksum"},
+	{0x0000020E, "rzh1n2to_r1 line_pix_cnt_tmp"},
+	{0x0000030E, "rzh1n2to_r1 line_pix_cnt"},
+	{0x0000040E, "rzh1n2to_r1 important_status"},
+	{0x0000050E, "rzh1n2to_r1 cmd_data_cnt"},
+	{0x0000060E, "rzh1n2to_r1 cmd_cnt_for_bvalid_phase"},
+	{0x0000070E, "rzh1n2to_r1 input_h_cnt"},
+	{0x0000080E, "rzh1n2to_r1 input_v_cnt"},
+	{0x0000090E, "rzh1n2to_r1 xfer_y_cnt"},
+
+	{0x0000000F, "rzh1n2tbo_r1 32(hex) 0000"},
+	{0x0000010F, "rzh1n2tbo_r1 state_checksum"},
+	{0x0000020F, "rzh1n2tbo_r1 line_pix_cnt_tmp"},
+	{0x0000030F, "rzh1n2tbo_r1 line_pix_cnt"},
+	{0x0000040F, "rzh1n2tbo_r1 important_status"},
+	{0x0000050F, "rzh1n2tbo_r1 cmd_data_cnt"},
+	{0x0000060F, "rzh1n2tbo_r1 cmd_cnt_for_bvalid_phase"},
+	{0x0000070F, "rzh1n2tbo_r1 input_h_cnt"},
+	{0x0000080F, "rzh1n2tbo_r1 input_v_cnt"},
+	{0x0000090F, "rzh1n2tbo_r1 xfer_y_cnt"},
+
+	{0x00000084, "rzh1n2to_r1_smi / smi_latency_mon output"},
+
+	{0x00000EC0,
+	 "rzh1n2to_r1_smi / plane-0 - rzh1n2to_r1_smi / plane-3 - rzh1n2to_r1 / maddr_max"},
+	{0x00000EC1,
+	 "rzh1n2to_r1_smi / plane-0 - rzh1n2to_r1_smi / plane-3 - rzh1n2to_r1 / maddr_min"},
+	{0x00000FC0,
+	 "rzh1n2to_r1_smi / plane-1 - rzh1n2to_r1_smi / plane-4 - rzh1n2tbo_r1 / maddr_max"},
+	{0x00000FC1,
+	 "rzh1n2to_r1_smi / plane-1 - rzh1n2to_r1_smi / plane-4 - rzh1n2tbo_r1 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_RZH1N2TO_R2[] = {
+	{0x00000010, "rzh1n2to_r2 32(hex) 0000"},
+	{0x00000110, "rzh1n2to_r2 state_checksum"},
+	{0x00000210, "rzh1n2to_r2 line_pix_cnt_tmp"},
+	{0x00000310, "rzh1n2to_r2 line_pix_cnt"},
+	{0x00000410, "rzh1n2to_r2 important_status"},
+	{0x00000510, "rzh1n2to_r2 cmd_data_cnt"},
+	{0x00000610, "rzh1n2to_r2 cmd_cnt_for_bvalid_phase"},
+	{0x00000710, "rzh1n2to_r2 input_h_cnt"},
+	{0x00000810, "rzh1n2to_r2 input_v_cnt"},
+	{0x00000910, "rzh1n2to_r2 xfer_y_cnt"},
+
+	{0x01000050, "rzh1n2to_r1_smi / plane-2 - rzh1n2to_r2 / data-crc"},
+
+	{0x00000084, "rzh1n2to_r1_smi / smi_latency_mon output"},
+
+	{0x000010C0,
+	 "rzh1n2to_r1_smi / plane-2 - rzh1n2to_r1_smi / plane-0 - rzh1n2to_r2 / maddr_max"},
+	{0x000010C1,
+	 "rzh1n2to_r1_smi / plane-2 - rzh1n2to_r1_smi / plane-0 - rzh1n2to_r2 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_RZH1N2TO_R3[] = {
+	{0x00000011, "rzh1n2to_r3 32(hex) 0000"},
+	{0x00000111, "rzh1n2to_r3 state_checksum"},
+	{0x00000211, "rzh1n2to_r3 line_pix_cnt_tmp"},
+	{0x00000311, "rzh1n2to_r3 line_pix_cnt"},
+	{0x00000411, "rzh1n2to_r3 important_status"},
+	{0x00000511, "rzh1n2to_r3 cmd_data_cnt"},
+	{0x00000611, "rzh1n2to_r3 cmd_cnt_for_bvalid_phase"},
+	{0x00000711, "rzh1n2to_r3 input_h_cnt"},
+	{0x00000811, "rzh1n2to_r3 input_v_cnt"},
+	{0x00000911, "rzh1n2to_r3 xfer_y_cnt"},
+
+	{0x00000012, "rzh1n2tbo_r3 32(hex) 0000"},
+	{0x00000112, "rzh1n2tbo_r3 state_checksum"},
+	{0x00000212, "rzh1n2tbo_r3 line_pix_cnt_tmp"},
+	{0x00000312, "rzh1n2tbo_r3 line_pix_cnt"},
+	{0x00000412, "rzh1n2tbo_r3 important_status"},
+	{0x00000512, "rzh1n2tbo_r3 cmd_data_cnt"},
+	{0x00000612, "rzh1n2tbo_r3 cmd_cnt_for_bvalid_phase"},
+	{0x00000712, "rzh1n2tbo_r3 input_h_cnt"},
+	{0x00000812, "rzh1n2tbo_r3 input_v_cnt"},
+	{0x00000912, "rzh1n2tbo_r3 xfer_y_cnt"},
+
+	{0x01000051, "rzh1n2to_r1_smi / plane-3 - rzh1n2to_r3 / data-crc"},
+	{0x01000052, "rzh1n2to_r1_smi / plane-4 - rzh1n2tbo_r3 / data-crc"},
+
+	{0x00000084, "rzh1n2to_r1_smi / smi_latency_mon output"},
+
+	{0x000011C0,
+	 "rzh1n2to_r1_smi / plane-3 - rzh1n2to_r1_smi / plane-1 - rzh1n2to_r3 / maddr_max"},
+	{0x000011C1,
+	 "rzh1n2to_r1_smi / plane-3 - rzh1n2to_r1_smi / plane-1 - rzh1n2to_r3 / maddr_min"},
+	{0x000012C0,
+	 "rzh1n2to_r1_smi / plane-4 - rzh1n2to_r1_smi / plane-2 - rzh1n2tbo_r3 / maddr_max"},
+	{0x000012C1,
+	 "rzh1n2to_r1_smi / plane-4 - rzh1n2to_r1_smi / plane-2 - rzh1n2tbo_r3 / maddr_min"},
+};
+
+// M4U_PORT CAM3_DRZS4NO_R1: drzs4no_r1 + drzs4no_r2 + drzs4no_r3 + lmvo_r1 + actso_r1
+static __maybe_unused struct dma_debug_item dbg_DRZS4NO_R1[] = {
+	{0x00000013, "drzs4no_r1 32(hex) 0000"},
+	{0x00000113, "drzs4no_r1 state_checksum"},
+	{0x00000213, "drzs4no_r1 line_pix_cnt_tmp"},
+	{0x00000313, "drzs4no_r1 line_pix_cnt"},
+	{0x00000413, "drzs4no_r1 important_status"},
+	{0x00000513, "drzs4no_r1 cmd_data_cnt"},
+	{0x00000613, "drzs4no_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000713, "drzs4no_r1 input_h_cnt"},
+	{0x00000813, "drzs4no_r1 input_v_cnt"},
+	{0x00000913, "drzs4no_r1 xfer_y_cnt"},
+
+	{0x01000053, "drzs4no_r1_smi / plane-0 - drzs4no_r1 / data-crc"},
+
+	{0x00000085, "drzs4no_r1_smi / smi_latency_mon output"},
+
+	{0x000013C0,
+	 "drzs4no_r1_smi / plane-0 - drzs4no_r1_smi / plane-0 - drzs4no_r1 / maddr_max"},
+	{0x000013C1,
+	 "drzs4no_r1_smi / plane-0 - drzs4no_r1_smi / plane-0 - drzs4no_r1 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_DRZS4NO_R2[] = {
+	{0x00000014, "drzs4no_r2 32(hex) 0000"},
+	{0x00000114, "drzs4no_r2 state_checksum"},
+	{0x00000214, "drzs4no_r2 line_pix_cnt_tmp"},
+	{0x00000314, "drzs4no_r2 line_pix_cnt"},
+	{0x00000414, "drzs4no_r2 important_status"},
+	{0x00000514, "drzs4no_r2 cmd_data_cnt"},
+	{0x00000614, "drzs4no_r2 cmd_cnt_for_bvalid_phase"},
+	{0x00000714, "drzs4no_r2 input_h_cnt"},
+	{0x00000814, "drzs4no_r2 input_v_cnt"},
+	{0x00000914, "drzs4no_r2 xfer_y_cnt"},
+
+	{0x01000054, "drzs4no_r1_smi / plane-1 - drzs4no_r2 / data-crc"},
+
+	{0x00000085, "drzs4no_r1_smi / smi_latency_mon output"},
+
+	{0x000014C0,
+	 "drzs4no_r1_smi / plane-1 - drzs4no_r1_smi / plane-0 - drzs4no_r2 / maddr_max"},
+	{0x000014C1,
+	 "drzs4no_r1_smi / plane-1 - drzs4no_r1_smi / plane-0 - drzs4no_r2 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_DRZS4NO_R3[] = {
+	{0x00000015, "drzs4no_r3 32(hex) 0000"},
+	{0x00000115, "drzs4no_r3 state_checksum"},
+	{0x00000215, "drzs4no_r3 line_pix_cnt_tmp"},
+	{0x00000315, "drzs4no_r3 line_pix_cnt"},
+	{0x00000415, "drzs4no_r3 important_status"},
+	{0x00000515, "drzs4no_r3 cmd_data_cnt"},
+	{0x00000615, "drzs4no_r3 cmd_cnt_for_bvalid_phase"},
+	{0x00000715, "drzs4no_r3 input_h_cnt"},
+	{0x00000815, "drzs4no_r3 input_v_cnt"},
+	{0x00000915, "drzs4no_r3 xfer_y_cnt"},
+
+	{0x01000055, "drzs4no_r1_smi / plane-2 - drzs4no_r3 / data-crc"},
+
+	{0x00000085, "drzs4no_r1_smi / smi_latency_mon output"},
+
+	{0x000015C0,
+	 "drzs4no_r1_smi / plane-2 - drzs4no_r1_smi / plane-1 - drzs4no_r3 / maddr_max record"},
+	{0x000015C1,
+	 "drzs4no_r1_smi / plane-2 - drzs4no_r1_smi / plane-1 - drzs4no_r3 / maddr_min record"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_LMVO_R1[] = {
+	{0x00000016, "lmvo_r1 32(hex) 0000"},
+	{0x00000116, "lmvo_r1 state_checksum"},
+	{0x00000216, "lmvo_r1 line_pix_cnt_tmp"},
+	{0x00000316, "lmvo_r1 line_pix_cnt"},
+	{0x00000416, "lmvo_r1 important_status"},
+	{0x00000516, "lmvo_r1 cmd_data_cnt"},
+	{0x00000616, "lmvo_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000716, "lmvo_r1 input_h_cnt"},
+	{0x00000816, "lmvo_r1 input_v_cnt"},
+	{0x00000916, "lmvo_r1 xfer_y_cnt"},
+
+	{0x01000056, "drzs4no_r1_smi / plane-3 - lmvo_r1 / data-crc"},
+
+	{0x00000085, "drzs4no_r1_smi / smi_latency_mon output"},
+
+	{0x000016C0,
+	 "drzs4no_r1_smi / plane-3 - drzs4no_r1_smi / plane-2 - lmvo_r1 / maddr_max"},
+	{0x000016C1,
+	 "drzs4no_r1_smi / plane-3 - drzs4no_r1_smi / plane-2 - lmvo_r1 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_ACTSO_R1[] = {
+	{0x00000017, "actso_r1 32(hex) 0000"},
+	{0x00000117, "actso_r1 state_checksum"},
+	{0x00000217, "actso_r1 line_pix_cnt_tmp"},
+	{0x00000317, "actso_r1 line_pix_cnt"},
+	{0x00000417, "actso_r1 important_status"},
+	{0x00000517, "actso_r1 cmd_data_cnt"},
+	{0x00000617, "actso_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000717, "actso_r1 input_h_cnt"},
+	{0x00000817, "actso_r1 input_v_cnt"},
+	{0x00000917, "actso_r1 xfer_y_cnt"},
+
+	{0x01000057, "drzs4no_r1_smi / plane-4 - actso_r1) / data-crc"},
+
+	{0x00000085, "drzs4no_r1_smi / smi_latency_mon output"},
+
+	{0x000017C0,
+	 "drzs4no_r1_smi / plane-4 - drzs4no_r1_smi / plane-0 - actsoo_r1 / maddr_max record"},
+	{0x000017C1,
+	 "drzs4no_r1_smi / plane-4 - drzs4no_r1_smi / plane-0 - actsoo_r1 / maddr_min record"},
+};
+
+// M4U_PORT CAM3_TNCSO_R1: tncso_r1 + tncsbo_r1 + tncsho_r1 + tncsyo_r1
+static __maybe_unused struct dma_debug_item dbg_TNCSO_R1[] = {
+	{0x00000018, "tncso_r1 32(hex) 0000"},
+	{0x00000118, "tncso_r1 state_checksum"},
+	{0x00000218, "tncso_r1 line_pix_cnt_tmp"},
+	{0x00000318, "tncso_r1 line_pix_cnt"},
+	{0x00000418, "tncso_r1 important_status"},
+	{0x00000518, "tncso_r1 cmd_data_cnt"},
+	{0x00000618, "tncso_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000718, "tncso_r1 input_h_cnt"},
+	{0x00000818, "tncso_r1 input_v_cnt"},
+	{0x00000918, "tncso_r1 xfer_y_cnt"},
+
+	{0x01000058, "tncso_r1_smi / plane-0 - tncso_r1) / data-crc"},
+
+	{0x00000086, "tncso_r1_smi / smi_latency_mon output"},
+
+	{0x000018C0,
+	 "tncso_r1_smi / plane-0 - tncso_r1_smi / plane-1 - tncso_r1 / maddr_max record"},
+	{0x000018C1,
+	 "tncso_r1_smi / plane-0 - tncso_r1_smi / plane-1 - tncso_r1 / maddr_min record"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_TNCSBO_R1[] = {
+	{0x00000019, "tncsbo_r1 32(hex) 0000"},
+	{0x00000119, "tncsbo_r1 state_checksum"},
+	{0x00000219, "tncsbo_r1 line_pix_cnt_tmp"},
+	{0x00000319, "tncsbo_r1 line_pix_cnt"},
+	{0x00000419, "tncsbo_r1 important_status"},
+	{0x00000519, "tncsbo_r1 cmd_data_cnt"},
+	{0x00000619, "tncsbo_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000719, "tncsbo_r1 input_h_cnt"},
+	{0x00000819, "tncsbo_r1 input_v_cnt"},
+	{0x00000919, "tncsbo_r1 xfer_y_cnt"},
+
+	{0x01000059, "tncso_r1_smi / plane-1 - tncsbo_r1 / data-crc"},
+
+	{0x00000086, "tncso_r1_smi / smi_latency_mon output"},
+
+	{0x000019C0,
+	 "tncso_r1_smi / plane-1 - tncso_r1_smi / plane-0 - tncsbo_r1 / maddr_max"},
+	{0x000019C1,
+	 "tncso_r1_smi / plane-1 - tncso_r1_smi / plane-0 - tncsbo_r1 / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_TNCSHO_R1[] = {
+	{0x0000001A, "tncsho_r1 32(hex) 0000"},
+	{0x0000011A, "tncsho_r1 state_checksum"},
+	{0x0000021A, "tncsho_r1 line_pix_cnt_tmp"},
+	{0x0000031A, "tncsho_r1 line_pix_cnt"},
+	{0x0000041A, "tncsho_r1 important_status"},
+	{0x0000051A, "tncsho_r1 cmd_data_cnt"},
+	{0x0000061A, "tncsho_r1 cmd_cnt_for_bvalid_phase"},
+	{0x0000071A, "tncsho_r1 input_h_cnt"},
+	{0x0000081A, "tncsho_r1 input_v_cnt"},
+	{0x0000091A, "tncsho_r1 xfer_y_cnt"},
+
+	{0x0100005A, "tncso_r1_smi / plane-2 - tncsho_r1 / data-crc"},
+
+	{0x00000086, "tncso_r1_smi / smi_latency_mon output"},
+
+	{0x00001AC0,
+	 "tncso_r1_smi / plane-2 - tncso_r1_smi / plane-1 - tncsho_r1 / maddr_max"},
+	{0x00001AC1,
+	 "tncso_r1_smi / plane-2 - tncso_r1_smi / plane-1 - tncsho_r1 / maddr_max"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_TNCSYO_R1[] = {
+	{0x0000001B, "tncsyo_r1 32(hex) 0000"},
+	{0x0000011B, "tncsyo_r1 state_checksum"},
+	{0x0000021B, "tncsyo_r1 line_pix_cnt_tmp"},
+	{0x0000031B, "tncsyo_r1 line_pix_cnt"},
+	{0x0000041B, "tncsyo_r1 important_status"},
+	{0x0000051B, "tncsyo_r1 cmd_data_cnt"},
+	{0x0000061B, "tncsyo_r1 cmd_cnt_for_bvalid_phase"},
+	{0x0000071B, "tncsyo_r1 input_h_cnt"},
+	{0x0000081B, "tncsyo_r1 input_v_cnt"},
+	{0x0000091B, "tncsyo_r1 xfer_y_cnt"},
+
+	{0x0100005B, "tncso_r1_smi / plane-3 - tncsyo_r1 / data-crc"},
+
+	{0x00000086, "tncso_r1_smi / smi_latency_mon output"},
+
+	{0x00001BC0,
+	 "tncso_r1_smi / plane-3 - tncso_r1_smi / plane-2 - tncsyo_r1) / maddr_max"},
+	{0x00001BC0,
+	 "tncso_r1_smi / plane-3 - tncso_r1_smi / plane-2 - tncsyo_r1) / maddr_min"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_ulc_cmd_cnt[] = {
+	{0x00000511, "bpci_r1 cmd_data_cnt"},
+	{0x00000512, "bpci_r2 cmd_data_cnt"},
+	{0x00000513, "bpci_r3 cmd_data_cnt"},
+	{0x00000516, "aai_r1 cmd_data_cnt"},
+	{0x00000518, "rawi_r6 cmd_data_cnt"},
+	{0x0000051F, "tsfso_r1 cmd_data_cnt"},
+	{0x0000061F, "tsfso_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000520, "ltmso_r1 cmd_data_cnt"},
+	{0x00000620, "ltmso_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000521, "tsfso_r2 cmd_data_cnt"},
+	{0x00000621, "tsfso_r2 cmd_cnt_for_bvalid_phase"},
+	{0x00000522, "flko_r1 cmd_data_cnt"},
+	{0x00000622, "flko_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000523, "ufeo_r1 cmd_data_cnt"},
+	{0x00000623, "ufeo_r1 cmd_cnt_for_bvalid_phase"},
+	{0x00000528, "bino_r1 cmd_data_cnt"},
+	{0x00000628, "bino_r1 cmd_cnt_for_bvalid_phase"},
+};
+
+static __maybe_unused struct dma_debug_item dbg_ori_cmd_cnt[] = {
+	{0x000000A0, "rawi_r2_smi / plane-0 - rawi_r2 / { len-cnt, dle-cnt }"},
+	{0x000000A1, "ufdi_r2_smi / plane-0 - ufdi_r2 / { len-cnt, dle-cnt }"},
+	{0x000000A2, "rawi_r3_smi / plane-0 - rawi_r3 / { len-cnt, dle-cnt }"},
+	{0x000000A3, "ufdi_r3_smi / plane-0 - ufdi_r3 / { len-cnt, dle-cnt }"},
+	{0x000000A4, "rawi_r4_smi / plane-0 - rawi_r4 / { len-cnt, dle-cnt }"},
+	{0x000000A5, "rawi_r5_smi / plane-0 - rawi_r5 / { len-cnt, dle-cnt }"},
+	{0x000000A6, "cqi_r1_smi / plane-0 - cqi_r1 / { len-cnt, dle-cnt }"},
+	{0x000000A7, "cqi_r1_smi / plane-1 - cqi_r3 / { len-cnt, dle-cnt }"},
+	{0x000000A8, "cqi_r2_smi / plane-0 - cqi_r2 / { len-cnt, dle-cnt }"},
+	{0x000000A9, "cqi_r2_smi / plane-1 - cqi_r4 / { len-cnt, dle-cnt }"},
+	{0x000000AA, "lsci_r1_smi / plane-0 - lsci_r1 / { len-cnt, dle-cnt }"},
+	{0x000000AB, "imgo_r1_smi / plane-0 - imgo_r1 / { len-cnt, dle-cnt }"},
+	{0x000000AC, "imgo_r1_smi / plane-0 - imgo_r1 / { load_com-cnt, bvalid-cnt }"},
+	{0x000000AD, "fho_r1_smi / plane-0 - fho_r1 / { len-cnt, dle-cnt }"},
+	{0x000000AE, "fho_r1_smi / plane-0 - fho_r1 / { load_com-cnt, bvalid-cnt }"},
+	{0x000000AF, "fho_r1_smi / plane-1 - aaho_r1 / { len-cnt, dle-cnt }"},
+	{0x000000B0, "fho_r1_smi / plane-1 - aaho_r1 / { load_com-cnt, bvalid-cnt }"},
+	{0x000000B1, "fho_r1_smi / plane-2 - pdo_r1 / { len-cnt, dle-cnt }"},
+	{0x000000B2, "fho_r1_smi / plane-2 - pdo_r1 / { load_com-cnt, bvalid-cnt }"},
+	{0x000000B3, "aao_r1_smi / plane-0 - aao_r1 / { len-cnt, dle-cnt }"},
+	{0x000000B4, "aao_r1_smi / plane-0 - aao_r1 / { load_com-cnt, bvalid-cnt }"},
+	{0x000000B5, "aao_r1_smi / plane-1 - afo_r1 / { len-cnt, dle-cnt }"},
+	{0x000000B6, "aao_r1_smi / plane-1 - afo_r1 / { load_com-cnt, bvalid-cnt }"},
+	{0x000000B7, "ufdi_r5_smi / plane-0 - ufdi_r5 / { len-cnt, dle-cnt }"},
+};
+
+#endif /*__MTK_CAM_RAW_DMADBG_H*/
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h
new file mode 100644
index 000000000000..2eb54a2332ef
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTKCAM_FMT_H
+#define __MTKCAM_FMT_H
+
+/* camsys supported format */
+enum mtkcam_ipi_fmt {
+	MTKCAM_IPI_IMG_FMT_UNKNOWN		= -1,
+	MTKCAM_IPI_IMG_FMT_BAYER8		= 0,
+	MTKCAM_IPI_IMG_FMT_BAYER10		= 1,
+	MTKCAM_IPI_IMG_FMT_BAYER12		= 2,
+	MTKCAM_IPI_IMG_FMT_BAYER14		= 3,
+	MTKCAM_IPI_IMG_FMT_BAYER16		= 4,
+	MTKCAM_IPI_IMG_FMT_BAYER10_UNPACKED	= 5,
+	MTKCAM_IPI_IMG_FMT_BAYER12_UNPACKED	= 6,
+	MTKCAM_IPI_IMG_FMT_BAYER14_UNPACKED	= 7,
+	MTKCAM_IPI_IMG_FMT_RGB565		= 8,
+	MTKCAM_IPI_IMG_FMT_RGB888		= 9,
+	MTKCAM_IPI_IMG_FMT_JPEG			= 10,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER8		= 11,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER10		= 12,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER12		= 13,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER14		= 14,
+	MTKCAM_IPI_IMG_FMT_YUYV			= 15,
+	MTKCAM_IPI_IMG_FMT_YVYU			= 16,
+	MTKCAM_IPI_IMG_FMT_UYVY			= 17,
+	MTKCAM_IPI_IMG_FMT_VYUY			= 18,
+	MTKCAM_IPI_IMG_FMT_YUV_422_2P		= 19,
+	MTKCAM_IPI_IMG_FMT_YVU_422_2P		= 20,
+	MTKCAM_IPI_IMG_FMT_YUV_422_3P		= 21,
+	MTKCAM_IPI_IMG_FMT_YVU_422_3P		= 22,
+	MTKCAM_IPI_IMG_FMT_YUV_420_2P		= 23,
+	MTKCAM_IPI_IMG_FMT_YVU_420_2P		= 24,
+	MTKCAM_IPI_IMG_FMT_YUV_420_3P		= 25,
+	MTKCAM_IPI_IMG_FMT_YVU_420_3P		= 26,
+	MTKCAM_IPI_IMG_FMT_Y8			= 27,
+	MTKCAM_IPI_IMG_FMT_YUYV_Y210		= 28,
+	MTKCAM_IPI_IMG_FMT_YVYU_Y210		= 29,
+	MTKCAM_IPI_IMG_FMT_UYVY_Y210		= 30,
+	MTKCAM_IPI_IMG_FMT_VYUY_Y210		= 31,
+	MTKCAM_IPI_IMG_FMT_YUYV_Y210_PACKED	= 32,
+	MTKCAM_IPI_IMG_FMT_YVYU_Y210_PACKED	= 33,
+	MTKCAM_IPI_IMG_FMT_UYVY_Y210_PACKED	= 34,
+	MTKCAM_IPI_IMG_FMT_VYUY_Y210_PACKED	= 35,
+	MTKCAM_IPI_IMG_FMT_YUV_P210		= 36,
+	MTKCAM_IPI_IMG_FMT_YVU_P210		= 37,
+	MTKCAM_IPI_IMG_FMT_YUV_P010		= 38,
+	MTKCAM_IPI_IMG_FMT_YVU_P010		= 39,
+	MTKCAM_IPI_IMG_FMT_YUV_P210_PACKED	= 40,
+	MTKCAM_IPI_IMG_FMT_YVU_P210_PACKED	= 41,
+	MTKCAM_IPI_IMG_FMT_YUV_P010_PACKED	= 42,
+	MTKCAM_IPI_IMG_FMT_YVU_P010_PACKED	= 43,
+	MTKCAM_IPI_IMG_FMT_YUV_P212		= 44,
+	MTKCAM_IPI_IMG_FMT_YVU_P212		= 45,
+	MTKCAM_IPI_IMG_FMT_YUV_P012		= 46,
+	MTKCAM_IPI_IMG_FMT_YVU_P012		= 47,
+	MTKCAM_IPI_IMG_FMT_YUV_P212_PACKED	= 48,
+	MTKCAM_IPI_IMG_FMT_YVU_P212_PACKED	= 49,
+	MTKCAM_IPI_IMG_FMT_YUV_P012_PACKED	= 50,
+	MTKCAM_IPI_IMG_FMT_YVU_P012_PACKED	= 51,
+	MTKCAM_IPI_IMG_FMT_RGB_8B_3P		= 52,
+	MTKCAM_IPI_IMG_FMT_RGB_10B_3P		= 53,
+	MTKCAM_IPI_IMG_FMT_RGB_12B_3P		= 54,
+	MTKCAM_IPI_IMG_FMT_RGB_10B_3P_PACKED	= 55,
+	MTKCAM_IPI_IMG_FMT_RGB_12B_3P_PACKED	= 56,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER8_3P		= 57,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER10_3P	= 58,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER12_3P	= 59,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER10_3P_PACKED	= 60,
+	MTKCAM_IPI_IMG_FMT_FG_BAYER12_3P_PACKED	= 61,
+	MTKCAM_IPI_IMG_FMT_UFBC_NV12		= 62,
+	MTKCAM_IPI_IMG_FMT_UFBC_NV21		= 63,
+	MTKCAM_IPI_IMG_FMT_UFBC_YUV_P010	= 64,
+	MTKCAM_IPI_IMG_FMT_UFBC_YVU_P010	= 65,
+	MTKCAM_IPI_IMG_FMT_UFBC_YUV_P012	= 66,
+	MTKCAM_IPI_IMG_FMT_UFBC_YVU_P012	= 67,
+	MTKCAM_IPI_IMG_FMT_UFBC_BAYER8		= 68,
+	MTKCAM_IPI_IMG_FMT_UFBC_BAYER10		= 69,
+	MTKCAM_IPI_IMG_FMT_UFBC_BAYER12		= 70,
+	MTKCAM_IPI_IMG_FMT_UFBC_BAYER14		= 71,
+	MTKCAM_IPI_IMG_FMT_BAYER10_MIPI		= 72
+};
+
+#endif /* __MTKCAM_FMT_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h
new file mode 100644
index 000000000000..f3401287ca6e
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h
@@ -0,0 +1,233 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_IPI_H__
+#define __MTK_CAM_IPI_H__
+
+#define MTK_CAM_IPI_VERSION_MAJOR (0)
+#define MTK_CAM_IPI_VERSION_MINOR (1)
+
+#include <linux/types.h>
+#include "mtk_cam-defs.h"
+
+#define MTK_CAM_MAX_RUNNING_JOBS	(3)
+#define CAM_MAX_PLANENUM		(3)
+#define CAM_MAX_SUBSAMPLE		(32)
+#define MTK_CAM_MAX_PROCESSING_BUFS	(2)
+
+/*
+ * struct mtkcam_ipi_point - Point
+ *
+ * @x: x-coordinate of the point (zero-based).
+ * @y: y-coordinate of the point (zero-based).
+ */
+struct mtkcam_ipi_point {
+	u16 x;
+	u16 y;
+} __packed;
+
+/*
+ * struct mtkcam_ipi_size - Size
+ *
+ * @w: width (in pixels).
+ * @h: height (in pixels).
+ */
+struct mtkcam_ipi_size {
+	u16 w;
+	u16 h;
+} __packed;
+
+/*
+ * struct mtkcam_ipi_fract - fraction
+ *
+ * @numerator: numerator part of the fraction.
+ * @denominator: denominator part of the fraction.
+ */
+struct mtkcam_ipi_fract {
+	u8 numerator;
+	u8 denominator;
+};
+
+/*
+ * struct mtkcam_ipi_sw_buffer
+ *	- Shared buffer between cam-device and co-processor.
+ *
+ * @iova: DMA address for CAM DMA device. isp7_1: u64.
+ * @scp_addr: SCP address for external co-processor unit.
+ * @size: buffer size.
+ */
+struct mtkcam_ipi_sw_buffer {
+	u64 iova;
+	u32 scp_addr;
+	u32 size;
+} __packed;
+
+/*
+ * struct mtkcam_ipi_hw_buffer - DMA buffer for CAM DMA device.
+ *
+ * @iova: DMA address for CAM DMA device. isp7_1: u64.
+ * @size: buffer size.
+ */
+struct mtkcam_ipi_hw_buffer {
+	u64 iova;
+	u32 size;
+} __packed;
+
+struct mtkcam_ipi_pix_fmt {
+	u32	format;
+	struct mtkcam_ipi_size	s;
+	u16	stride[CAM_MAX_PLANENUM];
+} __packed;
+
+struct mtkcam_ipi_crop {
+	struct mtkcam_ipi_point p;
+	struct mtkcam_ipi_size s;
+} __packed;
+
+struct mtkcam_ipi_uid {
+	u8 pipe_id;
+	u8 id;
+} __packed;
+
+struct mtkcam_ipi_img_input {
+	struct mtkcam_ipi_uid		uid;
+	struct mtkcam_ipi_pix_fmt	fmt;
+	struct mtkcam_ipi_sw_buffer	buf[CAM_MAX_PLANENUM];
+} __packed;
+
+struct mtkcam_ipi_img_output {
+	struct mtkcam_ipi_uid		uid;
+	struct mtkcam_ipi_pix_fmt	fmt;
+	struct mtkcam_ipi_sw_buffer	buf[CAM_MAX_SUBSAMPLE][CAM_MAX_PLANENUM];
+	struct mtkcam_ipi_crop		crop;
+} __packed;
+
+struct mtkcam_ipi_meta_input {
+	struct mtkcam_ipi_uid		uid;
+	struct mtkcam_ipi_sw_buffer	buf;
+} __packed;
+
+struct mtkcam_ipi_meta_output {
+	struct mtkcam_ipi_uid		uid;
+	struct mtkcam_ipi_sw_buffer	buf;
+} __packed;
+
+struct mtkcam_ipi_input_param {
+	u32	fmt;
+	u8	raw_pixel_id;
+	u8	data_pattern;
+	u8	pixel_mode;
+	u8	subsample;
+	struct mtkcam_ipi_crop in_crop;
+} __packed;
+
+struct mtkcam_ipi_raw_frame_param {
+	u8	imgo_path_sel; /* mtkcam_ipi_raw_path_control */
+	u8	hardware_scenario;
+	u32	bin_flag;
+	u8	exposure_num;
+	u8	previous_exposure_num;
+	struct mtkcam_ipi_fract	frz_ratio;
+} __packed;
+
+struct mtkcam_ipi_session_cookie {
+	u8	session_id;
+	u32	frame_no;
+} __packed;
+
+struct mtkcam_ipi_session_param {
+	struct mtkcam_ipi_sw_buffer workbuf;
+	struct mtkcam_ipi_sw_buffer msg_buf;
+	struct mtkcam_ipi_sw_buffer raw_workbuf;
+	struct mtkcam_ipi_sw_buffer priv_workbuf;
+	struct mtkcam_ipi_sw_buffer session_buf;
+} __packed;
+
+struct mtkcam_ipi_hw_mapping {
+	u8	pipe_id; /* ref. to mtkcam_pipe_subdev */
+	u16	dev_mask; /* ref. to mtkcam_pipe_dev */
+	u8	exp_order;
+} __packed;
+
+/*  Control flags of CAM_CMD_CONFIG */
+#define MTK_CAM_IPI_CONFIG_TYPE_INIT			0x0001
+#define MTK_CAM_IPI_CONFIG_TYPE_INPUT_CHANGE		0x0002
+#define MTK_CAM_IPI_CONFIG_TYPE_EXEC_TWICE		0x0004
+#define MTK_CAM_IPI_CONFIG_TYPE_SMVR_PREVIEW		0x0008
+
+struct mtkcam_ipi_config_param {
+	u8	flags;
+	struct mtkcam_ipi_input_param	input;
+	u8	n_maps;
+	/* maximum # of pipes per stream */
+	struct mtkcam_ipi_hw_mapping maps[6];
+	/* sub_ratio:8, valid number: 8 */
+	u16	valid_numbers[MTKCAM_IPI_FBCX_LAST];
+	u8	sw_feature;
+} __packed;
+
+#define CAM_MAX_IMAGE_INPUT	(5)
+#define CAM_MAX_IMAGE_OUTPUT	(15)
+#define CAM_MAX_META_OUTPUT	(4)
+#define CAM_MAX_PIPE_USED	(4)
+
+struct mtkcam_ipi_frame_param {
+	u32 cur_workbuf_offset;
+	u32 cur_workbuf_size;
+
+	struct mtkcam_ipi_raw_frame_param raw_param;
+	struct mtkcam_ipi_img_input img_ins[CAM_MAX_IMAGE_INPUT];
+	struct mtkcam_ipi_img_output img_outs[CAM_MAX_IMAGE_OUTPUT];
+	struct mtkcam_ipi_meta_output meta_outputs[CAM_MAX_META_OUTPUT];
+	struct mtkcam_ipi_meta_input meta_inputs[CAM_MAX_PIPE_USED];
+} __packed;
+
+struct mtkcam_ipi_frame_info {
+	u32	cur_msgbuf_offset;
+	u32	cur_msgbuf_size;
+} __packed;
+
+struct mtkcam_ipi_frame_ack_result {
+	u32	cq_desc_offset;
+	u32	sub_cq_desc_offset;
+	u32	cq_desc_size;
+	u32	sub_cq_desc_size;
+} __packed;
+
+struct mtkcam_ipi_ack_info {
+	u8	ack_cmd_id;
+	s32	ret;
+	struct mtkcam_ipi_frame_ack_result frame_result;
+} __packed;
+
+/*
+ * The IPI command enumeration.
+ */
+enum mtkcam_ipi_cmds {
+	/* request for a new streaming: mtkcam_ipi_session_param */
+	CAM_CMD_CREATE_SESSION,
+	/* config the stream: mtkcam_ipi_config_param */
+	CAM_CMD_CONFIG,
+	/* per-frame: mtkcam_ipi_frame_param */
+	CAM_CMD_FRAME,
+	/* release certain streaming: mtkcam_ipi_session_param */
+	CAM_CMD_DESTROY_SESSION,
+	/* ack: mtkcam_ipi_ack_info */
+	CAM_CMD_ACK,
+	CAM_CMD_RESERVED,
+};
+
+struct mtkcam_ipi_event  {
+	struct mtkcam_ipi_session_cookie cookie;
+	u8 cmd_id;
+	union {
+		struct mtkcam_ipi_session_param	session_data;
+		struct mtkcam_ipi_config_param	config_data;
+		struct mtkcam_ipi_frame_info	frame_data;
+		struct mtkcam_ipi_ack_info	ack_data;
+	};
+} __packed;
+
+#endif /* __MTK_CAM_IPI_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h
new file mode 100644
index 000000000000..656841f6ef57
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h
@@ -0,0 +1,2436 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_META_H__
+#define __MTK_CAM_META_H__
+
+/*
+ * struct mtk_cam_uapi_meta_rect - rect info
+ *
+ * @left: The X coordinate of the left side of the rectangle
+ * @top:  The Y coordinate of the left side of the rectangle
+ * @width:  The width of the rectangle
+ * @height: The height of the rectangle
+ *
+ * rect containing the width and height fields.
+ *
+ */
+struct mtk_cam_uapi_meta_rect {
+	s32 left;
+	s32 top;
+	u32 width;
+	u32 height;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_meta_size - size info
+ *
+ * @width:  The width of the size
+ * @height: The height of the size
+ *
+ * size containing the width and height fields.
+ *
+ */
+struct mtk_cam_uapi_meta_size {
+	u32 width;
+	u32 height;
+} __packed;
+
+/*
+ *  A U T O  E X P O S U R E
+ */
+
+/*
+ *  struct mtk_cam_uapi_ae_hist_cfg - histogram info for AE
+ *
+ *  @hist_en:    enable bit for current histogram, each histogram can
+ *      be 0/1 (disabled/enabled) separately
+ *  @hist_opt:   color mode config for current histogram (0/1/2/3/4:
+ *      R/G/B/RGB mix/Y)
+ *  @hist_bin:   bin mode config for current histogram (1/4: 256/1024 bin)
+ *  @hist_y_hi:  ROI Y range high bound for current histogram
+ *  @hist_y_low: ROI Y range low bound for current histogram
+ *  @hist_x_hi:  ROI X range high bound for current histogram
+ *  @hist_x_low: ROI X range low bound for current histogram
+ */
+struct mtk_cam_uapi_ae_hist_cfg {
+	s32 hist_en;
+	u8 hist_opt;
+	u8 hist_bin;
+	u16 hist_y_hi;
+	u16 hist_y_low;
+	u16 hist_x_hi;
+	u16 hist_x_low;
+	u16 rsv;
+} __packed;
+
+#define MTK_CAM_UAPI_ROI_MAP_BLK_NUM (128 * 128)
+/*
+ *  struct mtk_cam_uapi_ae_param - parameters for AE configurtion
+ *
+ *  @pixel_hist_win_cfg_le: window config for le histogram 0~5
+ *           separately, uAEHistBin shold be the same
+ *           for these 6 histograms
+ *  @pixel_hist_win_cfg_se: window config for se histogram 0~5
+ *           separately, uAEHistBin shold be the same
+ *           for these 6 histograms
+ *  @roi_hist_cfg_le : config for roi le histogram 0~3
+ *           color mode/enable
+ *  @roi_hist_cfg_se : config for roi se histogram 0~3
+ *           color mode/enable
+ *  @hdr_ratio: in HDR scenario, AE calculated hdr ratio
+ *           (LE exp*iso/SE exp*iso*100) for current frame,
+ *           default non-HDR scenario ratio=1000
+ */
+struct mtk_cam_uapi_ae_param {
+	struct mtk_cam_uapi_ae_hist_cfg pixel_hist_win_cfg_le[6];
+	struct mtk_cam_uapi_ae_hist_cfg pixel_hist_win_cfg_se[6];
+	struct mtk_cam_uapi_ae_hist_cfg roi_hist_cfg_le[4];
+	struct mtk_cam_uapi_ae_hist_cfg roi_hist_cfg_se[4];
+	u8  aai_r1_enable;
+	u8  aai_roi_map[MTK_CAM_UAPI_ROI_MAP_BLK_NUM];
+	u8  rsv;
+	u16 hdr_ratio; /* base 1 x= 1000 */
+	u32 act_win_x_start;
+	u32 act_win_x_end;
+	u32 act_win_y_start;
+	u32 act_win_y_end;
+} __packed;
+
+/*
+ *  A U T O  W H I T E  B A L A N C E
+ */
+
+/* Maximum blocks that MediaTek AWB supports */
+#define MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM (10)
+
+/*
+ *  struct mtk_cam_uapi_awb_param - parameters for AWB configurtion
+ *
+ *  @stat_en:                  AWB stat enable
+ *  @windownum_x:              Number of horizontal AWB windows
+ *  @windownum_y:              Number of vertical AWB windows
+ *  @lowthreshold_r:           Low threshold of R
+ *  @lowthreshold_g:           Low threshold of G
+ *  @lowthreshold_b:           Low threshold of B
+ *  @highthreshold_r:          High threshold of R
+ *  @highthreshold_g:          High threshold of G
+ *  @highthreshold_b:          High threshold of B
+ *  @lightsrc_lowthreshold_r:  Low threshold of R for light source estimation
+ *  @lightsrc_lowthreshold_g:  Low threshold of G for light source estimation
+ *  @lightsrc_lowthreshold_b:  Low threshold of B for light source estimation
+ *  @lightsrc_highthreshold_r: High threshold of R for light source estimation
+ *  @lightsrc_highthreshold_g: High threshold of G for light source estimation
+ *  @lightsrc_highthreshold_b: High threshold of B for light source estimation
+ *  @pregainlimit_r:           Maximum limit clipping for R color
+ *  @pregainlimit_g:           Maximum limit clipping for G color
+ *  @pregainlimit_b:           Maximum limit clipping for B color
+ *  @pregain_r:                unit module compensation gain for R color
+ *  @pregain_g:                unit module compensation gain for G color
+ *  @pregain_b:                unit module compensation gain for B color
+ *  @valid_datawidth:          valid bits of statistic data
+ *  @hdr_support_en:           support HDR mode
+ *  @stat_mode:                Output format select <1>sum mode <0>average mode
+ *  @error_ratio:              Programmable error pixel count by AWB window size
+ *              (base : 256)
+ *  @awbxv_win_r:              light area of right bound, the size is defined in
+ *              MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM
+ *  @awbxv_win_l:              light area of left bound the size is defined in
+ *              MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM
+ *  @awbxv_win_d:              light area of lower bound the size is defined in
+ *              MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM
+ *  @awbxv_win_u:              light area of upper bound the size is defined in
+ *              MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM
+ *  @pregain2_r:               white balance gain of R color
+ *  @pregain2_g:               white balance gain of G color
+ *  @pregain2_b:               white balance gain of B color
+ */
+struct mtk_cam_uapi_awb_param {
+	u32 stat_en;
+	u32 windownum_x;
+	u32 windownum_y;
+	u32 lowthreshold_r;
+	u32 lowthreshold_g;
+	u32 lowthreshold_b;
+	u32 highthreshold_r;
+	u32 highthreshold_g;
+	u32 highthreshold_b;
+	u32 lightsrc_lowthreshold_r;
+	u32 lightsrc_lowthreshold_g;
+	u32 lightsrc_lowthreshold_b;
+	u32 lightsrc_highthreshold_r;
+	u32 lightsrc_highthreshold_g;
+	u32 lightsrc_highthreshold_b;
+	u32 pregainlimit_r;
+	u32 pregainlimit_g;
+	u32 pregainlimit_b;
+	u32 pregain_r;
+	u32 pregain_g;
+	u32 pregain_b;
+	u32 valid_datawidth;
+	u32 hdr_support_en;
+	u32 stat_mode;
+	u32 format_shift;
+	u32 error_ratio;
+	u32 postgain_r;
+	u32 postgain_g;
+	u32 postgain_b;
+	u32 postgain2_hi_r;
+	u32 postgain2_hi_g;
+	u32 postgain2_hi_b;
+	u32 postgain2_med_r;
+	u32 postgain2_med_g;
+	u32 postgain2_med_b;
+	u32 postgain2_low_r;
+	u32 postgain2_low_g;
+	u32 postgain2_low_b;
+	s32 awbxv_win_r[MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM];
+	s32 awbxv_win_l[MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM];
+	s32 awbxv_win_d[MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM];
+	s32 awbxv_win_u[MTK_CAM_UAPI_AWB_MAX_LIGHT_AREA_NUM];
+	u32 csc_ccm[9];
+	u32 acc;
+	u32 med_region[4];
+	u32 low_region[4];
+	u32 pregain2_r;
+	u32 pregain2_g;
+	u32 pregain2_b;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_dgn_param
+ *
+ *  @gain: digital gain to increase image brightness, 1 x= 1024
+ */
+struct mtk_cam_uapi_dgn_param {
+	u32 gain;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_wb_param
+ *
+ *  @gain_r: white balance gain of R channel
+ *  @gain_g: white balance gain of G channel
+ *  @gain_b: white balance gain of B channel
+ */
+struct mtk_cam_uapi_wb_param {
+	u32 gain_r;
+	u32 gain_g;
+	u32 gain_b;
+	u32 clip;
+} __packed;
+
+/*
+ *  A U T O  F O C U S
+ */
+
+/*
+ * struct mtk_cam_uapi_af_param - af statistic parameters
+ *  @roi: AF roi rectangle (in pixel) for AF statistic covered, including
+ *    x, y, width, height
+ *  @th_sat_g:  green channel pixel value saturation threshold (0~255)
+ *  @th_h[3]: horizontal AF filters response threshold (0~50) for H0, H1,
+ *    and H2
+ *  @th_v:  vertical AF filter response threshold (0~50)
+ *  @blk_pixel_xnum: horizontal number of pixel per block
+ *  @blk_pixel_ynum: vertical number of pixel per block
+ *  @fir_type: to select FIR filter by AF target type (0,1,2,3)
+ *  @iir_type: to select IIR filter by AF target type (0,1,2,3)
+ *  @data_gain[7]: gamma curve gain for AF source data
+ */
+struct mtk_cam_uapi_af_param {
+	struct mtk_cam_uapi_meta_rect roi;
+	u32 th_sat_g;
+	u32 th_h[3];
+	u32 th_v;
+	u32 blk_pixel_xnum;
+	u32 blk_pixel_ynum;
+	u32 fir_type;
+	u32 iir_type;
+	u32 data_gain[7];
+} __packed;
+
+enum mtk_cam_uapi_flk_hdr_path_control {
+	MTKCAM_UAPI_FKLO_HDR_1ST_FRAME = 0,
+	MTKCAM_UAPI_FKLO_HDR_2ND_FRAME,
+	MTKCAM_UAPI_FKLO_HDR_3RD_FRAME,
+} __packed;
+
+/*
+ *  struct mtk_cam_uapi_flk_param
+ *
+ *  @input_bit_sel: maximum pixel value of flicker statistic input
+ *  @offset_y: initial position for flicker statistic calculation in y direction
+ *  @crop_y: number of rows which will be cropped from bottom
+ *  @sgg_val[8]: Simple Gain and Gamma for noise reduction, sgg_val[0] is
+ *               gain and sgg_val[1] - sgg_val[7] are gamma table
+ *  @noise_thr: the noise threshold of pixel value, pixel value lower than
+ *              this value is considered as noise
+ *  @saturate_thr: the saturation threshold of pixel value, pixel value
+ *                 higher than this value is considered as saturated
+ *  @hdr_flk_src: flk source tap point selection
+ */
+struct mtk_cam_uapi_flk_param {
+	u32 input_bit_sel;
+	u32 offset_y;
+	u32 crop_y;
+	u32 sgg_val[8];
+	u32 noise_thr;
+	u32 saturate_thr;
+	u32 hdr_flk_src;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_tsf_param
+ *
+ *  @horizontal_num: block number of horizontal direction
+ *  @vertical_num:   block number of vertical direction
+ */
+struct mtk_cam_uapi_tsf_param {
+	u32 horizontal_num;
+	u32 vertical_num;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_pde_param
+ *
+ * @pdi_max_size: the max required memory size for pd table
+ * @pdo_max_size: the max required memory size for pd point output
+ * @pdo_x_size: the pd points out x size
+ * @pdo_y_size: the pd points out y size
+ * @pd_table_offset: the offset of pd table in the meta_cfg
+ */
+struct mtk_cam_uapi_pde_param {
+	u32 pdi_max_size;
+	u32 pdo_max_size;
+	u32 pdo_x_size;
+	u32 pdo_y_size;
+	u32 pd_table_offset;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_meta_hw_buf - hardware buffer info
+ *
+ * @offset: offset from the start of the device memory associated to the
+ *    v4l2 meta buffer
+ * @size: size of the buffer
+ *
+ * Some part of the meta buffers are read or written by statistic related
+ * hardware DMAs. The hardware buffers may have different size among
+ * difference pipeline.
+ */
+struct mtk_cam_uapi_meta_hw_buf {
+	u32 offset;
+	u32 size;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_pdp_stats - statistics of pd
+ *
+ * @stats_src:     source width and heitgh of the statistics.
+ * @stride:     stride value used by
+ * @pdo_buf:     The buffer for PD statistic hardware output.
+ *
+ * This is the PD statistic returned to user.
+ */
+struct mtk_cam_uapi_pdp_stats {
+	struct mtk_cam_uapi_meta_size stats_src;
+	u32 stride;
+	struct mtk_cam_uapi_meta_hw_buf pdo_buf;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_cpi_stats - statistics of pd
+ *
+ * @stats_src:     source width and heitgh of the statistics.
+ * @stride:     stride value used by
+ * @pdo_buf:     The buffer for PD statistic hardware output.
+ *
+ * This is the PD statistic returned to user.
+ */
+struct mtk_cam_uapi_cpi_stats {
+	struct mtk_cam_uapi_meta_size stats_src;
+	u32 stride;
+	struct mtk_cam_uapi_meta_hw_buf cpio_buf;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_mqe_param
+ *
+ * @mqe_mode:
+ */
+struct mtk_cam_uapi_mqe_param {
+	u32 mqe_mode;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_mobc_param
+ */
+struct mtk_cam_uapi_mobc_param {
+	u32 mobc_offst0;
+	u32 mobc_offst1;
+	u32 mobc_offst2;
+	u32 mobc_offst3;
+	u32 mobc_gain0;
+	u32 mobc_gain1;
+	u32 mobc_gain2;
+	u32 mobc_gain3;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_lsc_param
+ */
+struct mtk_cam_uapi_lsc_param {
+	u32 lsc_ctl1;
+	u32 lsc_ctl2;
+	u32 lsc_ctl3;
+	u32 lsc_lblock;
+	u32 lsc_fblock;
+	u32 lsc_ratio;
+	u32 lsc_tpipe_ofst;
+	u32 lsc_tpipe_size;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_sgg_param
+ */
+struct mtk_cam_uapi_sgg_param {
+	u32 sgg_pgn;
+	u32 sgg_gmrc_1;
+	u32 sgg_gmrc_2;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_mbn_param
+ */
+struct mtk_cam_uapi_mbn_param {
+	u32 mbn_pow;
+	u32 mbn_dir;
+	u32 mbn_spar_hei;
+	u32 mbn_spar_pow;
+	u32 mbn_spar_fac;
+	u32 mbn_spar_con1;
+	u32 mbn_spar_con0;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_cpi_param
+ */
+struct mtk_cam_uapi_cpi_param {
+	u32 cpi_th;
+	u32 cpi_pow;
+	u32 cpi_dir;
+	u32 cpi_spar_hei;
+	u32 cpi_spar_pow;
+	u32 cpi_spar_fac;
+	u32 cpi_spar_con1;
+	u32 cpi_spar_con0;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_lsci_param
+ */
+struct mtk_cam_uapi_lsci_param {
+	u32 lsci_xsize;
+	u32 lsci_ysize;
+} __packed;
+
+/*
+ * Common stuff for all statistics
+ */
+
+#define MTK_CAM_UAPI_MAX_CORE_NUM (2)
+
+/*
+ * struct mtk_cam_uapi_pipeline_config - pipeline configuration
+ *
+ * @num_of_core: The number of isp cores
+ */
+struct mtk_cam_uapi_pipeline_config {
+	u32	num_of_core;
+	struct	mtk_cam_uapi_meta_size core_data_size;
+	u32	core_pxl_mode_lg2;
+} __packed;
+
+/*
+ *  A U T O  E X P O S U R E
+ */
+
+/* please check the size of MTK_CAM_AE_HIST_MAX_BIN*/
+#define MTK_CAM_UAPI_AE_STATS_HIST_MAX_BIN (1024)
+
+/*
+ *  A E  A N D   A W B
+ */
+
+#define MTK_CAM_UAPI_AAO_BLK_SIZE (32)
+#define MTK_CAM_UAPI_AAO_MAX_BLK_X (128)
+#define MTK_CAM_UAPI_AAO_MAX_BLK_Y (128)
+#define MTK_CAM_UAPI_AAO_MAX_BUF_SIZE (MTK_CAM_UAPI_AAO_BLK_SIZE \
+					* MTK_CAM_UAPI_AAO_MAX_BLK_X \
+					* MTK_CAM_UAPI_AAO_MAX_BLK_Y)
+
+#define MTK_CAM_UAPI_AHO_BLK_SIZE (3)
+#define MTK_CAM_UAPI_AAHO_HIST_SIZE  (6 * 1024 * MTK_CAM_UAPI_AHO_BLK_SIZE \
+					+ 14 * 256 * MTK_CAM_UAPI_AHO_BLK_SIZE)
+#define MTK_CAM_UAPI_AAHO_MAX_BUF_SIZE  (MTK_CAM_UAPI_MAX_CORE_NUM * \
+					MTK_CAM_UAPI_AAHO_HIST_SIZE)
+
+/*
+ * struct mtk_cam_uapi_ae_awb_stats - statistics of ae and awb
+ *
+ * @aao_buf:       The buffer for AAHO statistic hardware output.
+ *        The maximum size of the buffer is defined with
+ *        MTK_CAM_UAPI_AAO_MAX_BUF_SIZE
+ * @aaho_buf:      The buffer for AAHO statistic hardware output.
+ *        The maximum size of the buffer is defined with
+ *        MTK_CAM_UAPI_AAHO_MAX_BUF_SIZE.
+ *
+ * This is the AE and AWB statistic returned to user. From  our hardware's
+ * point of view, we can't separate the AE and AWB output result, so I use
+ * a struct to retutn them.
+ */
+struct mtk_cam_uapi_ae_awb_stats {
+	u32 awb_stat_en_status;
+	u32 awb_qbn_acc;
+	u32 ae_stat_en_status;
+	struct mtk_cam_uapi_meta_hw_buf aao_buf;
+	struct mtk_cam_uapi_meta_hw_buf aaho_buf;
+} __packed;
+
+/*
+ *  A U T O  F O C U S
+ */
+
+#define MTK_CAM_UAPI_AFO_BLK_SIZ    (32)
+#define MTK_CAM_UAPI_AFO_MAX_BLK_NUM (128 * 128)
+#define MTK_CAM_UAPI_AFO_MAX_BUF_SIZE   (MTK_CAM_UAPI_AFO_BLK_SIZ \
+						* MTK_CAM_UAPI_AFO_MAX_BLK_NUM)
+
+/*
+ * struct mtk_cam_uapi_af_stats - af statistics
+ *
+ * @blk_num_x: block number of horizontal direction
+ * @blk_num_y: block number of vertical direction
+ * @afo_buf:    the buffer for AAHO statistic hardware output. The maximum
+ *      size of the buffer is defined with
+ *      MTK_CAM_UAPI_AFO_MAX_BUF_SIZE.
+ */
+struct mtk_cam_uapi_af_stats {
+	u32 blk_num_x;
+	u32 blk_num_y;
+	struct mtk_cam_uapi_meta_hw_buf afo_buf;
+} __packed;
+
+/*
+ *  F L I C K E R
+ */
+
+/* FLK's hardware output block size: 64 bits */
+#define MTK_CAM_UAPI_FLK_BLK_SIZE (8)
+
+/* Maximum block size (each line) of MediaTek flicker statistic */
+#define MTK_CAM_UAPI_FLK_MAX_STAT_BLK_NUM (6)
+
+/* Maximum height (in pixel) that driver can support */
+#define MTK_CAM_UAPI_FLK_MAX_FRAME_HEIGHT (9000)
+#define MTK_CAM_UAPI_FLK_MAX_BUF_SIZE                              \
+	(MTK_CAM_UAPI_FLK_BLK_SIZE * MTK_CAM_UAPI_FLK_MAX_STAT_BLK_NUM * \
+	MTK_CAM_UAPI_FLK_MAX_FRAME_HEIGHT)
+
+/*
+ * struct mtk_cam_uapi_flk_stats
+ *
+ * @flko_buf: the buffer for FLKO statistic hardware output. The maximum
+ *         size of the buffer is defined with MTK_CAM_UAPI_FLK_MAX_BUF_SIZE.
+ */
+struct mtk_cam_uapi_flk_stats {
+	struct mtk_cam_uapi_meta_hw_buf flko_buf;
+} __packed;
+
+/*
+ *  T S F
+ */
+
+#define MTK_CAM_UAPI_TSFSO_SIZE (40 * 30 * 3 * 4)
+
+/*
+ * struct mtk_cam_uapi_tsf_stats - TSF statistic data
+ *
+ * @tsfo_buf: The buffer for tsf statistic hardware output. The buffer size
+ *        is defined in MTK_CAM_UAPI_TSFSO_SIZE.
+ *
+ * This output is for MediaTek proprietary algorithm
+ */
+struct mtk_cam_uapi_tsf_stats {
+	struct mtk_cam_uapi_meta_hw_buf tsfo_r1_buf;
+	struct mtk_cam_uapi_meta_hw_buf tsfo_r2_buf;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_pd_stats - statistics of pd
+ *
+ * @stats_src:     source width and heitgh of the statistics.
+ * @stride:	   stride value used by
+ * @pdo_buf:	   The buffer for PD statistic hardware output.
+ *
+ * This is the PD statistic returned to user.
+ */
+struct mtk_cam_uapi_pd_stats {
+	struct	mtk_cam_uapi_meta_size stats_src;
+	u32	stride;
+	struct	mtk_cam_uapi_meta_hw_buf pdo_buf;
+} __packed;
+
+struct mtk_cam_uapi_timestamp {
+	u64 timestamp_buf[128];
+} __packed;
+
+/*
+ *  T O N E
+ */
+#define MTK_CAM_UAPI_LTMSO_SIZE ((37 * 12 * 9 + 258) * 8)
+#define MTK_CAM_UAPI_TNCSO_SIZE (680 * 510 * 2)
+#define MTK_CAM_UAPI_TNCSHO_SIZE (1544)
+#define MTK_CAM_UAPI_TNCSBO_SIZE (3888)
+#define MTK_CAM_UAPI_TNCSYO_SIZE (68)
+
+/*
+ * struct mtk_cam_uapi_ltm_stats - Tone1 statistic data for
+ *            MediaTek proprietary algorithm
+ *
+ * @ltmso_buf:  The buffer for ltm statistic hardware output. The buffer size
+ *    is defined in MTK_CAM_UAPI_LTMSO_SIZE.
+ * @blk_num_x: block number of horizontal direction
+ * @blk_num_y:  block number of vertical direction
+ */
+struct mtk_cam_uapi_ltm_stats {
+	struct mtk_cam_uapi_meta_hw_buf ltmso_buf;
+	u8 blk_num_x;
+	u8 blk_num_y;
+	u8 rsv[2];
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_tnc_stats - Tone2 statistic data for
+ *                 MediaTek proprietary algorithm
+ *
+ * @tncso_buf: The buffer for tnc statistic hardware output. The buffer size
+ *           is defined in MTK_CAM_UAPI_TNCSO_SIZE (680*510*2)
+ */
+struct mtk_cam_uapi_tnc_stats {
+	struct mtk_cam_uapi_meta_hw_buf tncso_buf;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_tnch_stats - Tone3 statistic data for MediaTek
+ *                                  proprietary algorithm
+ *
+ * @tncsho_buf: The buffer for tnch statistic hardware output. The buffer size
+ *           is defined in MTK_CAM_UAPI_TNCSHO_SIZE (1544)
+ */
+struct mtk_cam_uapi_tnch_stats {
+	struct mtk_cam_uapi_meta_hw_buf tncsho_buf;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_tncb_stats - Tone4 statistic data for MediaTek
+ *                                  proprietary algorithm
+ *
+ * @tncsbo_buf: The buffer for tncb statistic hardware output. The buffer size
+ *           is defined in MTK_CAM_UAPI_TNCSBO_SIZE (3888)
+ */
+struct mtk_cam_uapi_tncb_stats {
+	struct mtk_cam_uapi_meta_hw_buf tncsbo_buf;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_tncy_stats - Tone3 statistic data for MediaTek
+ *                                  proprietary algorithm
+ *
+ * @tncsyo_buf: The buffer for tncy statistic hardware output. The buffer size
+ *           is defined in MTK_CAM_UAPI_TNCSYO_SIZE (68)
+ */
+struct mtk_cam_uapi_tncy_stats {
+	struct mtk_cam_uapi_meta_hw_buf tncsyo_buf;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_act_stats - act statistic data for MediaTek
+ *                                  proprietary algorithm
+ *
+ * @actso_buf: The buffer for tncy statistic hardware output. The buffer size
+ *           is defined in MTK_CAM_UAPI_ACTSO_SIZE (768)
+ */
+#define MTK_CAM_UAPI_ACTSO_SIZE (768)
+struct mtk_cam_uapi_act_stats {
+	struct mtk_cam_uapi_meta_hw_buf actso_buf;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_awb_param_prot - AWB parameters
+ *
+ * @rot_cos: rotation matrix (cos part)
+ * @rot_sin: rotation matrix (sin part)
+ *
+ */
+struct mtk_cam_uapi_awb_param_prot {
+	s32 rot_cos;
+	s32 rot_sin;
+} __packed;
+
+/*
+ *  T U N I N G S
+ */
+
+/*
+ * struct mtk_cam_uapi_bpc_param_prot - BPC parameters
+ *
+ */
+#define MTK_CAM_BPCI_TABLE_SIZE (32)
+struct mtk_cam_uapi_bpc_param_prot {
+	u32 x_size;
+	u32 y_size;
+	u32 stride;
+
+	u8  table[MTK_CAM_BPCI_TABLE_SIZE];
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_drzs8t_param_prot
+ *
+ *  @tbl_shift: adjust the computed table
+ *  @tbl_min: use to limit the min table
+ */
+struct mtk_cam_uapi_drzs8t_param_prot {
+	u32 tbl_shift;
+	u32 tbl_min;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_lsc_param_prot - LSC parameters
+ *
+ */
+#define MTK_CAM_LSCI_TABLE_SIZE (32768)
+struct mtk_cam_uapi_lsc_param_prot {
+	u32 x_blk_num;
+	u32 y_blk_num;
+	u32 x_size;
+	u32 y_size;
+	u32 stride;
+	u8 table[MTK_CAM_LSCI_TABLE_SIZE];
+} __packed;
+
+/* *
+ * struct mtk_cam_uapi_slk_param_prot - slk tuning setting from userspace
+ *
+ */
+struct mtk_cam_uapi_slk_param_prot {
+	u32 center_x;
+	u32 center_y;
+	u32 radius_0;
+	u32 radius_1;
+	u32 radius_2;
+	u32 gain0;
+	u32 gain1;
+	u32 gain2;
+	u32 gain3;
+	u32 gain4;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_wb_param_prot - WB parameters
+ *
+ */
+struct mtk_cam_uapi_wb_param_prot {
+	u32 debug_info[39];
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_ltms_param_prot - LTMS parameters
+ *
+ *  @ratio_x_start: adjusted start point of width related to original width
+ *  @ratio_y_start: adjusted start point of height related to original height
+ *  @ratio_x_end: adjusted end point of width related to original width
+ *  @ratio_y_end: adjusted end point of height related to original height
+ */
+struct mtk_cam_uapi_ltms_param_prot {
+	u32 ltms_gamma_en;
+	u32 ratio_x_start;
+	u32 ratio_y_start;
+	u32 ratio_x_end;
+	u32 ratio_y_end;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_yuvo_param_prot - YUVO parameters
+ *
+ *  @drzh2n_fixed_down_ratio: down scale ratio
+ */
+struct mtk_cam_uapi_yuvo_param_prot {
+	u32 drzh2n_fixed_down_ratio;
+} __packed;
+
+/* The following sw setting are generated by script */
+/*
+ * struct mtk_cam_uapi_ccm_param_prot - CCM parameters *
+ */
+struct mtk_cam_uapi_ccm_param_prot {
+	u32 ccm_acc;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_drzh2n_param_prot - DRZH2N parameters *
+ */
+struct mtk_cam_uapi_drzh2n_param_prot {
+	u32 drzh2n_vert_tbl_sel;
+	u32 drzh2n_hori_tbl_sel;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_drzs4n_param_prot - DRZS4N parameters *
+ */
+struct mtk_cam_uapi_drzs4n_param_prot {
+	u32 drzs4n_vert_tbl_sel;
+	u32 drzs4n_hori_tbl_sel;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_tncs_param_prot - TNCS parameters *
+ */
+struct mtk_cam_uapi_tncs_param_prot {
+	u32 tncs_ggm_lnr;
+	u32 tncs_ggm_end_var;
+} __packed;
+
+/*
+ * MediaTek camera bpc tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_bpc {
+	u32 bpc_func_con;
+	u32 rsv0[49];
+} __packed;
+
+/*
+ * MediaTek camera ccm tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_ccm {
+	u32 ccm_cnv_1;
+	u32 ccm_cnv_2;
+	u32 ccm_cnv_3;
+	u32 ccm_cnv_4;
+	u32 ccm_cnv_5;
+	u32 ccm_cnv_6;
+} __packed;
+
+/*
+ * MediaTek camera dm tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_dm {
+	u32 rsv0;
+	u32 dm_intp_nat;
+	u32 rsv1[3];
+	u32 dm_sl_ctl;
+	u32 rsv2;
+	u32 dm_nr_str;
+	u32 dm_nr_act;
+	u32 dm_hf_str;
+	u32 dm_hf_act1;
+	u32 dm_hf_act2;
+	u32 dm_clip;
+	u32 rsv3[8];
+	u32 dm_ee;
+	u32 rsv4[4];
+} __packed;
+
+/*
+ * MediaTek camera g2c tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_g2c {
+	u32 g2c_conv_0a;
+	u32 g2c_conv_0b;
+	u32 g2c_conv_1a;
+	u32 g2c_conv_1b;
+	u32 g2c_conv_2a;
+	u32 g2c_conv_2b;
+} __packed;
+
+#define MTK_CAM_UAPI_GGM_LUT (256)
+/*
+ * MediaTek camera ggm tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_ggm {
+	u32 ggm_lut[MTK_CAM_UAPI_GGM_LUT];
+	u32 ggm_ctrl;
+} __packed;
+
+/*
+ * MediaTek camera lsc tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_lsc {
+	u32 lsc_ratio;
+} __packed;
+
+#define MTK_CAM_UAPI_LTM_CURVE_SIZE_2 (1728)
+#define MTK_CAM_UAPI_LTM_CLP_SIZE_2 (108)
+
+/*
+ * MediaTek camera ltm tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_ltm {
+	u32 ltm_ctrl;
+	u32 ltm_blk_num;
+	u32 ltm_max_div;
+	u32 ltm_clip;
+	u32 ltm_cfg;
+	u32 ltm_clip_th;
+	u32 ltm_gain_map;
+	u32 ltm_cvnode_grp0;
+	u32 ltm_cvnode_grp1;
+	u32 ltm_cvnode_grp2;
+	u32 ltm_cvnode_grp3;
+	u32 ltm_cvnode_grp4;
+	u32 ltm_cvnode_grp5;
+	u32 ltm_cvnode_grp6;
+	u32 ltm_cvnode_grp7;
+	u32 ltm_cvnode_grp8;
+	u32 ltm_cvnode_grp9;
+	u32 ltm_cvnode_grp10;
+	u32 ltm_cvnode_grp11;
+	u32 ltm_cvnode_grp12;
+	u32 ltm_cvnode_grp13;
+	u32 ltm_cvnode_grp14;
+	u32 ltm_cvnode_grp15;
+	u32 ltm_cvnode_grp16;
+	u32 ltm_out_str;
+	u32 ltm_act_win_x;
+	u32 ltm_act_win_y;
+	u32 ltmtc_curve[MTK_CAM_UAPI_LTM_CURVE_SIZE_2];
+	u32 ltmtc_clp[MTK_CAM_UAPI_LTM_CLP_SIZE_2];
+} __packed;
+
+/*
+ * MediaTek camera ltms tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_ltms {
+	u32 ltms_max_div;
+	u32 ltms_blkhist_lb;
+	u32 ltms_blkhist_mb;
+	u32 ltms_blkhist_ub;
+	u32 ltms_blkhist_int;
+	u32 ltms_clip_th_cal;
+	u32 ltms_clip_th_lb;
+	u32 ltms_clip_th_hb;
+	u32 ltms_glbhist_int;
+} __packed;
+
+/*
+ * MediaTek camera obc tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_obc {
+	u32 obc_dbs;
+	u32 obc_gray_bld_0;
+	u32 obc_gray_bld_1;
+	u32 obc_wbg_rb;
+	u32 obc_wbg_g;
+	u32 obc_wbig_rb;
+	u32 obc_wbig_g;
+	u32 obc_obg_rb;
+	u32 obc_obg_g;
+	u32 obc_offset_r;
+	u32 obc_offset_gr;
+	u32 obc_offset_gb;
+	u32 obc_offset_b;
+	u32 rsv1[2];
+} __packed;
+
+/*
+ * MediaTek camera tsfs tuning setting
+ */
+struct mtk_cam_uapi_regmap_raw_tsfs {
+	u32 tsfs_dgain;
+} __packed;
+
+/*
+ * Usage example: To print value of "MTK_CAM_BPC_BPC_FUNC_CON_BPC_BPC_LUT_BIT_EXTEND_EN" in "val"
+ * > printf("%x", GET_MTK_CAM(val, MTK_CAM_BPC_BPC_FUNC_CON_BPC_BPC_LUT_BIT_EXTEND_EN));
+ */
+#define GET_MTK_CAM(val, field) \
+	(((val) & field##_MASK) >> field##_SHIFT)
+/*
+ * Usage example: To set "val_of_bpc_lut_bit_extend_en" to bits
+ * of "MTK_CAM_BPC_BPC_FUNC_CON_BPC_BPC_LUT_BIT_EXTEND_EN" in "val"
+ * > val = SET_MTK_CAM(val, MTK_CAM_BPC_BPC_FUNC_CON_BPC_BPC_LUT_BIT_EXTEND_EN,
+ * val_of_bpc_lut_bit_extend_en);
+ */
+#define SET_MTK_CAM(val, field, set_val) \
+	(((val) & ~field##_MASK) | (((set_val) << field##_SHIFT) & field##_MASK))
+
+/*
+ * Bit Feild of BPC_FUNC_CON: BPC_EN
+ * MTK_CAM_BPC_FUNC_CON_BPC_EN: [31, 31]
+ * Enable/disable for BPC Correction
+ * 1'd1: enable the function
+ * 1'd0: disable the function
+ */
+#define MTK_CAM_BPC_FUNC_CON_BPC_EN_MASK   0x80000000
+#define MTK_CAM_BPC_FUNC_CON_BPC_EN_SHIFT  31
+
+/*
+ * Bit Feild of BPC_FUNC_CON: BPC_CT_EN
+ * MTK_CAM_BPC_FUNC_CON_BPC_CT_EN: [30, 30]
+ * Enable/disable for Cross-Talk compensation
+ * 1'd1: enable
+ * 1'd0: disable
+ */
+#define MTK_CAM_BPC_FUNC_CON_BPC_CT_EN_MASK   0x40000000
+#define MTK_CAM_BPC_FUNC_CON_BPC_CT_EN_SHIFT  30
+
+/*
+ * Bit Feild of BPC_FUNC_CON: BPC_PDC_EN
+ * MTK_CAM_BPC_FUNC_CON_BPC_PDC_EN: [29, 29]
+ * Enable/disable for PDC correction
+ * 1'd1: enable
+ * 1'd0: disable
+ */
+#define MTK_CAM_BPC_FUNC_CON_BPC_PDC_EN_MASK   0x20000000
+#define MTK_CAM_BPC_FUNC_CON_BPC_PDC_EN_SHIFT  29
+
+/*
+ * Bit Feild of BPC_FUNC_CON: BPC_LUT_EN
+ * MTK_CAM_BPC_FUNC_CON_BPC_LUT_EN: [28, 28]
+ * Enable table lookup
+ * 1'd1:  enable BPC with default table mode
+ * 1'd0:  disable BPC with default table mode
+ */
+#define MTK_CAM_BPC_FUNC_CON_BPC_LUT_EN_MASK   0x10000000
+#define MTK_CAM_BPC_FUNC_CON_BPC_LUT_EN_SHIFT  28
+
+/*
+ * Bit Feild of BPC_FUNC_CON: BPC_LUT_BIT_EXTEND_EN
+ * MTK_CAM_BPC_FUNC_CON_BPC_LUT_BIT_EXTEND_EN: [0, 0]
+ * Enable table 24 bits mode
+ * 1'd1: Table format to be 24 bits
+ * 1'd0: @ the original format, tbale to be 16 bits mode
+ */
+#define MTK_CAM_BPC_FUNC_CON_BPC_LUT_BIT_EXTEND_EN_MASK   0x00000001
+#define MTK_CAM_BPC_FUNC_CON_BPC_LUT_BIT_EXTEND_EN_SHIFT  0
+
+/*
+ * Bit Feild of CCM_CNV_1: CCM_CNV_01
+ * MTK_CAM_CCM_CNV_1_CCM_CNV_01: [16, 28]
+ * matrix 0,1 coefficient
+ */
+#define MTK_CAM_CCM_CNV_1_CCM_CNV_01_MASK   0x1fff0000
+#define MTK_CAM_CCM_CNV_1_CCM_CNV_01_SHIFT  16
+
+/*
+ * Bit Feild of CCM_CNV_1: CCM_CNV_00
+ * MTK_CAM_CCM_CNV_1_CCM_CNV_00: [0, 12]
+ * matrix 0,0 coefficient
+ */
+#define MTK_CAM_CCM_CNV_1_CCM_CNV_00_MASK   0x00001fff
+#define MTK_CAM_CCM_CNV_1_CCM_CNV_00_SHIFT  0
+
+/*
+ * Bit Feild of CCM_CNV_2: CCM_CNV_02
+ * MTK_CAM_CCM_CNV_2_CCM_CNV_02: [0, 12]
+ * matrix 0,2 coefficient
+ */
+#define MTK_CAM_CCM_CNV_2_CCM_CNV_02_MASK   0x00001fff
+#define MTK_CAM_CCM_CNV_2_CCM_CNV_02_SHIFT  0
+
+/*
+ * Bit Feild of CCM_CNV_3: CCM_CNV_11
+ * MTK_CAM_CCM_CNV_3_CCM_CNV_11: [16, 28]
+ * matrix 1,1 coefficient
+ */
+#define MTK_CAM_CCM_CNV_3_CCM_CNV_11_MASK   0x1fff0000
+#define MTK_CAM_CCM_CNV_3_CCM_CNV_11_SHIFT  16
+
+/*
+ * Bit Feild of CCM_CNV_3: CCM_CNV_10
+ * MTK_CAM_CCM_CNV_3_CCM_CNV_10: [0, 12]
+ * matrix 1,0 coefficient
+ */
+#define MTK_CAM_CCM_CNV_3_CCM_CNV_10_MASK   0x00001fff
+#define MTK_CAM_CCM_CNV_3_CCM_CNV_10_SHIFT  0
+
+/*
+ * Bit Feild of CCM_CNV_4: CCM_CNV_12
+ * MTK_CAM_CCM_CNV_4_CCM_CNV_12: [0, 12]
+ * matrix 1,2 coefficient
+ */
+#define MTK_CAM_CCM_CNV_4_CCM_CNV_12_MASK   0x00001fff
+#define MTK_CAM_CCM_CNV_4_CCM_CNV_12_SHIFT  0
+
+/*
+ * Bit Feild of CCM_CNV_5: CCM_CNV_21
+ * MTK_CAM_CCM_CNV_5_CCM_CNV_21: [16, 28]
+ * matrix 2,1 coefficient
+ */
+#define MTK_CAM_CCM_CNV_5_CCM_CNV_21_MASK   0x1fff0000
+#define MTK_CAM_CCM_CNV_5_CCM_CNV_21_SHIFT  16
+
+/*
+ * Bit Feild of CCM_CNV_5: CCM_CNV_20
+ * MTK_CAM_CCM_CNV_5_CCM_CNV_20: [0, 12]
+ * matrix 2,0 coefficient
+ */
+#define MTK_CAM_CCM_CNV_5_CCM_CNV_20_MASK   0x00001fff
+#define MTK_CAM_CCM_CNV_5_CCM_CNV_20_SHIFT  0
+
+/*
+ * Bit Feild of CCM_CNV_6: CCM_CNV_22
+ * MTK_CAM_CCM_CNV_6_CCM_CNV_22: [0, 12]
+ * matrix 2,2 coefficient
+ */
+#define MTK_CAM_CCM_CNV_6_CCM_CNV_22_MASK   0x00001fff
+#define MTK_CAM_CCM_CNV_6_CCM_CNV_22_SHIFT  0
+
+/*
+ * Bit Feild of DM_INTP_NAT: DM_L0_OFST
+ * MTK_CAM_DM_INTP_NAT_DM_L0_OFST: [12, 19]
+ * luma blending LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_INTP_NAT_DM_L0_OFST_MASK   0x000ff000
+#define MTK_CAM_DM_INTP_NAT_DM_L0_OFST_SHIFT  12
+
+/*
+ * Bit Feild of DM_SL_CTL: DM_SL_Y1
+ * MTK_CAM_DM_SL_CTL_DM_SL_Y1: [14, 21]
+ * shading link modulation LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_SL_CTL_DM_SL_Y1_MASK   0x003fc000
+#define MTK_CAM_DM_SL_CTL_DM_SL_Y1_SHIFT  14
+
+/*
+ * Bit Feild of DM_SL_CTL: DM_SL_Y2
+ * MTK_CAM_DM_SL_CTL_DM_SL_Y2: [6, 13]
+ * shading link modulation LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_SL_CTL_DM_SL_Y2_MASK   0x00003fc0
+#define MTK_CAM_DM_SL_CTL_DM_SL_Y2_SHIFT  6
+
+/*
+ * Bit Feild of DM_SL_CTL: DM_SL_EN
+ * MTK_CAM_DM_SL_CTL_DM_SL_EN: [0, 0]
+ * shading link enable
+ * 0: disable SL
+ * 1: enable SL
+ */
+#define MTK_CAM_DM_SL_CTL_DM_SL_EN_MASK   0x00000001
+#define MTK_CAM_DM_SL_CTL_DM_SL_EN_SHIFT  0
+
+/*
+ * Bit Feild of DM_NR_STR: DM_N0_STR
+ * MTK_CAM_DM_NR_STR_DM_N0_STR: [10, 14]
+ * noise reduction strength
+ * 0 ~ 16
+ */
+#define MTK_CAM_DM_NR_STR_DM_N0_STR_MASK   0x00007c00
+#define MTK_CAM_DM_NR_STR_DM_N0_STR_SHIFT  10
+
+/*
+ * Bit Feild of DM_NR_ACT: DM_N0_OFST
+ * MTK_CAM_DM_NR_ACT_DM_N0_OFST: [24, 31]
+ * noise reduction activity LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_NR_ACT_DM_N0_OFST_MASK   0xff000000
+#define MTK_CAM_DM_NR_ACT_DM_N0_OFST_SHIFT  24
+
+/*
+ * Bit Feild of DM_HF_STR: DM_HA_STR
+ * MTK_CAM_DM_HF_STR_DM_HA_STR: [27, 31]
+ * overall high frequency strength
+ * 0 ~ 31
+ */
+#define MTK_CAM_DM_HF_STR_DM_HA_STR_MASK   0xf8000000
+#define MTK_CAM_DM_HF_STR_DM_HA_STR_SHIFT  27
+
+/*
+ * Bit Feild of DM_HF_STR: DM_H1_GN
+ * MTK_CAM_DM_HF_STR_DM_H1_GN: [22, 26]
+ * individual high frequency strength
+ * 0 ~ 31
+ */
+#define MTK_CAM_DM_HF_STR_DM_H1_GN_MASK   0x07c00000
+#define MTK_CAM_DM_HF_STR_DM_H1_GN_SHIFT  22
+
+/*
+ * Bit Feild of DM_HF_STR: DM_H2_GN
+ * MTK_CAM_DM_HF_STR_DM_H2_GN: [17, 21]
+ * individual high frequency strength
+ * 0 ~ 31
+ */
+#define MTK_CAM_DM_HF_STR_DM_H2_GN_MASK   0x003e0000
+#define MTK_CAM_DM_HF_STR_DM_H2_GN_SHIFT  17
+
+/*
+ * Bit Feild of DM_HF_STR: DM_H3_GN
+ * MTK_CAM_DM_HF_STR_DM_H3_GN: [12, 16]
+ * individual high frequency strength
+ * 0 ~ 31
+ */
+#define MTK_CAM_DM_HF_STR_DM_H3_GN_MASK   0x0001f000
+#define MTK_CAM_DM_HF_STR_DM_H3_GN_SHIFT  12
+
+/*
+ * Bit Feild of DM_HF_ACT1: DM_H1_LWB
+ * MTK_CAM_DM_HF_ACT1_DM_H1_LWB: [24, 31]
+ * high frequency activity LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_HF_ACT1_DM_H1_LWB_MASK   0xff000000
+#define MTK_CAM_DM_HF_ACT1_DM_H1_LWB_SHIFT  24
+
+/*
+ * Bit Feild of DM_HF_ACT1: DM_H1_UPB
+ * MTK_CAM_DM_HF_ACT1_DM_H1_UPB: [16, 23]
+ * high frequency activity LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_HF_ACT1_DM_H1_UPB_MASK   0x00ff0000
+#define MTK_CAM_DM_HF_ACT1_DM_H1_UPB_SHIFT  16
+
+/*
+ * Bit Feild of DM_HF_ACT1: DM_H2_LWB
+ * MTK_CAM_DM_HF_ACT1_DM_H2_LWB: [8, 15]
+ * high frequency activity LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_HF_ACT1_DM_H2_LWB_MASK   0x0000ff00
+#define MTK_CAM_DM_HF_ACT1_DM_H2_LWB_SHIFT  8
+
+/*
+ * Bit Feild of DM_HF_ACT1: DM_H2_UPB
+ * MTK_CAM_DM_HF_ACT1_DM_H2_UPB: [0, 7]
+ * high frequency activity LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_HF_ACT1_DM_H2_UPB_MASK   0x000000ff
+#define MTK_CAM_DM_HF_ACT1_DM_H2_UPB_SHIFT  0
+
+/*
+ * Bit Feild of DM_HF_ACT2: DM_H3_LWB
+ * MTK_CAM_DM_HF_ACT2_DM_H3_LWB: [16, 23]
+ * high frequency activity LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_HF_ACT2_DM_H3_LWB_MASK   0x00ff0000
+#define MTK_CAM_DM_HF_ACT2_DM_H3_LWB_SHIFT  16
+
+/*
+ * Bit Feild of DM_HF_ACT2: DM_H3_UPB
+ * MTK_CAM_DM_HF_ACT2_DM_H3_UPB: [8, 15]
+ * high frequency activity LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_HF_ACT2_DM_H3_UPB_MASK   0x0000ff00
+#define MTK_CAM_DM_HF_ACT2_DM_H3_UPB_SHIFT  8
+
+/*
+ * Bit Feild of DM_CLIP: DM_OV_TH
+ * MTK_CAM_DM_CLIP_DM_OV_TH: [16, 23]
+ * over/undershoot brightness LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_CLIP_DM_OV_TH_MASK   0x00ff0000
+#define MTK_CAM_DM_CLIP_DM_OV_TH_SHIFT  16
+
+/*
+ * Bit Feild of DM_CLIP: DM_UN_TH
+ * MTK_CAM_DM_CLIP_DM_UN_TH: [8, 15]
+ * over/undershoot brightness LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_CLIP_DM_UN_TH_MASK   0x0000ff00
+#define MTK_CAM_DM_CLIP_DM_UN_TH_SHIFT  8
+
+/*
+ * Bit Feild of DM_CLIP: DM_CLIP_TH
+ * MTK_CAM_DM_CLIP_DM_CLIP_TH: [0, 7]
+ * over/undershoot activity LUT
+ * 0 ~ 255
+ */
+#define MTK_CAM_DM_CLIP_DM_CLIP_TH_MASK   0x000000ff
+#define MTK_CAM_DM_CLIP_DM_CLIP_TH_SHIFT  0
+
+/*
+ * Bit Feild of DM_EE: DM_HNEG_GN
+ * MTK_CAM_DM_EE_DM_HNEG_GN: [5, 9]
+ * edge enhancement negative gain
+ * 0~16
+ */
+#define MTK_CAM_DM_EE_DM_HNEG_GN_MASK   0x000003e0
+#define MTK_CAM_DM_EE_DM_HNEG_GN_SHIFT  5
+
+/*
+ * Bit Feild of DM_EE: DM_HPOS_GN
+ * MTK_CAM_DM_EE_DM_HPOS_GN: [0, 4]
+ * edge enhancement positive gain
+ * 0~16
+ */
+#define MTK_CAM_DM_EE_DM_HPOS_GN_MASK   0x0000001f
+#define MTK_CAM_DM_EE_DM_HPOS_GN_SHIFT  0
+
+/*
+ * Bit Feild of G2C_CONV_0A: G2C_CNV_01
+ * MTK_CAM_G2C_CONV_0A_G2C_CNV_01: [16, 26]
+ * DIP RGB 2 YUV Matrix 0,1 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_0A_G2C_CNV_01_MASK   0x07ff0000
+#define MTK_CAM_G2C_CONV_0A_G2C_CNV_01_SHIFT  16
+
+/*
+ * Bit Feild of G2C_CONV_0A: G2C_CNV_00
+ * MTK_CAM_G2C_CONV_0A_G2C_CNV_00: [0, 10]
+ * DIP RGB 2 YUV Matrix 0,0 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_0A_G2C_CNV_00_MASK   0x000007ff
+#define MTK_CAM_G2C_CONV_0A_G2C_CNV_00_SHIFT  0
+
+/*
+ * Bit Feild of G2C_CONV_0B: G2C_Y_OFST
+ * MTK_CAM_G2C_CONV_0B_G2C_Y_OFST: [16, 30]
+ * Y offset. Q1.10.0 (mobile) or Q1.14.0 (non-mobile)
+ */
+#define MTK_CAM_G2C_CONV_0B_G2C_Y_OFST_MASK   0x7fff0000
+#define MTK_CAM_G2C_CONV_0B_G2C_Y_OFST_SHIFT  16
+
+/*
+ * Bit Feild of G2C_CONV_0B: G2C_CNV_02
+ * MTK_CAM_G2C_CONV_0B_G2C_CNV_02: [0, 10]
+ * DIP RGB 2 YUV Matrix 0,2 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_0B_G2C_CNV_02_MASK   0x000007ff
+#define MTK_CAM_G2C_CONV_0B_G2C_CNV_02_SHIFT  0
+
+/*
+ * Bit Feild of G2C_CONV_1A: G2C_CNV_11
+ * MTK_CAM_G2C_CONV_1A_G2C_CNV_11: [16, 26]
+ * DIP RGB 2 YUV Matrix 1,1 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_1A_G2C_CNV_11_MASK   0x07ff0000
+#define MTK_CAM_G2C_CONV_1A_G2C_CNV_11_SHIFT  16
+
+/*
+ * Bit Feild of G2C_CONV_1A: G2C_CNV_10
+ * MTK_CAM_G2C_CONV_1A_G2C_CNV_10: [0, 10]
+ * DIP RGB 2 YUV Matrix 1,0 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_1A_G2C_CNV_10_MASK   0x000007ff
+#define MTK_CAM_G2C_CONV_1A_G2C_CNV_10_SHIFT  0
+
+/*
+ * Bit Feild of G2C_CONV_1B: G2C_U_OFST
+ * MTK_CAM_G2C_CONV_1B_G2C_U_OFST: [16, 29]
+ * U offset. Q1.9.0 (mobile) or Q1.13.0 (non-mobile)
+ */
+#define MTK_CAM_G2C_CONV_1B_G2C_U_OFST_MASK   0x3fff0000
+#define MTK_CAM_G2C_CONV_1B_G2C_U_OFST_SHIFT  16
+
+/*
+ * Bit Feild of G2C_CONV_1B: G2C_CNV_12
+ * MTK_CAM_G2C_CONV_1B_G2C_CNV_12: [0, 10]
+ * DIP RGB 2 YUV Matrix 1,2 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_1B_G2C_CNV_12_MASK   0x000007ff
+#define MTK_CAM_G2C_CONV_1B_G2C_CNV_12_SHIFT  0
+
+/*
+ * Bit Feild of G2C_CONV_2A: G2C_CNV_21
+ * MTK_CAM_G2C_CONV_2A_G2C_CNV_21: [16, 26]
+ * DIP RGB 2 YUV Matrix 2,1 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_2A_G2C_CNV_21_MASK   0x07ff0000
+#define MTK_CAM_G2C_CONV_2A_G2C_CNV_21_SHIFT  16
+
+/*
+ * Bit Feild of G2C_CONV_2A: G2C_CNV_20
+ * MTK_CAM_G2C_CONV_2A_G2C_CNV_20: [0, 10]
+ * DIP RGB 2 YUV Matrix 2,0 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_2A_G2C_CNV_20_MASK   0x000007ff
+#define MTK_CAM_G2C_CONV_2A_G2C_CNV_20_SHIFT  0
+
+/*
+ * Bit Feild of G2C_CONV_2B: G2C_V_OFST
+ * MTK_CAM_G2C_CONV_2B_G2C_V_OFST: [16, 29]
+ * V offset. Q1.9.0 (mobile) or Q1.13.0 (non-mobile)
+ */
+#define MTK_CAM_G2C_CONV_2B_G2C_V_OFST_MASK   0x3fff0000
+#define MTK_CAM_G2C_CONV_2B_G2C_V_OFST_SHIFT  16
+
+/*
+ * Bit Feild of G2C_CONV_2B: G2C_CNV_22
+ * MTK_CAM_G2C_CONV_2B_G2C_CNV_22: [0, 10]
+ * DIP RGB 2 YUV Matrix 2,2 coefficient in Q1.1.9
+ */
+#define MTK_CAM_G2C_CONV_2B_G2C_CNV_22_MASK   0x000007ff
+#define MTK_CAM_G2C_CONV_2B_G2C_CNV_22_SHIFT  0
+
+/*
+ * Bit Feild of GGM_LUT: GGM_LUT
+ * MTK_CAM_GGM_LUT_GGM_LUT: [0, 9]
+ * Gamma table entry
+ * Do NOT read/write this control register when GGM is
+ * enabled (ISP pipeline processing is on-going) or output
+ * data of GGM will be gated
+ */
+#define MTK_CAM_GGM_LUT_GGM_LUT_MASK   0x000003ff
+#define MTK_CAM_GGM_LUT_GGM_LUT_SHIFT  0
+
+/*
+ * Bit Feild of GGM_CTRL: GGM_LNR
+ * MTK_CAM_GGM_CTRL_GGM_LNR: [0, 0]
+ * Enable linear output
+ */
+#define MTK_CAM_GGM_CTRL_GGM_LNR_MASK   0x00000001
+#define MTK_CAM_GGM_CTRL_GGM_LNR_SHIFT  0
+
+/*
+ * Bit Feild of GGM_CTRL: GGM_END_VAR
+ * MTK_CAM_GGM_CTRL_GGM_END_VAR: [1, 10]
+ * end point value
+ */
+#define MTK_CAM_GGM_CTRL_GGM_END_VAR_MASK   0x000007fe
+#define MTK_CAM_GGM_CTRL_GGM_END_VAR_SHIFT  1
+
+/*
+ * Bit Feild of GGM_CTRL: GGM_RMP_VAR
+ * MTK_CAM_GGM_CTRL_GGM_RMP_VAR: [16, 20]
+ * 5-bit: can support mapping to 14-bit output, (RMP_VAR+out limiter)/1024
+ */
+#define MTK_CAM_GGM_CTRL_GGM_RMP_VAR_MASK   0x001f0000
+#define MTK_CAM_GGM_CTRL_GGM_RMP_VAR_SHIFT  16
+
+/*
+ * Bit Feild of LSC_RATIO: LSC_RA00
+ * MTK_CAM_LSC_RATIO_LSC_RA00: [0, 5]
+ * Shading ratio
+ */
+#define MTK_CAM_LSC_RATIO_LSC_RA00_MASK   0x0000003f
+#define MTK_CAM_LSC_RATIO_LSC_RA00_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_MAX_DIV: LTMS_CLIP_TH_ALPHA_BASE
+ * MTK_CAM_LTMS_MAX_DIV_LTMS_CLIP_TH_ALPHA_BASE: [0, 9]
+ * Divider for Maxvalue
+ */
+#define MTK_CAM_LTMS_MAX_DIV_LTMS_CLIP_TH_ALPHA_BASE_MASK   0x000003ff
+#define MTK_CAM_LTMS_MAX_DIV_LTMS_CLIP_TH_ALPHA_BASE_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_MAX_DIV: LTMS_CLIP_TH_ALPHA_BASE_SHIFT_BIT
+ * MTK_CAM_LTMS_MAX_DIV_LTMS_CLIP_TH_ALPHA_BASE_SHIFT_BIT: [16, 20]
+ * Divider for Maxvalue
+ */
+#define MTK_CAM_LTMS_MAX_DIV_LTMS_CLIP_TH_ALPHA_BASE_SHIFT_BIT_MASK   0x001f0000
+#define MTK_CAM_LTMS_MAX_DIV_LTMS_CLIP_TH_ALPHA_BASE_SHIFT_BIT_SHIFT  16
+
+/*
+ * Bit Feild of LTMS_BLKHIST_LB: LTMS_BLKHIST_LB
+ * MTK_CAM_LTMS_BLKHIST_LB_LTMS_BLKHIST_LB: [0, 17]
+ * block histogram low bound,
+ * BLKHIST_UB>=BLKHIST_MB>=BLKHIST_LB
+ */
+#define MTK_CAM_LTMS_BLKHIST_LB_LTMS_BLKHIST_LB_MASK   0x0003ffff
+#define MTK_CAM_LTMS_BLKHIST_LB_LTMS_BLKHIST_LB_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_BLKHIST_MB: LTMS_BLKHIST_MB
+ * MTK_CAM_LTMS_BLKHIST_MB_LTMS_BLKHIST_MB: [0, 17]
+ * block histogram middle bound,
+ * BLKHIST_UB>=BLKHIST_MB>=BLKHIST_LB
+ */
+#define MTK_CAM_LTMS_BLKHIST_MB_LTMS_BLKHIST_MB_MASK   0x0003ffff
+#define MTK_CAM_LTMS_BLKHIST_MB_LTMS_BLKHIST_MB_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_BLKHIST_UB: LTMS_BLKHIST_UB
+ * MTK_CAM_LTMS_BLKHIST_UB_LTMS_BLKHIST_UB: [0, 17]
+ * block histogram up bound,
+ * BLKHIST_UB>=BLKHIST_MB>=BLKHIST_LB
+ */
+#define MTK_CAM_LTMS_BLKHIST_UB_LTMS_BLKHIST_UB_MASK   0x0003ffff
+#define MTK_CAM_LTMS_BLKHIST_UB_LTMS_BLKHIST_UB_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_BLKHIST_INT: LTMS_BLKHIST_INT1
+ * MTK_CAM_LTMS_BLKHIST_INT_LTMS_BLKHIST_INT1: [0, 13]
+ * block histogram interval 1
+ */
+#define MTK_CAM_LTMS_BLKHIST_INT_LTMS_BLKHIST_INT1_MASK   0x00003fff
+#define MTK_CAM_LTMS_BLKHIST_INT_LTMS_BLKHIST_INT1_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_BLKHIST_INT: LTMS_BLKHIST_INT2
+ * MTK_CAM_LTMS_BLKHIST_INT_LTMS_BLKHIST_INT2: [16, 29]
+ * block histogram interval 2
+ */
+#define MTK_CAM_LTMS_BLKHIST_INT_LTMS_BLKHIST_INT2_MASK   0x3fff0000
+#define MTK_CAM_LTMS_BLKHIST_INT_LTMS_BLKHIST_INT2_SHIFT  16
+
+/*
+ * Bit Feild of LTMS_CLIP_TH_CAL: LTMS_CLP_HLTHD
+ * MTK_CAM_LTMS_CLIP_TH_CAL_LTMS_CLP_HLTHD: [0, 10]
+ * control percentage of histogram to calculate clip_th, 10-bits precision.
+ */
+#define MTK_CAM_LTMS_CLIP_TH_CAL_LTMS_CLP_HLTHD_MASK   0x000007ff
+#define MTK_CAM_LTMS_CLIP_TH_CAL_LTMS_CLP_HLTHD_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_CLIP_TH_CAL: LTMS_CLP_STARTBIN
+ * MTK_CAM_LTMS_CLIP_TH_CAL_LTMS_CLP_STARTBIN: [16, 23]
+ * start bin of histogram.
+ */
+#define MTK_CAM_LTMS_CLIP_TH_CAL_LTMS_CLP_STARTBIN_MASK   0x00ff0000
+#define MTK_CAM_LTMS_CLIP_TH_CAL_LTMS_CLP_STARTBIN_SHIFT  16
+
+/*
+ * Bit Feild of LTMS_CLIP_TH_LB: LTMS_CLP_LB
+ * MTK_CAM_LTMS_CLIP_TH_LB_LTMS_CLP_LB: [0, 21]
+ * Low bound of clip threshold output.
+ */
+#define MTK_CAM_LTMS_CLIP_TH_LB_LTMS_CLP_LB_MASK   0x003fffff
+#define MTK_CAM_LTMS_CLIP_TH_LB_LTMS_CLP_LB_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_CLIP_TH_HB: LTMS_CLP_HB
+ * MTK_CAM_LTMS_CLIP_TH_HB_LTMS_CLP_HB: [0, 21]
+ * High bound of clip threshold output.
+ */
+#define MTK_CAM_LTMS_CLIP_TH_HB_LTMS_CLP_HB_MASK   0x003fffff
+#define MTK_CAM_LTMS_CLIP_TH_HB_LTMS_CLP_HB_SHIFT  0
+
+/*
+ * Bit Feild of LTMS_GLBHIST_INT: LTMS_GLBHIST_INT
+ * MTK_CAM_LTMS_GLBHIST_INT_LTMS_GLBHIST_INT: [0, 14]
+ * Interval of global histogram
+ */
+#define MTK_CAM_LTMS_GLBHIST_INT_LTMS_GLBHIST_INT_MASK   0x00007fff
+#define MTK_CAM_LTMS_GLBHIST_INT_LTMS_GLBHIST_INT_SHIFT  0
+
+/*
+ * Bit Feild of LTMTC_CURVE: LTMTC_TONECURVE_LUT_L
+ * MTK_CAM_LTMTC_CURVE_LTMTC_TONECURVE_LUT_L: [0, 13]
+ * SRAM_PING_PONG
+ * [u8.6-bits]x12x9
+ */
+#define MTK_CAM_LTMTC_CURVE_LTMTC_TONECURVE_LUT_L_MASK   0x00003fff
+#define MTK_CAM_LTMTC_CURVE_LTMTC_TONECURVE_LUT_L_SHIFT  0
+
+/*
+ * Bit Feild of LTMTC_CURVE: LTMTC_TONECURVE_LUT_H
+ * MTK_CAM_LTMTC_CURVE_LTMTC_TONECURVE_LUT_H: [16, 29]
+ * SRAM_PING_PONG
+ * [u8.6-bits]x12x9
+ */
+#define MTK_CAM_LTMTC_CURVE_LTMTC_TONECURVE_LUT_H_MASK   0x3fff0000
+#define MTK_CAM_LTMTC_CURVE_LTMTC_TONECURVE_LUT_H_SHIFT  16
+
+/*
+ * Bit Feild of LTMTC_CLP: LTMTC_TONECURVE_CLP
+ * MTK_CAM_LTMTC_CLP_LTMTC_TONECURVE_CLP: [0, 23]
+ * LTM block CT
+ */
+#define MTK_CAM_LTMTC_CLP_LTMTC_TONECURVE_CLP_MASK   0x00ffffff
+#define MTK_CAM_LTMTC_CLP_LTMTC_TONECURVE_CLP_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CTRL: LTM_GAMMA_EN
+ * MTK_CAM_LTM_CTRL_LTM_GAMMA_EN: [4, 4]
+ * Enable gamma domain
+ */
+#define MTK_CAM_LTM_CTRL_LTM_GAMMA_EN_MASK   0x00000010
+#define MTK_CAM_LTM_CTRL_LTM_GAMMA_EN_SHIFT  4
+
+/*
+ * Bit Feild of LTM_CTRL: LTM_CURVE_CP_MODE
+ * MTK_CAM_LTM_CTRL_LTM_CURVE_CP_MODE: [5, 5]
+ * Mode of curve control point, [0]: 33 fixed cp, [1]: 16 XY cp
+ */
+#define MTK_CAM_LTM_CTRL_LTM_CURVE_CP_MODE_MASK   0x00000020
+#define MTK_CAM_LTM_CTRL_LTM_CURVE_CP_MODE_SHIFT  5
+
+/*
+ * Bit Feild of LTM_BLK_NUM: LTM_BLK_X_NUM
+ * MTK_CAM_LTM_BLK_NUM_LTM_BLK_X_NUM: [0, 4]
+ * block X number supports 2~12
+ */
+#define MTK_CAM_LTM_BLK_NUM_LTM_BLK_X_NUM_MASK   0x0000001f
+#define MTK_CAM_LTM_BLK_NUM_LTM_BLK_X_NUM_SHIFT  0
+
+/*
+ * Bit Feild of LTM_BLK_NUM: LTM_BLK_Y_NUM
+ * MTK_CAM_LTM_BLK_NUM_LTM_BLK_Y_NUM: [8, 12]
+ * block Y number supports 2~9
+ */
+#define MTK_CAM_LTM_BLK_NUM_LTM_BLK_Y_NUM_MASK   0x00001f00
+#define MTK_CAM_LTM_BLK_NUM_LTM_BLK_Y_NUM_SHIFT  8
+
+/*
+ * Bit Feild of LTM_MAX_DIV: LTM_CLIP_TH_ALPHA_BASE
+ * MTK_CAM_LTM_MAX_DIV_LTM_CLIP_TH_ALPHA_BASE: [0, 9]
+ * Divider for Maxvalue
+ */
+#define MTK_CAM_LTM_MAX_DIV_LTM_CLIP_TH_ALPHA_BASE_MASK   0x000003ff
+#define MTK_CAM_LTM_MAX_DIV_LTM_CLIP_TH_ALPHA_BASE_SHIFT  0
+
+/*
+ * Bit Feild of LTM_MAX_DIV: LTM_CLIP_TH_ALPHA_BASE_SHIFT_BIT
+ * MTK_CAM_LTM_MAX_DIV_LTM_CLIP_TH_ALPHA_BASE_SHIFT_BIT: [16, 20]
+ * Divider for Maxvalue
+ */
+#define MTK_CAM_LTM_MAX_DIV_LTM_CLIP_TH_ALPHA_BASE_SHIFT_BIT_MASK   0x001f0000
+#define MTK_CAM_LTM_MAX_DIV_LTM_CLIP_TH_ALPHA_BASE_SHIFT_BIT_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CLIP: LTM_GAIN_TH
+ * MTK_CAM_LTM_CLIP_LTM_GAIN_TH: [0, 5]
+ * Threshold to clip output gain
+ */
+#define MTK_CAM_LTM_CLIP_LTM_GAIN_TH_MASK   0x0000003f
+#define MTK_CAM_LTM_CLIP_LTM_GAIN_TH_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CFG: LTM_ENGINE_EN
+ * MTK_CAM_LTM_CFG_LTM_ENGINE_EN: [0, 0]
+ * None
+ */
+#define MTK_CAM_LTM_CFG_LTM_ENGINE_EN_MASK   0x00000001
+#define MTK_CAM_LTM_CFG_LTM_ENGINE_EN_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CFG: LTM_CG_DISABLE
+ * MTK_CAM_LTM_CFG_LTM_CG_DISABLE: [4, 4]
+ * None
+ */
+#define MTK_CAM_LTM_CFG_LTM_CG_DISABLE_MASK   0x00000010
+#define MTK_CAM_LTM_CFG_LTM_CG_DISABLE_SHIFT  4
+
+/*
+ * Bit Feild of LTM_CFG: LTM_CHKSUM_EN
+ * MTK_CAM_LTM_CFG_LTM_CHKSUM_EN: [28, 28]
+ * None
+ */
+#define MTK_CAM_LTM_CFG_LTM_CHKSUM_EN_MASK   0x10000000
+#define MTK_CAM_LTM_CFG_LTM_CHKSUM_EN_SHIFT  28
+
+/*
+ * Bit Feild of LTM_CFG: LTM_CHKSUM_SEL
+ * MTK_CAM_LTM_CFG_LTM_CHKSUM_SEL: [29, 30]
+ * None
+ */
+#define MTK_CAM_LTM_CFG_LTM_CHKSUM_SEL_MASK   0x60000000
+#define MTK_CAM_LTM_CFG_LTM_CHKSUM_SEL_SHIFT  29
+
+/*
+ * Bit Feild of LTM_CLIP_TH: LTM_CLIP_TH
+ * MTK_CAM_LTM_CLIP_TH_LTM_CLIP_TH: [0, 23]
+ * clipping threshold, enabled if #define LTM_USE_PREVIOUS_MAXVALUE=1
+ */
+#define MTK_CAM_LTM_CLIP_TH_LTM_CLIP_TH_MASK   0x00ffffff
+#define MTK_CAM_LTM_CLIP_TH_LTM_CLIP_TH_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CLIP_TH: LTM_WGT_BSH
+ * MTK_CAM_LTM_CLIP_TH_LTM_WGT_BSH: [24, 27]
+ * rightward bit shift for weighting data
+ */
+#define MTK_CAM_LTM_CLIP_TH_LTM_WGT_BSH_MASK   0x0f000000
+#define MTK_CAM_LTM_CLIP_TH_LTM_WGT_BSH_SHIFT  24
+
+/*
+ * Bit Feild of LTM_GAIN_MAP: LTM_MAP_LOG_EN
+ * MTK_CAM_LTM_GAIN_MAP_LTM_MAP_LOG_EN: [0, 0]
+ * switch for map log
+ */
+#define MTK_CAM_LTM_GAIN_MAP_LTM_MAP_LOG_EN_MASK   0x00000001
+#define MTK_CAM_LTM_GAIN_MAP_LTM_MAP_LOG_EN_SHIFT  0
+
+/*
+ * Bit Feild of LTM_GAIN_MAP: LTM_WGT_LOG_EN
+ * MTK_CAM_LTM_GAIN_MAP_LTM_WGT_LOG_EN: [1, 1]
+ * switch for weight log
+ */
+#define MTK_CAM_LTM_GAIN_MAP_LTM_WGT_LOG_EN_MASK   0x00000002
+#define MTK_CAM_LTM_GAIN_MAP_LTM_WGT_LOG_EN_SHIFT  1
+
+/*
+ * Bit Feild of LTM_GAIN_MAP: LTM_NONTRAN_MAP_TYPE
+ * MTK_CAM_LTM_GAIN_MAP_LTM_NONTRAN_MAP_TYPE: [4, 7]
+ * type of nontran map
+ */
+#define MTK_CAM_LTM_GAIN_MAP_LTM_NONTRAN_MAP_TYPE_MASK   0x000000f0
+#define MTK_CAM_LTM_GAIN_MAP_LTM_NONTRAN_MAP_TYPE_SHIFT  4
+
+/*
+ * Bit Feild of LTM_GAIN_MAP: LTM_TRAN_MAP_TYPE
+ * MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_MAP_TYPE: [8, 11]
+ * type of tran map
+ */
+#define MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_MAP_TYPE_MASK   0x00000f00
+#define MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_MAP_TYPE_SHIFT  8
+
+/*
+ * Bit Feild of LTM_GAIN_MAP: LTM_TRAN_WGT_TYPE
+ * MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_WGT_TYPE: [12, 13]
+ * type of tran weight
+ */
+#define MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_WGT_TYPE_MASK   0x00003000
+#define MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_WGT_TYPE_SHIFT  12
+
+/*
+ * Bit Feild of LTM_GAIN_MAP: LTM_TRAN_WGT
+ * MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_WGT: [16, 20]
+ * static tran weight
+ */
+#define MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_WGT_MASK   0x001f0000
+#define MTK_CAM_LTM_GAIN_MAP_LTM_TRAN_WGT_SHIFT  16
+
+/*
+ * Bit Feild of LTM_GAIN_MAP: LTM_RANGE_SCL
+ * MTK_CAM_LTM_GAIN_MAP_LTM_RANGE_SCL: [24, 29]
+ * scale of maxTran
+ */
+#define MTK_CAM_LTM_GAIN_MAP_LTM_RANGE_SCL_MASK   0x3f000000
+#define MTK_CAM_LTM_GAIN_MAP_LTM_RANGE_SCL_SHIFT  24
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP0: LTM_CVNODE_0
+ * MTK_CAM_LTM_CVNODE_GRP0_LTM_CVNODE_0: [0, 11]
+ * cvnode-0 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP0_LTM_CVNODE_0_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP0_LTM_CVNODE_0_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP0: LTM_CVNODE_1
+ * MTK_CAM_LTM_CVNODE_GRP0_LTM_CVNODE_1: [16, 27]
+ * cvnode-1 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP0_LTM_CVNODE_1_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP0_LTM_CVNODE_1_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP1: LTM_CVNODE_2
+ * MTK_CAM_LTM_CVNODE_GRP1_LTM_CVNODE_2: [0, 11]
+ * cvnode-2 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP1_LTM_CVNODE_2_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP1_LTM_CVNODE_2_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP1: LTM_CVNODE_3
+ * MTK_CAM_LTM_CVNODE_GRP1_LTM_CVNODE_3: [16, 27]
+ * cvnode-3 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP1_LTM_CVNODE_3_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP1_LTM_CVNODE_3_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP2: LTM_CVNODE_4
+ * MTK_CAM_LTM_CVNODE_GRP2_LTM_CVNODE_4: [0, 11]
+ * cvnode-4 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP2_LTM_CVNODE_4_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP2_LTM_CVNODE_4_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP2: LTM_CVNODE_5
+ * MTK_CAM_LTM_CVNODE_GRP2_LTM_CVNODE_5: [16, 27]
+ * cvnode-5 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP2_LTM_CVNODE_5_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP2_LTM_CVNODE_5_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP3: LTM_CVNODE_6
+ * MTK_CAM_LTM_CVNODE_GRP3_LTM_CVNODE_6: [0, 11]
+ * cvnode-6 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP3_LTM_CVNODE_6_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP3_LTM_CVNODE_6_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP3: LTM_CVNODE_7
+ * MTK_CAM_LTM_CVNODE_GRP3_LTM_CVNODE_7: [16, 27]
+ * cvnode-7 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP3_LTM_CVNODE_7_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP3_LTM_CVNODE_7_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP4: LTM_CVNODE_8
+ * MTK_CAM_LTM_CVNODE_GRP4_LTM_CVNODE_8: [0, 11]
+ * cvnode-8 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP4_LTM_CVNODE_8_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP4_LTM_CVNODE_8_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP4: LTM_CVNODE_9
+ * MTK_CAM_LTM_CVNODE_GRP4_LTM_CVNODE_9: [16, 27]
+ * cvnode-9 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP4_LTM_CVNODE_9_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP4_LTM_CVNODE_9_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP5: LTM_CVNODE_10
+ * MTK_CAM_LTM_CVNODE_GRP5_LTM_CVNODE_10: [0, 11]
+ * cvnode-10 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP5_LTM_CVNODE_10_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP5_LTM_CVNODE_10_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP5: LTM_CVNODE_11
+ * MTK_CAM_LTM_CVNODE_GRP5_LTM_CVNODE_11: [16, 27]
+ * cvnode-11 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP5_LTM_CVNODE_11_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP5_LTM_CVNODE_11_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP6: LTM_CVNODE_12
+ * MTK_CAM_LTM_CVNODE_GRP6_LTM_CVNODE_12: [0, 11]
+ * cvnode-12 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP6_LTM_CVNODE_12_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP6_LTM_CVNODE_12_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP6: LTM_CVNODE_13
+ * MTK_CAM_LTM_CVNODE_GRP6_LTM_CVNODE_13: [16, 27]
+ * cvnode-13 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP6_LTM_CVNODE_13_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP6_LTM_CVNODE_13_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP7: LTM_CVNODE_14
+ * MTK_CAM_LTM_CVNODE_GRP7_LTM_CVNODE_14: [0, 11]
+ * cvnode-14 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP7_LTM_CVNODE_14_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP7_LTM_CVNODE_14_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP7: LTM_CVNODE_15
+ * MTK_CAM_LTM_CVNODE_GRP7_LTM_CVNODE_15: [16, 27]
+ * cvnode-15 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP7_LTM_CVNODE_15_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP7_LTM_CVNODE_15_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP8: LTM_CVNODE_16
+ * MTK_CAM_LTM_CVNODE_GRP8_LTM_CVNODE_16: [0, 11]
+ * cvnode-16 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP8_LTM_CVNODE_16_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP8_LTM_CVNODE_16_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP8: LTM_CVNODE_17
+ * MTK_CAM_LTM_CVNODE_GRP8_LTM_CVNODE_17: [16, 27]
+ * cvnode-17 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP8_LTM_CVNODE_17_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP8_LTM_CVNODE_17_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP9: LTM_CVNODE_18
+ * MTK_CAM_LTM_CVNODE_GRP9_LTM_CVNODE_18: [0, 11]
+ * cvnode-18 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP9_LTM_CVNODE_18_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP9_LTM_CVNODE_18_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP9: LTM_CVNODE_19
+ * MTK_CAM_LTM_CVNODE_GRP9_LTM_CVNODE_19: [16, 27]
+ * cvnode-19 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP9_LTM_CVNODE_19_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP9_LTM_CVNODE_19_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP10: LTM_CVNODE_20
+ * MTK_CAM_LTM_CVNODE_GRP10_LTM_CVNODE_20: [0, 11]
+ * cvnode-20 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP10_LTM_CVNODE_20_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP10_LTM_CVNODE_20_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP10: LTM_CVNODE_21
+ * MTK_CAM_LTM_CVNODE_GRP10_LTM_CVNODE_21: [16, 27]
+ * cvnode-21 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP10_LTM_CVNODE_21_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP10_LTM_CVNODE_21_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP11: LTM_CVNODE_22
+ * MTK_CAM_LTM_CVNODE_GRP11_LTM_CVNODE_22: [0, 11]
+ * cvnode-22 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP11_LTM_CVNODE_22_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP11_LTM_CVNODE_22_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP11: LTM_CVNODE_23
+ * MTK_CAM_LTM_CVNODE_GRP11_LTM_CVNODE_23: [16, 27]
+ * cvnode-23 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP11_LTM_CVNODE_23_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP11_LTM_CVNODE_23_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP12: LTM_CVNODE_24
+ * MTK_CAM_LTM_CVNODE_GRP12_LTM_CVNODE_24: [0, 11]
+ * cvnode-24 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP12_LTM_CVNODE_24_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP12_LTM_CVNODE_24_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP12: LTM_CVNODE_25
+ * MTK_CAM_LTM_CVNODE_GRP12_LTM_CVNODE_25: [16, 27]
+ * cvnode-25 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP12_LTM_CVNODE_25_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP12_LTM_CVNODE_25_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP13: LTM_CVNODE_26
+ * MTK_CAM_LTM_CVNODE_GRP13_LTM_CVNODE_26: [0, 11]
+ * cvnode-26 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP13_LTM_CVNODE_26_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP13_LTM_CVNODE_26_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP13: LTM_CVNODE_27
+ * MTK_CAM_LTM_CVNODE_GRP13_LTM_CVNODE_27: [16, 27]
+ * cvnode-27 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP13_LTM_CVNODE_27_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP13_LTM_CVNODE_27_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP14: LTM_CVNODE_28
+ * MTK_CAM_LTM_CVNODE_GRP14_LTM_CVNODE_28: [0, 11]
+ * cvnode-28 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP14_LTM_CVNODE_28_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP14_LTM_CVNODE_28_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP14: LTM_CVNODE_29
+ * MTK_CAM_LTM_CVNODE_GRP14_LTM_CVNODE_29: [16, 27]
+ * cvnode-29 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP14_LTM_CVNODE_29_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP14_LTM_CVNODE_29_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP15: LTM_CVNODE_30
+ * MTK_CAM_LTM_CVNODE_GRP15_LTM_CVNODE_30: [0, 11]
+ * cvnode-30 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP15_LTM_CVNODE_30_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP15_LTM_CVNODE_30_SHIFT  0
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP15: LTM_CVNODE_31
+ * MTK_CAM_LTM_CVNODE_GRP15_LTM_CVNODE_31: [16, 27]
+ * cvnode-31 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP15_LTM_CVNODE_31_MASK   0x0fff0000
+#define MTK_CAM_LTM_CVNODE_GRP15_LTM_CVNODE_31_SHIFT  16
+
+/*
+ * Bit Feild of LTM_CVNODE_GRP16: LTM_CVNODE_32
+ * MTK_CAM_LTM_CVNODE_GRP16_LTM_CVNODE_32: [0, 11]
+ * cvnode-32 for gain map
+ */
+#define MTK_CAM_LTM_CVNODE_GRP16_LTM_CVNODE_32_MASK   0x00000fff
+#define MTK_CAM_LTM_CVNODE_GRP16_LTM_CVNODE_32_SHIFT  0
+
+/*
+ * Bit Feild of LTM_OUT_STR: LTM_OUT_STR
+ * MTK_CAM_LTM_OUT_STR_LTM_OUT_STR: [0, 4]
+ * output strength
+ */
+#define MTK_CAM_LTM_OUT_STR_LTM_OUT_STR_MASK   0x0000001f
+#define MTK_CAM_LTM_OUT_STR_LTM_OUT_STR_SHIFT  0
+
+/*
+ * Bit Feild of LTM_ACT_WIN_X: LTM_ACT_WIN_X_START
+ * MTK_CAM_LTM_ACT_WIN_X_LTM_ACT_WIN_X_START: [0, 15]
+ * Horizontal setting for active window of AE debug
+ */
+#define MTK_CAM_LTM_ACT_WIN_X_LTM_ACT_WIN_X_START_MASK   0x0000ffff
+#define MTK_CAM_LTM_ACT_WIN_X_LTM_ACT_WIN_X_START_SHIFT  0
+
+/*
+ * Bit Feild of LTM_ACT_WIN_X: LTM_ACT_WIN_X_END
+ * MTK_CAM_LTM_ACT_WIN_X_LTM_ACT_WIN_X_END: [16, 31]
+ * Horizontal setting for active window of AE debug
+ */
+#define MTK_CAM_LTM_ACT_WIN_X_LTM_ACT_WIN_X_END_MASK   0xffff0000
+#define MTK_CAM_LTM_ACT_WIN_X_LTM_ACT_WIN_X_END_SHIFT  16
+
+/*
+ * Bit Feild of LTM_ACT_WIN_Y: LTM_ACT_WIN_Y_START
+ * MTK_CAM_LTM_ACT_WIN_Y_LTM_ACT_WIN_Y_START: [0, 15]
+ * Vertical setting for active window of AE debug
+ */
+#define MTK_CAM_LTM_ACT_WIN_Y_LTM_ACT_WIN_Y_START_MASK   0x0000ffff
+#define MTK_CAM_LTM_ACT_WIN_Y_LTM_ACT_WIN_Y_START_SHIFT  0
+
+/*
+ * Bit Feild of LTM_ACT_WIN_Y: LTM_ACT_WIN_Y_END
+ * MTK_CAM_LTM_ACT_WIN_Y_LTM_ACT_WIN_Y_END: [16, 31]
+ * Vertical setting for active window of AE debug
+ */
+#define MTK_CAM_LTM_ACT_WIN_Y_LTM_ACT_WIN_Y_END_MASK   0xffff0000
+#define MTK_CAM_LTM_ACT_WIN_Y_LTM_ACT_WIN_Y_END_SHIFT  16
+
+/*
+ * Bit Feild of OBC_DBS: OBC_DBS_RATIO
+ * MTK_CAM_OBC_DBS_OBC_DBS_RATIO: [0, 4]
+ * Ratio of "bias" being eliminated
+ */
+#define MTK_CAM_OBC_DBS_OBC_DBS_RATIO_MASK   0x0000001f
+#define MTK_CAM_OBC_DBS_OBC_DBS_RATIO_SHIFT  0
+
+/*
+ * Bit Feild of OBC_DBS: OBC_POSTTUNE_EN
+ * MTK_CAM_OBC_DBS_OBC_POSTTUNE_EN: [8, 8]
+ * Enable gray-blending and LUT-subtraction processing
+ */
+#define MTK_CAM_OBC_DBS_OBC_POSTTUNE_EN_MASK   0x00000100
+#define MTK_CAM_OBC_DBS_OBC_POSTTUNE_EN_SHIFT  8
+
+/*
+ * Bit Feild of OBC_GRAY_BLD_0: OBC_LUMA_MODE
+ * MTK_CAM_OBC_GRAY_BLD_0_OBC_LUMA_MODE: [0, 0]
+ * Selection between max mode or mean mode for luma computation
+ */
+#define MTK_CAM_OBC_GRAY_BLD_0_OBC_LUMA_MODE_MASK   0x00000001
+#define MTK_CAM_OBC_GRAY_BLD_0_OBC_LUMA_MODE_SHIFT  0
+
+/*
+ * Bit Feild of OBC_GRAY_BLD_0: OBC_GRAY_MODE
+ * MTK_CAM_OBC_GRAY_BLD_0_OBC_GRAY_MODE: [1, 2]
+ * Method of gray value computation
+ */
+#define MTK_CAM_OBC_GRAY_BLD_0_OBC_GRAY_MODE_MASK   0x00000006
+#define MTK_CAM_OBC_GRAY_BLD_0_OBC_GRAY_MODE_SHIFT  1
+
+/*
+ * Bit Feild of OBC_GRAY_BLD_0: OBC_NORM_BIT
+ * MTK_CAM_OBC_GRAY_BLD_0_OBC_NORM_BIT: [3, 7]
+ * Data scale to be normalized to 12-bit
+ */
+#define MTK_CAM_OBC_GRAY_BLD_0_OBC_NORM_BIT_MASK   0x000000f8
+#define MTK_CAM_OBC_GRAY_BLD_0_OBC_NORM_BIT_SHIFT  3
+
+/*
+ * Bit Feild of OBC_GRAY_BLD_1: OBC_BLD_MXRT
+ * MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_MXRT: [0, 7]
+ * (normal and LE)Maximum weight for gray blending
+ */
+#define MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_MXRT_MASK   0x000000ff
+#define MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_MXRT_SHIFT  0
+
+/*
+ * Bit Feild of OBC_GRAY_BLD_1: OBC_BLD_LOW
+ * MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_LOW: [8, 19]
+ * (normal and LE)Luma level below which the gray value is
+ * bleneded with the specified maximum weight.
+ */
+#define MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_LOW_MASK   0x000fff00
+#define MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_LOW_SHIFT  8
+
+/*
+ * Bit Feild of OBC_GRAY_BLD_1: OBC_BLD_SLP
+ * MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_SLP: [20, 31]
+ * (normal and LE)Slope of the blending ratio curve between zero and maximum weight.
+ */
+#define MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_SLP_MASK   0xfff00000
+#define MTK_CAM_OBC_GRAY_BLD_1_OBC_BLD_SLP_SHIFT  20
+
+/*
+ * Bit Feild of OBC_WBG_RB: OBC_PGN_R
+ * MTK_CAM_OBC_WBG_RB_OBC_PGN_R: [0, 12]
+ * WB gain for R channel
+ */
+#define MTK_CAM_OBC_WBG_RB_OBC_PGN_R_MASK   0x00001fff
+#define MTK_CAM_OBC_WBG_RB_OBC_PGN_R_SHIFT  0
+
+/*
+ * Bit Feild of OBC_WBG_RB: OBC_PGN_B
+ * MTK_CAM_OBC_WBG_RB_OBC_PGN_B: [16, 28]
+ * WB gain for R channel
+ */
+#define MTK_CAM_OBC_WBG_RB_OBC_PGN_B_MASK   0x1fff0000
+#define MTK_CAM_OBC_WBG_RB_OBC_PGN_B_SHIFT  16
+
+/*
+ * Bit Feild of OBC_WBG_G: OBC_PGN_G
+ * MTK_CAM_OBC_WBG_G_OBC_PGN_G: [0, 12]
+ * WB gain for G channel
+ */
+#define MTK_CAM_OBC_WBG_G_OBC_PGN_G_MASK   0x00001fff
+#define MTK_CAM_OBC_WBG_G_OBC_PGN_G_SHIFT  0
+
+/*
+ * Bit Feild of OBC_WBIG_RB: OBC_IVGN_R
+ * MTK_CAM_OBC_WBIG_RB_OBC_IVGN_R: [0, 9]
+ * Inverse WB gain for R channel
+ */
+#define MTK_CAM_OBC_WBIG_RB_OBC_IVGN_R_MASK   0x000003ff
+#define MTK_CAM_OBC_WBIG_RB_OBC_IVGN_R_SHIFT  0
+
+/*
+ * Bit Feild of OBC_WBIG_RB: OBC_IVGN_B
+ * MTK_CAM_OBC_WBIG_RB_OBC_IVGN_B: [16, 25]
+ * Inverse WB gain for B channel
+ */
+#define MTK_CAM_OBC_WBIG_RB_OBC_IVGN_B_MASK   0x03ff0000
+#define MTK_CAM_OBC_WBIG_RB_OBC_IVGN_B_SHIFT  16
+
+/*
+ * Bit Feild of OBC_WBIG_G: OBC_IVGN_G
+ * MTK_CAM_OBC_WBIG_G_OBC_IVGN_G: [0, 9]
+ * Inverse WB gain for G channel
+ */
+#define MTK_CAM_OBC_WBIG_G_OBC_IVGN_G_MASK   0x000003ff
+#define MTK_CAM_OBC_WBIG_G_OBC_IVGN_G_SHIFT  0
+
+/*
+ * Bit Feild of OBC_OBG_RB: OBC_GAIN_R
+ * MTK_CAM_OBC_OBG_RB_OBC_GAIN_R: [0, 11]
+ * OB gain for R channel
+ */
+#define MTK_CAM_OBC_OBG_RB_OBC_GAIN_R_MASK   0x00000fff
+#define MTK_CAM_OBC_OBG_RB_OBC_GAIN_R_SHIFT  0
+
+/*
+ * Bit Feild of OBC_OBG_RB: OBC_GAIN_B
+ * MTK_CAM_OBC_OBG_RB_OBC_GAIN_B: [16, 27]
+ * OB gain for B channel
+ */
+#define MTK_CAM_OBC_OBG_RB_OBC_GAIN_B_MASK   0x0fff0000
+#define MTK_CAM_OBC_OBG_RB_OBC_GAIN_B_SHIFT  16
+
+/*
+ * Bit Feild of OBC_OBG_G: OBC_GAIN_GR
+ * MTK_CAM_OBC_OBG_G_OBC_GAIN_GR: [0, 11]
+ * OB gain for Gr channel
+ */
+#define MTK_CAM_OBC_OBG_G_OBC_GAIN_GR_MASK   0x00000fff
+#define MTK_CAM_OBC_OBG_G_OBC_GAIN_GR_SHIFT  0
+
+/*
+ * Bit Feild of OBC_OBG_G: OBC_GAIN_GB
+ * MTK_CAM_OBC_OBG_G_OBC_GAIN_GB: [16, 27]
+ * OB gain for Gb channel
+ */
+#define MTK_CAM_OBC_OBG_G_OBC_GAIN_GB_MASK   0x0fff0000
+#define MTK_CAM_OBC_OBG_G_OBC_GAIN_GB_SHIFT  16
+
+/*
+ * Bit Feild of OBC_OFFSET_R: OBC_OFST_R
+ * MTK_CAM_OBC_OFFSET_R_OBC_OFST_R: [0, 21]
+ * OB offset for R channel
+ */
+#define MTK_CAM_OBC_OFFSET_R_OBC_OFST_R_MASK   0x003fffff
+#define MTK_CAM_OBC_OFFSET_R_OBC_OFST_R_SHIFT  0
+
+/*
+ * Bit Feild of OBC_OFFSET_GR: OBC_OFST_GR
+ * MTK_CAM_OBC_OFFSET_GR_OBC_OFST_GR: [0, 21]
+ * OB offset for Gr channel
+ */
+#define MTK_CAM_OBC_OFFSET_GR_OBC_OFST_GR_MASK   0x003fffff
+#define MTK_CAM_OBC_OFFSET_GR_OBC_OFST_GR_SHIFT  0
+
+/*
+ * Bit Feild of OBC_OFFSET_GB: OBC_OFST_GB
+ * MTK_CAM_OBC_OFFSET_GB_OBC_OFST_GB: [0, 21]
+ * OB offset for Gb channel
+ */
+#define MTK_CAM_OBC_OFFSET_GB_OBC_OFST_GB_MASK   0x003fffff
+#define MTK_CAM_OBC_OFFSET_GB_OBC_OFST_GB_SHIFT  0
+
+/*
+ * Bit Feild of OBC_OFFSET_B: OBC_OFST_B
+ * MTK_CAM_OBC_OFFSET_B_OBC_OFST_B: [0, 21]
+ * OB offset for B channel
+ */
+#define MTK_CAM_OBC_OFFSET_B_OBC_OFST_B_MASK   0x003fffff
+#define MTK_CAM_OBC_OFFSET_B_OBC_OFST_B_SHIFT  0
+
+/*
+ * Bit Feild of TSFS_DGAIN: TSFS_REGEN_Y_EN
+ * MTK_CAM_TSFS_DGAIN_TSFS_REGEN_Y_EN: [0, 0]
+ * Digital gain control
+ */
+#define MTK_CAM_TSFS_DGAIN_TSFS_REGEN_Y_EN_MASK   0x00000001
+#define MTK_CAM_TSFS_DGAIN_TSFS_REGEN_Y_EN_SHIFT  0
+
+/*
+ * Bit Feild of TSFS_DGAIN: TSFS_GAIN
+ * MTK_CAM_TSFS_DGAIN_TSFS_GAIN: [1, 16]
+ * Digital gain
+ */
+#define MTK_CAM_TSFS_DGAIN_TSFS_GAIN_MASK   0x0001fffe
+#define MTK_CAM_TSFS_DGAIN_TSFS_GAIN_SHIFT  1
+
+/*
+ *  V 4 L 2  M E T A  B U F F E R  L A Y O U T
+ */
+
+/*
+ *  struct mtk_cam_uapi_meta_raw_stats_cfg
+ *
+ *  @ae_awb_enable: To indicate if AE and AWB should be enblaed or not. If
+ *        it is 1, it means that we enable the following parts of
+ *        hardware:
+ *        (1) AE/AWB
+ *        (2) aao
+ *        (3) aaho
+ *  @af_enable:     To indicate if AF should be enabled or not. If it is 1,
+ *        it means that the AF and afo is enabled.
+ *  @dgn_enable:    To indicate if dgn module should be enabled or not.
+ *  @flk_enable:    If it is 1, it means flk and flko is enable. If ie is 0,
+ *        both flk and flko is disabled.
+ *  @tsf_enable:    If it is 1, it means tsfs and tsfso is enable. If ie is 0,
+ *        both tsfs and tsfso is disabled.
+ *  @wb_enable:     To indicate if wb module should be enabled or not.
+ *  @pde_enable:    To indicate if pde module should be enabled or not.
+ *  @ae_param:  AE Statistic window config
+ *  @awb_param: AWB statistic configuration control
+ *  @dgn_param: DGN settings
+ *  @flk_param: Flicker statistic configuration
+ *  @tsf_param: tsf statistic configuration
+ *  @wb_param:  WB settings
+ *  @pde_param: pde settings
+ */
+struct mtk_cam_uapi_meta_raw_stats_cfg {
+	s8 ae_awb_enable;
+	s8 af_enable;
+	s8 dgn_enable;
+	s8 flk_enable;
+	s8 tsf_enable;
+	s8 wb_enable;
+	s8 pde_enable;
+	u8 rsv;
+
+	struct mtk_cam_uapi_ae_param ae_param;
+	struct mtk_cam_uapi_awb_param awb_param;
+	struct mtk_cam_uapi_af_param af_param;
+	struct mtk_cam_uapi_dgn_param dgn_param;
+	struct mtk_cam_uapi_flk_param flk_param;
+	struct mtk_cam_uapi_tsf_param tsf_param;
+	struct mtk_cam_uapi_wb_param wb_param;
+	struct mtk_cam_uapi_pde_param pde_param;
+
+	struct mtk_cam_uapi_prot {
+		/* The following top control are generated by script */
+		u8 drzh2n_r1_tuning_enable;
+		u8 drzh2n_r2_tuning_enable;
+		u8 drzh2n_r3_tuning_enable;
+		u8 drzh2n_r4_tuning_enable;
+		u8 drzh2n_r5_tuning_enable;
+		u8 drzh2n_r6_tuning_enable;
+		u8 drzh2n_r7_tuning_enable;
+		u8 drzh2n_r8_tuning_enable;
+		u8 drzs4n_r1_tuning_enable;
+		u8 drzs4n_r2_tuning_enable;
+		u8 drzs4n_r3_tuning_enable;
+		u8 dm_tuning_enable;
+		u8 drzs8t_r1_tuning_enable;
+		u8 drzs8t_r2_tuning_enable;
+		u8 ggm_r1_tuning_enable;
+		u8 ggm_r2_tuning_enable;
+		u8 ggm_r3_tuning_enable;
+		u8 bpc_r1_enable;
+		u8 bpc_r2_enable;
+		u8 ccm_r1_enable;
+		u8 ccm_r2_enable;
+		u8 ccm_r3_enable;
+		u8 fus_enable;
+		u8 g2c_r1_enable;
+		u8 g2c_r2_enable;
+		u8 g2c_r3_enable;
+		u8 hlr_enable;
+		u8 lsc_enable;
+		u8 ltm_enable;
+		u8 ltms_enable;
+		u8 obc_r1_enable;
+		u8 obc_r2_enable;
+		u8 tcy_r1_enable;
+		u8 tcy_r2_enable;
+		u8 tcy_r3_enable;
+		u8 tncs_r1_enable;
+
+		struct mtk_cam_uapi_ccm_param_prot ccm_r1_param;
+		struct mtk_cam_uapi_ccm_param_prot ccm_r2_param;
+		struct mtk_cam_uapi_ccm_param_prot ccm_r3_param;
+		struct mtk_cam_uapi_drzh2n_param_prot drzh2n_r1_param;
+		struct mtk_cam_uapi_drzh2n_param_prot drzh2n_r2_param;
+		struct mtk_cam_uapi_drzh2n_param_prot drzh2n_r3_param;
+		struct mtk_cam_uapi_drzh2n_param_prot drzh2n_r4_param;
+		struct mtk_cam_uapi_drzh2n_param_prot drzh2n_r5_param;
+		struct mtk_cam_uapi_drzh2n_param_prot drzh2n_r6_param;
+		struct mtk_cam_uapi_drzh2n_param_prot drzh2n_r7_param;
+		struct mtk_cam_uapi_drzh2n_param_prot drzh2n_r8_param;
+		struct mtk_cam_uapi_drzs4n_param_prot drzs4n_r1_param;
+		struct mtk_cam_uapi_drzs4n_param_prot drzs4n_r2_param;
+		struct mtk_cam_uapi_drzs4n_param_prot drzs4n_r3_param;
+		struct mtk_cam_uapi_tncs_param_prot tncs_param;
+		/* script generation done */
+		struct mtk_cam_uapi_drzs8t_param_prot drzs8t_r1_param;
+		struct mtk_cam_uapi_drzs8t_param_prot drzs8t_r2_param;
+		struct mtk_cam_uapi_awb_param_prot awb_param;
+		struct mtk_cam_uapi_bpc_param_prot bpc_param;
+		struct mtk_cam_uapi_lsc_param_prot lsc_param;
+		struct mtk_cam_uapi_slk_param_prot slk_param;
+		struct mtk_cam_uapi_wb_param_prot wb_param;
+		struct mtk_cam_uapi_ltms_param_prot ltms_param;
+		struct mtk_cam_uapi_yuvo_param_prot yuvo_r2_param;
+		struct mtk_cam_uapi_yuvo_param_prot yuvo_r4_param;
+		/* The following module stuctures are generated by script */
+		struct mtk_cam_uapi_regmap_raw_bpc bpc_r1;
+		struct mtk_cam_uapi_regmap_raw_bpc bpc_r2;
+		struct mtk_cam_uapi_regmap_raw_ccm ccm_r1;
+		struct mtk_cam_uapi_regmap_raw_ccm ccm_r2;
+		struct mtk_cam_uapi_regmap_raw_ccm ccm_r3;
+		struct mtk_cam_uapi_regmap_raw_dm dm_r1;
+		u8 rsv1[116];
+		struct mtk_cam_uapi_regmap_raw_g2c g2c_r1;
+		struct mtk_cam_uapi_regmap_raw_g2c g2c_r2;
+		struct mtk_cam_uapi_regmap_raw_g2c g2c_r3;
+		struct mtk_cam_uapi_regmap_raw_ggm ggm_r1;
+		struct mtk_cam_uapi_regmap_raw_ggm ggm_r2;
+		struct mtk_cam_uapi_regmap_raw_ggm ggm_r3;
+		u8 rsv2[68];
+		struct mtk_cam_uapi_regmap_raw_lsc lsc_r1;
+		struct mtk_cam_uapi_regmap_raw_ltm ltm_r1;
+		struct mtk_cam_uapi_regmap_raw_ltms ltms_r1;
+		struct mtk_cam_uapi_regmap_raw_obc obc_r1;
+		struct mtk_cam_uapi_regmap_raw_obc obc_r2;
+		u8 rsv3[1420];
+		struct mtk_cam_uapi_regmap_raw_tsfs tsfs_r1;
+		u8 rsv4[50080];
+		/* script generation done */
+	} __packed prot;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_meta_raw_stats_0 - capture buffer returns from camsys
+ *    after the frame is done. The buffer are not be pushed the other
+ *    driver such as dip.
+ *
+ * @ae_awb_stats_enabled: indicate that ae_awb_stats is ready or not in
+ *       this buffer
+ * @ltm_stats_enabled:    indicate that ltm_stats is ready or not in
+ *       this buffer
+ * @flk_stats_enabled:    indicate that flk_stats is ready or not in
+ *       this buffer
+ * @tsf_stats_enabled:    indicate that tsf_stats is ready or not in
+ *       this buffer
+ * @pde_stats_enabled:    indicate that pde_stats is ready or not in
+ *       this buffer
+ * @pipeline_config:      the pipeline configuration during processing
+ * @pde_stats: the pde module stats
+ */
+struct mtk_cam_uapi_meta_raw_stats_0 {
+	u8 ae_awb_stats_enabled;
+	u8 ltm_stats_enabled;
+	u8 flk_stats_enabled;
+	u8 tsf_stats_enabled;
+	u8 tncy_stats_enabled;
+	u8 pde_stats_enabled;
+	u8 rsv[2];
+
+	struct mtk_cam_uapi_pipeline_config pipeline_config;
+
+	struct mtk_cam_uapi_ae_awb_stats ae_awb_stats;
+	struct mtk_cam_uapi_ltm_stats ltm_stats;
+	struct mtk_cam_uapi_flk_stats flk_stats;
+	struct mtk_cam_uapi_tsf_stats tsf_stats;
+	struct mtk_cam_uapi_tncy_stats tncy_stats;
+	struct mtk_cam_uapi_pd_stats pde_stats;
+	struct mtk_cam_uapi_timestamp timestamp;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_meta_raw_stats_1 - statistics before frame done
+ *
+ * @af_stats_enabled: indicate that lce_stats is ready or not in this buffer
+ * @af_stats: AF statistics
+ *
+ * Any statistic output put in this structure should be careful.
+ * The meta buffer needs copying overhead to return the buffer before the
+ * all the ISP hardware's processing is finished.
+ */
+struct mtk_cam_uapi_meta_raw_stats_1 {
+	u8 af_stats_enabled;
+	u8 af_qbn_r6_enabled;
+	u8 rsv[2];
+	struct mtk_cam_uapi_af_stats af_stats;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_meta_raw_stats_2 - shared statistics buffer
+ *
+ * @act_stats_enabled:  indicate that act_stats is ready or not in this
+ * buffer
+ * @act_stats:  act statistics
+ *
+ * The statistic output in this structure may be pushed to the other
+ * driver such as dip.
+ *
+ */
+struct mtk_cam_uapi_meta_raw_stats_2 {
+	u8 act_stats_enabled;
+	u8 rsv[3];
+	struct mtk_cam_uapi_act_stats act_stats;
+} __packed;
+
+/*
+ * struct mtk_cam_uapi_meta_camsv_stats_0 - capture buffer returns from
+ *	 camsys's camsv module after the frame is done. The buffer are
+ *	 not be pushed the other driver such as dip.
+ *
+ * @pd_stats_enabled:	 indicate that pd_stats is ready or not in
+ *			 this buffer
+ */
+struct mtk_cam_uapi_meta_camsv_stats_0 {
+	u8 pd_stats_enabled;
+	u8 rsv[3];
+	struct mtk_cam_uapi_pd_stats pd_stats;
+} __packed;
+
+#define MTK_CAM_META_VERSION_MAJOR 2
+#define MTK_CAM_META_VERSION_MINOR 3
+#define MTK_CAM_META_PLATFORM_NAME "isp71"
+#define MTK_CAM_META_CHIP_NAME "mt8188"
+
+#endif /* __MTK_CAM_META_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c
new file mode 100644
index 000000000000..3294ffaf56e6
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/scatterlist.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-memops.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-raw.h"
+#include "mtk_cam-video.h"
+#include "mtk_cam-plat-util.h"
+#include "mtk_cam-meta-mt8188.h"
+
+#define RAW_STATS_CFG_SIZE \
+	ALIGN(sizeof(struct mtk_cam_uapi_meta_raw_stats_cfg), SZ_1K)
+
+/* meta out max size include 1k meta info and dma buffer size */
+#define RAW_STATS_0_SIZE \
+	ALIGN(ALIGN(sizeof(struct mtk_cam_uapi_meta_raw_stats_0), SZ_1K) + \
+	      MTK_CAM_UAPI_AAO_MAX_BUF_SIZE + MTK_CAM_UAPI_AAHO_MAX_BUF_SIZE + \
+	      MTK_CAM_UAPI_LTMSO_SIZE + \
+	      MTK_CAM_UAPI_FLK_MAX_BUF_SIZE + \
+	      MTK_CAM_UAPI_TSFSO_SIZE * 2 + /* r1 & r2 */ \
+	      MTK_CAM_UAPI_TNCSYO_SIZE, (4 * SZ_1K))
+
+#define RAW_STATS_1_SIZE \
+	ALIGN(ALIGN(sizeof(struct mtk_cam_uapi_meta_raw_stats_1), SZ_1K) + \
+	      MTK_CAM_UAPI_AFO_MAX_BUF_SIZE, (4 * SZ_1K))
+
+#define RAW_STATS_2_SIZE \
+	ALIGN(ALIGN(sizeof(struct mtk_cam_uapi_meta_raw_stats_2), SZ_1K) + \
+	      MTK_CAM_UAPI_ACTSO_SIZE, (4 * SZ_1K))
+
+/* ISP platform meta format */
+static const struct mtk_cam_format_desc meta_fmts[] = {
+	{
+		.vfmt.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_PARAMS,
+			.buffersize = RAW_STATS_CFG_SIZE,
+		},
+	},
+	{
+		.vfmt.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_3A,
+			.buffersize = RAW_STATS_0_SIZE,
+		},
+	},
+	{
+		.vfmt.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_AF,
+			.buffersize = RAW_STATS_1_SIZE,
+		},
+	},
+	{
+		.vfmt.fmt.meta = {
+			.dataformat = V4L2_META_FMT_MTISP_LCS,
+			.buffersize = RAW_STATS_2_SIZE,
+		},
+	},
+};
+
+struct mtk_cam_vb2_buf {
+	struct device			*dev;
+	void				*vaddr;
+	unsigned long			size;
+	void				*cookie;
+	dma_addr_t			dma_addr;
+	unsigned long			attrs;
+	enum dma_data_direction		dma_dir;
+	struct sg_table			*dma_sgt;
+	struct frame_vector		*vec;
+
+	/* MMAP related */
+	struct vb2_vmarea_handler	handler;
+	refcount_t			refcount;
+	struct sg_table			*sgt_base;
+
+	/* DMABUF related */
+	struct dma_buf_attachment	*db_attach;
+	struct iosys_map		map;
+};
+
+static void set_payload(struct mtk_cam_uapi_meta_hw_buf *buf,
+			unsigned int size, unsigned long *offset)
+{
+	buf->offset = *offset;
+	buf->size = size;
+	*offset += size;
+}
+
+static void vb2_sync_for_device(void *buf_priv)
+{
+	struct mtk_cam_vb2_buf *buf = buf_priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!sgt)
+		return;
+
+	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
+}
+
+uint64_t *camsys_get_timestamp_addr(void *vaddr)
+{
+	struct mtk_cam_uapi_meta_raw_stats_0 *stats0;
+
+	stats0 = (struct mtk_cam_uapi_meta_raw_stats_0 *)vaddr;
+	return (uint64_t *)(stats0->timestamp.timestamp_buf);
+}
+EXPORT_SYMBOL_GPL(camsys_get_timestamp_addr);
+
+void camsys_set_meta_stats_info(u32 dma_port, struct vb2_buffer *vb,
+				struct mtk_raw_pde_config *pde_cfg)
+{
+	struct mtk_cam_uapi_meta_raw_stats_0 *stats0;
+	struct mtk_cam_uapi_meta_raw_stats_1 *stats1;
+	unsigned long offset;
+	unsigned int plane;
+	void *vaddr = vb2_plane_vaddr(vb, 0);
+
+	switch (dma_port) {
+	case MTKCAM_IPI_RAW_META_STATS_0:
+		stats0 = (struct mtk_cam_uapi_meta_raw_stats_0 *)vaddr;
+		offset = sizeof(*stats0);
+		set_payload(&stats0->ae_awb_stats.aao_buf,
+			    MTK_CAM_UAPI_AAO_MAX_BUF_SIZE, &offset);
+		set_payload(&stats0->ae_awb_stats.aaho_buf,
+			    MTK_CAM_UAPI_AAHO_MAX_BUF_SIZE, &offset);
+		set_payload(&stats0->ltm_stats.ltmso_buf,
+			    MTK_CAM_UAPI_LTMSO_SIZE, &offset);
+		set_payload(&stats0->flk_stats.flko_buf,
+			    MTK_CAM_UAPI_FLK_MAX_BUF_SIZE, &offset);
+		set_payload(&stats0->tsf_stats.tsfo_r1_buf,
+			    MTK_CAM_UAPI_TSFSO_SIZE, &offset);
+		set_payload(&stats0->tsf_stats.tsfo_r2_buf,
+			    MTK_CAM_UAPI_TSFSO_SIZE, &offset);
+		set_payload(&stats0->tncy_stats.tncsyo_buf,
+			    MTK_CAM_UAPI_TNCSYO_SIZE, &offset);
+		if (pde_cfg) {
+			if (pde_cfg->pde_info.pd_table_offset) {
+				set_payload(&stats0->pde_stats.pdo_buf,
+					    pde_cfg->pde_info.pdo_max_size, &offset);
+			}
+		}
+	/* Use scp reserved cache buffer, do buffer cache sync after fill in meta payload */
+		for (plane = 0; plane < vb->num_planes; ++plane)
+			vb2_sync_for_device(vb->planes[plane].mem_priv);
+		break;
+	case MTKCAM_IPI_RAW_META_STATS_1:
+		stats1 = (struct mtk_cam_uapi_meta_raw_stats_1 *)vaddr;
+		offset = sizeof(*stats1);
+		set_payload(&stats1->af_stats.afo_buf,
+			    MTK_CAM_UAPI_AFO_MAX_BUF_SIZE, &offset);
+	/* Use scp reserved cache buffer, do buffer cache sync after fill in meta payload */
+		for (plane = 0; plane < vb->num_planes; ++plane)
+			vb2_sync_for_device(vb->planes[plane].mem_priv);
+		break;
+	case MTKCAM_IPI_RAW_META_STATS_2:
+		pr_info("stats 2 not support");
+		break;
+	default:
+		pr_debug("%s: dma_port err\n", __func__);
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(camsys_set_meta_stats_info);
+
+int camsys_get_meta_version(bool major)
+{
+	if (major)
+		return MTK_CAM_META_VERSION_MAJOR;
+	else
+		return MTK_CAM_META_VERSION_MINOR;
+}
+EXPORT_SYMBOL_GPL(camsys_get_meta_version);
+
+int camsys_get_meta_size(u32 video_id)
+{
+	switch (video_id) {
+	case MTKCAM_IPI_RAW_META_STATS_CFG:
+		return RAW_STATS_CFG_SIZE;
+	case MTKCAM_IPI_RAW_META_STATS_0:
+		return RAW_STATS_0_SIZE;
+	case MTKCAM_IPI_RAW_META_STATS_1:
+		return RAW_STATS_1_SIZE;
+	case MTKCAM_IPI_RAW_META_STATS_2:
+		return RAW_STATS_2_SIZE;
+	default:
+		pr_debug("%s: no support stats(%d)\n", __func__, video_id);
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(camsys_get_meta_size);
+
+const struct mtk_cam_format_desc *camsys_get_meta_fmts(void)
+{
+	return meta_fmts;
+}
+EXPORT_SYMBOL_GPL(camsys_get_meta_fmts);
+
+MODULE_DESCRIPTION("MediaTek camera platform utility");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h
new file mode 100644
index 000000000000..18c387ffd9fc
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_PLAT_UTIL_H
+#define __MTK_CAM_PLAT_UTIL_H
+
+int camsys_get_meta_version(bool major);
+int camsys_get_meta_size(u32 video_id);
+const struct mtk_cam_format_desc *camsys_get_meta_fmts(void);
+void camsys_set_meta_stats_info(u32 dma_port, struct vb2_buffer *vb,
+				struct mtk_raw_pde_config *pde_cfg);
+uint64_t *camsys_get_timestamp_addr(void *vaddr);
+
+#endif /*__MTK_CAM_PLAT_UTIL_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c
new file mode 100644
index 000000000000..d5ae321e1040
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Louis Kuo <louis.kuo@mediatek.com>
+ */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-buf.h>
+#include <linux/mm.h>
+#include <linux/remoteproc.h>
+#include <linux/spinlock.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-pool.h"
+
+int mtk_cam_working_buf_pool_init(struct mtk_cam_ctx *ctx, struct device *dev)
+{
+	int i, ret;
+	void *ptr;
+	dma_addr_t addr;
+	struct mtk_cam_device *cam = ctx->cam;
+	const unsigned int working_buf_size = round_up(CQ_BUF_SIZE, PAGE_SIZE);
+	const unsigned int msg_buf_size = round_up(IPI_FRAME_BUF_SIZE, PAGE_SIZE);
+
+	INIT_LIST_HEAD(&ctx->buf_pool.cam_freelist.list);
+	spin_lock_init(&ctx->buf_pool.cam_freelist.lock);
+	ctx->buf_pool.cam_freelist.cnt = 0;
+	ctx->buf_pool.working_buf_size = CAM_CQ_BUF_NUM * working_buf_size;
+	ctx->buf_pool.msg_buf_size = CAM_CQ_BUF_NUM * msg_buf_size;
+	ctx->buf_pool.raw_workbuf_size = round_up(SIZE_OF_RAW_WORKBUF, PAGE_SIZE);
+	ctx->buf_pool.priv_workbuf_size = round_up(SIZE_OF_RAW_PRIV, PAGE_SIZE);
+	ctx->buf_pool.session_buf_size = round_up(SIZE_OF_SESSION, PAGE_SIZE);
+
+	/* raw working buffer */
+	ptr = dma_alloc_coherent(cam->smem_dev, ctx->buf_pool.raw_workbuf_size,
+				 &addr, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+	ctx->buf_pool.raw_workbuf_scp_addr = addr;
+	ctx->buf_pool.raw_workbuf_va = ptr;
+	dev_dbg(dev, "[%s] raw working buf scp addr:%pad va:%pK size %u\n",
+		__func__,
+		&ctx->buf_pool.raw_workbuf_scp_addr,
+		ctx->buf_pool.raw_workbuf_va,
+		ctx->buf_pool.raw_workbuf_size);
+
+	/* raw priv working buffer */
+	ptr = dma_alloc_coherent(cam->smem_dev, ctx->buf_pool.priv_workbuf_size,
+				 &addr, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+	ctx->buf_pool.priv_workbuf_scp_addr = addr;
+	ctx->buf_pool.priv_workbuf_va = ptr;
+	dev_dbg(dev, "[%s] raw pri working buf scp addr:%pad va:%pK size %u\n",
+		__func__,
+		&ctx->buf_pool.priv_workbuf_scp_addr,
+		ctx->buf_pool.priv_workbuf_va,
+		ctx->buf_pool.priv_workbuf_size);
+
+	/* session buffer */
+	ptr = dma_alloc_coherent(cam->smem_dev, ctx->buf_pool.session_buf_size,
+				 &addr, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+	ctx->buf_pool.session_buf_scp_addr = addr;
+	ctx->buf_pool.session_buf_va = ptr;
+	dev_dbg(dev, "[%s] session buf scp addr:%pad va:%pK size %u\n",
+		__func__,
+		&ctx->buf_pool.session_buf_scp_addr,
+		ctx->buf_pool.session_buf_va,
+		ctx->buf_pool.session_buf_size);
+
+	/* working buffer */
+	ptr = dma_alloc_coherent(cam->smem_dev, ctx->buf_pool.working_buf_size,
+				 &addr, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+	ctx->buf_pool.working_buf_scp_addr = addr;
+	ctx->buf_pool.working_buf_va = ptr;
+	addr = dma_map_resource(dev, addr, ctx->buf_pool.working_buf_size,
+				DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);
+	if (dma_mapping_error(dev, addr)) {
+		dev_err(dev, "failed to map scp iova\n");
+		ret = -ENOMEM;
+		goto fail_free_mem;
+	}
+	ctx->buf_pool.working_buf_iova = addr;
+	dev_dbg(dev, "[%s] CQ buf scp addr:%pad va:%pK iova:%pad size %u\n",
+		__func__,
+		&ctx->buf_pool.working_buf_scp_addr,
+		ctx->buf_pool.working_buf_va,
+		&ctx->buf_pool.working_buf_iova,
+		ctx->buf_pool.working_buf_size);
+
+	/* msg buffer */
+	ptr = dma_alloc_coherent(cam->smem_dev, ctx->buf_pool.msg_buf_size,
+				 &addr, GFP_KERNEL);
+	if (!ptr) {
+		ret = -ENOMEM;
+		goto fail_free_mem;
+	}
+	ctx->buf_pool.msg_buf_scp_addr = addr;
+	ctx->buf_pool.msg_buf_va = ptr;
+	dev_dbg(dev, "[%s] msg buf scp addr:%pad va:%pK size %u\n",
+		__func__, &ctx->buf_pool.msg_buf_scp_addr,
+		ctx->buf_pool.msg_buf_va, ctx->buf_pool.msg_buf_size);
+
+	for (i = 0; i < CAM_CQ_BUF_NUM; i++) {
+		struct mtk_cam_working_buf_entry *buf = &ctx->buf_pool.working_buf[i];
+		unsigned int offset = i * working_buf_size;
+		unsigned int offset_msg = i * msg_buf_size;
+
+		buf->ctx = ctx;
+		buf->buffer.va = ctx->buf_pool.working_buf_va + offset;
+		buf->buffer.iova = ctx->buf_pool.working_buf_iova + offset;
+		buf->buffer.scp_addr = ctx->buf_pool.working_buf_scp_addr + offset;
+		buf->buffer.size = working_buf_size;
+		buf->msg_buffer.va = ctx->buf_pool.msg_buf_va + offset_msg;
+		buf->msg_buffer.scp_addr = ctx->buf_pool.msg_buf_scp_addr + offset_msg;
+		buf->msg_buffer.size = msg_buf_size;
+		buf->s_data = NULL;
+
+		list_add_tail(&buf->list_entry, &ctx->buf_pool.cam_freelist.list);
+		ctx->buf_pool.cam_freelist.cnt++;
+	}
+
+	dev_dbg(ctx->cam->dev,
+		"%s: ctx(%d): cq buffers init, freebuf cnt(%d)\n",
+		__func__, ctx->stream_id, ctx->buf_pool.cam_freelist.cnt);
+
+	return 0;
+fail_free_mem:
+	dma_free_coherent(cam->smem_dev, ctx->buf_pool.working_buf_size,
+			  ctx->buf_pool.working_buf_va,
+			  ctx->buf_pool.working_buf_scp_addr);
+	ctx->buf_pool.working_buf_scp_addr = 0;
+
+	return ret;
+}
+
+void mtk_cam_working_buf_pool_release(struct mtk_cam_ctx *ctx, struct device *dev)
+{
+	struct mtk_cam_device *cam = ctx->cam;
+
+	/* msg buffer */
+	dma_free_coherent(cam->smem_dev, ctx->buf_pool.msg_buf_size,
+			  ctx->buf_pool.msg_buf_va,
+			  ctx->buf_pool.msg_buf_scp_addr);
+	dev_dbg(dev,
+		"%s:ctx(%d):msg buffers release, va:%pK scp_addr %pad sz %u\n",
+		__func__, ctx->stream_id,
+		ctx->buf_pool.msg_buf_va,
+		&ctx->buf_pool.msg_buf_scp_addr,
+		ctx->buf_pool.msg_buf_size);
+
+	/* working buffer */
+	dma_unmap_page_attrs(dev, ctx->buf_pool.working_buf_iova,
+			     ctx->buf_pool.working_buf_size,
+			     DMA_BIDIRECTIONAL,
+			     DMA_ATTR_SKIP_CPU_SYNC);
+	dma_free_coherent(cam->smem_dev, ctx->buf_pool.working_buf_size,
+			  ctx->buf_pool.working_buf_va,
+			  ctx->buf_pool.working_buf_scp_addr);
+	dev_dbg(dev,
+		"%s:ctx(%d):cq buffers release, iova %pad scp_addr %pad sz %u\n",
+		__func__, ctx->stream_id,
+		&ctx->buf_pool.working_buf_iova,
+		&ctx->buf_pool.working_buf_scp_addr,
+		ctx->buf_pool.working_buf_size);
+
+	/* session buffer */
+	dma_free_coherent(cam->smem_dev, ctx->buf_pool.session_buf_size,
+			  ctx->buf_pool.session_buf_va,
+			  ctx->buf_pool.session_buf_scp_addr);
+	dev_dbg(dev,
+		"%s:ctx(%d):session buffers release, scp_addr %pad sz %u\n",
+		__func__, ctx->stream_id,
+		&ctx->buf_pool.session_buf_scp_addr,
+		ctx->buf_pool.session_buf_size);
+
+	/* raw priv working buffer */
+	dma_free_coherent(cam->smem_dev, ctx->buf_pool.priv_workbuf_size,
+			  ctx->buf_pool.priv_workbuf_va,
+			  ctx->buf_pool.priv_workbuf_scp_addr);
+	dev_dbg(dev,
+		"%s:ctx(%d):raw pri working buffers release, scp_addr %pad sz %u\n",
+		__func__, ctx->stream_id,
+		&ctx->buf_pool.priv_workbuf_scp_addr,
+		ctx->buf_pool.priv_workbuf_size);
+
+	/* raw working buffer */
+	dma_free_coherent(cam->smem_dev, ctx->buf_pool.raw_workbuf_size,
+			  ctx->buf_pool.raw_workbuf_va,
+			  ctx->buf_pool.raw_workbuf_scp_addr);
+	dev_dbg(dev,
+		"%s:ctx(%d):raw working buffers release, scp_addr %pad sz %u\n",
+		__func__, ctx->stream_id,
+		&ctx->buf_pool.raw_workbuf_scp_addr,
+		ctx->buf_pool.raw_workbuf_size);
+}
+
+void mtk_cam_working_buf_put(struct mtk_cam_working_buf_entry *buf_entry)
+{
+	struct mtk_cam_ctx *ctx = buf_entry->ctx;
+	int cnt;
+
+	spin_lock(&ctx->buf_pool.cam_freelist.lock);
+
+	list_add_tail(&buf_entry->list_entry,
+		      &ctx->buf_pool.cam_freelist.list);
+	cnt = ++ctx->buf_pool.cam_freelist.cnt;
+
+	spin_unlock(&ctx->buf_pool.cam_freelist.lock);
+
+	dev_dbg(ctx->cam->dev, "%s:ctx(%d):iova(%pad), free cnt(%d)\n",
+		__func__, ctx->stream_id, &buf_entry->buffer.iova, cnt);
+}
+
+struct mtk_cam_working_buf_entry *mtk_cam_working_buf_get(struct mtk_cam_ctx *ctx)
+{
+	struct mtk_cam_working_buf_entry *buf_entry;
+	int cnt;
+
+	/* get from free list */
+	spin_lock(&ctx->buf_pool.cam_freelist.lock);
+	if (list_empty(&ctx->buf_pool.cam_freelist.list)) {
+		spin_unlock(&ctx->buf_pool.cam_freelist.lock);
+
+		dev_info(ctx->cam->dev, "%s:ctx(%d):no free buf\n",
+			 __func__, ctx->stream_id);
+		return NULL;
+	}
+
+	buf_entry = list_first_entry(&ctx->buf_pool.cam_freelist.list,
+				     struct mtk_cam_working_buf_entry,
+				     list_entry);
+	list_del(&buf_entry->list_entry);
+	cnt = --ctx->buf_pool.cam_freelist.cnt;
+	buf_entry->ctx = ctx;
+
+	spin_unlock(&ctx->buf_pool.cam_freelist.lock);
+
+	dev_dbg(ctx->cam->dev, "%s:ctx(%d):iova(%pad), free cnt(%d)\n",
+		__func__, ctx->stream_id, &buf_entry->buffer.iova, cnt);
+
+	return buf_entry;
+}
+
+int mtk_cam_img_working_buf_pool_init(struct mtk_cam_ctx *ctx, int buf_num,
+				      struct device *dev)
+{
+	int i, ret;
+	u32 working_buf_size;
+	void *ptr;
+	dma_addr_t addr;
+	struct mtk_cam_device *cam = ctx->cam;
+	struct mtk_cam_video_device *vdev;
+
+	if (buf_num > CAM_IMG_BUF_NUM) {
+		dev_err(ctx->cam->dev,
+			"%s: ctx(%d): image buffers number too large(%d)\n",
+			__func__, ctx->stream_id, buf_num);
+		WARN_ON(1);
+		return 0;
+	}
+
+	vdev = &ctx->pipe->vdev_nodes[MTK_RAW_MAIN_STREAM_OUT - MTK_RAW_SINK_NUM];
+	working_buf_size = vdev->active_fmt.fmt.pix_mp.plane_fmt[0].sizeimage;
+	INIT_LIST_HEAD(&ctx->img_buf_pool.cam_freeimglist.list);
+	spin_lock_init(&ctx->img_buf_pool.cam_freeimglist.lock);
+	ctx->img_buf_pool.cam_freeimglist.cnt = 0;
+	ctx->img_buf_pool.working_img_buf_size = buf_num * working_buf_size;
+	ptr = dma_alloc_coherent(cam->smem_dev,
+				 ctx->img_buf_pool.working_img_buf_size,
+				 &addr, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+	ctx->img_buf_pool.working_img_buf_scp_addr = addr;
+	ctx->img_buf_pool.working_img_buf_va = ptr;
+	addr = dma_map_resource(dev, addr, ctx->img_buf_pool.working_img_buf_size,
+				DMA_BIDIRECTIONAL, DMA_ATTR_SKIP_CPU_SYNC);
+	if (dma_mapping_error(dev, addr)) {
+		dev_err(dev, "failed to map scp iova\n");
+		ret = -ENOMEM;
+		goto fail_free_mem;
+	}
+	ctx->img_buf_pool.working_img_buf_iova = addr;
+	dev_dbg(dev,
+		"[%s] img working buf scp addr:%pad va:%pK iova: %pad size %d\n",
+		__func__,
+		&ctx->img_buf_pool.working_img_buf_scp_addr,
+		ctx->img_buf_pool.working_img_buf_va,
+		&ctx->img_buf_pool.working_img_buf_iova,
+		ctx->img_buf_pool.working_img_buf_size);
+
+	for (i = 0; i < buf_num; i++) {
+		struct mtk_cam_img_working_buf_entry *buf =
+			&ctx->img_buf_pool.img_working_buf[i];
+		int offset = i * working_buf_size;
+
+		buf->ctx = ctx;
+		buf->img_buffer.va =
+			ctx->img_buf_pool.working_img_buf_va + offset;
+		buf->img_buffer.scp_addr =
+			ctx->img_buf_pool.working_img_buf_scp_addr + offset;
+		buf->img_buffer.iova =
+			ctx->img_buf_pool.working_img_buf_iova + offset;
+		buf->img_buffer.size = working_buf_size;
+
+		list_add_tail(&buf->list_entry,
+			      &ctx->img_buf_pool.cam_freeimglist.list);
+		ctx->img_buf_pool.cam_freeimglist.cnt++;
+	}
+
+	dev_dbg(dev, "%s: ctx(%d): image buffers init, freebuf cnt(%d)\n",
+		__func__, ctx->stream_id, ctx->img_buf_pool.cam_freeimglist.cnt);
+	return 0;
+
+fail_free_mem:
+	dma_free_coherent(cam->smem_dev, ctx->img_buf_pool.working_img_buf_size,
+			  ctx->img_buf_pool.working_img_buf_va,
+			  ctx->img_buf_pool.working_img_buf_scp_addr);
+	return ret;
+}
+
+void mtk_cam_img_working_buf_pool_release(struct mtk_cam_ctx *ctx,
+					  struct device *dev)
+{
+	struct mtk_cam_device *cam = ctx->cam;
+
+	dma_unmap_page_attrs(dev, ctx->img_buf_pool.working_img_buf_iova,
+			     ctx->img_buf_pool.working_img_buf_size,
+			     DMA_BIDIRECTIONAL,
+			     DMA_ATTR_SKIP_CPU_SYNC);
+	dma_free_coherent(cam->smem_dev, ctx->img_buf_pool.working_img_buf_size,
+			  ctx->img_buf_pool.working_img_buf_va,
+			  ctx->img_buf_pool.working_img_buf_scp_addr);
+	dev_dbg(dev,
+		"%s:ctx(%d):img working buf release, scp addr %pad va %pK iova %pad, sz %u\n",
+		__func__, ctx->stream_id,
+		&ctx->img_buf_pool.working_img_buf_scp_addr,
+		ctx->img_buf_pool.working_img_buf_va,
+		&ctx->img_buf_pool.working_img_buf_iova,
+		ctx->img_buf_pool.working_img_buf_size);
+}
+
+void mtk_cam_img_working_buf_put(struct mtk_cam_img_working_buf_entry *buf_entry)
+{
+	struct mtk_cam_ctx *ctx = buf_entry->ctx;
+	int cnt;
+
+	spin_lock(&ctx->img_buf_pool.cam_freeimglist.lock);
+
+	list_add_tail(&buf_entry->list_entry,
+		      &ctx->img_buf_pool.cam_freeimglist.list);
+	cnt = ++ctx->img_buf_pool.cam_freeimglist.cnt;
+
+	spin_unlock(&ctx->img_buf_pool.cam_freeimglist.lock);
+
+	dev_dbg(ctx->cam->dev, "%s:ctx(%d):iova(0x%pad), free cnt(%d)\n",
+		__func__, ctx->stream_id, &buf_entry->img_buffer.iova, cnt);
+}
+
+struct mtk_cam_img_working_buf_entry *
+mtk_cam_img_working_buf_get(struct mtk_cam_ctx *ctx)
+{
+	struct mtk_cam_img_working_buf_entry *buf_entry;
+	int cnt;
+
+	/* get from free list */
+	spin_lock(&ctx->img_buf_pool.cam_freeimglist.lock);
+	if (list_empty(&ctx->img_buf_pool.cam_freeimglist.list)) {
+		spin_unlock(&ctx->img_buf_pool.cam_freeimglist.lock);
+
+		dev_info(ctx->cam->dev, "%s:ctx(%d):no free buf\n",
+			 __func__, ctx->stream_id);
+		return NULL;
+	}
+
+	buf_entry = list_first_entry(&ctx->img_buf_pool.cam_freeimglist.list,
+				     struct mtk_cam_img_working_buf_entry,
+				     list_entry);
+	list_del(&buf_entry->list_entry);
+	cnt = --ctx->img_buf_pool.cam_freeimglist.cnt;
+
+	spin_unlock(&ctx->img_buf_pool.cam_freeimglist.lock);
+
+	dev_dbg(ctx->cam->dev, "%s:ctx(%d):iova(0x%pad), free cnt(%d)\n",
+		__func__, ctx->stream_id, &buf_entry->img_buffer.iova, cnt);
+
+	return buf_entry;
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h
new file mode 100644
index 000000000000..24cc8382f93d
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_POOL_H
+#define __MTK_CAM_POOL_H
+
+struct mtk_cam_ctx;
+
+int mtk_cam_working_buf_pool_init(struct mtk_cam_ctx *ctx, struct device *dev);
+void mtk_cam_working_buf_pool_release(struct mtk_cam_ctx *ctx,
+				      struct device *dev);
+
+void mtk_cam_working_buf_put(struct mtk_cam_working_buf_entry *buf_entry);
+struct mtk_cam_working_buf_entry *
+	mtk_cam_working_buf_get(struct mtk_cam_ctx *ctx);
+
+int mtk_cam_img_working_buf_pool_init(struct mtk_cam_ctx *ctx, int buf_num,
+				      struct device *dev);
+void mtk_cam_img_working_buf_pool_release(struct mtk_cam_ctx *ctx,
+					  struct device *dev);
+
+void mtk_cam_img_working_buf_put(struct mtk_cam_img_working_buf_entry *buf_entry);
+struct mtk_cam_img_working_buf_entry *
+	mtk_cam_img_working_buf_get(struct mtk_cam_ctx *ctx);
+
+#endif /* __MTK_CAM_POOL_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h
new file mode 100644
index 000000000000..cb00d243559c
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h
@@ -0,0 +1,382 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef _CAM_REGS_H
+#define _CAM_REGS_H
+
+/* Raw Part */
+
+/* normal siganl */
+#define VS_INT_ST						BIT(0)
+#define TG_INT1_ST						BIT(1)
+#define TG_INT2_ST						BIT(2)
+#define EXPDON_ST						BIT(5)
+#define SOF_INT_ST						BIT(8)
+#define HW_PASS1_DON_ST						BIT(20)
+#define SW_PASS1_DON_ST						BIT(22)
+#define TG_VS_INT_ORG_ST					BIT(11)
+
+/* YUV siganl */
+#define YUV_SW_PASS1_DON_ST					BIT(0)
+#define YUV_PASS1_DON_ST					BIT(1)
+#define YUV_DMA_ERR_ST						BIT(2)
+
+/* err status */
+#define TG_OVRUN_ST						BIT(6)
+#define TG_GBERR_ST						BIT(7)
+#define CQ_DB_LOAD_ERR_ST					BIT(12)
+#define CQ_MAIN_CODE_ERR_ST					BIT(14)
+#define CQ_MAIN_VS_ERR_ST					BIT(15)
+#define CQ_MAIN_TRIG_DLY_ST					BIT(16)
+#define LSCI_ERR_ST						BIT(24)
+#define DMA_ERR_ST						BIT(26)
+
+/* CAM DMA done status */
+#define IMGO_DONE_ST						BIT(0)
+#define AFO_DONE_ST						BIT(8)
+#define CQI_R1_DONE_ST						BIT(15)
+
+/* RAW input trigger ctrl*/
+#define RAWI_R2_TRIG						BIT(0)
+#define RAWI_R3_TRIG						BIT(1)
+#define RAWI_R4_TRIG						BIT(2)
+#define RAWI_R5_TRIG						BIT(3)
+#define RAWI_R6_TRIG						BIT(4)
+
+/* IRQ signal mask */
+#define INT_ST_MASK_CAM (VS_INT_ST	 |\
+			 TG_INT1_ST	 |\
+			 TG_INT2_ST	 |\
+			 EXPDON_ST       |\
+			 HW_PASS1_DON_ST |\
+			 SOF_INT_ST      |\
+			 SW_PASS1_DON_ST)
+
+/* IRQ Error Mask */
+#define INT_ST_MASK_CAM_ERR	(TG_OVRUN_ST		|\
+				 TG_GBERR_ST		|\
+				 CQ_DB_LOAD_ERR_ST	|\
+				 CQ_MAIN_CODE_ERR_ST	|\
+				 CQ_MAIN_VS_ERR_ST	|\
+				 DMA_ERR_ST)
+
+/* camsys */
+#define REG_CAMSYS_CG_SET				0x0004
+#define REG_CAMSYS_CG_CLR				0x0008
+
+#define REG_HALT1_EN					0x0350
+#define REG_HALT2_EN					0x0354
+#define REG_HALT3_EN					0x0358
+#define REG_HALT4_EN					0x035c
+#define REG_HALT5_EN					0x0360
+#define REG_HALT6_EN					0x0364
+#define REG_FLASH					0x03A0
+#define REG_ULTRA_HALT1_EN				0x03c0
+#define REG_ULTRA_HALT2_EN				0x03c4
+#define REG_ULTRA_HALT3_EN				0x03c8
+#define REG_ULTRA_HALT4_EN				0x03cc
+#define REG_ULTRA_HALT5_EN				0x03d0
+#define REG_ULTRA_HALT6_EN				0x03d4
+#define REG_PREULTRA_HALT1_EN				0x03f0
+#define REG_PREULTRA_HALT2_EN				0x03f4
+#define REG_PREULTRA_HALT3_EN				0x03f8
+#define REG_PREULTRA_HALT4_EN				0x03fc
+#define REG_PREULTRA_HALT5_EN				0x0400
+#define REG_PREULTRA_HALT6_EN				0x0404
+
+/* Status check */
+#define REG_CTL_EN					0x0000
+#define REG_CTL_EN2					0x0004
+
+/* DMA Enable Register, DMA_EN */
+#define REG_CTL_MOD5_EN					0x0010
+#define REG_CTL_MOD6_EN					0x0014
+/* RAW input trigger*/
+#define REG_CTL_RAWI_TRIG				0x00C0
+
+#define REG_CTL_MISC					0x0060
+#define CTL_DB_EN					BIT(4)
+
+#define REG_CTL_SW_CTL					0x00C4
+#define REG_CTL_START					0x00B0
+
+#define REG_CTL_RAW_INT_EN				0x0100
+#define REG_CTL_RAW_INT_STAT				0x0104
+#define REG_CTL_RAW_INT2_EN				0x0110
+#define REG_CTL_RAW_INT2_STAT				0x0114
+#define REG_CTL_RAW_INT3_STAT				0x0124
+#define REG_CTL_RAW_INT4_STAT				0x0134
+#define REG_CTL_RAW_INT5_STAT				0x0144
+#define REG_CTL_RAW_INT6_EN				0x0150
+#define REG_CTL_RAW_INT6_STAT				0x0154
+#define REG_CTL_RAW_INT7_EN				0x0160
+#define REG_CTL_RAW_INT7_STAT				0x0164
+
+#define REG_CTL_RAW_MOD_DCM_DIS				0x0300
+#define REG_CTL_RAW_MOD2_DCM_DIS			0x0304
+#define REG_CTL_RAW_MOD3_DCM_DIS			0x0308
+#define REG_CTL_RAW_MOD5_DCM_DIS			0x0310
+#define REG_CTL_RAW_MOD6_DCM_DIS			0x0314
+
+#define REG_CTL_DBG_SET					0x00F0
+#define REG_CTL_DBG_PORT				0x00F4
+#define REG_DMA_DBG_SEL					0x4070
+#define REG_DMA_DBG_PORT				0x4074
+#define REG_CTL_DBG_SET2				0x00F8
+
+#define REG_CTL_RAW_MOD_REQ_STAT			0x0340
+#define REG_CTL_RAW_MOD2_REQ_STAT			0x0344
+#define REG_CTL_RAW_MOD3_REQ_STAT			0x0348
+#define REG_CTL_RAW_MOD4_REQ_STAT			0x034c
+#define REG_CTL_RAW_MOD5_REQ_STAT			0x0350
+#define REG_CTL_RAW_MOD6_REQ_STAT			0x0354
+
+#define REG_CTL_RAW_MOD_RDY_STAT			0x0360
+#define REG_CTL_RAW_MOD2_RDY_STAT			0x0364
+#define REG_CTL_RAW_MOD3_RDY_STAT			0x0368
+#define REG_CTL_RAW_MOD4_RDY_STAT			0x036c
+#define REG_CTL_RAW_MOD5_RDY_STAT			0x0370
+#define REG_CTL_RAW_MOD6_RDY_STAT			0x0374
+
+#define REG_CQ_EN					0x0400
+#define REG_SCQ_START_PERIOD				0x0408
+#define REG_CQ_THR0_CTL					0x0410
+#define REG_CQ_SUB_CQ_EN				0x06B0
+#define REG_CQ_SUB_THR0_CTL				0x06C0
+
+#define REG_CTL_SW_PASS1_DONE				0x00c8
+#define SW_DONE_SAMPLE_EN				BIT(8)
+#define REG_CTL_SW_SUB_CTL				0x00cc
+
+#define REG_CQ_THR0_BASEADDR				0x0414
+#define REG_CQ_THR0_BASEADDR_MSB			0x0418
+#define REG_CQ_THR0_DESC_SIZE				0x041C
+#define REG_SCQ_CQ_TRIG_TIME				0x0410
+#define REG_CQ_SUB_THR0_BASEADDR_2			0x06CC
+#define REG_CQ_SUB_THR0_BASEADDR_MSB_2			0x06D0
+#define REG_CQ_SUB_THR0_DESC_SIZE_2			0x06D8
+#define REG_CQ_SUB_THR0_BASEADDR_1			0x06C4
+#define REG_CQ_SUB_THR0_BASEADDR_MSB_1			0x06C8
+#define REG_CQ_SUB_THR0_DESC_SIZE_1			0x06D4
+#define SCQ_EN						BIT(20)
+#define SCQ_STAGGER_MODE				BIT(12)
+#define SCQ_SUBSAMPLE_EN				BIT(21)
+#define CQ_DB_EN					BIT(4)
+#define CQ_THR0_MODE_IMMEDIATE				BIT(4)
+#define CQ_THR0_MODE_CONTINUOUS				BIT(5)
+#define CQ_THR0_EN					BIT(0)
+#define SCQ_SUB_RESET					BIT(16)
+
+#define REG_TG_SEN_MODE					0x0700
+#define TG_CMOS_RDY_SEL					BIT(14)
+#define TG_SEN_MODE_CMOS_EN				BIT(0)
+#define TG_VFDATA_EN					BIT(0)
+#define TG_TG_FULL_SEL					BIT(15)
+#define TG_STAGGER_EN					BIT(22)
+
+#define REG_TG_VF_CON					0x0704
+#define REG_TG_SEN_GRAB_PXL				0x0708
+#define REG_TG_SEN_GRAB_LIN				0x070C
+#define REG_TG_PATH_CFG					0x0710
+#define TG_DB_LOAD_DIS					BIT(8)
+#define TG_SUB_SOF_SRC_SEL_0				BIT(20)
+#define TG_SUB_SOF_SRC_SEL_1				BIT(21)
+
+#define REG_TG_INTER_ST					0x073C
+/* use this MASK to extract TG_CAM_CS from TG_INTER_ST */
+#define TG_CAM_CS_MASK					0x3f00
+#define TG_IDLE_ST					BIT(8)
+
+#define REG_TG_FRMSIZE_ST				0x0738
+#define REG_TG_DCIF_CTL					0x075C
+#define TG_DCIF_EN					BIT(16)
+
+#define REG_TG_FRMSIZE_ST_R				0x076C
+#define REG_TG_TIME_STAMP				0x0778
+#define REG_TG_TIME_STAMP_CNT				0x077C
+
+/* tg flash */
+#define	REG_TG_XENON_FLASH_CTL				0x0780
+#define REG_TG_XENON_FLASH_OFFSET			0x0784
+#define REG_TG_XENON_FLASH_HIGH_WIDTH			0x0788
+#define REG_TG_XENON_FLASH_LOW_WIDTH			0x078C
+#define	REG_TG_IR_FLASH_CTL				0x0798
+#define REG_TG_IR_FLASH_OFFSET				0x079C
+#define REG_TG_IR_FLASH_HIGH_WIDTH			0x07A0
+#define REG_TG_IR_FLASH_LOW_WIDTH			0x07A4
+
+/* for raw & yuv's dma top base */
+#define CAMDMATOP_BASE					0x4000
+
+#define REG_DMA_SOFT_RST_STAT				0x4068
+#define REG_DMA_SOFT_RST_STAT2				0x406C
+#define REG_DMA_DBG_CHASING_STATUS			0x4098
+#define REG_DMA_DBG_CHASING_STATUS2			0x409c
+
+#define RAWI_R2_SMI_REQ_ST				BIT(0)
+#define RAWI_R3_SMI_REQ_ST				BIT(16)
+#define RAWI_R5_SMI_REQ_ST				BIT(16)
+
+#define RST_STAT_RAWI_R2				BIT(0)
+#define RST_STAT_RAWI_R3				BIT(2)
+#define RST_STAT_RAWI_R5				BIT(5)
+/* use spare register FH_SPARE_5 */
+#define REG_FRAME_SEQ_NUM				0x4994
+
+#define REG_CAMCTL_FBC_SEL				0x00A0
+#define REG_CAMCTL_FBC_RCNT_INC				0x00A4
+
+#define CAMCTL_IMGO_R1_RCNT_INC				BIT(0)
+#define CAMCTL_CQ_THR0_DONE_ST				BIT(0)
+#define CAMCTL_CQ_THRSUB_DONE_EN			BIT(10)
+#define CTL_CQ_THR0_START				BIT(0)
+
+/* CAMSYS_RAW 0x1a03 */
+#define OFFSET_OBC_R1_R_SUM_L				0x1178
+#define OFFSET_OBC_R1_R_SUM_H				0x117c
+#define OFFSET_OBC_R1_B_SUM_L				0x1180
+#define OFFSET_OBC_R1_B_SUM_H				0x1184
+#define OFFSET_OBC_R1_GR_SUM_L				0x1188
+#define OFFSET_OBC_R1_GR_SUM_H				0x118c
+#define OFFSET_OBC_R1_GB_SUM_L				0x1190
+#define OFFSET_OBC_R1_GB_SUM_H				0x1194
+#define OFFSET_OBC_R1_ACT_WIN_X				0x1198
+#define OFFSET_OBC_R1_ACT_WIN_Y				0x119c
+
+#define OFFSET_OBC_R2_R_SUM_L				0x1438
+#define OFFSET_OBC_R2_R_SUM_H				0x143c
+#define OFFSET_OBC_R2_B_SUM_L				0x1440
+#define OFFSET_OBC_R2_B_SUM_H				0x1444
+#define OFFSET_OBC_R2_GR_SUM_L				0x1448
+#define OFFSET_OBC_R2_GR_SUM_H				0x144c
+#define OFFSET_OBC_R2_GB_SUM_L				0x1450
+#define OFFSET_OBC_R2_GB_SUM_H				0x1454
+#define OFFSET_OBC_R2_ACT_WIN_X				0x1458
+#define OFFSET_OBC_R2_ACT_WIN_Y				0x145c
+
+#define OFFSET_OBC_R3_R_SUM_L				0x16f8
+#define OFFSET_OBC_R3_R_SUM_H				0x16fc
+#define OFFSET_OBC_R3_B_SUM_L				0x1700
+#define OFFSET_OBC_R3_B_SUM_H				0x1704
+#define OFFSET_OBC_R3_GR_SUM_L				0x1708
+#define OFFSET_OBC_R3_GR_SUM_H				0x170c
+#define OFFSET_OBC_R3_GB_SUM_L				0x1710
+#define OFFSET_OBC_R3_GB_SUM_H				0x1714
+#define OFFSET_OBC_R3_ACT_WIN_X				0x1718
+#define OFFSET_OBC_R3_ACT_WIN_Y				0x171c
+
+#define REG_LTM_AE_DEBUG_B_MSB				0x23f0
+#define REG_LTM_AE_DEBUG_B_LSB				0x23f4
+#define REG_LTM_AE_DEBUG_GB_MSB				0x23f8
+#define REG_LTM_AE_DEBUG_GB_LSB				0x23fc
+#define REG_LTM_AE_DEBUG_GR_MSB				0x2400
+#define REG_LTM_AE_DEBUG_GR_LSB				0x2404
+#define REG_LTM_AE_DEBUG_R_MSB				0x2408
+#define REG_LTM_AE_DEBUG_R_LSB				0x240c
+#define REG_LTMS_ACT_WIN_X				0x2578
+#define REG_LTMS_ACT_WIN_Y				0x257c
+
+#define REG_AA_R_SUM_L					0x2a1c
+#define REG_AA_R_SUM_H					0x2a20
+#define REG_AA_B_SUM_L					0x2a24
+#define REG_AA_B_SUM_H					0x2a28
+#define REG_AA_GR_SUM_L					0x2a2c
+#define REG_AA_GR_SUM_H					0x2a30
+#define REG_AA_GB_SUM_L					0x2a34
+#define REG_AA_GB_SUM_H					0x2a30
+#define REG_AA_ACT_WIN_X				0x2a3c
+#define REG_AA_ACT_WIN_Y				0x2a40
+
+#define DMA_OFFSET_CON0					0x020
+#define DMA_OFFSET_CON1					0x024
+#define DMA_OFFSET_CON2					0x028
+#define DMA_OFFSET_CON3					0x02c
+#define DMA_OFFSET_CON4					0x030
+#define DMA_OFFSET_ERR_STAT				0x034
+
+#define DMA_OFFSET_SPECIAL_DCIF				0x03c
+#define DC_CAMSV_STAGER_EN				BIT(16)
+
+#define FBC_R1A_BASE					0x2c00
+#define FBC_R2A_BASE					0x3780
+#define REG_FBC_CTL1(base, idx)				((base) + (idx) * 8)
+#define REG_FBC_CTL2(base, idx)				((base) + (idx) * 8 + 4)
+#define WCNT_BIT_MASK					0xFF00
+#define CNT_BIT_MASK					0xFF0000
+#define TG_FULLSEL_BIT_MASK				0x8000
+/* ORIDMA */
+/* CAMSYS_RAW 0x1a03 */
+#define REG_IMGO_R1_BASE				0x4880
+#define REG_FHO_R1_BASE					0x4930
+#define REG_AAHO_R1_BASE				0x49e0
+#define REG_PDO_R1_BASE					0x4a90
+#define REG_AAO_R1_BASE					0x4a40
+#define REG_AFO_R1_BASE					0x4bf0
+
+/* CAMSYS_YUV 0x1a05 */
+#define REG_YUVO_R1_BASE				0x4200
+#define REG_YUVBO_R1_BASE				0x42b0
+#define REG_YUVCO_R1_BASE				0x4360
+#define REG_YUVDO_R1_BASE				0x4410
+#define REG_YUVO_R3_BASE				0x44c0
+#define REG_YUVBO_R3_BASE				0x4570
+#define REG_YUVCO_R3_BASE				0x4620
+#define REG_YUVDO_R3_BASE				0x46D0
+
+/* ULCDMA */
+/* CAMSYS_RAW 0x1603 */
+#define REG_LTMSO_R1_BASE				0x4ce0
+#define REG_TSFSO_R1_BASE				0x4ca0
+#define REG_TSFSO_R2_BASE				0x4de0
+#define REG_FLKO_R1_BASE				0x4d20
+#define REG_UFEO_R1_BASE				0x4d60
+
+/* CAMSYS_YUV 0x1605 */
+#define REG_YUVO_R2_BASE				0x4780
+#define REG_YUVBO_R2_BASE				0x47c0
+#define REG_YUVO_R4_BASE				0x4800
+#define REG_YUVBO_R4_BASE				0x4840
+#define REG_YUVO_R5_BASE				0x4c00
+#define REG_YUVBO_R5_BASE				0x4c40
+#define REG_RZH1N2TO_R1_BASE				0x4880
+#define REG_RZH1N2TBO_R1_BASE				0x48c0
+#define REG_RZH1N2TO_R2_BASE				0x4900
+#define REG_RZH1N2TO_R3_BASE				0x4940
+#define REG_RZH1N2TBO_R3_BASE				0x4980
+#define REG_DRZS4NO_R1_BASE				0x49c0
+#define REG_DRZS4NO_R2_BASE				0x4a00
+#define REG_DRZS4NO_R3_BASE				0x4a40
+#define REG_ACTSO_R1_BASE				0x4ac0
+#define REG_TNCSO_R1_BASE				0x4b00
+#define REG_TNCSBO_R1_BASE				0x4b40
+#define REG_TNCSHO_R1_BASE				0x4b80
+#define REG_TNCSYO_R1_BASE				0x4bc0
+
+/* CAMSYS_RAW 0x1a03 */
+#define REG_RAWI_R2_BASE				0x4100
+#define REG_RAWI_R2_BASE_MSB				0x4104
+#define REG_UFDI_R2_BASE				0x4170
+#define REG_RAWI_R3_BASE				0x41e0
+#define REG_RAWI_R3_BASE_MSB				0x41e4
+#define REG_UFDI_R3_BASE				0x4250
+#define REG_CQI_R1_BASE					0x4410
+#define REG_CQI_R1_BASE_MSB				0x4414
+#define REG_CQI_R2_BASE					0x4480
+#define REG_CQI_R2_BASE_MSB				0x4484
+#define REG_CQI_R3_BASE					0x44f0
+#define REG_CQI_R3_BASE_MSB				0x44f4
+#define REG_CQI_R4_BASE					0x4560
+#define REG_CQI_R4_BASE_MSB				0x4564
+#define REG_LSCI_R1_BASE				0x45d0
+#define REG_BPCI_R1_BASE				0x4640
+#define REG_BPCI_R2_BASE				0x4680
+#define REG_BPCI_R3_BASE				0x46c0
+#define REG_PDI_R1_BASE					0x4700
+#define REG_AAI_R1_BASE					0x4780
+#define REG_CACI_R1_BASE				0x47c0
+#define REG_RAWI_R5_BASE				0x4330
+#define REG_RAWI_R6_BASE				0x4800
+
+#endif	/* _CAM_REGS_H */
-- 
2.18.0


