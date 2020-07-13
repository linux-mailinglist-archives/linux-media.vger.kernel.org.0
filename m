Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F09F21D501
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729564AbgGMLa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:30:58 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49599 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729259AbgGMLa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:30:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwfYj6z2lGLmCuwfejB4uB; Mon, 13 Jul 2020 13:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594639854; bh=sZ5mgUapeUrafhkk8qbnivKTQWnbdTU1LG7BYMBvrI0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=ja31k6ra+6mKHKXoxddqFfClrPFG2i9/ot5iBam6wJ9nhYbZ4BYgu+U0PoqmBHugN
         jQAjATPRc+D3U+BRsKxUmpAz/yVcyyeTOOHbHUJU1Qq32flba38+G5LFrSuEk9M/7+
         WZDKq1OZB42A3sqesdGztOeeyOdmTUpYD0HF9FKPlAiLA01+qeaf6WbNkucJfflkCy
         FNdmguRYv7fikJYHsmmCovdj30ssg7rZaZj9o2FGO7E7OxtzeKZM4vhtVvxtLQb4Fn
         8SaxLFRuFEA5VaRM5nxERW+dB70FATspWD9QqXg/FANSd8miRBw4ZgCfoCUscVThBh
         5bosfGd2vhTPw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCHv3 4/7] media/platform: drop vb2_queue_release()
Date:   Mon, 13 Jul 2020 13:30:45 +0200
Message-Id: <20200713113048.1150542-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMGjLj2W68T9S41ABpylCO2HeD9mOSfSufutuAV/LqHukRMFxZAdQilW2K+j5cHuErszXK3Vy/rfl2vXtGS72ttOjv34Pepbs3sxOAYygQVpJTu9tLGf
 jbXRQ/ghbRewlzlj5UtlhG4vHmolcSemDlmcQLpEgCj0rIqCP0EOrfeTwcAmpoQmW1KQTb2yMvwhRiUEV0octzMhFl9iMoe2TYf7C/SVyQMgNAx4FPh2txsk
 M9htPsTPuMLYzYw49olol0iw+VFnKyxEux+9W4K+/kRuEWuHVzSuK69BzVihAmcv3n7llauTabNybY5pVxY9brKX0FnliZA2DW4SLy2+yvXX6dzl+mTStVv6
 k7b75yPadxlJHvBakU5LWG7n92YVzYHvsFCOrZ1HM+Y4FY8mDH8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is only needed for drivers that do not use vb2_fop_release().
Note that vb2_queue_release() is *not* the counterpart of vb2_queue_init()
as some drivers here seem to think.

Also use vb2_video_unregister_device() to automatically stop streaming
at unregister time for those drivers that set vdev->queue.

