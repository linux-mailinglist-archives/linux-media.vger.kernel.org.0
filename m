Return-Path: <linux-media+bounces-5435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA985AA8E
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 19:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DABC283238
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 18:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CA9481A4;
	Mon, 19 Feb 2024 18:06:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF5A4779F;
	Mon, 19 Feb 2024 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708365961; cv=none; b=XmLdUF9D2iSafLw7OqOsswZhfAZREu5/iUeggqhYw7IUWwndl6Qkff/Tz0iossIyFiK+7gbtYo5ES7dLgEpVGOGNoUjap9qJuwpoqdXI3+lSQMgKsx+r3fX9TOuVAe7sSKeUANUnJ1AOpJtfwiySg9yi0J84qQJHX1SJwUfszrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708365961; c=relaxed/simple;
	bh=zVR0mpr76pBRPYcqLswZ84OSh9WJ1u6o17nRGlhbI54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X/sjyBsP4Pv3tqLgM4WXBfxZZeaYVJj3KL3u2LBBdFCYgeYikQFL31lmKbRoLVymI3g+SoHCNvpxOyxIZGJt068n4KHIkLn7VHKOwKUqGlWgd404Mr8JXnFufV+UprKI0p3vF2TuCbMPrcPRD2wh9Q/Wg2Egz1/o58BX2W/7wGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="194456497"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 20 Feb 2024 03:05:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.217])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 91E2D40534DB;
	Tue, 20 Feb 2024 03:05:47 +0900 (JST)
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
Subject: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Move request_irq() to rzg2l_cru_video_register()
Date: Mon, 19 Feb 2024 18:05:44 +0000
Message-Id: <20240219180544.526537-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move request_irq() to rzg2l_cru_video_register(), in order to avoid
requesting IRQ during device start which happens frequently.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 35 ++++++++++---------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index b16b8af6e8f8..78fc5ae6c8af 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
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
@@ -1011,6 +1000,7 @@ void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru)
 {
 	media_device_unregister(&cru->mdev);
 	video_unregister_device(&cru->vdev);
+	free_irq(cru->image_conv_irq, cru);
 }
 
 int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
@@ -1018,6 +1008,13 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
 	struct video_device *vdev = &cru->vdev;
 	int ret;
 
+	ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
+			  IRQF_SHARED, KBUILD_MODNAME, cru);
+	if (ret) {
+		dev_err(cru->dev, "failed to request irq\n");
+		return ret;
+	}
+
 	if (video_is_registered(&cru->vdev)) {
 		struct media_entity *entity;
 
@@ -1032,14 +1029,18 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(cru->dev, "Failed to register video device\n");
-		return ret;
+		goto err_request_irq;
 	}
 
 	ret = media_device_register(&cru->mdev);
-	if (ret) {
-		video_unregister_device(&cru->vdev);
-		return ret;
-	}
+	if (ret)
+		goto err_video_unregister;
 
 	return 0;
+
+err_video_unregister:
+	video_unregister_device(&cru->vdev);
+err_request_irq:
+	free_irq(cru->image_conv_irq, cru);
+	return ret;
 }
-- 
2.25.1


