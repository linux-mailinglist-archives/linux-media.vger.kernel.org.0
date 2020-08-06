Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AB823D94C
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 12:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgHFKf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 06:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729354AbgHFKey (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 06:34:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE319C0617A5
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 03:34:50 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 77FF52993E0
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 2/5] media: staging: rkisp1: unify (un)register functions to have the same parameters
Date:   Thu,  6 Aug 2020 12:34:14 +0200
Message-Id: <20200806103417.18154-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806103417.18154-1-dafna.hirschfeld@collabora.com>
References: <20200806103417.18154-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The different register/unregister functions receive
different parameters. This patch unify them so they all receive just
'struct *rkisp1_device' as parameter.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h | 15 +++++----------
 drivers/staging/media/rkisp1/rkisp1-dev.c    | 15 +++++++--------
 drivers/staging/media/rkisp1/rkisp1-isp.c    |  5 ++---
 drivers/staging/media/rkisp1/rkisp1-params.c | 10 +++++-----
 drivers/staging/media/rkisp1/rkisp1-stats.c  | 10 +++++-----
 5 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index e54793d13c3d..7d414f89d79b 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -303,8 +303,7 @@ void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
 void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
 			   const struct v4l2_mbus_framefmt *bounds);
 
-int rkisp1_isp_register(struct rkisp1_device *rkisp1,
-			struct v4l2_device *v4l2_dev);
+int rkisp1_isp_register(struct rkisp1_device *rkisp1);
 void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
 
 const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
@@ -321,19 +320,15 @@ void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1);
 int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1);
 void rkisp1_resizer_devs_unregister(struct rkisp1_device *rkisp1);
 
-int rkisp1_stats_register(struct rkisp1_stats *stats,
-			  struct v4l2_device *v4l2_dev,
-			  struct rkisp1_device *rkisp1);
-void rkisp1_stats_unregister(struct rkisp1_stats *stats);
+int rkisp1_stats_register(struct rkisp1_device *rkisp1);
+void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
 
 void rkisp1_params_configure(struct rkisp1_params *params,
 			     enum rkisp1_fmt_raw_pat_type bayer_pat,
 			     enum v4l2_quantization quantization);
 void rkisp1_params_disable(struct rkisp1_params *params);
