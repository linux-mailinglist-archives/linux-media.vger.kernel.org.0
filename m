Return-Path: <linux-media+bounces-7602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EE886903
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 10:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F68F1C24172
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 09:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9DE4316B;
	Fri, 22 Mar 2024 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kYB5l7mA"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1773DBBA;
	Fri, 22 Mar 2024 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711098769; cv=none; b=oRkgqVXDxWLfego1EGFUQe59zYjB9hWkhvE3Hin4S9EPM7sUeHNbvWEGbAoPInUAnSrhNg9WdxdQUDqDg+5yMuixhlnQUIRFlCTWXIzpw/bvgX7dMkewjsLHZ2qdT0MsVZorE5+2cCnzNxhJQUsOSL1MHtE8xRFXzhpl5xwK1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711098769; c=relaxed/simple;
	bh=KFICO/gVYhyIDYhTmV8TeGuC6GNVA36bUUWz0JIrJ1k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sx5EDM+QgWwhmc723bYOlBr+CqcwVbhcJkB6ugj+x5O+SmrlIaoVTzj9K6qi2stH9SI8oZehkvUBRAMBAod5iNjkrDiccshx7NIwgCM6Z4g2UgEFYAycYZ4FcSpZVVhkL9c+IC3WBLAcBxhCc9vioDneWkQ9qIsOqxrKlPnheQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kYB5l7mA; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5249e47ae82c11eeb8927bc1f75efef4-20240322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ubzYPoi3tJCh8ZemTI1pk9scTjl0MoQnxDHohK+galA=;
	b=kYB5l7mAsRvWe0yOtabBo72ZAbE+UGhfTLKKJTr/6IJJeojL94/8+pPRV5uAalTIvRk5TEWICxaOAO+Xu8TRcZiLzFWCRcbkK8mrSQ1I5S2UowyCrnYUvhaTfd6SZ+6B0MdMR6wEK6N8z9xBj5cCYZjcp9diHD5RuQt5WVJMBsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:aee69ed9-85b1-4ead-972f-2debef8f3b90,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:c78e4f85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5249e47ae82c11eeb8927bc1f75efef4-20240322
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2134311744; Fri, 22 Mar 2024 17:12:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 17:12:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 17:12:34 +0800
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
Subject: [PATCH v5 08/14] drm/mediatek: Rename files "mtk_drm_ddp_comp.h" to "mtk_ddp_comp.h"
Date: Fri, 22 Mar 2024 17:12:26 +0800
Message-ID: <20240322091232.26387-9-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322091232.26387-1-shawn.sung@mediatek.com>
References: <20240322091232.26387-1-shawn.sung@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename files mtk_drm_ddp_comp.h to mtk_ddp_comp.h.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c                             | 2 +-
 drivers/gpu/drm/mediatek/mtk_crtc.h                             | 2 +-
 drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} | 0
 drivers/gpu/drm/mediatek/mtk_disp_aal.c                         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c                       | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c                         | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c                 | 2 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c                        | 2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                              | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c                     | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c                          | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h                          | 2 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c                        | 2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                              | 2 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c                            | 2 +-
 drivers/gpu/drm/mediatek/mtk_padding.c                          | 2 +-
 19 files changed, 18 insertions(+), 18 deletions(-)
 rename drivers/gpu/drm/mediatek/{mtk_drm_ddp_comp.h => mtk_ddp_comp.h} (100%)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index d9f7febd24a6d..97b5e0f186a1d 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -20,8 +20,8 @@
 #include <drm/drm_vblank.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.h b/drivers/gpu/drm/mediatek/mtk_crtc.h
index 2d9f28f436aea..fd6c006f0c169 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.h
@@ -7,7 +7,7 @@
 #define MTK_CRTC_H

 #include <drm/drm_crtc.h>
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
similarity index 100%
rename from drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
rename to drivers/gpu/drm/mediatek/mtk_ddp_comp.h
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index ba926e797af8a..92acdaddd648d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -12,8 +12,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

 #define DISP_AAL_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 79bcd3c487563..975ee45a0f72c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -11,8 +11,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

 #define DISP_CCORR_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 4aa41b1ff2602..91e7837a32c86 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -11,8 +11,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

 #define DISP_COLOR_CFG_MAIN			0x0400
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 1a1ee77127ee9..51ae4f947c714 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -12,8 +12,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

 #define DISP_GAMMA_EN				0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index 32a29924bd54c..3b1e04ecb9d45 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -10,7 +10,7 @@
 #include <linux/reset.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>

-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_disp_drv.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 7f2219c0119be..0ebeaf9830d83 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -16,8 +16,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

 #define DISP_REG_OVL_INTEN			0x0004
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 542dc2a20ea90..d957f5c8ccf92 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -18,8 +18,8 @@
 #include <linux/soc/mediatek/mtk-mutex.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 04f584372214f..f06b048c12479 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -14,8 +14,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

 #define DISP_REG_RDMA_INT_ENABLE		0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index beb7d9d08e971..fbf63e0441337 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -26,9 +26,9 @@
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>

+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_dpi_regs.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

 enum mtk_dpi_out_bit_num {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 24389c6c3561f..ab96b1001de3e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -15,10 +15,10 @@
 #include <drm/drm_print.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_plane.h"
-#include "mtk_drm_ddp_comp.h"


 #define DISP_REG_DITHER_EN			0x0000
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7be3b0546d3df..113fdbaac5a14 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -25,7 +25,7 @@
 #include <drm/drm_vblank.h>

 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 24c4d59085bd6..78d698ede1bf8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -7,7 +7,7 @@
 #define MTK_DRM_DRV_H

 #include <linux/io.h>
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"

 #define MAX_CONNECTOR	2
 #define DDP_COMPONENT_DRM_OVL_ADAPTOR (DDP_COMPONENT_ID_MAX + 1)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 720f6b4b08215..63a7a24468c13 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -14,7 +14,7 @@
 #include <linux/align.h>

 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ec9d96396d7b2..e29c37fb5be09 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -28,8 +28,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>

+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_drv.h"

 #define DSI_START		0x00
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 41efaafe26f1a..9b0264bd5e731 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -15,7 +15,7 @@
 #include <linux/soc/mediatek/mtk-mmsys.h>

 #include "mtk_crtc.h"
-#include "mtk_drm_ddp_comp.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
 #include "mtk_ethdr.h"

diff --git a/drivers/gpu/drm/mediatek/mtk_padding.c b/drivers/gpu/drm/mediatek/mtk_padding.c
index ff6a5c695128c..1f91805cd9aac 100644
--- a/drivers/gpu/drm/mediatek/mtk_padding.c
+++ b/drivers/gpu/drm/mediatek/mtk_padding.c
@@ -12,8 +12,8 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>

 #include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
-#include "mtk_drm_ddp_comp.h"

 #define PADDING_CONTROL_REG	0x00
 #define PADDING_BYPASS			BIT(0)
--
2.18.0


