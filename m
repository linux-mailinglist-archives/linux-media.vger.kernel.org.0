Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABC821D4FB
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729543AbgGMLa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:30:56 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:34595 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729027AbgGMLa4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:30:56 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwfYj6z2lGLmCuwfejB4tx; Mon, 13 Jul 2020 13:30:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594639854; bh=094ART6fsiTMvB26geTAXWvaGzP9j98uCNjR53aC5Cg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=sE7JwRZXzEcvySHLyL3NUKotaomgSwJlJU/DeFxIVNNQ0IkWvGFaRFEdtiLirOc/b
         zE1HF//k11qo7/CNYjAkkOn1ZPYX2jRAdTjANbPdWRQWcT27wm82wBQOD2LR4GYFbI
         Dbe7HvE9m1jNtkOMGtlQi68mPjCJ1n8vCiSt3F2jLUqOoa0YaxJq3XG5n8E8uhCXGV
         3wVLu6neux/X/kwOer0OC6sdyXQccYMUI/AQB9OPm4frEwGE6fxvnim/An5DZ51lsu
         ca1N5axwYmCiWPUVBCaLkAQGqkGiu1n/bTfRImt9sKlojblWvhYpM+qLFfiooNnlPi
         6wwSHyhpah8aQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Robert Foss <robert.foss@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCHv3 2/7] qcom/camss: use vb2_video_unregister_device()
Date:   Mon, 13 Jul 2020 13:30:43 +0200
Message-Id: <20200713113048.1150542-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfMGjLj2W68T9S41ABpylCO2HeD9mOSfSufutuAV/LqHukRMFxZAdQilW2K+j5cHuErszXK3Vy/rfl2vXtGS72ttOjv34Pepbs3sxOAYygQVpJTu9tLGf
 jbXRQ/ghbRewl24OVXsnfZoMlXf2BWQldgMRRUuXwTr6PN3Gb1N3mmSXuPHuljTSf72+isHB/yn0v5xTK6T01sbOUQfSt4oyJa+V6vsEBiOeT38b/+d4sZbV
 YR0LluDEdRe6LNb6AC4QnKd/YLkGyYH5KPV1RktQmsD2Xzql1XGRwy4E4ZYF35b3
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use vb2_video_unregister_device() to automatically stop streaming
at unregister time.

This avoids the use of vb2_queue_release() which should not be
called by drivers that set vdev->queue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c   |  8 --------
 drivers/media/platform/qcom/camss/camss-vfe.h   |  2 --
 drivers/media/platform/qcom/camss/camss-video.c | 12 ++----------
 drivers/media/platform/qcom/camss/camss-video.h |  2 --
 drivers/media/platform/qcom/camss/camss.c       |  5 -----
 5 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fc31c2c169cd..b7d2293a5004 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2205,14 +2205,6 @@ static const struct camss_video_ops camss_vfe_video_ops = {
 	.flush_buffers = vfe_flush_buffers,
 };
 
-void msm_vfe_stop_streaming(struct vfe_device *vfe)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(vfe->line); i++)
-		msm_video_stop_streaming(&vfe->line[i].video_out);
-}
-
 /*
  * msm_vfe_register_entities - Register subdev node for VFE module
  * @vfe: VFE device
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 0d10071ae881..a90b0d2cc6de 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -178,8 +178,6 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
 void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
 void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
 
-void msm_vfe_stop_streaming(struct vfe_device *vfe);
-
 extern const struct vfe_hw_ops vfe_ops_4_1;
 extern const struct vfe_hw_ops vfe_ops_4_7;
 
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index cdbd6dba1122..0e2fcee97eeb 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -879,7 +879,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	if (ret < 0) {
 		dev_err(v4l2_dev->dev, "Failed to init video entity: %d\n",
 			ret);
-		goto error_media_init;
+		goto error_vb2_init;
 	}
 
 	mutex_init(&video->lock);
@@ -936,23 +936,15 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 error_video_register:
 	media_entity_cleanup(&vdev->entity);
 	mutex_destroy(&video->lock);
-error_media_init:
-	vb2_queue_release(&video->vb2_q);
 error_vb2_init:
 	mutex_destroy(&video->q_lock);
 
 	return ret;
 }
 
-void msm_video_stop_streaming(struct camss_video *video)
-{
-	if (vb2_is_streaming(&video->vb2_q))
-		vb2_queue_release(&video->vb2_q);
-}
-
 void msm_video_unregister(struct camss_video *video)
 {
 	atomic_inc(&video->camss->ref_count);
-	video_unregister_device(&video->vdev);
+	vb2_video_unregister_device(&video->vdev);
 	atomic_dec(&video->camss->ref_count);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index aa35e8cc6fd5..bdbae8424140 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -52,8 +52,6 @@ struct camss_video {
 	unsigned int nformats;
 };
 
-void msm_video_stop_streaming(struct camss_video *video);
-
 int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 		       const char *name, int is_pix);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3fdc9f964a3c..d0f4360eb9a0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -964,13 +964,8 @@ void camss_delete(struct camss *camss)
  */
 static int camss_remove(struct platform_device *pdev)
 {
-	unsigned int i;
-
 	struct camss *camss = platform_get_drvdata(pdev);
 
-	for (i = 0; i < camss->vfe_num; i++)
-		msm_vfe_stop_streaming(&camss->vfe[i]);
-
 	v4l2_async_notifier_unregister(&camss->notifier);
 	v4l2_async_notifier_cleanup(&camss->notifier);
 	camss_unregister_entities(camss);
-- 
2.27.0

