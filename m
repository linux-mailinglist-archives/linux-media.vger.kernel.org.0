Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EE77084EB
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbjERPdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjERPdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:33:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D6F11C
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684423943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c53M/OQaMcSPWxiL8Ldkr9BK3eBTGsC8l6ciGWDNCjs=;
        b=aGuP4cs8ESp8V6pnrbQ0sgqlEWA4o9jLlGDfew9gB7kNKffP9cHwhTZzK7hx2DkwdaAy0W
        Wk8qebGATDufzfl3/tcgavkDPaZJ8Gh3v9GQ7BRJlK93pKdcqmdRElbwAOornoAO5AuvpS
        jJfAwmGi2iiMKJrj+hiQSETi7D387V4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-wi-KWP0LM-GHcWu2CKTp6w-1; Thu, 18 May 2023 11:32:19 -0400
X-MC-Unique: wi-KWP0LM-GHcWu2CKTp6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8427C800047;
        Thu, 18 May 2023 15:32:18 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E0B794078908;
        Thu, 18 May 2023 15:32:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper function
Date:   Thu, 18 May 2023 17:32:06 +0200
Message-Id: <20230518153214.194976-2-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
References: <20230518153214.194976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On x86/ACPI platforms the GPIO resources do not provide information
about which GPIO resource maps to which connection-id. So e.g.
gpiod_get(devg, "reset") does not work.

On devices with an Intel IPU3 or newer ISP there is a special ACPI
INT3472 device describing the GPIOs and instantiating of the i2c_client
for a sensor is deferred until the INT3472 driver has been bound based
on the sensor ACPI device having a _DEP on the INT3472 ACPI device.

This allows the INT3472 driver to add the necessary GPIO lookups
without needing any special ACPI handling in the sensor driver.

Unfortunately this does not work on devices with an atomisp2 ISP,
there the _DSM describing the GPIOs is part of the sensor ACPI device
itself, rather then being part of a separate ACPI device.

IOW there is no separate firmware-node to which we can bind to register
the GPIO lookups (and also no way to defer creating the sensor i2c_client).

This unfortunately means that all sensor drivers which may be used on
BYT or CHT hw need some code to deal with ACPI integration.

This patch adds a new v4l2_acpi_parse_sensor_gpios() helper function
for this, which does all the necessary work. This minimizes the
(unavoidable) change to sensor drivers for ACPI integration to just
adding a single line calling this void function to probe().

There also is a no-op stub provided for non ACPI platforms so that
no #ifdef-s are necessary in the driver.

Note v4l2_acpi_parse_sensor_gpios() is basically a copy of
the atomisp2 v4l2_get_acpi_sensor_info() helper from:
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
minus logging the sensor module-name using a second _DSM.

v4l2_get_acpi_sensor_info() was already reviewed by Andy,
see the Link tag below.

(this code duplication is removed in the next patch in this series)

Link: https://patchwork.kernel.org/project/linux-media/patch/20230401145926.596216-2-hdegoede@redhat.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/driver-api/media/v4l2-acpi.rst |   5 +
 Documentation/driver-api/media/v4l2-core.rst |   1 +
 drivers/media/v4l2-core/Makefile             |   1 +
 drivers/media/v4l2-core/v4l2-acpi.c          | 227 +++++++++++++++++++
 include/media/v4l2-acpi.h                    |  37 +++
 5 files changed, 271 insertions(+)
 create mode 100644 Documentation/driver-api/media/v4l2-acpi.rst
 create mode 100644 drivers/media/v4l2-core/v4l2-acpi.c
 create mode 100644 include/media/v4l2-acpi.h

diff --git a/Documentation/driver-api/media/v4l2-acpi.rst b/Documentation/driver-api/media/v4l2-acpi.rst
new file mode 100644
index 000000000000..366e85187976
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-acpi.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 ACPI kAPI
+^^^^^^^^^^^^^^
+.. kernel-doc:: include/media/v4l2-acpi.h
diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index 1a8c4a5f256b..faef0e918ca3 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -26,3 +26,4 @@ Video4Linux devices
     v4l2-tuner
     v4l2-common
     v4l2-tveeprom
