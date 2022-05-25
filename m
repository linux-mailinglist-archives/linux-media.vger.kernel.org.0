Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFB66534404
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 21:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242185AbiEYTNq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 May 2022 15:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344382AbiEYTNV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 May 2022 15:13:21 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9C89BAB;
        Wed, 25 May 2022 12:11:07 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id F08B3FF80B;
        Wed, 25 May 2022 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1653505843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8iEmMnjQgpOlv9nc6jRUvLuaZa/9ZUyEsSKWVC5QtjY=;
        b=X6sMa7gEERUtpWPbxnmfXbFYTxkG0p9wUFu/iVpebU2DdTbKURIjCqwOYn4x8RmnY3TlFn
        o5708hWZQJFa2xRHAXK/YZ7XVM59yuaGX3pOoUg4eIU4rpD5SkO4nnbr9k7INsKtUdXtUy
        71EJOHn0LPrY9p64bQiR4sATPxiMycL3o84YgEKaLczzwu/nCgrz9Wt3v+Cy5DzR4M58IS
        hm6pxSfBUu8T0gXIC7PcIh9uu5XtRwWdGieIM37EeM882zWnMsONrE0Io3ag43vAwiej/M
        bqLp7ryEmYoK+jQIr8rohPeMAAdduz9IunNPCySPmMzcXvNHZnE6GgFF6pyRSg==
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 6/6] media: sun6i-csi: Add support for hooking to the isp devices
Date:   Wed, 25 May 2022 21:10:26 +0200
Message-Id: <20220525191026.696636-7-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525191026.696636-1-paul.kocialkowski@bootlin.com>
References: <20220525191026.696636-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to use the isp and csi together, both devices need to be
parented to the same v4l2 and media devices. We use the isp as
top-level device and let the csi code hook to its v4l2 and media
devices when async subdev registration takes place.

As a result v4l2/media device setup is only called when the ISP
is missing and the capture device is registered after the devices
are hooked. The bridge subdev and its notifier are registered
without any device when the ISP is available. Top-level pointers
for the devices are introduced to either redirect to the hooked ones
(isp available) or the registered ones (isp missing).

Also keep track of whether the capture node was setup or not to
avoid cleaning up resources when it wasn't.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 45 +++++++++++++++----
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  7 +++
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 32 +++++++++++--
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 19 ++++++--
 .../sunxi/sun6i-csi/sun6i_csi_capture.h       |  1 +
 5 files changed, 89 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index b16166cba2ef..0bac89d8112f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -26,6 +26,18 @@
 
 /* ISP */
 
+int sun6i_csi_isp_complete(struct sun6i_csi_device *csi_dev,
+			   struct v4l2_device *v4l2_dev)
+{
+	if (csi_dev->v4l2_dev && csi_dev->v4l2_dev != v4l2_dev)
+		return -EINVAL;
+
+	csi_dev->v4l2_dev = v4l2_dev;
+	csi_dev->media_dev = v4l2_dev->mdev;
+
+	return sun6i_csi_capture_setup(csi_dev);
+}
+
 static bool sun6i_csi_isp_detect(struct sun6i_csi_device *csi_dev)
 {
 	struct device *dev = csi_dev->dev;
@@ -95,6 +107,9 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
 		goto error_media;
 	}
 
+	csi_dev->v4l2_dev = v4l2_dev;
+	csi_dev->media_dev = media_dev;
+
 	return 0;
 
 error_media:
@@ -323,17 +338,27 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
 	if (ret)
 		goto error_resources;
 
-	ret = sun6i_csi_v4l2_setup(csi_dev);
-	if (ret)
-		goto error_resources;
+	/*
+	 * Register our own v4l2 and media devices when there is no ISP around.
+	 * Otherwise the ISP will use async subdev registration with our bridge,
+	 * which will provide v4l2 and media devices that are used to register
+	 * the video interface.
+	 */
+	if (!csi_dev->isp_available) {
+		ret = sun6i_csi_v4l2_setup(csi_dev);
+		if (ret)
+			goto error_resources;
+	}
 
 	ret = sun6i_csi_bridge_setup(csi_dev);
 	if (ret)
 		goto error_v4l2;
 
