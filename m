Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFFC3ED2C2
	for <lists+linux-media@lfdr.de>; Mon, 16 Aug 2021 13:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236096AbhHPLBM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 07:01:12 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:41646 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235938AbhHPLBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 07:01:07 -0400
X-UUID: cbd0c93bfe41465dbc6768a4c3dcd255-20210816
X-UUID: cbd0c93bfe41465dbc6768a4c3dcd255-20210816
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 969808951; Mon, 16 Aug 2021 19:00:31 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 19:00:30 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 19:00:29 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
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
Subject: [PATCH 4/9] media: mtk-vcodec: Add venc power on/off interface
Date:   Mon, 16 Aug 2021 18:59:29 +0800
Message-ID: <20210816105934.28265-5-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210816105934.28265-1-irui.wang@mediatek.com>
References: <20210816105934.28265-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Frame-racing mode need power on/off all venc available power,
pm_runtime_xx helper is not appropriate called directly, add new
power on/off interface for it.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 18 +---
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  9 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 82 +++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.h   |  4 +
 4 files changed, 96 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 416f356af363..d22f9c8fd063 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -16,6 +16,7 @@
 #include "mtk_vcodec_intr.h"
 #include "mtk_vcodec_util.h"
 #include "venc_drv_if.h"
+#include "mtk_vcodec_enc_pm.h"
 
 #define MTK_VENC_MIN_W	160U
 #define MTK_VENC_MIN_H	128U
@@ -801,7 +802,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	  */
 	if ((ctx->state == MTK_STATE_ABORT) || (ctx->state == MTK_STATE_FREE)) {
 		ret = -EIO;
-		goto err_start_stream;
+		goto err_set_param;
 	}
 
 	/* Do the initialization when both start_streaming have been called */
@@ -813,12 +814,6 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 			return 0;
 	}
 
-	ret = pm_runtime_resume_and_get(&ctx->dev->plat_dev->dev);
-	if (ret < 0) {
-		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
-		goto err_start_stream;
-	}
-
 	mtk_venc_set_param(ctx, &param);
 	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
 	if (ret) {
@@ -845,11 +840,6 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 
 err_set_param:
-	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
-	if (ret < 0)
-		mtk_v4l2_err("pm_runtime_put fail %d", ret);
-
-err_start_stream:
 	for (i = 0; i < q->num_buffers; ++i) {
 		struct vb2_buffer *buf = vb2_get_buffer(q, i);
 
@@ -903,10 +893,6 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 	if (ret)
 		mtk_v4l2_err("venc_if_deinit failed=%d", ret);
 
-	ret = pm_runtime_put(&ctx->dev->plat_dev->dev);
-	if (ret < 0)
-		mtk_v4l2_err("pm_runtime_put fail %d", ret);
-
 	ctx->state = MTK_STATE_FREE;
 }
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 9c2224b199d0..b78435e8223a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -253,6 +253,12 @@ static int fops_vcodec_open(struct file *file)
 		mtk_v4l2_debug(0, "encoder capability %x", dev->enc_capability);
 	}
 
+	ret = mtk_vcodec_enc_power_on(ctx);
+	if (ret < 0) {
+		mtk_v4l2_err("encoder power on failed %d", ret);
+		goto err_load_fw;
+	}
+
 	mtk_v4l2_debug(2, "Create instance [%d]@%p m2m_ctx=%p ",
 			ctx->id, ctx, ctx->m2m_ctx);
 
@@ -285,11 +291,12 @@ static int fops_vcodec_release(struct file *file)
 	mtk_v4l2_debug(1, "[%d] encoder", ctx->id);
 	mutex_lock(&dev->dev_mutex);
 
+	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	mtk_vcodec_enc_release(ctx);
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
-	v4l2_m2m_ctx_release(ctx->m2m_ctx);
+	mtk_vcodec_enc_power_off(ctx);
 
 	list_del_init(&ctx->list);
 	kfree(ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 5edeb93fca84..d9df0e3701f1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -12,6 +12,7 @@
 
 #include "mtk_vcodec_enc_pm.h"
 #include "mtk_vcodec_util.h"
+#include "mtk_vcodec_enc_hw.h"
 
 int mtk_vcodec_init_enc_pm(struct platform_device *pdev,
 			   struct mtk_vcodec_pm *pm)
@@ -120,3 +121,84 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
 	for (i = enc_clk->clk_num - 1; i >= 0; i--)
 		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
 }
+
+int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev)
+{
+	int i, ret;
+	struct mtk_venc_comp_dev *venc_comp;
+
+	/*
+	 * frame_racing mode needs power on all available component devices.
+	 */
+	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
+		venc_comp = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[i];
+		if (!venc_comp)
+			return 0;
+
+		ret = mtk_smi_larb_get(venc_comp->pm.larbvenc);
+		if (ret < 0) {
+			mtk_v4l2_err("power on core[%d] fail %d", i, ret);
+				goto pw_err;
+		}
+	}
+	return 0;
+
+pw_err:
+	for (i -= 1; i >= 0; i--) {
+		venc_comp = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[i];
+
+		mtk_smi_larb_put(venc_comp->pm.larbvenc);
+	}
+
+	return ret;
+}
+
+int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev)
+{
+	int i;
+	struct mtk_venc_comp_dev *venc_comp;
+
+	/*power off all available component device*/
+	for (i = 0; i < MTK_VENC_HW_MAX; i++) {
+		venc_comp = (struct mtk_venc_comp_dev *)dev->enc_comp_dev[i];
+		if (!venc_comp)
+			return 0;
+
+		mtk_smi_larb_put(venc_comp->pm.larbvenc);
+	}
+
+	return 0;
+}
+
+int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx)
+{
+	int ret;
+	struct mtk_vcodec_dev *dev = ctx->dev;
+
+	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE) {
+		ret = mtk_venc_enable_comp_hw(dev);
+		if (ret < 0) {
+			mtk_v4l2_err("enable venc comp hw fail :%d", ret);
+			return ret;
+		}
+	} else {
+		ret = mtk_smi_larb_get(dev->pm.larbvenc);
+		if (ret < 0) {
+			mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+int mtk_vcodec_enc_power_off(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_vcodec_dev *dev = ctx->dev;
+
+	if (dev->venc_pdata->hw_mode == VENC_FRAME_RACING_MODE)
+		mtk_venc_disable_comp_hw(dev);
+	else
+		mtk_smi_larb_put(dev->pm.larbvenc);
+
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
index f4a4aa441185..2e76b858fed1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.h
@@ -16,4 +16,8 @@ void mtk_vcodec_release_enc_pm(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
 
+int mtk_venc_enable_comp_hw(struct mtk_vcodec_dev *dev);
+int mtk_venc_disable_comp_hw(struct mtk_vcodec_dev *dev);
+int mtk_vcodec_enc_power_on(struct mtk_vcodec_ctx *ctx);
+int mtk_vcodec_enc_power_off(struct mtk_vcodec_ctx *ctx);
 #endif /* _MTK_VCODEC_ENC_PM_H_ */
-- 
2.25.1

