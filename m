Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9771D6E3F2D
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 07:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjDQFsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 01:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjDQFsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 01:48:35 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE87213C;
        Sun, 16 Apr 2023 22:48:32 -0700 (PDT)
X-UUID: 78090416dce311edb6b9f13eb10bd0fe-20230417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bR+3VQ4pgEd9D0cvCIdbSbGHQlUdRFLRZbIE+vgAQ/g=;
        b=VuHZh1S/FZQFacVzCcIqCUGU6Ptp2vF+Z+Qq3mAR8M7fJCRc4SO22qtuyVfji4bJYPBUsh7JOUwSkwZd9sVtFKyyl59KJoarPJ/hXSJXOnose7pJmHaudya4opEKn+JiS9DKZxXs3Bnw2NACPjNfHR+WWhB8aZylMjMM2CzVCq0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:7494e933-64c8-496f-8aac-3431d7cfa8e1,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:bb018da1-8fcb-430b-954a-ba3f00fa94a5,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 78090416dce311edb6b9f13eb10bd0fe-20230417
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1037136820; Mon, 17 Apr 2023 13:48:24 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 13:48:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 13:48:22 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 5/6] media: mediatek: vcodec: move core context from device to each instance
Date:   Mon, 17 Apr 2023 13:48:15 +0800
Message-ID: <20230417054816.17097-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417054816.17097-1-yunfei.dong@mediatek.com>
References: <20230417054816.17097-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are so many lat buffer in core context list, some instances
maybe be scheduled for a very long time. Moving the core context to
each instance, it only be used to control lat buffer of each instance.
And the core work queue of each instance is scheduled by system.

