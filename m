Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC6C240783
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 16:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgHJOZf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 10:25:35 -0400
Received: from mga01.intel.com ([192.55.52.88]:45121 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727017AbgHJOYt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 10:24:49 -0400
IronPort-SDR: fmnMgSU1eGDFHffPoQ8Z7ySs3KSf39qQZE/m70MMsTU5K9/NL9biIjEhO8JmLovc0cfU/j/bdl
 pFNqzRQ6XLHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="171579268"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="171579268"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:24:48 -0700
IronPort-SDR: YPl2fZSOAy/e24cOsyis2lgV58Q+EebSHq2FtPjmpDgwqTwRi6JPwKGv1w2wD8V5dxRmZwRLD+
 gLTO5k8u7hoQ==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="494329333"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:24:44 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 9EABA2056B;
        Mon, 10 Aug 2020 17:24:41 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1k58mC-0003Er-5a; Mon, 10 Aug 2020 17:27:48 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: [PATCH v5 1/6] i2c: Allow driver to manage the device's power state during probe
Date:   Mon, 10 Aug 2020 17:27:42 +0300
Message-Id: <20200810142747.12400-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable drivers to tell ACPI that there's no need to power on a device for
probe. Drivers should still perform this by themselves if there's a need
to. In some cases powering on the device during probe is undesirable, and
this change enables a driver to choose what fits best for it.

Add a field called "flags" into struct i2c_driver for driver flags, and a
flag I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to tell a driver supports probe in
low power state.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/i2c/i2c-core-base.c | 17 ++++++++++++++---
 include/linux/i2c.h         | 14 ++++++++++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 34a9609f256da..cde9cf49a07e6 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -436,6 +436,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
 	return irq > 0 ? irq : -ENXIO;
 }
 
+static bool allow_low_power_probe(struct device *dev)
+{
+	struct i2c_driver *driver = to_i2c_driver(dev->driver);
+
+	return driver->flags & I2C_DRV_FL_ALLOW_LOW_POWER_PROBE &&
+		device_property_present(dev, "allow-low-power-probe");
+}
+
 static int i2c_device_probe(struct device *dev)
 {
 	struct i2c_client	*client = i2c_verify_client(dev);
@@ -514,7 +522,8 @@ static int i2c_device_probe(struct device *dev)
 	if (status < 0)
 		goto err_clear_wakeup_irq;
 
-	status = dev_pm_domain_attach(&client->dev, true);
+	status = dev_pm_domain_attach(&client->dev,
+				      !allow_low_power_probe(&client->dev));
 	if (status)
 		goto err_clear_wakeup_irq;
 
@@ -536,7 +545,8 @@ static int i2c_device_probe(struct device *dev)
 	return 0;
 
 err_detach_pm_domain:
-	dev_pm_domain_detach(&client->dev, true);
+	dev_pm_domain_detach(&client->dev,
+			     !allow_low_power_probe(&client->dev));
 err_clear_wakeup_irq:
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
@@ -562,7 +572,8 @@ static int i2c_device_remove(struct device *dev)
 		status = driver->remove(client);
 	}
 
-	dev_pm_domain_detach(&client->dev, true);
+	dev_pm_domain_detach(&client->dev,
+			     !allow_low_power_probe(&client->dev));
 
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fc55ea41d3237..6824719c24ebe 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -11,6 +11,7 @@
 #define _LINUX_I2C_H
 
 #include <linux/acpi.h>		/* for acpi_handle */
+#include <linux/bits.h>
 #include <linux/mod_devicetable.h>
 #include <linux/device.h>	/* for struct device */
 #include <linux/sched.h>	/* for completion */
@@ -217,6 +218,16 @@ enum i2c_alert_protocol {
 	I2C_PROTOCOL_SMBUS_HOST_NOTIFY,
 };
 
+/**
+ * enum i2c_driver_flags - Flags for an I2C device driver
+ *
+ * @I2C_DRV_FL_ALLOW_LOW_POWER_PROBE: Let the driver manage the device's power
+ *				      state during probe and remove
+ */
+enum i2c_driver_flags {
+	I2C_DRV_FL_ALLOW_LOW_POWER_PROBE = BIT(0),
+};
+
 /**
  * struct i2c_driver - represent an I2C device driver
  * @class: What kind of i2c device we instantiate (for detect)
@@ -231,6 +242,7 @@ enum i2c_alert_protocol {
  * @detect: Callback for device detection
  * @address_list: The I2C addresses to probe (for detect)
  * @clients: List of detected clients we created (for i2c-core use only)
+ * @flags: A bitmask of flags defined in &enum i2c_driver_flags
  *
  * The driver.owner field should be set to the module owner of this driver.
  * The driver.name field should be set to the name of this driver.
@@ -289,6 +301,8 @@ struct i2c_driver {
 	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
 	const unsigned short *address_list;
 	struct list_head clients;
+
+	unsigned int flags;
 };
 #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
 
-- 
2.20.1

