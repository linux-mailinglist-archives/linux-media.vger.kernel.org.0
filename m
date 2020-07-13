Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4682721D4FF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 13:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbgGMLa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 07:30:59 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53187 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729510AbgGMLa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 07:30:57 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id uwfYj6z2lGLmCuwffjB4uh; Mon, 13 Jul 2020 13:30:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594639855; bh=Rb736hu9u0AsZTQXCljfwsBg1x1CRM4abQlYeT02S2U=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=fJUjfppOwm1RsLb1hfuuC7fYo30m9WVn68vcVEh4TA0QS7hCBAHhvlK5RaWGhvino
         RfSLZ6wtuQbmOwrilyU6op+nJPb4e7tLati00DM3nnG7zkecp7Vc03hIbFWS8tgO5C
         vAFjDJXdqnY3tqoKnyWe12WoVH+D/nu3CfD89KsZYTvA409OmsH9agDMDvu4aHkGC4
         As+6ersOURIlQlHDWxkBk3Bl5eJHRXSWyN3ArojoyPc1OBu50tqIhVTyfxlDrpnMHo
         MDlQ+qWoCaBS6hEnPcohGda64qMcmzzFIXQX8fVlCVY6thtKMEXlZJuk3QkHQT3wwC
         5gwRSRQPFRpog==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCHv3 7/7] staging/media: drop vb2_queue_release()
Date:   Mon, 13 Jul 2020 13:30:48 +0200
Message-Id: <20200713113048.1150542-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
References: <20200713113048.1150542-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfITdU6KSQPq0aTLGGd39zJCYiZtad316SmmXci8O8UNejsZFEZHqcxUtF275BloNCixNV/d8/OE9NMMXcZahWIWn9RvOPVf0xuQJKNc7ofLXrhPG/kTt
 paAKeumLiUbj+nDJdPpnDOLoy2eP0oetwXEA8ofbvnjKWkEGa6k6krg5xPmbLoTNVBhDGbwxCeCQW1KTajfMiaG90FOeEOfzuQyRPj1Da2KGzo8vxi5C7onp
 bJ9kG4b7hs118BIi4SX8V+r9aV1gHG1AbudKhA0EUF1iPzXZBubbMORwC8GAXI8kuzO7TS3jecK/wZ3wP4FEMyMnokn9xybiXr4P33hMjuA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is only needed for drivers that do not use vb2_fop_release().
Note that vb2_queue_release() is *not* the counterpart of vb2_queue_init()
as some drivers here seem to think.

Also use vb2_video_unregister_device() to automatically stop streaming
at unregister time for those drivers that set vdev->queue.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec.c       | 8 +-------
 drivers/staging/media/rkisp1/rkisp1-capture.c | 2 +-
 drivers/staging/media/rkisp1/rkisp1-params.c  | 7 ++-----
 drivers/staging/media/rkisp1/rkisp1-stats.c   | 6 ++----
 drivers/staging/media/tegra-video/vi.c        | 8 ++------
 5 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 3040136ceb77..5ccb3846c879 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -841,13 +841,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->min_buffers_needed = 1;
 	dst_vq->dev = sess->core->dev;
 	dst_vq->lock = &sess->lock;
-	ret = vb2_queue_init(dst_vq);
-	if (ret) {
-		vb2_queue_release(src_vq);
-		return ret;
-	}
-
-	return 0;
+	return vb2_queue_init(dst_vq);
 }
 
 static int vdec_init_ctrls(struct amvdec_session *sess)
diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 793ec884c894..2a25c3a99ea4 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1277,7 +1277,7 @@ static const struct v4l2_file_operations rkisp1_fops = {
 static void rkisp1_unregister_capture(struct rkisp1_capture *cap)
 {
 	media_entity_cleanup(&cap->vnode.vdev.entity);
-	video_unregister_device(&cap->vnode.vdev);
+	vb2_video_unregister_device(&cap->vnode.vdev);
 }
 
 void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1)
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 797e79de659c..bea074950fc1 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1604,7 +1604,7 @@ int rkisp1_params_register(struct rkisp1_params *params,
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		goto err_release_queue;
+		return ret;
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(rkisp1->dev,
@@ -1614,8 +1614,6 @@ int rkisp1_params_register(struct rkisp1_params *params,
 	return 0;
 err_cleanup_media_entity:
 	media_entity_cleanup(&vdev->entity);
-err_release_queue:
-	vb2_queue_release(vdev->queue);
 	return ret;
 }
 
@@ -1624,7 +1622,6 @@ void rkisp1_params_unregister(struct rkisp1_params *params)
 	struct rkisp1_vdev_node *node = &params->vnode;
 	struct video_device *vdev = &node->vdev;
 
-	video_unregister_device(vdev);
+	vb2_video_unregister_device(vdev);
 	media_entity_cleanup(&vdev->entity);
-	vb2_queue_release(vdev->queue);
 }
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 0616793ae395..7345721a8e99 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -498,11 +498,10 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 	return 0;
 
 err_unreg_vdev:
-	video_unregister_device(vdev);
+	vb2_video_unregister_device(vdev);
 err_cleanup_media_entity:
 	media_entity_cleanup(&vdev->entity);
 err_release_queue:
-	vb2_queue_release(vdev->queue);
 	mutex_destroy(&node->vlock);
 	mutex_destroy(&stats->wq_lock);
 	return ret;
@@ -514,9 +513,8 @@ void rkisp1_stats_unregister(struct rkisp1_stats *stats)
 	struct video_device *vdev = &node->vdev;
 
 	destroy_workqueue(stats->readout_wq);
-	video_unregister_device(vdev);
+	vb2_video_unregister_device(vdev);
 	media_entity_cleanup(&vdev->entity);
-	vb2_queue_release(vdev->queue);
 	mutex_destroy(&node->vlock);
 	mutex_destroy(&stats->wq_lock);
 }
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 1b5e660155f5..a3b9b212f8c8 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -795,12 +795,8 @@ void tegra_v4l2_nodes_cleanup_tpg(struct tegra_video_device *vid)
 	struct tegra_csi_channel *csi_chan;
 	struct tegra_vi_channel *chan;
 
-	list_for_each_entry(chan, &vi->vi_chans, list) {
-		video_unregister_device(&chan->video);
-		mutex_lock(&chan->video_lock);
-		vb2_queue_release(&chan->queue);
-		mutex_unlock(&chan->video_lock);
-	}
+	list_for_each_entry(chan, &vi->vi_chans, list)
+		vb2_video_unregister_device(&chan->video);
 
 	list_for_each_entry(csi_chan, &csi->csi_chans, list)
 		v4l2_device_unregister_subdev(&csi_chan->subdev);
-- 
2.27.0

