Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FA57084EA
	for <lists+linux-media@lfdr.de>; Thu, 18 May 2023 17:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjERPdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 May 2023 11:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbjERPdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 May 2023 11:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C15D2
        for <linux-media@vger.kernel.org>; Thu, 18 May 2023 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684423944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=puTAK+fsmgdD5Sn1B+l+yuYDEbGgsMecPBjay/ZCj+I=;
        b=Yr2tDEZ/kyDwR3GCT6ko0r3X5NZmgfviagQ5fqisFBUygL8WkD32oSbRegKYlSfz8gSdnq
        Rrl7lO8PEQjb0gz+De1U5GQ9RldO1GwtQ6sAacwaw1S/uwV25d8AgIEbV3PgGi1GlYO4tC
        wviPxAKdCLaMAqbnL3cCNN+3gj0AG0w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-C7aAOo5LP5KfeePxX2K5Sw-1; Thu, 18 May 2023 11:32:21 -0400
X-MC-Unique: C7aAOo5LP5KfeePxX2K5Sw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4021280269A;
        Thu, 18 May 2023 15:32:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.133])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B74F84078908;
        Thu, 18 May 2023 15:32:18 +0000 (UTC)
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
Subject: [PATCH 2/9] media: atomisp: Switch to v4l2_acpi_parse_sensor_gpios()
Date:   Thu, 18 May 2023 17:32:07 +0200
Message-Id: <20230518153214.194976-3-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-1-hdegoede@redhat.com>
References: <20230518153214.194976-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new v4l2-core v4l2_acpi_parse_sensor_gpios() helper function
instead of the atomisp specific v4l2_get_acpi_sensor_info() function.

And remove the now unused v4l2_get_acpi_sensor_info() function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        |   5 +-
 .../media/atomisp/i2c/atomisp-ov2680.c        |   5 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c | 240 ------------------
 3 files changed, 4 insertions(+), 246 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 273155308fe3..de7de1765e6b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -32,6 +32,7 @@
 #include <linux/i2c.h>
 #include <linux/moduleparam.h>
 #include <linux/pm_runtime.h>
+#include <media/v4l2-acpi.h>
 #include <media/v4l2-device.h>
 #include <linux/io.h>
 #include "../include/linux/atomisp_gmin_platform.h"
@@ -390,9 +391,7 @@ static int gc0310_probe(struct i2c_client *client)
 	if (!dev)
 		return -ENOMEM;
 
-	ret = v4l2_get_acpi_sensor_info(&client->dev, NULL);
-	if (ret)
-		return ret;
+	v4l2_acpi_parse_sensor_gpios(&client->dev);
 
 	dev->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dev->reset))
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 63de214916f5..af3774d2e72c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -26,6 +26,7 @@
 #include <linux/types.h>
 
 #include <media/ov_16bit_addr_reg_helpers.h>
+#include <media/v4l2-acpi.h>
 #include <media/v4l2-device.h>
 
 #include "../include/linux/atomisp_gmin_platform.h"
@@ -631,9 +632,7 @@ static int ov2680_probe(struct i2c_client *client)
 	sensor->client = client;
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
 
-	ret = v4l2_get_acpi_sensor_info(dev, NULL);
-	if (ret)
-		return ret;
+	v4l2_acpi_parse_sensor_gpios(dev);
 
 	sensor->powerdown = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->powerdown))
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index c718a74ea70a..ae45c1d8c50c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1458,243 +1458,3 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x0f38, isp_pm_cap_fixup);
 
 MODULE_DESCRIPTION("Ancillary routines for binding ACPI devices");
 MODULE_LICENSE("GPL");
