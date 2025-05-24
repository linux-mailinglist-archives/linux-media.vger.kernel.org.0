Return-Path: <linux-media+bounces-33316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62EAAC2F92
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B221A207F1
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592631E990B;
	Sat, 24 May 2025 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G6AD9AU/"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504E11E3761;
	Sat, 24 May 2025 11:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087529; cv=none; b=VQHDjNYDbxgDu3YR9KSreP1c91KTX2+RAboDR/Zyu6GB085tg2KZ6iQckbIeyddOoSo2qtCt+xLaP0BKZEBecntnNSaBksUpo25ATi+A8D4jwNyzblhZFV1GgqcPLXcgjtIMI7GlgRefIurT1BorGgjfAgZJFBTexoVLA/9mObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087529; c=relaxed/simple;
	bh=1cVrAohHGTODOEsG+lFJbdBYHDSOcyg0TaEEVjqywik=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PLAA7Ty2Hl2HgSSPaSJ6eKS/VsRw6vzxDt1nT2ZBWTicrRBQ/eL+xGJqh0ezlUSMVneaC4sB6CgcuwWn1EtFi8FHyHmQFkFzGoLatXuj0HX02NoNXLmjWnFLTbraLIhjIpNQuJU/iQrr/JpqIZX9Pacp7CFQVu95jiEB50Ckmyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=G6AD9AU/; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7a8dac40389511f0813e4fe1310efc19-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8T7k3loXw2kUYsQr6rWUMCabl4A10FGQeJtjVO+YG0k=;
	b=G6AD9AU/djo4tWfrRmmvis1a40Iq9XznCdtmCYOPc0L1YPRJv0jCoWsKeJWibmLbWLu4VOYdYuKC5efa5XSZNpkjpTn/0Mv0B2oWxnRti+xaEmKo/QSYJx7+aEY/07tvYx0dyqTJY6UJPMNuuWGOxdEkip74aHOIaiapauzVhcE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7bfb6523-6b3b-48cd-8079-6ccbd0d58dfe,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:648ded57-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7a8dac40389511f0813e4fe1310efc19-20250524
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 169165166; Sat, 24 May 2025 19:51:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
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
Subject: [PATCH v1 03/10] uapi: linux: Add MediaTek Imgsys user API
Date: Sat, 24 May 2025 19:49:55 +0800
Message-ID: <20250524115144.3832748-4-olivia.wen@mediatek.com>
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

Add controls and formats for MediaTek Imgsys processing

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 include/uapi/linux/mtkisp_imgsys.h | 215 +++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)
 create mode 100644 include/uapi/linux/mtkisp_imgsys.h

