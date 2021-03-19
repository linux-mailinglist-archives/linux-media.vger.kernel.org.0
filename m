Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3D034224E
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 17:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbhCSQmv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 12:42:51 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50419 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbhCSQmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 12:42:21 -0400
X-Originating-IP: 5.92.35.220
Received: from uno.localdomain (mob-5-92-35-220.net.vodafone.it [5.92.35.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3CFC7C0012;
        Fri, 19 Mar 2021 16:42:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 15/19] media: i2c: rdacm20: Embed 'serializer' field
Date:   Fri, 19 Mar 2021 17:41:44 +0100
Message-Id: <20210319164148.199192-16-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
References: <20210319164148.199192-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no reason to allocate dynamically the 'serializer' field in
the driver structure.

Embed the field and adjust all its users in the driver.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 40 ++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 554fd3b3ec3d..7bdcfafa6c10 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -312,7 +312,7 @@ static const struct ov10635_reg {
 
 struct rdacm20_device {
 	struct device			*dev;
-	struct max9271_device		*serializer;
+	struct max9271_device		serializer;
 	struct i2c_client		*sensor;
 	struct v4l2_subdev		sd;
 	struct media_pad		pad;
@@ -399,7 +399,7 @@ static int rdacm20_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rdacm20_device *dev = sd_to_rdacm20(sd);
 
-	return max9271_set_serial_link(dev->serializer, enable);
+	return max9271_set_serial_link(&dev->serializer, enable);
 }
 
 static int rdacm20_enum_mbus_code(struct v4l2_subdev *sd,
@@ -445,35 +445,35 @@ static int rdacm20_init(struct v4l2_subdev *sd, unsigned int val)
 	 *  Ensure that we have a good link configuration before attempting to
 	 *  identify the device.
 	 */
-	max9271_configure_i2c(dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
-					       MAX9271_I2CSLVTO_1024US |
-					       MAX9271_I2CMSTBT_105KBPS);
+	max9271_configure_i2c(&dev->serializer, MAX9271_I2CSLVSH_469NS_234NS |
+						MAX9271_I2CSLVTO_1024US |
+						MAX9271_I2CMSTBT_105KBPS);
 
-	max9271_configure_gmsl_link(dev->serializer);
+	max9271_configure_gmsl_link(&dev->serializer);
 
-	ret = max9271_verify_id(dev->serializer);
+	ret = max9271_verify_id(&dev->serializer);
 	if (ret < 0)
 		return ret;
 
-	ret = max9271_set_address(dev->serializer, dev->addrs[0]);
+	ret = max9271_set_address(&dev->serializer, dev->addrs[0]);
 	if (ret < 0)
 		return ret;
-	dev->serializer->client->addr = dev->addrs[0];
+	dev->serializer.client->addr = dev->addrs[0];
 
 	/*
 	 * Reset the sensor by cycling the OV10635 reset signal connected to the
 	 * MAX9271 GPIO1 and verify communication with the OV10635.
 	 */
-	ret = max9271_enable_gpios(dev->serializer, MAX9271_GPIO1OUT);
+	ret = max9271_enable_gpios(&dev->serializer, MAX9271_GPIO1OUT);
 	if (ret)
 		return ret;
 
-	ret = max9271_clear_gpios(dev->serializer, MAX9271_GPIO1OUT);
+	ret = max9271_clear_gpios(&dev->serializer, MAX9271_GPIO1OUT);
 	if (ret)
 		return ret;
 	usleep_range(10000, 15000);
 
-	ret = max9271_set_gpios(dev->serializer, MAX9271_GPIO1OUT);
+	ret = max9271_set_gpios(&dev->serializer, MAX9271_GPIO1OUT);
 	if (ret)
 		return ret;
 	usleep_range(10000, 15000);
@@ -558,11 +558,11 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	int ret;
 
 	/* Verify communication with the MAX9271: ping to wakeup. */
-	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
-	max9271_wake_up(dev->serializer);
+	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
+	max9271_wake_up(&dev->serializer);
 
 	/* Serial link disabled during config as it needs a valid pixel clock. */
-	ret = max9271_set_serial_link(dev->serializer, false);
+	ret = max9271_set_serial_link(&dev->serializer, false);
 	if (ret)
 		return ret;
 
@@ -572,7 +572,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	 * This should be compensated by increasing the reverse channel
 	 * amplitude on the remote deserializer side.
 	 */
-	return max9271_set_high_threshold(dev->serializer, true);
+	return max9271_set_high_threshold(&dev->serializer, true);
 }
 
 static int rdacm20_probe(struct i2c_client *client)
@@ -585,13 +585,7 @@ static int rdacm20_probe(struct i2c_client *client)
 	if (!dev)
 		return -ENOMEM;
 	dev->dev = &client->dev;
-
-	dev->serializer = devm_kzalloc(&client->dev, sizeof(*dev->serializer),
-				       GFP_KERNEL);
-	if (!dev->serializer)
-		return -ENOMEM;
-
-	dev->serializer->client = client;
+	dev->serializer.client = client;
 
 	ret = of_property_read_u32_array(client->dev.of_node, "reg",
 					 dev->addrs, 2);
-- 
2.30.0

