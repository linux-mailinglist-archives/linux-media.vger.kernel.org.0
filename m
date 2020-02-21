Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407DE167822
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgBUIqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:46:46 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42709 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732173AbgBUIqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:46:42 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53xEjunXDPKvK53xIjhWWV; Fri, 21 Feb 2020 09:46:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274801; bh=D4+T0ApITA2GnAc1FSzoFEKd/Br2iwQI5OXqIc8UrsI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=mzmPGzu+L0jO1x1w8jjL6O3+ojrHAKGpqsT4BqKABgORb5NBr/uRyAnRK7FkfLPS2
         M/TCgx5hf9A8n3R0by7yvvMNq4eUpnCCrbBEocZUbtDyglvx3wcjQd+ScHvxziyYIf
         geW/PXRxdal/3zjbHHMNxF++yjk6GiYlMQfdN1NLthgt4BkHG5MxNeoGWlcC/Jf+X0
         QApaclmrhWzs7qSpKbyfLmJWCCKyvL++EjSJO9iwLuNoQT2qHehzx0wNCghi+H1QoU
         aER8sKtuMlfwM1OkqEvDnXO60OUl6Kmdfu1DlSTnWuihLMmtS0w1KAFZmjwwcEyJXq
         aIrCFXzRXPaNQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC PATCH 9/9] omap3isp/rcar_fdp1/vsp1/xilinx: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:31 +0100
Message-Id: <20200221084531.576156-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMlT3jBRH0fIECehYm5BjDXaXOKjYeKFACb/SadxlwQpmYNchemC5p0rF3Jor9VnhNvmqzVDufMePX+Wt9SnnLvcWVW5YwcXdGwHiI1JN0VbVUuRCum9
 RPrCocxIrwzvYYP37royfmQPfDC4Db/b+vrLJ+l+G04IK6JBhVu+T3BEtFRnG8CPta4ZkUVZPrcbYv+laydoK6YY/XcVpPVOl0XqrSk0/Jzq1XFky71WOho8
 afKc1eJFZjYItXbNkxGuJbY6rLpvvlTIUnBDJobQBraTPCDibzcmcsAMSTqsjyIkI9KwnxI4Shd8AAszAAn/PrvvWq05saiaQJ6u71OjUTs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of VB2_USERPTR and dma-contig makes no sense for
these devices, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/omap3isp/ispvideo.c | 2 +-
 drivers/media/platform/rcar_fdp1.c         | 4 ++--
 drivers/media/platform/vsp1/vsp1_video.c   | 2 +-
 drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/platform/omap3isp/ispvideo.c
index e8c46ff1aeb4..1104654ba438 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -1319,7 +1319,7 @@ static int isp_video_open(struct file *file)
 
 	queue = &handle->queue;
 	queue->type = video->type;
-	queue->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	queue->io_modes = VB2_MMAP | VB2_DMABUF;
 	queue->drv_priv = handle;
 	queue->ops = &isp_video_queue_ops;
 	queue->mem_ops = &vb2_dma_contig_memops;
diff --git a/drivers/media/platform/rcar_fdp1.c b/drivers/media/platform/rcar_fdp1.c
index 97bed45360f0..df081f66575f 100644
--- a/drivers/media/platform/rcar_fdp1.c
+++ b/drivers/media/platform/rcar_fdp1.c
@@ -2047,7 +2047,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	int ret;
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct fdp1_buffer);
 	src_vq->ops = &fdp1_qops;
@@ -2061,7 +2061,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 		return ret;
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct fdp1_buffer);
 	dst_vq->ops = &fdp1_qops;
diff --git a/drivers/media/platform/vsp1/vsp1_video.c b/drivers/media/platform/vsp1/vsp1_video.c
index 5e59ed2c3614..112e2092f6d3 100644
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@ -1300,7 +1300,7 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 	video_set_drvdata(&video->video, video);
 
 	video->queue.type = video->type;
-	video->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	video->queue.io_modes = VB2_MMAP | VB2_DMABUF;
 	video->queue.lock = &video->lock;
 	video->queue.drv_priv = video;
 	video->queue.buf_struct_size = sizeof(struct vsp1_vb2_buffer);
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index b211380a11f2..57e52ad720dd 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -708,7 +708,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
 	 * instead of 'cat' isn't really a drawback.
 	 */
 	dma->queue.type = type;
-	dma->queue.io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dma->queue.io_modes = VB2_MMAP | VB2_DMABUF;
 	dma->queue.lock = &dma->lock;
 	dma->queue.drv_priv = dma;
 	dma->queue.buf_struct_size = sizeof(struct xvip_dma_buffer);
-- 
2.25.0

