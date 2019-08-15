Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B4C8F132
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbfHOQsZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:48:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38918 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729579AbfHOQsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:48:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id F386228CF71
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 5/6] media: v4l2-core: introduce a helper to unregister a i2c subdev
Date:   Thu, 15 Aug 2019 13:48:05 -0300
Message-Id: <20190815164806.19248-6-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815164806.19248-1-ezequiel@collabora.com>
References: <20190815164806.19248-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce a new video4linux2 i2c helper, to unregister a subdev.
This allows to get rid of yet another ifdef.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes v2:
* None.
---
 drivers/media/v4l2-core/v4l2-device.c | 25 ++-----------------------
 drivers/media/v4l2-core/v4l2-i2c.c    | 20 ++++++++++++++++++++
 include/media/v4l2-common.h           | 10 ++++++++++
 3 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index c2811238996f..63d6b147b21e 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -9,7 +9,6 @@
 #include <linux/types.h>
 #include <linux/ioctl.h>
 #include <linux/module.h>
-#include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <media/v4l2-device.h>
@@ -99,28 +98,8 @@ void v4l2_device_unregister(struct v4l2_device *v4l2_dev)
 	/* Unregister subdevs */
 	list_for_each_entry_safe(sd, next, &v4l2_dev->subdevs, list) {
 		v4l2_device_unregister_subdev(sd);
-#if IS_ENABLED(CONFIG_I2C)
-		if (sd->flags & V4L2_SUBDEV_FL_IS_I2C) {
-			struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-			/*
-			 * We need to unregister the i2c client
-			 * explicitly. We cannot rely on
-			 * i2c_del_adapter to always unregister
-			 * clients for us, since if the i2c bus is a
-			 * platform bus, then it is never deleted.
-			 *
-			 * Device tree or ACPI based devices must not
-			 * be unregistered as they have not been
-			 * registered by us, and would not be
-			 * re-created by just probing the V4L2 driver.
-			 */
-			if (client &&
-			    !client->dev.of_node && !client->dev.fwnode)
-				i2c_unregister_device(client);
-			continue;
-		}
-#endif
+		if (sd->flags & V4L2_SUBDEV_FL_IS_I2C)
+			v4l2_i2c_subdev_unregister(sd);
 		else if (sd->flags & V4L2_SUBDEV_FL_IS_SPI)
 			v4l2_spi_subdev_unregister(sd);
 	}
diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
index f393dd4f1c00..3d7a3081ec0b 100644
--- a/drivers/media/v4l2-core/v4l2-i2c.c
+++ b/drivers/media/v4l2-core/v4l2-i2c.c
@@ -8,6 +8,26 @@
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 
+void v4l2_i2c_subdev_unregister(struct v4l2_subdev *sd)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+
+	/*
+	 * We need to unregister the i2c client
+	 * explicitly. We cannot rely on
+	 * i2c_del_adapter to always unregister
+	 * clients for us, since if the i2c bus is a
+	 * platform bus, then it is never deleted.
+	 *
+	 * Device tree or ACPI based devices must not
+	 * be unregistered as they have not been
+	 * registered by us, and would not be
+	 * re-created by just probing the V4L2 driver.
+	 */
+	 if (client && !client->dev.of_node && !client->dev.fwnode)
+		i2c_unregister_device(client);
+}
+
 void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd, struct i2c_client *client,
 			      const char *devname, const char *postfix)
 {
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index e2878654d043..c070d8ae11e5 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -211,6 +211,13 @@ unsigned short v4l2_i2c_subdev_addr(struct v4l2_subdev *sd);
  */
 const unsigned short *v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type);
 
+/**
+ * v4l2_i2c_subdev_unregister - Unregister a v4l2_subdev
+ *
+ * @sd: pointer to &struct v4l2_subdev
+ */
+void v4l2_i2c_subdev_unregister(struct v4l2_subdev *sd);
+
 #else
 
 static inline struct v4l2_subdev *
@@ -250,6 +257,9 @@ v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type)
 	return NULL;
 }
 
+static inline void v4l2_i2c_subdev_unregister(struct v4l2_subdev *sd)
+{}
+
 #endif
 
 /* ------------------------------------------------------------------------- */
-- 
2.22.0