+    v4l2-acpi
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 41d91bd10cf2..3ad6c6ab5e74 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -15,6 +15,7 @@ videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
 
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
+videodev-$(CONFIG_ACPI) += v4l2-acpi.o
 videodev-$(CONFIG_COMPAT) += v4l2-compat-ioctl32.o
 videodev-$(CONFIG_MEDIA_CONTROLLER) += v4l2-mc.o
 videodev-$(CONFIG_SPI) += v4l2-spi.o
diff --git a/drivers/media/v4l2-core/v4l2-acpi.c b/drivers/media/v4l2-core/v4l2-acpi.c
new file mode 100644
index 000000000000..95278c619d82
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-acpi.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * V4L2 sensor driver ACPI helpers
+ *
+ * Copyright (C) 2023, Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/list.h>
+#include <linux/platform_data/x86/soc.h>
+#include <linux/uuid.h>
+
+/*
+ * 79234640-9e10-4fea-a5c1-b5aa8b19756f
+ * This _DSM GUID returns information about the GPIO lines mapped to a sensor.
+ * Function number 1 returns a count of the GPIO lines that are mapped.
+ * Subsequent functions return 32 bit ints encoding information about the GPIO.
+ */
+static const guid_t intel_sensor_gpio_info_guid =
+	GUID_INIT(0x79234640, 0x9e10, 0x4fea,
+		  0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
+
+#define INTEL_DSM_TYPE_SHIFT				0
+#define INTEL_DSM_TYPE_MASK				GENMASK(7, 0)
+#define INTEL_DSM_PIN_SHIFT				8
+#define INTEL_DSM_PIN_MASK				GENMASK(15, 8)
+#define INTEL_DSM_SENSOR_ON_VAL_SHIFT			24
+#define INTEL_DSM_SENSOR_ON_VAL_MASK			GENMASK(31, 24)
+
+#define INTEL_DSM_TYPE(x) \
+	(((x) & INTEL_DSM_TYPE_MASK) >> INTEL_DSM_TYPE_SHIFT)
+#define INTEL_DSM_PIN(x) \
+	(((x) & INTEL_DSM_PIN_MASK) >> INTEL_DSM_PIN_SHIFT)
+#define INTEL_DSM_SENSOR_ON_VAL(x) \
+	(((x) & INTEL_DSM_SENSOR_ON_VAL_MASK) >> INTEL_DSM_SENSOR_ON_VAL_SHIFT)
+
+#define V4L2_SENSOR_MAX_ACPI_GPIOS			2u
+
+struct v4l2_acpi_gpio_map {
+	struct acpi_gpio_params params[V4L2_SENSOR_MAX_ACPI_GPIOS];
+	struct acpi_gpio_mapping mapping[V4L2_SENSOR_MAX_ACPI_GPIOS + 1];
+};
+
+struct v4l2_acpi_gpio_parsing_data {
+	struct device *dev;
+	u32 settings[V4L2_SENSOR_MAX_ACPI_GPIOS];
+	unsigned int settings_count;
+	unsigned int res_count;
+	unsigned int map_count;
+	struct v4l2_acpi_gpio_map *map;
+};
+
+/* Note this always returns 1 to continue looping so that res_count is accurate */
+static int v4l2_acpi_handle_gpio_res(struct acpi_resource *ares, void *_data)
+{
+	struct v4l2_acpi_gpio_parsing_data *data = _data;
+	struct acpi_resource_gpio *agpio;
+	const char *name;
+	bool active_low;
+	unsigned int i;
+	u32 settings;
+	u8 pin;
+
+	if (!acpi_gpio_get_io_resource(ares, &agpio))
+		return 1; /* Not a GPIO, continue the loop */
+
+	data->res_count++;
+
+	pin = agpio->pin_table[0];
+	for (i = 0; i < data->settings_count; i++) {
+		if (INTEL_DSM_PIN(data->settings[i]) == pin) {
+			settings = data->settings[i];
+			break;
+		}
+	}
+
+	if (i == data->settings_count) {
+		dev_warn(data->dev, "Could not find DSM GPIO settings for pin %d\n", pin);
+		return 1;
+	}
+
+	switch (INTEL_DSM_TYPE(settings)) {
+	case 0:
+		name = "reset-gpios";
+		break;
+	case 1:
+		name = "powerdown-gpios";
+		break;
+	default:
+		dev_warn(data->dev, "Unknown GPIO type 0x%02lx for pin %d\n",
+			 INTEL_DSM_TYPE(settings), pin);
+		return 1;
+	}
+
+	/*
+	 * Both reset and power-down need to be logical false when the sensor
+	 * is on (sensor should not be in reset and not be powered-down). So
+	 * when the sensor-on-value (which is the physical pin value) is high,
+	 * then the signal is active-low.
+	 */
+	active_low = INTEL_DSM_SENSOR_ON_VAL(settings) ? true : false;
+
+	i = data->map_count;
+	if (i == V4L2_SENSOR_MAX_ACPI_GPIOS)
+		return 1;
+
+	/* res_count is already incremented */
+	data->map->params[i].crs_entry_index = data->res_count - 1;
+	data->map->params[i].active_low = active_low;
+	data->map->mapping[i].name = name;
+	data->map->mapping[i].data = &data->map->params[i];
+	data->map->mapping[i].size = 1;
+	data->map_count++;
+
+	dev_info(data->dev, "%s crs %d %s pin %d active-%s\n", name,
+		 data->res_count - 1, agpio->resource_source.string_ptr,
+		 pin, active_low ? "low" : "high");
+
+	return 1;
+}
+
+/*
+ * Helper function to create an ACPI GPIO lookup table for sensor reset and
+ * powerdown signals on Intel Bay Trail (BYT) and Cherry Trail (CHT) devices,
+ * including setting the correct polarity for the GPIO.
+ *
+ * This uses the "79234640-9e10-4fea-a5c1-b5aa8b19756f" DSM method directly
+ * on the sensor device's ACPI node. This is different from later Intel
+ * hardware which has a separate INT3472 with this info. Since there is
+ * no separate firmware-node to which we can bind to register the GPIO lookups
+ * this unfortunately means that all sensor drivers which may be used on
+ * BYT or CHT hw need to call this function.
+ *
+ * Note this code uses the same DSM GUID as the INT3472 discrete.c code
+ * and there is some overlap, but there are enough differences that it is
+ * difficult to share the code.
+ */
+void v4l2_acpi_parse_sensor_gpios(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	struct v4l2_acpi_gpio_parsing_data data = { };
+	LIST_HEAD(resource_list);
+	union acpi_object *obj;
+	unsigned int i, j;
+	int ret;
+
+	if (!adev || (!soc_intel_is_byt() && !soc_intel_is_cht()))
+		return;
+
+	/*
+	 * First get the GPIO-settings count and then get count GPIO-settings
+	 * values. Note the order of these may differ from the order in which
+	 * the GPIOs are listed on the ACPI resources! So we first store them all
+	 * and then enumerate the ACPI resources and match them up by pin number.
+	 */
+	obj = acpi_evaluate_dsm_typed(adev->handle,
+				      &intel_sensor_gpio_info_guid, 0x00, 1,
+				      NULL, ACPI_TYPE_INTEGER);
+	if (!obj) {
+		dev_warn(dev, "No _DSM entry for GPIO pin count\n");
+		return;
+	}
+
+	data.settings_count = obj->integer.value;
+	ACPI_FREE(obj);
+
+	if (data.settings_count > V4L2_SENSOR_MAX_ACPI_GPIOS) {
+		dev_err(dev, "_DSM returns too many GPIOs %u > %u\n",
+			data.settings_count, V4L2_SENSOR_MAX_ACPI_GPIOS);
+		return;
+	}
+
+	for (i = 0; i < data.settings_count; i++) {
+		/*
+		 * i + 2 because the index of this _DSM function is 1-based
+		 * and the first function is just a count.
+		 */
+		obj = acpi_evaluate_dsm_typed(adev->handle,
+					      &intel_sensor_gpio_info_guid,
+					      0x00, i + 2,
+					      NULL, ACPI_TYPE_INTEGER);
+		if (!obj) {
+			dev_err(dev, "No _DSM entry for GPIO pin %u\n", i);
+			return;
+		}
+
+		data.settings[i] = obj->integer.value;
+		ACPI_FREE(obj);
+	}
+
+	/* Since we match up by pin-number the pin-numbers must be unique */
+	for (i = 0; i < data.settings_count; i++) {
+		for (j = i + 1; j < data.settings_count; j++) {
+			if (INTEL_DSM_PIN(data.settings[i]) !=
+			    INTEL_DSM_PIN(data.settings[j]))
+				continue;
+
+			dev_err(dev, "Duplicate pin number %lu\n",
+				INTEL_DSM_PIN(data.settings[i]));
+			return;
+		}
+	}
+
+	/* Use devm_kzalloc() for the mappings + params to auto-free them */
+	data.map = devm_kzalloc(dev, sizeof(*data.map), GFP_KERNEL);
+	if (!data.map)
+		return;
+
+	/* Now parse the ACPI resources and build the lookup table */
+	data.dev = dev;
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     v4l2_acpi_handle_gpio_res, &data);
+	if (ret < 0)
+		return;
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	if (data.map_count != data.settings_count ||
+	    data.res_count != data.settings_count)
+		dev_warn(dev, "ACPI GPIO resources vs DSM GPIO-info count mismatch (dsm: %d res: %d map %d\n",
+			 data.settings_count, data.res_count, data.map_count);
+
+	devm_acpi_dev_add_driver_gpios(dev, data.map->mapping);
+}
+EXPORT_SYMBOL_GPL(v4l2_acpi_parse_sensor_gpios);
diff --git a/include/media/v4l2-acpi.h b/include/media/v4l2-acpi.h
new file mode 100644
index 000000000000..0729cbdd3749
--- /dev/null
+++ b/include/media/v4l2-acpi.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * V4L2 sensor driver ACPI helpers
+ *
+ * Copyright (C) 2023, Hans de Goede <hansg@kernel.org>
+ */
+
+#ifndef V4L2_ACPI_H
+#define V4L2_ACPI_H
+
+#ifdef CONFIG_ACPI
+
+struct device;
+
+/**
+ * v4l2_acpi_parse_sensor_gpios - Parse ACPI info describing sensor GPIOs.
+ *
+ * @dev: Device to parse the ACPI info for
+ *
+ * On x86/ACPI platforms the GPIO resources do not provide information
+ * about which resource maps to which connection-id.
+ *
+ * Sensor drivers can call this function to use platform specific methods
+ * (e.g. the Intel 79234640-9e10-4fea-a5c1-b5aa8b19756f _DSM) to get
+ * information about the pins and add GPIO mappings to make standard gpiod_get()
+ * calls work.
+ *
+ * The registered mappings use devm managed memory and are automatically free-ed
+ * on remove() and on probe() failure.
+ */
+void v4l2_acpi_parse_sensor_gpios(struct device *dev);
+
+#else /* ifdef CONFIG_ACPI */
+static inline void v4l2_acpi_parse_sensor_gpios(struct device *dev) { return 0; }
+#endif /* ifdef CONFIG_ACPI */
+
+#endif /* ifdef V4L2_ACPI_H */
-- 
2.40.1

