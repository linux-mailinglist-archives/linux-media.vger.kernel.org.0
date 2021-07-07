Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711383BEA95
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 17:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhGGPWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 11:22:13 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37511 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbhGGPWN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 11:22:13 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CAA30E0012;
        Wed,  7 Jul 2021 15:19:30 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] media: i2c: gmsl: Defer camera initialization
Date:   Wed,  7 Jul 2021 17:20:03 +0200
Message-Id: <20210707152003.136272-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707152003.136272-1-jacopo+renesas@jmondi.org>
References: <20210707152003.136272-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the post_register() callback to defer the bulk of the camera
modules initialization. The deserializer driver waits for all the
registered camera to probe, increases its channel amplitude and the
calls the subdevice post_register() operation that completes the
initialization procedure.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 21 ++++++++--
 drivers/media/i2c/rdacm20.c | 81 +++++++++++++++++++++----------------
 drivers/media/i2c/rdacm21.c | 73 ++++++++++++++++++---------------
 3 files changed, 106 insertions(+), 69 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 8cd3340ea9bb..1b92d18a1f94 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -567,17 +567,31 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	if (priv->bound_sources != priv->source_mask)
 		return 0;
 
+	/*
+	 * Once all cameras have probed, increase the channel amplitude
+	 * to compensate for the remote noise immunity threshold and call
+	 * the camera post_register operation to complete initialization with
+	 * noise immunity enabled.
+	 */
+	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
+	for_each_source(priv, source) {
+		ret = v4l2_subdev_call(source->sd, core, post_register);
+		if (ret) {
+			dev_err(&priv->client->dev,
+				"Failed to initialize camera device %u\n",
+				index);
+			return ret;
+		}
+	}
+
 	/*
 	 * All enabled sources have probed and enabled their reverse control
 	 * channels:
 	 *
-	 * - Increase the reverse channel amplitude to compensate for the
-	 *   remote ends high threshold
 	 * - Verify all configuration links are properly detected
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
-	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
 	max9286_check_config_link(priv, priv->source_mask);
 	max9286_configure_i2c(priv, false);
 
@@ -630,6 +644,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
 	}
 
 	priv->notifier.ops = &max9286_notify_ops;
+	priv->notifier.flags |= V4L2_ASYNC_NOTIFIER_DEFER_POST_REGISTER;
 
 	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
 	if (ret) {
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 025a610de893..ba956733aa89 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -435,44 +435,12 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
-	.s_stream	= rdacm20_s_stream,
-};
-
-static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
-	.enum_mbus_code = rdacm20_enum_mbus_code,
-	.get_fmt	= rdacm20_get_fmt,
-	.set_fmt	= rdacm20_get_fmt,
-};
-
-static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
-	.video		= &rdacm20_video_ops,
-	.pad		= &rdacm20_subdev_pad_ops,
-};
-
-static int rdacm20_initialize(struct rdacm20_device *dev)
+static int rdacm20_post_register(struct v4l2_subdev *sd)
 {
+	struct rdacm20_device *dev = sd_to_rdacm20(sd);
 	unsigned int retry = 3;
 	int ret;
 
-	max9271_wake_up(&dev->serializer);
-
-	/* Serial link disabled during config as it needs a valid pixel clock. */
-	ret = max9271_set_serial_link(&dev->serializer, false);
-	if (ret)
-		return ret;
-
-	/*
-	 *  Ensure that we have a good link configuration before attempting to
-	 *  identify the device.
-	 */
-	ret = max9271_configure_i2c(&dev->serializer,
-				    MAX9271_I2CSLVSH_469NS_234NS |
-				    MAX9271_I2CSLVTO_1024US |
-				    MAX9271_I2CMSTBT_105KBPS);
-	if (ret)
-		return ret;
-
 	/*
 	 * Hold OV10635 in reset during max9271 configuration. The reset signal
 	 * has to be asserted for at least 200 microseconds.
@@ -549,6 +517,51 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 
 	dev_info(dev->dev, "Identified RDACM20 camera module\n");
 
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
+	.s_stream	= rdacm20_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
+	.enum_mbus_code = rdacm20_enum_mbus_code,
+	.get_fmt	= rdacm20_get_fmt,
+	.set_fmt	= rdacm20_get_fmt,
+};
+
+static const struct v4l2_subdev_core_ops rdacm20_core_ops = {
+	.post_register	= rdacm20_post_register,
+};
+
+static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
+	.core		= &rdacm20_core_ops,
+	.video		= &rdacm20_video_ops,
+	.pad		= &rdacm20_subdev_pad_ops,
+};
+
+static int rdacm20_initialize(struct rdacm20_device *dev)
+{
+	int ret;
+
+	max9271_wake_up(&dev->serializer);
+
+	/* Serial link disabled during config as it needs a valid pixel clock. */
+	ret = max9271_set_serial_link(&dev->serializer, false);
+	if (ret)
+		return ret;
+
+	/*
+	 *  Ensure that we have a good link configuration before attempting to
+	 *  identify the device.
+	 */
+	ret = max9271_configure_i2c(&dev->serializer,
+				    MAX9271_I2CSLVSH_469NS_234NS |
+				    MAX9271_I2CSLVTO_1024US |
+				    MAX9271_I2CMSTBT_105KBPS);
+	if (ret)
+		return ret;
+
 	/*
 	 * Set reverse channel high threshold to increase noise immunity.
 	 *
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 12ec5467ed1e..35217782f693 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -315,21 +315,6 @@ static int rdacm21_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
-	.s_stream	= rdacm21_s_stream,
-};
-
-static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
-	.enum_mbus_code = rdacm21_enum_mbus_code,
-	.get_fmt	= rdacm21_get_fmt,
-	.set_fmt	= rdacm21_get_fmt,
-};
-
-static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
-	.video		= &rdacm21_video_ops,
-	.pad		= &rdacm21_subdev_pad_ops,
-};
-
 static void ov10640_power_up(struct rdacm21_device *dev)
 {
 	/* Enable GPIO0#0 (reset) and GPIO1#0 (pwdn) as output lines. */
