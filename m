Return-Path: <linux-media+bounces-33322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C51AC2F9E
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C9DB173D8D
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8E61EF36C;
	Sat, 24 May 2025 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hzKrwat5"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2811E5B9E;
	Sat, 24 May 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087532; cv=none; b=sVpATm+kc031GD6cyiiA2k1gEAt5fRlPiuNLXQGHhx9HrgHabL+1gdnCMAWC6KtCya4PnXQ2Ju9p3siPXo4EwjXk9n5g6VrkK8g2zFIu/tqiPqNxQ8t/riVbvbLM2i4E9nDMzj2+72q6MRxJ1fnPIL1BlujjcSTVduJx28Vwek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087532; c=relaxed/simple;
	bh=5zKVBDSZsPZIGO1rQy1e8C+0blEMKNM4EwP3lkLKib8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PvPPg8+Up8rhLNAnJt79FF/VuIhVVRNRUbyG2jXBM49lAC8Au6+18SLWeX5uHedTjHLiV5mGUrMqlCKX+VV6q8rNmVjLfYQJXbPGZ+/wgvxqJwPql8xKy9zeFUndtnVpKlvBMYmEV7dWp+HtMqeL4B6eHS5kmD1OMMQBG9N/9ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hzKrwat5; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7b16f248389511f0813e4fe1310efc19-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ltccVGKEcwwXW3G4xo6yUV1m6WKsAYDRgKnrmsCeUaM=;
	b=hzKrwat58w+eVE1T2lAqE6m5FDlDyIq/2xUDh21WQ+aZeIbSMlS7+IoPdMHECj9HPfFKmtPSQ26WWqTO5jSwzs5rytojqSsjoX4Ve36owOxVjvyyThqTfp0bHqCZC62GCXfeoPGk7ClXuEKdXZwpPbI4jQTiztcoLEL2asyD/TU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6a757da5-e8b0-413f-85a4-bb4a9aae4ed6,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:5fbb3bf1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7b16f248389511f0813e4fe1310efc19-20250524
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2008176767; Sat, 24 May 2025 19:51:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [PATCH v1 08/10] media: mediatek: isp: Add SCP support for ImgSys driver
Date: Sat, 24 May 2025 19:50:00 +0800
Message-ID: <20250524115144.3832748-9-olivia.wen@mediatek.com>
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
focusing on the SCP support for ImgSys driver. It covers the memory
allocation and transmission interfaces required by SCP. Frame-related
information is transmitted to SCP, where it is packaged into commands
and the necessary hardware information. These commands are then sent to
the kernel for further processing.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../mediatek/isp/isp_7x/imgsys/Makefile       |   1 +
 .../mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h  | 143 +++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-scp.c        | 349 ++++++++++++++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-scp.h        | 194 ++++++++++
 4 files changed, 687 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
index c0f0f3a0c38a..29c18c773fdc 100644
--- a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
@@ -3,6 +3,7 @@
 
 mtk_imgsys_util-objs := \
 mtk_imgsys-cmdq.o \
