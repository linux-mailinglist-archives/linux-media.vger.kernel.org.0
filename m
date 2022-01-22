Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A7C496CF4
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 17:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbiAVQk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 11:40:28 -0500
Received: from retiisi.eu ([95.216.213.190]:36994 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231697AbiAVQk1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 11:40:27 -0500
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::e1:3])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 4EFD0634C94;
        Sat, 22 Jan 2022 18:40:22 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH 1/3] media: Provide a helper for setting bus_info field
Date:   Sat, 22 Jan 2022 18:36:54 +0200
Message-Id: <20220122163656.168440-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
References: <20220122163656.168440-1-sakari.ailus@linux.intel.com>
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
 include/media/media-device.h | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/include/media/media-device.h b/include/media/media-device.h
index 1345e6da688a..9f0458068196 100644
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
@@ -496,4 +496,28 @@ static inline void __media_device_usb_init(struct media_device *mdev,
 #define media_device_usb_init(mdev, udev, name) \
 	__media_device_usb_init(mdev, udev, name, KBUILD_MODNAME)
 
+static inline void
+__media_set_bus_info(char *bus_info, size_t bus_info_size, struct device *dev)
+{
+	if (!dev || *bus_info)
+		return;
+
+	if (dev_is_platform(dev))
+		snprintf(bus_info, bus_info_size, "platform:%s", dev_name(dev));
+	else if (dev_is_pci(dev))
+		snprintf(bus_info, bus_info_size, "PCI:%s", dev_name(dev));
+}
+
+/**
+ * media_set_bus_info() - Conditionally set bus_info
+ *
+ * @bus_info:	Variable where to write the bus info (char array)
+ * @dev:	Related struct device
+ *
+ * Sets bus information based on device conditionally, if the first character of
+ * &bus_info is not '\0' and dev is non-NULL.
+ */
+#define media_set_bus_info(bus_info, dev) \
+	__media_set_bus_info(bus_info, sizeof(bus_info), dev)
+
 #endif
-- 
2.30.2