-
-/*
- * The below helper functions don't really belong here and should eventually be
- * moved to some place under drivers/media/v4l2-core.
- */
-#include <linux/platform_data/x86/soc.h>
-
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
-/*
- * 822ace8f-2814-4174-a56b-5f029fe079ee
- * This _DSM GUID returns a string from the sensor device, which acts as a
- * module identifier.
- */
-static const guid_t intel_sensor_module_guid =
-	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
-		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
-
-#define INTEL_DSM_TYPE_SHIFT				0
-#define INTEL_DSM_TYPE_MASK				GENMASK(7, 0)
-#define INTEL_DSM_PIN_SHIFT				8
-#define INTEL_DSM_PIN_MASK				GENMASK(15, 8)
-#define INTEL_DSM_SENSOR_ON_VAL_SHIFT			24
-#define INTEL_DSM_SENSOR_ON_VAL_MASK			GENMASK(31, 24)
-
-#define INTEL_DSM_TYPE(x) \
-	(((x) & INTEL_DSM_TYPE_MASK) >> INTEL_DSM_TYPE_SHIFT)
-#define INTEL_DSM_PIN(x) \
-	(((x) & INTEL_DSM_PIN_MASK) >> INTEL_DSM_PIN_SHIFT)
-#define INTEL_DSM_SENSOR_ON_VAL(x) \
-	(((x) & INTEL_DSM_SENSOR_ON_VAL_MASK) >> INTEL_DSM_SENSOR_ON_VAL_SHIFT)
-
-#define V4L2_SENSOR_MAX_ACPI_GPIOS			2u
-
-struct v4l2_acpi_gpio_map {
-	struct acpi_gpio_params params[V4L2_SENSOR_MAX_ACPI_GPIOS];
-	struct acpi_gpio_mapping mapping[V4L2_SENSOR_MAX_ACPI_GPIOS + 1];
-};
-
-struct v4l2_acpi_gpio_parsing_data {
-	struct device *dev;
-	u32 settings[V4L2_SENSOR_MAX_ACPI_GPIOS];
-	unsigned int settings_count;
-	unsigned int res_count;
-	unsigned int map_count;
-	struct v4l2_acpi_gpio_map *map;
-};
-
-/* Note this always returns 1 to continue looping so that res_count is accurate */
-static int v4l2_acpi_handle_gpio_res(struct acpi_resource *ares, void *_data)
-{
-	struct v4l2_acpi_gpio_parsing_data *data = _data;
-	struct acpi_resource_gpio *agpio;
-	const char *name;
-	bool active_low;
-	unsigned int i;
-	u32 settings;
-	u8 pin;
-
-	if (!acpi_gpio_get_io_resource(ares, &agpio))
-		return 1; /* Not a GPIO, continue the loop */
-
-	data->res_count++;
-
-	pin = agpio->pin_table[0];
-	for (i = 0; i < data->settings_count; i++) {
-		if (INTEL_DSM_PIN(data->settings[i]) == pin) {
-			settings = data->settings[i];
-			break;
-		}
-	}
-
-	if (i == data->settings_count) {
-		dev_warn(data->dev, "Could not find DSM GPIO settings for pin %d\n", pin);
-		return 1;
-	}
-
-	switch (INTEL_DSM_TYPE(settings)) {
-	case 0:
-		name = "reset-gpios";
-		break;
-	case 1:
-		name = "powerdown-gpios";
-		break;
-	default:
-		dev_warn(data->dev, "Unknown GPIO type 0x%02lx for pin %d\n",
-			 INTEL_DSM_TYPE(settings), pin);
-		return 1;
-	}
-
-	/*
-	 * Both reset and power-down need to be logical false when the sensor
-	 * is on (sensor should not be in reset and not be powered-down). So
-	 * when the sensor-on-value (which is the physical pin value) is high,
-	 * then the signal is active-low.
-	 */
-	active_low = INTEL_DSM_SENSOR_ON_VAL(settings) ? true : false;
-
-	i = data->map_count;
-	if (i == V4L2_SENSOR_MAX_ACPI_GPIOS)
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
-	dev_info(data->dev, "%s crs %d %s pin %d active-%s\n", name,
-		 data->res_count - 1, agpio->resource_source.string_ptr,
-		 pin, active_low ? "low" : "high");
-
-	return 1;
-}
-
-/*
- * Helper function to create an ACPI GPIO lookup table for sensor reset and
- * powerdown signals on Intel Bay Trail (BYT) and Cherry Trail (CHT) devices,
- * including setting the correct polarity for the GPIO.
- *
- * This uses the "79234640-9e10-4fea-a5c1-b5aa8b19756f" DSM method directly
- * on the sensor device's ACPI node. This is different from later Intel
- * hardware which has a separate INT3472 with this info. Since there is
- * no separate firmware-node to which we can bind to register the GPIO lookups
- * this unfortunately means that all sensor drivers which may be used on
- * BYT or CHT hw need to call this function. This also means that this function
- * may only fail when it is actually called on BYT/CHT hw. In all other cases
- * it must always succeed.
- *
- * Note this code uses the same DSM GUID as the INT3472 discrete.c code
- * and there is some overlap, but there are enough differences that it is
- * difficult to share the code.
- */
-int v4l2_get_acpi_sensor_info(struct device *dev, char **module_id_str)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-	struct v4l2_acpi_gpio_parsing_data data = { };
-	LIST_HEAD(resource_list);
-	union acpi_object *obj;
-	unsigned int i, j;
-	int ret;
-
-	if (module_id_str)
-		*module_id_str = NULL;
-
-	if (!adev)
-		return 0;
-
-	obj = acpi_evaluate_dsm_typed(adev->handle, &intel_sensor_module_guid,
-				      0x00, 0x01, NULL, ACPI_TYPE_STRING);
-	if (obj) {
-		dev_info(dev, "Sensor module id: '%s'\n", obj->string.pointer);
-		if (module_id_str)
-			*module_id_str = kstrdup(obj->string.pointer, GFP_KERNEL);
-
-		ACPI_FREE(obj);
-	}
-
-	if (!soc_intel_is_byt() && !soc_intel_is_cht())
-		return 0;
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
-	if (!obj)
-		return dev_err_probe(dev, -EIO, "No _DSM entry for GPIO pin count\n");
-
-	data.settings_count = obj->integer.value;
-	ACPI_FREE(obj);
-
-	if (data.settings_count > V4L2_SENSOR_MAX_ACPI_GPIOS)
-		return dev_err_probe(dev, -EIO, "Too many GPIOs %u > %u\n",
-				     data.settings_count, V4L2_SENSOR_MAX_ACPI_GPIOS);
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
-		if (!obj)
-			return dev_err_probe(dev, -EIO, "No _DSM entry for GPIO pin %u\n", i);
-
-		data.settings[i] = obj->integer.value;
-		ACPI_FREE(obj);
-	}
-
-	/* Since we match up by pin-number the pin-numbers must be unique */
-	for (i = 0; i < data.settings_count; i++) {
-		for (j = i + 1; j < data.settings_count; j++) {
-			if (INTEL_DSM_PIN(data.settings[i]) !=
-			    INTEL_DSM_PIN(data.settings[j]))
-				continue;
-
-			return dev_err_probe(dev, -EIO, "Duplicate pin number %lu\n",
-					     INTEL_DSM_PIN(data.settings[i]));
-		}
-	}
-
-	/* Use devm_kzalloc() for the mappings + params to auto-free them */
-	data.map = devm_kzalloc(dev, sizeof(*data.map), GFP_KERNEL);
-	if (!data.map)
-		return -ENOMEM;
-
-	/* Now parse the ACPI resources and build the lookup table */
-	data.dev = dev;
-	ret = acpi_dev_get_resources(adev, &resource_list,
-				     v4l2_acpi_handle_gpio_res, &data);
-	if (ret < 0)
-		return ret;
-
-	acpi_dev_free_resource_list(&resource_list);
-
-	if (data.map_count != data.settings_count ||
-	    data.res_count != data.settings_count)
-		dev_warn(dev, "ACPI GPIO resources vs DSM GPIO-info count mismatch (dsm: %d res: %d map %d\n",
-			 data.settings_count, data.res_count, data.map_count);
-
-	return devm_acpi_dev_add_driver_gpios(dev, data.map->mapping);
-}
-EXPORT_SYMBOL_GPL(v4l2_get_acpi_sensor_info);
-- 
2.40.1

