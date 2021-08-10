Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0753E555B
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 10:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238357AbhHJIcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 04:32:04 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:46340 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S238322AbhHJIcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 04:32:01 -0400
X-UUID: 8633699cd3f0452598288df347bbe355-20210810
X-UUID: 8633699cd3f0452598288df347bbe355-20210810
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 45540202; Tue, 10 Aug 2021 16:31:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:31:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:31:33 +0800
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
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        George Sun <george.sun@mediatek.com>
Subject: [PATCH v4, 11/15] media: mtk-vcodec: Add core thread
Date:   Tue, 10 Aug 2021 16:30:43 +0800
Message-ID: <20210810083047.16693-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810083047.16693-1-yunfei.dong@mediatek.com>
References: <20210810083047.16693-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Core thread:
1. Gets lat_buf from core msg queue.
2. Proceeds core decode.
3. Puts the lat_buf back to lat msg queue.

Both H264 and VP9 rely on the core thread.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v4: no change
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  7 ++++
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
 4 files changed, 57 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 37ecb8252955..05601d911fb4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -406,6 +406,18 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_dec_pm;
 	}
 
+	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
+		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
+			MTK_VDEC_CORE);
+		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
+			"mtk-%s", "core");
+		if (IS_ERR(dev->kthread_core)) {
+			dev_err(&pdev->dev, "Failed to create core thread");
+			ret = PTR_ERR(dev->kthread_core);
+			goto err_res;
+		}
+	}
+
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	spin_lock_init(&dev->irqlock);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index f1e63acaec76..b6f030a6e55f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -27,6 +27,7 @@
 #define MTK_VCODEC_MAX_PLANES	3
 #define MTK_V4L2_BENCHMARK	0
 #define WAIT_INTR_TIMEOUT_MS	1000
+#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 
 /*
  * enum mtk_hw_reg_idx - MTK hw register base index
@@ -465,6 +466,9 @@ struct mtk_vcodec_enc_pdata {
  *
  * @comp_dev: component hardware device
  * @component_node: component node
+ *
+ * @kthread_core: thread used for core hardware decode
+ * @msg_queue_core_ctx: msg queue context used for core thread
  */
 struct mtk_vcodec_dev {
 	struct v4l2_device v4l2_dev;
@@ -505,6 +509,9 @@ struct mtk_vcodec_dev {
 
 	void *comp_dev[MTK_VDEC_HW_MAX];
 	struct device_node *component_node[MTK_VDEC_HW_MAX];
+
+	struct task_struct *kthread_core;
+	struct vdec_msg_queue_ctx msg_queue_core_ctx;
 };
 
 static inline struct mtk_vcodec_ctx *fh_to_ctx(struct v4l2_fh *fh)
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
index d66ed98c79a9..665f571eab4b 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -256,3 +256,35 @@ void vdec_msg_queue_deinit(
 			kfree(lat_buf->private_data);
 	}
 }
+
+int vdec_msg_queue_core_thead(void *data)
+{
+	struct mtk_vcodec_dev *dev = data;
+	struct vdec_lat_buf *lat_buf;
+	struct mtk_vcodec_ctx *ctx;
+
+	set_freezable();
+	for (;;) {
+		try_to_freeze();
+		if (kthread_should_stop())
+			break;
+
+		lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
+		if (!lat_buf)
+			continue;
+
+		ctx = lat_buf->ctx;
+		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
+
+		if (!lat_buf->core_decode)
+			mtk_v4l2_err("Core decode callback func is NULL");
+		else
+			lat_buf->core_decode(lat_buf);
+
+		mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
+		vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
+	}
+
+	mtk_v4l2_debug(3, "Video Capture Thread End");
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
index 1905ce713592..b5745b144140 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
@@ -148,4 +148,10 @@ void vdec_msg_queue_deinit(
 	struct vdec_msg_queue *msg_queue,
 	struct mtk_vcodec_ctx *ctx);
 
+/**
+ * vdec_msg_queue_core_thead - used for core decoder.
+ * @data: private data used for each codec
+ */
+int vdec_msg_queue_core_thead(void *data);
+
 #endif
-- 
2.25.1

