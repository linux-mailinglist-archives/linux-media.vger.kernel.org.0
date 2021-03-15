Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC7633B371
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhCONP1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:15:27 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34315 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbhCONPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:15:01 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 05FDDFF810;
        Mon, 15 Mar 2021 13:14:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 03/18] media: i2c: rdacm20: Embedded 'serializer' field
Date:   Mon, 15 Mar 2021 14:14:57 +0100
Message-Id: <20210315131512.133720-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
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

