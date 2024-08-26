Return-Path: <linux-media+bounces-16782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071C495EF73
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39FB31C216DA
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674AD14D457;
	Mon, 26 Aug 2024 11:07:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB76626AED;
	Mon, 26 Aug 2024 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724670470; cv=none; b=Djetjl+L5RXn0lt8siitCeanxRg75/oqcglYEaLZRgiBxMsPfj/XNu3q3bOJXrg3DDpHbOkDo4MJW6GJvlRTnj1Lg6dZUhZ1TuvVvFJjcyRvkAL5rV8lYSdxPWpdoSZHWOPqDWJ0mLOxOexkgi2BhdgQshM8LsJV0OMYwG07NGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724670470; c=relaxed/simple;
	bh=dj4U1Ol6VjN75XfJL30IPcrQv5Ew/2nZpfjwM5wO60A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oeWyBCtpP3UceYjrRFOd6AuW7v7U50uEelHG70CGJghEamZdascx+e6E+AfN+nLtIqN6aVQ0himwmwVtf1AeTJfb8vJlUwDamkJ2yGyf+xy2uopveJWMKRnvVUp5dbwyV576pdEaGIJpcsLsyigQjfncACOly02k5BeMyjUuIfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,177,1719846000"; 
   d="scan'208";a="216597337"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2024 20:07:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.68])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 551954208E30;
	Mon, 26 Aug 2024 20:07:43 +0900 (JST)
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
Subject: [PATCH v4] media: platform: rzg2l-cru: rzg2l-video: Move request_irq() to probe()
Date: Mon, 26 Aug 2024 12:07:30 +0100
Message-ID: <20240826110740.271212-1-biju.das.jz@bp.renesas.com>
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

While at it, drop the IRQF_SHARED flag as currently there is a single user
for this IRQ.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped IRQF_SHARED flag from devm_request_irq as currently there is
   only a single IRQ user.
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
index 280efd2a8185..19e0ba9596c9 100644
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
+	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
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


