Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B3E44D0E6
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 05:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbhKKESs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 23:18:48 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:50846 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234082AbhKKESU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 23:18:20 -0500
X-UUID: 910ce61cc94d48e38e3e72a36e60bd4f-20211111
X-UUID: 910ce61cc94d48e38e3e72a36e60bd4f-20211111
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1562438182; Thu, 11 Nov 2021 12:15:28 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 12:15:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 11 Nov 2021 12:15:25 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v10, 18/19] media: mtk-vcodec: Remove mtk_vcodec_release_dec_pm
Date:   Thu, 11 Nov 2021 12:14:59 +0800
Message-ID: <20211111041500.17363-19-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111041500.17363-1-yunfei.dong@mediatek.com>
References: <20211111041500.17363-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are only two lines in mtk_vcodec_release_dec_pm, using
pm_runtime_disable and put_device instead directly.

Move pm_runtime_enable outside mtk_vcodec_init_dec_pm to symmetry with
pm_runtime_disable, after that, rename mtk_vcodec_init_dec_pm to *_clk since
it only has clock operations now.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Yong Wu <yong.wu@mediatek.com>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c   | 10 +++++++---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c    |  7 +++++--
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c    | 12 ++----------
 .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h    |  3 +--
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 97601c5099bc..049a6b958c1a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
@@ -168,12 +169,13 @@ static int mtk_vcodec_init_dec_resources(struct mtk_vcodec_dev *dev)
 		return ret;
 	}
 
-	ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
+	ret = mtk_vcodec_init_dec_clk(pdev, &dev->pm);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to get mt vcodec clock source");
 		return ret;
 	}
 
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 }
 
@@ -487,7 +489,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch))
 		destroy_workqueue(dev->core_workqueue);
 err_res:
-	mtk_vcodec_release_dec_pm(&dev->pm);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 err_dec_pm:
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return ret;
@@ -531,7 +534,8 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	mtk_vcodec_release_dec_pm(&dev->pm);
+	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
index 3b863f980e56..26db4aae4cd6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "mtk_vcodec_drv.h"
@@ -113,9 +114,10 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	subdev_dev->plat_dev = pdev;
-	ret = mtk_vcodec_init_dec_pm(pdev, &subdev_dev->pm);
+	ret = mtk_vcodec_init_dec_clk(pdev, &subdev_dev->pm);
 	if (ret)
 		return ret;
+	pm_runtime_enable(&pdev->dev);
 
 	subdev_dev->reg_base[VDEC_HW_MISC] =
 		devm_platform_ioremap_resource(pdev, 0);
@@ -151,7 +153,8 @@ static int mtk_vdec_hw_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, subdev_dev);
 	return 0;
 err:
-	mtk_vcodec_release_dec_pm(&subdev_dev->pm);
+	pm_runtime_disable(subdev_dev->pm.dev);
+	put_device(subdev_dev->pm.larbvdec);
 	return ret;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index 4cf03d38d141..b9f5ef979c69 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -15,7 +15,7 @@
 #include "mtk_vcodec_dec_pm.h"
 #include "mtk_vcodec_util.h"
 
-int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm)
 {
 	struct device_node *node;
@@ -73,20 +73,12 @@ int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
 		}
 	}
 
-	pm_runtime_enable(&pdev->dev);
 	return 0;
 put_device:
 	put_device(pm->larbvdec);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
-
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
-{
-	pm_runtime_disable(pm->dev);
-	put_device(pm->larbvdec);
-}
-EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
+EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_clk);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx)
 {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
index 6ae29fea4e7f..c4121df9764f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
@@ -9,9 +9,8 @@
 
 #include "mtk_vcodec_drv.h"
 
-int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
+int mtk_vcodec_init_dec_clk(struct platform_device *pdev,
 	struct mtk_vcodec_pm *pm);
-void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
 
 int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int hw_idx);
-- 
2.25.1

