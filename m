Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF992711710
	for <lists+linux-media@lfdr.de>; Thu, 25 May 2023 21:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243265AbjEYTRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 May 2023 15:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243428AbjEYTRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 May 2023 15:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DEA4ECF
        for <linux-media@vger.kernel.org>; Thu, 25 May 2023 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685041635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9vyuS7z0c2GSFgKK6Ti9hLLBn+RlRoV4OuQIOiu+yZ4=;
        b=MnidXkQN8t/92heANAf5Vr+uH+S2FNWJocaxO8pczvBH3BzHJuKOKIkR/BDypoIvRoNGHR
        jCeltdtTM8s8Iqs63LugYlhO+mc9lJ9wtXmg8b+lh4t3b/Q2O5amFHeLDbAkudar9N16+H
        Jc+V8i3VmqmCHT+gZsJEr996yILntqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-YjELpL41M8md7KabuU9nyg-1; Thu, 25 May 2023 15:01:07 -0400
X-MC-Unique: YjELpL41M8md7KabuU9nyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 741A3858EEC;
        Thu, 25 May 2023 19:01:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 662C340C6CDD;
        Thu, 25 May 2023 19:01:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH v2 1/5] media: atomisp: Add support for v4l2-async sensor registration
Date:   Thu, 25 May 2023 21:00:56 +0200
Message-Id: <20230525190100.130010-2-hdegoede@redhat.com>
In-Reply-To: <20230525190100.130010-1-hdegoede@redhat.com>
References: <20230525190100.130010-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for using v4l2-async sensor registration.

This has been tested with both the gc0310 and the ov2680 sensor drivers.

Drivers must add the ACPI HIDs they match on to the supported_sensors[]
array in the same commit as that they are converted to
v4l2_async_register_subdev_sensor().

Sensor drivers also must check they have a fwnode graph endpoint and return
-EPROBE_DEFER from probe() if there is no endpoint yet. This guarantees
that the GPIO mappingss are in place before the driver tries to get GPIOs.

For now it also is still possible to use the old atomisp_gmin_platform
based sensor drivers. This is mainly intended for testing while moving
other sensor drivers over to runtime-pm + v4l2-async.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Make atomisp_csi2_bridge_init() also add the ACPI GPIO mappings
  for the found sensors
- Various code tweaks and use more helper functions for both the new
  (moved to this patch) atomisp_csi2_add_gpio_mappings() function
  as well as the rest of the code based on reviews by Andy
---
Note to reviewers the added atomisp_csi2_add_gpio_mappings() function
is mostly a copy of v4l2_get_acpi_sensor_info() from
atomisp_gmin_platform.c. That function cannot be used directly
though since it expects a "struct device *" argument rather then
a "struct acpi_device *" one and the physical device node may not
be instantiated yet.

This code duplication will be removed by removing
v4l2_get_acpi_sensor_info() once its 2 only callers have been
converted over to v4l2-async device probing.
---
 drivers/staging/media/atomisp/Makefile        |   1 +
 .../staging/media/atomisp/pci/atomisp_csi2.c  |   4 +
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  88 +-
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 801 ++++++++++++++++++
 .../media/atomisp/pci/atomisp_internal.h      |   2 +
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |  38 +-
 .../staging/media/atomisp/pci/atomisp_v4l2.h  |   1 +
 7 files changed, 913 insertions(+), 22 deletions(-)
 create mode 100644 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index 532e12ed72e6..38b370124109 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -16,6 +16,7 @@ atomisp-objs += \
 	pci/atomisp_cmd.o \
 	pci/atomisp_compat_css20.o \
 	pci/atomisp_csi2.o \
+	pci/atomisp_csi2_bridge.o \
 	pci/atomisp_drvfs.o \
 	pci/atomisp_fops.o \
 	pci/atomisp_ioctl.o \
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 0045c4d3a7f6..abf55a86f795 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -371,6 +371,10 @@ int atomisp_mipi_csi2_init(struct atomisp_device *isp)
 	unsigned int i;
 	int ret;
 
+	ret = atomisp_csi2_bridge_init(isp);
+	if (ret < 0)
+		return ret;
+
 	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
 		csi2_port = &isp->csi2_port[i];
 		csi2_port->isp = isp;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
index b245b2f5ce99..7dd07c70ff70 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
@@ -18,16 +18,100 @@
 #ifndef __ATOMISP_CSI2_H__
 #define __ATOMISP_CSI2_H__
 
+#include <linux/gpio/consumer.h>
+#include <linux/property.h>
+
 #include <media/v4l2-subdev.h>
 #include <media/v4l2-ctrls.h>
 
+#include "../../include/linux/atomisp.h"
+
 #define CSI2_PAD_SINK		0
 #define CSI2_PAD_SOURCE		1
 #define CSI2_PADS_NUM		2
 
+#define CSI2_MAX_LANES		4
+
+#define CSI2_MAX_ACPI_GPIOS	2u
+
+struct acpi_device;
 struct atomisp_device;
-struct v4l2_device;
 struct atomisp_sub_device;
