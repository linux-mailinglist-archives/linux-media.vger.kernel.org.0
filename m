Return-Path: <linux-media+bounces-19312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6899683E
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 13:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE312868E8
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 11:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789FD192B66;
	Wed,  9 Oct 2024 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cB80hJny"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8631922E7;
	Wed,  9 Oct 2024 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472579; cv=none; b=aZXfNw0cPVPGn5LWnBtM6HnsWvQpvG+Uq58FXX0WtczJnErwacGIjrbV1tjKPARuUyP6g70sbLOXEIMyUEk4RvsVwiIEqVqmn+Cw4mqKdvkhxhy2gX8Y6goKXvutN5M8VOSDj/I6C2+3u8GKcLMIoM5qsU7BgU5cWiHccl6uh7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472579; c=relaxed/simple;
	bh=YXcfuk6nVUnX0HUzhwNiK2tBdKC3TRvlQTd4OCXDD3Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xp4JaWoaF3+2MSiPTtkSgnM/Xx/dcRY+3n7Ey3/87AsnKf7SKvFq7nK4A/j1xDLydcFePZRoS9Nht64Ecers7lFMHRxrxVIll2/iSTcGyNhxObm2ApNYV4g5QX0NuaDYysFvJRl4TmMRf5tLtLPkq+tV4u03IUdf2FR9daQYOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=cB80hJny; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: e3a2669e862f11ef8b96093e013ec31c-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8ju0ytowx65X0CpsP0yuEO1L3woEj5GB17r1ruwY8aE=;
	b=cB80hJnyH/3/d2Ic6xP5SwCzK6gqskrQon3R6NHJmXSpi1KZhoDYPHZvEQ81klifCv/EbrL3mBxqBmHsGrne5WqBahm58XPzyjoxc1RE8C8k4ZTxOm+9SPUp1x6iZq41PMvcIt7CL7lvqjqRUTSfPmqMpJGSfgKKicsqSwk/qm4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:abb5e34d-a778-48d8-b7db-c6a490f2489c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:19a58926-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e3a2669e862f11ef8b96093e013ec31c-20241009
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shu-hsiang.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 468004745; Wed, 09 Oct 2024 19:16:11 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 19:16:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:16:09 +0800
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
Subject: [PATCH v1 09/10] media: platform: mediatek: add isp_7x build config
Date: Wed, 9 Oct 2024 19:15:50 +0800
Message-ID: <20241009111551.27052-10-Shu-hsiang.Yang@mediatek.com>
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
X-TM-AS-Result: No-10--6.784100-8.000000
X-TMASE-MatchedRID: WbOLpgv9C7Y9S3IiQd+eNRlckvO1m+Jc1KoSW5Ji1XuX0aNVfPpyq/fK
	AG02e9BelTJXKqh1ne1M8qdoCvOVvktzS/aGUmtztw+xHnsmQjPDHSNFHFxB801KG1YrOQW//Ge
	vfoH427p8p1FS+daYYMUIXPffOsz4CwsXh7HbbhOzI1v7J4hECj2Yc4MPQbFxNv1MHbxRuSJj1H
	gUqCPEf+LzNWBegCW2oq1o0yfqNxkLbigRnpKlKTpcQTtiHDgW3eKwXwnXwQy00lJYFDyuPUEq6
	sF8PLIVy7NoYne/RapUsrIL3LuS9Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.784100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E3C4734528D52573EBB41A1F6E3A9DC439736167DECD402658AFD8FCFE79CCAB2000:8

Add Kconfig and Makefile to include MTK ISP CAMSYS, integrating
the driver into the kernel build and configuration process.

Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
---
 drivers/media/platform/mediatek/Kconfig       |  1 +
 drivers/media/platform/mediatek/Makefile      |  2 ++
 drivers/media/platform/mediatek/isp/Kconfig   | 21 +++++++++++++++++++
 .../platform/mediatek/isp/isp_7x/Makefile     |  7 +++++++
 .../mediatek/isp/isp_7x/camsys/Makefile       | 16 ++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile

diff --git a/drivers/media/platform/mediatek/Kconfig b/drivers/media/platform/mediatek/Kconfig
index 84104e2cd024..a405d5701329 100644
--- a/drivers/media/platform/mediatek/Kconfig
+++ b/drivers/media/platform/mediatek/Kconfig
@@ -2,6 +2,7 @@
 
 comment "Mediatek media platform drivers"
 
+source "drivers/media/platform/mediatek/isp/Kconfig"
 source "drivers/media/platform/mediatek/jpeg/Kconfig"
 source "drivers/media/platform/mediatek/mdp/Kconfig"
 source "drivers/media/platform/mediatek/vcodec/Kconfig"
diff --git a/drivers/media/platform/mediatek/Makefile b/drivers/media/platform/mediatek/Makefile
index 38e6ba917fe5..74164df8c68d 100644
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
new file mode 100644
index 000000000000..8633e893a37d
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
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/Makefile
new file mode 100644
index 000000000000..c927999cd854
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
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
new file mode 100644
index 000000000000..8e758cf6877f
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 MediaTek Inc.
+
+mtk-cam-isp-objs := mtk_cam.o mtk_cam-raw.o mtk_cam-pool.o \
+		    mtk_cam-video.o mtk_cam-ctrl.o \
+		    mtk_cam-seninf-route.o mtk_cam-seninf-drv.o \
+		    mtk_cam-debug.o \
+		    mtk_cam-raw_debug.o \
+		    mtk_cam-feature.o mtk_cam-timesync.o
+
+mtk-cam-plat-util-objs :=  mtk_cam-plat-util.o
+
+include $(src)/mtk_csi_phy_2_0/Makefile
+
+obj-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += mtk-cam-plat-util.o
+obj-$(CONFIG_VIDEO_MTK_ISP_71_CAMSYS) += mtk-cam-isp.o
-- 
2.18.0


