Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 983695A7FCC
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbiHaOQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbiHaOPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C4D18E3E
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:05 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F39A11C1;
        Wed, 31 Aug 2022 16:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955266;
        bh=DgkhYPHPWn2oE7PFRNLDP9hCGk08L1t2zu0UhESr1rY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CC0uglzC6DbDYhrP/B194JO3ap/5bJIyNQ9QvyAxYNqyJwMMIeTNonAAjyVeAEMrv
         SwvkBDR7vsRRdEJAZoNtHonwtt/HGDWeVglOscNMnjG6EXd6ntSVyJf9HTQsZ3D+zM
         9FRfwNVmSNsjMzanhIlBH/CYE7AxrCpMzSwviU4M=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 13/34] media: drivers: use video_device_pipeline_alloc_start()
Date:   Wed, 31 Aug 2022 17:13:36 +0300
Message-Id: <20220831141357.1396081-14-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
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

Use video_device_pipeline_alloc_start() instead of manually
allocating/managing the media pipeline storage.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 14 +-------------
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c |  2 +-
 .../media/platform/sunxi/sun6i-csi/sun6i_video.c   |  2 +-
 drivers/media/platform/ti/cal/cal-video.c          |  2 +-
 drivers/media/platform/ti/cal/cal.h                |  1 -
 5 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 879dd02bbb55..3aea96d85165 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1244,8 +1244,6 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 
 static int rvin_set_stream(struct rvin_dev *vin, int on)
 {
-	struct media_pipeline *pipe;
-	struct media_device *mdev;
 	struct v4l2_subdev *sd;
 	struct media_pad *pad;
 	int ret;
@@ -1273,17 +1271,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	if (ret)
 		return ret;
 
-	/*
-	 * The graph lock needs to be taken to protect concurrent
-	 * starts of multiple VIN instances as they might share
-	 * a common subdevice down the line and then should use
-	 * the same pipe.
-	 */
-	mdev = vin->vdev.entity.graph_obj.mdev;
-	mutex_lock(&mdev->graph_mutex);
-	pipe = media_entity_pipeline(&sd->entity) ? : &vin->vdev.pipe;
-	ret = __video_device_pipeline_start(&vin->vdev, pipe);
-	mutex_unlock(&mdev->graph_mutex);
+	ret = video_device_pipeline_alloc_start(&vin->vdev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index 17ad9a3caaa5..a3e826a755fc 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -266,7 +266,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err_clear_dma_queue;
 	}
 
-	ret = video_device_pipeline_start(&csi->vdev, &csi->vdev.pipe);
+	ret = video_device_pipeline_alloc_start(&csi->vdev);
 	if (ret < 0)
 		goto err_free_scratch_buffer;
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 21a6b92494ba..7d39cbbf6a88 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -141,7 +141,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	video->sequence = 0;
 
-	ret = video_device_pipeline_start(&video->vdev, &video->vdev.pipe);
+	ret = video_device_pipeline_alloc_start(&video->vdev);
 	if (ret < 0)
 		goto clear_dma_queue;
 
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 6a57efb0ed91..5813345656af 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -707,7 +707,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma_addr_t addr;
 	int ret;
 
-	ret = video_device_pipeline_start(&ctx->vdev, &ctx->phy->pipe);
+	ret = video_device_pipeline_alloc_start(&ctx->vdev);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to start media pipeline: %d\n", ret);
 		goto error_release_buffers;
diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
index 61409ddced98..648cec43c3fc 100644
--- a/drivers/media/platform/ti/cal/cal.h
+++ b/drivers/media/platform/ti/cal/cal.h
@@ -174,7 +174,6 @@ struct cal_camerarx {
 	struct device_node	*source_ep_node;
 	struct device_node	*source_node;
 	struct v4l2_subdev	*source;
-	struct media_pipeline	pipe;
 
 	struct v4l2_subdev	subdev;
 	struct media_pad	pads[CAL_CAMERARX_NUM_PADS];
-- 
2.34.1