Fixes: 2cfca6c1bf80 ("media: mediatek: vcodec: move lat_buf to the top of core list")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |  1 -
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  2 -
 .../vcodec/vdec/vdec_h264_req_multi_if.c      |  4 +-
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         |  2 +-
 .../platform/mediatek/vcodec/vdec_msg_queue.c | 53 +++++++------------
 .../platform/mediatek/vcodec/vdec_msg_queue.h |  6 ++-
 6 files changed, 25 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index 3755acc61d7d..d2543fb27ba7 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -310,7 +310,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	}
 
 	if (IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
-		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx, MTK_VDEC_CORE);
 		dev->core_workqueue =
 			alloc_ordered_workqueue("core-decoder",
 						WQ_MEM_RECLAIM | WQ_FREEZABLE);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 9acab54fd650..15d2cb171b89 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -461,7 +461,6 @@ struct mtk_vcodec_enc_pdata {
  * @enc_capability: used to identify encode capability
  *
  * @core_workqueue: queue used for core hardware decode
- * @msg_queue_core_ctx: msg queue context used for core workqueue
  *
  * @subdev_dev: subdev hardware device
  * @subdev_prob_done: check whether all used hw device is prob done
@@ -510,7 +509,6 @@ struct mtk_vcodec_dev {
 	unsigned int enc_capability;
 
 	struct workqueue_struct *core_workqueue;
-	struct vdec_msg_queue_ctx msg_queue_core_ctx;
 
 	void *subdev_dev[MTK_VDEC_HW_MAX];
 	int (*subdev_prob_done)(struct mtk_vcodec_dev *vdec_dev);
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
index 181cc52e0847..a7e8e3257b7f 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
@@ -672,7 +672,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
 		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
 		       sizeof(share_info->h264_slice_params));
-		vdec_msg_queue_qbuf(&inst->ctx->dev->msg_queue_core_ctx, lat_buf);
+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
 
 	/* wait decoder done interrupt */
@@ -698,7 +698,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
 		memcpy(&share_info->h264_slice_params, &inst->vsi->h264_slice_params,
 		       sizeof(share_info->h264_slice_params));
-		vdec_msg_queue_qbuf(&inst->ctx->dev->msg_queue_core_ctx, lat_buf);
+		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
 	mtk_vcodec_debug(inst, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
 			 inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index 6d981d7341d2..c2f90848f498 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -2119,7 +2119,7 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
 				       vsi->trans.dma_addr_end +
 				       ctx->msg_queue.wdma_addr.dma_addr);
-	vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
+	vdec_msg_queue_qbuf(&ctx->msg_queue.core_ctx, lat_buf);
 
 	return 0;
 err_free_fb_out:
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
index ef141f9d7bb1..a74bd839d7e2 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
@@ -177,26 +177,17 @@ void vdec_msg_queue_update_ube_wptr(struct vdec_msg_queue *msg_queue, uint64_t u
 
 bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 {
-	struct vdec_lat_buf *buf, *tmp;
-	struct list_head *list_core[3];
-	struct vdec_msg_queue_ctx *core_ctx;
-	int ret, i, in_core_count = 0, count = 0;
+	int ret;
 	long timeout_jiff;
 
-	core_ctx = &msg_queue->ctx->dev->msg_queue_core_ctx;
-	spin_lock(&core_ctx->ready_lock);
-	list_for_each_entry_safe(buf, tmp, &core_ctx->ready_queue, core_list) {
-		if (buf && buf->ctx == msg_queue->ctx) {
-			list_core[in_core_count++] = &buf->core_list;
-			list_del(&buf->core_list);
-		}
-	}
-
-	for (i = 0; i < in_core_count; i++) {
-		list_add(list_core[in_core_count - (1 + i)], &core_ctx->ready_queue);
-		queue_work(msg_queue->ctx->dev->core_workqueue, &msg_queue->core_work);
+	if (atomic_read(&msg_queue->lat_list_cnt) == NUM_BUFFER_COUNT) {
+		mtk_v4l2_debug(3, "wait buf full: list(%d %d) ready_num:%d status:%d",
+			       atomic_read(&msg_queue->lat_list_cnt),
+			       atomic_read(&msg_queue->core_list_cnt),
+			       msg_queue->lat_ctx.ready_num,
+			       msg_queue->status);
+		return true;
 	}
-	spin_unlock(&core_ctx->ready_lock);
 
 	timeout_jiff = msecs_to_jiffies(1000 * (NUM_BUFFER_COUNT + 2));
 	ret = wait_event_timeout(msg_queue->ctx->msg_queue.core_dec_done,
@@ -208,18 +199,9 @@ bool vdec_msg_queue_wait_lat_buf_full(struct vdec_msg_queue *msg_queue)
 		return true;
 	}
 
-	spin_lock(&core_ctx->ready_lock);
-	list_for_each_entry_safe(buf, tmp, &core_ctx->ready_queue, core_list) {
-		if (buf && buf->ctx == msg_queue->ctx) {
-			count++;
-			list_del(&buf->core_list);
-		}
-	}
-	spin_unlock(&core_ctx->ready_lock);
-
-	mtk_v4l2_err("failed with lat buf isn't full: list(%d %d) count:%d",
+	mtk_v4l2_err("failed with lat buf isn't full: list(%d %d)",
 		     atomic_read(&msg_queue->lat_list_cnt),
-		     atomic_read(&msg_queue->core_list_cnt), count);
+		     atomic_read(&msg_queue->core_list_cnt));
 
 	return false;
 }
@@ -247,6 +229,8 @@ void vdec_msg_queue_deinit(struct vdec_msg_queue *msg_queue,
 
 		kfree(lat_buf->private_data);
 	}
+
+	cancel_work_sync(&msg_queue->core_work);
 }
 
 static void vdec_msg_queue_core_work(struct work_struct *work)
@@ -258,11 +242,11 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 	struct mtk_vcodec_dev *dev = ctx->dev;
 	struct vdec_lat_buf *lat_buf;
 
-	spin_lock(&ctx->dev->msg_queue_core_ctx.ready_lock);
+	spin_lock(&msg_queue->core_ctx.ready_lock);
 	ctx->msg_queue.status &= ~CONTEXT_LIST_QUEUED;
-	spin_unlock(&ctx->dev->msg_queue_core_ctx.ready_lock);
+	spin_unlock(&msg_queue->core_ctx.ready_lock);
 
-	lat_buf = vdec_msg_queue_dqbuf(&dev->msg_queue_core_ctx);
+	lat_buf = vdec_msg_queue_dqbuf(&msg_queue->core_ctx);
 	if (!lat_buf)
 		return;
 
@@ -276,12 +260,11 @@ static void vdec_msg_queue_core_work(struct work_struct *work)
 	mtk_vcodec_dec_disable_hardware(ctx, MTK_VDEC_CORE);
 	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 
-	wake_up_all(&ctx->msg_queue.core_dec_done);
 	if (!(ctx->msg_queue.status & CONTEXT_LIST_QUEUED) &&
 	    atomic_read(&msg_queue->core_list_cnt)) {
-		spin_lock(&ctx->dev->msg_queue_core_ctx.ready_lock);
+		spin_lock(&msg_queue->core_ctx.ready_lock);
 		ctx->msg_queue.status |= CONTEXT_LIST_QUEUED;
-		spin_unlock(&ctx->dev->msg_queue_core_ctx.ready_lock);
+		spin_unlock(&msg_queue->core_ctx.ready_lock);
 		queue_work(ctx->dev->core_workqueue, &msg_queue->core_work);
 	}
 }
@@ -297,8 +280,8 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
 	if (msg_queue->wdma_addr.size)
 		return 0;
 
-	msg_queue->ctx = ctx;
 	vdec_msg_queue_init_ctx(&msg_queue->lat_ctx, MTK_VDEC_LAT0);
+	vdec_msg_queue_init_ctx(&msg_queue->core_ctx, MTK_VDEC_CORE);
 	INIT_WORK(&msg_queue->core_work, vdec_msg_queue_core_work);
 
 	atomic_set(&msg_queue->lat_list_cnt, 0);
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
index a80b9853cec9..ae37d020a1bd 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
@@ -83,10 +83,11 @@ struct vdec_lat_buf {
  * @wdma_wptr_addr: ube write point
  * @core_work: core hardware work
  * @lat_ctx: used to store lat buffer list
- * @ctx: point to mtk_vcodec_ctx
+ * @core_ctx: used to store core buffer list
  *
  * @lat_list_cnt: used to record each instance lat list count
  * @core_list_cnt: used to record each instance core list count
+ * @flush_done: core flush done status
  * @empty_lat_buf: the last lat buf used to flush decode
  * @core_dec_done: core work queue decode done event
  * @status: current context decode status for core hardware
@@ -100,10 +101,11 @@ struct vdec_msg_queue {
 
 	struct work_struct core_work;
 	struct vdec_msg_queue_ctx lat_ctx;
-	struct mtk_vcodec_ctx *ctx;
+	struct vdec_msg_queue_ctx core_ctx;
 
 	atomic_t lat_list_cnt;
 	atomic_t core_list_cnt;
+	bool flush_done;
 	struct vdec_lat_buf empty_lat_buf;
 	wait_queue_head_t core_dec_done;
 	int status;
-- 
2.18.0

