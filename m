Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8AC1DE5F1
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 13:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbgEVL4o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 07:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgEVL4o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 07:56:44 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A811C061A0E
        for <linux-media@vger.kernel.org>; Fri, 22 May 2020 04:56:44 -0700 (PDT)
Received: from localhost.localdomain (p200300cb871f5b00cd18bb271f42fad5.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:cd18:bb27:1f42:fad5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 27D5C2A05AD;
        Fri, 22 May 2020 12:56:42 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, tfiga@chromium.org
Subject: [PATCH] media: staging: rkisp1: fix dev param for dev_* debugs
Date:   Fri, 22 May 2020 13:56:33 +0200
Message-Id: <20200522115633.3166-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In some debug prints a wrong 'dev' argument is used
for the dev_(dbg/err/warn), this cause a prefix
"(NULL device *)" to the prints.
In some prints the 'dev' of the sensor subdevice is used
which is also wrong.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-dev.c     |  2 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 17 ++++++++++-------
 drivers/staging/media/rkisp1/rkisp1-params.c  |  2 +-
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  2 +-
 4 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index 9ac38bafb839..f38801fea10d 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -129,7 +129,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
 		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
 						  MEDIA_PAD_FL_SOURCE);
 		if (ret < 0) {
-			dev_err(sd->dev, "failed to find src pad for %s\n",
+			dev_err(rkisp1->dev, "failed to find src pad for %s\n",
 				sd->name);
 			return ret;
 		}
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index dc2b59a0160a..ec061b997bb4 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -203,10 +203,8 @@ static struct v4l2_subdev *rkisp1_get_remote_sensor(struct v4l2_subdev *sd)
 
 	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
 	remote = media_entity_remote_pad(local);
-	if (!remote) {
-		dev_warn(sd->dev, "No link between isp and sensor\n");
+	if (!remote)
 		return NULL;
-	}
 
 	sensor_me = remote->entity;
 	return media_entity_to_v4l2_subdev(sensor_me);
@@ -889,18 +887,20 @@ static const struct v4l2_subdev_pad_ops rkisp1_isp_pad_ops = {
 static int rkisp1_mipi_csi2_start(struct rkisp1_isp *isp,
 				  struct rkisp1_sensor_async *sensor)
 {
+	struct rkisp1_device *rkisp1 =
+		container_of(isp->sd.v4l2_dev, struct rkisp1_device, v4l2_dev);
 	union phy_configure_opts opts;
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
 	s64 pixel_clock;
 
 	if (!sensor->pixel_rate_ctrl) {
-		dev_warn(sensor->sd->dev, "No pixel rate control in subdev\n");
+		dev_warn(rkisp1->dev, "No pixel rate control in subdev\n");
 		return -EPIPE;
 	}
 
 	pixel_clock = v4l2_ctrl_g_ctrl_int64(sensor->pixel_rate_ctrl);
 	if (!pixel_clock) {
-		dev_err(sensor->sd->dev, "Invalid pixel rate value\n");
+		dev_err(rkisp1->dev, "Invalid pixel rate value\n");
 		return -EINVAL;
 	}
 
@@ -933,8 +933,11 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	sensor_sd = rkisp1_get_remote_sensor(sd);
-	if (!sensor_sd)
+	if (!sensor_sd) {
+		dev_warn(rkisp1->dev, "No link between isp and sensor\n");
 		return -ENODEV;
+	}
+
 	rkisp1->active_sensor = container_of(sensor_sd->asd,
 					     struct rkisp1_sensor_async, asd);
 
@@ -1021,7 +1024,7 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
 
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret) {
-		dev_err(sd->dev, "Failed to register isp subdev\n");
+		dev_err(rkisp1->dev, "Failed to register isp subdev\n");
 		goto err_cleanup_media_entity;
 	}
 
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 44d542caf32b..797e79de659c 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1607,7 +1607,7 @@ int rkisp1_params_register(struct rkisp1_params *params,
 		goto err_release_queue;
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
-		dev_err(&vdev->dev,
+		dev_err(rkisp1->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
 		goto err_cleanup_media_entity;
 	}
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index d049374413dc..26fb41053f56 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -639,7 +639,7 @@ static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP || sel->pad == RKISP1_RSZ_PAD_SRC)
 		return -EINVAL;
 
-	dev_dbg(sd->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
+	dev_dbg(rsz->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
 	mutex_lock(&rsz->ops_lock);
-- 
2.17.1