-	ret = sun6i_csi_capture_setup(csi_dev);
-	if (ret)
-		goto error_bridge;
+	if (!csi_dev->isp_available) {
+		ret = sun6i_csi_capture_setup(csi_dev);
+		if (ret)
+			goto error_bridge;
+	}
 
 	return 0;
 
@@ -341,7 +366,8 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
 	sun6i_csi_bridge_cleanup(csi_dev);
 
 error_v4l2:
-	sun6i_csi_v4l2_cleanup(csi_dev);
+	if (!csi_dev->isp_available)
+		sun6i_csi_v4l2_cleanup(csi_dev);
 
 error_resources:
 	sun6i_csi_resources_cleanup(csi_dev);
@@ -355,7 +381,10 @@ static int sun6i_csi_remove(struct platform_device *pdev)
 
 	sun6i_csi_capture_cleanup(csi_dev);
 	sun6i_csi_bridge_cleanup(csi_dev);
-	sun6i_csi_v4l2_cleanup(csi_dev);
+
+	if (!csi_dev->isp_available)
+		sun6i_csi_v4l2_cleanup(csi_dev);
+
 	sun6i_csi_resources_cleanup(csi_dev);
 
 	return 0;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index 8e232cd91ebe..bc3f0dae35df 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -36,6 +36,8 @@ struct sun6i_csi_v4l2 {
 
 struct sun6i_csi_device {
 	struct device			*dev;
+	struct v4l2_device		*v4l2_dev;
+	struct media_device		*media_dev;
 
 	struct sun6i_csi_v4l2		v4l2;
 	struct sun6i_csi_bridge		bridge;
@@ -53,4 +55,9 @@ struct sun6i_csi_variant {
 	unsigned long	clock_mod_rate;
 };
 
+/* ISP */
+
+int sun6i_csi_isp_complete(struct sun6i_csi_device *csi_dev,
+			   struct v4l2_device *v4l2_dev);
+
 #endif
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index 8e9eded0df28..9624c3f683ee 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -654,6 +654,7 @@ sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
 	struct sun6i_csi_bridge_source *source = bridge_async_subdev->source;
 	bool enabled;
+	int ret;
 
 	switch (source->endpoint.base.port) {
 	case SUN6I_CSI_PORT_PARALLEL:
@@ -668,6 +669,16 @@ sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
 
 	source->subdev = remote_subdev;
 
+	if (csi_dev->isp_available) {
+		/*
+		 * Hook to the first available remote subdev to get v4l2 and
+		 * media devices and register the capture device then.
+		 */
+		ret = sun6i_csi_isp_complete(csi_dev, remote_subdev->v4l2_dev);
+		if (ret)
+			return ret;
+	}
+
 	return sun6i_csi_bridge_link(csi_dev, SUN6I_CSI_BRIDGE_PAD_SINK,
 				     remote_subdev, enabled);
 }
@@ -680,6 +691,9 @@ sun6i_csi_bridge_notifier_complete(struct v4l2_async_notifier *notifier)
 			     bridge.notifier);
 	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
 
+	if (csi_dev->isp_available)
+		return 0;
+
 	return v4l2_device_register_subdev_nodes(v4l2_dev);
 }
 
