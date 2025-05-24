Return-Path: <linux-media+bounces-33323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB4BAC2FA5
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7B1A21803
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811921F0E37;
	Sat, 24 May 2025 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tc62H3NB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365471E1DEC;
	Sat, 24 May 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087535; cv=none; b=nw4TL1OCzzimEIg/6TPGZPHHZRPiKGTYCG2OLYoCyrsIoeEo+Kb+9DKmq10uH+c2RdZsXoX1qDA0TG1/uY/R7BOmkgdOCMtTvY3nsUe9zwnpenhdUw6vlbvz1WL7C9xfnlTMjzdvpRYeWXll9ic/oBUFekhYc0HIWXh+9TyqV6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087535; c=relaxed/simple;
	bh=rT7+t36FaU43VaYYp1bRRg0M/8RgU1q0kiaV7Kg9TW4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T0Qt9zPPYPoN2cKdFxofigsOuFCQIorwYBiAXOqunldCp8GquXegP6Nt6fvCxYuecZOtiQda0ty2n4SVboy1a0xQDjTbpRUKHTwCZLoNnE97u5rFKv4o4lbVVvq+K5MQatycZuSjz+Jy7TuYZ2NAIv7nimW/myDa3lh6Xt+FU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tc62H3NB; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7afa9a08389511f0813e4fe1310efc19-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Fi3ah/DIL0rzNwXJvtJxpsHjd15GLkx21LToIH9QqfM=;
	b=tc62H3NBUsWxtWVSq2LJRJCnrJO5rKEPhAdGERHGKmg5kqkSdoXDwygd3vs+LH8kmQaZJ0P011qhMV+S6tZB3jCG8We9IxSGU3aC3Vsg9ejDGgfgOH2ph3Em3M5k+N1j0b1nKRzR8aypcZb7fwi7rw0eRZqMIVIS4GoksI5wjqA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3b67a9ac-42a1-4352-ad71-e29c7557bbbc,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:52bb3bf1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH
X-CID-BAS: 2,OSH,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7afa9a08389511f0813e4fe1310efc19-20250524
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1959910938; Sat, 24 May 2025 19:51:51 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH v1 04/10] media: mediatek: isp: Add V4L2 flow support for ImgSys driver
Date: Sat, 24 May 2025 19:49:56 +0800
Message-ID: <20250524115144.3832748-5-olivia.wen@mediatek.com>
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
focusing on the V4L2 flow. The MediaTek's Image System (ImgSys), also
known as ISP Pass2. ImgSys is a memory-to-memory hardware device
designed for advanced image processing tasks. It is composed of multiple
hardware components, including TRAW, DIP, PQDIP, ME, and WPE.

TRAW (Tile RAW):
- Provides multiple downscaled resizers to support multi-scale noise
  reduction.
- Supports RAW/RGB format conversion.

DIP (Digital Image Processing) and PQDIP (Picture Quality DIP):
- Supports such as temporal and spatial noise reduction (TNR/SNR),
  edge enhancement (EE), and sharpness (SHP).
- PQDIP also supports image scaling and rotation.

ME (Motion Estimation):
- Supports motion estimation between two consecutive frames.

WPE (Warping Engine):
- Handles image warping and de-warping processes.

The ImgSys driver, primarily utilized for Google Chromebook products,
uses Multi-Frame Combined Noise Reduction technology to enhance image
quality.

Below is a simplified architecture of the ImgSys driver:
User -> V4L2 Framework -> ImgSys Driver
     -> SCP (It packages the hardware settings into commands)
     -> ImgSys Driver
     -> CMDQ (The packaged commands are sent to the hardware via GCE)
     -> Hardware

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/isp/Kconfig   |   23 +
 .../platform/mediatek/isp/isp_7x/Makefile     |    6 +
 .../mediatek/isp/isp_7x/imgsys/Makefile       |   11 +
 .../imgsys/modules/mtk_dip_v4l2_vnode.h       |  594 ++++++
 .../isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h |  386 ++++
 .../imgsys/modules/mtk_pqdip_v4l2_vnode.h     |  149 ++
 .../imgsys/modules/mtk_traw_v4l2_vnode.h      |  371 ++++
 .../imgsys/modules/mtk_wpe_v4l2_vnode.h       |  317 ++++
 .../isp/isp_7x/imgsys/mtk_header_desc.h       |   28 +
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.c        |  238 +++
 .../isp/isp_7x/imgsys/mtk_imgsys-dev.h        |  427 +++++
 .../isp/isp_7x/imgsys/mtk_imgsys-formats.c    |  139 ++
 .../isp/isp_7x/imgsys/mtk_imgsys-formats.h    |   72 +
 .../isp/isp_7x/imgsys/mtk_imgsys-module_ops.h |   27 +
 .../isp/isp_7x/imgsys/mtk_imgsys-of.c         |   39 +
 .../isp/isp_7x/imgsys/mtk_imgsys-of.h         |   55 +
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.c        |   27 +
 .../isp/isp_7x/imgsys/mtk_imgsys-sys.h        |   50 +
 .../isp/isp_7x/imgsys/mtk_imgsys-v4l2.c       | 1684 +++++++++++++++++
 .../isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h   |  100 +
 .../isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h |  135 ++
 23 files changed, 4880 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_dip_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_pqdip_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_traw_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_wpe_v4l2_vnode.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h

diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
index 84104e2cd024..4e0a5a43f35e 100644
--- a/drivers/media/platform/mediatek/Kconfig
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -7,3 +7,4 @@ source "drivers/media/platform/mediatek/mdp/Kconfig"
 source "drivers/media/platform/mediatek/vcodec/Kconfig"
 source "drivers/media/platform/mediatek/vpu/Kconfig"
 source "drivers/media/platform/mediatek/mdp3/Kconfig"
+source "drivers/media/platform/mediatek/isp/Kconfig"
diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
index 38e6ba917fe5..611fa95416bc 100644
--- a/drivers/media/platform/mediatek/Makefile
+++ b/drivers/media/platform/mediatek/Makefile
@@ -4,3 +4,4 @@ obj-y += mdp/
 obj-y += vcodec/
 obj-y += vpu/
 obj-y += mdp3/
