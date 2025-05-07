Return-Path: <linux-media+bounces-32003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D034DAAE9DD
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 20:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 805B59C1978
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 18:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EB428BAA1;
	Wed,  7 May 2025 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iMt0zRVt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B2B28C845
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643696; cv=none; b=hQm0kLv82zyVxcQZ+4fknwsRq+NIzI8hbxna9+XatxnCvBKRrSALYEPfEv0m9q0q9OYZ6k8YmrPxYe3wjXOZOfid02S3V1RlBxgcD3GUEKKyHefd+N/50av2eXb7DxZBzQkA4CsbmBn2v9EEdmQo8n/cgxPwRWRL6EPeyA+IQII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643696; c=relaxed/simple;
	bh=zPkWzFqZq9YEb6MDVuHkMroPr6W/FxphSFoB97xcyFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0CD8A/62ydVNXzZDpHtdNvWJRsBkgUyN+C2gJqbWGpKbOoI3UERKuzh7Zhleh/gIm9+DadctUeXTjncB5qxdiVyj/oJC51DJ/iNc5wPWtVPYf9oUGqPKZwjHFKW6cG/ncmjtDixHz+jtgycHCWCJVVZOuPgshX4r6S38PgFZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iMt0zRVt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746643693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BWqyMOvqET+PCOEb5LP1RFvkrEgHjuk+uz03M9KUNuk=;
	b=iMt0zRVt2abgpveOccT4300Z57x5JdBopv6mcYZB0+H04G09GVol44ZWVNAEXvm6jCq3NC
	p3p3UkYgzjXbPofVeu1vkNp7swjjC9DQrHs3zlmMknI7zxR7On3cyLeUJI1H4/jBXVVNOT
	JQw3+wM5soXYzv+mrlisnpepzkvHsh4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-UhAG_dXeNP2dD1f3MRED1A-1; Wed,
 07 May 2025 14:48:10 -0400
X-MC-Unique: UhAG_dXeNP2dD1f3MRED1A-1
X-Mimecast-MFC-AGG-ID: UhAG_dXeNP2dD1f3MRED1A_1746643689
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4083F1956050;
	Wed,  7 May 2025 18:48:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A03F530001A1;
	Wed,  7 May 2025 18:48:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO mapping code
Date: Wed,  7 May 2025 20:47:37 +0200
Message-ID: <20250507184737.154747-7-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
References: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Replace the duplicate code for calling the special Intel camera sensor GPIO
type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
the sensor with a call to int3472_discrete_parse_crs() from the int3472
driver.

Besides avoiding code duplication the int3472 version of the code also
supports more features, like mapping the powerdown GPIO to a regulator on
the mt9m114 which is necessary to make the camera on the Asus T100TA work.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  17 --
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 239 ++----------------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   1 +
 3 files changed, 29 insertions(+), 228 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
index bb998c82a438..ec762f8fb922 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
@@ -19,28 +19,11 @@
 #define CSI2_PAD_SOURCE		1
 #define CSI2_PADS_NUM		2
 
-#define CSI2_MAX_ACPI_GPIOS	2u
-
-struct acpi_device;
 struct v4l2_device;
 
 struct atomisp_device;
 struct atomisp_sub_device;
 
