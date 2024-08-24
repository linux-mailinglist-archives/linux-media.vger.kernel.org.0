Return-Path: <linux-media+bounces-16708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D113695DF90
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 20:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1A841C20E59
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 18:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F8E664C6;
	Sat, 24 Aug 2024 18:21:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486754502B;
	Sat, 24 Aug 2024 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724523695; cv=none; b=mJjD+bfIQErMbUYj7vIs22c6YTrPSzNbsWFdCwB9UkW0hsp/dUfcLwTayetGL8PaTjVlm8BSR8YHmV6DhCjWnIVoy0d/HyuYwISb4DI0jI2VqpG9fgx5nty0NHrza61SXoxDETQKolvFl+ozPB8Mx0gkpbiSIT/TKjp4F7h2Z/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724523695; c=relaxed/simple;
	bh=S6lp/L5zdQ7hFyqGBE0lmaauUnvb1YMtiBboFWqXwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tG2VJb2NhNDnf5Xmi/n7IgjBJpJPd6qkv2queIrs97ntijsPpcWZwTyXP/huq8PeS2Qnp6wSKubQ9+qMDVaytaxqdFcfvLzZOMMCywxwpl+NoJTMcHq0zuMFFS0ZrsPWQh4XdxVoh2ozxdT3hd7qc6ztJbm2m4Q4h2xsZhqoiRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,173,1719846000"; 
   d="scan'208";a="216446467"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2024 03:21:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8351840078CF;
	Sun, 25 Aug 2024 03:21:22 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move request_irq() to probe()
Date: Sat, 24 Aug 2024 19:21:17 +0100
Message-ID: <20240824182120.320751-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move request_irq() to probe(), in order to avoid requesting IRQ during
device start which happens frequently. As this function is in probe(), it
is better to replace it with its devm variant for managing the resource
efficiently.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped wrapper function rzg2l_cru_process_irq() and made
   rzg2l_cru_irq() global.
 * Added Rb tag from Laurent.
v1->v2:
 * Updated commit header and description.
 * Moved rzg2l_cru_irq from rzg2l-video.c->rzg2l-core.c and introduced
   rzg2l_cru_process_irq() in video.c to process irq.
 * Dropped image_conv_irq from struct rzg2l_cru_dev
 * Replaced request_irq with its devm variant.
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c | 13 +++++++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h  |  6 ++----
 .../platform/renesas/rzg2l-cru/rzg2l-video.c      | 15 ++-------------
 3 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 280efd2a8185..2a2907beb722 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -242,7 +242,7 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
 	struct rzg2l_cru_dev *cru;
-	int ret;
+	int irq, ret;
 
 	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
 	if (!cru)
@@ -270,9 +270,14 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	cru->dev = &pdev->dev;
 	cru->info = of_device_get_match_data(&pdev->dev);
 
-	cru->image_conv_irq = platform_get_irq(pdev, 0);
-	if (cru->image_conv_irq < 0)
-		return cru->image_conv_irq;
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, cru);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
 
 	platform_set_drvdata(pdev, cru);
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index a5a99b004322..174760239548 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -8,6 +8,7 @@
 #ifndef __RZG2L_CRU__
 #define __RZG2L_CRU__
 
+#include <linux/irqreturn.h>
 #include <linux/reset.h>
 
 #include <media/v4l2-async.h>
@@ -68,8 +69,6 @@ struct rzg2l_cru_ip {
  *
  * @vclk:		CRU Main clock
  *
- * @image_conv_irq:	Holds image conversion interrupt number
- *
  * @vdev:		V4L2 video device associated with CRU
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
@@ -105,8 +104,6 @@ struct rzg2l_cru_dev {
 
 	struct clk *vclk;
 
-	int image_conv_irq;
-
 	struct video_device vdev;
 	struct v4l2_device v4l2_dev;
 	u8 num_buf;
@@ -141,6 +138,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
 
 int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
+irqreturn_t rzg2l_cru_irq(int irq, void *data);
 
 const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index b16b8af6e8f8..e80bfb9fc1af 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -527,7 +527,7 @@ static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_set_stream(cru, 0);
 }
 
-static irqreturn_t rzg2l_cru_irq(int irq, void *data)
+irqreturn_t rzg2l_cru_irq(int irq, void *data)
 {
 	struct rzg2l_cru_dev *cru = data;
 	unsigned int handled = 0;
@@ -637,13 +637,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		goto assert_aresetn;
 	}
 
-	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
-			  IRQF_SHARED, KBUILD_MODNAME, cru);
-	if (ret) {
-		dev_err(cru->dev, "failed to request irq\n");
-		goto assert_presetn;
-	}
-
 	/* Allocate scratch buffer. */
 	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
 					  &cru->scratch_phys, GFP_KERNEL);
@@ -651,7 +644,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
 		dev_err(cru->dev, "Failed to allocate scratch buffer\n");
 		ret = -ENOMEM;
-		goto free_image_conv_irq;
+		goto assert_presetn;
 	}
 
 	cru->sequence = 0;
@@ -670,9 +663,6 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
 	if (ret)
 		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
 				  cru->scratch_phys);
-free_image_conv_irq:
-	free_irq(cru->image_conv_irq, cru);
-
 assert_presetn:
 	reset_control_assert(cru->presetn);
 
@@ -698,7 +688,6 @@ static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
 	dma_free_coherent(cru->dev, cru->format.sizeimage,
 			  cru->scratch, cru->scratch_phys);
 
-	free_irq(cru->image_conv_irq, cru);
 	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
 
 	reset_control_assert(cru->presetn);
-- 
2.43.0


