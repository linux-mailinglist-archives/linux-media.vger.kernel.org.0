Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031BD33B382
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 14:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbhCONPf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 09:15:35 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53273 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhCONPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 09:15:19 -0400
X-Originating-IP: 79.22.58.175
Received: from uno.homenet.telecomitalia.it (host-79-22-58-175.retail.telecomitalia.it [79.22.58.175])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 87F16FF807;
        Mon, 15 Mar 2021 13:15:15 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/18] media: i2c: max9271: Introduce wake_up() function
Date:   Mon, 15 Mar 2021 14:15:03 +0100
Message-Id: <20210315131512.133720-10-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9271 chip manual prescribes a delay of 5 milliseconds
after the chip exists from low power state.

Add a new function to the max9271 library driver that wakes up the chip
with a dummy i2c transaction and implements the correct delay of 5
milliseconds after the chip exits from low power state.

Use the newly introduced function in the rdacm20 and rdacm21 camera
drivers. The former was not respecting the required delay while the
latter was waiting for a too-short timeout.

Do not handle the initial i2c address configuration in the library
driver function as the camera module drivers control address
reprogramming.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9271.c | 7 +++++++
 drivers/media/i2c/max9271.h | 9 +++++++++
 drivers/media/i2c/rdacm20.c | 2 +-
 drivers/media/i2c/rdacm21.c | 3 +--
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
index 2c7dc7fb9846..f7bfe7266763 100644
--- a/drivers/media/i2c/max9271.c
+++ b/drivers/media/i2c/max9271.c
@@ -80,6 +80,13 @@ static int max9271_pclk_detect(struct max9271_device *dev)
 	return -EIO;
 }
 
+void max9271_wake_up(struct max9271_device *dev)
+{
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
index b9aaa0f7db42..2265ef7c65d4 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -459,7 +459,7 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 
 	/* Verify communication with the MAX9271: ping to wakeup. */
 	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
-	i2c_smbus_read_byte(dev->serializer.client);
+	max9271_wake_up(&dev->serializer);
 
 	/* Serial link disabled during config as it needs a valid pixel clock. */
 	ret = max9271_set_serial_link(&dev->serializer, false);
diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
index 179d107f494c..7bce55adfd7c 100644
--- a/drivers/media/i2c/rdacm21.c
+++ b/drivers/media/i2c/rdacm21.c
@@ -452,8 +452,7 @@ static int rdacm21_initialize(struct rdacm21_device *dev)
 
 	/* Verify communication with the MAX9271: ping to wakeup. */
 	dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
-	i2c_smbus_read_byte(dev->serializer.client);
-	usleep_range(3000, 5000);
+	max9271_wake_up(&dev->serializer);
 
 	/* Enable reverse channel and disable the serial link. */
 	ret = max9271_set_serial_link(&dev->serializer, false);
-- 
2.30.0

