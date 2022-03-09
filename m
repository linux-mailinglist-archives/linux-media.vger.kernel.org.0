Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3069C4D37E7
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 18:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235415AbiCIQoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 11:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237456AbiCIQkO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 11:40:14 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2227914A231
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 08:33:13 -0800 (PST)
Received: from lanttu.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::c1:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 5E0A5634C93;
        Wed,  9 Mar 2022 18:33:11 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl
Subject: [PATCH v3 3/5] mc: Provide a helper for setting bus_info field
Date:   Wed,  9 Mar 2022 18:31:10 +0200
Message-Id: <20220309163112.11708-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
References: <20220309163112.11708-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index bc015d2cf541..2122d15bde4e 100644
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
@@ -502,4 +502,28 @@ static inline void __media_device_usb_init(struct media_device *mdev,
 #define media_device_usb_init(mdev, udev, name) \
 	__media_device_usb_init(mdev, udev, name, KBUILD_MODNAME)
 
+
+/**
+ * media_set_bus_info() - Set bus_info field
+ *
+ * @bus_info:		Variable where to write the bus info (char array)
+ * @bus_info_size:	Length of the bus_info
+ * @dev:		Related struct device
+ *
+ * Sets bus information based on &dev. This is currently done for PCI and
+ * platform devices. dev is required to be non-NULL for this to happen.
+ *
+ * This function is not meant to be called from drivers.
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