@@ -753,7 +767,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 {
 	struct device *dev = csi_dev->dev;
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
-	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
 	struct v4l2_subdev *subdev = &bridge->subdev;
 	struct v4l2_async_notifier *notifier = &bridge->notifier;
 	struct media_pad *pads = bridge->pads;
@@ -794,7 +808,11 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 
 	/* V4L2 Subdev */
 
-	ret = v4l2_device_register_subdev(v4l2_dev, subdev);
+	if (csi_dev->isp_available)
+		ret = v4l2_async_register_subdev(subdev);
+	else
+		ret = v4l2_device_register_subdev(v4l2_dev, subdev);
+
 	if (ret) {
 		dev_err(dev, "failed to register v4l2 subdev: %d\n", ret);
 		goto error_media_entity;
@@ -811,7 +829,10 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 	sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_mipi_csi2,
 				      SUN6I_CSI_PORT_MIPI_CSI2, NULL);
 
-	ret = v4l2_async_nf_register(v4l2_dev, notifier);
+	if (csi_dev->isp_available)
+		ret = v4l2_async_subdev_nf_register(subdev, notifier);
+	else
+		ret = v4l2_async_nf_register(v4l2_dev, notifier);
 	if (ret) {
 		dev_err(dev, "failed to register v4l2 async notifier: %d\n",
 			ret);
@@ -823,7 +844,10 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 error_v4l2_async_notifier:
 	v4l2_async_nf_cleanup(notifier);
 
-	v4l2_device_unregister_subdev(subdev);
+	if (csi_dev->isp_available)
+		v4l2_async_unregister_subdev(subdev);
+	else
+		v4l2_device_unregister_subdev(subdev);
 
 error_media_entity:
 	media_entity_cleanup(&subdev->entity);
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index c9e7526b84c4..69ea1cbaea0c 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -570,7 +570,7 @@ static int sun6i_csi_capture_buffer_prepare(struct vb2_buffer *buffer)
 {
 	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(buffer->vb2_queue);
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
-	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
 	struct vb2_v4l2_buffer *v4l2_buffer = to_vb2_v4l2_buffer(buffer);
 	unsigned long size = capture->format.fmt.pix.sizeimage;
 
@@ -889,7 +889,7 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	struct video_device *video_dev =
 		media_entity_to_video_device(link->sink->entity);
 	struct sun6i_csi_device *csi_dev = video_get_drvdata(video_dev);
-	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
@@ -971,7 +971,7 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 {
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
 	struct sun6i_csi_capture_state *state = &capture->state;
-	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
 	struct v4l2_subdev *bridge_subdev = &csi_dev->bridge.subdev;
 	struct video_device *video_dev = &capture->video_dev;
 	struct vb2_queue *queue = &capture->queue;
@@ -980,6 +980,10 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 	struct v4l2_pix_format *pix_format = &format->fmt.pix;
 	int ret;
 
+	/* This may happen with multiple bridge notifier bound calls. */
+	if (state->setup)
+		return 0;
+
 	/* State */
 
 	INIT_LIST_HEAD(&state->queue);
@@ -1055,6 +1059,7 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 	ret = media_create_pad_link(&bridge_subdev->entity,
 				    SUN6I_CSI_BRIDGE_PAD_SOURCE,
 				    &video_dev->entity, 0,
+				    csi_dev->isp_available ? 0 :
 				    MEDIA_LNK_FL_ENABLED |
 				    MEDIA_LNK_FL_IMMUTABLE);
 	if (ret < 0) {
@@ -1065,6 +1070,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 		goto error_video_device;
 	}
 
+	state->setup = true;
+
 	return 0;
 
 error_video_device:
@@ -1083,7 +1090,13 @@ void sun6i_csi_capture_cleanup(struct sun6i_csi_device *csi_dev)
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
 	struct video_device *video_dev = &capture->video_dev;
 
+	/* This may happen if async registration failed to complete. */
+	if (!capture->state.setup)
+		return;
+
 	vb2_video_unregister_device(video_dev);
 	media_entity_cleanup(&video_dev->entity);
 	mutex_destroy(&capture->lock);
+
+	capture->state.setup = false;
 }
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
index 29893cf96f6b..3ee5ccefbd10 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
@@ -45,6 +45,7 @@ struct sun6i_csi_capture_state {
 
 	unsigned int			sequence;
 	bool				streaming;
+	bool				setup;
 };
 
 struct sun6i_csi_capture {
-- 
2.36.1

