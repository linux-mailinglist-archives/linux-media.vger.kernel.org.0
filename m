Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B793BE301
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 08:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhGGGZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 02:25:15 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49836 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230356AbhGGGZN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 02:25:13 -0400
X-UUID: 28f9fdc9b5804c60a56b5a523d8c5af7-20210707
X-UUID: 28f9fdc9b5804c60a56b5a523d8c5af7-20210707
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 638275221; Wed, 07 Jul 2021 14:22:28 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:26 +0800
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
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 09/14] media: mtk-vcodec: Add new interface to lock different hardware
Date:   Wed, 7 Jul 2021 14:21:52 +0800
Message-ID: <20210707062157.21176-10-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For add new hardware, not only need to lock lat hardware, also
need to lock core hardware in case of different instance start
to decoder at the same time.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c     | 4 ++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++--
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 2b334a8a81c6..130ecef2e766 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -105,12 +105,12 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 
 void mtk_vdec_unlock(struct mtk_vcodec_ctx *ctx)
 {
-	mutex_unlock(&ctx->dev->dec_mutex);
+	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);
 }
 
 void mtk_vdec_lock(struct mtk_vcodec_ctx *ctx)
 {
-	mutex_lock(&ctx->dev->dec_mutex);
+	mutex_lock(&ctx->dev->dec_mutex[ctx->hw_id]);
 }
 
 void mtk_vcodec_dec_release(struct mtk_vcodec_ctx *ctx)
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index b13fb69c6e2f..f156a943ca62 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -386,7 +386,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	struct video_device *vfd_dec;
 	phandle rproc_phandle;
 	enum mtk_vcodec_fw_type fw_type;
-	int ret;
+	int i, ret;
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -423,7 +423,8 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
-	mutex_init(&dev->dec_mutex);
+	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
+		mutex_init(&dev->dec_mutex[i]);
 	mutex_init(&dev->dev_mutex);
 	spin_lock_init(&dev->irqlock);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index b42e0c7e0731..68b3fbcd95b0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -508,7 +508,7 @@ struct mtk_vcodec_dev {
 	int dec_irq;
 	int enc_irq;
 
-	struct mutex dec_mutex;
+	struct mutex dec_mutex[MTK_VDEC_HW_MAX];
 	struct mutex enc_mutex;
 
 	struct mtk_vcodec_pm pm;
-- 
2.18.0

