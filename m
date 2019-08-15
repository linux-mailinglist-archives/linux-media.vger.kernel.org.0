Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD7788F130
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 18:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729855AbfHOQsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 12:48:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38914 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729579AbfHOQsW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 12:48:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2318C28CF6F
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 3/6] media: v4l2-core: move i2c helpers out of v4l2-common.c
Date:   Thu, 15 Aug 2019 13:48:03 -0300
Message-Id: <20190815164806.19248-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190815164806.19248-1-ezequiel@collabora.com>
References: <20190815164806.19248-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Separate the i2c helpers to v4l2-i2c.c, in order to get rid
of the ifdefery. No functional changes intended, this is
just a cosmetic change to organize the code better.

Given I2C is a tristate symbol, a hidden boolean symbol
is introduced, to make the conditional build easier.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
Changes v2:
* None.
---
 drivers/media/v4l2-core/Kconfig       |   5 +
 drivers/media/v4l2-core/Makefile      |   1 +
 drivers/media/v4l2-core/v4l2-common.c | 145 -------------------------
 drivers/media/v4l2-core/v4l2-i2c.c    | 147 ++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 113 +++++++++++++-------
 5 files changed, 229 insertions(+), 182 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-i2c.c

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 7c5f62f196e5..39e3fb30ba0b 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -11,6 +11,11 @@ config VIDEO_V4L2
 	select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
 	default (I2C || I2C=n) && VIDEO_DEV
 
+config VIDEO_V4L2_I2C
+	bool
+	depends on I2C && VIDEO_V4L2
+	default y
+
 config VIDEO_ADV_DEBUG
 	bool "Enable advanced debug functionality on V4L2 drivers"
 	help
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 2deeeac6ee76..786bd1ec4d1b 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -12,6 +12,7 @@ videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
 videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
 videodev-$(CONFIG_SPI) += v4l2-spi.o
+videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
 
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_VIDEO_V4L2) += videodev.o
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 8ffa758d9342..62f7aa92ac29 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -40,7 +40,6 @@
 #include <linux/mm.h>
 #include <linux/string.h>
 #include <linux/errno.h>
-#include <linux/i2c.h>
 #include <linux/uaccess.h>
 #include <asm/pgtable.h>
 #include <asm/io.h>
@@ -88,150 +87,6 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl, s32 _min, s32 _max, s32 _
 }
 EXPORT_SYMBOL(v4l2_ctrl_query_fill);
 
