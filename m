Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD8F4D63C7
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 15:38:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349692AbiCKOil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 09:38:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349689AbiCKOiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 09:38:16 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CEA1C944F;
        Fri, 11 Mar 2022 06:37:01 -0800 (PST)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1580824001C;
        Fri, 11 Mar 2022 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1647009419;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JwIiF68nNHAf8x4sv8J+sKaKdAx468YQMtKNaqm7Q/A=;
        b=P/h7FT7IwE8IIbe6wcBrkhnWkszWu6CJowkm6aG9G49cmLk9LW/g96xUOpFWtY+RW+MRzJ
        9sW0zXJS2E1M3wNKeg4oXqev8Ub84ypwno+/FlPT9dFVLP4nuRI7yojOUGMjZ+vPAiec9p
        uEmjdakB2/ere3DfMdPuWnAZ6ukTHGJu+Wer+sc69iAiP0ext5YPWIS4I6OiWbEpI8PpOT
        YAF02kthEx5LH0L3dyIzVKCbWOUYuovmXHotyoiMcWSVrDWA8mxOOim2Z/8RMc4dhslq2Q
        glFu4uzJY6fOm8I2x2vHuffo8Fb7WHN7oG8EpdTwWV/qW2NT7xkDSZR8zrNXUg==
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 45/46] media: sun6i-csi: Add support for hooking to the isp devices
Date:   Fri, 11 Mar 2022 15:35:31 +0100
Message-Id: <20220311143532.265091-46-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311143532.265091-1-paul.kocialkowski@bootlin.com>
References: <20220311143532.265091-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 31 +++++++++++--
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 19 ++++++--
 .../sunxi/sun6i-csi/sun6i_csi_capture.h       |  1 +
 5 files changed, 88 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index f17be8e091a9..56c8595dfdb1 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -27,6 +27,18 @@
 
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
@@ -107,6 +119,9 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device *csi_dev)
 		goto error_v4l2_ctrl;
 	}
 
+	csi_dev->v4l2_dev = v4l2_dev;
+	csi_dev->media_dev = media_dev;
+
 	return 0;
 
 error_v4l2_ctrl:
@@ -356,17 +371,27 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
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
 
@@ -374,7 +399,8 @@ static int sun6i_csi_probe(struct platform_device *platform_dev)
 	sun6i_csi_bridge_cleanup(csi_dev);
 
 error_v4l2:
-	sun6i_csi_v4l2_cleanup(csi_dev);
+	if (!csi_dev->isp_available)
+		sun6i_csi_v4l2_cleanup(csi_dev);
 
 error_resources:
 	sun6i_csi_resources_cleanup(csi_dev);
@@ -388,7 +414,10 @@ static int sun6i_csi_remove(struct platform_device *pdev)
 
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
index ee5b04f75311..ef9405891cc7 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -38,6 +38,8 @@ struct sun6i_csi_v4l2 {
 
 struct sun6i_csi_device {
 	struct device			*dev;
+	struct v4l2_device		*v4l2_dev;
+	struct media_device		*media_dev;
 
 	struct sun6i_csi_v4l2		v4l2;
 	struct sun6i_csi_bridge		bridge;
@@ -56,4 +58,9 @@ struct sun6i_csi_variant {
 	unsigned long	clk_mod_rate;
 };
 
+/* ISP */
+
+int sun6i_csi_isp_complete(struct sun6i_csi_device *csi_dev,
+			   struct v4l2_device *v4l2_dev);
+
 #endif
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index ca87ba4c0b9d..02bad44f097f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -683,6 +683,16 @@ sun6i_csi_bridge_notifier_bound(struct v4l2_async_notifier *notifier,
 
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
@@ -695,6 +705,9 @@ sun6i_csi_bridge_notifier_complete(struct v4l2_async_notifier *notifier)
 			     bridge.notifier);
 	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
 
+	if (csi_dev->isp_available)
+		return 0;
+
 	return v4l2_device_register_subdev_nodes(v4l2_dev);
 }
 
@@ -768,7 +781,7 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 {
 	struct device *dev = csi_dev->dev;
 	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
-	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
 	struct v4l2_subdev *subdev = &bridge->subdev;
 	struct v4l2_async_notifier *notifier = &bridge->notifier;
 	struct media_pad *pads = bridge->pads;
@@ -809,7 +822,11 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
 
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
@@ -826,7 +843,10 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
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
@@ -838,7 +858,10 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device *csi_dev)
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
index f6dac15af675..2ad38277633f 100644
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
 
@@ -886,7 +886,7 @@ static int sun6i_csi_capture_link_validate(struct media_link *link)
 	struct video_device *video_dev =
 		media_entity_to_video_device(link->sink->entity);
 	struct sun6i_csi_device *csi_dev = video_get_drvdata(video_dev);
-	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
 	const struct sun6i_csi_capture_format *capture_format;
 	const struct sun6i_csi_bridge_format *bridge_format;
 	unsigned int capture_width, capture_height;
@@ -968,7 +968,7 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 {
 	struct sun6i_csi_capture *capture = &csi_dev->capture;
 	struct sun6i_csi_capture_state *state = &capture->state;
-	struct v4l2_device *v4l2_dev = &csi_dev->v4l2.v4l2_dev;
+	struct v4l2_device *v4l2_dev = csi_dev->v4l2_dev;
 	struct v4l2_subdev *bridge_subdev = &csi_dev->bridge.subdev;
 	struct video_device *video_dev = &capture->video_dev;
 	struct vb2_queue *queue = &capture->queue;
@@ -977,6 +977,10 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
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
2.35.1