diff --git a/include/uapi/linux/mtkisp_imgsys.h b/include/uapi/linux/mtkisp_imgsys.h
new file mode 100644
index 000000000000..c7528c8bf4a2
--- /dev/null
+++ b/include/uapi/linux/mtkisp_imgsys.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * MediaTek ISP imgsys User space API
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#ifndef _MTKISP_IMGSYS_USER_H
+#define _MTKISP_IMGSYS_USER_H
+
+#include <linux/v4l2-controls.h>
+
+/******************************************************/
+/*            MediaTek ISP imgsys controls            */
+/******************************************************/
+
+/* The base for the MediaTek imgsys driver controls */
+/* We reserve 48 controls for this driver. */
+#define V4L2_CID_USER_MTK_IMG_BASE		(V4L2_CID_USER_BASE + 0x1100)
+
+/**
+ * Define a control identifier, V4L2_CID_MTK_IMG_RESIZE_RATIO, for setting the
+ * image processing resize ratio for MediaTek chip. This identifier allows
+ * adjustment of the image resize ratio to accommodate various display or
+ * processing needs. ImgSys hardware supports multiple resizers, including
+ * any ratio, downscaling by factors of 2, 4, and 42, with NULL indicating
+ * the end of menu options.
+ */
+#define V4L2_CID_MTK_IMG_RESIZE_RATIO	(V4L2_CID_USER_MTK_IMG_BASE + 34)
+
+/******************************************************/
+/*       Vendor specific - MediaTek ISP formats       */
+/******************************************************/
+
+/* MediaTek warp map 32-bit, 2 plane */
+#define V4L2_PIX_FMT_WARP2P      v4l2_fourcc('M', 'W', '2', 'P')
+/* YUV-10bit packed 4:2:0 2plane, (Y)(UV)  */
+#define V4L2_PIX_FMT_YUV_2P010P    v4l2_fourcc('U', '0', '2', 'A')
+/* YUV-12bit packed 4:2:0 2plane, (Y)(UV)  */
+#define V4L2_PIX_FMT_YUV_2P012P    v4l2_fourcc('U', '0', '2', 'C')
+/* Y-32bit */
+#define V4L2_PIX_FMT_MTISP_Y32   v4l2_fourcc('M', 'T', '3', '2')
+/* Y-16bit */
+#define V4L2_PIX_FMT_MTISP_Y16   v4l2_fourcc('M', 'T', '1', '6')
+/* Y-8bit */
+#define V4L2_PIX_FMT_MTISP_Y8   v4l2_fourcc('M', 'T', '0', '8')
+
+/**
+ * Describes the MediaTek APLY8(V4L2_PIX_FMT_MTISP_APLY8) format, which includes
+ * Y-8bit image data and appends APL(Average Pixel Level) data utilized by the
+ * ME(motion estimation) hardware to the end of the image.
+ *
+ * The hardware ME generates motion vectors by processing two consecutive frames,
+ * referred to as the previous and current frames, to enhance graphic processing.
+ * The diagram is shown below.
+ *
+ *                                     +------------------+
+ *  the thumbnail of previous frame -> |                  |
+ *  (include the L0 frame and L1 frame)|                  |
+ *                                     |        ME        | -> motion vectors
+ *  the thumbnail of current frame  -> |                  |
+ *  (include the L0 frame and L1 frame)|                  |
+ *                                     +------------------+
+ *
+ * To accelerate computation, the two images will be resized into two different
+ * smaller images, referred to as L0 frame, L1 frame and APL data.
+ * The L1 frame is a scaled-down version of the L0 frame, reduced to one-fourth
+ * of its original size containing APL data.
+ *
+ *                                     +------------------+
+ *                previous L0 frame -> |                  |
+ *                previous L1 frame -> |                  |
+ *                (include APL data)   |                  |
+ *                                     |        ME        | -> motion vectors
+ *                current L0 frame  -> |                  |
+ *                current L1 frame  -> |                  |
+ *                (include APL data)   |                  |
+ *                                     +------------------+
+ *
+ * Each frame size:
+ *    the width of L0 frame (L0_wd) = 576 (fixed value)
+ *    the height of L0 frame (L0_ht) =
+ *    16 pixels align((the width of original image * L0_wd) / the height of original image)
+ *    the width of L1 frame (L1_wd) = L0_wd / 4
+ *    the height of L1 frame (L1_ht) = L0_ht / 4
+ *
+ * Buffer size:
+ *    line_size = width * bytes_per_pixel(1)
+ *    stride with 16 bytes alignment = ((line_size + 15) / 16) * 16
+ *    buffer_size = stride with 16 bytes alignment * height + APL data(16 bytes)
+ *
+ * And the memory layout should be followed as
+ *
+ *  @code
+ *           APLY8
+ *    +------------------+
+ *    |     Y Plane      |
+ *    |    Bit Stream    |
+ *    +------------------+
+ *    |      APL data    |
+ *    +------------------+
+ *  @endcode
+ *
+ *  @note The APL data size is 16 bytes.The caller SHOULD NOT modify it.
+ */
+/* Y-8bit image data and append the APL data */
+#define V4L2_PIX_FMT_MTISP_APLY8   v4l2_fourcc('M', 'T', 'A', '8')
+
+/*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR10  v4l2_fourcc('M', 'B', 'B', 'A')
+#define V4L2_PIX_FMT_MTISP_SGBRG10  v4l2_fourcc('M', 'B', 'G', 'A')
+#define V4L2_PIX_FMT_MTISP_SGRBG10  v4l2_fourcc('M', 'B', 'g', 'A')
+#define V4L2_PIX_FMT_MTISP_SRGGB10  v4l2_fourcc('M', 'B', 'R', 'A')
+
+/* Vendor specific - MediaTek ISP parameters for firmware */
+/* ISP tuning parameters */
+#define V4L2_META_FMT_MTISP_TUN_PARAMS  v4l2_fourcc('M', 'T', 'f', 't')
+/* ISP statistics parameters */
+#define V4L2_META_FMT_MTISP_STAT_PARAMS v4l2_fourcc('M', 'T', 'f', 's')
+/* ISP controlling parameters */
+#define V4L2_META_FMT_MTISP_CTL_PARAMS  v4l2_fourcc('M', 'T', 'f', 'c')
+
+/*****************************************************************************/
+/* Define sizes for various formats used in the MediaTek image system driver */
+/*****************************************************************************/
+/**
+ * SIZE_OF_APL_DATA - Size of the APL (Average Pixel Level) data
+ *
+ * This constant defines the size of the APL data, which is 16 bytes.
+ * The APL data is appended to the image format defined by
+ * V4L2_PIX_FMT_MTISP_APLY8. This format includes 8-bit Y image data
+ * followed by the APL data, which is utilized by the motion estimation
+ * hardware for enhanced processing. The APL data provides important
+ * information about the average pixel levels, which can be critical
+ * for various image processing tasks.
+ */
+#define SIZE_OF_APL_DATA 16 /* Size of APL data used by V4L2_PIX_FMT_MTISP_APLY8 */
+
+/**
+ * MediaTek Tuning Metadata Buffer for Image Processing Modules
+ *
+ * This definition is used for format V4L2_META_FMT_MTISP_TUN_PARAMS.
+ * This buffer contains essential tuning information for the MediaTek camera,
+ * including:
+ * - Sensor tuning settings
+ * - Digital gain for adjusting image brightness
+ * - White balance gain
+ *
+ * Note: The individual fields of the tuning metadata structure are not exposed
+ * to the kernel. The kernel only requires the size of the tuning metadata
+ * for memory allocation and management purposes. This encapsulation provides
+ * flexibility in implementing the tuning metadata without impacting the
+ * kernel's interface.
+ */
+ #define SIZE_OF_TUNING_META 219352
+
+/**
+ * MediaTek Control Metadata Buffer for Image Processing Modules
+ *
+ * This definition is used for format V4L2_META_FMT_MTISP_CTL_PARAMS.
+ * The control metadata buffer aggregates control information for multiple
+ * image processing modules, including TRAW, DIP, PQDIP, ME, WPE, and ADL.
+ * It facilitates the configuration and management of these modules by
+ * encapsulating relevant parameters and settings required for processing
+ * image data efficiently. This structure serves as a central point for
+ * coordinating the operation of different hardware components in the image
+ * processing pipeline.
+ *
+ * Note: The individual fields of the control metadata structure are not exposed
+ * to the kernel. The kernel only requires the size of the control metadata
+ * for memory allocation and management purposes. This encapsulation provides
+ * flexibility in implementing the control metadata without impacting the
+ * kernel's interface.
+ */
+#define SIZE_OF_COMMON_CTRL       688
+#define SIZE_OF_WPE_CTRL          240
+#define SIZE_OF_TRAW_CTRL         120
+#define SIZE_OF_DIP_CTRL          112
+#define SIZE_OF_PQDIP_CTRL        112
+#define SIZE_OF_ME_CTRL           8
+#define SIZE_OF_ADL_CTRL          64
+#define SIZE_OF_YUFO_META_INFO_WPE 4228
+#define SIZE_OF_YUFO_META_INFO_DIP 4228
+
+#define SIZE_OF_CTRL_META ( \
+	SIZE_OF_COMMON_CTRL + \
+	SIZE_OF_WPE_CTRL + \
+	SIZE_OF_TRAW_CTRL + \
+	SIZE_OF_DIP_CTRL + \
+	SIZE_OF_PQDIP_CTRL + \
+	SIZE_OF_ME_CTRL + \
+	SIZE_OF_ADL_CTRL + \
+	SIZE_OF_YUFO_META_INFO_WPE + \
+	SIZE_OF_YUFO_META_INFO_DIP \
+)
+
+/**
+ * MediaTek Statistics Metadata Buffer for Image Processing Modules
+ *
+ * This definition is used for format V4L2_META_FMT_MTISP_STAT_PARAMS.
+ * This buffer contains essential statistics information for the MediaTek camera,
+ * including:
+ * - Readiness and corresponding values for tone and contrast statistics
+ * - Motion estimation (ME) statistics
+ * - ME feature match blocks statistics
+ *
+ * Note: The individual fields of the statistics buffer structure are not exposed
+ * to the kernel. The kernel only requires the size of the statistics metadata
+ * for memory allocation and management purposes. This encapsulation provides
+ * flexibility in implementing the statistics metadata without impacting the
+ * kernel's interface.
+ */
+ #define SIZE_OF_STATISTICS_META 88
+
+#endif /* _MTKISP_IMGSYS_USER_H */
-- 
2.45.2