+struct v4l2_device;
+
+struct atomisp_csi2_acpi_gpio_map {
+	struct acpi_gpio_params params[CSI2_MAX_ACPI_GPIOS];
+	struct acpi_gpio_mapping mapping[CSI2_MAX_ACPI_GPIOS + 1];
+};
+
+struct atomisp_csi2_acpi_gpio_parsing_data {
+	struct acpi_device *adev;
+	struct atomisp_csi2_acpi_gpio_map *map;
+	u32 settings[CSI2_MAX_ACPI_GPIOS];
+	unsigned int settings_count;
+	unsigned int res_count;
+	unsigned int map_count;
+};
+
+enum atomisp_csi2_sensor_swnodes {
+	SWNODE_SENSOR,
+	SWNODE_SENSOR_PORT,
+	SWNODE_SENSOR_ENDPOINT,
+	SWNODE_CSI2_PORT,
+	SWNODE_CSI2_ENDPOINT,
+	SWNODE_COUNT
+};
+
+struct atomisp_csi2_property_names {
+	char rotation[9];
+	char bus_type[9];
+	char data_lanes[11];
+	char remote_endpoint[16];
+};
+
+struct atomisp_csi2_node_names {
+	char port[7];
+	char endpoint[11];
+	char remote_port[7];
+};
+
+struct atomisp_csi2_sensor_config {
+	const char *hid;
+	int lanes;
+};
+
+struct atomisp_csi2_sensor {
+	/* Append port in "-%u" format as suffix of HID */
+	char name[ACPI_ID_LEN + 4];
+	struct acpi_device *adev;
+	int port;
+	int lanes;
+
+	/* SWNODE_COUNT + 1 for terminating NULL */
+	const struct software_node *group[SWNODE_COUNT + 1];
+	struct software_node swnodes[SWNODE_COUNT];
+	struct atomisp_csi2_node_names node_names;
+	struct atomisp_csi2_property_names prop_names;
+	/* "rotation" + terminating entry */
+	struct property_entry dev_properties[2];
+	/* "bus-type", "data-lanes", "remote-endpoint" + terminating entry */
+	struct property_entry ep_properties[4];
+	/* "data-lanes", "remote-endpoint" + terminating entry */
+	struct property_entry csi2_properties[3];
+	struct software_node_ref_args local_ref[1];
+	struct software_node_ref_args remote_ref[1];
+	struct software_node_ref_args vcm_ref[1];
+	/* GPIO mappings storage */
+	struct atomisp_csi2_acpi_gpio_map gpio_map;
+};
+
+struct atomisp_csi2_bridge {
+	char csi2_node_name[14];
+	struct software_node csi2_node;
+	u32 data_lanes[CSI2_MAX_LANES];
+	unsigned int n_sensors;
+	struct atomisp_csi2_sensor sensors[ATOMISP_CAMERA_NR_PORTS];
+};
 
 struct atomisp_mipi_csi2_device {
 	struct v4l2_subdev subdev;
@@ -48,6 +132,8 @@ void atomisp_mipi_csi2_unregister_entities(
     struct atomisp_mipi_csi2_device *csi2);
 int atomisp_mipi_csi2_register_entities(struct atomisp_mipi_csi2_device *csi2,
 					struct v4l2_device *vdev);
+int atomisp_csi2_bridge_init(struct atomisp_device *isp);
+int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp);
 
 void atomisp_csi2_configure(struct atomisp_sub_device *asd);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
