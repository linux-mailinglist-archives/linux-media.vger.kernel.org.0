Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B3C570321
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbiGKMpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbiGKMof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:44:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E999A61D91
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:26 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41DE62462;
        Mon, 11 Jul 2022 14:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543416;
        bh=9iYJDYOcoybSSWilvt8kFrCDq+BQruA7N6Nbnxahh6M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VX/jNI6B0YEnzLcdl55OdwTnh5PllcAjadaoBR+rhaWi1wty/QkhG3KnjRL8w2gHL
         OeGu1YAszVzoacPecnZTEFgIsp9lqZ7Zs5Mb8CZW3kuxG++AnnqUrmhE2eTZsmvSrU
         R85roxRFEwPASguc5qfRogrMeGq+yCH3QXc2ci88=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 28/46] media: rkisp1: isp: Rename rkisp1_device.active_sensor to source
Date:   Mon, 11 Jul 2022 15:42:30 +0300
Message-Id: <20220711124248.2683-29-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The active_sensor field of the rkisp1_device structure points to the ASD
data for the active source. The source may however not be a sensor, so
the naming is a bit confusing. Furthermore, the driver doesn't need to
access the full ASD from the active_sensor field, only the subdev
pointer is needed, when stopping streaming.

Rename the field to source, and turn it into a v4l2_subdev pointer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  4 +--
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 27 +++++++++----------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index d07c5c8e5b0d..ee9e724f4bf2 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -410,7 +410,7 @@ struct rkisp1_debug {
  * @v4l2_dev:	   v4l2_device variable
  * @media_dev:	   media_device variable
  * @notifier:	   a notifier to register on the v4l2-async API to be notified on the sensor
- * @active_sensor: sensor in-use, set when streaming on
+ * @source:        source subdev in-use, set when starting streaming
  * @csi:	   internal CSI-2 receiver
  * @isp:	   ISP sub-device
  * @resizer_devs:  resizer sub-devices
@@ -430,7 +430,7 @@ struct rkisp1_device {
 	struct v4l2_device v4l2_dev;
 	struct media_device media_dev;
 	struct v4l2_async_notifier notifier;
-	struct rkisp1_sensor_async *active_sensor;
+	struct v4l2_subdev *source;
 	struct rkisp1_csi csi;
 	struct rkisp1_isp isp;
 	struct rkisp1_resizer resizer_devs[2];
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 501996fffca0..944b6ea11853 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -58,7 +58,7 @@
  * Helpers
  */
 
-static struct v4l2_subdev *rkisp1_get_remote_sensor(struct v4l2_subdev *sd)
+static struct v4l2_subdev *rkisp1_get_remote_source(struct v4l2_subdev *sd)
 {
 	struct media_pad *local, *remote;
 	struct media_entity *sensor_me;
@@ -749,12 +749,11 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_device *rkisp1 =
 		container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
 	struct rkisp1_isp *isp = &rkisp1->isp;
-	struct v4l2_subdev *sensor_sd;
+	struct rkisp1_sensor_async *asd;
 	int ret;
 
 	if (!enable) {
-		v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
-				 false);
+		v4l2_subdev_call(rkisp1->source, video, s_stream, false);
 
 		rkisp1_csi_stop(&rkisp1->csi);
 		rkisp1_isp_stop(rkisp1);
@@ -762,35 +761,33 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 		return 0;
 	}
 
-	sensor_sd = rkisp1_get_remote_sensor(sd);
-	if (!sensor_sd) {
-		dev_warn(rkisp1->dev, "No link between isp and sensor\n");
+	rkisp1->source = rkisp1_get_remote_source(sd);
+	if (!rkisp1->source) {
+		dev_warn(rkisp1->dev, "No link between isp and source\n");
 		return -ENODEV;
 	}
 
-	rkisp1->active_sensor = container_of(sensor_sd->asd,
-					     struct rkisp1_sensor_async, asd);
+	asd = container_of(rkisp1->source->asd, struct rkisp1_sensor_async,
+			   asd);
 
-	if (rkisp1->active_sensor->mbus_type != V4L2_MBUS_CSI2_DPHY)
+	if (asd->mbus_type != V4L2_MBUS_CSI2_DPHY)
 		return -EINVAL;
 
 	rkisp1->isp.frame_sequence = -1;
 	mutex_lock(&isp->ops_lock);
-	ret = rkisp1_config_cif(rkisp1, rkisp1->active_sensor->mbus_type,
-				rkisp1->active_sensor->mbus_flags);
+	ret = rkisp1_config_cif(rkisp1, asd->mbus_type, asd->mbus_flags);
 	if (ret)
 		goto mutex_unlock;
 
 	rkisp1_isp_start(rkisp1);
 
-	ret = rkisp1_csi_start(&rkisp1->csi, rkisp1->active_sensor);
+	ret = rkisp1_csi_start(&rkisp1->csi, asd);
 	if (ret) {
 		rkisp1_isp_stop(rkisp1);
 		goto mutex_unlock;
 	}
 
-	ret = v4l2_subdev_call(rkisp1->active_sensor->sd, video, s_stream,
-			       true);
+	ret = v4l2_subdev_call(rkisp1->source, video, s_stream, true);
 	if (ret) {
 		rkisp1_isp_stop(rkisp1);
 		rkisp1_csi_stop(&rkisp1->csi);
-- 
Regards,

Laurent Pinchart