+mtk_imgsys-scp.o \
 mtk_imgsys-module_main.o \
 mtk_imgsys-of.o \
 mtk_imgsys-formats.o \
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h
new file mode 100644
index 000000000000..850f6ec99a96
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk-img-ipi.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_IMG_IPI_H__
+#define __MTK_IMG_IPI_H__
+
+#include <linux/types.h>
+#include "mtk_header_desc.h"
+
+#define HEADER_VER 19481
+#define IMG_MAX_HW_DMAS 72
+#define IMG_MAX_HW 12
+#define WPE_ENG_NUM 3
+#define TMAX 16
+
+/**
+ * enum img_module_id - Enumeration of image processing module IDs
+ * @IMG_MODULE_WPE: ID for the WPE (Warp Engine) module
+ * @IMG_MODULE_TRAW: ID for the TRAW (Tile Raw) module
+ * @IMG_MODULE_DIP: ID for the DIP (Digital Image Processing) module
+ * @IMG_MODULE_PQDIP: ID for the PQDIP (Picture Quality Digital Image Processing) module
+ * @IMG_MODULE_MAX: Maximum ID value, used for boundary checking
+ */
+enum img_module_id {
+	IMG_MODULE_WPE = 0,
+	IMG_MODULE_TRAW = 1,
+	IMG_MODULE_DIP = 2,
+	IMG_MODULE_PQDIP = 3,
+	IMG_MODULE_MAX = 4,
+};
+
+/**
+ * struct module_init_info - Information about module initialization
+ * @c_wbuf: Command queue (CQ) working buffer address
+ * @c_wbuf_dma: DMA address of the CQ working buffer
+ * @c_wbuf_sz: Size of the CQ working buffer
+ * @t_wbuf: Tile dirvier (TDR) working buffer address
+ * @t_wbuf_dma: DMA address of the TDR working buffer
+ * @t_wbuf_sz: Size of the TDR working buffer
+ */
+struct module_init_info {
+	u64 c_wbuf;         /* CQ working buffer address */
+	u64 c_wbuf_dma;     /* DMA address of the CQ working buffer */
+	u32 c_wbuf_sz;      /* Size of the CQ working buffer */
+	u64 t_wbuf;         /* TDR working buffer address */
+	u64 t_wbuf_dma;     /* DMA address of the TDR working buffer */
+	u32 t_wbuf_sz;      /* Size of the TDR working buffer */
+} __packed;
+
+/**
+ * struct img_init_info - Information about image initialization
+ * @header_version: Version of the header
+ * @isp_version: ISP version
+ * @frameparam_size: Size of the frame parameters
+ * @module_info: Array of module working buffer information
+ * @g_wbuf: Global Command Engine (GCE) working buffer address
+ * @g_wbuf_sz: Size of the GCE working buffer
+ *
+ * This structure is used as the parameter for IPI_IMGSYS_INIT_ID and
+ * IPI_IMGSYS_DEINIT_ID. It contains information necessary for initializing and
+ * deinitializing the image system.
+ */
+struct img_init_info {
+	u32	header_version;
+	u32	isp_version;
+	u32	frameparam_size;
+	struct module_init_info module_info[IMG_MODULE_MAX];
+	u64	g_wbuf;
+	u32	g_wbuf_sz;
+} __packed;
+
+/**
+ * struct img_swfrm_info - Software frame information structure for image system
+ * @hw_comb: Hardware combination, which used to store the combination of
+ * enum mtk_imgsys_engine_bitmask
+ * @sw_ridx: Software read index, provided to SCP upon notification to access
+ * GCE buffer location
+ * @is_time_shared: Indicates if the frame is time-shared
+ * @is_earlycb: Indicates if early callback is enabled
+ * @sw_goft: offset of GCE buffer
+ * @g_swbuf: virtual address of GCE buffer
+ *
+ * These fields are primarily set by SCP (System Control Processor) and used by
+ * the kernel for processing and verifing data.
+ */
+struct img_swfrm_info {
+	u32 hw_comb;
+	int sw_ridx;
+	u8 is_time_shared;
+	u8 is_earlycb;
+	u64 sw_goft;
+	void *g_swbuf;
+} __packed;
+
+/**
+ * struct img_ipi_frameparam - Frame parameters for IMGSYS IPI
+ * @dmas_enable: Array indicating enabled DMAs for each hardware unit
+ * @dmas: Array of DMA descriptors for each hardware unit
+ * @tuning_meta: Descriptor for tuning metadata
+ * @ctrl_meta: Descriptor for control metadata
+ *
+ * This structure defines the frame parameters used in the IMGSYS IPI
+ * (Inter-Processor Interface). It includes arrays to indicate enabled DMAs and
+ * their descriptors, as well as descriptors for tuning and control metadata.
+ */
+struct img_ipi_frameparam {
+	u8 dmas_enable[IMG_MAX_HW_DMAS];
+	struct header_desc_norm	dmas[IMG_MAX_HW_DMAS];
+	struct header_desc_norm	tuning_meta;
+	struct header_desc_norm	ctrl_meta;
+};
+
+/**
+ * struct img_sw_buffer - Software buffer address information
+ * @scp_addr: Physical address accessed by SCP
+ * @offset: Address offset
+ *
+ * This structure defines the address information of a software buffer used in
+ * the SCP.
+ */
+struct img_sw_buffer {
+	u32	scp_addr;
+	u32	offset;
+} __packed;
+
+/**
+ * struct img_ipi_param - Parameters for IMGSYS IPI
+ * @frm_param: Software buffer adreess for frame parameters
+ * @req_addr_va: Virtual address for the request
+ *
+ * This structure defines the parameters used in the IMGSYS IPI, including a
+ * software buffer physical address for frame parameters and a virtual address
+ * for the request.
+ */
+struct img_ipi_param {
+	struct img_sw_buffer frm_param;
+	u64	req_addr_va;
+} __packed;
+
+#endif  /* __MTK_IMG_IPI_H__ */
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.c
new file mode 100644
index 000000000000..4e6126d9f28c
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+#include <linux/slab.h>
+#include <linux/remoteproc.h>
+#include <linux/dma-direction.h>
+#include "mtk_imgsys-cmdq.h"
+#include "mtk_imgsys-scp.h"
+
+#define SCP_TIMEOUT_MS          4000U
+
+/**
+ * struct mtk_scp_reserve_memblock - Represents a memory block reserved by the
+ * kernel for usage by the SCP (System Control Processor).
+ *
+ * @id:         Unique identifier for the memory block. This ID is used to
+ *              reference and manage the memory block within the system.
+ * @start_phys: Physical address the starting point of the buffer.
+ * @start_virt: Kernel virtual address of the starting point of the buffer.
+ * @start_dma:  DMA (Direct Memory Access) address of the starting point of the
+ *              buffer.
+ * @size:       Size of the allocated buffer, in bytes.
+ * @dma_dir:	Direction of DMA data transfer, indicating whether the data is
+ *				being transferred to the device, from the device, or
+ *				bidirectionally.
+ */
+struct mtk_scp_reserve_memblock {
+	unsigned int id;
+	phys_addr_t start_phys;
+	void *start_virt;
+	phys_addr_t start_dma;
+	unsigned int size;
+	enum dma_data_direction dma_dir;
+};
+
+/* Array of reserved memory blocks for various hardware components */
+static struct mtk_scp_reserve_memblock reserve_memblock[] = {
+	{
+		/*WPE CQ buffer for WPE HW usage*/
+		.id = WPE_MEM_C_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0xE1000,   /*900KB*/
+		.dma_dir = DMA_TO_DEVICE,
+	},
+	{
+		/*WPE TDR buffer for tile driver usage*/
+		.id = WPE_MEM_T_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0x196000,   /*1MB + 600KB*/
+		.dma_dir = DMA_TO_DEVICE,
+	},
+	{
+		/*TRAW CQ buffer for TRAW driver usage*/
+		.id = TRAW_MEM_C_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0x4C8000,   /*4MB + 800KB*/
+		.dma_dir = DMA_TO_DEVICE,
+	},
+	{
+		/*TRAW TDR buffer for tile driver usage*/
+		.id = TRAW_MEM_T_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0x1AC8000,   /*26MB + 800KB*/
+		.dma_dir = DMA_TO_DEVICE,
+	},
+	{
+		/*DIP CQ buffer for TRAW HW usage*/
+		.id = DIP_MEM_C_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0x5C8000,   /*5MB + 800KB*/
+		.dma_dir = DMA_TO_DEVICE,
+	},
+	{
+		/*DIP TDR buffer for tile driver usage*/
+		.id = DIP_MEM_T_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0x1FAF000,   /*31MB + 700KB*/
+		.dma_dir = DMA_TO_DEVICE,
+	},
+	{
+		/*PQDIP CQ buffer for TRAW HW usage*/
+		.id = PQDIP_MEM_C_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0x100000,   /*1MB*/
+		.dma_dir = DMA_TO_DEVICE,
+	},
+	{
+		/*PQDIP TDR buffer for tile driver usage*/
+		.id = PQDIP_MEM_T_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0x170000,   /*1MB + 500KB*/
+		.dma_dir = DMA_TO_DEVICE,
+	},
+	{
+		/*GCE command buffer for GCE HW usage*/
+		.id = IMG_MEM_G_ID,
+		.start_phys = 0x0,
+		.start_virt = NULL,
+		.start_dma  = 0x0,
+		.size = 0x1800000,
+		.dma_dir = DMA_BIDIRECTIONAL,
+	},
+};
+
+static phys_addr_t imgsys_scp_get_reserve_mem_phys(enum img_mem_id id)
+{
+	if (id >= IMG_MEM_ID_COUNT) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	}
+	return reserve_memblock[id].start_phys;
+}
+
+static phys_addr_t imgsys_scp_get_reserve_mem_dma(enum img_mem_id id)
+{
+	if (id >= IMG_MEM_ID_COUNT) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	}
+	return reserve_memblock[id].start_dma;
+}
+
+void *imgsys_scp_get_reserve_mem_virt(enum img_mem_id id)
+{
+	if (id >= IMG_MEM_ID_COUNT)
+		return NULL;
+	else
+		return reserve_memblock[id].start_virt;
+}
+EXPORT_SYMBOL(imgsys_scp_get_reserve_mem_virt);
+
+unsigned int imgsys_scp_get_reserve_mem_size(enum img_mem_id id)
+{
+	if (id >= IMG_MEM_ID_COUNT) {
+		pr_err("[SCP] no reserve memory for %d", id);
+		return 0;
+	}
+	return reserve_memblock[id].size;
+}
+
+int imgsys_scp_alloc_reserve_mem(struct mtk_imgsys_dev *imgsys_dev)
+{
+	enum img_mem_id id;
+	unsigned int block_num;
+	void *ptr;
+	dma_addr_t addr;
+
+	block_num = ARRAY_SIZE(reserve_memblock);
+	for (id = 0; id < block_num; id++) {
+		ptr = dma_alloc_coherent(imgsys_dev->smem_dev,
+					 reserve_memblock[id].size,
+					 &addr, GFP_KERNEL);
+		if (!ptr)
+			return -ENOMEM;
+
+		reserve_memblock[id].start_virt = ptr;
+		reserve_memblock[id].start_phys = addr;
+		reserve_memblock[id].start_dma =
+			dma_map_resource(imgsys_dev->dev, addr,
+					 reserve_memblock[id].size,
+					 reserve_memblock[id].dma_dir,
+					 DMA_ATTR_SKIP_CPU_SYNC);
+		if (dma_mapping_error(imgsys_dev->dev,
+				      reserve_memblock[id].start_dma)) {
+			dev_err(imgsys_dev->dev, "failed to map scp iova\n");
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+int imgsys_scp_free_reserve_mem(struct mtk_imgsys_dev *imgsys_dev)
+{
+	enum img_mem_id id;
+
+	/* release reserved memory */
+	for (id = 0; id < IMG_MEM_ID_COUNT; id++) {
+		dma_unmap_resource(imgsys_dev->dev,
+				   reserve_memblock[id].start_dma,
+				   reserve_memblock[id].size,
+				   reserve_memblock[id].dma_dir,
+				   DMA_ATTR_SKIP_CPU_SYNC);
+		dma_free_coherent(imgsys_dev->smem_dev,
+				  reserve_memblock[id].size,
+				  reserve_memblock[id].start_virt,
+				  reserve_memblock[id].start_phys);
+
+		reserve_memblock[id].start_dma = 0x0;
+		reserve_memblock[id].start_virt = NULL;
+		reserve_memblock[id].start_phys = 0x0;
+	}
+
+	return 0;
+}
+
+int imgsys_scp_get_reserve_mem_info(struct img_init_info *info)
+{
+	if (!info) {
+		pr_err("%s:NULL info\n", __func__);
+		return -EINVAL;
+	}
+
+	/* WPE */
+	info->module_info[IMG_MODULE_WPE].c_wbuf =
+				imgsys_scp_get_reserve_mem_phys(WPE_MEM_C_ID);
+	info->module_info[IMG_MODULE_WPE].c_wbuf_dma =
+				imgsys_scp_get_reserve_mem_dma(WPE_MEM_C_ID);
+	info->module_info[IMG_MODULE_WPE].c_wbuf_sz =
+				imgsys_scp_get_reserve_mem_size(WPE_MEM_C_ID);
+	info->module_info[IMG_MODULE_WPE].t_wbuf =
+				imgsys_scp_get_reserve_mem_phys(WPE_MEM_T_ID);
+	info->module_info[IMG_MODULE_WPE].t_wbuf_dma =
+				imgsys_scp_get_reserve_mem_dma(WPE_MEM_T_ID);
+	info->module_info[IMG_MODULE_WPE].t_wbuf_sz =
+				imgsys_scp_get_reserve_mem_size(WPE_MEM_T_ID);
+
+	/* TRAW */
+	info->module_info[IMG_MODULE_TRAW].c_wbuf =
+				imgsys_scp_get_reserve_mem_phys(TRAW_MEM_C_ID);
+	info->module_info[IMG_MODULE_TRAW].c_wbuf_dma =
+				imgsys_scp_get_reserve_mem_dma(TRAW_MEM_C_ID);
+	info->module_info[IMG_MODULE_TRAW].c_wbuf_sz =
+				imgsys_scp_get_reserve_mem_size(TRAW_MEM_C_ID);
+	info->module_info[IMG_MODULE_TRAW].t_wbuf =
+				imgsys_scp_get_reserve_mem_phys(TRAW_MEM_T_ID);
+	info->module_info[IMG_MODULE_TRAW].t_wbuf_dma =
+				imgsys_scp_get_reserve_mem_dma(TRAW_MEM_T_ID);
+	info->module_info[IMG_MODULE_TRAW].t_wbuf_sz =
+				imgsys_scp_get_reserve_mem_size(TRAW_MEM_T_ID);
+
+	/* DIP */
+	info->module_info[IMG_MODULE_DIP].c_wbuf =
+				imgsys_scp_get_reserve_mem_phys(DIP_MEM_C_ID);
+	info->module_info[IMG_MODULE_DIP].c_wbuf_dma =
+				imgsys_scp_get_reserve_mem_dma(DIP_MEM_C_ID);
+	info->module_info[IMG_MODULE_DIP].c_wbuf_sz =
+				imgsys_scp_get_reserve_mem_size(DIP_MEM_C_ID);
+	info->module_info[IMG_MODULE_DIP].t_wbuf =
+				imgsys_scp_get_reserve_mem_phys(DIP_MEM_T_ID);
+	info->module_info[IMG_MODULE_DIP].t_wbuf_dma =
+				imgsys_scp_get_reserve_mem_dma(DIP_MEM_T_ID);
+	info->module_info[IMG_MODULE_DIP].t_wbuf_sz =
+				imgsys_scp_get_reserve_mem_size(DIP_MEM_T_ID);
+
+	/* PQDIP */
+	info->module_info[IMG_MODULE_PQDIP].c_wbuf =
+				imgsys_scp_get_reserve_mem_phys(PQDIP_MEM_C_ID);
+	info->module_info[IMG_MODULE_PQDIP].c_wbuf_dma =
+				imgsys_scp_get_reserve_mem_dma(PQDIP_MEM_C_ID);
+	info->module_info[IMG_MODULE_PQDIP].c_wbuf_sz =
+				imgsys_scp_get_reserve_mem_size(PQDIP_MEM_C_ID);
+	info->module_info[IMG_MODULE_PQDIP].t_wbuf =
+				imgsys_scp_get_reserve_mem_phys(PQDIP_MEM_T_ID);
+	info->module_info[IMG_MODULE_PQDIP].t_wbuf_dma =
+				imgsys_scp_get_reserve_mem_dma(PQDIP_MEM_T_ID);
+	info->module_info[IMG_MODULE_PQDIP].t_wbuf_sz =
+				imgsys_scp_get_reserve_mem_size(PQDIP_MEM_T_ID);
+
+	/* GCE command */
+	info->g_wbuf = imgsys_scp_get_reserve_mem_phys(IMG_MEM_G_ID);
+	info->g_wbuf_sz = imgsys_scp_get_reserve_mem_size(IMG_MEM_G_ID);
+
+	return 0;
+}
+
+int imgsys_scp_init(struct mtk_imgsys_dev *imgsys_dev,
+		    scp_ipi_handler_t imgsys_scp_handler)
+{
+	int ret = 0;
+
+	ret = rproc_boot(imgsys_dev->rproc_handle);
+	if (ret) {
+		dev_err(imgsys_dev->dev,
+			"%s failed to rproc_boot\n", __func__);
+		return ret;
+	}
+
+	ret = scp_ipi_register(imgsys_dev->scp, SCP_IPI_IMGSYS_CMD,
+			       imgsys_scp_handler, imgsys_dev);
+	if (ret) {
+		dev_err(imgsys_dev->dev,
+			"%s failed to register IPI cmd\n", __func__);
+		return ret;
+	}
+
+	return ret;
+}
+
+void imgsys_scp_deinit(struct mtk_imgsys_dev *imgsys_dev)
+{
+	rproc_shutdown(imgsys_dev->rproc_handle);
+}
+
+int imgsys_scp_send(struct mtk_imgsys_dev *imgsys_dev,
+		    enum imgsys_ipi_id id, void *buf,
+		    unsigned int len, int req_fd,
+		    unsigned int wait)
+{
+	struct share_buf send_obj = { 0 };
+	int ret = 0;
+
+	dev_dbg(imgsys_dev->dev, "%s id:%d len %d\n",
+		__func__, id, len);
+
+	if (id < IPI_IMGSYS_INIT_ID || id >= IPI_MAX_ID ||
+	    len > sizeof(send_obj.share_data) || !buf) {
+		dev_info(imgsys_dev->dev,
+			 "%s failed to send scp message (len/sz(%d/%zu)\n",
+			 __func__, len, sizeof(send_obj.share_data));
+		return -EINVAL;
+	}
+
+	send_obj.len = len;
+	send_obj.id = id;
+	memcpy((void *)send_obj.share_data, buf, len);
+
+	send_obj.info.send.ipi = id;
+	send_obj.info.send.req = req_fd;
+	send_obj.info.send.ack = (wait ? 1 : 0);
+	send_obj.info.send.seq = 0;
+
+	ret = scp_ipi_send(imgsys_dev->scp, SCP_IPI_IMGSYS_CMD,
+			   (void *)&send_obj, sizeof(send_obj),
+			   wait ? msecs_to_jiffies(SCP_TIMEOUT_MS) : 0);
+	if (ret)
+		dev_err(imgsys_dev->dev,
+			"%s: send SCP(%d) failed %d\n", __func__, id, ret);
+
+	return 0;
+}
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.h
new file mode 100644
index 000000000000..2082c4bdf96f
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-scp.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef MTK_IMGSYS_SCP_H
+#define MTK_IMGSYS_SCP_H
+
+#include <linux/remoteproc/mtk_scp.h>
+#include "mtk-img-ipi.h"
+#include "mtk_imgsys-dev.h"
+
+/* the size of share buffer between the kernel and SCP */
+#define SCP_SHARE_BUF_SIZE      576
+
+/**
+ * struct object_info - Represents information associated with a object,
+ * particularly in the context of inter-processor communication and media
+ * processing.
+ *
+ * @ipi: Specifies the IPI (Inter-Processor Interrupt) ID, using 5 bits.
+ * @ack: Indicates whether an acknowledgment is required, using 1 bit.
+ * @req: Holds the media request ID, using 10 bits.
+ * @seq: A sequence number, using 16 bits, for tracking the order of
+ *       objects or messages.
+ * @cmd: Combined command representation.
+ */
+struct object_info {
+	union {
+		struct send {
+			u32 ipi: 5;  /* IPI ID */
+			u32 ack: 1;  /* Acknowledgment flag */
+			u32 req: 10; /* Media request ID */
+			u32 seq: 16; /* Sequence number */
+		} __packed send;
+		u32 cmd; /* Combined command representation */
+	};
+} __packed;
+
+/**
+ * struct share_buf - DTCM (Data Tightly-Coupled Memory) buffer shared with
+ *                    AP and hardware components of IMGSYS
+ *
+ * @id:               IPI (Inter-Processor Interrupt) ID
+ * @len:              Length of the shared buffer
+ * @share_data:       Data contained in the shared buffer
+ * @info:             Information associated with the object
+ *
+ * This structure represents a DTCM buffer that is shared between the AP and
+ * the hardware components of the MediaTek Image System (IMGSYS). It includes
+ * the IPI ID, the length of the shared buffer, the actual buffer data, and
+ * additional object information.
+ */
+struct share_buf {
+	u32 id;                            /* IPI (Inter-Processor Interrupt) ID */
+	u32 len;                           /* Length of the shared buffer */
+	u8 share_data[SCP_SHARE_BUF_SIZE]; /* Data contained in the shared buffer */
+	struct object_info info;           /* Information object */
+};
+
+/**
+ * enum img_mem_id - Enumeration of image memory IDs
+ *
+ * @WPE_MEM_C_ID: Warping Engine (WPE) module command queue (CQ) buffer
+ * @WPE_MEM_T_ID: WPE module tile driver (TDR) buffer
+ * @TRAW_MEM_C_ID: Tile-Raw (TRAW) module CQ buffer
+ * @TRAW_MEM_T_ID: TRAW module TDR buffer
+ * @DIP_MEM_C_ID: Digital Image Processing (DIP) module CQ buffer
+ * @DIP_MEM_T_ID: DIP module TDR buffer
+ * @PQDIP_MEM_C_ID: Picture Quality image processing (PQDIP) CQ buffer
+ * @PQDIP_MEM_T_ID: PQDIP TDR buffer
+ * @IMG_MEM_G_ID: GCE command buffer
+ * @IMG_MEM_ID_COUNT: Total number of memory IDs
+ *
+ * This enumeration defines the various memory IDs used in the MediaTek
+ * image system. Each memory ID corresponds to a specific buffer used
+ * by different modules within the image system.
+ */
+enum img_mem_id {
+	WPE_MEM_C_ID,       /* WPE module CQ buffer */
+	WPE_MEM_T_ID,       /* WPE module TDR buffer */
+	TRAW_MEM_C_ID,      /* TRAW module CQ buffer */
+	TRAW_MEM_T_ID,      /* TRAW module TDR buffer */
+	DIP_MEM_C_ID,       /* DIP module CQ buffer */
+	DIP_MEM_T_ID,       /* DIP module TDR buffer */
+	PQDIP_MEM_C_ID,     /* PQDIP CQ buffer */
+	PQDIP_MEM_T_ID,     /* PQDIP TDR buffer */
+	IMG_MEM_G_ID,       /* GCE command buffer */
+	IMG_MEM_ID_COUNT,   /* Total number of memory IDs */
+};
+
+/**
+ * enum imgsys_ipi_id - Enumeration of IPI (Inter-Processor Interrupt) IDs
+ * @IPI_IMGSYS_INIT_ID: ID for initializing the image system
+ * @IPI_IMGSYS_FRAME_ID: ID for processing a frame
+ * @IPI_IMGSYS_DEQUE_DONE_ID: ID for indicating frame dequeuing is done
+ * @IPI_IMGSYS_DEINIT_ID: ID for deinitializing the image system
+ * @IPI_MAX_ID: Maximum ID value, used for boundary checking
+ */
+enum imgsys_ipi_id {
+	IPI_IMGSYS_INIT_ID = 0,	/* ID for initializing the image system */
+	IPI_IMGSYS_FRAME_ID,	/* ID for processing a frame */
+	IPI_IMGSYS_DEQUE_DONE_ID,	/* ID for dequeuing frame is done */
+	IPI_IMGSYS_DEINIT_ID,	/* ID for deinitializing the image system */
+	IPI_MAX_ID,	/* Maximum ID value*/
+};
+
+/**
+ * imgsys_scp_alloc_reserve_mem - allocate reserved memory for use by the
+ * kernel and the SCP (System Control Processor)
+ *
+ * @imgsys_dev:	Pointer to the imgsys platform device structure
+ *
+ **/
+int imgsys_scp_alloc_reserve_mem(struct mtk_imgsys_dev *imgsys_dev);
+
+/**
+ * imgsys_scp_free_reserve_mem - free reserved memory for use by the kernel and
+ * SCP
+ *
+ * @imgsys_dev:	Pointer to the imgsys platform device structure
+ *
+ **/
+int imgsys_scp_free_reserve_mem(struct mtk_imgsys_dev *imgsys_dev);
+
+/**
+ * imgsys_scp_get_reserve_mem_info - get the information about reserved memory
+ *
+ * @info: A pointer to an already allocated structure of type img_init_info,
+ * where this function will populate the reserved memory details.
+ *
+ **/
+int imgsys_scp_get_reserve_mem_info(struct img_init_info *info);
+
+/**
+ * imgsys_scp_get_reserve_mem_virt - get the virtual address of reserved memory
+ * by a particular memory ID
+ *
+ * @id:	The identifier of the reserved memory block
+ *
+ **/
+void *imgsys_scp_get_reserve_mem_virt(enum img_mem_id id);
+
+/**
+ * imgsys_scp_get_reserve_mem_size - get the size of reserved memory by a
+ * particular memory ID
+ *
+ * @id:	The identifier of the reserved memory block
+ *
+ **/
+unsigned int imgsys_scp_get_reserve_mem_size(enum img_mem_id id);
+
+/**
+ * imgsys_scp_init - start the SCP
+ *
+ * @imgsys_dev:	Pointer to the imgsys platform device structure
+ * @imgsys_scp_handler: Handler for SCP IPI
+ **/
+int imgsys_scp_init(struct mtk_imgsys_dev *imgsys_dev,
+		    scp_ipi_handler_t imgsys_scp_handler);
+
+/**
+ * imgsys_scp_deinit - stop the SCP
+ *
+ * @imgsys_dev:	Pointer to the imgsys platform device structure
+ *
+ **/
+void imgsys_scp_deinit(struct mtk_imgsys_dev *imgsys_dev);
+
+/**
+ * imgsys_scp_send - send data from AP to SCP
+ *
+ * @imgsys_dev:	Pointer to the imgsys platform device structure
+ * @id:	IPI ID
+ * @buf:the data buffer
+ * @len: the data buffer length
+ * @req_fd: the file descriptor of media request
+ * @wait: wait until ipi done or not
+ *
+ * This function is thread-safe. When this function returns,
+ * SCP has received the data and starts the processing.
+ * When the processing completes, IPI handler registered
+ * by scp_ipi_register will be called in interrupt context.
+ *
+ **/
+int imgsys_scp_send(struct mtk_imgsys_dev *imgsys_dev,
+		    enum imgsys_ipi_id id,
+		    void *buf,
+		    unsigned int len,
+		    int req_fd,
+		    unsigned int wait);
+
+#endif /* MTK_IMGSYS_SCP_H */
+
-- 
2.45.2


