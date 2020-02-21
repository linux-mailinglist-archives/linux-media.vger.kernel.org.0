Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAD9E167821
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 09:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732545AbgBUIqq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 03:46:46 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:51251 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732166AbgBUIqm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 03:46:42 -0500
Received: from tschai.fritz.box ([46.9.235.248])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 53xEjunXDPKvK53xIjhWWM; Fri, 21 Feb 2020 09:46:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582274800; bh=4CmusGSYqOAnyUfuxuTGZN6FyhXWOk6RSPSLAqpR09E=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=P8T2M20ALMZOp3QrEk0DzVTS5Qv9koyWlhSEFZ1hfJWz5zdDVwXWptKHCvSUuPW9g
         DAm30I8MdHi/QP1omul0tpsfjYyS/hvQwuSj8G+eTnWOkAxB2V3cfWW+jA5m4C5IVw
         RTCbMm/kWq1V8M2yCnBiO+4KJcQmtCkCGRi8mdlS16driNEoS+Wx4s35r16rJ2S8qU
         PNtb8evrg6r0qPflS8MhEYEFKwmF27vSdTptWNKTOacnEI70+SqyG66Gj3UdSCOFEv
         QPyHQIoWZTKc7cJsWbqg6morosj5kmqOYpsVVFcX+7A4KZ9Hy9IAXzMLmxtEQmRbDS
         IZgnNfz1DnKUA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH 8/9] exynos/s3c/s5p: drop VB2_USERPTR
Date:   Fri, 21 Feb 2020 09:45:30 +0100
Message-Id: <20200221084531.576156-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfO7GlvQYMSL3MXpQ22kDKPL4eYxS2tdiyqRWr9VUDSTGtnwKTjpOhmLvBLlcbeerwSN2n1GCZrlmlbL3+a4Ixldw95R+RKBpfWqU4M/v0L1PJh1nCqA7
 BeCkt2g+WHPiGAaA9Xe9APiKVgX5lW4c6E0/gf82Ay8eYxQgbbxT+KvKHpBUn3UjTRrVP2fds9KVOKkjaiEhPsEqU3oxyXc+yL+sds+uRK2H6/mWcHj/nBqO
 6vwAsZ0xnVoCbc7Ws1qP7FuRGzWsOL7b8S4x0ZWojxbflMEt2lol6qb+tUFi1WLQ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The combination of VB2_USERPTR and dma-contig makes no sense for
these devices, drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
Cc: Tomasz Figa <tfiga@chromium.org>
---
 drivers/media/platform/exynos-gsc/gsc-m2m.c        | 4 ++--
 drivers/media/platform/exynos4-is/fimc-capture.c   | 2 +-
 drivers/media/platform/exynos4-is/fimc-isp-video.c | 2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c      | 2 +-
 drivers/media/platform/exynos4-is/fimc-m2m.c       | 4 ++--
 drivers/media/platform/s3c-camif/camif-capture.c   | 2 +-
 drivers/media/platform/s5p-g2d/g2d.c               | 4 ++--
 drivers/media/platform/s5p-jpeg/jpeg-core.c        | 4 ++--
 drivers/media/platform/s5p-mfc/s5p_mfc.c           | 6 ++----
 9 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-m2m.c b/drivers/media/platform/exynos-gsc/gsc-m2m.c
index 35a1d0d6dd66..f4b192e49c80 100644
--- a/drivers/media/platform/exynos-gsc/gsc-m2m.c
+++ b/drivers/media/platform/exynos-gsc/gsc-m2m.c
@@ -583,7 +583,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 
 	memset(src_vq, 0, sizeof(*src_vq));
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->ops = &gsc_m2m_qops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
@@ -598,7 +598,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 
 	memset(dst_vq, 0, sizeof(*dst_vq));
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &gsc_m2m_qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
index 121d609ff856..8d14207b3403 100644
--- a/drivers/media/platform/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/exynos4-is/fimc-capture.c
@@ -1771,7 +1771,7 @@ static int fimc_register_capture_device(struct fimc_dev *fimc,
 
 	memset(q, 0, sizeof(*q));
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->drv_priv = ctx;
 	q->ops = &fimc_capture_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index 55bae20eb8db..94f3215916f6 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -587,7 +587,7 @@ int fimc_isp_video_device_register(struct fimc_isp *isp,
 
 	memset(q, 0, sizeof(*q));
 	q->type = type;
-	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->ops = &isp_video_capture_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct isp_video_buf);
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index d06bf4865b84..3c2c70b252bb 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -1276,7 +1276,7 @@ static int fimc_lite_subdev_registered(struct v4l2_subdev *sd)
 
 	memset(q, 0, sizeof(*q));
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->ops = &fimc_lite_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct flite_buffer);
diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
index c70c2cbe3eb1..3323563ed913 100644
--- a/drivers/media/platform/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
@@ -554,7 +554,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	int ret;
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->ops = &fimc_qops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
@@ -568,7 +568,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 		return ret;
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &fimc_qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
index 54989dacaf5d..eb99468a5427 100644
--- a/drivers/media/platform/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/s3c-camif/camif-capture.c
@@ -1121,7 +1121,7 @@ int s3c_camif_register_video_node(struct camif_dev *camif, int idx)
 
 	memset(q, 0, sizeof(*q));
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	q->ops = &s3c_camif_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct camif_buffer);
diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
index 98f94e1fa6b8..a8f8c9e00452 100644
--- a/drivers/media/platform/s5p-g2d/g2d.c
+++ b/drivers/media/platform/s5p-g2d/g2d.c
@@ -144,7 +144,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	int ret;
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-	src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->ops = &g2d_qops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
@@ -158,7 +158,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 		return ret;
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &g2d_qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
index 4c10ec0d7da4..d03164854576 100644
--- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
+++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
@@ -2620,7 +2620,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	int ret;
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-	src_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->ops = &s5p_jpeg_qops;
@@ -2634,7 +2634,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 		return ret;
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->ops = &s5p_jpeg_qops;
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index ff770328f690..32df5e26daab 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -844,11 +844,10 @@ static int s5p_mfc_open(struct file *file)
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->drv_priv = &ctx->fh;
 	q->lock = &dev->mfc_mutex;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	if (vdev == dev->vfd_dec) {
-		q->io_modes = VB2_MMAP | VB2_DMABUF;
 		q->ops = get_dec_queue_ops();
 	} else if (vdev == dev->vfd_enc) {
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
 		q->ops = get_enc_queue_ops();
 	} else {
 		ret = -ENOENT;
@@ -871,11 +870,10 @@ static int s5p_mfc_open(struct file *file)
 	q->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	q->drv_priv = &ctx->fh;
 	q->lock = &dev->mfc_mutex;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
 	if (vdev == dev->vfd_dec) {
-		q->io_modes = VB2_MMAP | VB2_DMABUF;
 		q->ops = get_dec_queue_ops();
 	} else if (vdev == dev->vfd_enc) {
-		q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_USERPTR;
 		q->ops = get_enc_queue_ops();
 	} else {
 		ret = -ENOENT;
-- 
2.25.0

