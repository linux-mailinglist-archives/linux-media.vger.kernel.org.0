Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3FF19329A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 22:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgCYV1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 17:27:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39708 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbgCYV1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 17:27:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 22E39293A45
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/2] media: staging: rkisp1: add the flag MEDIA_PAD_FL_METADATA to the metadata pads
Date:   Wed, 25 Mar 2020 22:27:04 +0100
Message-Id: <20200325212704.29862-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325212704.29862-1-dafna.hirschfeld@collabora.com>
References: <20200325212704.29862-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 4 pads of the links between kisp1_isp and the params
and stats entities transmit metadata. This patch
adds the flag MEDIA_PAD_FL_METADATA to those pads.
In addition it initializes the width and height of
the pads formats to 0 since metadata format has no
dimensions.

This fixes the TODO item:
"Fix pad format size for statistics and parameters entities."
So the patch also removes this item.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/TODO            |  1 -
 drivers/staging/media/rkisp1/rkisp1-isp.c    | 10 ++++++----
 drivers/staging/media/rkisp1/rkisp1-params.c |  2 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c  |  2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index 0aa9877dd64a..c10e8cb4cc5a 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -1,7 +1,6 @@
 * Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
 e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
 cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
-* Fix pad format size for statistics and parameters entities.
 * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
 * Fix checkpatch errors.
 * Make sure uapi structs have the same size and layout in 32 and 62 bits,
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index a41c6ff14009..bca9e3d1d94b 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -654,8 +654,8 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 					      RKISP1_ISP_PAD_SINK_PARAMS);
 	src_fmt = v4l2_subdev_get_try_format(sd, cfg,
 					     RKISP1_ISP_PAD_SOURCE_STATS);
-	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
-	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
+	sink_fmt->width = 0;
+	sink_fmt->height = 0;
 	sink_fmt->field = V4L2_FIELD_NONE;
 	sink_fmt->code = MEDIA_BUS_FMT_FIXED;
 	*src_fmt = *sink_fmt;
@@ -1041,9 +1041,11 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
 
 	pads[RKISP1_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
 						MEDIA_PAD_FL_MUST_CONNECT;
-	pads[RKISP1_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
+	pads[RKISP1_ISP_PAD_SINK_PARAMS].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_METADATA;
 	pads[RKISP1_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
-	pads[RKISP1_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	pads[RKISP1_ISP_PAD_SOURCE_STATS].flags =
+		MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_METADATA;
 
 	isp->sink_fmt = rkisp1_isp_mbus_info_get(RKISP1_DEF_SINK_PAD_FMT);
 	isp->src_fmt = rkisp1_isp_mbus_info_get(RKISP1_DEF_SRC_PAD_FMT);
diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
index 44d542caf32b..e934fab50262 100644
--- a/drivers/staging/media/rkisp1/rkisp1-params.c
+++ b/drivers/staging/media/rkisp1/rkisp1-params.c
@@ -1601,7 +1601,7 @@ int rkisp1_params_register(struct rkisp1_params *params,
 	rkisp1_init_params(params);
 	video_set_drvdata(vdev, params);
 
-	node->pad.flags = MEDIA_PAD_FL_SOURCE;
+	node->pad.flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_METADATA;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
 		goto err_release_queue;
diff --git a/drivers/staging/media/rkisp1/rkisp1-stats.c b/drivers/staging/media/rkisp1/rkisp1-stats.c
index 6dfcbdc3deb8..c54d69aea7de 100644
--- a/drivers/staging/media/rkisp1/rkisp1-stats.c
+++ b/drivers/staging/media/rkisp1/rkisp1-stats.c
@@ -481,7 +481,7 @@ int rkisp1_stats_register(struct rkisp1_stats *stats,
 	rkisp1_init_stats(stats);
 	video_set_drvdata(vdev, stats);
 
-	node->pad.flags = MEDIA_PAD_FL_SINK;
+	node->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_METADATA;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
 		goto err_release_queue;
-- 
2.17.1

