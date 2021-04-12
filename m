Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D0935C21C
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239188AbhDLJjF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:39:05 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:55015 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241066AbhDLJgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:36:48 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C84D5200016;
        Mon, 12 Apr 2021 09:34:54 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 17/17] media: gmsl: Reimplement initialization sequence
Date:   Mon, 12 Apr 2021 11:34:51 +0200
Message-Id: <20210412093451.14198-18-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current probe() procedure of the RDACM20 and RDACM21 GMSL cameras is
performed with the embedded MAX9271 serializer's noise immunity
threshold disabled. Once the camera has been initialized by probing the
embedded chips, the threshold is enabled and then compensated on the
deserializer's side by increasing the reverse channel signal amplitude
once all cameras have bound.

The probe routine is thus run without noise immunity activated which
in noisy environment conditions makes the probe sequence less reliable as
the chips configuration requires a relatively high amount of i2c
transactions.

Break chip initialization in two:
- At probe time only configure the serializer's reverse channel with
  noise immunity activated, to reduce the number of transactions
  performed without noise immunity protection enabled
- Move the chips initialization to the .init() core subdev operation
  called by the deserializer after all camera have probed and
  have increased their noise immunity threshold

The initialization routine looks like the following:

            MAX9286                  RDACM20/21

            probe()
               |
               ---------------------> |
                                      probe() {
                                         enable_threshold()
                                      }
               |<--------------------|
            v4l2 async bound {
                compensate_amplitude()
                call subdev init()
               |-------------------->|
                                     init() {
                                         access camera registers()
                                    }
               |<-------------------
            }

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 19 +++++++++---
 drivers/media/i2c/rdacm20.c | 59 ++++++++++++++++++++++---------------
 drivers/media/i2c/rdacm21.c | 59 ++++++++++++++++++++++---------------
 3 files changed, 87 insertions(+), 50 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index e1c7173f2d00..aafe55f30a0a 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -563,17 +563,28 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	if (priv->bound_sources != priv->source_mask)
 		return 0;

+	/*
+	 * Initialize all the remote camera. Increase the channel amplitude
+	 * to compensate for the remote noise immunity threshold.
+	 */
+	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
+	for_each_source(priv, source) {
+		ret = v4l2_subdev_call(source->sd, core, init, 0);
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
-	 *
-	 * - Increase the reverse channel amplitude to compensate for the
-	 *   remote ends high threshold
 	 * - Verify all configuration links are properly detected
 	 * - Disable auto-ack as communication on the control channel are now
 	 *   stable.
 	 */
-	max9286_reverse_channel_setup(priv, MAX9286_REV_AMP_HIGH);
 	max9286_check_config_link(priv, priv->source_mask);
 	max9286_configure_i2c(priv, false);

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index cb725c2778c0..ce3e05ca6389 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -435,33 +435,12 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
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
+static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
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
 	/*
 	 *  Ensure that we have a good link configuration before attempting to
 	 *  identify the device.
@@ -549,6 +528,40 @@ static int rdacm20_initialize(struct rdacm20_device *dev)

 	dev_info(dev->dev, "Identified RDACM20 camera module\n");

+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops rdacm20_core_ops = {
+	.init           = rdacm20_init,
+};
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
 	/*
 	 * Set reverse channel high threshold to increase noise immunity.
 	 *
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 43c41cb800a4..7232722e59cd 100644
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
@@ -470,17 +455,11 @@ static int ov490_initialize(struct rdacm21_device *dev)
 	return 0;
 }

-static int rdacm21_initialize(struct rdacm21_device *dev)
+static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
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
 	/* Configure I2C bus at 105Kbps speed and configure GMSL. */
 	ret = max9271_configure_i2c(&dev->serializer,
 				    MAX9271_I2CSLVSH_469NS_234NS |
@@ -531,6 +510,40 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
 	if (ret)
 		return ret;

+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops rdacm21_core_ops = {
+	.init		= rdacm21_init,
+};
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
 	/*
 	 * Set reverse channel high threshold to increase noise immunity.
 	 *
--
2.31.1

