Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9581D606A
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2020 12:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgEPKnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 May 2020 06:43:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:35390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgEPKnu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 May 2020 06:43:50 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 946AC206D4;
        Sat, 16 May 2020 10:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589625829;
        bh=ZuPQRc8EdGfDjowGC62qhL3j7dma0y3T+OtGCJNzHSk=;
        h=From:To:Cc:Subject:Date:From;
        b=S9SDKr744XBeMOhAEHjbZLktHMMDDzJZgrnPjbt0tqvuuIqY5cSsWK8lTU2twVh5K
         yKpyablmjxo+X5IL3eenCJ04vMcAzx5n72YBv4tpgPhHP4PhnQbgM/QFctCQpBNyRT
         EQK6chxDsOz1pZOa5G0i65RjzUzHwzHPwp0lesHA=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jZuIF-007efj-8O; Sat, 16 May 2020 12:43:47 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Subject: [PATCH] media: ipu3: add a module to probe sensors via ACPI
Date:   Sat, 16 May 2020 12:43:39 +0200
Message-Id: <12fbe3f5c6a16c5f3447adbc09fe27ceb2b16823.1589625807.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On devices without ACPI, or which ACPI is not prepared to
export sensor data via DT, we need a different probing
method.

This little driver adds initial support to probe the
sensors found on a Dell Latitude 7285.

For now, it just detects the hardware and use request_module()
to load a sensor driver.

In the specific case of this device, the ACPI DTST dable
describes 2 camera sensors for this module, but the
current upstream doesn't have yet drivers for such
sensors. So, this patch just detects the PMIC used on
this device and tries to load a sensor.

Once the sensor gets added, some additional code will
be needed to pass via platform_data other details, like
callbacks for PMIC's command to turn the sensor on/off
and other sensor-specific settings.

The idea of this patch was inspired on how the sensors
are probed by the staging atomisp driver.

The current result of this driver with the Dell
Latitude 7285 is:

	ipu3_acpi i2c-INT3477:00: ipu3_acpi_probe: ACPI detected it on bus ID=LNK1, HID=INT3477
	ipu3_acpi i2c-INT3477:00: Found DMI entry for 'Latitude 7285' with sensor INT3477
	ipu3_acpi i2c-INT3477:00: Loading sensor module ov8858
	ipu3_acpi i2c-OVTI9234:00: ipu3_acpi_probe: ACPI detected it on bus ID=LNK2, HID=OVTI9234
	ipu3_acpi i2c-OVTI9234:00: Found DMI entry for 'Latitude 7285' with sensor OVTI9234
	ipu3_acpi i2c-OVTI9234:00: Loading sensor module ov9234

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/ipu3/Kconfig     |  16 ++
 drivers/staging/media/ipu3/Makefile    |   1 +
 drivers/staging/media/ipu3/ipu3-acpi.c | 241 +++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/staging/media/ipu3/ipu3-acpi.c

diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
index 3e9640523e50..bede7910ea7b 100644
--- a/drivers/staging/media/ipu3/Kconfig
+++ b/drivers/staging/media/ipu3/Kconfig
@@ -14,3 +14,19 @@ config VIDEO_IPU3_IMGU
 
 	  Say Y or M here if you have a Skylake/Kaby Lake SoC with a MIPI
 	  camera. The module will be called ipu3-imgu.
+
+config VIDEO_IPU3_IMGU_ACPI
+	tristate "Probe sensors via ACPI"
+	depends on VIDEO_IPU3_IMGU
+	help
+	  The Intel ImgU device could be used on some Laptop-like
+	  hardware, like Dell Latitude 7285.
+
+	  On such devices, the sensors are defined via ACPI tables,
+	  and won't use Device Tree Open Firmware support.
+
+	  So, a different logic is needed in order to load the right
+	  camera sensors.
+
+	  Say Y or M here if you have a Laptop/Tablet device like
+	  Dell Latitude 7285.
diff --git a/drivers/staging/media/ipu3/Makefile b/drivers/staging/media/ipu3/Makefile
index 9def80ef28f3..3d0da2654376 100644
--- a/drivers/staging/media/ipu3/Makefile
+++ b/drivers/staging/media/ipu3/Makefile
@@ -10,3 +10,4 @@ ipu3-imgu-objs += \
 		ipu3-css.o ipu3-v4l2.o ipu3.o
 
 obj-$(CONFIG_VIDEO_IPU3_IMGU) += ipu3-imgu.o
