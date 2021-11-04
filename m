Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0B94451F7
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 12:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhKDLLV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 07:11:21 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44925 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhKDLLV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 07:11:21 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 218EBFF817;
        Thu,  4 Nov 2021 11:08:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/2] media: max9271: Fail loud on bus errors in call sites
Date:   Thu,  4 Nov 2021 12:09:24 +0100
Message-Id: <20211104110924.248444-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104110924.248444-1-jacopo+renesas@jmondi.org>
References: <20211104110924.248444-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As not all bus access errors are fatal, as in example reads performed
in a busy loop, it's responsibility of the bus access function caller
to fail louder on fatal errors.

Instrument all functions in the max9271 library driver to fail on fatal
read/write errors and demote the max9271_write() error level to debug
to align it to the one in max9271_read().

While at it, align the style of the existing error messages by removing
"MAX9271" from the output string, as the device log helpers already
identify the driver emitting the message.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9271.c | 105 ++++++++++++++++++++++--------------
 1 file changed, 64 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index aa4add473716..f5f354b8a43c 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -45,7 +45,7 @@ static int max9271_write(struct max9271_device *dev, u8 reg, u8 val)
 
 	ret = i2c_smbus_write_byte_data(dev->client, reg, val);
 	if (ret < 0)
-		dev_err(&dev->client->dev,
+		dev_dbg(&dev->client->dev,
 			"%s: register 0x%02x write failed (%d)\n",
 			__func__, reg, ret);
 
@@ -120,8 +120,11 @@ int max9271_set_serial_link(struct max9271_device *dev, bool enable)
 	 * Therefore a conservative delay seems best here.
 	 */
 	ret = max9271_write(dev, 0x04, val);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(&dev->client->dev, "Failed to set serial link (%d)\n",
+			ret);
 		return ret;
+	}
 
 	usleep_range(5000, 8000);
 
@@ -134,8 +137,11 @@ int max9271_configure_i2c(struct max9271_device *dev, u8 i2c_config)
 	int ret;
 
 	ret = max9271_write(dev, 0x0d, i2c_config);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(&dev->client->dev, "Failed to configure I2C (%d)\n",
+			ret);
 		return ret;
+	}
 
 	/* The delay required after an I2C bus configuration change is not
 	 * characterized in the serializer manual. Sleep up to 5msec to
@@ -153,7 +159,7 @@ int max9271_set_high_threshold(struct max9271_device *dev, bool enable)
 
 	ret = max9271_read(dev, 0x08);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	/*
 	 * Enable or disable reverse channel high threshold to increase
@@ -161,11 +167,15 @@ int max9271_set_high_threshold(struct max9271_device *dev, bool enable)
 	 */
 	ret = max9271_write(dev, 0x08, enable ? ret | BIT(0) : ret & ~BIT(0));
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	usleep_range(2000, 2500);
 
 	return 0;
+
+out:
+	dev_err(&dev->client->dev, "Failed to set high threshold (%d)\n", ret);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(max9271_set_high_threshold);
 
@@ -186,7 +196,7 @@ int max9271_configure_gmsl_link(struct max9271_device *dev)
 	ret = max9271_write(dev, 0x07, MAX9271_DBL | MAX9271_HVEN |
 			    MAX9271_EDC_1BIT_PARITY);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	usleep_range(5000, 8000);
 
@@ -199,11 +209,15 @@ int max9271_configure_gmsl_link(struct max9271_device *dev)
 			    MAX9271_PCLK_AUTODETECT |
 			    MAX9271_SERIAL_AUTODETECT);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	usleep_range(5000, 8000);
 
 	return 0;
+
+out:
+	dev_err(&dev->client->dev, "Failed to configure GMSL link (%d)\n", ret);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(max9271_configure_gmsl_link);
 
@@ -213,18 +227,20 @@ int max9271_set_gpios(struct max9271_device *dev, u8 gpio_mask)
 
 	ret = max9271_read(dev, 0x0f);
 	if (ret < 0)
-		return 0;
+		goto out;
 
 	ret |= gpio_mask;
 	ret = max9271_write(dev, 0x0f, ret);
