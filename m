Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5E226D31BA
	for <lists+linux-media@lfdr.de>; Sat,  1 Apr 2023 17:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjDAPAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Apr 2023 11:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjDAPAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Apr 2023 11:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD791DFA3
        for <linux-media@vger.kernel.org>; Sat,  1 Apr 2023 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680361184;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ne+rR4XLZ0KzDHP0VAOI0+r/B4rC6EPlijbl0n/7W10=;
        b=ht4vwW6VRm2UabQY1cVRlC72TJPIYWGCgltdHCC8xGuTABvUYv0BH1Ae8JbK/2oFh9VIZx
        NYn7aJUYt77bSMjG/98OuuKB/xcgRwGdpCsqX4sCB30K6pQb+TsnsqN8k/xjwVcsXLmM1e
        OK6rhysz85fOCMaluhShqXbCjU8ArfA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-8oX0FZ8ONfi_szHjHcg7aw-1; Sat, 01 Apr 2023 10:59:38 -0400
X-MC-Unique: 8oX0FZ8ONfi_szHjHcg7aw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5266C101A531;
        Sat,  1 Apr 2023 14:59:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C3FDB400F59;
        Sat,  1 Apr 2023 14:59:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 01/28] media: atomisp: Add v4l2_get_acpi_sensor_info() helper
Date:   Sat,  1 Apr 2023 16:58:59 +0200
Message-Id: <20230401145926.596216-2-hdegoede@redhat.com>
In-Reply-To: <20230401145926.596216-1-hdegoede@redhat.com>
References: <20230401145926.596216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ACPI nodes describing sensors on atomisp devices implement a
"79234640-9e10-4fea-a5c1-b5aa8b19756f" Device Specific Method (DSM)
to get info about the GPIOs.

Using this method is necessary to figure out which ACPI GPIO resource
is "reset" and which one is "powerdown" and this is also necessary to
figure out the correct polarity of the pins.

One example where this is necessary is the GC0310 sensor. The current
GC0310 code hardcodes reset as being active-low and power-down as being
active-high. This works on a number of devices such as the mpman
converter 9. But it is wrong for the Chuwi Vi8 CWI501 where the powerdown
pin is active-low.

Rather then adding DMI quirks for this, add a helper for this,
which can be shared between sensor-drivers. This new helper optionally
also returns a string identifying the exact sensor-module used, which
might be useful if any module specific behvior is necessary in the sensor
driver.

This uses the DSM directly on the sensor device's ACPI node. This is
different from later Intel hardware (IPU3 / IPU6) which has a separate
INT3472 node (with its own driver) with this info.

Since there is no separate ACPI node to which we can bind to register GPIO
lookups, this unfortunately means that all sensor drivers which may be used
on BYT or CHT hw need to call this new helper.

Note for now this function is being added to atomisp_gmin_platform.c,
but once things are ready to move atomisp over to using generic sensor
drivers this will need to become a generic v4l2 sensor helper. but this
will require upstream discussion first.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../atomisp/include/linux/atomisp_platform.h  |   2 +
 .../media/atomisp/pci/atomisp_gmin_platform.c | 240 ++++++++++++++++++
 2 files changed, 242 insertions(+)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
index b77bf814a5a6..e8e965f73fc8 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
@@ -213,6 +213,8 @@ int atomisp_register_sensor_no_gmin(struct v4l2_subdev *subdev, u32 lanes,
 				    enum atomisp_bayer_order bayer_order);
 void atomisp_unregister_subdev(struct v4l2_subdev *subdev);
 
+int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str);
+
 /* API from old platform_camera.h, new CPUID implementation */
 #define __IS_SOC(x) (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL && \
 		     boot_cpu_data.x86 == 6 &&                       \
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 7fc7dfa56172..f8d8a34d7e7f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1447,3 +1447,243 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x0f38, isp_pm_cap_fixup);
 
 MODULE_DESCRIPTION("Ancillary routines for binding ACPI devices");
 MODULE_LICENSE("GPL");
+
+/*
+ * The below helper functions don't really belong here and should eventually be
+ * moved to some place under sys/drivers/media/v4l2-core .
+ */
+#include <linux/platform_data/x86/soc.h>
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
+/*
+ * 822ace8f-2814-4174-a56b-5f029fe079ee
+ * This _DSM GUID returns a string from the sensor device, which acts as a
+ * module identifier.
+ */
+static const guid_t intel_sensor_module_guid =
+	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
+		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
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
+	 * is on (sensor should not be in reset and not be powered-down) so
+	 * when the sensor-on-value, which is the physical pin value is high,
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
+ * BYT or CHT hw need to call this function. This also means that this function
+ * may only fail when it is actually called on BYT/CHT hw. In all other cases
+ * it must always succeed.
+ *
+ * Note this code uses the same DSM GUID as the INT3472 discrete.c code
+ * and there is some overlap, but there are enough differences that it is
+ * difficult to share the code.
+ */
+int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	struct v4l2_acpi_gpio_parsing_data data = { };
+	LIST_HEAD(resource_list);
+	union acpi_object *obj;
+	unsigned int i, j;
+	int ret;
+
+	if (module_id_str)
+		*module_id_str = NULL;
+
+	if (!adev)
+		return 0;
+
+	obj = acpi_evaluate_dsm_typed(adev->handle, &intel_sensor_module_guid,
+				      0x00, 0x01, NULL, ACPI_TYPE_STRING);
+	if (obj) {
+		dev_info(dev, "Sensor module id: '%s'\n", obj->string.pointer);
+		if (module_id_str)
+			*module_id_str = kstrdup(obj->string.pointer, GFP_KERNEL);
+
+		ACPI_FREE(obj);
+	}
+
+	if (!soc_intel_is_byt() && !soc_intel_is_cht())
+		return 0;
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
+	if (!obj)
+		return dev_err_probe(dev, -EIO, "No _DSM entry for GPIO pin count\n");
+
+	data.settings_count = obj->integer.value;
+	ACPI_FREE(obj);
+
+	if (data.settings_count > V4L2_SENSOR_MAX_ACPI_GPIOS)
+		return dev_err_probe(dev, -EIO, "Too many GPIOs %u > %u\n",
+				     data.settings_count, V4L2_SENSOR_MAX_ACPI_GPIOS);
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
+		if (!obj)
+			return dev_err_probe(dev, -EIO, "No _DSM entry for GPIO pin %u\n", i);
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
+			return dev_err_probe(dev, -EIO, "Duplicate pin number %lu\n",
+					     INTEL_DSM_PIN(data.settings[i]));
+		}
+	}
+
+	/* Use devm_kzalloc() for the mappings + params to auto-free them */
+	data.map = devm_kzalloc(dev, sizeof(*data.map), GFP_KERNEL);
+	if (!data.map)
+		return -ENOMEM;
+
+	/* Now parse the ACPI resources and build the lookup table */
+	data.dev = dev;
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     v4l2_acpi_handle_gpio_res, &data);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	if (data.map_count != data.settings_count ||
+	    data.res_count != data.settings_count)
+		dev_warn(dev, "ACPI GPIO resources vs DSM GPIO-info count mismatch (dsm: %d res: %d map %d\n",
+			 data.settings_count, data.res_count, data.map_count);
+
+	return devm_acpi_dev_add_driver_gpios(dev, data.map->mapping);
+}
+EXPORT_SYMBOL_GPL(v4l2_get_acpi_sensor_info);
-- 
2.39.1

