Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C590D31CF5A
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhBPRnI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:43:08 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:48645 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhBPRm5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:57 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E2FCC200019;
        Tue, 16 Feb 2021 17:41:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] media: i2c: rdacm2x: Implement .init() subdev op
Date:   Tue, 16 Feb 2021 18:41:43 +0100
Message-Id: <20210216174146.106639-14-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current probe() procedure of the RDACM20 and RDACM20 performs
initialization of the serializer image sensors and increases the noise
immunity threshold as last operation, which is then compensated by the
remote deserializer by increasing the reverse channel signal amplitude
once all remotes have bound.

The probe routine is then run without noise immunity activated which
in noisy environment conditions makes the probe sequence less reliable as
the chips configuration requires a relevant amount of i2c transactions.

Break chip initialization in two:
- At probe time only configure the serializer's reverse channel with
  noise immunity activated, to reduce the number of transactions
  performed without noise immunity protection
- Move the chips initialization to the .init() core subdev operation to
  be invoked by the deserializer after the camera has probed and it has
  increased the reverse channel amplitude

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 65 ++++++++++++++++++++++---------------
 drivers/media/i2c/rdacm21.c | 65 ++++++++++++++++++++++---------------
 2 files changed, 78 insertions(+), 52 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 39e4b4241870..0632ef98eea7 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -437,36 +437,12 @@ static int rdacm20_get_fmt(struct v4l2_subdev *sd,
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
 	unsigned int i;
 	int ret;
 
-	/* Verify communication with the MAX9271: ping to wakeup. */
-	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
-	i2c_smbus_read_byte(dev->serializer.client);
-	usleep_range(5000, 8000);
-
-	/* Serial link disabled during config as it needs a valid pixel clock. */
-	ret = max9271_set_serial_link(&dev->serializer, false);
-	if (ret)
-		return ret;
-
 	/*
 	 *  Ensure that we have a good link configuration before attempting to
 	 *  identify the device.
@@ -537,6 +513,43 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 
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
+	/* Verify communication with the MAX9271: ping to wakeup. */
+	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
+	i2c_smbus_read_byte(dev->serializer.client);
+	usleep_range(5000, 8000);
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
index c420a6b96879..80b6f16f87a8 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -314,21 +314,6 @@ static int rdacm21_get_fmt(struct v4l2_subdev *sd,
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
 static int ov10640_initialize(struct rdacm21_device *dev)
 {
 	u8 val;
@@ -448,20 +433,11 @@ static int ov490_initialize(struct rdacm21_device *dev)
 	return 0;
 }
 
-static int rdacm21_initialize(struct rdacm21_device *dev)
+static int rdacm21_init(struct v4l2_subdev *sd, unsigned int val)
 {
+	struct rdacm21_device *dev = sd_to_rdacm21(sd);
 	int ret;
 
-	/* Verify communication with the MAX9271: ping to wakeup. */
-	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
-	i2c_smbus_read_byte(dev->serializer.client);
-	usleep_range(5000, 8000);
-
-	/* Enable reverse channel and disable the serial link. */
-	ret = max9271_set_serial_link(&dev->serializer, false);
-	if (ret)
-		return ret;
-
 	/* Configure I2C bus at 105Kbps speed and configure GMSL. */
 	ret = max9271_configure_i2c(&dev->serializer,
 				    MAX9271_I2CSLVSH_469NS_234NS |
@@ -508,6 +484,43 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
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
+	/* Verify communication with the MAX9271: ping to wakeup. */
+	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
+	i2c_smbus_read_byte(dev->serializer.client);
+	usleep_range(5000, 8000);
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
2.30.0

