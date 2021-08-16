Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CDB3ED2C4
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhHPLBP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:01:15 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53354 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S236222AbhHPLBK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:01:10 -0400
X-UUID: f5233eb66ed64c1ebc9c4c2b6a271ffd-20210816
X-UUID: f5233eb66ed64c1ebc9c4c2b6a271ffd-20210816
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1983101265; Mon, 16 Aug 2021 19:00:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 19:00:34 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 16 Aug
 2021 19:00:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:32 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 5/9] media: mtk-vcodec: Rewrite venc clock interface
Date:   Mon, 16 Aug 2021 18:59:30 +0800
Message-ID: <20210816105934.28265-6-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Frame-racing mode need enable the specific core's clk, add an
another param for clock_on/clock_off interface.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 104 ++++++++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |   4 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |  10 +-
 3 files changed, 86 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index d9df0e3701f1..bfb9e21bfd26 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -86,25 +86,50 @@ void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm)
 }
 
 
-void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev, int core_id)
 {
-	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
-	int ret, i = 0;
+	struct mtk_venc_comp_dev *venc;
+	struct mtk_vcodec_pm *enc_pm;
+	struct mtk_vcodec_clk *enc_clk;
+	struct clk		*clk;
+	int ret, i;
 
-	for (i = 0; i < enc_clk->clk_num; i++) {
-		ret = clk_prepare_enable(enc_clk->clk_info[i].vcodec_clk);
-		if (ret) {
-			mtk_v4l2_err("venc clk_prepare_enable %d %s fail %d", i,
-				enc_clk->clk_info[i].clk_name, ret);
-			goto clkerr;
+	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		venc = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[core_id];
+		enc_pm = &venc->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = 0; i < enc_clk->clk_num; i++) {
+			clk = enc_clk->clk_info[i].vcodec_clk;
+			ret = clk_enable(clk);
+			if (ret) {
+				mtk_v4l2_err("clk_enable %d %s fail %d", i,
+					     enc_clk->clk_info[i].clk_name,
+					     ret);
+				goto comp_clk_err;
+			}
 		}
-	}
+	} else {
+		enc_pm = &dev->pm;
+		enc_clk = &enc_pm->venc_clk;
 
-	ret = mtk_smi_larb_get(pm->larbvenc);
-	if (ret) {
-		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
-		goto clkerr;
+		for (i = 0; i < enc_clk->clk_num; i++) {
+			clk = enc_clk->clk_info[i].vcodec_clk;
+			ret = clk_prepare_enable(clk);
+			if (ret) {
+				mtk_v4l2_err("clk_prepare_enable %d %s fail %d",
+					     i, enc_clk->clk_info[i].clk_name,
+					     ret);
+				goto clkerr;
+			}
+		}
 	}
+
+	return;
+
+comp_clk_err:
+	for (i -= 1; i >= 0; i--)
+		clk_disable(enc_clk->clk_info[i].vcodec_clk);
 	return;
 
 clkerr:
@@ -112,20 +137,35 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
 		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
 }
 
