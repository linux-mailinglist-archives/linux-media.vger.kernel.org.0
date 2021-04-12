Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048C435C204
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 11:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237296AbhDLJhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:37:38 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:48177 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240669AbhDLJez (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:34:55 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B6893200013;
        Mon, 12 Apr 2021 09:34:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 07/17] media: i2c: max9271: Introduce wake_up() function
Date:   Mon, 12 Apr 2021 11:34:41 +0200
Message-Id: <20210412093451.14198-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
References: <20210412093451.14198-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9271 chip manual prescribes a delay of 5 milliseconds
after the chip exits from low power state.

Add a new function to the max9271 library driver that wakes up the chip
with a dummy i2c transaction and implements the correct delay of 5
milliseconds after the chip exits from low power state.

Use the newly introduced function in the rdacm20 and rdacm21 camera
drivers. The former was not respecting the required delay while the
latter was waiting for a too-short timeout.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9271.c | 12 ++++++++++++
 drivers/media/i2c/max9271.h |  9 +++++++++
 drivers/media/i2c/rdacm20.c |  4 +---
 drivers/media/i2c/rdacm21.c |  5 +----
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index 2c7dc7fb9846..ff86c8c4ea61 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -80,6 +80,18 @@ static int max9271_pclk_detect(struct max9271_device *dev)
 	return -EIO;
 }
 
+void max9271_wake_up(struct max9271_device *dev)
+{
+	/*
+	 * Use the chip default address as this function has to be called
+	 * before any other one.
+	 */
+	dev->client->addr = MAX9271_DEFAULT_ADDR;
+	i2c_smbus_read_byte(dev->client);
+	usleep_range(5000, 8000);
+}
+EXPORT_SYMBOL_GPL(max9271_wake_up);
+
 int max9271_set_serial_link(struct max9271_device *dev, bool enable)
 {
 	int ret;
diff --git a/drivers/media/i2c/max9271.h b/drivers/media/i2c/max9271.h
index d78fb21441e9..dc5e4e70ba6f 100644
--- a/drivers/media/i2c/max9271.h
+++ b/drivers/media/i2c/max9271.h
@@ -85,6 +85,15 @@ struct max9271_device {
 	struct i2c_client *client;
 };
 
+/**
+ * max9271_wake_up() - Wake up the serializer by issuing an i2c transaction
+ * @dev: The max9271 device
+ *
+ * This function shall be called before any other interaction with the
+ * serializer.
+ */
+void max9271_wake_up(struct max9271_device *dev);
+
 /**
  * max9271_set_serial_link() - Enable/disable serial link
  * @dev: The max9271 device
diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 90eb73f0e6e9..c1a717153303 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -455,9 +455,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 	unsigned int retry = 3;
 	int ret;
 
-	/* Verify communication with the MAX9271: ping to wakeup. */
-	dev->serializer->client->addr = MAX9271_DEFAULT_ADDR;
-	i2c_smbus_read_byte(dev->serializer->client);
+	max9271_wake_up(dev->serializer);
 
 	/* Serial link disabled during config as it needs a valid pixel clock. */
 	ret = max9271_set_serial_link(dev->serializer, false);
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 179d107f494c..553e3f03752b 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -450,10 +450,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
 {
 	int ret;
 
-	/* Verify communication with the MAX9271: ping to wakeup. */
-	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
-	i2c_smbus_read_byte(dev->serializer.client);
-	usleep_range(3000, 5000);
+	max9271_wake_up(&dev->serializer);
 
 	/* Enable reverse channel and disable the serial link. */
 	ret = max9271_set_serial_link(&dev->serializer, false);
-- 
2.31.1

