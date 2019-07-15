Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B411669D44
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 23:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732452AbfGOVHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 17:07:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52704 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731862AbfGOVHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 17:07:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6D97C28B696
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 3/6] media: v4l2-core: move spi helpers out of v4l2-common.c
Date:   Mon, 15 Jul 2019 18:06:44 -0300
Message-Id: <20190715210649.31681-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715210649.31681-1-ezequiel@collabora.com>
References: <20190715210649.31681-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Separate the spi helpers to v4l2-spi.c, in order to get rid
of the ifdefery. No functional changes intended, this is
just a cosmetic change to organize the code better.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/Makefile      |  1 +
 drivers/media/v4l2-core/v4l2-common.c | 65 ---------------------------
 drivers/media/v4l2-core/v4l2-spi.c    | 65 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 18 +++++++-
 4 files changed, 82 insertions(+), 67 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-spi.c

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 8e2f52f7800b..2deeeac6ee76 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -11,6 +11,7 @@ videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
 videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
+videodev-$(CONFIG_SPI) += v4l2-spi.o
 
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_VIDEO_V4L2) += videodev.o
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index f8ad1c580a3e..2b87b51f5667 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -41,9 +41,6 @@
 #include <linux/string.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
-#if defined(CONFIG_SPI)
-#include <linux/spi/spi.h>
-#endif
 #include <linux/uaccess.h>
 #include <asm/pgtable.h>
 #include <asm/io.h>
@@ -239,68 +236,6 @@ EXPORT_SYMBOL_GPL(v4l2_i2c_tuner_addrs);
 
 #endif /* defined(CONFIG_I2C) */
 
-#if defined(CONFIG_SPI)
-
-/* Load an spi sub-device. */
-
-void v4l2_spi_subdev_init(struct v4l2_subdev *sd, struct spi_device *spi,
-		const struct v4l2_subdev_ops *ops)
-{
-	v4l2_subdev_init(sd, ops);
-	sd->flags |= V4L2_SUBDEV_FL_IS_SPI;
-	/* the owner is the same as the spi_device's driver owner */
-	sd->owner = spi->dev.driver->owner;
-	sd->dev = &spi->dev;
-	/* spi_device and v4l2_subdev point to one another */
-	v4l2_set_subdevdata(sd, spi);
-	spi_set_drvdata(spi, sd);
-	/* initialize name */
-	snprintf(sd->name, sizeof(sd->name), "%s %s",
-		spi->dev.driver->name, dev_name(&spi->dev));
-}
-EXPORT_SYMBOL_GPL(v4l2_spi_subdev_init);
-
-struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
-		struct spi_master *master, struct spi_board_info *info)
-{
-	struct v4l2_subdev *sd = NULL;
-	struct spi_device *spi = NULL;
-
-	BUG_ON(!v4l2_dev);
-
-	if (info->modalias[0])
-		request_module(info->modalias);
-
-	spi = spi_new_device(master, info);
-
-	if (spi == NULL || spi->dev.driver == NULL)
-		goto error;
-
-	if (!try_module_get(spi->dev.driver->owner))
-		goto error;
-
-	sd = spi_get_drvdata(spi);
-
-	/* Register with the v4l2_device which increases the module's
-	   use count as well. */
-	if (v4l2_device_register_subdev(v4l2_dev, sd))
-		sd = NULL;
-
-	/* Decrease the module use count to match the first try_module_get. */
-	module_put(spi->dev.driver->owner);
-
-error:
-	/* If we have a client but no subdev, then something went wrong and
-	   we must unregister the client. */
-	if (!sd)
-		spi_unregister_device(spi);
-
-	return sd;
-}
-EXPORT_SYMBOL_GPL(v4l2_spi_new_subdev);
-
-#endif /* defined(CONFIG_SPI) */
-
 /* Clamp x to be between min and max, aligned to a multiple of 2^align.  min
  * and max don't have to be aligned, but there must be at least one valid
  * value.  E.g., min=17,max=31,align=4 is not allowed as there are no multiples
diff --git a/drivers/media/v4l2-core/v4l2-spi.c b/drivers/media/v4l2-core/v4l2-spi.c
new file mode 100644
index 000000000000..ab5a7eb4205d
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-spi.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * v4l2-spi - SPI helpers for Video4Linux2
+ */
+
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+
+void v4l2_spi_subdev_init(struct v4l2_subdev *sd, struct spi_device *spi,
+		const struct v4l2_subdev_ops *ops)
+{
+	v4l2_subdev_init(sd, ops);
+	sd->flags |= V4L2_SUBDEV_FL_IS_SPI;
+	/* the owner is the same as the spi_device's driver owner */
+	sd->owner = spi->dev.driver->owner;
+	sd->dev = &spi->dev;
+	/* spi_device and v4l2_subdev point to one another */
+	v4l2_set_subdevdata(sd, spi);
+	spi_set_drvdata(spi, sd);
+	/* initialize name */
+	snprintf(sd->name, sizeof(sd->name), "%s %s",
+		spi->dev.driver->name, dev_name(&spi->dev));
+}
+EXPORT_SYMBOL_GPL(v4l2_spi_subdev_init);
+
+struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
+		struct spi_master *master, struct spi_board_info *info)
+{
+	struct v4l2_subdev *sd = NULL;
+	struct spi_device *spi = NULL;
+
+	BUG_ON(!v4l2_dev);
+
+	if (info->modalias[0])
+		request_module(info->modalias);
+
+	spi = spi_new_device(master, info);
+
+	if (spi == NULL || spi->dev.driver == NULL)
+		goto error;
+
+	if (!try_module_get(spi->dev.driver->owner))
+		goto error;
+
+	sd = spi_get_drvdata(spi);
+
+	/* Register with the v4l2_device which increases the module's
+	   use count as well. */
+	if (v4l2_device_register_subdev(v4l2_dev, sd))
+		sd = NULL;
+
+	/* Decrease the module use count to match the first try_module_get. */
+	module_put(spi->dev.driver->owner);
+
+error:
+	/* If we have a client but no subdev, then something went wrong and
+	   we must unregister the client. */
+	if (!sd)
+		spi_unregister_device(spi);
+
+	return sd;
+}
+EXPORT_SYMBOL_GPL(v4l2_spi_new_subdev);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 6b319d0d73ad..a1c5288caa6a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -216,11 +216,10 @@ const unsigned short *v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type);
 /* ------------------------------------------------------------------------- */
 
 /* SPI Helper functions */
-#if defined(CONFIG_SPI)
 
 #include <linux/spi/spi.h>
 
-struct spi_device;
+#if defined(CONFIG_SPI)
 
 /**
  *  v4l2_spi_new_subdev - Load an spi module and return an initialized
@@ -246,6 +245,21 @@ struct v4l2_subdev *v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
  */
 void v4l2_spi_subdev_init(struct v4l2_subdev *sd, struct spi_device *spi,
 		const struct v4l2_subdev_ops *ops);
+
+#else
+
+static inline struct v4l2_subdev *
+v4l2_spi_new_subdev(struct v4l2_device *v4l2_dev,
+		    struct spi_master *master, struct spi_board_info *info)
+{
+	return NULL;
+}
+
+static inline void
+v4l2_spi_subdev_init(struct v4l2_subdev *sd, struct spi_device *spi,
+		     const struct v4l2_subdev_ops *ops)
+{}
+
 #endif
 
 /* ------------------------------------------------------------------------- */
-- 
2.22.0