-/* I2C Helper functions */
-
-#if IS_ENABLED(CONFIG_I2C)
-
-void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd, struct i2c_client *client,
-			      const char *devname, const char *postfix)
-{
-	if (!devname)
-		devname = client->dev.driver->name;
-	if (!postfix)
-		postfix = "";
-
-	snprintf(sd->name, sizeof(sd->name), "%s%s %d-%04x", devname, postfix,
-		 i2c_adapter_id(client->adapter), client->addr);
-}
-EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_set_name);
-
-void v4l2_i2c_subdev_init(struct v4l2_subdev *sd, struct i2c_client *client,
-		const struct v4l2_subdev_ops *ops)
-{
-	v4l2_subdev_init(sd, ops);
-	sd->flags |= V4L2_SUBDEV_FL_IS_I2C;
-	/* the owner is the same as the i2c_client's driver owner */
-	sd->owner = client->dev.driver->owner;
-	sd->dev = &client->dev;
-	/* i2c_client and v4l2_subdev point to one another */
-	v4l2_set_subdevdata(sd, client);
-	i2c_set_clientdata(client, sd);
-	v4l2_i2c_subdev_set_name(sd, client, NULL, NULL);
-}
-EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_init);
-
-/* Load an i2c sub-device. */
-struct v4l2_subdev *v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,
-		struct i2c_adapter *adapter, struct i2c_board_info *info,
-		const unsigned short *probe_addrs)
-{
-	struct v4l2_subdev *sd = NULL;
-	struct i2c_client *client;
-
-	BUG_ON(!v4l2_dev);
-
-	request_module(I2C_MODULE_PREFIX "%s", info->type);
-
-	/* Create the i2c client */
-	if (info->addr == 0 && probe_addrs)
-		client = i2c_new_probed_device(adapter, info, probe_addrs,
-					       NULL);
-	else
-		client = i2c_new_device(adapter, info);
-
-	/* Note: by loading the module first we are certain that c->driver
-	   will be set if the driver was found. If the module was not loaded
-	   first, then the i2c core tries to delay-load the module for us,
-	   and then c->driver is still NULL until the module is finally
-	   loaded. This delay-load mechanism doesn't work if other drivers
-	   want to use the i2c device, so explicitly loading the module
-	   is the best alternative. */
-	if (client == NULL || client->dev.driver == NULL)
-		goto error;
-
-	/* Lock the module so we can safely get the v4l2_subdev pointer */
-	if (!try_module_get(client->dev.driver->owner))
-		goto error;
-	sd = i2c_get_clientdata(client);
-
-	/* Register with the v4l2_device which increases the module's
-	   use count as well. */
-	if (v4l2_device_register_subdev(v4l2_dev, sd))
-		sd = NULL;
-	/* Decrease the module use count to match the first try_module_get. */
-	module_put(client->dev.driver->owner);
-
-error:
-	/* If we have a client but no subdev, then something went wrong and
-	   we must unregister the client. */
-	if (client && sd == NULL)
-		i2c_unregister_device(client);
-	return sd;
-}
-EXPORT_SYMBOL_GPL(v4l2_i2c_new_subdev_board);
-
-struct v4l2_subdev *v4l2_i2c_new_subdev(struct v4l2_device *v4l2_dev,
-		struct i2c_adapter *adapter, const char *client_type,
-		u8 addr, const unsigned short *probe_addrs)
-{
-	struct i2c_board_info info;
-
-	/* Setup the i2c board info with the device type and
-	   the device address. */
-	memset(&info, 0, sizeof(info));
-	strscpy(info.type, client_type, sizeof(info.type));
-	info.addr = addr;
-
-	return v4l2_i2c_new_subdev_board(v4l2_dev, adapter, &info, probe_addrs);
-}
-EXPORT_SYMBOL_GPL(v4l2_i2c_new_subdev);
-
-/* Return i2c client address of v4l2_subdev. */
-unsigned short v4l2_i2c_subdev_addr(struct v4l2_subdev *sd)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-	return client ? client->addr : I2C_CLIENT_END;
-}
-EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_addr);
-
-/* Return a list of I2C tuner addresses to probe. Use only if the tuner
-   addresses are unknown. */
-const unsigned short *v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type)
-{
-	static const unsigned short radio_addrs[] = {
-#if IS_ENABLED(CONFIG_MEDIA_TUNER_TEA5761)
-		0x10,
-#endif
-		0x60,
-		I2C_CLIENT_END
-	};
-	static const unsigned short demod_addrs[] = {
-		0x42, 0x43, 0x4a, 0x4b,
-		I2C_CLIENT_END
-	};
-	static const unsigned short tv_addrs[] = {
-		0x42, 0x43, 0x4a, 0x4b,		/* tda8290 */
-		0x60, 0x61, 0x62, 0x63, 0x64,
-		I2C_CLIENT_END
-	};
-
-	switch (type) {
-	case ADDRS_RADIO:
-		return radio_addrs;
-	case ADDRS_DEMOD:
-		return demod_addrs;
-	case ADDRS_TV:
-		return tv_addrs;
-	case ADDRS_TV_WITH_DEMOD:
-		return tv_addrs + 4;
-	}
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(v4l2_i2c_tuner_addrs);
-
-#endif /* defined(CONFIG_I2C) */
-
 /* Clamp x to be between min and max, aligned to a multiple of 2^align.  min
  * and max don't have to be aligned, but there must be at least one valid
  * value.  E.g., min=17,max=31,align=4 is not allowed as there are no multiples
diff --git a/drivers/media/v4l2-core/v4l2-i2c.c b/drivers/media/v4l2-core/v4l2-i2c.c
new file mode 100644
index 000000000000..f393dd4f1c00
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-i2c.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * v4l2-i2c - I2C helpers for Video4Linux2
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+
+void v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd, struct i2c_client *client,
+			      const char *devname, const char *postfix)
+{
+	if (!devname)
+		devname = client->dev.driver->name;
+	if (!postfix)
+		postfix = "";
+
+	snprintf(sd->name, sizeof(sd->name), "%s%s %d-%04x", devname, postfix,
+		 i2c_adapter_id(client->adapter), client->addr);
+}
+EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_set_name);
+
+void v4l2_i2c_subdev_init(struct v4l2_subdev *sd, struct i2c_client *client,
+		const struct v4l2_subdev_ops *ops)
+{
+	v4l2_subdev_init(sd, ops);
+	sd->flags |= V4L2_SUBDEV_FL_IS_I2C;
+	/* the owner is the same as the i2c_client's driver owner */
+	sd->owner = client->dev.driver->owner;
+	sd->dev = &client->dev;
+	/* i2c_client and v4l2_subdev point to one another */
+	v4l2_set_subdevdata(sd, client);
+	i2c_set_clientdata(client, sd);
+	v4l2_i2c_subdev_set_name(sd, client, NULL, NULL);
+}
+EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_init);
+
+/* Load an i2c sub-device. */
+struct v4l2_subdev *v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,
+		struct i2c_adapter *adapter, struct i2c_board_info *info,
+		const unsigned short *probe_addrs)
+{
+	struct v4l2_subdev *sd = NULL;
+	struct i2c_client *client;
+
+	BUG_ON(!v4l2_dev);
+
+	request_module(I2C_MODULE_PREFIX "%s", info->type);
+
+	/* Create the i2c client */
+	if (info->addr == 0 && probe_addrs)
+		client = i2c_new_probed_device(adapter, info, probe_addrs,
+					       NULL);
+	else
+		client = i2c_new_device(adapter, info);
+
+	/* Note: by loading the module first we are certain that c->driver
+	   will be set if the driver was found. If the module was not loaded
+	   first, then the i2c core tries to delay-load the module for us,
+	   and then c->driver is still NULL until the module is finally
+	   loaded. This delay-load mechanism doesn't work if other drivers
+	   want to use the i2c device, so explicitly loading the module
+	   is the best alternative. */
+	if (client == NULL || client->dev.driver == NULL)
+		goto error;
+
+	/* Lock the module so we can safely get the v4l2_subdev pointer */
+	if (!try_module_get(client->dev.driver->owner))
+		goto error;
+	sd = i2c_get_clientdata(client);
+
+	/* Register with the v4l2_device which increases the module's
+	   use count as well. */
+	if (v4l2_device_register_subdev(v4l2_dev, sd))
+		sd = NULL;
+	/* Decrease the module use count to match the first try_module_get. */
+	module_put(client->dev.driver->owner);
+
+error:
+	/* If we have a client but no subdev, then something went wrong and
+	   we must unregister the client. */
+	if (client && sd == NULL)
+		i2c_unregister_device(client);
+	return sd;
+}
+EXPORT_SYMBOL_GPL(v4l2_i2c_new_subdev_board);
+
+struct v4l2_subdev *v4l2_i2c_new_subdev(struct v4l2_device *v4l2_dev,
+		struct i2c_adapter *adapter, const char *client_type,
+		u8 addr, const unsigned short *probe_addrs)
+{
+	struct i2c_board_info info;
+
+	/* Setup the i2c board info with the device type and
+	   the device address. */
+	memset(&info, 0, sizeof(info));
+	strscpy(info.type, client_type, sizeof(info.type));
+	info.addr = addr;
+
+	return v4l2_i2c_new_subdev_board(v4l2_dev, adapter, &info, probe_addrs);
+}
+EXPORT_SYMBOL_GPL(v4l2_i2c_new_subdev);
+
+/* Return i2c client address of v4l2_subdev. */
+unsigned short v4l2_i2c_subdev_addr(struct v4l2_subdev *sd)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+
+	return client ? client->addr : I2C_CLIENT_END;
+}
+EXPORT_SYMBOL_GPL(v4l2_i2c_subdev_addr);
+
+/* Return a list of I2C tuner addresses to probe. Use only if the tuner
+   addresses are unknown. */
+const unsigned short *v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type)
+{
+	static const unsigned short radio_addrs[] = {
+#if IS_ENABLED(CONFIG_MEDIA_TUNER_TEA5761)
+		0x10,
+#endif
+		0x60,
+		I2C_CLIENT_END
+	};
+	static const unsigned short demod_addrs[] = {
+		0x42, 0x43, 0x4a, 0x4b,
+		I2C_CLIENT_END
+	};
+	static const unsigned short tv_addrs[] = {
+		0x42, 0x43, 0x4a, 0x4b,		/* tda8290 */
+		0x60, 0x61, 0x62, 0x63, 0x64,
+		I2C_CLIENT_END
+	};
+
+	switch (type) {
+	case ADDRS_RADIO:
+		return radio_addrs;
+	case ADDRS_DEMOD:
+		return demod_addrs;
+	case ADDRS_TV:
+		return tv_addrs;
+	case ADDRS_TV_WITH_DEMOD:
+		return tv_addrs + 4;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_i2c_tuner_addrs);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index a1c5288caa6a..8e66edddd37b 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -96,16 +96,45 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
 
 /* ------------------------------------------------------------------------- */
 
-/* I2C Helper functions */
-
-struct i2c_driver;
-struct i2c_adapter;
-struct i2c_client;
-struct i2c_device_id;
 struct v4l2_device;
 struct v4l2_subdev;
 struct v4l2_subdev_ops;
 
+/* I2C Helper functions */
+#include <linux/i2c.h>
+
+/**
+ * enum v4l2_i2c_tuner_type - specifies the range of tuner address that
+ *	should be used when seeking for I2C devices.
+ *
+ * @ADDRS_RADIO:		Radio tuner addresses.
+ *				Represent the following I2C addresses:
+ *				0x10 (if compiled with tea5761 support)
+ *				and 0x60.
+ * @ADDRS_DEMOD:		Demod tuner addresses.
+ *				Represent the following I2C addresses:
+ *				0x42, 0x43, 0x4a and 0x4b.
+ * @ADDRS_TV:			TV tuner addresses.
+ *				Represent the following I2C addresses:
+ *				0x42, 0x43, 0x4a, 0x4b, 0x60, 0x61, 0x62,
+ *				0x63 and 0x64.
+ * @ADDRS_TV_WITH_DEMOD:	TV tuner addresses if demod is present, this
+ *				excludes addresses used by the demodulator
+ *				from the list of candidates.
+ *				Represent the following I2C addresses:
+ *				0x60, 0x61, 0x62, 0x63 and 0x64.
+ *
+ * NOTE: All I2C addresses above use the 7-bit notation.
+ */
+enum v4l2_i2c_tuner_type {
+	ADDRS_RADIO,
+	ADDRS_DEMOD,
+	ADDRS_TV,
+	ADDRS_TV_WITH_DEMOD,
+};
+
+#if defined(CONFIG_VIDEO_V4L2_I2C)
+
 /**
  * v4l2_i2c_new_subdev - Load an i2c module and return an initialized
  *	&struct v4l2_subdev.
@@ -123,8 +152,6 @@ struct v4l2_subdev *v4l2_i2c_new_subdev(struct v4l2_device *v4l2_dev,
 		struct i2c_adapter *adapter, const char *client_type,
 		u8 addr, const unsigned short *probe_addrs);
 
-struct i2c_board_info;
-
 /**
  * v4l2_i2c_new_subdev_board - Load an i2c module and return an initialized
  *	&struct v4l2_subdev.
@@ -174,35 +201,6 @@ void v4l2_i2c_subdev_init(struct v4l2_subdev *sd, struct i2c_client *client,
  */
 unsigned short v4l2_i2c_subdev_addr(struct v4l2_subdev *sd);
 
-/**
- * enum v4l2_i2c_tuner_type - specifies the range of tuner address that
- *	should be used when seeking for I2C devices.
- *
- * @ADDRS_RADIO:		Radio tuner addresses.
- *				Represent the following I2C addresses:
- *				0x10 (if compiled with tea5761 support)
- *				and 0x60.
- * @ADDRS_DEMOD:		Demod tuner addresses.
- *				Represent the following I2C addresses:
- *				0x42, 0x43, 0x4a and 0x4b.
- * @ADDRS_TV:			TV tuner addresses.
- *				Represent the following I2C addresses:
- *				0x42, 0x43, 0x4a, 0x4b, 0x60, 0x61, 0x62,
- *				0x63 and 0x64.
- * @ADDRS_TV_WITH_DEMOD:	TV tuner addresses if demod is present, this
- *				excludes addresses used by the demodulator
- *				from the list of candidates.
- *				Represent the following I2C addresses:
- *				0x60, 0x61, 0x62, 0x63 and 0x64.
- *
- * NOTE: All I2C addresses above use the 7-bit notation.
- */
-enum v4l2_i2c_tuner_type {
-	ADDRS_RADIO,
-	ADDRS_DEMOD,
-	ADDRS_TV,
-	ADDRS_TV_WITH_DEMOD,
-};
 /**
  * v4l2_i2c_tuner_addrs - Return a list of I2C tuner addresses to probe.
  *
@@ -213,6 +211,47 @@ enum v4l2_i2c_tuner_type {
  */
 const unsigned short *v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type);
 