@@ -470,25 +455,11 @@ static int ov490_initialize(struct rdacm21_device *dev)
 	return 0;
 }
 
-static int rdacm21_initialize(struct rdacm21_device *dev)
+static int rdacm21_post_register(struct v4l2_subdev *sd)
 {
+	struct rdacm21_device *dev = sd_to_rdacm21(sd);
 	int ret;
 
-	max9271_wake_up(&dev->serializer);
-
-	/* Enable reverse channel and disable the serial link. */
-	ret = max9271_set_serial_link(&dev->serializer, false);
-	if (ret)
-		return ret;
-
-	/* Configure I2C bus at 105Kbps speed and configure GMSL. */
-	ret = max9271_configure_i2c(&dev->serializer,
-				    MAX9271_I2CSLVSH_469NS_234NS |
-				    MAX9271_I2CSLVTO_1024US |
-				    MAX9271_I2CMSTBT_105KBPS);
-	if (ret)
-		return ret;
-
 	ret = max9271_verify_id(&dev->serializer);
 	if (ret)
 		return ret;
@@ -527,7 +498,45 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
 		return ret;
 	usleep_range(3000, 5000);
 
-	ret = ov490_initialize(dev);
+	return ov490_initialize(dev);
+}
+
+static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
+	.s_stream	= rdacm21_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
+	.enum_mbus_code = rdacm21_enum_mbus_code,
+	.get_fmt	= rdacm21_get_fmt,
+	.set_fmt	= rdacm21_get_fmt,
+};
+
+static const struct v4l2_subdev_core_ops rdacm21_core_ops = {
+	.post_register	= rdacm21_post_register,
+};
+
+static const struct v4l2_subdev_ops rdacm21_subdev_ops = {
+	.core		= &rdacm21_core_ops,
+	.video		= &rdacm21_video_ops,
+	.pad		= &rdacm21_subdev_pad_ops,
+};
+
+static int rdacm21_initialize(struct rdacm21_device *dev)
+{
+	int ret;
+
+	max9271_wake_up(&dev->serializer);
+
+	/* Enable reverse channel and disable the serial link. */
+	ret = max9271_set_serial_link(&dev->serializer, false);
+	if (ret)
+		return ret;
+
+	/* Configure I2C bus at 105Kbps speed and configure GMSL. */
+	ret = max9271_configure_i2c(&dev->serializer,
+				    MAX9271_I2CSLVSH_469NS_234NS |
+				    MAX9271_I2CSLVTO_1024US |
+				    MAX9271_I2CMSTBT_105KBPS);
 	if (ret)
 		return ret;
 
-- 
2.32.0