-struct atomisp_csi2_acpi_gpio_map {
-	struct acpi_gpio_params params[CSI2_MAX_ACPI_GPIOS];
-	struct acpi_gpio_mapping mapping[CSI2_MAX_ACPI_GPIOS + 1];
-};
-
-struct atomisp_csi2_acpi_gpio_parsing_data {
-	struct acpi_device *adev;
-	struct atomisp_csi2_acpi_gpio_map *map;
-	u32 settings[CSI2_MAX_ACPI_GPIOS];
-	unsigned int settings_count;
-	unsigned int res_count;
-	unsigned int map_count;
-};
-
 struct atomisp_mipi_csi2_device {
 	struct v4l2_subdev subdev;
 	struct media_pad pads[CSI2_PADS_NUM];
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 92a9eef25a9f..7e783c28d39b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -13,6 +13,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/platform_data/x86/int3472.h>
 #include <linux/property.h>
 
 #include <media/ipu-bridge.h>
@@ -24,39 +25,6 @@
 
 #define PMC_CLK_RATE_19_2MHZ			19200000
 
-/*
- * 79234640-9e10-4fea-a5c1-b5aa8b19756f
- * This _DSM GUID returns information about the GPIO lines mapped to a sensor.
- * Function number 1 returns a count of the GPIO lines that are mapped.
- * Subsequent functions return 32 bit ints encoding information about the GPIO.
- */
-static const guid_t intel_sensor_gpio_info_guid =
-	GUID_INIT(0x79234640, 0x9e10, 0x4fea,
-		  0xa5, 0xc1, 0xb5, 0xaa, 0x8b, 0x19, 0x75, 0x6f);
-
-#define INTEL_GPIO_DSM_TYPE_SHIFT			0
-#define INTEL_GPIO_DSM_TYPE_MASK			GENMASK(7, 0)
-#define INTEL_GPIO_DSM_PIN_SHIFT			8
-#define INTEL_GPIO_DSM_PIN_MASK				GENMASK(15, 8)
-#define INTEL_GPIO_DSM_SENSOR_ON_VAL_SHIFT		24
-#define INTEL_GPIO_DSM_SENSOR_ON_VAL_MASK		GENMASK(31, 24)
-
-#define INTEL_GPIO_DSM_TYPE(x) \
-	(((x) & INTEL_GPIO_DSM_TYPE_MASK) >> INTEL_GPIO_DSM_TYPE_SHIFT)
-#define INTEL_GPIO_DSM_PIN(x) \
-	(((x) & INTEL_GPIO_DSM_PIN_MASK) >> INTEL_GPIO_DSM_PIN_SHIFT)
-#define INTEL_GPIO_DSM_SENSOR_ON_VAL(x) \
-	(((x) & INTEL_GPIO_DSM_SENSOR_ON_VAL_MASK) >> INTEL_GPIO_DSM_SENSOR_ON_VAL_SHIFT)
-
-/*
- * 822ace8f-2814-4174-a56b-5f029fe079ee
- * This _DSM GUID returns a string from the sensor device, which acts as a
- * module identifier.
- */
-static const guid_t intel_sensor_module_guid =
-	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
-		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
-
 /*
  * dc2f6c4f-045b-4f1d-97b9-882a6860a4be
  * This _DSM GUID returns a package with n*2 strings, with each set of 2 strings
@@ -323,195 +291,44 @@ static int atomisp_csi2_get_port(struct acpi_device *adev, int clock_num)
 	return gmin_cfg_get_int(adev, "CsiPort", port);
 }
 
-/* Note this always returns 1 to continue looping so that res_count is accurate */
-static int atomisp_csi2_handle_acpi_gpio_res(struct acpi_resource *ares, void *_data)
-{
-	struct atomisp_csi2_acpi_gpio_parsing_data *data = _data;
-	struct acpi_resource_gpio *agpio;
-	const char *name;
-	bool active_low;
-	unsigned int i;
-	u32 settings = 0;
-	u16 pin;
-
-	if (!acpi_gpio_get_io_resource(ares, &agpio))
-		return 1; /* Not a GPIO, continue the loop */
-
-	data->res_count++;
-
-	pin = agpio->pin_table[0];
-	for (i = 0; i < data->settings_count; i++) {
-		if (INTEL_GPIO_DSM_PIN(data->settings[i]) == pin) {
-			settings = data->settings[i];
-			break;
-		}
-	}
-
-	if (i == data->settings_count) {
-		acpi_handle_warn(data->adev->handle,
-				 "%s: Could not find DSM GPIO settings for pin %u\n",
-				 dev_name(&data->adev->dev), pin);
-		return 1;
-	}
-
-	switch (INTEL_GPIO_DSM_TYPE(settings)) {
-	case 0:
-		name = "reset-gpios";
-		break;
-	case 1:
-		name = "powerdown-gpios";
-		break;
-	default:
-		acpi_handle_warn(data->adev->handle, "%s: Unknown GPIO type 0x%02lx for pin %u\n",
-				 dev_name(&data->adev->dev),
-				 INTEL_GPIO_DSM_TYPE(settings), pin);
-		return 1;
-	}
-
-	/*
-	 * Both reset and power-down need to be logical false when the sensor
-	 * is on (sensor should not be in reset and not be powered-down). So
-	 * when the sensor-on-value (which is the physical pin value) is high,
-	 * then the signal is active-low.
-	 */
-	active_low = INTEL_GPIO_DSM_SENSOR_ON_VAL(settings);
-
-	i = data->map_count;
-	if (i == CSI2_MAX_ACPI_GPIOS)
-		return 1;
-
-	/* res_count is already incremented */
-	data->map->params[i].crs_entry_index = data->res_count - 1;
-	data->map->params[i].active_low = active_low;
-	data->map->mapping[i].name = name;
-	data->map->mapping[i].data = &data->map->params[i];
-	data->map->mapping[i].size = 1;
-	data->map_count++;
-
-	acpi_handle_info(data->adev->handle, "%s: %s crs %d %s pin %u active-%s\n",
-			 dev_name(&data->adev->dev), name,
-			 data->res_count - 1, agpio->resource_source.string_ptr,
-			 pin, active_low ? "low" : "high");
-
-	return 1;
-}
-
 /*
- * Helper function to create an ACPI GPIO lookup table for sensor reset and
- * powerdown signals on Intel Bay Trail (BYT) and Cherry Trail (CHT) devices,
- * including setting the correct polarity for the GPIO.
+ * Alloc and fill an int3472_discrete_device struct so that we can re-use
+ * the INT3472 sensor GPIO mapping code.
  *
- * This uses the "79234640-9e10-4fea-a5c1-b5aa8b19756f" DSM method directly
- * on the sensor device's ACPI node. This is different from later Intel
- * hardware which has a separate INT3472 acpi_device with this info.
- *
- * This function must be called before creating the sw-noded describing
- * the fwnode graph endpoint. And sensor drivers used on these devices
- * must return -EPROBE_DEFER when there is no endpoint description yet.
- * Together this guarantees that the GPIO lookups are in place before
- * the sensor driver tries to get GPIOs with gpiod_get().
- *
- * Note this code uses the same DSM GUID as the int3472_gpio_guid in
- * the INT3472 discrete.c code and there is some overlap, but there are
- * enough differences that it is difficult to share the code.
+ * This gets called from ipu_bridge_init() which runs only once per boot,
+ * the created faux int3472 device is leaked on purpose to keep the created
+ * GPIO mappings around permanently.
  */
 static int atomisp_csi2_add_gpio_mappings(struct acpi_device *adev)
 {
-	struct atomisp_csi2_acpi_gpio_parsing_data data = { };
-	LIST_HEAD(resource_list);
-	union acpi_object *obj;
-	unsigned int i, j;
+	struct int3472_discrete_device *int3472;
 	int ret;
 
-	obj = acpi_evaluate_dsm_typed(adev->handle, &intel_sensor_module_guid,
-				      0x00, 1, NULL, ACPI_TYPE_STRING);
-	if (obj) {
-		acpi_handle_info(adev->handle, "%s: Sensor module id: '%s'\n",
-				 dev_name(&adev->dev), obj->string.pointer);
-		ACPI_FREE(obj);
-	}
-
-	/*
-	 * First get the GPIO-settings count and then get count GPIO-settings
-	 * values. Note the order of these may differ from the order in which
-	 * the GPIOs are listed on the ACPI resources! So we first store them all
-	 * and then enumerate the ACPI resources and match them up by pin number.
-	 */
-	obj = acpi_evaluate_dsm_typed(adev->handle,
-				      &intel_sensor_gpio_info_guid, 0x00, 1,
-				      NULL, ACPI_TYPE_INTEGER);
-	if (!obj) {
-		acpi_handle_err(adev->handle, "%s: No _DSM entry for GPIO pin count\n",
-				dev_name(&adev->dev));
-		return -EIO;
-	}
-
-	data.settings_count = obj->integer.value;
-	ACPI_FREE(obj);
-
-	if (data.settings_count > CSI2_MAX_ACPI_GPIOS) {
-		acpi_handle_err(adev->handle, "%s: Too many GPIOs %u > %u\n",
-				dev_name(&adev->dev), data.settings_count,
-				CSI2_MAX_ACPI_GPIOS);
-		return -EOVERFLOW;
-	}
-
-	for (i = 0; i < data.settings_count; i++) {
-		/*
-		 * i + 2 because the index of this _DSM function is 1-based
-		 * and the first function is just a count.
-		 */
-		obj = acpi_evaluate_dsm_typed(adev->handle,
-					      &intel_sensor_gpio_info_guid,
-					      0x00, i + 2,
-					      NULL, ACPI_TYPE_INTEGER);
-		if (!obj) {
-			acpi_handle_err(adev->handle, "%s: No _DSM entry for pin %u\n",
-					dev_name(&adev->dev), i);
-			return -EIO;
-		}
-
-		data.settings[i] = obj->integer.value;
-		ACPI_FREE(obj);
-	}
-
-	/* Since we match up by pin-number the pin-numbers must be unique */
-	for (i = 0; i < data.settings_count; i++) {
-		for (j = i + 1; j < data.settings_count; j++) {
-			if (INTEL_GPIO_DSM_PIN(data.settings[i]) !=
-			    INTEL_GPIO_DSM_PIN(data.settings[j]))
-				continue;
-
-			acpi_handle_err(adev->handle, "%s: Duplicate pin number %lu\n",
-					dev_name(&adev->dev),
-					INTEL_GPIO_DSM_PIN(data.settings[i]));
-			return -EIO;
-		}
-	}
-
-	data.map = kzalloc(sizeof(*data.map), GFP_KERNEL);
-	if (!data.map)
+	/* Max num GPIOs we've seen plus a terminator */
+	int3472 = kzalloc(struct_size(int3472, gpios.table, INT3472_MAX_SENSOR_GPIOS + 1),
+			  GFP_KERNEL);
+	if (!int3472)
 		return -ENOMEM;
 
-	/* Now parse the ACPI resources and build the lookup table */
-	data.adev = adev;
-	ret = acpi_dev_get_resources(adev, &resource_list,
-				     atomisp_csi2_handle_acpi_gpio_res, &data);
-	if (ret < 0)
-		return ret;
+	/*
+	 * On atomisp the _DSM to get the GPIO type must be made on the sensor
+	 * adev, rather then on a separate INT3472 adev.
+	 */
+	int3472->adev = adev;
+	int3472->dev = &adev->dev;
+	int3472->sensor = adev;
 
-	acpi_dev_free_resource_list(&resource_list);
+	int3472->sensor_name = kasprintf(GFP_KERNEL, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
+	if (!int3472->sensor_name) {
+		kfree(int3472);
+		return -ENOMEM;
+	}
 
-	if (data.map_count != data.settings_count ||
-	    data.res_count != data.settings_count)
-		acpi_handle_warn(adev->handle, "%s: ACPI GPIO resources vs DSM GPIO-info count mismatch (dsm: %d res: %d map %d\n",
-				 dev_name(&adev->dev), data.settings_count,
-				 data.res_count, data.map_count);
-
-	ret = acpi_dev_add_driver_gpios(adev, data.map->mapping);
-	if (ret)
-		acpi_handle_err(adev->handle, "%s: Error adding driver GPIOs: %d\n",
-				dev_name(&adev->dev), ret);
+	ret = int3472_discrete_parse_crs(int3472);
+	if (ret) {
+		int3472_discrete_cleanup(int3472);
+		kfree(int3472);
+	}
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0bd0bfded4af..3fdaa4b7bbaf 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1513,3 +1513,4 @@ MODULE_AUTHOR("Xiaolin Zhang <xiaolin.zhang@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel ATOM Platform ISP Driver");
 MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
+MODULE_IMPORT_NS("INTEL_INT3472_DISCRETE");
-- 
2.49.0