-void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
+void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev, int core_id)
 {
-	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
-	int i = 0;
+	struct mtk_venc_comp_dev *venc;
+	struct mtk_vcodec_pm *enc_pm;
+	struct mtk_vcodec_clk *enc_clk;
+	int i;
 
-	mtk_smi_larb_put(pm->larbvenc);
-	for (i = enc_clk->clk_num - 1; i >= 0; i--)
-		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
+	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		venc = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[core_id];
+		enc_pm = &venc->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = enc_clk->clk_num - 1; i >= 0; i--)
+			clk_disable(enc_clk->clk_info[i].vcodec_clk);
+	} else {
+		enc_pm = &dev->pm;
+		enc_clk = &enc_pm->venc_clk;
+
+		for (i = enc_clk->clk_num - 1; i >= 0; i--)
+			clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
+	}
 }
 
 int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev)
 {
 	int i, ret;
 	struct mtk_venc_comp_dev *venc_comp;
+	struct mtk_vcodec_clk *enc_clk;
+	int j = 0;
 
 	/*
 	 * frame_racing mode needs power on all available component devices.
@@ -140,23 +180,38 @@ int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev)
 			mtk_v4l2_err("power on core[%d] fail %d", i, ret);
 				goto pw_err;
 		}
+
+		enc_clk = &venc_comp->pm.venc_clk;
+		for (j = 0; j < enc_clk->clk_num; j++) {
+			ret = clk_prepare(enc_clk->clk_info[j].vcodec_clk);
+			if (ret) {
+				mtk_v4l2_err("prepare clk [%s] fail %d",
+					     enc_clk->clk_info[j].clk_name,
+					     ret);
+				goto pw_err;
+			}
+		}
 	}
 	return 0;
 
 pw_err:
 	for (i -= 1; i >= 0; i--) {
 		venc_comp = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[i];
+		enc_clk = &venc_comp->pm.venc_clk;
+
+		for (j -= 1; j >= 0; j--)
+			clk_unprepare(enc_clk->clk_info[j].vcodec_clk);
 
 		mtk_smi_larb_put(venc_comp->pm.larbvenc);
 	}
-
 	return ret;
 }
 
 int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev)
 {
-	int i;
+	int i, j;
 	struct mtk_venc_comp_dev *venc_comp;
+	struct mtk_vcodec_clk *enc_clk;
 
 	/*power off all available component device*/
 	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
@@ -164,6 +219,11 @@ int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev)
 		if (!venc_comp)
 			return 0;
 
+		enc_clk = &venc_comp->pm.venc_clk;
+
+		for (j = enc_clk->clk_num - 1; j >= 0; j--)
+			clk_unprepare(enc_clk->clk_info[j].vcodec_clk);
+
 		mtk_smi_larb_put(venc_comp->pm.larbvenc);
 	}
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index 2e76b858fed1..f3a819cc0e56 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -13,8 +13,8 @@ int mtk_vcodec_init_enc_pm(struct platform_device *pdev,
 			   struct mtk_vcodec_pm *pm);
 void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm);
 
-void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
-void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
+void mtk_vcodec_enc_clock_on(struct mtk_vcodec_dev *dev, int core_id);
+void mtk_vcodec_enc_clock_off(struct mtk_vcodec_dev *dev, int core_id);
 
 int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev);
 int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev);
diff --git a/drivers/media/platform/mtk-vcodec/venc_drv_if.c b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
index ce0bce811615..6cbdb7e30bb3 100644
--- a/drivers/media/platform/mtk-vcodec/venc_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_drv_if.c
@@ -32,9 +32,7 @@ int venc_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 	}
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->init(ctx);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	return ret;
@@ -46,9 +44,7 @@ int venc_if_set_param(struct mtk_vcodec_ctx *ctx,
 	int ret = 0;
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->set_param(ctx->drv_handle, type, in);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	return ret;
@@ -68,10 +64,10 @@ int venc_if_encode(struct mtk_vcodec_ctx *ctx,
 	ctx->dev->curr_ctx = ctx;
 	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
 
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
+	mtk_vcodec_enc_clock_on(ctx->dev, 0);
 	ret = ctx->enc_if->encode(ctx->drv_handle, opt, frm_buf,
 				  bs_buf, result);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
+	mtk_vcodec_enc_clock_off(ctx->dev, 0);
 
 	spin_lock_irqsave(&ctx->dev->irqlock, flags);
 	ctx->dev->curr_ctx = NULL;
@@ -89,9 +85,7 @@ int venc_if_deinit(struct mtk_vcodec_ctx *ctx)
 		return 0;
 
 	mtk_venc_lock(ctx);
-	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->deinit(ctx->drv_handle);
-	mtk_vcodec_enc_clock_off(&ctx->dev->pm);
 	mtk_venc_unlock(ctx);
 
 	ctx->drv_handle = NULL;
-- 
2.25.1

