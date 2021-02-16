Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE27C31CF3C
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhBPRmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:42:15 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:59369 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhBPRmN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:13 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id EBA4120000E;
        Tue, 16 Feb 2021 17:41:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] media: i2c: rdacm20: Embedded 'serializer' field
Date:   Tue, 16 Feb 2021 18:41:32 +0100
Message-Id: <20210216174146.106639-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no reason to allocate dynamically the 'serializer' field in
the driver structure.

Embed the field and adjust all its users in the driver.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 38 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index f7fd5ae955d0..4d9bac87cba8 100644
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
@@ -456,11 +456,11 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	int ret;
 
 	/* Verify communication with the MAX9271: ping to wakeup. */
-	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
-	i2c_smbus_read_byte(dev->serializer->client);
+	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
+	i2c_smbus_read_byte(dev->serializer.client);
 
 	/* Serial link disabled during config as it needs a valid pixel clock. */
-	ret = max9271_set_serial_link(dev->serializer, false);
+	ret = max9271_set_serial_link(&dev->serializer, false);
 	if (ret)
 		return ret;
 
@@ -468,35 +468,35 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
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
@@ -560,13 +560,7 @@ static int rdacm20_probe(struct i2c_client *client)
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

