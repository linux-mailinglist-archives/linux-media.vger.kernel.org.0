Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3A921D4FE
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729592AbgGMLa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:30:59 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:43013 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729492AbgGMLa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:30:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwfYj6z2lGLmCuwffjB4ua; Mon, 13 Jul 2020 13:30:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594639855; bh=Mrql/lvEqKJVu2Ll4TJUGbi9fUf4fRi+AmV3uxR8yIg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hCvqbM4Z2No8VACdwQmHPzS4rLS7hsKhyDGoPFdWZChiEENMXoW2STJHrOZQsuu/f
         y0CrK2UwN4jNc3vnJHh6Y6wtM14PYrrVxhrODUg0BbjVKDAwyhc93t8UqF15rOFhnI
         +BHI37cYKfGpGItuLyNk9nVRUEcS20bd1x0IlrytU774ECXl5Fz9MFCUBHR7tFV/zN
         KO4zDzwbZPLJlby22TF4UG15k3QlSGj1uaTdhNqrQ2BtjPSEI4LmYmRnXi0cVE816+
         ys/wpObQe8vRG4oWN6SBe4g4iVTb4x9Yoi0pE48vq01ibR5DS+zwXJlDREZyqgklTy
         Xp6Pt+V9MmjTw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCHv3 6/7] vimc: use vb2_video_unregister_device()
Date:   Mon, 13 Jul 2020 13:30:47 +0200
Message-Id: <20200713113048.1150542-7-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfITdU6KSQPq0aTLGGd39zJCYiZtad316SmmXci8O8UNejsZFEZHqcxUtF275BloNCixNV/d8/OE9NMMXcZahWIWn9RvOPVf0xuQJKNc7ofLXrhPG/kTt
 paAKeumLiUbj+tWKsZfADJhcM3w9JUVYHqD3DKP5YbHZOoN0hcV2y8pNiOSjXF32dpI9rJDEuIp8ycSU6JFrK8ay8R+8wGozTzRt/1WZWwr4n/gHerRhZS4q
 fD8UHpDJX2AFwvLI8Sk+EWP3HKvxd20nHQKEf2iMZvU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use vb2_video_unregister_device() to automatically stop streaming
at unregister time.

This avoids the use of vb2_queue_release() which should not be
called by drivers that set vdev->queue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Helen Koike <helen.koike@collabora.com>
---
 .../media/test-drivers/vimc/vimc-capture.c    |  7 ++--
 drivers/media/test-drivers/vivid/vivid-core.c | 32 +++++++++----------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index c63496b17b9a..5e9fd902cd37 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -351,8 +351,7 @@ static void vimc_cap_unregister(struct vimc_ent_device *ved)
 	struct vimc_cap_device *vcap =
 		container_of(ved, struct vimc_cap_device, ved);
 
-	vb2_queue_release(&vcap->queue);
-	video_unregister_device(&vcap->vdev);
+	vb2_video_unregister_device(&vcap->vdev);
 }
 
 static void *vimc_cap_process_frame(struct vimc_ent_device *ved,
@@ -477,13 +476,11 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 	if (ret) {
 		dev_err(vimc->mdev.dev, "%s: video register failed (err=%d)\n",
 			vcap->vdev.name, ret);
-		goto err_release_queue;
+		goto err_clean_m_ent;
 	}
 
 	return &vcap->ved;
 
-err_release_queue:
-	vb2_queue_release(q);
 err_clean_m_ent:
 	media_entity_cleanup(&vcap->vdev.entity);
 err_free_vcap:
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index f7ee37e9508d..931218fa955e 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1827,16 +1827,16 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	return 0;
 
 unreg_dev:
-	video_unregister_device(&dev->touch_cap_dev);
-	video_unregister_device(&dev->meta_out_dev);
-	video_unregister_device(&dev->meta_cap_dev);
+	vb2_video_unregister_device(&dev->touch_cap_dev);
+	vb2_video_unregister_device(&dev->meta_out_dev);
+	vb2_video_unregister_device(&dev->meta_cap_dev);
 	video_unregister_device(&dev->radio_tx_dev);
 	video_unregister_device(&dev->radio_rx_dev);
-	video_unregister_device(&dev->sdr_cap_dev);
-	video_unregister_device(&dev->vbi_out_dev);
-	video_unregister_device(&dev->vbi_cap_dev);
-	video_unregister_device(&dev->vid_out_dev);
-	video_unregister_device(&dev->vid_cap_dev);
+	vb2_video_unregister_device(&dev->sdr_cap_dev);
+	vb2_video_unregister_device(&dev->vbi_out_dev);
+	vb2_video_unregister_device(&dev->vbi_cap_dev);
+	vb2_video_unregister_device(&dev->vid_out_dev);
+	vb2_video_unregister_device(&dev->vid_cap_dev);
 	cec_unregister_adapter(dev->cec_rx_adap);
 	for (i = 0; i < MAX_OUTPUTS; i++)
 		cec_unregister_adapter(dev->cec_tx_adap[i]);
@@ -1907,27 +1907,27 @@ static int vivid_remove(struct platform_device *pdev)
 		if (dev->has_vid_cap) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				video_device_node_name(&dev->vid_cap_dev));
-			video_unregister_device(&dev->vid_cap_dev);
+			vb2_video_unregister_device(&dev->vid_cap_dev);
 		}
 		if (dev->has_vid_out) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				video_device_node_name(&dev->vid_out_dev));
-			video_unregister_device(&dev->vid_out_dev);
+			vb2_video_unregister_device(&dev->vid_out_dev);
 		}
 		if (dev->has_vbi_cap) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				video_device_node_name(&dev->vbi_cap_dev));
-			video_unregister_device(&dev->vbi_cap_dev);
+			vb2_video_unregister_device(&dev->vbi_cap_dev);
 		}
 		if (dev->has_vbi_out) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				video_device_node_name(&dev->vbi_out_dev));
-			video_unregister_device(&dev->vbi_out_dev);
+			vb2_video_unregister_device(&dev->vbi_out_dev);
 		}
 		if (dev->has_sdr_cap) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				video_device_node_name(&dev->sdr_cap_dev));
-			video_unregister_device(&dev->sdr_cap_dev);
+			vb2_video_unregister_device(&dev->sdr_cap_dev);
 		}
 		if (dev->has_radio_rx) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
@@ -1948,17 +1948,17 @@ static int vivid_remove(struct platform_device *pdev)
 		if (dev->has_meta_cap) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				  video_device_node_name(&dev->meta_cap_dev));
-			video_unregister_device(&dev->meta_cap_dev);
+			vb2_video_unregister_device(&dev->meta_cap_dev);
 		}
 		if (dev->has_meta_out) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				  video_device_node_name(&dev->meta_out_dev));
-			video_unregister_device(&dev->meta_out_dev);
+			vb2_video_unregister_device(&dev->meta_out_dev);
 		}
 		if (dev->has_touch_cap) {
 			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
 				  video_device_node_name(&dev->touch_cap_dev));
-			video_unregister_device(&dev->touch_cap_dev);
+			vb2_video_unregister_device(&dev->touch_cap_dev);
 		}
 		cec_unregister_adapter(dev->cec_rx_adap);
 		for (j = 0; j < MAX_OUTPUTS; j++)
-- 
2.27.0