-	if (ret < 0) {
-		dev_err(&dev->client->dev, "Failed to set gpio (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto out;
 
 	usleep_range(3500, 5000);
 
 	return 0;
+
+out:
+	dev_err(&dev->client->dev, "Failed to set gpio (%d)\n", ret);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(max9271_set_gpios);
 
@@ -234,18 +250,20 @@ int max9271_clear_gpios(struct max9271_device *dev, u8 gpio_mask)
 
 	ret = max9271_read(dev, 0x0f);
 	if (ret < 0)
-		return 0;
+		goto out;
 
 	ret &= ~gpio_mask;
 	ret = max9271_write(dev, 0x0f, ret);
-	if (ret < 0) {
-		dev_err(&dev->client->dev, "Failed to clear gpio (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto out;
 
 	usleep_range(3500, 5000);
 
 	return 0;
+
+out:
+	dev_err(&dev->client->dev, "Failed to clear gpio (%d)\n", ret);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(max9271_clear_gpios);
 
@@ -255,19 +273,21 @@ int max9271_enable_gpios(struct max9271_device *dev, u8 gpio_mask)
 
 	ret = max9271_read(dev, 0x0e);
 	if (ret < 0)
-		return 0;
+		goto out;
 
 	/* BIT(0) reserved: GPO is always enabled. */
 	ret |= (gpio_mask & ~BIT(0));
 	ret = max9271_write(dev, 0x0e, ret);
-	if (ret < 0) {
-		dev_err(&dev->client->dev, "Failed to enable gpio (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto out;
 
 	usleep_range(3500, 5000);
 
 	return 0;
+
+out:
+	dev_err(&dev->client->dev, "Failed to enable gpio (%d)\n", ret);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(max9271_enable_gpios);
 
@@ -277,19 +297,21 @@ int max9271_disable_gpios(struct max9271_device *dev, u8 gpio_mask)
 
 	ret = max9271_read(dev, 0x0e);
 	if (ret < 0)
-		return 0;
+		goto out;
 
 	/* BIT(0) reserved: GPO cannot be disabled */
 	ret &= ~(gpio_mask | BIT(0));
 	ret = max9271_write(dev, 0x0e, ret);
-	if (ret < 0) {
-		dev_err(&dev->client->dev, "Failed to disable gpio (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto out;
 
 	usleep_range(3500, 5000);
 
 	return 0;
+
+out:
+	dev_err(&dev->client->dev, "Failed to disable gpio (%d)\n", ret);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(max9271_disable_gpios);
 
@@ -299,13 +321,13 @@ int max9271_verify_id(struct max9271_device *dev)
 
 	ret = max9271_read(dev, 0x1e);
 	if (ret < 0) {
-		dev_err(&dev->client->dev, "MAX9271 ID read failed (%d)\n",
+		dev_err(&dev->client->dev, "Failed to read the chip ID (%d)\n",
 			ret);
 		return ret;
 	}
 
 	if (ret != MAX9271_ID) {
-		dev_err(&dev->client->dev, "MAX9271 ID mismatch (0x%02x)\n",
+		dev_err(&dev->client->dev, "Chip ID mismatch (0x%02x)\n",
 			ret);
 		return -ENXIO;
 	}
@@ -321,7 +343,7 @@ int max9271_set_address(struct max9271_device *dev, u8 addr)
 	ret = max9271_write(dev, 0x00, addr << 1);
 	if (ret < 0) {
 		dev_err(&dev->client->dev,
-			"MAX9271 I2C address change failed (%d)\n", ret);
+			"Failed to change I2C address (%d)\n", ret);
 		return ret;
 	}
 	usleep_range(3500, 5000);
@@ -337,7 +359,7 @@ int max9271_set_deserializer_address(struct max9271_device *dev, u8 addr)
 	ret = max9271_write(dev, 0x01, addr << 1);
 	if (ret < 0) {
 		dev_err(&dev->client->dev,
-			"MAX9271 deserializer address set failed (%d)\n", ret);
+			"Failed to set deser address (%d)\n", ret);
 		return ret;
 	}
 	usleep_range(3500, 5000);
@@ -351,22 +373,23 @@ int max9271_set_translation(struct max9271_device *dev, u8 source, u8 dest)
 	int ret;
 
 	ret = max9271_write(dev, 0x09, source << 1);
-	if (ret < 0) {
-		dev_err(&dev->client->dev,
-			"MAX9271 I2C translation setup failed (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto out;
+
 	usleep_range(3500, 5000);
 
 	ret = max9271_write(dev, 0x0a, dest << 1);
-	if (ret < 0) {
-		dev_err(&dev->client->dev,
-			"MAX9271 I2C translation setup failed (%d)\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto out;
+
 	usleep_range(3500, 5000);
 
 	return 0;
+
+out:
+	dev_err(&dev->client->dev,
+		"Failed to set I2C addresses translation (%d)\n", ret);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(max9271_set_translation);
 
-- 
2.33.1

