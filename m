Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A0948C158
	for <lists+linux-media@lfdr.de>; Wed, 12 Jan 2022 10:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352261AbiALJtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jan 2022 04:49:45 -0500
Received: from mailgw01.mediatek.com ([60.244.123.138]:55020 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1352218AbiALJth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jan 2022 04:49:37 -0500
X-UUID: a2ebbcaaed6d40ddbc725b9ac8c50463-20220112
X-UUID: a2ebbcaaed6d40ddbc725b9ac8c50463-20220112
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1658604165; Wed, 12 Jan 2022 17:49:32 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 17:49:31 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 Jan
 2022 17:49:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 17:49:29 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Tzung-Bi Shih" <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v18, 03/19] media: mtk-vcodec: Refactor vcodec pm interface
Date:   Wed, 12 Jan 2022 17:49:07 +0800
Message-ID: <20220112094923.16839-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220112094923.16839-1-yunfei.dong@mediatek.com>
References: <20220112094923.16839-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Using the needed params for pm init/release function and remove unused
param mtkdev in 'struct mtk_vcodec_pm'.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steve Cho <stevecho@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++---
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 24 ++++++++-----------
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  5 ++--
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  1 -
 5 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e5f6e400a587..af235fa4c487 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -246,7 +246,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->fw_handler))
 		return PTR_ERR(dev->fw_handler);
 
-	ret = mtk_vcodec_init_dec_pm(dev);
+	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
 		goto err_dec_pm;
@@ -377,7 +377,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 err_dec_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_res:
-	mtk_vcodec_release_dec_pm(dev);
+	mtk_vcodec_release_dec_pm(&dev->pm);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -416,7 +416,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_dec_pm(dev);
+	mtk_vcodec_release_dec_pm(&dev->pm);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 6038db96f71c..ba96e62c6bb1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -13,18 +13,15 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
+int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+	struct mtk_vcodec_pm *pm)
 {
 	struct device_node *node;
-	struct platform_device *pdev;
-	struct mtk_vcodec_pm *pm;
+	struct platform_device *larb_pdev;
 	struct mtk_vcodec_clk *dec_clk;
 	struct mtk_vcodec_clk_info *clk_info;
 	int i = 0, ret = 0;
 
-	pdev = mtkdev->plat_dev;
-	pm = &mtkdev->pm;
-	pm->mtkdev = mtkdev;
 	dec_clk = &pm->vdec_clk;
 	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
 	if (!node) {
@@ -32,13 +29,12 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 		return -1;
 	}
 
-	pdev = of_find_device_by_node(node);
+	larb_pdev = of_find_device_by_node(node);
 	of_node_put(node);
-	if (WARN_ON(!pdev)) {
+	if (WARN_ON(!larb_pdev))
 		return -1;
-	}
-	pm->larbvdec = &pdev->dev;
-	pdev = mtkdev->plat_dev;
+
+	pm->larbvdec = &larb_pdev->dev;
 	pm->dev = &pdev->dev;
 
 	dec_clk->clk_num =
@@ -82,10 +78,10 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 	return ret;
 }
 
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
+void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
 {
-	pm_runtime_disable(dev->pm.dev);
-	put_device(dev->pm.larbvdec);
+	pm_runtime_disable(pm->dev);
+	put_device(pm->larbvdec);
 }
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 280aeaefdb65..a3df6aef6cb9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -9,8 +9,9 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+	struct mtk_vcodec_pm *pm);
+void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 1d2370608d0d..0fa9d85114b9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -195,7 +195,6 @@ struct mtk_vcodec_pm {
 	struct mtk_vcodec_clk	venc_clk;
 	struct device	*larbvenc;
 	struct device	*dev;
-	struct mtk_vcodec_dev	*mtkdev;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1b2e4930ed27..0c8c8f86788c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -26,7 +26,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 	pdev = mtkdev->plat_dev;
 	pm = &mtkdev->pm;
 	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
-	pm->mtkdev = mtkdev;
 	pm->dev = &pdev->dev;
 	dev = &pdev->dev;
 	enc_clk = &pm->venc_clk;
-- 
2.25.1

