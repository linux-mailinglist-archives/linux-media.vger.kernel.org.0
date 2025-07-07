Return-Path: <linux-media+bounces-36927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0983AFA931
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 03:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F1C169F1F
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 01:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208EF256C91;
	Mon,  7 Jul 2025 01:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="I+r22k0V"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AA25229D;
	Mon,  7 Jul 2025 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751851989; cv=none; b=k3C/xQMJXhxMLzVcj6QN6kilZtCydAMV8NLR6jpqeqBlMw6YeRozKqkREMbpofWXdAeF9rkb+Zs/T/QWTc82OckavmbhiE99ElNk5gr60CSYJp6v+VZbnajL/jz5FvsrUI7uaruNG+GaHIY1hbeeSrkWlOqj9crlwAGO3p9yVDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751851989; c=relaxed/simple;
	bh=TxPRV8HLuFJCnFLIdz6wiZ63kkZqZ+v0OJHuFtoEcnA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GHUXBHBQ7FrfOt8KfEyH5O9BxMSEEPhucfTOM3DKQSOVlTrbweUlyut0EU5GdQ6ENSg+khLn9UVTTB+3VceZ5xIT9x4o+tsx3ZWiL7OSLTQXiyroTyhY8IDk82/RkLJET9FjUNwMft1twOEa6KPTfbm6BHY6toIKOZ6DIgFUb+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=I+r22k0V; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 537c15105ad211f0b33aeb1e7f16c2b6-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Cdlc04E1tdFEfjkZqRxpFdxS/bmtRAytjILJEuUfeNc=;
	b=I+r22k0VMrbplWmrygNVhJfRQwUshIn+tA1gP9K6PtSsDGWhA+ZsO0+Q7W6s4iJ04vQXZk+wzgoqOVbXsSbo1F6QXFns+gcWte5/k0veKRg4Gjirx3YGpEm1GTu2SBy22YQues3vjTcSEtSG3f9HcEPHCWEJ/e0e2uo+Qz1eQ3A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:7eab008b-dcc2-47db-a3bb-fa978c3a25c8,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:bb5d9382-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 537c15105ad211f0b33aeb1e7f16c2b6-20250707
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shangyao.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 672194307; Mon, 07 Jul 2025 09:33:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:33:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:33:02 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 11/13] media: platform: mediatek: add isp_7x build config
Date: Mon, 7 Jul 2025 09:31:52 +0800
Message-ID: <20250707013154.4055874-12-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: "shangyao.lin" <shangyao.lin@mediatek.com>

Add Kconfig and Makefile to include MTK ISP CAMSYS, integrating the driver into
the kernel build and configuration process.

Question for CK:

Hi CK,

Thank you for your review and comments.

Just to confirm, do you mean that when I add mtk_cam-seninf-route.c and
mtk_cam-seninf-drv.c in patch [3/10], I should also create or update the
corresponding Makefile to ensure these two .c files are compiled as part of the
driver? Is my understanding correct?

Thank you for your clarification.

Best regards,
Shangyao

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 drivers/media/platform/mediatek/Kconfig       |  1 +
 drivers/media/platform/mediatek/Makefile      |  2 ++
 drivers/media/platform/mediatek/isp/Kconfig   | 21 +++++++++++++++++++
 .../platform/mediatek/isp/isp_7x/Makefile     |  7 +++++++
 .../mediatek/isp/isp_7x/camsys/Makefile       | 14 +++++++++++++
 5 files changed, 45 insertions(+)
 mode change 100644 => 100755 drivers/media/platform/mediatek/Kconfig
 mode change 100644 => 100755 drivers/media/platform/mediatek/Makefile
 create mode 100755 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/Makefile
 create mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile

diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
old mode 100644
new mode 100755
index 84104e2cd024..a405d5701329
--- a/drivers/media/platform/mediatek/Kconfig
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -2,6 +2,7 @@
 
 comment "Mediatek media platform drivers"
 
+source "drivers/media/platform/mediatek/isp/Kconfig"
 source "drivers/media/platform/mediatek/jpeg/Kconfig"
 source "drivers/media/platform/mediatek/mdp/Kconfig"
 source "drivers/media/platform/mediatek/vcodec/Kconfig"
diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
old mode 100644
new mode 100755
index 38e6ba917fe5..74164df8c68d
--- a/drivers/media/platform/mediatek/Makefile
+++ b/drivers/media/platform/mediatek/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
 obj-y += jpeg/
 obj-y += mdp/
 obj-y += vcodec/
 obj-y += vpu/
 obj-y += mdp3/
+obj-y += isp/isp_7x/
diff --git a/drivers/media/platform/mediatek/isp/Kconfig b/drivers/media/platform/mediatek/isp/Kconfig
new file mode 100755
index 000000000000..ce4dd21e3e79
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_MTK_ISP_71_CAMSYS
+	tristate "MediaTek ISP 7.1 camsys driver"
+	depends on ARCH_MEDIATEK
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select RPMSG_MTK_CCD
+	select MTKCCD_REMOTEPROC
+	select MTK_SCP
+
+	default n
+	help
+		Camsys driver controls 3A (auto-focus, exposure,
+		and white balance) with tuning feature and outputs
+		the captured image buffers in MediaTek's ISP7 system.
+
+		Choose y if you want to use MediaTek SoCs to create image
+		captured application such as video recording and still image
+		capturing.
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/Makefile
new file mode 100755
index 000000000000..be70346d224b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+subdir-ccflags-y += -Werror
+
+subdir-ccflags-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += -DISP7_1
+
+obj-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += camsys/
\ No newline at end of file
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
new file mode 100755
index 000000000000..700ac2a85ac4
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 MediaTek Inc.
+
+mtk-cam-isp-objs := mtk_cam.o mtk_cam-raw.o mtk_cam-pool.o \
+		    mtk_cam-video.o mtk_cam-ctrl.o \
+		    mtk_cam-seninf-route.o mtk_cam-seninf-drv.o \
+		    mtk_cam-timesync.o
+
+mtk-cam-plat-util-objs :=  mtk_cam-plat-util.o
+
+include $(src)/mtk_csi_phy_2_0/Makefile
+
+obj-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += mtk-cam-plat-util.o
+obj-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += mtk-cam-isp.o
-- 
2.18.0


