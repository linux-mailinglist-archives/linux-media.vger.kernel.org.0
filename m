Return-Path: <linux-media+bounces-5899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B5866E9E
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 10:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E443B24849
	for <lists+linux-media@lfdr.de>; Mon, 26 Feb 2024 09:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F373E60EEF;
	Mon, 26 Feb 2024 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lvHN8dC1"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40016605B6;
	Mon, 26 Feb 2024 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708937478; cv=none; b=MZlBg2WdbPIUG5bKLfrnCtp5XRDKbmkSZ+5mzxZQU1auT30QI6IqDc6KDjXMP4QYx8GYUehh99nswPfxuLnC6SuiXdmmv1gHFNmbI+ra1pV7d8zuz14oNjgH6inJEt98fHNrrhP/+lUcigPFsxi/yV3KE2DlR3zlprBqaAip5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708937478; c=relaxed/simple;
	bh=69Yw1aGUDbMiByJ8bXl1a+YybdcLlKVKJyaZh3sjvBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YpO3FGPBfHs1C7ZXyDXiIF5sOWLOequslojU6F/eKRfTupGVnEoiGPaj2yeQ4zYBBeYFcaXS1Gu8fVx+bGa9zL/a9YCqeR5BLX8qNO91pQnsUPo0444KCv4dfLrVcpZRRzf6Vrq5IkebgHKK16fDxMCXkFCZWD5pZF3BG9BCFUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lvHN8dC1; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2b425bf2d48411eea528b71b88a53856-20240226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TI4Sub82GKGYrfNFpRmeVDDz0BTTgCAOx01Ilx4UOG8=;
	b=lvHN8dC1VADtvi06Nb2og9B/iWgSrhLrqu/z/7LJzVCW+KzPN6HOgITzsKA34Ar1WNfMpM/XuU3Mo4AEIWFy40JCh2jJQSfIoLB1A7trcMkD1EzlPydVbgXo1pWhwnGZj3/pEVV+UZLNwKAwl2XFWbPRKsRH1/hjdKmWgQebbDk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b66c7613-e79b-48c2-b444-b90f0ccf81e0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:a55137ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2b425bf2d48411eea528b71b88a53856-20240226
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 590960795; Mon, 26 Feb 2024 16:51:02 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 26 Feb 2024 16:51:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 26 Feb 2024 16:51:01 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH 08/11] drm/mediatek: Rename files "mtk_drm_plane.*" to "mtk_plane.*"
Date: Mon, 26 Feb 2024 16:50:56 +0800
Message-ID: <20240226085059.26850-9-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240226085059.26850-1-shawn.sung@mediatek.com>
References: <20240226085059.26850-1-shawn.sung@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename files mtk_drm_plane.* to mtk_plane.*.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/Makefile                         | 2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.h                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c                   | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h                   | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} | 0
 7 files changed, 6 insertions(+), 6 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.c => mtk_plane.c} (99%)
 rename drivers/gpu/drm/mediatek/{mtk_drm_plane.h => mtk_plane.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index bbdf1e59ed84..0e198c00c6f2 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -12,7 +12,7 @@ mediatek-drm-y := mtk_disp_aal.o \
 		  mtk_ddp_comp.o \
 		  mtk_drm_drv.o \
 		  mtk_drm_gem.o \
-		  mtk_drm_plane.o \
+		  mtk_plane.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_ethdr.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 7bc4f76718e5..96af194d0d49 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -23,7 +23,7 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_gem.h"
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"
 
 /*
  * struct mtk_crtc - MediaTek specific crtc structure.
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index 5865e4955471..cc8ca7c2056c 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -9,7 +9,7 @@
 #include <drm/drm_crtc.h>
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"
 
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 98398993500f..ab846a9f98c5 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -16,7 +16,7 @@
 
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_crtc.h"
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 90e64467ea8f..d9b5a6ad3bea 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -9,7 +9,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"
 #include "mtk_mdp_rdma.h"
 
 int mtk_aal_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
similarity index 99%
rename from drivers/gpu/drm/mediatek/mtk_drm_plane.c
rename to drivers/gpu/drm/mediatek/mtk_plane.c
index 63a7a24468c1..95a4328a9b0b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -17,7 +17,7 @@
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
-#include "mtk_drm_plane.h"
+#include "mtk_plane.h"
 
 static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_plane.h
rename to drivers/gpu/drm/mediatek/mtk_plane.h
-- 
2.18.0