Note that sun4i-csi didn't unregister the video device at all. That's
now fixed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/aspeed-video.c                | 5 +----
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c   | 4 +---
 drivers/media/platform/qcom/venus/vdec.c             | 8 +-------
 drivers/media/platform/qcom/venus/venc.c             | 8 +-------
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c   | 1 +
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c   | 6 +-----
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 7 ++-----
 7 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7d98db1d9b52..c46a79eace98 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1597,7 +1597,6 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	video_set_drvdata(vdev, video);
 	rc = video_register_device(vdev, VFL_TYPE_VIDEO, 0);
 	if (rc) {
-		vb2_queue_release(vbq);
 		v4l2_ctrl_handler_free(&video->ctrl_handler);
 		v4l2_device_unregister(v4l2_dev);
 
@@ -1737,9 +1736,7 @@ static int aspeed_video_remove(struct platform_device *pdev)
 	clk_unprepare(video->vclk);
 	clk_unprepare(video->eclk);
 
-	video_unregister_device(&video->vdev);
-
-	vb2_queue_release(&video->queue);
+	vb2_video_unregister_device(&video->vdev);
 
 	v4l2_ctrl_handler_free(&video->ctrl_handler);
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 0f3e710aed4e..25b2ac03243d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -1525,10 +1525,8 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->dev             = &ctx->dev->plat_dev->dev;
 
 	ret = vb2_queue_init(dst_vq);
-	if (ret) {
-		vb2_queue_release(src_vq);
+	if (ret)
 		mtk_v4l2_err("Failed to initialize videobuf2 queue(capture)");
-	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7c4c483d5438..fbefc1634820 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1453,13 +1453,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->allow_zero_bytesused = 1;
 	dst_vq->min_buffers_needed = 0;
 	dst_vq->dev = inst->core->dev;
-	ret = vb2_queue_init(dst_vq);
-	if (ret) {
-		vb2_queue_release(src_vq);
-		return ret;
-	}
-
-	return 0;
+	return vb2_queue_init(dst_vq);
 }
 
 static int vdec_open(struct file *file)
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 513bbc07f7bc..a4a92c2a3a28 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1129,13 +1129,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->allow_zero_bytesused = 1;
 	dst_vq->min_buffers_needed = 1;
 	dst_vq->dev = inst->core->dev;
-	ret = vb2_queue_init(dst_vq);
-	if (ret) {
-		vb2_queue_release(src_vq);
-		return ret;
-	}
-
-	return 0;
+	return vb2_queue_init(dst_vq);
 }
 
 static void venc_inst_init(struct venus_inst *inst)
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index eff34ded6305..fdabd6888bd3 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -285,6 +285,7 @@ static int sun4i_csi_remove(struct platform_device *pdev)
 
 	v4l2_async_notifier_unregister(&csi->notifier);
 	v4l2_async_notifier_cleanup(&csi->notifier);
+	vb2_video_unregister_device(&csi->vdev);
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 	media_device_cleanup(&csi->mdev);
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index 78fa1c535ac6..dbc9fe254ffd 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -431,7 +431,7 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
 	ret = v4l2_device_register(csi->dev, &csi->v4l);
 	if (ret) {
 		dev_err(csi->dev, "Couldn't register the v4l2 device\n");
-		goto err_free_queue;
+		goto err_free_mutex;
 	}
 
 	ret = devm_request_irq(csi->dev, irq, sun4i_csi_irq, 0,
@@ -446,9 +446,6 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
 err_unregister_device:
 	v4l2_device_unregister(&csi->v4l);
 
-err_free_queue:
-	vb2_queue_release(q);
-
 err_free_mutex:
 	mutex_destroy(&csi->lock);
 	return ret;
@@ -457,6 +454,5 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
 void sun4i_csi_dma_unregister(struct sun4i_csi *csi)
 {
 	v4l2_device_unregister(&csi->v4l);
-	vb2_queue_release(&csi->queue);
 	mutex_destroy(&csi->lock);
 }
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index d9648b2810b9..b55de9ab64d8 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -660,13 +660,11 @@ int sun6i_video_init(struct sun6i_video *video, struct sun6i_csi *csi,
 	if (ret < 0) {
 		v4l2_err(&csi->v4l2_dev,
 			 "video_register_device failed: %d\n", ret);
-		goto release_vb2;
+		goto clean_entity;
 	}
 
 	return 0;
 
-release_vb2:
-	vb2_queue_release(&video->vb2_vidq);
 clean_entity:
 	media_entity_cleanup(&video->vdev.entity);
 	mutex_destroy(&video->lock);
@@ -675,8 +673,7 @@ int sun6i_video_init(struct sun6i_video *video, struct sun6i_csi *csi,
 
 void sun6i_video_cleanup(struct sun6i_video *video)
 {
-	video_unregister_device(&video->vdev);
+	vb2_video_unregister_device(&video->vdev);
 	media_entity_cleanup(&video->vdev.entity);
-	vb2_queue_release(&video->vb2_vidq);
 	mutex_destroy(&video->lock);
 }
-- 
2.27.0

