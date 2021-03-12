Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86158338DF6
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 13:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231330AbhCLM5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 07:57:11 -0500
Received: from retiisi.eu ([95.216.213.190]:48382 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230077AbhCLM47 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 07:56:59 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 5DE9D634C8D;
        Fri, 12 Mar 2021 14:54:13 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel.garcia@collabora.com
Subject: [PATCH v2 4/4] v4l: async, fwnode: Improve module organisation
Date:   Fri, 12 Mar 2021 14:56:57 +0200
Message-Id: <20210312125657.25442-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
References: <20210312125657.25442-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 async framework is generally used with the V4L2 fwnode, which
also depends on the former. There is only one exception, the CAFE_CCIC
driver, which uses V4L2 async but does not need V4L2 fwnode.

At the same time there is a vast number of systems that need videodev
module, but have no use for v4l2-async that's now part of videodev.

In order to improve, build v4l2-async and v4l2-fwnode as a single module
called v4l2-async (the v4l2-async.c file is renamed as v4l2-async-core.c).
Also the menu item V4L2_FWNODE is renamed as V4L2_ASYNC.

This also moves the initialisation of the debufs entries for async subdevs
to loading of the v4l2-async module. The directory is named as
"v4l2-async".

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig            |  8 ++++++++
 drivers/media/v4l2-core/Kconfig      |  4 ++++
 drivers/media/v4l2-core/Makefile     | 11 +++++++++--
 drivers/media/v4l2-core/v4l2-async.c | 23 +++++++++++++++++++++--
 drivers/media/v4l2-core/v4l2-dev.c   |  5 -----
 5 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 462c0e059754..4326e50c13c9 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -217,6 +217,7 @@ config VIDEO_ADV7180
 	depends on GPIOLIB && VIDEO_V4L2 && I2C
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_ASYNC
 	help
 	  Support for the Analog Devices ADV7180 video decoder.
 
@@ -1341,6 +1342,7 @@ config VIDEO_AD5820
 	tristate "AD5820 lens voice coil support"
 	depends on GPIOLIB && I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
+	select V4L2_ASYNC
 	help
 	  This is a driver for the AD5820 camera lens voice coil.
 	  It is used for example in Nokia N900 (RX-51).
@@ -1350,6 +1352,7 @@ config VIDEO_AK7375
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_ASYNC
 	help
 	  This is a driver for the AK7375 camera lens voice coil.
 	  AK7375 is a 12 bit DAC with 120mA output current sink
@@ -1361,6 +1364,7 @@ config VIDEO_DW9714
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_ASYNC
 	help
 	  This is a driver for the DW9714 camera lens voice coil.
 	  DW9714 is a 10 bit DAC with 120mA output current sink
@@ -1384,6 +1388,7 @@ config VIDEO_DW9807_VCM
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_ASYNC
 	help
 	  This is a driver for the DW9807 camera lens voice coil.
 	  DW9807 is a 10 bit DAC with 100mA output current sink
@@ -1399,6 +1404,7 @@ config VIDEO_ADP1653
 	tristate "ADP1653 flash support"
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
+	select V4L2_ASYNC
 	help
 	  This is a driver for the ADP1653 flash controller. It is used for
 	  example in Nokia N900.
@@ -1408,6 +1414,7 @@ config VIDEO_LM3560
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select REGMAP_I2C
+	select V4L2_ASYNC
 	help
 	  This is a driver for the lm3560 dual flash controllers. It controls
 	  flash, torch LEDs.
@@ -1417,6 +1424,7 @@ config VIDEO_LM3646
 	depends on I2C && VIDEO_V4L2
 	select MEDIA_CONTROLLER
 	select REGMAP_I2C
+	select V4L2_ASYNC
 	help
 	  This is a driver for the lm3646 dual flash controllers. It controls
 	  flash, torch LEDs.
diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index bf49f83cb86f..61b023b56d75 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -62,6 +62,7 @@ config V4L2_FLASH_LED_CLASS
 	tristate "V4L2 flash API for LED flash class devices"
 	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
 	depends on LEDS_CLASS_FLASH
+	select V4L2_ASYNC
 	help
 	  Say Y here to enable V4L2 flash API support for LED flash
 	  class drivers.
@@ -71,6 +72,9 @@ config V4L2_FLASH_LED_CLASS
 config V4L2_FWNODE
 	tristate
 
+config V4L2_ASYNC
+	tristate
+
 # Used by drivers that need Videobuf modules
 config VIDEOBUF_GEN
 	tristate
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index e4cd589b99a5..eb5ebb5461fd 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -7,15 +7,22 @@ tuner-objs	:=	tuner-core.o
 
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 			v4l2-event.o v4l2-ctrls.o v4l2-subdev.o \
-			v4l2-async.o v4l2-common.o
+			v4l2-common.o
 videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
 videodev-$(CONFIG_TRACEPOINTS) += v4l2-trace.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
 videodev-$(CONFIG_SPI) += v4l2-spi.o
 videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
 
-obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_VIDEO_V4L2) += videodev.o
+ifneq ($(findstring y,$(CONFIG_V4L2_ASYNC)$(CONFIG_V4L2_FWNODE)),)
+obj-y += v4l2-async.o
+else
+ifneq ($(findstring m,$(CONFIG_V4L2_ASYNC)$(CONFIG_V4L2_FWNODE)),)
+obj-m += v4l2-async.o
+endif
+endif
+obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_VIDEO_V4L2) += v4l2-dv-timings.o
 
 obj-$(CONFIG_VIDEO_TUNER) += tuner.o
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 21b3890b96fc..6e49386f0284 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -852,8 +852,27 @@ static int pending_subdevs_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
 
-void v4l2_async_debug_init(struct dentry *debugfs_dir)
+static struct dentry *v4l2_async_debugfs_dir;
+
+static int __init v4l2_async_init(void)
 {
-	debugfs_create_file("pending_async_subdevices", 0444, debugfs_dir, NULL,
+	v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
+	debugfs_create_file("pending_async_subdevices", 0444,
+			    v4l2_async_debugfs_dir, NULL,
 			    &pending_subdevs_fops);
+
+	return 0;
+}
+
+static void __exit v4l2_async_exit(void)
+{
+	debugfs_remove_recursive(v4l2_async_debugfs_dir);
 }
+
+subsys_initcall(v4l2_async_init);
+module_exit(v4l2_async_exit);
+
+MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
+MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
+MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index b6a72d297775..5002e3cd110f 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -39,8 +39,6 @@
 		       __func__, ##arg);				\
 } while (0)
 
-static struct dentry *v4l2_debugfs_dir;
-
 /*
  *	sysfs stuff
  */
@@ -1120,8 +1118,6 @@ static int __init videodev_init(void)
 		return -EIO;
 	}
 
-	v4l2_debugfs_dir = debugfs_create_dir("video4linux", NULL);
-	v4l2_async_debug_init(v4l2_debugfs_dir);
 	return 0;
 }
 
@@ -1129,7 +1125,6 @@ static void __exit videodev_exit(void)
 {
 	dev_t dev = MKDEV(VIDEO_MAJOR, 0);
 
-	debugfs_remove_recursive(v4l2_debugfs_dir);
 	class_unregister(&video_class);
 	unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
 }
-- 
2.29.2

