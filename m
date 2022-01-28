Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D656F49F532
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 09:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347347AbiA1Iel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 03:34:41 -0500
Received: from retiisi.eu ([95.216.213.190]:59004 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347334AbiA1Iej (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 03:34:39 -0500
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id D2C94634C94;
        Fri, 28 Jan 2022 10:34:37 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v2 2/4] mc: Provide a helper for setting bus_info field
Date:   Fri, 28 Jan 2022 10:33:07 +0200
Message-Id: <20220128083309.213122-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bus_info or a similar field exists in a lot of structs, yet drivers
tend to set the value of that field by themselves in a determinable way.
Thus provide a helper for doing this. To be used in subsequent patches.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/media-device.h | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/media/media-device.h b/include/media/media-device.h
index 1345e6da688a..54f0c12bc682 100644
--- a/include/media/media-device.h
+++ b/include/media/media-device.h
@@ -13,12 +13,13 @@
 
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include <media/media-devnode.h>
 #include <media/media-entity.h>
 
 struct ida;
-struct device;
 struct media_device;
 
 /**
@@ -181,8 +182,7 @@ struct media_device {
 	atomic_t request_id;
 };
 
-/* We don't need to include pci.h or usb.h here */
-struct pci_dev;
+/* We don't need to include usb.h here */
 struct usb_device;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
@@ -496,4 +496,26 @@ static inline void __media_device_usb_init(struct media_device *mdev,
 #define media_device_usb_init(mdev, udev, name) \
 	__media_device_usb_init(mdev, udev, name, KBUILD_MODNAME)
 
+
+/**
+ * media_set_bus_info() - Conditionally set bus_info
+ *
+ * @bus_info:		Variable where to write the bus info (char array)
+ * @bus_info_size:	Length of the bus_info
+ * @dev:		Related struct device
+ *
+ * Sets bus information based on &dev. This is currently done for PCI and
+ * platform devices. dev is required to be non-NULL for this to happen.
+ */
+static inline void
+media_set_bus_info(char *bus_info, size_t bus_info_size, struct device *dev)
+{
+	if (!dev)
+		strscpy(bus_info, "no bus info", bus_info_size);
+	else if (dev_is_platform(dev))
+		snprintf(bus_info, bus_info_size, "platform:%s", dev_name(dev));
+	else if (dev_is_pci(dev))
+		snprintf(bus_info, bus_info_size, "PCI:%s", dev_name(dev));
+}
+
 #endif
-- 
2.30.2