+#else
+
+static inline struct v4l2_subdev *
+v4l2_i2c_new_subdev(struct v4l2_device *v4l2_dev,
+		    struct i2c_adapter *adapter, const char *client_type,
+		    u8 addr, const unsigned short *probe_addrs)
+{
+	return NULL;
+}
+
+static inline struct v4l2_subdev *
+v4l2_i2c_new_subdev_board(struct v4l2_device *v4l2_dev,
+			  struct i2c_adapter *adapter, struct i2c_board_info *info,
+			  const unsigned short *probe_addrs)
+{
+	return NULL;
+}
+
+static inline void
+v4l2_i2c_subdev_set_name(struct v4l2_subdev *sd, struct i2c_client *client,
+			 const char *devname, const char *postfix)
+{}
+
+static inline void
+v4l2_i2c_subdev_init(struct v4l2_subdev *sd, struct i2c_client *client,
+		     const struct v4l2_subdev_ops *ops)
+{}
+
+static inline unsigned short v4l2_i2c_subdev_addr(struct v4l2_subdev *sd)
+{
+	return I2C_CLIENT_END;
+}
+
+static inline const unsigned short *
+v4l2_i2c_tuner_addrs(enum v4l2_i2c_tuner_type type)
+{
+	return NULL;
+}
+
+#endif
+
 /* ------------------------------------------------------------------------- */
 
 /* SPI Helper functions */
-- 
2.22.0