new file mode 100644
index 000000000000..c80754755d9e
--- /dev/null
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -0,0 +1,801 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Code to build software firmware node graph for atomisp2 connected sensors
+ * from ACPI tables.
+ *
+ * Copyright (C) 2023 Hans de Goede <hdegoede@redhat.com>
+ *
+ * Based on drivers/media/pci/intel/ipu3/cio2-bridge.c written by:
+ * Dan Scally <djrscally@gmail.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/property.h>
+#include <media/v4l2-fwnode.h>
+
+#include "atomisp_cmd.h"
+#include "atomisp_csi2.h"
+#include "atomisp_internal.h"
+
+#define NODE_SENSOR(_HID, _PROPS)		\
+	((const struct software_node) {		\
+		.name = _HID,			\
+		.properties = _PROPS,		\
+	})
+
+#define NODE_PORT(_PORT, _SENSOR_NODE)		\
+	((const struct software_node) {		\
+		.name = _PORT,			\
+		.parent = _SENSOR_NODE,		\
+	})
+
+#define NODE_ENDPOINT(_EP, _PORT, _PROPS)	\
+	((const struct software_node) {		\
+		.name = _EP,			\
+		.parent = _PORT,		\
+		.properties = _PROPS,		\
+	})
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
+#define INTEL_GPIO_DSM_TYPE_SHIFT			0
+#define INTEL_GPIO_DSM_TYPE_MASK			GENMASK(7, 0)
+#define INTEL_GPIO_DSM_PIN_SHIFT			8
+#define INTEL_GPIO_DSM_PIN_MASK				GENMASK(15, 8)
+#define INTEL_GPIO_DSM_SENSOR_ON_VAL_SHIFT		24
+#define INTEL_GPIO_DSM_SENSOR_ON_VAL_MASK		GENMASK(31, 24)
+
+#define INTEL_GPIO_DSM_TYPE(x) \
+	(((x) & INTEL_GPIO_DSM_TYPE_MASK) >> INTEL_GPIO_DSM_TYPE_SHIFT)
+#define INTEL_GPIO_DSM_PIN(x) \
+	(((x) & INTEL_GPIO_DSM_PIN_MASK) >> INTEL_GPIO_DSM_PIN_SHIFT)
+#define INTEL_GPIO_DSM_SENSOR_ON_VAL(x) \
+	(((x) & INTEL_GPIO_DSM_SENSOR_ON_VAL_MASK) >> INTEL_GPIO_DSM_SENSOR_ON_VAL_SHIFT)
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
+/*
+ * dc2f6c4f-045b-4f1d-97b9-882a6860a4be
+ * This _DSM GUID returns a package with n*2 strings, with each set of 2 strings
+ * forming a key, value pair for settings like e.g. "CsiLanes" = "1".
+ */
+static const guid_t atomisp_dsm_guid =
+	GUID_INIT(0xdc2f6c4f, 0x045b, 0x4f1d,
+		  0x97, 0xb9, 0x88, 0x2a, 0x68, 0x60, 0xa4, 0xbe);
+
+/*
+ * Extend this array with ACPI Hardware IDs of sensors known to be working
+ * plus the number of links expected by their drivers.
+ *
+ * Do not add an entry for a sensor that is not actually supported,
+ * or which have not yet been converted to work without atomisp_gmin
+ * power-management and with v4l2-async probing.
+ */
+static const struct atomisp_csi2_sensor_config supported_sensors[] = {
+};
+
+/*
+ * gmin_cfg parsing code. This is a cleaned up version of the gmin_cfg parsing
+ * code from atomisp_gmin_platform.c.
+ * Once all sensors are moved to v4l2-async probing atomisp_gmin_platform.c can
+ * be removed and the duplication of this code goes away.
+ */
+struct gmin_cfg_var {
+	const char *acpi_dev_name;
+	const char *key;
+	const char *val;
+};
+
+static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
+	/* _DSM contains the wrong CsiPort! */
+	{ "OVTI2680:01", "CsiPort", "0" },
+	{}
+};
+
+static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Ideapad Miix 310 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 310-10"),
+		},
+		.driver_data = lenovo_ideapad_miix_310_vars,
+	},
+	{}
+};
+
+static char *gmin_cfg_get_dsm(struct acpi_device *adev, const char *key)
+{
+	union acpi_object *obj, *key_el, *val_el;
+	char *val = NULL;
+	int i;
+
+	obj = acpi_evaluate_dsm_typed(adev->handle, &atomisp_dsm_guid, 0, 0,
+				      NULL, ACPI_TYPE_PACKAGE);
+	if (!obj)
+		return NULL;
+
+	for (i = 0; i < obj->package.count - 1; i += 2) {
+		key_el = &obj->package.elements[i + 0];
+		val_el = &obj->package.elements[i + 1];
+
+		if (key_el->type != ACPI_TYPE_STRING || val_el->type != ACPI_TYPE_STRING)
+			break;
+
+		if (!strcmp(key_el->string.pointer, key)) {
+			val = kstrdup(val_el->string.pointer, GFP_KERNEL);
+			dev_info(&adev->dev, "Using DSM entry %s=%s\n", key, val);
+			break;
+		}
+	}
+
+	ACPI_FREE(obj);
+	return val;
+}
+
+static char *gmin_cfg_get_dmi_override(struct acpi_device *adev, const char *key)
+{
+	const struct dmi_system_id *id;
+	struct gmin_cfg_var *gv;
+
+	id = dmi_first_match(gmin_cfg_dmi_overrides);
+	if (!id)
+		return NULL;
+
+	for (gv = id->driver_data; gv->acpi_dev_name; gv++) {
+		if (strcmp(gv->acpi_dev_name, acpi_dev_name(adev)))
+			continue;
+
+		if (strcmp(key, gv->key))
+			continue;
+
+		dev_info(&adev->dev, "Using DMI entry %s=%s\n", key, gv->val);
+		return kstrdup(gv->val, GFP_KERNEL);
+	}
+
+	return NULL;
+}
+
+static char *gmin_cfg_get(struct acpi_device *adev, const char *key)
+{
+	char *val;
+
+	val = gmin_cfg_get_dmi_override(adev, key);
+	if (val)
+		return val;
+
+	return gmin_cfg_get_dsm(adev, key);
+}
+
+static int gmin_cfg_get_int(struct acpi_device *adev, const char *key, int default_val)
+{
+	char *str_val;
+	long int_val;
+	int ret;
+
+	str_val = gmin_cfg_get(adev, key);
+	if (!str_val)
+		goto out_use_default;
+
+	ret = kstrtoul(str_val, 0, &int_val);
+	kfree(str_val);
+	if (ret)
+		goto out_use_default;
+
+	return int_val;
+
+out_use_default:
+	dev_info(&adev->dev, "Using default %s=%d\n", key, default_val);
+	return default_val;
+}
+
+static int atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(struct acpi_device *adev)
+{
+	/* ACPI_PATH_SEGMENT_LENGTH is guaranteed to be big enough for name + 0 term. */
+	char name[ACPI_PATH_SEGMENT_LENGTH];
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer b_name = { sizeof(name), name };
+	union acpi_object *package, *element;
+	int i, ret = -ENOENT;
+	acpi_handle rhandle;
+	acpi_status status;
+	u8 clock_num;
+
+	status = acpi_evaluate_object_typed(adev->handle, "_PR0", NULL, &buffer, ACPI_TYPE_PACKAGE);
+	if (!ACPI_SUCCESS(status))
+		return -ENOENT;
+
+	package = buffer.pointer;
+	for (i = 0; i < package->package.count; i++) {
+		element = &package->package.elements[i];
+
+		if (element->type != ACPI_TYPE_LOCAL_REFERENCE)
+			continue;
+
+		rhandle = element->reference.handle;
+		if (!rhandle)
+			continue;
+
+		acpi_get_name(rhandle, ACPI_SINGLE_NAME, &b_name);
+
+		if (str_has_prefix(name, "CLK") && !kstrtou8(&name[3], 10, &clock_num) &&
+		    clock_num <= 4) {
+			ret = clock_num;
+			break;
+		}
+	}
+
+	ACPI_FREE(buffer.pointer);
+	return ret;
+}
+
+static int atomisp_csi2_get_port(struct acpi_device *adev)
+{
+	int clock_num, port;
+
+	/*
+	 * Get pmc-clock number from ACPI _PR0 method and compare this to
+	 * the CsiPort 1 pmc-clock used in the CHT/BYT reference designs.
+	 */
+	clock_num = atomisp_csi2_get_pmc_clk_nr_from_acpi_pr0(adev);
+	if (IS_ISP2401)
+		port = clock_num == 4 ? 1 : 0;
+	else
+		port = clock_num == 0 ? 1 : 0;
+
+	/* Intel DSM or DMI quirk overrides PR0 derived default */
+	return gmin_cfg_get_int(adev, "CsiPort", port);
+}
+
+/* Note this always returns 1 to continue looping so that res_count is accurate */
+static int atomisp_csi2_handle_acpi_gpio_res(struct acpi_resource *ares, void *_data)
+{
+	struct atomisp_csi2_acpi_gpio_parsing_data *data = _data;
+	struct acpi_resource_gpio *agpio;
+	const char *name;
+	bool active_low;
+	unsigned int i;
+	u32 settings = 0;
+	u16 pin;
+
+	if (!acpi_gpio_get_io_resource(ares, &agpio))
+		return 1; /* Not a GPIO, continue the loop */
+
+	data->res_count++;
+
+	pin = agpio->pin_table[0];
+	for (i = 0; i < data->settings_count; i++) {
+		if (INTEL_GPIO_DSM_PIN(data->settings[i]) == pin) {
+			settings = data->settings[i];
+			break;
+		}
+	}
+
+	if (i == data->settings_count) {
+		dev_warn(&data->adev->dev, "Could not find DSM GPIO settings for pin %u\n", pin);
+		return 1;
+	}
+
+	switch (INTEL_GPIO_DSM_TYPE(settings)) {
+	case 0:
+		name = "reset-gpios";
+		break;
+	case 1:
+		name = "powerdown-gpios";
+		break;
+	default:
+		dev_warn(&data->adev->dev, "Unknown GPIO type 0x%02lx for pin %u\n",
+			 INTEL_GPIO_DSM_TYPE(settings), pin);
+		return 1;
+	}
+
+	/*
+	 * Both reset and power-down need to be logical false when the sensor
+	 * is on (sensor should not be in reset and not be powered-down). So
+	 * when the sensor-on-value (which is the physical pin value) is high,
+	 * then the signal is active-low.
+	 */
+	active_low = INTEL_GPIO_DSM_SENSOR_ON_VAL(settings);
+
+	i = data->map_count;
+	if (i == CSI2_MAX_ACPI_GPIOS)
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
+	dev_info(&data->adev->dev, "%s crs %d %s pin %u active-%s\n", name,
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
+ * hardware which has a separate INT3472 acpi_device with this info.
+ *
+ * This function must be called before creating the sw-noded describing
+ * the fwnode graph endpoint. And sensor drivers used on these devices
+ * must return -EPROBE_DEFER when there is no endpoint description yet.
+ * Together this guarantees that the GPIO lookups are in place before
+ * the sensor driver tries to get GPIOs with gpiod_get().
+ *
+ * Note this code uses the same DSM GUID as the int3472_gpio_guid in
+ * the INT3472 discrete.c code and there is some overlap, but there are
+ * enough differences that it is difficult to share the code.
+ */
+static int atomisp_csi2_add_gpio_mappings(struct atomisp_csi2_sensor *sensor,
+					  struct acpi_device *adev)
+{
+	struct atomisp_csi2_acpi_gpio_parsing_data data = { };
+	LIST_HEAD(resource_list);
+	union acpi_object *obj;
+	unsigned int i, j;
+	int ret;
+
+	obj = acpi_evaluate_dsm_typed(adev->handle, &intel_sensor_module_guid,
+				      0x00, 0x01, NULL, ACPI_TYPE_STRING);
+	if (obj) {
+		dev_info(&adev->dev, "Sensor module id: '%s'\n", obj->string.pointer);
+		ACPI_FREE(obj);
+	}
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
+		return dev_err_probe(&adev->dev, -EIO, "No _DSM entry for GPIO pin count\n");
+
+	data.settings_count = obj->integer.value;
+	ACPI_FREE(obj);
+
+	if (data.settings_count > CSI2_MAX_ACPI_GPIOS)
+		return dev_err_probe(&adev->dev, -EIO, "Too many GPIOs %u > %u\n",
+				     data.settings_count, CSI2_MAX_ACPI_GPIOS);
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
+			return dev_err_probe(&adev->dev, -EIO, "No _DSM entry for pin %u\n", i);
+
+		data.settings[i] = obj->integer.value;
+		ACPI_FREE(obj);
+	}
+
+	/* Since we match up by pin-number the pin-numbers must be unique */
+	for (i = 0; i < data.settings_count; i++) {
+		for (j = i + 1; j < data.settings_count; j++) {
+			if (INTEL_GPIO_DSM_PIN(data.settings[i]) !=
+			    INTEL_GPIO_DSM_PIN(data.settings[j]))
+				continue;
+
+			return dev_err_probe(&adev->dev, -EIO, "Duplicate pin number %lu\n",
+					     INTEL_GPIO_DSM_PIN(data.settings[i]));
+		}
+	}
+
+	/* Now parse the ACPI resources and build the lookup table */
+	data.adev = adev;
+	data.map = &sensor->gpio_map;
+	ret = acpi_dev_get_resources(adev, &resource_list,
+				     atomisp_csi2_handle_acpi_gpio_res, &data);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&resource_list);
+
+	if (data.map_count != data.settings_count ||
+	    data.res_count != data.settings_count)
+		dev_warn(&adev->dev, "ACPI GPIO resources vs DSM GPIO-info count mismatch (dsm: %d res: %d map %d\n",
+			 data.settings_count, data.res_count,
+			 data.map_count);
+
+	ret = acpi_dev_add_driver_gpios(adev, data.map->mapping);
+	if (ret)
+		return dev_err_probe(&adev->dev, ret, "adding driver GPIOs\n");
+
+	return 0;
+}
+
+static const struct atomisp_csi2_property_names prop_names = {
+	.rotation = "rotation",
+	.bus_type = "bus-type",
+	.data_lanes = "data-lanes",
+	.remote_endpoint = "remote-endpoint",
+};
+
+static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_sensor *sensor,
+						  struct atomisp_csi2_bridge *bridge,
+						  const struct atomisp_csi2_sensor_config *cfg)
+{
+	sensor->prop_names = prop_names;
+
+	sensor->local_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_CSI2_ENDPOINT]);
+	sensor->remote_ref[0] = SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_SENSOR_ENDPOINT]);
+
+	sensor->dev_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.rotation, 0);
+
+	sensor->ep_properties[0] = PROPERTY_ENTRY_U32(sensor->prop_names.bus_type,
+						      V4L2_FWNODE_BUS_TYPE_CSI2_DPHY);
+	sensor->ep_properties[1] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
+								bridge->data_lanes,
+								sensor->lanes);
+	sensor->ep_properties[2] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
+							    sensor->local_ref);
+
+	sensor->csi2_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(sensor->prop_names.data_lanes,
+								  bridge->data_lanes,
+								  sensor->lanes);
+	sensor->csi2_properties[1] = PROPERTY_ENTRY_REF_ARRAY(sensor->prop_names.remote_endpoint,
+							      sensor->remote_ref);
+}
+
+static void atomisp_csi2_init_swnode_names(struct atomisp_csi2_sensor *sensor)
+{
+	snprintf(sensor->node_names.remote_port,
+		 sizeof(sensor->node_names.remote_port),
+		 SWNODE_GRAPH_PORT_NAME_FMT, sensor->port);
+	snprintf(sensor->node_names.port,
+		 sizeof(sensor->node_names.port),
+		 SWNODE_GRAPH_PORT_NAME_FMT, 0); /* Always port 0 */
+	snprintf(sensor->node_names.endpoint,
+		 sizeof(sensor->node_names.endpoint),
+		 SWNODE_GRAPH_ENDPOINT_NAME_FMT, 0); /* And endpoint 0 */
+}
+
+static void atomisp_csi2_init_swnode_group(struct atomisp_csi2_sensor *sensor)
+{
+	struct software_node *nodes = sensor->swnodes;
+
+	sensor->group[SWNODE_SENSOR] = &nodes[SWNODE_SENSOR];
+	sensor->group[SWNODE_SENSOR_PORT] = &nodes[SWNODE_SENSOR_PORT];
+	sensor->group[SWNODE_SENSOR_ENDPOINT] = &nodes[SWNODE_SENSOR_ENDPOINT];
+	sensor->group[SWNODE_CSI2_PORT] = &nodes[SWNODE_CSI2_PORT];
+	sensor->group[SWNODE_CSI2_ENDPOINT] = &nodes[SWNODE_CSI2_ENDPOINT];
+}
+
+static void atomisp_csi2_create_connection_swnodes(struct atomisp_csi2_bridge *bridge,
+						   struct atomisp_csi2_sensor *sensor)
+{
+	struct software_node *nodes = sensor->swnodes;
+
+	atomisp_csi2_init_swnode_names(sensor);
+
+	nodes[SWNODE_SENSOR] = NODE_SENSOR(sensor->name,
+					   sensor->dev_properties);
+	nodes[SWNODE_SENSOR_PORT] = NODE_PORT(sensor->node_names.port,
+					      &nodes[SWNODE_SENSOR]);
+	nodes[SWNODE_SENSOR_ENDPOINT] = NODE_ENDPOINT(sensor->node_names.endpoint,
+						      &nodes[SWNODE_SENSOR_PORT],
+						      sensor->ep_properties);
+	nodes[SWNODE_CSI2_PORT] = NODE_PORT(sensor->node_names.remote_port,
+					    &bridge->csi2_node);
+	nodes[SWNODE_CSI2_ENDPOINT] = NODE_ENDPOINT(sensor->node_names.endpoint,
+						    &nodes[SWNODE_CSI2_PORT],
+						    sensor->csi2_properties);
+
+	atomisp_csi2_init_swnode_group(sensor);
+}
+
+static void atomisp_csi2_unregister_sensors(struct atomisp_csi2_bridge *bridge)
+{
+	struct atomisp_csi2_sensor *sensor;
+	unsigned int i;
+
+	for (i = 0; i < bridge->n_sensors; i++) {
+		sensor = &bridge->sensors[i];
+		software_node_unregister_node_group(sensor->group);
+		acpi_dev_remove_driver_gpios(sensor->adev);
+		acpi_dev_put(sensor->adev);
+	}
+}
+
+static int atomisp_csi2_connect_sensor(const struct atomisp_csi2_sensor_config *cfg,
+				       struct atomisp_csi2_bridge *bridge,
+				       struct atomisp_device *isp)
+{
+	struct fwnode_handle *fwnode, *primary;
+	struct atomisp_csi2_sensor *sensor;
+	struct acpi_device *adev;
+	int ret;
+
+	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
+		if (!adev->status.enabled)
+			continue;
+
+		if (bridge->n_sensors >= ATOMISP_CAMERA_NR_PORTS) {
+			dev_err(isp->dev, "Exceeded available CSI2 ports\n");
+			ret = -EINVAL;
+			goto err_put_adev;
+		}
+
+		sensor = &bridge->sensors[bridge->n_sensors];
+
+		sensor->port = atomisp_csi2_get_port(adev);
+		if (sensor->port >= ATOMISP_CAMERA_NR_PORTS) {
+			dev_err(&adev->dev, "Invalid port: %d\n", sensor->port);
+			ret = -EINVAL;
+			goto err_put_adev;
+		}
+
+		sensor->lanes = gmin_cfg_get_int(adev, "CsiLanes", cfg->lanes);
+		if (sensor->lanes > CSI2_MAX_LANES) {
+			dev_err(&adev->dev, "Invalid number of lanes: %d\n", sensor->lanes);
+			ret = -EINVAL;
+			goto err_put_adev;
+		}
+
+		ret = atomisp_csi2_add_gpio_mappings(sensor, adev);
+		if (ret)
+			goto err_put_adev;
+
+		snprintf(sensor->name, sizeof(sensor->name), "%s-%u",
+			 cfg->hid, sensor->port);
+
+		atomisp_csi2_create_fwnode_properties(sensor, bridge, cfg);
+		atomisp_csi2_create_connection_swnodes(bridge, sensor);
+
+		ret = software_node_register_node_group(sensor->group);
+		if (ret)
+			goto err_remove_mappings;
+
+		fwnode = software_node_fwnode(&sensor->swnodes[SWNODE_SENSOR]);
+		if (!fwnode) {
+			ret = -ENODEV;
+			goto err_free_swnodes;
+		}
+
+		sensor->adev = acpi_dev_get(adev);
+
+		primary = acpi_fwnode_handle(adev);
+		primary->secondary = fwnode;
+
+		bridge->n_sensors++;
+	}
+
+	return 0;
+
+err_free_swnodes:
+	software_node_unregister_node_group(sensor->group);
+err_remove_mappings:
+	acpi_dev_remove_driver_gpios(adev);
+err_put_adev:
+	acpi_dev_put(adev);
+	return ret;
+}
+
+static int atomisp_csi2_connect_sensors(struct atomisp_csi2_bridge *bridge,
+					struct atomisp_device *isp)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(supported_sensors); i++) {
+		const struct atomisp_csi2_sensor_config *cfg = &supported_sensors[i];
+
+		ret = atomisp_csi2_connect_sensor(cfg, bridge, isp);
+		if (ret)
+			goto err_unregister_sensors;
+	}
+
+	return 0;
+
+err_unregister_sensors:
+	atomisp_csi2_unregister_sensors(bridge);
+	return ret;
+}
+
+int atomisp_csi2_bridge_init(struct atomisp_device *isp)
+{
+	struct atomisp_csi2_bridge *bridge;
+	struct device *dev = isp->dev;
+	struct fwnode_handle *fwnode;
+	int i, ret;
+
+	/*
+	 * This function is intended to run only once and then leave
+	 * the created nodes attached even after a rmmod, therefor:
+	 * 1. The bridge memory is leaked deliberately on success
+	 * 2. If a secondary fwnode is already set exit early.
+	 */
+	fwnode = dev_fwnode(dev);
+	if (fwnode && fwnode->secondary)
+		return 0;
+
+	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
+	if (!bridge)
+		return -ENOMEM;
+
+	strscpy(bridge->csi2_node_name, "atomisp-csi2", sizeof(bridge->csi2_node_name));
+	bridge->csi2_node.name = bridge->csi2_node_name;
+
+	ret = software_node_register(&bridge->csi2_node);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register the CSI2 HID node\n");
+		goto err_free_bridge;
+	}
+
+	/*
+	 * Map the lane arrangement, which is fixed for the ISP2 (meaning we
+	 * only need one, rather than one per sensor). We include it as a
+	 * member of the bridge struct rather than a global variable so
+	 * that it survives if the module is unloaded along with the rest of
+	 * the struct.
+	 */
+	for (i = 0; i < CSI2_MAX_LANES; i++)
+		bridge->data_lanes[i] = i + 1;
+
+	ret = atomisp_csi2_connect_sensors(bridge, isp);
+	if (ret || bridge->n_sensors == 0)
+		goto err_unregister_csi2;
+
+	fwnode = software_node_fwnode(&bridge->csi2_node);
+	if (!fwnode) {
+		dev_err(dev, "Error getting fwnode from csi2 software_node\n");
+		ret = -ENODEV;
+		goto err_unregister_sensors;
+	}
+
+	set_secondary_fwnode(dev, fwnode);
+
+	return 0;
+
+err_unregister_sensors:
+	atomisp_csi2_unregister_sensors(bridge);
+err_unregister_csi2:
+	software_node_unregister(&bridge->csi2_node);
+err_free_bridge:
+	kfree(bridge);
+
+	return ret;
+}
+
+/******* V4L2 sub-device asynchronous registration callbacks***********/
+
+struct sensor_async_subdev {
+	struct v4l2_async_subdev asd;
+	int port;
+};
+
+#define to_sensor_asd(a)	container_of(a, struct sensor_async_subdev, asd)
+#define notifier_to_atomisp(n)	container_of(n, struct atomisp_device, notifier)
+
+/* .bound() notifier callback when a match is found */
+static int atomisp_notifier_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct atomisp_device *isp = notifier_to_atomisp(notifier);
+	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
+
+	if (s_asd->port >= ATOMISP_CAMERA_NR_PORTS) {
+		dev_err(isp->dev, "port %d not supported\n", s_asd->port);
+		return -EINVAL;
+	}
+
+	if (isp->sensor_subdevs[s_asd->port]) {
+		dev_err(isp->dev, "port %d already has a sensor attached\n", s_asd->port);
+		return -EBUSY;
+	}
+
+	isp->sensor_subdevs[s_asd->port] = sd;
+	return 0;
+}
+
+/* The .unbind callback */
+static void atomisp_notifier_unbind(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *sd,
+				    struct v4l2_async_subdev *asd)
+{
+	struct atomisp_device *isp = notifier_to_atomisp(notifier);
+	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
+
+	isp->sensor_subdevs[s_asd->port] = NULL;
+}
+
+/* .complete() is called after all subdevices have been located */
+static int atomisp_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct atomisp_device *isp = notifier_to_atomisp(notifier);
+
+	return atomisp_register_device_nodes(isp);
+}
+
+static const struct v4l2_async_notifier_operations atomisp_async_ops = {
+	.bound = atomisp_notifier_bound,
+	.unbind = atomisp_notifier_unbind,
+	.complete = atomisp_notifier_complete,
+};
+
+int atomisp_csi2_bridge_parse_firmware(struct atomisp_device *isp)
+{
+	int i, mipi_port, ret;
+
+	v4l2_async_nf_init(&isp->notifier);
+	isp->notifier.ops = &atomisp_async_ops;
+
+	for (i = 0; i < ATOMISP_CAMERA_NR_PORTS; i++) {
+		struct v4l2_fwnode_endpoint vep = {
+			.bus_type = V4L2_MBUS_CSI2_DPHY,
+		};
+		struct sensor_async_subdev *s_asd;
+		struct fwnode_handle *ep;
+
+		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(isp->dev), i, 0,
+						     FWNODE_GRAPH_ENDPOINT_NEXT);
+		if (!ep)
+			continue;
+
+		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		if (ret)
+			goto err_parse;
+
+		if (vep.base.port >= ATOMISP_CAMERA_NR_PORTS) {
+			dev_err(isp->dev, "port %d not supported\n", vep.base.port);
+			ret = -EINVAL;
+			goto err_parse;
+		}
+
+		mipi_port = atomisp_port_to_mipi_port(isp, vep.base.port);
+		isp->sensor_lanes[mipi_port] = vep.bus.mipi_csi2.num_data_lanes;
+
+		s_asd = v4l2_async_nf_add_fwnode_remote(&isp->notifier, ep,
+							struct sensor_async_subdev);
+		if (IS_ERR(s_asd)) {
+			ret = PTR_ERR(s_asd);
+			goto err_parse;
+		}
+
+		s_asd->port = vep.base.port;
+
+		fwnode_handle_put(ep);
+		continue;
+
+err_parse:
+		fwnode_handle_put(ep);
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 514c360d4d03..e59c0f1e7f53 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -27,6 +27,7 @@
 #include <linux/idr.h>
 
 #include <media/media-device.h>
+#include <media/v4l2-async.h>
 #include <media/v4l2-subdev.h>
 
 /* ISP2400*/
@@ -173,6 +174,7 @@ struct atomisp_device {
 	struct v4l2_device v4l2_dev;
 	struct media_device media_dev;
 	struct atomisp_sub_device asd;
+	struct v4l2_async_notifier notifier;
 	struct atomisp_platform_data *pdata;
 	void *mmu_l1_base;
 	void __iomem *base;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c95349d315cf..a2ce9bbf10df 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -27,6 +27,7 @@
 #include <linux/dmi.h>
 #include <linux/interrupt.h>
 #include <linux/bits.h>
+#include <media/v4l2-fwnode.h>
 
 #include <asm/iosf_mbi.h>
 
@@ -782,7 +783,11 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 {
 	const struct atomisp_platform_data *pdata;
 	struct intel_v4l2_subdev_table *subdevs;
-	int ret, mipi_port, count;
+	int ret, mipi_port;
+
+	ret = atomisp_csi2_bridge_parse_firmware(isp);
+	if (ret)
+		return ret;
 
 	pdata = atomisp_get_platform_data();
 	if (!pdata) {
@@ -790,23 +795,12 @@ static int atomisp_subdev_probe(struct atomisp_device *isp)
 		return 0;
 	}
 
-	/* FIXME: should return -EPROBE_DEFER if not all subdevs were probed */
-	for (count = 0; count < SUBDEV_WAIT_TIMEOUT_MAX_COUNT; count++) {
-		int camera_count = 0;
-
-		for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
-			if (subdevs->type == RAW_CAMERA)
-				camera_count++;
-		}
-		if (camera_count)
-			break;
-		msleep(SUBDEV_WAIT_TIMEOUT);
-	}
-	/* Wait more time to give more time for subdev init code to finish */
-	msleep(5 * SUBDEV_WAIT_TIMEOUT);
-
-	/* FIXME: should, instead, use I2C probe */
-
+	/*
+	 * TODO: this is left here for now to allow testing atomisp-sensor
+	 * drivers which are still using the atomisp_gmin_platform infra before
+	 * converting them to standard v4l2 sensor drivers using runtime-pm +
+	 * ACPI for pm and v4l2_async_register_subdev_sensor() registration.
+	 */
 	for (subdevs = pdata->subdevs; subdevs->type; ++subdevs) {
 		ret = v4l2_device_register_subdev(&isp->v4l2_dev, subdevs->subdev);
 		if (ret)
@@ -937,7 +931,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 	return ret;
 }
 
-static int atomisp_register_device_nodes(struct atomisp_device *isp)
+int atomisp_register_device_nodes(struct atomisp_device *isp)
 {
 	struct atomisp_input_subdev *input;
 	int i, err;
@@ -1429,9 +1423,11 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	isp->firmware = NULL;
 	isp->css_env.isp_css_fw.data = NULL;
 
-	err = atomisp_register_device_nodes(isp);
-	if (err)
+	err = v4l2_async_nf_register(&isp->v4l2_dev, &isp->notifier);
+	if (err) {
+		dev_err(isp->dev, "failed to register async notifier : %d\n", err);
 		goto css_init_fail;
+	}
 
 	atomisp_drvfs_init(isp);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
index c8ee3ad83320..fad9573374b3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
@@ -30,5 +30,6 @@ int atomisp_video_init(struct atomisp_video_pipe *video);
 void atomisp_video_unregister(struct atomisp_video_pipe *video);
 const struct firmware *atomisp_load_firmware(struct atomisp_device *isp);
 int atomisp_csi_lane_config(struct atomisp_device *isp);
+int atomisp_register_device_nodes(struct atomisp_device *isp);
 
 #endif /* __ATOMISP_V4L2_H__ */
-- 
2.40.1