+obj-y += isp/isp_7x/
diff --git a/drivers/media/platform/mediatek/isp/Kconfig b/drivers/media/platform/mediatek/isp/Kconfig
new file mode 100644
index 000000000000..df92ac67574d
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_MTK_ISP_71_IMGSYS
+	tristate "MediaTek ISP71 image processing system function"
+	depends on MTK_CMDQ
+	depends on REMOTEPROC
+	depends on MTK_SCP
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_V4L2
+	select VIDEOBUF2_MEMOPS
+	select MEDIA_CONTROLLER
+
+	default n
+	help
+	    Support the basic Image processing system driver.
+
+	    IMGSYS driver provides image format conversion, resizing,
+	    and rotation function through the low power hardware.
+	    IMGSYS also supports multiple output feature. It can
+	    generate two or more output image with different effect
+	    based on a single input image at the same time.
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/Makefile
new file mode 100644
index 000000000000..11d2aee9a3dc
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -Werror
+
+obj-$(CONFIG_VIDEO_MTK_ISP_71_IMGSYS) += imgsys/
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
new file mode 100644
index 000000000000..571d0ae000eb
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+
+mtk_imgsys_util-objs := \
+mtk_imgsys-of.o \
+mtk_imgsys-formats.o \
+mtk_imgsys-dev.o \
+mtk_imgsys-sys.o \
+mtk_imgsys-v4l2.o
+
+obj-$(CONFIG_VIDEO_MTK_ISP_71_IMGSYS) += mtk_imgsys_util.o
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_dip_v4l2_vnode.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_dip_v4l2_vnode.h
new file mode 100644
index 000000000000..1b5c8b738a54
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_dip_v4l2_vnode.h
@@ -0,0 +1,594 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_DIP_V4L2_VNODE_H_
+#define _MTK_DIP_V4L2_VNODE_H_
+
+#include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-formats.h"
+#include "../mtk_imgsys-vnode_id.h"
+
+static const struct mtk_imgsys_dev_format dip_imgi_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y8,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_vipi_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_rec_dsi_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_rec_dpi_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y32,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_meta_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_y32,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y8,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_tnrw_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 192,
+		.scan_align = 192,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y8,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_tnrci_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 144,
+		.scan_align = 108,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y8,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_tnrli_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_img2o_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y8,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_img3o_fmts[] = {
+	/* YUV422, 3 plane 8 bit */
+	/* YUV420, 2 plane 8 bit */
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	/* Y8 bit */
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format dip_img4o_fmts[] = {
+	/* YUV420, 2 plane 8 bit */
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	/* Y8 bit */
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct v4l2_frmsizeenum dip_in_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+	.stepwise.min_width = MTK_IMGSYS_CAPTURE_MIN_WIDTH,
+	.stepwise.max_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+	.stepwise.min_height = MTK_IMGSYS_CAPTURE_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct v4l2_frmsizeenum dip_out_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+	.stepwise.min_width = MTK_IMGSYS_OUTPUT_MIN_WIDTH,
+	.stepwise.max_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+	.stepwise.min_height = MTK_IMGSYS_OUTPUT_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct mtk_imgsys_video_device_desc dip_setting[] = {
+	/* Input Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_IMGI_OUT,
+		.name = "Imgi Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_imgi_fmts,
+		.num_fmts = ARRAY_SIZE(dip_imgi_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Main image source",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_VIPI_OUT,
+		.name = "Vipi Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_vipi_fmts,
+		.num_fmts = ARRAY_SIZE(dip_vipi_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Vipi image source",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_REC_DSI_OUT,
+		.name = "Rec_Dsi Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_rec_dsi_fmts,
+		.num_fmts = ARRAY_SIZE(dip_rec_dsi_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Down Source Image",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_REC_DPI_OUT,
+		.name = "Rec_Dpi Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_rec_dpi_fmts,
+		.num_fmts = ARRAY_SIZE(dip_rec_dpi_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Down Processed Image",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_CNR_BLURMAPI_OUT,
+		.name = "Bokeh Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Bokehi data",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_LFEI_OUT,
+		.name = "Dmgi_FM Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Dmgi_FM data",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_RFEI_OUT,
+		.name = "Depi_FM Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Depi_FM data",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRSI_OUT,
+		.name = "Tnrsi Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Statistics input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRWI_OUT,
+		.name = "Tnrwi Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_tnrw_fmts,
+		.num_fmts = ARRAY_SIZE(dip_tnrw_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Weighting input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRMI_OUT,
+		.name = "Tnrmi Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Motion Map input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRCI_OUT,
+		.name = "Tnrci Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_tnrci_fmts,
+		.num_fmts = ARRAY_SIZE(dip_tnrci_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Confidence Map input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRLI_OUT,
+		.name = "Tnrli Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_tnrli_fmts,
+		.num_fmts = ARRAY_SIZE(dip_tnrli_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Low Frequency Diff input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRVBI_OUT,
+		.name = "Tnrvbi Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Valid Bit Map input",
+	},
+	/* Output Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_IMG2O_CAPTURE,
+		.name = "Img2o Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_img2o_fmts,
+		.num_fmts = ARRAY_SIZE(dip_img2o_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_out_frmsizeenum,
+		.description = "Resized output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_IMG3O_CAPTURE,
+		.name = "Img3o Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_img3o_fmts,
+		.num_fmts = ARRAY_SIZE(dip_img3o_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_out_frmsizeenum,
+		.description = "Dip output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_IMG4O_CAPTURE,
+		.name = "Img4o Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_img4o_fmts,
+		.num_fmts = ARRAY_SIZE(dip_img4o_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_out_frmsizeenum,
+		.description = "Nr3d output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_FMO_CAPTURE,
+		.name = "FM Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_out_frmsizeenum,
+		.description = "FM output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRSO_CAPTURE,
+		.name = "Tnrso Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_out_frmsizeenum,
+		.description = "statistics output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRWO_CAPTURE,
+		.name = "Tnrwo Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_tnrw_fmts,
+		.num_fmts = ARRAY_SIZE(dip_tnrw_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_out_frmsizeenum,
+		.description = "Weighting output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TNRMO_CAPTURE,
+		.name = "Tnrmo Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = dip_meta_fmts,
+		.num_fmts = ARRAY_SIZE(dip_meta_fmts),
+		.default_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &dip_out_frmsizeenum,
+		.description = "Motion Map output",
+	},
+};
+
+#endif // _MTK_IMGSYS_V4L2_VNODE_H_
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h
new file mode 100644
index 000000000000..d33f8847731f
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_me_v4l2_vnode.h
@@ -0,0 +1,386 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_ME_V4L2_VNODE_H_
+#define _MTK_ME_V4L2_VNODE_H_
+
+#include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-formats.h"
+#include "../mtk_imgsys-vnode_id.h"
+
+static const struct mtk_imgsys_dev_format me_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_y32,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y16,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y8,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format mewmap_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_warp2p,
+		.align = 8,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format melmi_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_y16,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format mel1i_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_aply8,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct v4l2_frmsizeenum in_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_IMGSYS_CAPTURE_MAX_WIDTH,
+	.stepwise.min_width = MTK_IMGSYS_CAPTURE_MIN_WIDTH,
+	.stepwise.max_height = MTK_IMGSYS_CAPTURE_MAX_HEIGHT,
+	.stepwise.min_height = MTK_IMGSYS_CAPTURE_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct v4l2_frmsizeenum out_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+	.stepwise.min_width = MTK_IMGSYS_OUTPUT_MIN_WIDTH,
+	.stepwise.max_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+	.stepwise.min_height = MTK_IMGSYS_OUTPUT_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct mtk_imgsys_video_device_desc me_setting[] = {
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL0IMG0_OUT,
+		.name = "L0I0I Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME Input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL0IMG1_OUT,
+		.name = "L0I1I Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME Input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL1IMG0_OUT,
+		.name = "L1I0I Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = mel1i_fmts,
+		.num_fmts = ARRAY_SIZE(mel1i_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME L1 Input ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL1IMG1_OUT,
+		.name = "L1I1I Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = mel1i_fmts,
+		.num_fmts = ARRAY_SIZE(mel1i_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME L1 Input ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEIMGSTATS_OUT,
+		.name = "STATI Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME IMGSTATS Input ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL0RMV_OUT,
+		.name = "L0RMVI Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME L0RMV Input ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL1RMV_OUT,
+		.name = "L1RMVI Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME L1RMV Input ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL0FMB_OUT,
+		.name = "L0FMBI Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME L0FMB Input ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL1FMB_OUT,
+		.name = "L1FMBI Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME L1FMB Input ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEMIL_OUT,
+		.name = "MEMILI Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &in_frmsizeenum,
+		.description = "ME MIL Input ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEMMGMIL_CAPTURE,
+		.name = "MILO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME MMGMIL Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL0WMV_CAPTURE,
+		.name = "L0WMVO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME L0WMV Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL1WMV_CAPTURE,
+		.name = "L1WMVO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME L1WMV Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MECONF_CAPTURE,
+		.name = "CONFO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME CONF Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEWMAP_CAPTURE,
+		.name = "WMAPO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = mewmap_fmts,
+		.num_fmts = ARRAY_SIZE(mewmap_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME WMAP Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEFMV_CAPTURE,
+		.name = "FMVO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME OTHERS Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEFST_CAPTURE,
+		.name = "FSTO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME FST Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MELMI_CAPTURE,
+		.name = "LMIO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = melmi_fmts,
+		.num_fmts = ARRAY_SIZE(melmi_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME LMI Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL0WFMB_CAPTURE,
+		.name = "L0FMBO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME L0FMB Output ",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_MEL1WFMB_CAPTURE,
+		.name = "L1FMBO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = me_fmts,
+		.num_fmts = ARRAY_SIZE(me_fmts),
+		.default_width = MTK_IMGSYS_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_IMGSYS_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &out_frmsizeenum,
+		.description = "ME L1FMB Output ",
+	},
+};
+
+#endif /* _MTK_ME_V4L2_VNODE_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_pqdip_v4l2_vnode.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_pqdip_v4l2_vnode.h
new file mode 100644
index 000000000000..23c8db3b30f3
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_pqdip_v4l2_vnode.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Daniel Huang <daniel.huang@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_PQDIP_V4L2_VNODE_H_
+#define _MTK_PQDIP_V4L2_VNODE_H_
+
+#include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-formats.h"
+#include "../mtk_imgsys-vnode_id.h"
+
+#define MTK_PQDIP_OUTPUT_MIN_WIDTH		2U
+#define MTK_PQDIP_OUTPUT_MIN_HEIGHT		2U
+#define MTK_PQDIP_OUTPUT_MAX_WIDTH		5376U
+#define MTK_PQDIP_OUTPUT_MAX_HEIGHT		4032U
+#define MTK_PQDIP_CAPTURE_MIN_WIDTH		2U
+#define MTK_PQDIP_CAPTURE_MIN_HEIGHT		2U
+#define MTK_PQDIP_CAPTURE_MAX_WIDTH		5376U
+#define MTK_PQDIP_CAPTURE_MAX_HEIGHT		4032U
+
+static const struct mtk_imgsys_dev_format pqdip_pimgi_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format pqdip_wroto_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format pqdip_tccso_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+};
+
+static const struct v4l2_frmsizeenum pqdip_in_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+	.stepwise.min_width = MTK_PQDIP_CAPTURE_MIN_WIDTH,
+	.stepwise.max_height = MTK_PQDIP_CAPTURE_MAX_HEIGHT,
+	.stepwise.min_height = MTK_PQDIP_CAPTURE_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct v4l2_frmsizeenum pqdip_out_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_PQDIP_OUTPUT_MAX_WIDTH,
+	.stepwise.min_width = MTK_PQDIP_OUTPUT_MIN_WIDTH,
+	.stepwise.max_height = MTK_PQDIP_OUTPUT_MAX_HEIGHT,
+	.stepwise.min_height = MTK_PQDIP_OUTPUT_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct mtk_imgsys_video_device_desc pqdip_setting[] = {
+	/* Input Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_PIMGI_OUT,
+		.name = "PIMGI Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = pqdip_pimgi_fmts,
+		.num_fmts = ARRAY_SIZE(pqdip_pimgi_fmts),
+		.default_width = MTK_PQDIP_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_PQDIP_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &pqdip_in_frmsizeenum,
+		.description = "Imgi image source",
+	},
+	/* Output Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WROT_A_CAPTURE,
+		.name = "WROTO A Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = pqdip_wroto_fmts,
+		.num_fmts = ARRAY_SIZE(pqdip_wroto_fmts),
+		.default_width = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &pqdip_out_frmsizeenum,
+		.description = "Output quality enhanced image",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WROT_B_CAPTURE,
+		.name = "WROTO B Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = pqdip_wroto_fmts,
+		.num_fmts = ARRAY_SIZE(pqdip_wroto_fmts),
+		.default_width = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &pqdip_out_frmsizeenum,
+		.description = "Output quality enhanced image",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TCCSO_A_CAPTURE,
+		.name = "TCCSO A Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = pqdip_tccso_fmts,
+		.num_fmts = ARRAY_SIZE(pqdip_tccso_fmts),
+		.default_width = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &pqdip_out_frmsizeenum,
+		.description = "Output tone curve statistics",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TCCSO_B_CAPTURE,
+		.name = "TCCSO B Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = pqdip_tccso_fmts,
+		.num_fmts = ARRAY_SIZE(pqdip_tccso_fmts),
+		.default_width = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_PQDIP_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &pqdip_out_frmsizeenum,
+		.description = "Output tone curve statistics",
+	},
+};
+
+#endif /* _MTK_PQDIP_V4L2_VNODE_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_traw_v4l2_vnode.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_traw_v4l2_vnode.h
new file mode 100644
index 000000000000..ec03f7a59be8
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_traw_v4l2_vnode.h
@@ -0,0 +1,371 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Shih-Fang chuang <shih-fang.chuang@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_TRAW_V4L2_VNODE_H_
+#define _MTK_TRAW_V4L2_VNODE_H_
+
+#include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-formats.h"
+#include "../mtk_imgsys-vnode_id.h"
+
+#define MTK_TRAW_OUTPUT_MIN_WIDTH		2U
+#define MTK_TRAW_OUTPUT_MIN_HEIGHT		2U
+#define MTK_TRAW_OUTPUT_MAX_WIDTH		5376U
+#define MTK_TRAW_OUTPUT_MAX_HEIGHT		4032U
+#define MTK_TRAW_CAPTURE_MIN_WIDTH		2U
+#define MTK_TRAW_CAPTURE_MIN_HEIGHT		2U
+#define MTK_TRAW_CAPTURE_MAX_WIDTH		5376U
+#define MTK_TRAW_CAPTURE_MAX_HEIGHT		4032U
+
+static const struct mtk_imgsys_dev_format traw_imgi_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_sgbrg10,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_warp2p,
+		.align = 8,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y8,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_srggb10,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_sgrbg10,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format traw_metai_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_metai,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format traw_stato_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_stt,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format traw_yuvo_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_warp2p,
+		.align = 8,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y8,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_aply8,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format traw_pdc_fmts[] = {
+	/* Y8 bit */
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+};
+
+static const struct v4l2_frmsizeenum traw_in_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+	.stepwise.min_width = MTK_TRAW_CAPTURE_MIN_WIDTH,
+	.stepwise.max_height = MTK_TRAW_CAPTURE_MAX_HEIGHT,
+	.stepwise.min_height = MTK_TRAW_CAPTURE_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct v4l2_frmsizeenum traw_out_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_TRAW_OUTPUT_MAX_WIDTH,
+	.stepwise.min_width = MTK_TRAW_OUTPUT_MIN_WIDTH,
+	.stepwise.max_height = MTK_TRAW_OUTPUT_MAX_HEIGHT,
+	.stepwise.min_height = MTK_TRAW_OUTPUT_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct mtk_imgsys_video_device_desc traw_setting[] = {
+	/* Input Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TIMGI_OUT,
+		.name = "TIMGI Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_imgi_fmts,
+		.num_fmts = ARRAY_SIZE(traw_imgi_fmts),
+		.default_width = MTK_TRAW_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_TRAW_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &traw_in_frmsizeenum,
+		.description = "Imgi image source",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_METAI_OUT,
+		.name = "METAI Input",
+		.cap = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.smem_alloc = 1,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_metai_fmts,
+		.num_fmts = ARRAY_SIZE(traw_metai_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &traw_in_frmsizeenum,
+		.description = "METAI image source",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_PDC_OUT,
+		.name = "PDC Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_pdc_fmts,
+		.num_fmts = ARRAY_SIZE(traw_pdc_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &traw_in_frmsizeenum,
+		.description = "PDC image source",
+	},
+	/* Output Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TYUVO_CAPTURE,
+		.name = "TYUVO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_yuvo_fmts,
+		.num_fmts = ARRAY_SIZE(traw_yuvo_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "YUVO output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TYUV2O_CAPTURE,
+		.name = "TYUV2O Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_yuvo_fmts,
+		.num_fmts = ARRAY_SIZE(traw_yuvo_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "YUV2O output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TYUV3O_CAPTURE,
+		.name = "TYUV3O Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_yuvo_fmts,
+		.num_fmts = ARRAY_SIZE(traw_yuvo_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "YUV3O output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TYUV4O_CAPTURE,
+		.name = "TYUV4O Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_yuvo_fmts,
+		.num_fmts = ARRAY_SIZE(traw_yuvo_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "YUV4O output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TYUV5O_CAPTURE,
+		.name = "TYUV5O Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_yuvo_fmts,
+		.num_fmts = ARRAY_SIZE(traw_yuvo_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "YUV5O output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_FEO_CAPTURE,
+		.name = "FEO Output",
+		.cap = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.smem_alloc = 1,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_metai_fmts,
+		.num_fmts = ARRAY_SIZE(traw_metai_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "FEO output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TIMGO_CAPTURE,
+		.name = "TIMGO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_imgi_fmts,
+		.num_fmts = ARRAY_SIZE(traw_imgi_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "TIMGO output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_IMGSTATO_CAPTURE,
+		.name = "IMGSTATO Output",
+		.cap = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_META_CAPTURE,
+		.smem_alloc = 1,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_stato_fmts,
+		.num_fmts = ARRAY_SIZE(traw_stato_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "IMGSTATO output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_XTMEO_CAPTURE,
+		.name = "XTMEO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_pdc_fmts,
+		.num_fmts = ARRAY_SIZE(traw_pdc_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "XTMEO output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_XTFDO_CAPTURE,
+		.name = "XTFDO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_yuvo_fmts,
+		.num_fmts = ARRAY_SIZE(traw_yuvo_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "XTFDO output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_XTADLDBGO_CAPTURE,
+		.name = "XTDBGO Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = traw_imgi_fmts,
+		.num_fmts = ARRAY_SIZE(traw_imgi_fmts),
+		.default_width = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_TRAW_CAPTURE_MAX_WIDTH,
+		.frmsizeenum = &traw_out_frmsizeenum,
+		.description = "XTDBGO output",
+	},
+};
+
+#endif /* _MTK_TRAW_V4L2_VNODE_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_wpe_v4l2_vnode.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_wpe_v4l2_vnode.h
new file mode 100644
index 000000000000..3e378d54b900
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/modules/mtk_wpe_v4l2_vnode.h
@@ -0,0 +1,317 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ *
+ * Author: Floria Huang <floria.huang@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_WPE_V4L2_VNODE_H_
+#define _MTK_WPE_V4L2_VNODE_H_
+
+#include "../mtk_imgsys-dev.h"
+#include "../mtk_imgsys-formats.h"
+#include "../mtk_imgsys-vnode_id.h"
+
+#define MTK_WPE_OUTPUT_MIN_WIDTH	2U
+#define MTK_WPE_OUTPUT_MIN_HEIGHT	2U
+#define MTK_WPE_OUTPUT_MAX_WIDTH	18472U
+#define MTK_WPE_OUTPUT_MAX_HEIGHT	13856U
+
+#define MTK_WPE_MAP_OUTPUT_MIN_WIDTH	2U
+#define MTK_WPE_MAP_OUTPUT_MIN_HEIGHT	2U
+#define MTK_WPE_MAP_OUTPUT_MAX_WIDTH	640U
+#define MTK_WPE_MAP_OUTPUT_MAX_HEIGHT	480U
+
+#define MTK_WPE_PSP_OUTPUT_WIDTH	8U
+#define MTK_WPE_PSP_OUTPUT_HEIGHT	33U
+
+#define MTK_WPE_CAPTURE_MIN_WIDTH	2U
+#define MTK_WPE_CAPTURE_MIN_HEIGHT	2U
+#define MTK_WPE_CAPTURE_MAX_WIDTH	18472U
+#define MTK_WPE_CAPTURE_MAX_HEIGHT	13856U
+
+static const struct mtk_imgsys_dev_format wpe_wpei_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	/* Y8 bit */
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 192,
+		.scan_align = 192,
+	},
+	/* Bayer 10 bit */
+	{
+		.fmt = &mtk_imgsys_format_sgbrg10,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format wpe_veci_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_warp2p,
+		.align = 8,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format wpe_pspi_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_y32,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format wpe_wpeo_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_nv12,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_nv21,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 192,
+		.scan_align = 192,
+	},
+	{
+		.fmt = &mtk_imgsys_format_sgbrg10,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p010p,
+		.align = 1,
+		.scan_align = 1,
+	},
+	{
+		.fmt = &mtk_imgsys_format_2p012p,
+		.align = 1,
+		.scan_align = 1,
+	},
+};
+
+static const struct mtk_imgsys_dev_format wpe_msko_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_grey,
+		.align = 16,
+		.scan_align = 1,
+	},
+};
+
+static const struct v4l2_frmsizeenum wpe_in_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+	.stepwise.min_width = MTK_WPE_CAPTURE_MIN_WIDTH,
+	.stepwise.max_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+	.stepwise.min_height = MTK_WPE_CAPTURE_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct v4l2_frmsizeenum wpe_in_map_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_WPE_MAP_OUTPUT_MAX_WIDTH,
+	.stepwise.min_width = MTK_WPE_MAP_OUTPUT_MIN_WIDTH,
+	.stepwise.max_height = MTK_WPE_MAP_OUTPUT_MAX_HEIGHT,
+	.stepwise.min_height = MTK_WPE_MAP_OUTPUT_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct v4l2_frmsizeenum wpe_out_frmsizeenum = {
+	.type = V4L2_FRMSIZE_TYPE_CONTINUOUS,
+	.stepwise.max_width = MTK_WPE_OUTPUT_MAX_WIDTH,
+	.stepwise.min_width = MTK_WPE_OUTPUT_MIN_WIDTH,
+	.stepwise.max_height = MTK_WPE_OUTPUT_MAX_HEIGHT,
+	.stepwise.min_height = MTK_WPE_OUTPUT_MIN_HEIGHT,
+	.stepwise.step_height = 1,
+	.stepwise.step_width = 1,
+};
+
+static const struct mtk_imgsys_video_device_desc wpe_setting[] = {
+	/* Input Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WWPEI_OUT,
+		.name = "WPEI_E Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_wpei_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_wpei_fmts),
+		.default_width = MTK_WPE_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_WPE_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &wpe_in_frmsizeenum,
+		.description = "WPE main image input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WVECI_OUT,
+		.name = "VECI_E Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_veci_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_veci_fmts),
+		.default_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &wpe_in_map_frmsizeenum,
+		.description = "WarpMap input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WPSP_COEFI_OUT,
+		.name = "PSPI_E Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_pspi_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_pspi_fmts),
+		.default_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &wpe_in_frmsizeenum,
+		.description = "PSP coef. table input",
+	},
+	/* WPE_EIS Output Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WWPEO_CAPTURE,
+		.name = "WPEO_E Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_wpeo_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_wpeo_fmts),
+		.default_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &wpe_out_frmsizeenum,
+		.description = "WPE image output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WMSKO_CAPTURE,
+		.name = "MSKO_E Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_msko_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_msko_fmts),
+		.default_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &wpe_out_frmsizeenum,
+		.description = "WPE valid map output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WTWPEI_OUT,
+		.name = "WPEI_T Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_wpei_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_wpei_fmts),
+		.default_width = MTK_WPE_OUTPUT_MAX_WIDTH,
+		.default_height = MTK_WPE_OUTPUT_MAX_HEIGHT,
+		.frmsizeenum = &wpe_in_frmsizeenum,
+		.description = "WPE main image input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WTVECI_OUT,
+		.name = "VECI_T Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_veci_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_veci_fmts),
+		.default_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &wpe_in_map_frmsizeenum,
+		.description = "WarpMap input",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WTPSP_COEFI_OUT,
+		.name = "PSPI_T Input",
+		.cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_pspi_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_pspi_fmts),
+		.default_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &wpe_in_frmsizeenum,
+		.description = "PSP coef. table input",
+	},
+	/* WPE_TNR Output Video Node */
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WTWPEO_CAPTURE,
+		.name = "WPEO_T Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_wpeo_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_wpeo_fmts),
+		.default_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &wpe_out_frmsizeenum,
+		.description = "WPE image output",
+	},
+	{
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_WTMSKO_CAPTURE,
+		.name = "MSKO_T Output",
+		.cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.smem_alloc = 0,
+		.supports_ctrls = true,
+		.flags = MEDIA_LNK_FL_DYNAMIC,
+		.fmts = wpe_msko_fmts,
+		.num_fmts = ARRAY_SIZE(wpe_msko_fmts),
+		.default_width = MTK_WPE_CAPTURE_MAX_WIDTH,
+		.default_height = MTK_WPE_CAPTURE_MAX_HEIGHT,
+		.frmsizeenum = &wpe_out_frmsizeenum,
+		.description = "WPE valid map output",
+	},
+};
+
+#endif /* _MTK_WPE_V4L2_VNODE_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h
new file mode 100644
index 000000000000..50c2e3c3395b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_header_desc.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ */
+
+#ifndef _HEADER_DESC_
+#define _HEADER_DESC_
+
+#include <linux/videodev2.h>
+
+/**
+ * struct mtk_imgsys_crop - Crop parameters for MediaTek Image System
+ * @c: Rectangle defining the crop area
+ * @left_subpix: Sub-pixel adjustment for the left edge
+ * @top_subpix: Sub-pixel adjustment for the top edge
+ * @width_subpix: Sub-pixel adjustment for the width
+ * @height_subpix: Sub-pixel adjustment for the height
+ */
+struct mtk_imgsys_crop {
+	struct v4l2_rect    c;             /* Rectangle defining the crop area */
+	struct v4l2_fract   left_subpix;   /* Sub-pixel adjustment for the left edge */
+	struct v4l2_fract   top_subpix;    /* Sub-pixel adjustment for the top edge */
+	struct v4l2_fract   width_subpix;  /* Sub-pixel adjustment for the width */
+	struct v4l2_fract   height_subpix; /* Sub-pixel adjustment for the height */
+};
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c
new file mode 100644
index 000000000000..28a35a3226a2
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.c
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#include "linux/list.h"
+#include <linux/dma-buf.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <linux/hashtable.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-event.h>
+#include "mtk_imgsys-formats.h"
+#include "mtk_imgsys-vnode_id.h"
+#include "mtk_imgsys-dev.h"
+#include "mtk_imgsys-sys.h"
+
+int mtk_imgsys_pipe_init(struct mtk_imgsys_dev *imgsys_dev,
+			 struct mtk_imgsys_pipe *pipe,
+			 const struct mtk_imgsys_pipe_desc *setting)
+{
+	u32 i, nodes_num;
+	size_t nodes_size;
+
+	pipe->imgsys_dev = imgsys_dev;
+	pipe->desc = setting;
+	pipe->nodes_enabled = 0ULL;
+	pipe->nodes_streaming = 0ULL;
+
+	atomic_set(&pipe->pipe_job_sequence, 0);
+	INIT_LIST_HEAD(&pipe->pipe_job_running_list);
+	INIT_LIST_HEAD(&pipe->pipe_job_pending_list);
+
+	spin_lock_init(&pipe->pending_job_lock);
+	spin_lock_init(&pipe->running_job_lock);
+	mutex_init(&pipe->lock);
+
+	nodes_num = pipe->desc->total_queues;
+	nodes_size = sizeof(*pipe->nodes) * nodes_num;
+	pipe->nodes = devm_kzalloc(imgsys_dev->dev, nodes_size, GFP_KERNEL);
+	if (!pipe->nodes)
+		return -ENOMEM;
+
+	for (i = 0; i < nodes_num; i++) {
+		pipe->nodes[i].desc = &pipe->desc->queue_descs[i];
+		pipe->nodes[i].flags = pipe->nodes[i].desc->flags;
+		spin_lock_init(&pipe->nodes[i].buf_list_lock);
+		INIT_LIST_HEAD(&pipe->nodes[i].buf_list);
+
+		pipe->nodes[i].crop.left = 0;
+		pipe->nodes[i].crop.top = 0;
+		pipe->nodes[i].crop.width =
+			pipe->nodes[i].desc->frmsizeenum->stepwise.max_width;
+		pipe->nodes[i].crop.height =
+			pipe->nodes[i].desc->frmsizeenum->stepwise.max_height;
+
+		pipe->nodes[i].compose.left = 0;
+		pipe->nodes[i].compose.top = 0;
+		pipe->nodes[i].compose.width =
+			pipe->nodes[i].desc->frmsizeenum->stepwise.max_width;
+		pipe->nodes[i].compose.height =
+			pipe->nodes[i].desc->frmsizeenum->stepwise.max_height;
+	}
+
+	return 0;
+}
+
+int mtk_imgsys_pipe_release(struct mtk_imgsys_pipe *pipe)
+{
+	mutex_destroy(&pipe->lock);
+
+	return 0;
+}
+
+int mtk_imgsys_pipe_next_job_id(struct mtk_imgsys_pipe *pipe)
+{
+	int global_job_id = atomic_inc_return(&pipe->pipe_job_sequence);
+
+	return (global_job_id & 0x0000FFFF) | (pipe->desc->id << 16);
+}
+
+void mtk_imgsys_pipe_debug_job(struct mtk_imgsys_pipe *pipe,
+			       struct mtk_imgsys_request *req)
+{
+	int i;
+
+	dev_dbg(pipe->imgsys_dev->dev, "%s:%s: pipe-job(%p),id(%d)\n",
+		__func__, pipe->desc->name, req, req->id);
+
+	for (i = 0; i < pipe->desc->total_queues ; i++) {
+		if (req->buf_map[i])
+			dev_dbg(pipe->imgsys_dev->dev, "%s:%s:buf(%p)\n",
+				pipe->desc->name, pipe->nodes[i].desc->name,
+				req->buf_map[i]);
+	}
+}
+
+static unsigned int mtk_imgsys_get_stride(unsigned int width,
+					  const struct mtk_imgsys_dev_format *dfmt,
+					  unsigned int plane)
+{
+	unsigned int stride =
+		(width + dfmt->fmt->pixels_per_group - 1) /
+		dfmt->fmt->pixels_per_group * dfmt->fmt->bytes_per_group[plane];
+
+	return (stride + dfmt->align - 1) / dfmt->align * dfmt->align;
+}
+
+static unsigned int mtk_imgsys_get_height(unsigned int height,
+					  const struct mtk_imgsys_dev_format *dfmt,
+					  unsigned int plane)
+{
+	unsigned int plane_height =
+		(height + dfmt->fmt->vertical_sub_sampling[plane] - 1) /
+		dfmt->fmt->vertical_sub_sampling[plane];
+
+	return (plane_height + dfmt->scan_align - 1) / dfmt->scan_align * dfmt->scan_align;
+}
+
+void mtk_imgsys_pipe_try_fmt(struct mtk_imgsys_video_device *node,
+			     struct v4l2_format *fmt,
+			     const struct v4l2_format *ufmt,
+			     const struct mtk_imgsys_dev_format *dfmt)
+{
+	unsigned int i;
+
+	if (!dfmt)
+		return;
+
+	fmt->type = ufmt->type;
+	fmt->fmt.pix_mp.width =
+		clamp_val(ufmt->fmt.pix_mp.width,
+			  node->desc->frmsizeenum->stepwise.min_width,
+			  node->desc->frmsizeenum->stepwise.max_width);
+	fmt->fmt.pix_mp.height =
+		clamp_val(ufmt->fmt.pix_mp.height,
+			  node->desc->frmsizeenum->stepwise.min_height,
+			  node->desc->frmsizeenum->stepwise.max_height);
+	fmt->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->fmt.pix_mp.colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->fmt.pix_mp.field = V4L2_FIELD_NONE;
+
+	fmt->fmt.pix_mp.pixelformat = dfmt->fmt->format;
+	fmt->fmt.pix_mp.num_planes = dfmt->fmt->num_planes;
+
+	for (i = 0; i < fmt->fmt.pix_mp.num_planes; ++i) {
+		struct v4l2_plane_pix_format *plane =
+			&fmt->fmt.pix_mp.plane_fmt[i];
+		const struct v4l2_plane_pix_format *uplane;
+
+		uplane = &ufmt->fmt.pix_mp.plane_fmt[i];
+		plane->bytesperline =
+			mtk_imgsys_get_stride(fmt->fmt.pix_mp.width, dfmt, i);
+		if (plane->bytesperline < uplane->bytesperline)
+			plane->bytesperline = uplane->bytesperline;
+
+		plane->sizeimage = plane->bytesperline *
+			mtk_imgsys_get_height(fmt->fmt.pix_mp.height, dfmt, i);
+
+		plane->sizeimage += dfmt->fmt->ext_data;
+	}
+}
+
+static void set_meta_fmt(struct mtk_imgsys_pipe *pipe,
+			 struct v4l2_meta_format *fmt,
+			 const struct mtk_imgsys_dev_format *dev_fmt)
+{
+	fmt->dataformat = dev_fmt->fmt->format;
+	fmt->buffersize = dev_fmt->fmt->buffer_size;
+}
+
+void mtk_imgsys_pipe_load_default_fmt(struct mtk_imgsys_pipe *pipe,
+				      struct mtk_imgsys_video_device *node,
+				      struct v4l2_format *fmt)
+{
+	fmt->type = node->desc->buf_type;
+	if (mtk_imgsys_buf_is_meta(node->desc->buf_type)) {
+		set_meta_fmt(pipe, &fmt->fmt.meta,
+			     &node->desc->fmts[0]);
+	} else {
+		fmt->fmt.pix_mp.width = node->desc->default_width;
+		fmt->fmt.pix_mp.height = node->desc->default_height;
+		mtk_imgsys_pipe_try_fmt(node, fmt, fmt,
+					&node->desc->fmts[0]);
+	}
+}
+
+const struct mtk_imgsys_dev_format*
+mtk_imgsys_pipe_find_fmt(struct mtk_imgsys_pipe *pipe,
+			 struct mtk_imgsys_video_device *node,
+			 u32 format)
+{
+	int i;
+
+	for (i = 0; i < node->desc->num_fmts; i++) {
+		if (node->desc->fmts[i].fmt->format == format)
+			return &node->desc->fmts[i];
+	}
+
+	return NULL;
+}
+
+void mtk_imgsys_pipe_try_enqueue(struct mtk_imgsys_pipe *pipe)
+{
+	struct mtk_imgsys_request *req = NULL;
+	unsigned long flag;
+
+	if (!pipe->streaming)
+		return;
+
+	spin_lock_irqsave(&pipe->pending_job_lock, flag);
+	if (list_empty(&pipe->pipe_job_pending_list)) {
+		spin_unlock_irqrestore(&pipe->pending_job_lock, flag);
+		return;
+	}
+
+	req = list_first_entry(&pipe->pipe_job_pending_list, struct mtk_imgsys_request, list);
+	list_del(&req->list);
+	pipe->num_pending_jobs--;
+	spin_unlock_irqrestore(&pipe->pending_job_lock, flag);
+
+	spin_lock_irqsave(&pipe->running_job_lock, flag);
+	list_add_tail(&req->list,
+		      &pipe->pipe_job_running_list);
+	pipe->num_jobs++;
+	spin_unlock_irqrestore(&pipe->running_job_lock, flag);
+
+	mtk_imgsys_hw_enqueue(pipe->imgsys_dev, req);
+	dev_dbg(pipe->imgsys_dev->dev,
+		"%s:%s: pending jobs(%d), running jobs(%d)\n",
+		__func__, pipe->desc->name, pipe->num_pending_jobs,
+		pipe->num_jobs);
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
new file mode 100644
index 000000000000..b69cfd0043d3
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-dev.h
@@ -0,0 +1,427 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_DEV_H_
+#define _MTK_IMGSYS_DEV_H_
+
+#include <linux/completion.h>
+#include <linux/types.h>
+#include <linux/time.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/pm_opp.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-device.h>
+#include <linux/videodev2.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "mtk_header_desc.h"
+
+#define MTK_IMGSYS_MEDIA_MODEL_NAME	"MTK-ISP-DIP-V4L2"
+
+#define MTK_IMGSYS_OUTPUT_MIN_WIDTH		1U
+#define MTK_IMGSYS_OUTPUT_MIN_HEIGHT		1U
+#define MTK_IMGSYS_OUTPUT_MAX_WIDTH		5376U
+#define MTK_IMGSYS_OUTPUT_MAX_HEIGHT		4032U
+
+#define MTK_IMGSYS_CAPTURE_MIN_WIDTH		1U
+#define MTK_IMGSYS_CAPTURE_MIN_HEIGHT		1U
+#define MTK_IMGSYS_CAPTURE_MAX_WIDTH		5376U
+#define MTK_IMGSYS_CAPTURE_MAX_HEIGHT		4032U
+
+/**
+ * struct mtk_imgsys_dev_format - Device format for MediaTek Image System
+ * @fmt: Pointer to the Image System format structure
+ * @align: Alignment requirement
+ * @scan_align: Scan alignment requirement
+ *
+ * This structure defines the format used by the MediaTek Image System device.
+ * It includes a pointer to the format structure, and alignment and scan
+ * alignment requirements.
+ */
+struct mtk_imgsys_dev_format {
+	const struct mtk_imgsys_format *fmt;
+	u32 align;
+	u32 scan_align;
+};
+
+/**
+ * struct mtk_imgsys_dev_buffer - Device buffer for MediaTek Image System
+ * @vbb: Video buffer structure for V4L2
+ * @fmt: Format of the video buffer
+ * @dev_fmt: Pointer to the device-specific format structure
+ * @isp_daddr: DMA addresses for ISP processing, indexed by plane
+ * @scp_daddr: DMA addresses for SCP processing, indexed by plane
+ * @crop: Crop information for image processing
+ * @compose: Composition rectangle for output
+ * @rotation: Rotation angle for the image
+ * @hflip: Horizontal flip flag
+ * @vflip: Vertical flip flag
+ * @resize_ratio: Ratio for resizing the image
+ * @dataofst: Offset for the data buffer
+ * @list: List head for buffer management
+ *
+ * This structure represents the buffer used by the MediaTek ImgSys device.
+ * It includes various parameters for buffer management and image processing,
+ * such as format, DMA addresses, cropping, composition, rotation, flipping,
+ * resizing, and list management. This buffer is essential for handling
+ * image data in the device's processing pipeline.
+ */
+struct mtk_imgsys_dev_buffer {
+	struct vb2_v4l2_buffer vbb;
+	struct v4l2_format fmt;
+	const struct mtk_imgsys_dev_format *dev_fmt;
+	dma_addr_t isp_daddr[VB2_MAX_PLANES];
+	dma_addr_t scp_daddr[VB2_MAX_PLANES];
+	struct mtk_imgsys_crop crop;
+	struct v4l2_rect compose;
+	__u32 rotation;
+	__u32 hflip;
+	__u32 vflip;
+	__u32 resize_ratio;
+	__u32 dataofst;
+	struct list_head list;
+};
+
+/**
+ * struct mtk_imgsys_pipe_desc - Description of an image processing pipeline
+ * @name: Name of the pipeline
+ * @id: Identifier for the pipeline
+ * @queue_descs: Pointer to an array of video device descriptors
+ * @total_queues: Total number of queues in the pipeline
+ *
+ * This structure describes an image processing pipeline within the MediaTek
+ * image system. It includes the name and identifier of the pipeline, and
+ * an array of video device descriptors along with the total number of queues.
+ */
+struct mtk_imgsys_pipe_desc {
+	char *name;
+	int id;
+	struct mtk_imgsys_video_device_desc *queue_descs;
+	int total_queues;
+};
+
+/**
+ * struct mtk_imgsys_video_device_desc - Description of a video device
+ * @id: Identifier for the video device
+ * @name: Name of the video device
+ * @buf_type: Buffer type used by the video device
+ * @cap: Capabilities of the video device
+ * @smem_alloc: Using the smem_dev as alloc device or not
+ * @supports_ctrls: Flag indicating if the device supports controls
+ * @fmts: Pointer to an array of supported formats
+ * @num_fmts: Number of supported formats
+ * @description: Description of the video device
+ * @default_width: Default width of the video frames
+ * @default_height: Default height of the video frames
+ * @dma_port: DMA port used by the video device
+ * @frmsizeenum: Pointer to an array of frame size enumerations
+ * @flags: Additional flags for the video device
+ *
+ * This structure describes a video device within the MediaTek image system.
+ * It includes various properties such as the identifier, name, buffer type,
+ * capabilities, supported formats, and other relevant details.
+ */
+struct mtk_imgsys_video_device_desc {
+	int id;
+	char *name;
+	u32 buf_type;
+	u32 cap;
+	int smem_alloc;
+	int supports_ctrls;
+	const struct mtk_imgsys_dev_format *fmts;
+	int num_fmts;
+	char *description;
+	int default_width;
+	int default_height;
+	unsigned int dma_port;
+	const struct v4l2_frmsizeenum *frmsizeenum;
+	u32 flags;
+};
+
+/**
+ * struct mtk_imgsys_dev_queue - Device queue structure for image system
+ * @vbq: VB2 queue structure
+ * @lock: Mutex to serialize vb2 queue and video device operations
+ * @dev_fmt: Pointer to the device format structure
+ *
+ * This structure defines the device queue for the image system, including the
+ * VB2 queue, a mutex for serializing operations, and a pointer to the device
+ * format.
+ */
+struct mtk_imgsys_dev_queue {
+	struct vb2_queue vbq;
+	struct mutex lock; /* Protect the vb2_queue */
+	const struct mtk_imgsys_dev_format *dev_fmt;
+};
+
+/**
+ * struct mtk_imgsys_video_device -
+ * Video device structure for MediaTek Image System
+ *
+ * @vdev: Video device structure
+ * @dev_q: Device queue for buffer management
+ * @vdev_fmt: Format of the video device
+ * @vdev_pad: Media pad for the video device
+ * @pad_fmt: Media bus frame format for the pad
+ * @ctrl_handler: Control handler for V4L2 controls
+ * @resize_ratio_ctrl: Pointer to the resize ratio control
+ * @flags: Link attribute flags (e.g., MEDIA_LNK_FL_ENABLED)
+ * @desc: Pointer to the video device description structure
+ * @buf_list: List head for buffer management
+ * @crop: Crop rectangle for the video device
+ * @compose: Composition rectangle for the video device
+ * @rotation: Rotation angle for the video device
+ * @vflip: Vertical flip flag
+ * @hflip: Horizontal flip flag
+ * @resize_ratio: Resize ratio for the video device
+ * @buf_list_lock: Spinlock to protect the in-device buffer list
+ *
+ * This structure represents the video device used by the MediaTek Image System.
+ * It includes various parameters for managing video buffers, formats, media pads,
+ * controls, cropping, composition, rotation, flipping, resizing, and buffer list
+ * protection. This structure is essential for handling video data and device
+ * configuration in the MediaTek Image System.
+ */
+struct mtk_imgsys_video_device {
+	struct video_device vdev;
+	struct mtk_imgsys_dev_queue dev_q;
+	struct v4l2_format vdev_fmt;
+	struct media_pad vdev_pad;
+	struct v4l2_mbus_framefmt pad_fmt;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct v4l2_ctrl *resize_ratio_ctrl;
+	u32 flags; /* Link attribute flags, e.g. MEDIA_LNK_FL_ENABLED */
+	const struct mtk_imgsys_video_device_desc *desc;
+	struct list_head buf_list;
+	struct v4l2_rect crop;
+	struct v4l2_rect compose;
+	int rotation;
+	bool vflip;
+	bool hflip;
+	int resize_ratio;
+	/* protect the in-device buffer list */
+	spinlock_t buf_list_lock;
+};
+
+/**
+ * struct mtk_imgsys_pipe - Pipeline structure for MediaTek Image System
+ * @imgsys_dev: Pointer to the image system device
+ * @nodes: Pointer to the video device nodes associated with the pipeline
+ * @nodes_streaming: Bitmap representing streaming status of nodes
+ * @nodes_enabled: Bitmap representing enabled status of nodes
+ * @streaming: Flag indicating if the pipeline is currently streaming
+ * @subdev_pads: Media pads for subdevice connections
+ * @pipeline: Media pipeline structure
+ * @subdev: V4L2 subdevice structure
+ * @fh: File handle for subdevice operations
+ * @pipe_job_sequence: Atomic counter for job sequencing
+ * @pipe_job_pending_list: List head for pending jobs in the pipeline
+ * @num_pending_jobs: Number of pending jobs in the pipeline
+ * @pending_job_lock: To protect pipe_job_pending_list and num_pending_jobs
+ * @pipe_job_running_list: List head for running jobs in the pipeline
+ * @running_job_lock: Spinlock to protect pipe_job_running_list
+ * @num_jobs: Total number of jobs in the pipeline
+ * @lock: Mutex to serialize stream on/off and buffer enqueue operations
+ * @desc: Pointer to the pipeline description structure
+ *
+ * This structure represents a pipeline in the MediaTek Image System. It includes
+ * various components for managing the image processing pipeline, such as device
+ * pointers, video nodes, streaming flags, media pads, pipeline configuration,
+ * subdevice operations, job management, and synchronization mechanisms.
+ * This structure is essential for coordinating the flow of image data through
+ * the processing pipeline.
+ */
+struct mtk_imgsys_pipe {
+	struct mtk_imgsys_dev *imgsys_dev;
+	struct mtk_imgsys_video_device *nodes;
+	unsigned long long nodes_streaming;
+	unsigned long long nodes_enabled;
+	int streaming;
+	struct media_pad *subdev_pads;
+	struct media_pipeline pipeline;
+	struct v4l2_subdev subdev;
+	struct v4l2_subdev_fh *fh;
+	atomic_t pipe_job_sequence;
+	struct list_head pipe_job_pending_list;
+	int num_pending_jobs;
+	/* protect pipe_job_pending_list and num_pending_jobs */
+	spinlock_t pending_job_lock;
+	struct list_head pipe_job_running_list;
+	/* protect pipe_job_running_list */
+	spinlock_t running_job_lock;
+	int num_jobs;
+	/* Serializes pipe's stream on/off and buffers enqueue operations */
+	struct mutex lock;
+	const struct mtk_imgsys_pipe_desc *desc;
+};
+
+/**
+ * struct mtk_imgsys_dev - MediaTek Image System Device Structure
+ * @dev: Pointer to the device structure.
+ * @imgsys_resource: Resource descriptor for image system hardware.
+ * @mdev: Media device structure for media controller framework integration.
+ * @v4l2_dev: V4L2 device structure for video device operations.
+ * @imgsys_pipe: Image system pipeline configuration structure.
+ * @cust_pipes: Pointer to custom pipeline descriptors.
+ * @clks: Array of clock bulk data for managing multiple clocks.
+ * @num_clks: Number of clocks in the clock array.
+ * @larbs: Array of device pointers for managing LARB (local arbiter).
+ * @num_larbs: Number of LARBs in the system.
+ * @scp: Pointer to the SCP (System Control Processor) structure.
+ * @rproc_handle: Handle for remote processor interface.
+ * @smem_dev: Device structure for shared memory operations.
+ * @num_mods: Number of modules in the image system.
+ */
+struct mtk_imgsys_dev {
+	/* Device and Resource Information */
+	struct device *dev;
+	struct resource *imgsys_resource;
+	/* Media and V4L2 Device Management */
+	struct media_device mdev;
+	struct v4l2_device v4l2_dev;
+	struct mtk_imgsys_pipe imgsys_pipe;
+	/* Imgsys Pipeline Information */
+	const struct mtk_imgsys_pipe_desc *cust_pipes;
+	/* Clock Information */
+	struct clk_bulk_data *clks;
+	int num_clks;
+	/* LARB (Local Arbitration) Control */
+	struct device **larbs;
+	unsigned int num_larbs;
+	/* SCP (System Control Processor) Integration */
+	struct mtk_scp *scp;
+	struct rproc *rproc_handle;
+	struct device *smem_dev;
+	/* Number of modules */
+	int num_mods;
+};
+
+/**
+ * struct req_frameparam - Request frame parameters for MediaTek Image System
+ * @frame_no: Frame number identifier
+ * @state: State of the frame (e.g., init, timeout)
+ *
+ * This structure represents the parameters for a request frame in the MediaTek Image System.
+ * It includes various attributes such as the frame index, frame number, timestamp, state,
+ * and the number of input and output buffers. This structure is used to manage and track
+ * the frames within the image processing pipeline.
+ */
+struct req_frameparam {
+	u32		frame_no;
+	u8		state;
+} __packed;
+
+/**
+ * struct mtk_imgsys_request - Request structure for MediaTek Image System
+ * @req: Media request structure
+ * @imgsys_pipe: Pointer to the image system pipeline
+ * @id: Unique identifier for the request
+ * @buf_map: Pointer to an array of device buffers mapped to the request
+ * @list: List head for request management
+ * @img_fparam: Frame parameters associated with the request
+ * @composer_work: Work structure for composer tasks
+ * @runner_work: Work structure for runner tasks
+ * @working_buf: Pointer to the hardware working buffer
+ * @swfrm_info: Pointer to software frame information
+ * @buf_count: Atomic counter for buffer management
+ * @request_fd: File descriptor for the request
+ *
+ * This structure represents a request in the MediaTek Image System. It includes
+ * various parameters for managing media requests, image processing pipeline,
+ * buffer mapping, frame parameters, work tasks, hardware buffers, software frame
+ * information, buffer count, and request file descriptor. This structure is
+ * essential for handling and processing image requests within the MediaTek Image
+ * System.
+ */
+struct mtk_imgsys_request {
+	struct media_request req;
+	struct mtk_imgsys_pipe *imgsys_pipe;
+	int id;
+	struct mtk_imgsys_dev_buffer **buf_map;
+	struct list_head list;
+	struct req_frameparam img_fparam;
+	atomic_t buf_count;
+	int request_fd;
+};
+
+static inline struct mtk_imgsys_video_device*
+mtk_imgsys_file_to_node(struct file *file)
+{
+	return container_of(video_devdata(file),
+			    struct mtk_imgsys_video_device, vdev);
+}
+
+static inline struct mtk_imgsys_pipe*
+mtk_imgsys_subdev_to_pipe(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mtk_imgsys_pipe, subdev);
+}
+
+static inline struct mtk_imgsys_dev*
+mtk_imgsys_mdev_to_dev(struct media_device *mdev)
+{
+	return container_of(mdev, struct mtk_imgsys_dev, mdev);
+}
+
+static inline struct mtk_imgsys_video_device*
+mtk_imgsys_vbq_to_node(struct vb2_queue *vq)
+{
+	return container_of(vq, struct mtk_imgsys_video_device, dev_q.vbq);
+}
+
+static inline struct mtk_imgsys_dev_buffer*
+mtk_imgsys_vb2_buf_to_dev_buf(struct vb2_buffer *vb)
+{
+	return container_of(vb, struct mtk_imgsys_dev_buffer, vbb.vb2_buf);
+}
+
+static inline struct mtk_imgsys_request*
+mtk_imgsys_media_req_to_imgsys_req(struct media_request *req)
+{
+	return container_of(req, struct mtk_imgsys_request, req);
+}
+
+static inline int mtk_imgsys_buf_is_meta(u32 type)
+{
+	return type == V4L2_BUF_TYPE_META_CAPTURE ||
+	       type == V4L2_BUF_TYPE_META_OUTPUT;
+}
+
+int mtk_imgsys_pipe_init(struct mtk_imgsys_dev *imgsys_dev,
+			 struct mtk_imgsys_pipe *pipe,
+			 const struct mtk_imgsys_pipe_desc *setting);
+
+int mtk_imgsys_pipe_release(struct mtk_imgsys_pipe *pipe);
+
+int mtk_imgsys_pipe_next_job_id(struct mtk_imgsys_pipe *pipe);
+
+void mtk_imgsys_pipe_debug_job(struct mtk_imgsys_pipe *pipe,
+			       struct mtk_imgsys_request *req);
+
+const struct mtk_imgsys_dev_format *
+mtk_imgsys_pipe_find_fmt(struct mtk_imgsys_pipe *pipe,
+			 struct mtk_imgsys_video_device *node,
+			 u32 format);
+
+void mtk_imgsys_pipe_try_fmt(struct mtk_imgsys_video_device *node,
+			     struct v4l2_format *fmt,
+			     const struct v4l2_format *ufmt,
+			     const struct mtk_imgsys_dev_format *dfmt);
+
+void mtk_imgsys_pipe_load_default_fmt(struct mtk_imgsys_pipe *pipe,
+				      struct mtk_imgsys_video_device *node,
+				      struct v4l2_format *fmt_to_fill);
+
+void mtk_imgsys_pipe_try_enqueue(struct mtk_imgsys_pipe *pipe);
+
+#endif /* _MTK_IMGSYS_DEV_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.c
new file mode 100644
index 000000000000..6a3a98e9cd42
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek ISP ImgSys formats
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#include <linux/mtkisp_imgsys.h>
+#include <linux/videodev2.h>
+#include "mtk_imgsys-formats.h"
+
+const struct mtk_imgsys_format mtk_imgsys_format_nv12 = {
+	.format = V4L2_PIX_FMT_NV12,
+	.num_planes = 2,
+	.pixels_per_group = 2,
+	.bytes_per_group = {2, 2},
+	.vertical_sub_sampling = { 1, 2 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_nv21 = {
+	.format = V4L2_PIX_FMT_NV21,
+	.num_planes = 2,
+	.pixels_per_group = 2,
+	.bytes_per_group = {2, 2},
+	.vertical_sub_sampling = { 1, 2 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_grey = {
+	.format = V4L2_PIX_FMT_GREY,
+	.num_planes = 1,
+	.pixels_per_group = 1,
+	.bytes_per_group = { 1 },
+	.vertical_sub_sampling = { 1 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_2p012p = {
+	.format = V4L2_PIX_FMT_YUV_2P012P,
+	.num_planes = 2,
+	.pixels_per_group = 64,
+	.bytes_per_group = { 96, 96 },
+	.vertical_sub_sampling = { 1, 2 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_2p010p = {
+	.format = V4L2_PIX_FMT_YUV_2P010P,
+	.num_planes = 2,
+	.pixels_per_group = 64,
+	.bytes_per_group = { 80, 80 },
+	.vertical_sub_sampling = { 1, 2 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_y8 = {
+	.format = V4L2_PIX_FMT_MTISP_Y8,
+	.num_planes = 1,
+	.pixels_per_group = 1,
+	.bytes_per_group = { 1 },
+	.vertical_sub_sampling = { 1 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_y16 = {
+	.format = V4L2_PIX_FMT_MTISP_Y16,
+	.num_planes = 1,
+	.buffer_size = 0,
+	.pixels_per_group = 1,
+	.bytes_per_group = { 2 },
+	.vertical_sub_sampling = { 1 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_y32 = {
+	.format = V4L2_PIX_FMT_MTISP_Y32,
+	.num_planes = 1,
+	.buffer_size = 0,
+	.pixels_per_group = 1,
+	.bytes_per_group = { 4 },
+	.vertical_sub_sampling = { 1 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_warp2p = {
+	.format = V4L2_PIX_FMT_WARP2P,
+	.num_planes = 2,
+	.buffer_size = 0,
+	.pixels_per_group = 4,
+	.bytes_per_group = { 8, 8 },
+	.vertical_sub_sampling = { 1, 1 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_sgbrg10 = {
+	.format = V4L2_PIX_FMT_MTISP_SGBRG10,
+	.num_planes = 1,
+	.buffer_size = 0,
+	.pixels_per_group = 64,
+	.bytes_per_group = { 80 },
+	.vertical_sub_sampling = { 1 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_srggb10 = {
+	.format = V4L2_PIX_FMT_MTISP_SRGGB10,
+	.num_planes = 1,
+	.buffer_size = 0,
+	.pixels_per_group = 64,
+	.bytes_per_group = { 80 },
+	.vertical_sub_sampling = { 1 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_sgrbg10 = {
+	.format = V4L2_PIX_FMT_MTISP_SGRBG10,
+	.num_planes = 1,
+	.buffer_size = 0,
+	.pixels_per_group = 64,
+	.bytes_per_group = { 80 },
+	.vertical_sub_sampling = { 1 },
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_aply8 = {
+	.format = V4L2_PIX_FMT_MTISP_APLY8,
+	.num_planes = 1,
+	.pixels_per_group = 1,
+	.bytes_per_group = { 1 },
+	.vertical_sub_sampling = { 1 },
+	.ext_data = SIZE_OF_APL_DATA,
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_metai = {
+	.format = V4L2_META_FMT_MTISP_TUN_PARAMS,
+	.num_planes = 1,
+	.buffer_size = SIZE_OF_TUNING_META,
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_stt = {
+	.format = V4L2_META_FMT_MTISP_STAT_PARAMS,
+	.num_planes = 1,
+	.buffer_size = SIZE_OF_STATISTICS_META,
+};
+
+const struct mtk_imgsys_format mtk_imgsys_format_ctrlmeta = {
+	.format = V4L2_META_FMT_MTISP_CTL_PARAMS,
+	.num_planes = 1,
+	.buffer_size = SIZE_OF_CTRL_META,
+};
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.h
new file mode 100644
index 000000000000..cbf8b2b414f8
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-formats.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * MediaTek ISP ImgSys formats
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#ifndef _MTK_IMGSYS_FORMATS_H_
+#define _MTK_IMGSYS_FORMATS_H_
+
+/**
+ * struct mtk_imgsys_format - MediaTek Image System format description
+ * @format: Pixel format identifier (e.g., V4L2_PIX_FMT_*).
+ * @num_planes: Number of planes in the image format. For example, 1 for
+ * single-plane formats, 2 or 3 for multi-plane formats like YUV420.
+ * @buffer_size: Total buffer size in bytes required to store the image data.
+ * @pixels_per_group: Number of pixels per group, which s defined as the
+ * minimum number of pixels (including padding) necessary in a row when the
+ * image has only one column of effective pixels.
+ * @bytes_per_group: Array specifying the number of bytes per group for each
+ * plane. The array size is 3 to support up to 3 planes.
+ * @vertical_sub_sampling: Array specifying the vertical subsampling factor for
+ * each plane. The array size is 3 to support up to 3 planes.
+ * @ext_data: Additional data or flags related to the image format.
+ *
+ * This structure is used to describe the format of images processed by the
+ * MediaTek Image System. It includes information about the pixel format,
+ * number of planes, buffer size, and other relevant details.
+ */
+struct mtk_imgsys_format {
+	u32 format;
+	u8 num_planes;
+	u32 buffer_size;
+	u32 pixels_per_group;
+	u32 bytes_per_group[3];
+	u32 vertical_sub_sampling[3];
+	u32 ext_data;
+};
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_nv12;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_nv21;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_grey;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_2p012p;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_2p010p;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_y8;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_y16;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_y32;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_warp2p;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_sgbrg10;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_srggb10;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_sgrbg10;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_aply8;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_metai;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_stt;
+
+extern const struct mtk_imgsys_format mtk_imgsys_format_ctrlmeta;
+
+#endif /* _MTK_IMGSYS_FORMATS_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
new file mode 100644
index 000000000000..6dc4b7b60832
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-module_ops.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_MODULES_H_
+#define _MTK_IMGSYS_MODULES_H_
+
+/**
+ * enum mtk_imgsys_module
+ *
+ * Definition about supported hw modules
+ */
+enum mtk_imgsys_module {
+	IMGSYS_MOD_IMGMAIN = 0,
+	IMGSYS_MOD_WPE,
+	IMGSYS_MOD_TRAW,
+	IMGSYS_MOD_DIP,
+	IMGSYS_MOD_PQDIP,
+	IMGSYS_MOD_ME,
+	IMGSYS_MOD_MAX,
+};
+
+#endif /* _MTK_IMGSYS_MODULES_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.c
new file mode 100644
index 000000000000..94888682a939
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
+ *
+ */
+
+#include "mtk_imgsys-of.h"
+
+static void merge_module_pipelines(const struct mtk_imgsys_pipe_desc *imgsys_pipe,
+				   const struct cust_data *data)
+{
+	const struct mtk_imgsys_mod_pipe_desc *module_pipe;
+	unsigned int mod_num;
+	unsigned int i, j, k;
+
+	mod_num = data->mod_num;
+	k = 0;
+	for (i = 0; i < mod_num; i++) {
+		module_pipe = &data->module_pipes[i];
+		for (j = 0; j < module_pipe->node_num; j++) {
+			imgsys_pipe->queue_descs[k] = module_pipe->vnode_desc[j];
+			k++;
+		}
+	}
+}
+
+void init_imgsys_pipeline(const struct cust_data *data)
+{
+	const struct mtk_imgsys_pipe_desc *imgsys_pipe;
+	unsigned int i;
+
+	for (i = 0; i < data->pipe_num; i++) {
+		imgsys_pipe = &data->pipe_settings[i];
+		merge_module_pipelines(imgsys_pipe, data);
+	}
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h
new file mode 100644
index 000000000000..5088c9df704c
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-of.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *         Holmes Chiou <holmes.chiou@mediatek.com>
+ *
+ */
+
+#ifndef _MTK_IMGSYS_OF_H_
+#define _MTK_IMGSYS_OF_H_
+
+#include <linux/clk.h>
+#include "mtk_imgsys-dev.h"
+
+/**
+ * struct mtk_imgsys_mod_pipe_desc - Description of a module's pipeline
+ * @vnode_desc: Pointer to an array of video device descriptors for the module.
+ * @node_num: Number of video nodes associated with this module.
+ */
+struct mtk_imgsys_mod_pipe_desc {
+	const struct mtk_imgsys_video_device_desc *vnode_desc;
+	unsigned int node_num;
+};
+
+/**
+ * struct cust_data - Custom data structure for image system configuration
+ * @clks: Pointer to an array of clock bulk data for the module.
+ * @clk_num: Number of clocks associated with this module.
+ * @module_pipes: Pointer to an array of module pipeline descriptions.
+ * @mod_num: Number of modules in the pipeline.
+ * @pipe_settings: Pointer to pipeline settings for the module.
+ * @pipe_num: Number of pipeline settings.
+ */
+struct cust_data {
+	struct clk_bulk_data *clks;
+	unsigned int clk_num;
+	const struct mtk_imgsys_mod_pipe_desc *module_pipes;
+	unsigned int mod_num;
+	const struct mtk_imgsys_pipe_desc *pipe_settings;
+	unsigned int pipe_num;
+};
+
+/**
+ * init_imgsys_pipeline - Initialize the video nodes in image system pipeline
+ * @data: Pointer to the custom data structure containing configuration
+ *  information.
+ *
+ * This function initializes the image system pipeline based on the provided
+ * custom data. It sets up the necessary modules's video nodes as defined in
+ * the cust_data structure.
+ */
+void init_imgsys_pipeline(const struct cust_data *data);
+
+#endif /* _MTK_IMGSYS_OF_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
new file mode 100644
index 000000000000..9cdcdb0a0200
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+
+#include "mtk_imgsys-sys.h"
+
+void mtk_imgsys_hw_enqueue(struct mtk_imgsys_dev *imgsys_dev,
+			   struct mtk_imgsys_request *req)
+{
+	/* Function implementation will be provided in subsequent patches */
+}
+
+int mtk_imgsys_hw_streamon(struct mtk_imgsys_pipe *pipe)
+{
+	/* Function implementation will be provided in subsequent patches */
+	return 0;
+}
+
+int mtk_imgsys_hw_streamoff(struct mtk_imgsys_pipe *pipe)
+{
+	/* Function implementation will be provided in subsequent patches */
+	return 0;
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.h
new file mode 100644
index 000000000000..9f9b0b627305
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef _MTK_IMGSYS_SYS_H_
+#define _MTK_IMGSYS_SYS_H_
+
+#include "mtk_imgsys-dev.h"
+
+/*
+ * mtk_imgsys_hw_streamon - Start streaming on the ImgSys pipeline
+ * @pipe: Pointer to the ImgSys pipeline structure
+ *
+ * This function starts streaming on the specified ImgSys pipeline. It ensures
+ * that the pipeline is properly initialized and ready to process image data.
+ * This is typically used to begin image processing operations after the pipeline
+ * has been configured.
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+int mtk_imgsys_hw_streamon(struct mtk_imgsys_pipe *pipe);
+
+/*
+ * mtk_imgsys_hw_streamoff - Stop streaming on the ImgSys pipeline
+ * @pipe: Pointer to the ImgSys pipeline structure
+ *
+ * This function stops streaming on the specified ImgSys pipeline. It ensures
+ * that any ongoing image processing tasks are halted and the pipeline is
+ * properly shut down. This is typically used when the image processing
+ * operations are no longer needed or when the system is being reconfigured.
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+int mtk_imgsys_hw_streamoff(struct mtk_imgsys_pipe *pipe);
+
+/*
+ * mtk_imgsys_hw_enqueue - Enqueue a request to the ImgSys hardware
+ * @imgsys_dev: Pointer to the ImgSys device structure
+ * @req: Pointer to the ImgSys request structure
+ *
+ * This function enqueues a request to the ImgSys hardware for processing.
+ * The request contains information about the image processing tasks to be
+ * performed by the hardware. The function ensures that the request is properly
+ * queued and ready for execution by the ImgSys hardware.
+ */
+void mtk_imgsys_hw_enqueue(struct mtk_imgsys_dev *imgsys_dev,
+			   struct mtk_imgsys_request *req);
+
+#endif /* _MTK_IMGSYS_SYS_H_ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
new file mode 100644
index 000000000000..cfd65858c751
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-v4l2.c
@@ -0,0 +1,1684 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/dma-mapping.h>
+#include <linux/vmalloc.h>
+#include <linux/videodev2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-event.h>
+#include "linux/mtkisp_imgsys.h"
+#include "mtk_imgsys-of.h"
+#include "mtk_imgsys-module_ops.h"
+#include "mtk_imgsys-vnode_id.h"
+#include "mtk_imgsys_v4l2_vnode.h"
+#include "mtk_imgsys-dev.h"
+#include "mtk_imgsys-sys.h"
+
+#define IMGSYS_MAX_BUFFERS	256
+#define IMGSYS_SUSPEND_TIME 3000 /* ms */
+
+static int mtk_imgsys_sd_subscribe_event(struct v4l2_subdev *subdev,
+					 struct v4l2_fh *fh,
+					 struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_FRAME_SYNC:
+		return v4l2_event_subscribe(fh, sub, 64, NULL);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_subdev_core_ops mtk_imgsys_subdev_core_ops = {
+	.subscribe_event = mtk_imgsys_sd_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static int mtk_imgsys_subdev_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct mtk_imgsys_pipe *pipe = mtk_imgsys_subdev_to_pipe(sd);
+	int ret;
+
+	if (enable) {
+		ret = mtk_imgsys_hw_streamon(pipe);
+		if (ret)
+			dev_err(pipe->imgsys_dev->dev,
+				"%s: pipe(%d) stream on failed\n",
+				pipe->desc->name, pipe->desc->id);
+	} else {
+		ret = mtk_imgsys_hw_streamoff(pipe);
+		if (ret)
+			dev_err(pipe->imgsys_dev->dev,
+				"%s: pipe(%d) stream off failed\n",
+				pipe->desc->name, pipe->desc->id);
+	}
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops mtk_imgsys_subdev_video_ops = {
+	.s_stream = mtk_imgsys_subdev_s_stream,
+};
+
+static const struct v4l2_subdev_ops mtk_imgsys_subdev_ops = {
+	.core = &mtk_imgsys_subdev_core_ops,
+	.video = &mtk_imgsys_subdev_video_ops,
+};
+
+static int mtk_imgsys_link_setup(struct media_entity *entity,
+				 const struct media_pad *local,
+				 const struct media_pad *remote,
+				 u32 flags)
+{
+	struct mtk_imgsys_pipe *pipe =
+		container_of(entity, struct mtk_imgsys_pipe, subdev.entity);
+	u32 pad = local->index;
+
+	WARN_ON(entity->obj_type != MEDIA_ENTITY_TYPE_V4L2_SUBDEV);
+	WARN_ON(pad >= pipe->desc->total_queues);
+
+	mutex_lock(&pipe->lock);
+
+	if (flags & MEDIA_LNK_FL_ENABLED)
+		pipe->nodes_enabled++;
+	else
+		pipe->nodes_enabled--;
+
+	pipe->nodes[pad].flags &= ~MEDIA_LNK_FL_ENABLED;
+	pipe->nodes[pad].flags |= flags & MEDIA_LNK_FL_ENABLED;
+
+	dev_dbg(pipe->imgsys_dev->dev,
+		"%s: link setup, flags(0x%x), (%s)%d -->(%s)%d, nodes_enabled(0x%llx)\n",
+		pipe->desc->name, flags, local->entity->name, local->index,
+		remote->entity->name, remote->index, pipe->nodes_enabled);
+
+	mutex_unlock(&pipe->lock);
+
+	return 0;
+}
+
+static const struct media_entity_operations mtk_imgsys_media_ops = {
+	.link_setup = mtk_imgsys_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int mtk_imgsys_vb2_meta_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mtk_imgsys_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_imgsys_video_device *node =
+					mtk_imgsys_vbq_to_node(vb->vb2_queue);
+	struct device *dev = pipe->imgsys_dev->dev;
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+
+	if (vb->planes[0].length < fmt->fmt.meta.buffersize) {
+		dev_err(dev,
+			"%s:%s: size error(user:%d, required:%d)\n",
+			pipe->desc->name, node->desc->name,
+			vb->planes[0].length, fmt->fmt.meta.buffersize);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mtk_imgsys_vb2_video_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mtk_imgsys_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_imgsys_video_device *node =
+					mtk_imgsys_vbq_to_node(vb->vb2_queue);
+	struct device *dev = pipe->imgsys_dev->dev;
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+	unsigned int size;
+	int i;
+
+	for (i = 0; i < vb->num_planes; i++) {
+		size = fmt->fmt.pix_mp.plane_fmt[i].sizeimage;
+		if (vb->planes[i].length < size) {
+			dev_err(dev,
+				"%s:%s: size error(user:%d, required:%d)\n",
+				pipe->desc->name, node->desc->name,
+				vb->planes[i].length, size);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_imgsys_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
+
+	if (v4l2_buf->field == V4L2_FIELD_ANY)
+		v4l2_buf->field = V4L2_FIELD_NONE;
+
+	if (v4l2_buf->field != V4L2_FIELD_NONE)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mtk_imgsys_vb2_meta_buf_init(struct vb2_buffer *vb)
+{
+	struct mtk_imgsys_dev_buffer *dev_buf =
+					mtk_imgsys_vb2_buf_to_dev_buf(vb);
+	struct mtk_imgsys_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
+	struct mtk_imgsys_video_device *node =
+					mtk_imgsys_vbq_to_node(vb->vb2_queue);
+
+	/*
+	 * The meta buffers are allocated from the SCP reserved memory.
+	 * Setup the mapping to ImgSys device here.
+	 */
+	dev_buf->scp_daddr[0] = vb2_dma_contig_plane_dma_addr(vb, 0);
+	dev_buf->isp_daddr[0] =
+		dma_map_resource(pipe->imgsys_dev->dev,
+				 dev_buf->scp_daddr[0],
+				 vb->planes[0].length,
+				 DMA_BIDIRECTIONAL,
+				 DMA_ATTR_SKIP_CPU_SYNC);
+	if (dma_mapping_error(pipe->imgsys_dev->dev,
+			      dev_buf->isp_daddr[0])) {
+		dev_err(pipe->imgsys_dev->dev,
+			"%s:%s: failed to map buffer: s_daddr(%pad)\n",
+			pipe->desc->name, node->desc->name,
+			&dev_buf->scp_daddr[0]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mtk_imgsys_vb2_video_buf_init(struct vb2_buffer *vb)
+{
+	struct mtk_imgsys_dev_buffer *dev_buf =
+					mtk_imgsys_vb2_buf_to_dev_buf(vb);
+	unsigned int plane;
+
+	for (plane = 0; plane < vb->num_planes; ++plane)
+		dev_buf->isp_daddr[plane] = vb2_dma_contig_plane_dma_addr(vb, plane);
+
+	return 0;
+}
+
+static void mtk_imgsys_vb2_queue_meta_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct mtk_imgsys_dev_buffer *dev_buf =
+					mtk_imgsys_vb2_buf_to_dev_buf(vb);
+	struct mtk_imgsys_pipe *pipe = vb2_get_drv_priv(vb->vb2_queue);
+
+	dma_unmap_resource(pipe->imgsys_dev->dev,
+			   dev_buf->isp_daddr[0],
+			   vb->planes[0].length, DMA_BIDIRECTIONAL,
+			   DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void mtk_imgsys_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *b = to_vb2_v4l2_buffer(vb);
+	struct mtk_imgsys_dev_buffer *dev_buf =
+					mtk_imgsys_vb2_buf_to_dev_buf(vb);
+	struct mtk_imgsys_request *req = NULL;
+	struct mtk_imgsys_video_device *node =
+					mtk_imgsys_vbq_to_node(vb->vb2_queue);
+	int buf_count;
+
+	if (!vb->request)
+		return;
+
+	req = mtk_imgsys_media_req_to_imgsys_req(vb->request);
+
+	dev_buf->dev_fmt = node->dev_q.dev_fmt;
+	spin_lock(&node->buf_list_lock);
+	list_add_tail(&dev_buf->list, &node->buf_list);
+	spin_unlock(&node->buf_list_lock);
+
+	buf_count = atomic_dec_return(&req->buf_count);
+	if (!buf_count) {
+		dev_dbg(&node->vdev.dev,
+			"framo_no: (%d), reqfd-%d\n",
+			req->img_fparam.frame_no, b->request_fd);
+		req->request_fd = b->request_fd;
+		mutex_lock(&req->imgsys_pipe->lock);
+		mtk_imgsys_pipe_try_enqueue(req->imgsys_pipe);
+		mutex_unlock(&req->imgsys_pipe->lock);
+	}
+}
+
+static int mtk_imgsys_vb2_meta_queue_setup(struct vb2_queue *vq,
+					   unsigned int *num_buffers,
+					   unsigned int *num_planes,
+					   unsigned int sizes[],
+					   struct device *alloc_devs[])
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_vbq_to_node(vq);
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+
+	if (*num_planes)
+		return 0;
+
+	*num_planes = 1;
+	sizes[0] = fmt->fmt.meta.buffersize;
+
+	return 0;
+}
+
+static int mtk_imgsys_vb2_video_queue_setup(struct vb2_queue *vq,
+					    unsigned int *num_buffers,
+					    unsigned int *num_planes,
+					    unsigned int sizes[],
+					    struct device *alloc_devs[])
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_vbq_to_node(vq);
+	const struct v4l2_format *fmt = &node->vdev_fmt;
+	int i;
+
+	if (*num_planes)
+		return 0;
+
+	*num_planes = fmt->fmt.pix_mp.num_planes;
+
+	for (i = 0; i < *num_planes; i++) {
+		sizes[i] = fmt->fmt.pix_mp.plane_fmt[i].sizeimage;
+		*num_buffers = clamp_val(*num_buffers, 1, IMGSYS_MAX_BUFFERS);
+	}
+	return 0;
+}
+
+static void mtk_imgsys_return_all_buffers(struct mtk_imgsys_pipe *pipe,
+					  struct mtk_imgsys_video_device *node,
+					  enum vb2_buffer_state state)
+{
+	struct mtk_imgsys_dev_buffer *b, *b0;
+
+	spin_lock(&node->buf_list_lock);
+	list_for_each_entry_safe(b, b0, &node->buf_list, list) {
+		list_del(&b->list);
+		vb2_buffer_done(&b->vbb.vb2_buf, state);
+	}
+	spin_unlock(&node->buf_list_lock);
+}
+
+static int mtk_imgsys_vb2_start_streaming(struct vb2_queue *vq,
+					  unsigned int count)
+{
+	struct mtk_imgsys_pipe *pipe = vb2_get_drv_priv(vq);
+	struct mtk_imgsys_video_device *node = mtk_imgsys_vbq_to_node(vq);
+	int ret;
+
+	if (!pipe->nodes_streaming) {
+		ret = media_pipeline_start(&node->vdev.entity.pads[0], &pipe->pipeline);
+		if (ret < 0) {
+			dev_info(pipe->imgsys_dev->dev,
+				 "%s:%s: media_pipeline_start failed(%d)\n",
+				 pipe->desc->name, node->desc->name, ret);
+			goto fail_return_bufs;
+		}
+	}
+
+	mutex_lock(&pipe->lock);
+	if (!(node->flags & MEDIA_LNK_FL_ENABLED)) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "%s:%s: stream on failed, node is not enabled\n",
+			 pipe->desc->name, node->desc->name);
+
+		ret = -ENOLINK;
+		goto fail_stop_pipeline;
+	}
+
+	pipe->nodes_streaming++;
+	if (pipe->nodes_streaming == pipe->nodes_enabled) {
+		/* Start streaming of the whole pipeline */
+		ret = v4l2_subdev_call(&pipe->subdev, video, s_stream, 1);
+		if (ret < 0) {
+			dev_info(pipe->imgsys_dev->dev,
+				 "%s:%s: sub dev s_stream(1) failed(%d)\n",
+				 pipe->desc->name, node->desc->name, ret);
+
+			goto fail_stop_pipeline;
+		}
+	}
+
+	dev_dbg(pipe->imgsys_dev->dev,
+		"%s:%s:%s nodes_streaming(0x%llx), nodes_enable(0x%llx)\n",
+		__func__, pipe->desc->name, node->desc->name,
+		pipe->nodes_streaming, pipe->nodes_enabled);
+
+	mutex_unlock(&pipe->lock);
+
+	return 0;
+
+fail_stop_pipeline:
+	mutex_unlock(&pipe->lock);
+	media_pipeline_stop(&node->vdev.entity.pads[0]);
+
+fail_return_bufs:
+	mtk_imgsys_return_all_buffers(pipe, node, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mtk_imgsys_vb2_stop_streaming(struct vb2_queue *vq)
+{
+	struct mtk_imgsys_pipe *pipe = vb2_get_drv_priv(vq);
+	struct mtk_imgsys_video_device *node = mtk_imgsys_vbq_to_node(vq);
+	int ret;
+
+	mutex_lock(&pipe->lock);
+
+	if (pipe->streaming) {
+		ret = v4l2_subdev_call(&pipe->subdev, video, s_stream, 0);
+		if (ret)
+			dev_info(pipe->imgsys_dev->dev,
+				 "%s:%s: sub dev s_stream(0) failed(%d)\n",
+				 pipe->desc->name, node->desc->name, ret);
+	}
+
+	pipe->nodes_streaming--;
+
+	if (!pipe->nodes_streaming)
+		media_pipeline_stop(&node->vdev.entity.pads[0]);
+
+	mtk_imgsys_return_all_buffers(pipe, node, VB2_BUF_STATE_ERROR);
+
+	mutex_unlock(&pipe->lock);
+}
+
+static void mtk_imgsys_vb2_request_complete(struct vb2_buffer *vb)
+{
+	struct mtk_imgsys_video_device *node =
+					mtk_imgsys_vbq_to_node(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req,
+				   &node->ctrl_handler);
+}
+
+static const struct vb2_ops mtk_imgsys_vb2_meta_ops = {
+	.buf_queue = mtk_imgsys_vb2_buf_queue,
+	.queue_setup = mtk_imgsys_vb2_meta_queue_setup,
+	.buf_init = mtk_imgsys_vb2_meta_buf_init,
+	.buf_prepare  = mtk_imgsys_vb2_meta_buf_prepare,
+	.buf_out_validate = mtk_imgsys_vb2_buf_out_validate,
+	.buf_cleanup = mtk_imgsys_vb2_queue_meta_buf_cleanup,
+	.start_streaming = mtk_imgsys_vb2_start_streaming,
+	.stop_streaming = mtk_imgsys_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_request_complete = mtk_imgsys_vb2_request_complete,
+};
+
+static const struct vb2_ops mtk_imgsys_vb2_video_ops = {
+	.buf_queue = mtk_imgsys_vb2_buf_queue,
+	.queue_setup = mtk_imgsys_vb2_video_queue_setup,
+	.buf_init = mtk_imgsys_vb2_video_buf_init,
+	.buf_prepare  = mtk_imgsys_vb2_video_buf_prepare,
+	.buf_out_validate = mtk_imgsys_vb2_buf_out_validate,
+	.start_streaming = mtk_imgsys_vb2_start_streaming,
+	.stop_streaming = mtk_imgsys_vb2_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.buf_request_complete = mtk_imgsys_vb2_request_complete,
+};
+
+static int mtk_imgsys_video_device_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_imgsys_video_device *node =
+		container_of(ctrl->handler,
+			     struct mtk_imgsys_video_device, ctrl_handler);
+
+	switch (ctrl->id) {
+	case V4L2_CID_ROTATE:
+		node->rotation = ctrl->val;
+		break;
+	case V4L2_CID_VFLIP:
+		node->vflip = ctrl->val;
+		break;
+	case V4L2_CID_HFLIP:
+		node->hflip = ctrl->val;
+		break;
+	case V4L2_CID_MTK_IMG_RESIZE_RATIO:
+		node->resize_ratio = ctrl->val;
+		break;
+	default:
+		dev_dbg(&node->vdev.dev, "[%s] doesn't support ctrl(%d)\n",
+			node->desc->name, ctrl->id);
+		return -EINVAL;
+	}
+
+	node->rotation = ctrl->val;
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops mtk_imgsys_video_device_ctrl_ops = {
+	.s_ctrl = mtk_imgsys_video_device_s_ctrl,
+};
+
+static int mtk_imgsys_vidioc_qbuf(struct file *file, void *priv,
+				  struct v4l2_buffer *buf)
+{
+	struct mtk_imgsys_pipe *pipe = video_drvdata(file);
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+	struct vb2_buffer *vb = node->dev_q.vbq.bufs[buf->index];
+	struct mtk_imgsys_dev_buffer *dev_buf =
+					mtk_imgsys_vb2_buf_to_dev_buf(vb);
+
+	if (!dev_buf)
+		return -EFAULT;
+
+	dev_buf->fmt = node->vdev_fmt;
+	dev_buf->rotation = node->rotation;
+	dev_buf->crop.c = node->crop;
+	dev_buf->compose = node->compose;
+	dev_buf->hflip = node->hflip;
+	dev_buf->vflip = node->vflip;
+	dev_buf->resize_ratio = node->resize_ratio;
+
+	return vb2_qbuf(node->vdev.queue, &pipe->imgsys_dev->mdev, buf);
+}
+
+static int mtk_imgsys_videoc_querycap(struct file *file, void *fh,
+				      struct v4l2_capability *cap)
+{
+	struct mtk_imgsys_pipe *pipe = video_drvdata(file);
+
+	strscpy(cap->driver, pipe->desc->name, sizeof(cap->driver));
+	strscpy(cap->card, pipe->desc->name, sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info),
+		 "platform:%s", dev_name(pipe->imgsys_dev->mdev.dev));
+
+	return 0;
+}
+
+static int mtk_imgsys_videoc_try_fmt(struct file *file, void *fh,
+				     struct v4l2_format *f)
+{
+	struct mtk_imgsys_pipe *pipe = video_drvdata(file);
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+	const struct mtk_imgsys_dev_format *dev_fmt;
+	struct v4l2_format try_fmt;
+
+	memset(&try_fmt, 0, sizeof(try_fmt));
+
+	dev_fmt = mtk_imgsys_pipe_find_fmt(pipe, node,
+					   f->fmt.pix_mp.pixelformat);
+	if (!dev_fmt) {
+		dev_fmt = &node->desc->fmts[0];
+		dev_dbg(pipe->imgsys_dev->dev,
+			"%s:%s:%s: dev_fmt(%d) not found, use default(%d)\n",
+			__func__, pipe->desc->name, node->desc->name,
+			f->fmt.pix_mp.pixelformat, dev_fmt->fmt->format);
+	}
+
+	mtk_imgsys_pipe_try_fmt(node, &try_fmt, f, dev_fmt);
+	*f = try_fmt;
+
+	return 0;
+}
+
+static int mtk_imgsys_videoc_g_fmt(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+
+	*f = node->vdev_fmt;
+
+	return 0;
+}
+
+static int mtk_imgsys_videoc_s_fmt(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+	struct mtk_imgsys_pipe *pipe = video_drvdata(file);
+	const struct mtk_imgsys_dev_format *dev_fmt;
+
+	dev_fmt = mtk_imgsys_pipe_find_fmt(pipe, node,
+					   f->fmt.pix_mp.pixelformat);
+	if (!dev_fmt) {
+		dev_fmt = &node->desc->fmts[0];
+		dev_info(pipe->imgsys_dev->dev,
+			 "%s:%s:%s: dev_fmt(%d) not found, use default(%d)\n",
+			 __func__, pipe->desc->name, node->desc->name,
+			 f->fmt.pix_mp.pixelformat, dev_fmt->fmt->format);
+	}
+
+	memset(&node->vdev_fmt, 0, sizeof(node->vdev_fmt));
+
+	mtk_imgsys_pipe_try_fmt(node, &node->vdev_fmt, f, dev_fmt);
+	*f = node->vdev_fmt;
+
+	node->dev_q.dev_fmt = dev_fmt;
+	node->crop.left = 0; /* reset crop setting of nodes */
+	node->crop.top = 0;
+	node->crop.width = f->fmt.pix_mp.width;
+	node->crop.height = f->fmt.pix_mp.height;
+	node->compose.left = 0;
+	node->compose.top = 0;
+	node->compose.width = f->fmt.pix_mp.width;
+	node->compose.height = f->fmt.pix_mp.height;
+	if (node->resize_ratio_ctrl)
+		v4l2_ctrl_s_ctrl(node->resize_ratio_ctrl, 0);
+
+	return 0;
+}
+
+static int mtk_imgsys_videoc_enum_framesizes(struct file *file, void *priv,
+					     struct v4l2_frmsizeenum *sizes)
+{
+	struct mtk_imgsys_pipe *pipe = video_drvdata(file);
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+	const struct mtk_imgsys_dev_format *dev_fmt;
+
+	dev_fmt = mtk_imgsys_pipe_find_fmt(pipe, node, sizes->pixel_format);
+
+	if (!dev_fmt || sizes->index)
+		return -EINVAL;
+
+	sizes->type = node->desc->frmsizeenum->type;
+	sizes->stepwise.max_width =
+		node->desc->frmsizeenum->stepwise.max_width;
+	sizes->stepwise.min_width =
+		node->desc->frmsizeenum->stepwise.min_width;
+	sizes->stepwise.max_height =
+		node->desc->frmsizeenum->stepwise.max_height;
+	sizes->stepwise.min_height =
+		node->desc->frmsizeenum->stepwise.min_height;
+	sizes->stepwise.step_height =
+		node->desc->frmsizeenum->stepwise.step_height;
+	sizes->stepwise.step_width =
+		node->desc->frmsizeenum->stepwise.step_width;
+
+	return 0;
+}
+
+static int mtk_imgsys_videoc_enum_fmt(struct file *file, void *fh,
+				      struct v4l2_fmtdesc *f)
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+
+	if (f->index >= node->desc->num_fmts)
+		return -EINVAL;
+
+	strscpy(f->description, node->desc->description, sizeof(f->description));
+	f->pixelformat = node->desc->fmts[f->index].fmt->format;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int mtk_imgsys_meta_enum_format(struct file *file, void *fh,
+				       struct v4l2_fmtdesc *f)
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+
+	if (f->index > 0)
+		return -EINVAL;
+
+	strscpy(f->description, node->desc->description, sizeof(f->description));
+
+	f->pixelformat = node->vdev_fmt.fmt.meta.dataformat;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int mtk_imgsys_videoc_g_meta_fmt(struct file *file, void *fh,
+					struct v4l2_format *f)
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+	*f = node->vdev_fmt;
+
+	return 0;
+}
+
+static int mtk_imgsys_videoc_s_meta_fmt(struct file *file, void *fh,
+					struct v4l2_format *f)
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+	struct mtk_imgsys_pipe *pipe = video_drvdata(file);
+	const struct mtk_imgsys_dev_format *dev_fmt;
+
+	if (pipe->streaming || vb2_is_busy(&node->dev_q.vbq))
+		return -EBUSY;
+
+	dev_fmt = mtk_imgsys_pipe_find_fmt(pipe, node,
+					   f->fmt.meta.dataformat);
+	if (!dev_fmt) {
+		dev_fmt = &node->desc->fmts[0];
+		dev_info(pipe->imgsys_dev->dev,
+			 "%s:%s:%s: dev_fmt(%d) not found, use default(%d)\n",
+			 __func__, pipe->desc->name, node->desc->name,
+			 f->fmt.meta.dataformat, dev_fmt->fmt->format);
+	}
+
+	memset(&node->vdev_fmt, 0, sizeof(node->vdev_fmt));
+
+	f->fmt.meta.dataformat = dev_fmt->fmt->format;
+	f->fmt.meta.buffersize = dev_fmt->fmt->buffer_size;
+
+	node->dev_q.dev_fmt = dev_fmt;
+	node->vdev_fmt = *f;
+
+	return 0;
+}
+
+static int mtk_imgsys_g_selection(struct file *file, void *priv,
+				  struct v4l2_selection *s)
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+
+	if (!node)
+		return -EINVAL;
+
+	if ((node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+	     s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) ||
+	    (node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	     s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		s->r = node->crop;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		s->r.width = node->desc->default_width;
+		s->r.height = node->desc->default_width;
+		s->r.left = 0;
+		s->r.top = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int mtk_imgsys_s_selection(struct file *file, void *priv,
+				  struct v4l2_selection *s)
+{
+	struct mtk_imgsys_video_device *node = mtk_imgsys_file_to_node(file);
+
+	if (!node)
+		return -EINVAL;
+
+	if ((node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+	     s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) ||
+	    (node->desc->buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	     s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		node->crop = s->r;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mtk_imgsys_v4l2_video_out_ioctl_ops = {
+	.vidioc_querycap = mtk_imgsys_videoc_querycap,
+
+	.vidioc_enum_framesizes = mtk_imgsys_videoc_enum_framesizes,
+	.vidioc_enum_fmt_vid_out = mtk_imgsys_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_out_mplane = mtk_imgsys_videoc_g_fmt,
+	.vidioc_s_fmt_vid_out_mplane = mtk_imgsys_videoc_s_fmt,
+	.vidioc_try_fmt_vid_out_mplane = mtk_imgsys_videoc_try_fmt,
+
+	.vidioc_g_selection = mtk_imgsys_g_selection,
+	.vidioc_s_selection = mtk_imgsys_s_selection,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_remove_bufs = vb2_ioctl_remove_bufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = mtk_imgsys_vidioc_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_ioctl_ops mtk_imgsys_v4l2_video_cap_ioctl_ops = {
+	.vidioc_querycap = mtk_imgsys_videoc_querycap,
+
+	.vidioc_enum_framesizes = mtk_imgsys_videoc_enum_framesizes,
+	.vidioc_enum_fmt_vid_cap = mtk_imgsys_videoc_enum_fmt,
+	.vidioc_g_fmt_vid_cap_mplane = mtk_imgsys_videoc_g_fmt,
+	.vidioc_s_fmt_vid_cap_mplane = mtk_imgsys_videoc_s_fmt,
+	.vidioc_try_fmt_vid_cap_mplane = mtk_imgsys_videoc_try_fmt,
+
+	.vidioc_g_selection = mtk_imgsys_g_selection,
+	.vidioc_s_selection = mtk_imgsys_s_selection,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_remove_bufs = vb2_ioctl_remove_bufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = mtk_imgsys_vidioc_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_ioctl_ops mtk_imgsys_v4l2_meta_out_ioctl_ops = {
+	.vidioc_querycap = mtk_imgsys_videoc_querycap,
+
+	.vidioc_enum_fmt_meta_out = mtk_imgsys_meta_enum_format,
+	.vidioc_g_fmt_meta_out = mtk_imgsys_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_out = mtk_imgsys_videoc_s_meta_fmt,
+	.vidioc_try_fmt_meta_out = mtk_imgsys_videoc_g_meta_fmt,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_remove_bufs = vb2_ioctl_remove_bufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = mtk_imgsys_vidioc_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+};
+
+static const struct v4l2_ioctl_ops mtk_imgsys_v4l2_meta_cap_ioctl_ops = {
+	.vidioc_querycap = mtk_imgsys_videoc_querycap,
+
+	.vidioc_enum_fmt_meta_cap = mtk_imgsys_meta_enum_format,
+	.vidioc_g_fmt_meta_cap = mtk_imgsys_videoc_g_meta_fmt,
+	.vidioc_s_fmt_meta_cap = mtk_imgsys_videoc_s_meta_fmt,
+	.vidioc_try_fmt_meta_cap = mtk_imgsys_videoc_g_meta_fmt,
+
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_remove_bufs = vb2_ioctl_remove_bufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_qbuf = mtk_imgsys_vidioc_qbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+};
+
+static struct media_request *mtk_imgsys_request_alloc(struct media_device *mdev)
+{
+	struct mtk_imgsys_request *req;
+	struct mtk_imgsys_pipe *pipe;
+
+	pipe = &mtk_imgsys_mdev_to_dev(mdev)->imgsys_pipe;
+	req = vzalloc(sizeof(*req));
+	if (!req)
+		return NULL;
+
+	req->buf_map = vzalloc(pipe->desc->total_queues *
+			       sizeof(struct mtk_imgsys_dev_buffer *));
+	if (!req->buf_map)
+		goto error;
+
+	return &req->req;
+
+error:
+	vfree(req);
+	return NULL;
+}
+
+static void mtk_imgsys_request_free(struct media_request *req)
+{
+	struct mtk_imgsys_request *imgsys_req =
+					mtk_imgsys_media_req_to_imgsys_req(req);
+
+	vfree(imgsys_req->buf_map);
+	vfree(imgsys_req);
+}
+
+static int mtk_imgsys_vb2_request_validate(struct media_request *req)
+{
+	struct media_request_object *obj;
+	struct mtk_imgsys_dev *imgsys_dev = mtk_imgsys_mdev_to_dev(req->mdev);
+	struct mtk_imgsys_request *imgsys_req =
+					mtk_imgsys_media_req_to_imgsys_req(req);
+	struct mtk_imgsys_pipe *pipe = NULL;
+	struct mtk_imgsys_pipe *pipe_prev = NULL;
+	struct mtk_imgsys_dev_buffer **buf_map = imgsys_req->buf_map;
+	int buf_count = 0;
+	int i;
+
+	for (i = 0; i < imgsys_dev->imgsys_pipe.desc->total_queues; i++)
+		buf_map[i] = NULL;
+
+	list_for_each_entry(obj, &req->objects, list) {
+		struct vb2_buffer *vb;
+		struct mtk_imgsys_dev_buffer *dev_buf;
+		struct mtk_imgsys_video_device *node;
+
+		if (!vb2_request_object_is_buffer(obj))
+			continue;
+
+		vb = container_of(obj, struct vb2_buffer, req_obj);
+		node = mtk_imgsys_vbq_to_node(vb->vb2_queue);
+		pipe = vb2_get_drv_priv(vb->vb2_queue);
+		if (pipe_prev && pipe != pipe_prev) {
+			dev_dbg(imgsys_dev->dev,
+				"%s:%s:%s:found buf of different pipes(%p,%p)\n",
+				__func__, node->desc->name,
+				req->debug_str, pipe, pipe_prev);
+			return -EINVAL;
+		}
+
+		pipe_prev = pipe;
+		dev_buf = mtk_imgsys_vb2_buf_to_dev_buf(vb);
+		imgsys_req->buf_map[node->desc->id] = dev_buf;
+		buf_count++;
+
+		dev_dbg(pipe->imgsys_dev->dev,
+			"%s:%s: added buf(%p) to pipe-job(%p), buf_count(%d)\n",
+			pipe->desc->name, node->desc->name, dev_buf,
+			imgsys_req, buf_count);
+	}
+
+	if (!pipe) {
+		dev_dbg(imgsys_dev->dev,
+			"%s: no buffer in the request(%p)\n",
+			req->debug_str, req);
+
+		return -ENOENT;
+	}
+
+	atomic_set(&imgsys_req->buf_count, buf_count);
+	imgsys_req->id = mtk_imgsys_pipe_next_job_id(pipe);
+	imgsys_req->imgsys_pipe = pipe;
+	mtk_imgsys_pipe_debug_job(pipe, imgsys_req);
+
+	return vb2_request_validate(req);
+}
+
+static void mtk_imgsys_vb2_request_queue(struct media_request *req)
+{
+	struct mtk_imgsys_request *imgsys_req =
+					mtk_imgsys_media_req_to_imgsys_req(req);
+	struct mtk_imgsys_pipe *pipe = imgsys_req->imgsys_pipe;
+	unsigned long flag;
+
+	spin_lock_irqsave(&pipe->pending_job_lock, flag);
+	list_add_tail(&imgsys_req->list, &pipe->pipe_job_pending_list);
+	pipe->num_pending_jobs++;
+	dev_dbg(req->mdev->dev,
+		"%s:%s: current num of pending jobs(%d)\n",
+		__func__, pipe->desc->name, pipe->num_pending_jobs);
+	spin_unlock_irqrestore(&pipe->pending_job_lock, flag);
+	vb2_request_queue(req);
+}
+
+static const struct media_device_ops mtk_imgsys_media_req_ops = {
+	.req_validate = mtk_imgsys_vb2_request_validate,
+	.req_queue = mtk_imgsys_vb2_request_queue,
+	.req_alloc = mtk_imgsys_request_alloc,
+	.req_free = mtk_imgsys_request_free,
+};
+
+static const struct v4l2_file_operations mtk_imgsys_v4l2_fops = {
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl32 = v4l2_compat_ioctl32,
+#endif
+};
+
+static int mtk_imgsys_dev_media_register(struct device *dev,
+					 struct media_device *media_dev)
+{
+	int ret;
+
+	media_dev->dev = dev;
+	strscpy(media_dev->model, MTK_IMGSYS_MEDIA_MODEL_NAME, sizeof(media_dev->model));
+	snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
+		 "platform:%s", dev_name(dev));
+	media_dev->hw_revision = 0;
+	media_dev->ops = &mtk_imgsys_media_req_ops;
+	media_device_init(media_dev);
+
+	ret = media_device_register(media_dev);
+	if (ret)
+		media_device_cleanup(media_dev);
+
+	return ret;
+}
+
+static int mtk_imgsys_video_device_v4l2_register(struct mtk_imgsys_pipe *pipe,
+						 struct mtk_imgsys_video_device *node)
+{
+	struct vb2_queue *vbq = &node->dev_q.vbq;
+	struct video_device *vdev = &node->vdev;
+	struct media_link *link;
+	int ret;
+
+	switch (node->desc->buf_type) {
+	case V4L2_BUF_TYPE_META_OUTPUT:
+		vbq->ops = &mtk_imgsys_vb2_meta_ops;
+		vdev->ioctl_ops = &mtk_imgsys_v4l2_meta_out_ioctl_ops;
+		break;
+	case V4L2_BUF_TYPE_META_CAPTURE:
+		vbq->ops = &mtk_imgsys_vb2_meta_ops;
+		vdev->ioctl_ops = &mtk_imgsys_v4l2_meta_cap_ioctl_ops;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
+		vbq->ops = &mtk_imgsys_vb2_video_ops;
+		vdev->ioctl_ops = &mtk_imgsys_v4l2_video_out_ioctl_ops;
+		break;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
+		vbq->ops = &mtk_imgsys_vb2_video_ops;
+		vdev->ioctl_ops = &mtk_imgsys_v4l2_video_cap_ioctl_ops;
+		break;
+	default:
+		dev_info(pipe->imgsys_dev->dev,
+			 "unexpected buf_type %u\n", node->desc->buf_type);
+		return -EFAULT;
+	}
+
+	mutex_init(&node->dev_q.lock);
+	vdev->device_caps = node->desc->cap;
+	node->vdev_fmt.type = node->desc->buf_type;
+	mtk_imgsys_pipe_load_default_fmt(pipe, node, &node->vdev_fmt);
+
+	ret = media_entity_pads_init(&vdev->entity, 1, &node->vdev_pad);
+	if (ret) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "failed initialize media entity (%d)\n", ret);
+		goto err_mutex_destroy;
+	}
+
+	node->vdev_pad.flags = V4L2_TYPE_IS_OUTPUT(node->desc->buf_type) ?
+		MEDIA_PAD_FL_SOURCE : MEDIA_PAD_FL_SINK;
+
+	vbq->type = node->vdev_fmt.type;
+	vbq->io_modes = VB2_MMAP | VB2_DMABUF;
+	vbq->mem_ops = &vb2_dma_contig_memops;
+	vbq->supports_requests = true;
+	vbq->requires_requests = true;
+	vbq->buf_struct_size = sizeof(struct mtk_imgsys_dev_buffer);
+	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	vbq->min_queued_buffers = 0;
+	vbq->drv_priv = pipe;
+	vbq->lock = &node->dev_q.lock;
+	vbq->max_num_buffers = IMGSYS_MAX_BUFFERS;
+
+	ret = vb2_queue_init(vbq);
+	if (ret) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "%s:%s:%s: failed to init vb2 queue(%d)\n",
+			 __func__, pipe->desc->name, node->desc->name,
+			 ret);
+		goto err_media_entity_cleanup;
+	}
+
+	strscpy(vbq->name, node->desc->name, sizeof(vbq->name));
+
+	snprintf(vdev->name, sizeof(vdev->name), "%s %s", pipe->desc->name,
+		 node->desc->name);
+	vdev->entity.name = vdev->name;
+	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
+	vdev->entity.ops = NULL;
+	vdev->release = video_device_release_empty;
+	vdev->fops = &mtk_imgsys_v4l2_fops;
+	vdev->lock = &node->dev_q.lock;
+	if (node->desc->supports_ctrls)
+		vdev->ctrl_handler = &node->ctrl_handler;
+	else
+		vdev->ctrl_handler = NULL;
+	vdev->v4l2_dev = &pipe->imgsys_dev->v4l2_dev;
+	vdev->queue = &node->dev_q.vbq;
+	vdev->vfl_dir = V4L2_TYPE_IS_OUTPUT(node->desc->buf_type) ?
+		VFL_DIR_TX : VFL_DIR_RX;
+
+	vdev->queue->dev = pipe->imgsys_dev->dev;
+
+	if (node->desc->smem_alloc) {
+		vdev->queue->dev = pipe->imgsys_dev->smem_dev;
+		dev_dbg(pipe->imgsys_dev->dev,
+			"%s:%s: select smem_vb2_alloc_ctx(%p)\n",
+			pipe->desc->name, node->desc->name,
+			vdev->queue->dev);
+	} else {
+		vdev->queue->dev = pipe->imgsys_dev->dev;
+		dev_dbg(pipe->imgsys_dev->dev,
+			"%s:%s: select default_vb2_alloc_ctx(%p)\n",
+			pipe->desc->name, node->desc->name,
+			pipe->imgsys_dev->dev);
+	}
+
+	video_set_drvdata(vdev, pipe);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "failed to register video device (%d)\n", ret);
+		goto err_vb2_queue_release;
+	}
+	dev_dbg(pipe->imgsys_dev->dev, "registered vdev: %s\n",
+		vdev->name);
+
+	if (V4L2_TYPE_IS_OUTPUT(node->desc->buf_type))
+		ret = media_create_pad_link(&vdev->entity, 0,
+					    &pipe->subdev.entity,
+					    node->desc->id, node->flags);
+	else
+		ret = media_create_pad_link(&pipe->subdev.entity,
+					    node->desc->id, &vdev->entity,
+					    0, node->flags);
+	if (ret)
+		goto err_video_unregister_device;
+
+	vdev->intf_devnode = media_devnode_create(&pipe->imgsys_dev->mdev,
+						  MEDIA_INTF_T_V4L_VIDEO, 0,
+						  VIDEO_MAJOR, vdev->minor);
+	if (!vdev->intf_devnode) {
+		ret = -ENOMEM;
+		goto err_rm_links;
+	}
+
+	link = media_create_intf_link(&vdev->entity,
+				      &vdev->intf_devnode->intf,
+				      node->flags);
+	if (!link) {
+		ret = -ENOMEM;
+		goto err_rm_devnode;
+	}
+
+	return 0;
+
+err_rm_devnode:
+	media_devnode_remove(vdev->intf_devnode);
+
+err_rm_links:
+	media_entity_remove_links(&vdev->entity);
+
+err_video_unregister_device:
+	video_unregister_device(vdev);
+
+err_vb2_queue_release:
+	vb2_queue_release(&node->dev_q.vbq);
+
+err_media_entity_cleanup:
+	media_entity_cleanup(&node->vdev.entity);
+
+err_mutex_destroy:
+	mutex_destroy(&node->dev_q.lock);
+
+	return ret;
+}
+
+/******************************************************************************
+ * @array img_resize_ratio_menu
+ * @brief IMGSYS hardware supports multiple resizers.
+ *        - Any Ratio: Allows for any resize ratio, including
+ *          down 2, down 4, and down 42.
+ *        - Down 4: Specifically for downscaling by a factor of 4.
+ *        - Down 2: Specifically for downscaling by a factor of 2.
+ *        - Down42: Used for downscaling by a factor of 4 on the
+ *          first use, and by a factor of 2 on subsequent uses.
+ *        - NULL: Indicates the end of the menu options
+ ******************************************************************************/
+static const char * const img_resize_ratio_menu[] = {
+	"Any Ratio",
+	"Down 4",
+	"Down 2",
+	"Down 42",
+	NULL,
+};
+
+static const struct v4l2_ctrl_config cfg_mtk_resize_ratio = {
+	.ops = &mtk_imgsys_video_device_ctrl_ops,
+	.id = V4L2_CID_MTK_IMG_RESIZE_RATIO,
+	.name = "Image resize ratio",
+	.type = V4L2_CTRL_TYPE_MENU,
+	.max = 3,
+	.def = 0,
+	.qmenu = img_resize_ratio_menu,
+};
+
+static int mtk_imgsys_pipe_v4l2_ctrl_init(struct mtk_imgsys_pipe *imgsys_pipe)
+{
+	int i, ret;
+	struct mtk_imgsys_video_device *ctrl_node;
+
+	for (i = 0; i < MTK_IMGSYS_VIDEO_NODE_ID_TOTAL_NUM; i++) {
+		ctrl_node = &imgsys_pipe->nodes[i];
+		if (!ctrl_node->desc->supports_ctrls)
+			continue;
+
+		v4l2_ctrl_handler_init(&ctrl_node->ctrl_handler, 4);
+		v4l2_ctrl_new_std(&ctrl_node->ctrl_handler,
+				  &mtk_imgsys_video_device_ctrl_ops, V4L2_CID_ROTATE,
+				  0, 270, 90, 0);
+		v4l2_ctrl_new_std(&ctrl_node->ctrl_handler,
+				  &mtk_imgsys_video_device_ctrl_ops, V4L2_CID_VFLIP,
+				  0, 1, 1, 0);
+		v4l2_ctrl_new_std(&ctrl_node->ctrl_handler,
+				  &mtk_imgsys_video_device_ctrl_ops, V4L2_CID_HFLIP,
+				  0, 1, 1, 0);
+		ctrl_node->resize_ratio_ctrl =
+			v4l2_ctrl_new_custom(&ctrl_node->ctrl_handler,
+					     &cfg_mtk_resize_ratio, NULL);
+		ret = ctrl_node->ctrl_handler.error;
+		if (ret) {
+			dev_info(imgsys_pipe->imgsys_dev->dev,
+				 "%s create rotate ctrl failed:(%d)",
+				 ctrl_node->desc->name, ret);
+			goto err_free_ctrl_handlers;
+		}
+	}
+
+	return 0;
+
+err_free_ctrl_handlers:
+	for (; i >= 0; i--) {
+		ctrl_node = &imgsys_pipe->nodes[i];
+		if (!ctrl_node->desc->supports_ctrls)
+			continue;
+		v4l2_ctrl_handler_free(&ctrl_node->ctrl_handler);
+	}
+
+	return ret;
+}
+
+static void mtk_imgsys_pipe_v4l2_ctrl_release(struct mtk_imgsys_pipe *imgsys_pipe)
+{
+	struct mtk_imgsys_video_device *vdev;
+	int i;
+
+	for (i = 0; i < imgsys_pipe->desc->total_queues; ++i) {
+		vdev = &imgsys_pipe->nodes[i];
+		if (vdev->desc->supports_ctrls)
+			v4l2_ctrl_handler_free(&vdev->ctrl_handler);
+	}
+}
+
+static int mtk_imgsys_pipe_v4l2_register(struct mtk_imgsys_pipe *pipe,
+					 struct media_device *media_dev,
+					 struct v4l2_device *v4l2_dev)
+{
+	int i, ret;
+
+	ret = mtk_imgsys_pipe_v4l2_ctrl_init(pipe);
+	if (ret) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "%s: failed(%d) to initialize ctrls\n",
+			 pipe->desc->name, ret);
+
+		return ret;
+	}
+
+	pipe->streaming = 0;
+
+	/* Initialize subdev media entity */
+	pipe->subdev_pads = devm_kcalloc(pipe->imgsys_dev->dev,
+					 pipe->desc->total_queues,
+					 sizeof(*pipe->subdev_pads),
+					 GFP_KERNEL);
+	if (!pipe->subdev_pads) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "failed to alloc pipe->subdev_pads (%d)\n", ret);
+		ret = -ENOMEM;
+		goto err_release_ctrl;
+	}
+	ret = media_entity_pads_init(&pipe->subdev.entity,
+				     pipe->desc->total_queues,
+				     pipe->subdev_pads);
+	if (ret) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "failed initialize subdev media entity (%d)\n", ret);
+		goto err_free_subdev_pads;
+	}
+
+	/* Initialize subdev */
+	v4l2_subdev_init(&pipe->subdev, &mtk_imgsys_subdev_ops);
+
+	pipe->subdev.entity.function =
+		MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	pipe->subdev.entity.ops = &mtk_imgsys_media_ops;
+	pipe->subdev.flags =
+		V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	pipe->subdev.ctrl_handler = NULL;
+
+	for (i = 0; i < pipe->desc->total_queues; i++)
+		pipe->subdev_pads[pipe->nodes[i].desc->id].flags =
+			V4L2_TYPE_IS_OUTPUT(pipe->nodes[i].desc->buf_type) ?
+			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	snprintf(pipe->subdev.name, sizeof(pipe->subdev.name),
+		 "%s", pipe->desc->name);
+	v4l2_set_subdevdata(&pipe->subdev, pipe);
+
+	ret = v4l2_device_register_subdev(&pipe->imgsys_dev->v4l2_dev,
+					  &pipe->subdev);
+	if (ret) {
+		dev_info(pipe->imgsys_dev->dev,
+			 "failed initialize subdev (%d)\n", ret);
+		goto err_media_entity_cleanup;
+	}
+
+	dev_dbg(pipe->imgsys_dev->dev,
+		"register subdev: %s, ctrl_handler %p\n",
+		 pipe->subdev.name, pipe->subdev.ctrl_handler);
+
+	/* Create video nodes and links */
+	for (i = 0; i < pipe->desc->total_queues; i++) {
+		ret =
+			mtk_imgsys_video_device_v4l2_register(pipe,
+							      &pipe->nodes[i]);
+		if (ret)
+			goto err_unregister_subdev;
+	}
+
+	return 0;
+
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(&pipe->subdev);
+
+err_media_entity_cleanup:
+	media_entity_cleanup(&pipe->subdev.entity);
+
+err_free_subdev_pads:
+	devm_kfree(pipe->imgsys_dev->dev, pipe->subdev_pads);
+
+err_release_ctrl:
+	mtk_imgsys_pipe_v4l2_ctrl_release(pipe);
+
+	return ret;
+}
+
+static void mtk_imgsys_pipe_v4l2_unregister(struct mtk_imgsys_pipe *pipe)
+{
+	unsigned int i;
+
+	for (i = 0; i < pipe->desc->total_queues; i++) {
+		video_unregister_device(&pipe->nodes[i].vdev);
+		vb2_queue_release(&pipe->nodes[i].dev_q.vbq);
+		media_entity_cleanup(&pipe->nodes[i].vdev.entity);
+		mutex_destroy(&pipe->nodes[i].dev_q.lock);
+	}
+
+	v4l2_device_unregister_subdev(&pipe->subdev);
+	media_entity_cleanup(&pipe->subdev.entity);
+	mtk_imgsys_pipe_v4l2_ctrl_release(pipe);
+}
+
+static void mtk_imgsys_dev_media_unregister(struct mtk_imgsys_dev *imgsys_dev)
+{
+	media_device_unregister(&imgsys_dev->mdev);
+	media_device_cleanup(&imgsys_dev->mdev);
+}
+
+static int mtk_imgsys_dev_v4l2_init(struct mtk_imgsys_dev *imgsys_dev)
+{
+	struct media_device *media_dev = &imgsys_dev->mdev;
+	struct v4l2_device *v4l2_dev = &imgsys_dev->v4l2_dev;
+	int ret;
+
+	ret = mtk_imgsys_dev_media_register(imgsys_dev->dev, media_dev);
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "%s: media device register failed(%d)\n",
+			 __func__, ret);
+		return ret;
+	}
+
+	v4l2_dev->mdev = media_dev;
+	v4l2_dev->ctrl_handler = NULL;
+
+	ret = v4l2_device_register(imgsys_dev->dev, v4l2_dev);
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "%s: v4l2 device register failed(%d)\n",
+			 __func__, ret);
+		goto err_release_media_device;
+	}
+
+	ret = mtk_imgsys_pipe_init(imgsys_dev,
+				   &imgsys_dev->imgsys_pipe,
+				   imgsys_dev->cust_pipes);
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "%s: init failed(%d)\n",
+			 imgsys_dev->imgsys_pipe.desc->name, ret);
+		goto err_release_pipe;
+	}
+
+	ret = mtk_imgsys_pipe_v4l2_register(&imgsys_dev->imgsys_pipe, &imgsys_dev->mdev,
+					    &imgsys_dev->v4l2_dev);
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "%s: failed(%d) to create V4L2 devices\n",
+			 imgsys_dev->imgsys_pipe.desc->name, ret);
+		goto err_register_pipe;
+	}
+
+	ret = v4l2_device_register_subdev_nodes(&imgsys_dev->v4l2_dev);
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "failed to register subdevs (%d)\n", ret);
+		goto err_register_pipe;
+	}
+
+	return 0;
+
+err_register_pipe:
+	mtk_imgsys_pipe_v4l2_unregister(&imgsys_dev->imgsys_pipe);
+err_release_pipe:
+	mtk_imgsys_pipe_release(&imgsys_dev->imgsys_pipe);
+
+	v4l2_device_unregister(v4l2_dev);
+
+err_release_media_device:
+	mtk_imgsys_dev_media_unregister(imgsys_dev);
+
+	return ret;
+}
+
+static void mtk_imgsys_dev_v4l2_release(struct mtk_imgsys_dev *imgsys_dev)
+{
+	mtk_imgsys_pipe_v4l2_unregister(&imgsys_dev->imgsys_pipe);
+	mtk_imgsys_pipe_release(&imgsys_dev->imgsys_pipe);
+	v4l2_device_unregister(&imgsys_dev->v4l2_dev);
+	mtk_imgsys_dev_media_unregister(imgsys_dev);
+}
+
+static int mtk_imgsys_of_rproc(struct mtk_imgsys_dev *imgsys,
+			       struct platform_device *pdev)
+{
+	struct device *dev = imgsys->dev;
+
+	imgsys->scp = scp_get(pdev);
+	if (!imgsys->scp) {
+		dev_err(dev, "failed to get scp device\n");
+		return -ENODEV;
+	}
+
+	imgsys->rproc_handle = scp_get_rproc(imgsys->scp);
+	dev_dbg(dev, "imgsys rproc_phandle: 0x%pK\n", imgsys->rproc_handle);
+	imgsys->smem_dev = scp_get_device(imgsys->scp);
+
+	return 0;
+}
+
+static int mtk_imgsys_probe(struct platform_device *pdev)
+{
+	struct mtk_imgsys_dev *imgsys_dev;
+	struct device **larb_devs;
+	struct device_link *link;
+	const struct cust_data *data;
+	struct resource *res;
+	int larbs_num, i;
+	int ret;
+
+	imgsys_dev = devm_kzalloc(&pdev->dev, sizeof(*imgsys_dev), GFP_KERNEL);
+	if (!imgsys_dev)
+		return -ENOMEM;
+
+	data = of_device_get_match_data(&pdev->dev);
+
+	init_imgsys_pipeline(data);
+
+	imgsys_dev->cust_pipes = data->pipe_settings;
+	imgsys_dev->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get memory resource\n");
+		return -ENODEV;
+	}
+	imgsys_dev->imgsys_resource = res;
+
+	dev_set_drvdata(&pdev->dev, imgsys_dev);
+
+	imgsys_dev->num_mods = data->mod_num;
+
+	/* Get Clocks */
+	imgsys_dev->clks = data->clks;
+	imgsys_dev->num_clks = data->clk_num;
+	ret = devm_clk_bulk_get(&pdev->dev, imgsys_dev->num_clks,
+				imgsys_dev->clks);
+	if (ret)
+		dev_info(&pdev->dev, "Failed to get clks:%d\n", ret);
+
+	/* DMA configuration */
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34)))
+		dev_info(&pdev->dev, "%s:No DMA available\n", __func__);
+
+	if (!pdev->dev.dma_parms) {
+		pdev->dev.dma_parms =
+			devm_kzalloc(imgsys_dev->dev, sizeof(*pdev->dev.dma_parms), GFP_KERNEL);
+	}
+	if (pdev->dev.dma_parms)
+		dma_set_max_seg_size(imgsys_dev->dev, UINT_MAX);
+
+	/* Get LARB Information */
+	larbs_num = of_count_phandle_with_args(pdev->dev.of_node,
+					       "mediatek,larbs", NULL);
+	dev_dbg(imgsys_dev->dev, "%d larbs to be added", larbs_num);
+	larb_devs = devm_kzalloc(&pdev->dev, sizeof(larb_devs) * larbs_num, GFP_KERNEL);
+	if (!larb_devs) {
+		ret = -ENOMEM;
+		goto err_free_dev_alloc;
+	}
+	for (i = 0; i < larbs_num; i++) {
+		struct device_node *larb_node;
+		struct platform_device *larb_pdev;
+
+		larb_node = of_parse_phandle(pdev->dev.of_node, "mediatek,larbs", i);
+		if (!larb_node) {
+			dev_info(imgsys_dev->dev,
+				 "%d larb node not found\n", i);
+			continue;
+		}
+
+		larb_pdev = of_find_device_by_node(larb_node);
+		if (!larb_pdev) {
+			of_node_put(larb_node);
+			dev_info(imgsys_dev->dev,
+				 "%d larb device not found\n", i);
+			continue;
+		}
+		of_node_put(larb_node);
+
+		link = device_link_add(&pdev->dev, &larb_pdev->dev,
+				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+		if (!link)
+			dev_info(imgsys_dev->dev, "unable to link SMI LARB idx %d\n", i);
+
+		larb_devs[i] = &larb_pdev->dev;
+	}
+	imgsys_dev->larbs = larb_devs;
+	imgsys_dev->num_larbs = larbs_num;
+
+	/* Register rproc device */
+	if (mtk_imgsys_of_rproc(imgsys_dev, pdev)) {
+		ret = -EFAULT;
+		goto err_free_larb_alloc;
+	}
+
+	/* Imgsys device initialization */
+	ret = mtk_imgsys_dev_v4l2_init(imgsys_dev);
+	if (ret) {
+		dev_info(&pdev->dev, "v4l2 init failed(%d)\n", ret);
+
+		goto err_free_larb_alloc;
+	}
+
+	/* Enable power*/
+	pm_runtime_set_autosuspend_delay(&pdev->dev, IMGSYS_SUSPEND_TIME);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+
+err_free_larb_alloc:
+	devm_kfree(&pdev->dev, imgsys_dev->larbs);
+err_free_dev_alloc:
+	devm_kfree(&pdev->dev, imgsys_dev);
+	return ret;
+}
+
+static void mtk_imgsys_remove(struct platform_device *pdev)
+{
+	struct mtk_imgsys_dev *imgsys_dev = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_disable(&pdev->dev);
+	mtk_imgsys_dev_v4l2_release(imgsys_dev);
+	devm_kfree(&pdev->dev, imgsys_dev->larbs);
+	devm_kfree(&pdev->dev, imgsys_dev);
+}
+
+static int __maybe_unused mtk_imgsys_pm_suspend(struct device *dev)
+{
+	int ret;
+
+	if (pm_runtime_suspended(dev)) {
+		dev_info(dev, "%s: pm_runtime_suspended is true, no action\n",
+			 __func__);
+		return 0;
+	}
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_info(dev, "%s: pm_runtime_force_suspend failed:(%d)\n",
+			 __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused mtk_imgsys_pm_resume(struct device *dev)
+{
+	int ret;
+
+	if (pm_runtime_suspended(dev)) {
+		dev_info(dev, "%s: pm_runtime_suspended is true, no action\n",
+			 __func__);
+		return 0;
+	}
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_info(dev, "%s: pm_runtime_force_resume failed:(%d)\n",
+			 __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused mtk_imgsys_runtime_suspend(struct device *dev)
+{
+	struct mtk_imgsys_dev *imgsys_dev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(imgsys_dev->num_clks,
+				   imgsys_dev->clks);
+
+	return 0;
+}
+
+static int __maybe_unused mtk_imgsys_runtime_resume(struct device *dev)
+{
+	struct mtk_imgsys_dev *imgsys_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(imgsys_dev->num_clks,
+				      imgsys_dev->clks);
+	if (ret) {
+		dev_info(imgsys_dev->dev,
+			 "failed to enable dip clks(%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtk_imgsys_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_imgsys_pm_suspend, mtk_imgsys_pm_resume)
+	SET_RUNTIME_PM_OPS(mtk_imgsys_runtime_suspend,
+			   mtk_imgsys_runtime_resume, NULL)
+};
+
+static struct clk_bulk_data imgsys_isp7_clks[] = {
+	{ .id = "IMGSYS_CG_IMG_TRAW0" },
+	{ .id = "IMGSYS_CG_IMG_TRAW1" },
+	{ .id = "IMGSYS_CG_IMG_VCORE_GALS" },
+	{ .id = "IMGSYS_CG_IMG_DIP0" },
+	{ .id = "IMGSYS_CG_IMG_WPE0" },
+	{ .id = "IMGSYS_CG_IMG_WPE1" },
+	{ .id = "IMGSYS_CG_IMG_WPE2" },
+	{ .id = "IMGSYS_CG_IMG_GALS" },
+	{ .id = "DIP_TOP_DIP_TOP" },
+	{ .id = "DIP_NR_DIP_NR" },
+	{ .id = "WPE1_CG_DIP1_WPE" },
+	{ .id = "WPE2_CG_DIP1_WPE" },
+	{ .id = "WPE3_CG_DIP1_WPE" },
+	{ .id = "ME_CG_IPE" },
+	{ .id = "ME_CG_IPE_TOP" },
+	{ .id = "ME_CG" },
+	{ .id = "ME_CG_LARB12" },
+};
+
+static const struct cust_data imgsys_data[] = {
+	[0] = {
+		.clks = imgsys_isp7_clks,
+		.clk_num = ARRAY_SIZE(imgsys_isp7_clks),
+		.module_pipes = module_pipe_isp7,
+		.mod_num = ARRAY_SIZE(module_pipe_isp7),
+		.pipe_settings = pipe_settings_isp7,
+		.pipe_num = ARRAY_SIZE(pipe_settings_isp7),
+	},
+};
+
+static const struct of_device_id mtk_imgsys_of_match[] = {
+	{ .compatible = "mediatek,mt8188-isp-imgsys", .data = (void *)&imgsys_data},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_imgsys_of_match);
+
+static struct platform_driver mtk_imgsys_driver = {
+	.probe   = mtk_imgsys_probe,
+	.remove  = mtk_imgsys_remove,
+	.driver  = {
+		.name = "mtk-imgsys",
+		.owner	= THIS_MODULE,
+		.pm = &mtk_imgsys_pm_ops,
+		.of_match_table = of_match_ptr(mtk_imgsys_of_match),
+	}
+};
+
+module_platform_driver(mtk_imgsys_driver);
+
+MODULE_AUTHOR("Frederic Chen <frederic.chen@mediatek.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek IMGSYS driver");
+
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h
new file mode 100644
index 000000000000..4a418099d7c0
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-vnode_id.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+#ifndef _MTK_IMGSYS_VNODE_ID_H_
+#define _MTK_IMGSYS_VNODE_ID_H_
+
+/**
+ * enum imgsys_video_nodes_id - Enumeration of video node IDs for image system
+ *
+ * This enumeration defines the unique identifiers for various video nodes
+ * used in the image processing system. Each ID corresponds to a specific
+ * video node that can be utilized for different functionalities.
+ */
+enum imgsys_video_nodes_id {
+	/* IMGSYS_MODULE_TRAW */
+	MTK_IMGSYS_VIDEO_NODE_ID_TIMGI_OUT = 0,
+	MTK_IMGSYS_VIDEO_NODE_ID_METAI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_PDC_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_TYUVO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TYUV2O_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TYUV3O_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TYUV4O_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TYUV5O_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_FEO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TIMGO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_IMGSTATO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_XTMEO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_XTFDO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_XTADLDBGO_CAPTURE,
+	/* IMGSYS_MODULE_DIP */
+	MTK_IMGSYS_VIDEO_NODE_ID_IMGI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_VIPI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_REC_DSI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_REC_DPI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_CNR_BLURMAPI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_LFEI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_RFEI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRSI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRWI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRMI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRCI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRLI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRVBI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_IMG2O_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_IMG3O_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_IMG4O_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_FMO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRSO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRWO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TNRMO_CAPTURE,
+	/* IMGSYS_MODULE_PQDIP */
+	MTK_IMGSYS_VIDEO_NODE_ID_PIMGI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_WROT_A_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_WROT_B_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TCCSO_A_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_TCCSO_B_CAPTURE,
+	/* IMGSYS_MODULE_ME */
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL0IMG0_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL0IMG1_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL1IMG0_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL1IMG1_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEIMGSTATS_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL0RMV_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL1RMV_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL0FMB_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL1FMB_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEMIL_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEMMGMIL_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL0WMV_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL1WMV_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MECONF_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEWMAP_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEFMV_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEFST_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MELMI_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL0WFMB_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_MEL1WFMB_CAPTURE,
+	/* IMGSYS_MODULE_WPE */
+	MTK_IMGSYS_VIDEO_NODE_ID_WWPEI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_WVECI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_WPSP_COEFI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_WWPEO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_WMSKO_CAPTURE,
+	/* IMGSYS_MODULE_WPE_TNR */
+	MTK_IMGSYS_VIDEO_NODE_ID_WTWPEI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_WTVECI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_WTPSP_COEFI_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_WTWPEO_CAPTURE,
+	MTK_IMGSYS_VIDEO_NODE_ID_WTMSKO_CAPTURE,
+	/* other module video nodes to be added */
+	MTK_IMGSYS_VIDEO_NODE_ID_TUNING_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_CTRLMETA_OUT,
+	MTK_IMGSYS_VIDEO_NODE_ID_TOTAL_NUM,
+};
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h
new file mode 100644
index 000000000000..5a6f3220ab6b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys_v4l2_vnode.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ *
+ * Author: Frederic Chen <frederic.chen@mediatek.com>
+ *
+ */
+#ifndef _MTK_IMGSYS_V4L2_VNODE_H_
+#define _MTK_IMGSYS_V4L2_VNODE_H_
+
+#include "mtk_imgsys-of.h"
+#include "mtk_imgsys-dev.h"
+#include "mtk_imgsys-formats.h"
+#include "modules/mtk_dip_v4l2_vnode.h"
+#include "modules/mtk_traw_v4l2_vnode.h"
+#include "modules/mtk_pqdip_v4l2_vnode.h"
+#include "modules/mtk_wpe_v4l2_vnode.h"
+#include "modules/mtk_me_v4l2_vnode.h"
+
+/**
+ * enum mtk_imgsys_module_id - Enumeration of image system module IDs
+ * @IMGSYS_MODULE_TRAW: Module for TRAW processing.
+ * @IMGSYS_MODULE_DIP: Module for DIP processing.
+ * @IMGSYS_MODULE_PQDIP: Module for PQDIP processing.
+ * @IMGSYS_MODULE_ME: Module for Motion Estimation (ME).
+ * @IMGSYS_MODULE_WPE: Module for WPE processing.
+ * @IMGSYS_MODULE_MAIN: Main module for image system.
+ * @IMGSYS_MODULE_NUM: Total number of image system modules.
+ */
+enum mtk_imgsys_module_id {
+	IMGSYS_MODULE_TRAW = 0,
+	IMGSYS_MODULE_DIP,
+	IMGSYS_MODULE_PQDIP,
+	IMGSYS_MODULE_ME,
+	IMGSYS_MODULE_WPE,
+	IMGSYS_MODULE_MAIN,
+	IMGSYS_MODULE_NUM,
+};
+
+/**
+ * struct mtk_imgsys_mod_pipe_desc - Pipe description for image system modules
+ * @vnode_desc: Pointer to the node descriptor array
+ * @node_num: Number of nodes in the descriptor array
+ *
+ * This structure defines the pipe description for each module in the MediaTek
+ * image system. It includes a pointer to the node descriptor array and the
+ * number of nodes in that array.
+ */
+static const struct mtk_imgsys_mod_pipe_desc module_pipe_isp7[] = {
+	[IMGSYS_MODULE_TRAW] = {
+		.vnode_desc = traw_setting,
+		.node_num = ARRAY_SIZE(traw_setting),
+	},
+	[IMGSYS_MODULE_DIP] = {
+		.vnode_desc = dip_setting,
+		.node_num = ARRAY_SIZE(dip_setting),
+	},
+	[IMGSYS_MODULE_PQDIP] = {
+		.vnode_desc = pqdip_setting,
+		.node_num = ARRAY_SIZE(pqdip_setting),
+	},
+	[IMGSYS_MODULE_ME] = {
+		.vnode_desc = me_setting,
+		.node_num = ARRAY_SIZE(me_setting),
+	},
+	[IMGSYS_MODULE_WPE] = {
+		.vnode_desc = wpe_setting,
+		.node_num = ARRAY_SIZE(wpe_setting),
+	},
+	[IMGSYS_MODULE_MAIN] = {
+		.vnode_desc = NULL,
+		.node_num = 0,
+	}
+};
+
+/* Tuning formats for MediaTek Image System */
+static const struct mtk_imgsys_dev_format tuning_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_metai,
+	},
+};
+
+/* Control metadata formats for MediaTek Image System */
+static const struct mtk_imgsys_dev_format ctrlmeta_fmts[] = {
+	{
+		.fmt = &mtk_imgsys_format_ctrlmeta,
+	},
+};
+
+/**
+ * queues_setting - Array to store video device descriptions for each module
+ * and meta in ImgSys
+ */
+static struct mtk_imgsys_video_device_desc
+queues_setting[MTK_IMGSYS_VIDEO_NODE_ID_TOTAL_NUM] = {
+	[MTK_IMGSYS_VIDEO_NODE_ID_TUNING_OUT] = {
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_TUNING_OUT,
+		.name = "Tuning",
+		.cap = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.smem_alloc = 1,
+		.flags = 0,
+		.fmts = tuning_fmts,
+		.num_fmts = ARRAY_SIZE(tuning_fmts),
+		.dma_port = 0,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Tuning data",
+	},
+	[MTK_IMGSYS_VIDEO_NODE_ID_CTRLMETA_OUT] = {
+		.id = MTK_IMGSYS_VIDEO_NODE_ID_CTRLMETA_OUT,
+		.name = "CtrlMeta",
+		.cap = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.smem_alloc = 1,
+		.flags = 0,
+		.fmts = ctrlmeta_fmts,
+		.num_fmts = ARRAY_SIZE(ctrlmeta_fmts),
+		.dma_port = 0,
+		.frmsizeenum = &dip_in_frmsizeenum,
+		.description = "Control meta data for flow control",
+	},
+};
+
+/**
+ * pipe_settings_isp7 - Array to store pipeline configurations for ISP7 in ImgSys
+ */
+static const struct mtk_imgsys_pipe_desc pipe_settings_isp7[] = {
+	{
+		.name = MTK_IMGSYS_MEDIA_MODEL_NAME,
+		.id = 0,
+		.queue_descs = queues_setting,
+		.total_queues = ARRAY_SIZE(queues_setting),
+	},
+};
+#endif
-- 
2.45.2