+obj-$(CONFIG_VIDEO_IPU3_IMGU_ACPI) += ipu3-acpi.o
diff --git a/drivers/staging/media/ipu3/ipu3-acpi.c b/drivers/staging/media/ipu3/ipu3-acpi.c
new file mode 100644
index 000000000000..4653188ba4f3
--- /dev/null
+++ b/drivers/staging/media/ipu3/ipu3-acpi.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// ipu3_acpi - Detects IPU3 camera sensors via ACPI
+//
+// Copyright (c) 2020 Mauro Carvalho Chehab <mchehab_huawei@kernel.org>
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#define IMGU_PCI_ID                   0x1919
+
+#define PMIC_ACPI_TPS68470	"INT3472:06"
+
+#define CFG_VAR_NAME_MAX 64	/* Max name for a DMI (or EFI) var */
+
+
+/*
+ * Ancillary routines to work with PMIC
+ */
+
+static int ipu3_acpi_match_one(struct device *dev, const void *data)
+{
+	const char *name = data;
+	struct i2c_client *client;
+
+	if (dev->type != &i2c_client_type)
+		return 0;
+
+	client = to_i2c_client(dev);
+
+	return (!strcmp(name, client->name));
+}
+
+static struct i2c_client *ipu3_acpi_dev_exists(struct device *dev, char *name,
+					      struct i2c_client **client)
+{
+	struct device *d;
+
+	while ((d = bus_find_device(&i2c_bus_type, NULL, name,
+				    ipu3_acpi_match_one))) {
+		*client = to_i2c_client(d);
+		dev_dbg(dev, "found '%s' at address 0x%02x, adapter %d\n",
+			(*client)->name, (*client)->addr,
+			(*client)->adapter->nr);
+		return *client;
+	}
+
+	return NULL;
+}
+
+/*
+ * Get vars from ACPI DTST table
+ */
+
+static const struct dmi_system_id dmi_sensors_table[] = {
+	{
+		.ident = "Latitude 7285",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 7285"),
+		},
+		// .driver_data = dell_latitude_7285_quirks,
+	},
+	{ 0 }
+};
+
+/*
+ * Convert from ACPI name into Linux module name
+ */
+
+struct acpi_linux_modules {
+	const char *acpi_name;
+	const char *linux_module;
+};
+
+/* FIXME:
+ *
+ * for now, list only the devices on the models we know, and
+ * the obvious ones. We need to map later the other sensors
+ */
+struct acpi_linux_modules modules[] = {
+	{"INT3471",	"imx135"},
+	{"INT33BE",	NULL},
+	{"INT3476",	NULL},
+	{"INT3477",	"ov8858"},
+	{"INT3474",	"ov2740"},
+	{"INT3473",	NULL},
+	{"INT3475",	NULL},
+	{"INT3478",	NULL},
+	{"INT3479",	NULL},
+	{"INT347A",	NULL},
+	{"INT347B",	NULL},
+	{"OVTI9234",	"ov9234"},
+	{"OVTI9734",	"ov9734"},
+	{"OVTI8856",	"ov8856"},
+	{"OVTIF860",	NULL},
+	{ 0 }
+};
+
+/*
+ * Scan for sensor platform data information and modprobe it
+ */
+static int ipu3_acpi_probe_sensor(struct acpi_device *adev,
+				  struct i2c_client *client)
+{
+	const char *sensor_name, *module_name = NULL;
+	struct device *dev = &client->dev;
+	struct i2c_client *power = NULL;
+	const struct dmi_system_id *id;
+	int ret, i;
+
+	/* Currently, the only PMIC supported is tps68470 */
+	if (!ipu3_acpi_dev_exists(dev, PMIC_ACPI_TPS68470, &power)) {
+		dev_err(dev, "Doesn't know how to turn the sensor on/off\n");
+		return -ENODEV;
+	}
+
+	id = dmi_first_match(dmi_sensors_table);
+	if (!id) {
+		dev_err(dev, "Didn't find device's product ID\n");
+		return -ENODEV;
+	}
+
+	sensor_name = acpi_device_hid(adev);
+
+	dev_info(dev, "Found DMI entry for '%s' with sensor %s\n",
+		 id->ident, sensor_name);
+
+	for (i =0; i < ARRAY_SIZE(modules); i++) {
+		if (!strcmp(sensor_name, modules[i].acpi_name)) {
+			module_name = modules[i].linux_module;
+			break;
+		}
+	}
+
+	if (!module_name) {
+		dev_err(dev, "Sensor currently not supported\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * FIXME: we need to setup platform_data, using some hard-coded
+	 * logic and/or EFI and DTST table info, if available.
+	 * It should likely use power->addr somehow, as the sensor code
+	 * need to know how to power on/off the sensor.
+	 */
+	dev_info(dev, "Loading sensor module %s\n", module_name);
+	ret = request_module("%s", module_name);
+	if (ret < 0) {
+		dev_err(dev, "Couldn't load sensor module %s\n",
+			module_name);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Driver's probe/remove code
+ */
+
+static int ipu3_acpi_remove(struct i2c_client *client)
+{
+	return 0;
+}
+
+static int ipu3_acpi_probe(struct i2c_client *client)
+{
+	struct acpi_device *adev;
+	struct pci_dev *pdev;
+	acpi_handle handle;
+	int ret;
+
+	/*
+	 * As other drivers may try to bind the same ACPI sensor codes,
+	 * let's ignore them, if they don't have the IPU PCI device id.
+	 */
+	pdev = pci_get_device(PCI_VENDOR_ID_INTEL, IMGU_PCI_ID, NULL);
+	if (!pdev)
+		return -ENODEV;
+
+	handle = ACPI_HANDLE(&client->dev);
+	if (!handle || acpi_bus_get_device(handle, &adev)) {
+		dev_err(&client->dev, "Error could not get ACPI device\n");
+		return -ENODEV;
+	}
+	dev_info(&client->dev, "%s: ACPI detected it on bus ID=%s, HID=%s\n",
+		__func__, acpi_device_bid(adev), acpi_device_hid(adev));
+
+	ret = ipu3_acpi_probe_sensor(adev, client);
+
+// FIXME: do we need something to avoid memory leaks, like:
+//	acpi_dev_put(adev);
+	pci_dev_put(pdev);
+
+	return ret;
+}
+
+/*
+ * Should list known sensor devices found at DSDT table as "CAM0", "CAM1", ...
+ *
+ * The table below is probably incomplete. It came from the DSDT table found
+ * at a Dell Latitude 7285 (Method HCID).
+ */
+static const struct acpi_device_id ipu3_acpi_acpi_match[] = {
+	{"INT3471"},
+	{"INT33BE"},
+	{"INT3476"},
+	{"INT3477"},
+	{"INT3474"},
+	{"INT3473"},
+	{"INT3475"},
+	{"INT3478"},
+	{"INT3479"},
+	{"INT347A"},
+	{"INT347B"},
+	{"OVTI9234"},
+	{"OVTI9734"},
+	{"OVTI8856"},
+	{"OVTIF860"},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, ipu3_acpi_acpi_match);
+
+static struct i2c_driver ipu3_acpi_driver = {
+	.driver = {
+		.name = "ipu3_acpi",
+		.acpi_match_table = ipu3_acpi_acpi_match,
+	},
+	.probe_new = ipu3_acpi_probe,
+	.remove = ipu3_acpi_remove,
+};
+module_i2c_driver(ipu3_acpi_driver);
+
+MODULE_AUTHOR("Mauro Carvalho Chehab <mchehab_huawei@kernel.org>");
+MODULE_DESCRIPTION("Detects camera sensors used by IPU3 driver");
+MODULE_LICENSE("GPL");
-- 
2.26.2

