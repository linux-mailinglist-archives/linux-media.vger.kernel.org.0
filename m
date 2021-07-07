Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B121B3BE304
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 08:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhGGGZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 02:25:19 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:49974 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230351AbhGGGZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 02:25:14 -0400
X-UUID: 2eee5894e9b04169bd6175bc9ca8f6b9-20210707
X-UUID: 2eee5894e9b04169bd6175bc9ca8f6b9-20210707
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 283410174; Wed, 07 Jul 2021 14:22:32 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:27 +0800
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
Subject: [PATCH v1, 10/14] media: mtk-vcodec: Add core thread
Date:   Wed, 7 Jul 2021 14:21:53 +0800
Message-ID: <20210707062157.21176-11-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
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
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  9 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 ++
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
 4 files changed, 49 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index f156a943ca62..1bcb070ef947 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -423,6 +423,15 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
+	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
+		init_waitqueue_head(&dev->core_read);
+		INIT_LIST_HEAD(&dev->core_queue);
+		spin_lock_init(&dev->core_lock);
+		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
+			"mtk-%s", "core");
+		dev->num_core = 0;
+	}
+
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	mutex_init(&dev->dev_mutex);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 68b3fbcd95b0..9a2a3821d4e1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -34,6 +34,7 @@
 #define MTK_VCODEC_MAX_PLANES	3
 #define MTK_V4L2_BENCHMARK	0
 #define WAIT_INTR_TIMEOUT_MS	1000
+#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 
 /*
  * enum mtk_hw_reg_idx - MTK hw register base index
@@ -519,6 +520,7 @@ struct mtk_vcodec_dev {
 	struct device_node *component_node[MTK_VDEC_HW_MAX];
 	int comp_idx;
 
+	struct task_struct *kthread_core;
 	wait_queue_head_t core_read;
 	struct list_head core_queue;
 	spinlock_t core_lock;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
index 9d684e5f051c..4841b7c17c41 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -232,3 +232,35 @@ void vdec_msg_queue_deinit(
 
 	msg_queue->init_done = false;
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
+		lat_buf = vdec_msg_queue_get_core_buf(dev);
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
+		vdec_msg_queue_buf_to_lat(lat_buf);
+	}
+
+	mtk_v4l2_debug(3, "Video Capture Thread End");
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
index 62261702c464..dba127843f14 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
@@ -127,4 +127,10 @@ void vdec_msg_queue_deinit(
 	struct mtk_vcodec_ctx *ctx,
 	struct vdec_msg_queue *msg_queue);
 
+/**
+ * vdec_msg_queue_core_thead - used for core decoder.
+ * @data: private data used for each codec
+ */
+int vdec_msg_queue_core_thead(void *data);
+
 #endif
-- 
2.18.0