-int rkisp1_params_register(struct rkisp1_params *params,
-			   struct v4l2_device *v4l2_dev,
-			   struct rkisp1_device *rkisp1);
-void rkisp1_params_unregister(struct rkisp1_params *params);
+int rkisp1_params_register(struct rkisp1_device *rkisp1);
+void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
 
 void rkisp1_params_isr_handler(struct rkisp1_device *rkisp1, u32 isp_mis);
 
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index a0eb8f08708b..d85ac10e5494 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -345,7 +345,7 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 {
 	int ret;
 
-	ret = rkisp1_isp_register(rkisp1, &rkisp1->v4l2_dev);
+	ret = rkisp1_isp_register(rkisp1);
 	if (ret)
 		return ret;
 
@@ -357,12 +357,11 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		goto err_unreg_resizer_devs;
 
-	ret = rkisp1_stats_register(&rkisp1->stats, &rkisp1->v4l2_dev, rkisp1);
+	ret = rkisp1_stats_register(rkisp1);
 	if (ret)
 		goto err_unreg_capture_devs;
 
-	ret = rkisp1_params_register(&rkisp1->params,
-				     &rkisp1->v4l2_dev, rkisp1);
+	ret = rkisp1_params_register(rkisp1);
 	if (ret)
 		goto err_unreg_stats;
 
@@ -375,9 +374,9 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
 
 	return 0;
 err_unreg_params:
-	rkisp1_params_unregister(&rkisp1->params);
+	rkisp1_params_unregister(rkisp1);
 err_unreg_stats:
-	rkisp1_stats_unregister(&rkisp1->stats);
+	rkisp1_stats_unregister(rkisp1);
 err_unreg_capture_devs:
 	rkisp1_capture_devs_unregister(rkisp1);
 err_unreg_resizer_devs:
@@ -551,8 +550,8 @@ static int rkisp1_remove(struct platform_device *pdev)
 	v4l2_async_notifier_unregister(&rkisp1->notifier);
 	v4l2_async_notifier_cleanup(&rkisp1->notifier);
 
-	rkisp1_params_unregister(&rkisp1->params);
-	rkisp1_stats_unregister(&rkisp1->stats);
+	rkisp1_params_unregister(rkisp1);
+	rkisp1_stats_unregister(rkisp1);
 	rkisp1_capture_devs_unregister(rkisp1);
 	rkisp1_resizer_devs_unregister(rkisp1);
 	rkisp1_isp_unregister(rkisp1);
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 6ec1e9816e9f..7b40f53fde9a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -989,8 +989,7 @@ static const struct v4l2_subdev_ops rkisp1_isp_ops = {
 	.pad = &rkisp1_isp_pad_ops,
 };
 
-int rkisp1_isp_register(struct rkisp1_device *rkisp1,
-			struct v4l2_device *v4l2_dev)
+int rkisp1_isp_register(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_isp *isp = &rkisp1->isp;
 	struct media_pad *pads = isp->pads;
@@ -1018,7 +1017,7 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
 	if (ret)
 		return ret;
 
-	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	ret = v4l2_device_register_subdev(&rkisp1->v4l2_dev, sd);
 	if (ret) {
 		dev_err(rkisp1->dev, "Failed to register isp subdev\n");
 		goto err_cleanup_media_entity;
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 2ab25062cde6..c3c0ab5a5713 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1570,10 +1570,9 @@ static void rkisp1_init_params(struct rkisp1_params *params)
 		sizeof(struct rkisp1_params_cfg);
 }
 
-int rkisp1_params_register(struct rkisp1_params *params,
-			   struct v4l2_device *v4l2_dev,
-			   struct rkisp1_device *rkisp1)
+int rkisp1_params_register(struct rkisp1_device *rkisp1)
 {
+	struct rkisp1_params *params = &rkisp1->params;
 	struct rkisp1_vdev_node *node = &params->vnode;
 	struct video_device *vdev = &node->vdev;
 	int ret;
@@ -1593,7 +1592,7 @@ int rkisp1_params_register(struct rkisp1_params *params,
 	 * to protect all fops and v4l2 ioctls.
 	 */
 	vdev->lock = &node->vlock;
-	vdev->v4l2_dev = v4l2_dev;
+	vdev->v4l2_dev = &rkisp1->v4l2_dev;
 	vdev->queue = &node->buf_queue;
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
 	vdev->vfl_dir = VFL_DIR_TX;
@@ -1619,8 +1618,9 @@ int rkisp1_params_register(struct rkisp1_params *params,
 	return ret;
 }
 
-void rkisp1_params_unregister(struct rkisp1_params *params)
+void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
 {
+	struct rkisp1_params *params = &rkisp1->params;
 	struct rkisp1_vdev_node *node = &params->vnode;
 	struct video_device *vdev = &node->vdev;
 
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index a67c233b8641..f5dbd134ee24 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -375,10 +375,9 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
 		sizeof(struct rkisp1_stat_buffer);
 }
 
-int rkisp1_stats_register(struct rkisp1_stats *stats,
-			  struct v4l2_device *v4l2_dev,
-			  struct rkisp1_device *rkisp1)
+int rkisp1_stats_register(struct rkisp1_device *rkisp1)
 {
+	struct rkisp1_stats *stats = &rkisp1->stats;
 	struct rkisp1_vdev_node *node = &stats->vnode;
 	struct video_device *vdev = &node->vdev;
 	int ret;
@@ -395,7 +394,7 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 	vdev->fops = &rkisp1_stats_fops;
 	vdev->release = video_device_release_empty;
 	vdev->lock = &node->vlock;
-	vdev->v4l2_dev = v4l2_dev;
+	vdev->v4l2_dev = &rkisp1->v4l2_dev;
 	vdev->queue = &node->buf_queue;
 	vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
 	vdev->vfl_dir =  VFL_DIR_RX;
@@ -425,8 +424,9 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 	return ret;
 }
 
-void rkisp1_stats_unregister(struct rkisp1_stats *stats)
+void rkisp1_stats_unregister(struct rkisp1_device *rkisp1)
 {
+	struct rkisp1_stats *stats = &rkisp1->stats;
 	struct rkisp1_vdev_node *node = &stats->vnode;
 	struct video_device *vdev = &node->vdev;
 
-- 
2.17.1

