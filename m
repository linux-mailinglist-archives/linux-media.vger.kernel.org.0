Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1383EE726
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 09:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbhHQH1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 03:27:11 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53113 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbhHQH1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 03:27:08 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 67E48FF80E;
        Tue, 17 Aug 2021 07:26:31 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [RFC 3/5] media: i2c: rdacm20: Adapt to work with MAX9271
Date:   Tue, 17 Aug 2021 09:27:01 +0200
Message-Id: <20210817072703.1167-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
References: <20210817072703.1167-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rdacm20 camera module driver was designed to work with the MAX9271
library driver now named max9271-lib.

With the introduction of an i2c subdevice driver for the MAX9271
serializer adapt the camera module driver to work with it by removing
calls to the max9271 handling functions.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 139 ++++++------------------------------
 1 file changed, 23 insertions(+), 116 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index bf06a1c50306..1cc8a7478b6f 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -27,8 +27,6 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
-#include "max9271-lib.h"
-
 #define OV10635_I2C_ADDRESS		0x30
 
 #define OV10635_SOFTWARE_RESET		0x0103
@@ -312,8 +310,7 @@ static const struct ov10635_reg {
 
 struct rdacm20_device {
 	struct device			*dev;
-	struct max9271_device		serializer;
-	struct i2c_client		*sensor;
+	struct i2c_client		*client;
 	struct v4l2_subdev		sd;
 	struct media_pad		pad;
 	struct v4l2_ctrl_handler	ctrls;
@@ -335,14 +332,14 @@ static int ov10635_read16(struct rdacm20_device *dev, u16 reg)
 	u8 buf[2] = { reg >> 8, reg & 0xff };
 	int ret;
 
-	ret = i2c_master_send(dev->sensor, buf, 2);
+	ret = i2c_master_send(dev->client, buf, 2);
 	if (ret != 2) {
 		dev_dbg(dev->dev, "%s: register 0x%04x write failed (%d)\n",
 			__func__, reg, ret);
 		return ret;
 	}
 
-	ret = i2c_master_recv(dev->sensor, buf, 2);
+	ret = i2c_master_recv(dev->client, buf, 2);
 	if (ret < 0) {
 		dev_dbg(dev->dev, "%s: register 0x%04x read failed (%d)\n",
 			__func__, reg, ret);
@@ -359,7 +356,7 @@ static int __ov10635_write(struct rdacm20_device *dev, u16 reg, u8 val)
 
 	dev_dbg(dev->dev, "%s(0x%04x, 0x%02x)\n", __func__, reg, val);
 
-	ret = i2c_master_send(dev->sensor, buf, 3);
+	ret = i2c_master_send(dev->client, buf, 3);
 	return ret < 0 ? ret : 0;
 }
 
@@ -379,11 +376,17 @@ static int ov10635_set_regs(struct rdacm20_device *dev,
 			    const struct ov10635_reg *regs,
 			    unsigned int nr_regs)
 {
+	unsigned int retry;
 	unsigned int i;
 	int ret;
 
 	for (i = 0; i < nr_regs; i++) {
+		retry = 3;
+again:
 		ret = __ov10635_write(dev, regs[i].reg, regs[i].val);
+		if (ret && retry--)
+			goto again;
+
 		if (ret) {
 			dev_err(dev->dev,
 				"%s: register %u (0x%04x) write failed (%d)\n",
@@ -397,9 +400,7 @@ static int ov10635_set_regs(struct rdacm20_device *dev,
 
 static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct rdacm20_device *dev = sd_to_rdacm20(sd);
-
-	return max9271_set_serial_link(&dev->serializer, enable);
+	return 0;
 }
 
 static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
@@ -440,37 +441,10 @@ static int rdacm20_post_register(struct v4l2_subdev *sd)
 	struct rdacm20_device *dev = sd_to_rdacm20(sd);
 	unsigned int retry = 3;
 	int ret;
+	u8 addr;
 
-	/*
-	 * Hold OV10635 in reset during max9271 configuration. The reset signal
-	 * has to be asserted for at least 200 microseconds.
-	 */
-	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
-	if (ret)
-		return ret;
-
-	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
-	if (ret)
-		return ret;
-	usleep_range(200, 500);
-
-	ret = max9271_configure_gmsl_link(&dev->serializer);
-	if (ret)
-		return ret;
-
-	ret = max9271_verify_id(&dev->serializer);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * Release ov10635 from reset and initialize it. The image sensor
-	 * requires at least 2048 XVCLK cycles (85 micro-seconds at 24MHz)
-	 * before being available. Stay safe and wait up to 500 micro-seconds.
-	 */
-	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
-	if (ret)
-		return ret;
-	usleep_range(100, 500);
+	addr = dev->client->addr;
+	dev->client->addr = OV10635_I2C_ADDRESS;
 
 again:
 	ret = ov10635_read16(dev, OV10635_PID);
@@ -492,23 +466,22 @@ static int rdacm20_post_register(struct v4l2_subdev *sd)
 		return -ENXIO;
 	}
 
+	/* Program the 0V10635 initial configuration. */
+	ret = ov10635_set_regs(dev, ov10635_regs_wizard,
+			       ARRAY_SIZE(ov10635_regs_wizard));
+	if (ret)
+		return ret;
+
 	/* Change the sensor I2C address. */
 	ret = ov10635_write(dev, OV10635_SC_CMMN_SCCB_ID,
-			    (dev->addrs[1] << 1) |
-			    OV10635_SC_CMMN_SCCB_ID_SELECT);
+			    (addr << 1) | OV10635_SC_CMMN_SCCB_ID_SELECT);
 	if (ret < 0) {
 		dev_err(dev->dev,
 			"OV10635 I2C address change failed (%d)\n", ret);
 		return ret;
 	}
-	dev->sensor->addr = dev->addrs[1];
 	usleep_range(3500, 5000);
-
-	/* Program the 0V10635 initial configuration. */
-	ret = ov10635_set_regs(dev, ov10635_regs_wizard,
-			       ARRAY_SIZE(ov10635_regs_wizard));
-	if (ret)
-		return ret;
+	dev->client->addr = addr;
 
 	dev_info(dev->dev, "Identified RDACM20 camera module\n");
 
@@ -535,48 +508,6 @@ static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
 	.pad		= &rdacm20_subdev_pad_ops,
 };
 
-static int rdacm20_initialize(struct rdacm20_device *dev)
-{
-	int ret;
-
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
-	ret = max9271_set_address(&dev->serializer, dev->addrs[0]);
-	if (ret < 0)
-		return ret;
-	dev->serializer.client->addr = dev->addrs[0];
-
-	/*
-	 * Set reverse channel high threshold to increase noise immunity.
-	 *
-	 * This should be compensated by increasing the reverse channel
-	 * amplitude on the remote deserializer side.
-	 *
-	 * TODO Inspect the embedded MCU programming sequence to make sure
-	 * there are no conflicts with the configuration applied here.
-	 *
-	 * TODO Clarify the embedded MCU startup delay to avoid write
-	 * collisions on the I2C bus.
-	 */
-	return max9271_set_high_threshold(&dev->serializer, true);
-}
-
 static int rdacm20_probe(struct i2c_client *client)
 {
 	struct rdacm20_device *dev;
@@ -587,27 +518,7 @@ static int rdacm20_probe(struct i2c_client *client)
 	if (!dev)
 		return -ENOMEM;
 	dev->dev = &client->dev;
-	dev->serializer.client = client;
-
-	ret = of_property_read_u32_array(client->dev.of_node, "reg",
-					 dev->addrs, 2);
-	if (ret < 0) {
-		dev_err(dev->dev, "Invalid DT reg property: %d\n", ret);
-		return -EINVAL;
-	}
-
-	/* Create the dummy I2C client for the sensor. */
-	dev->sensor = i2c_new_dummy_device(client->adapter,
-					   OV10635_I2C_ADDRESS);
-	if (IS_ERR(dev->sensor)) {
-		ret = PTR_ERR(dev->sensor);
-		goto error;
-	}
-
-	/* Initialize the hardware. */
-	ret = rdacm20_initialize(dev);
-	if (ret < 0)
-		goto error;
+	dev->client  = client;
 
 	/* Initialize and register the subdevice. */
 	v4l2_i2c_subdev_init(&dev->sd, client, &rdacm20_subdev_ops);
@@ -649,10 +560,7 @@ static int rdacm20_probe(struct i2c_client *client)
 	fwnode_handle_put(ep);
 error_free_ctrls:
 	v4l2_ctrl_handler_free(&dev->ctrls);
-error:
 	media_entity_cleanup(&dev->sd.entity);
-	if (dev->sensor)
-		i2c_unregister_device(dev->sensor);
 
 	dev_err(&client->dev, "probe failed\n");
 
@@ -667,7 +575,6 @@ static int rdacm20_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(&dev->sd);
 	v4l2_ctrl_handler_free(&dev->ctrls);
 	media_entity_cleanup(&dev->sd.entity);
-	i2c_unregister_device(dev->sensor);
 
 	return 0;
 }
-- 
2.32.0

