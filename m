Return-Path: <linux-media+bounces-30342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6FDA8B95D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D145C189597A
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5D961FF2;
	Wed, 16 Apr 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ua4c+Vay"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390971EF1D
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807274; cv=none; b=kbu/x4xkfsj+M6CuAYao5cR628WloDRc0IMJHjju+gjNQZ0rty/yPqzxSUOrI9EDhxXsZx0z7Z5pdFsrHeRfNQxs4W49Z1rzm/yZyqtqtV4nJAy+cAvsjsSvTJrm0EalTkd+8Q2PSxlHBtuU+IVDydm/6VPtIT6onzoF/xSyPCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807274; c=relaxed/simple;
	bh=gyPxyPG9ur8rw8wnpbKQbqdHB3sNV6+YQGwlOJT3JSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uK6QpOssIwfChPoo2FtVYQ68K9/MQ4tb4Katr3wP0SkPtFyAObIEgC9VMnoh49u9xCVKkhZ1oE5yI7/SCgmxZKseJ9v1TcwPmeyQiP9WSQBWN3tGH6PhbwJ1U5cOqIUphAqoznwo7w7NBDSZFlBIgFhqdUuJUjvn+ZgVfUw7Z4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ua4c+Vay; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=215HgyjeVIU/Zl0fQFeBsUH+Vk1QJOIWpb4d7f4NOH0=;
	b=Ua4c+VayECPU4O7iHJcaIhPxwn3SplYZBW9jU9J2hUCcBW5pOkw+t0tDGofj1f71RZm3rl
	F0yaJEJsTjkjGHuaxInpcSoMeWr3rBeWEKhc55BKe9Fd8EplSkD36ge47q7afcWQoulljU
	XZyFADDVnzKJmKR+5U6OpcCOcTKorr4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-sTJKw_jlN7u76NcgbndeGA-1; Wed,
 16 Apr 2025 08:41:07 -0400
X-MC-Unique: sTJKw_jlN7u76NcgbndeGA-1
X-Mimecast-MFC-AGG-ID: sTJKw_jlN7u76NcgbndeGA_1744807265
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5121B19560AA;
	Wed, 16 Apr 2025 12:41:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 893EB195608D;
	Wed, 16 Apr 2025 12:41:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 4/9] platform/x86: int3472: Rework AVDD second sensor quirk handling
Date: Wed, 16 Apr 2025 14:40:32 +0200
Message-ID: <20250416124037.90508-5-hdegoede@redhat.com>
In-Reply-To: <20250416124037.90508-1-hdegoede@redhat.com>
References: <20250416124037.90508-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Rework the discrete quirk handling to use a quirks struct which is
pointed to by a dmi_system_id table, rather then having a dmi_system_id
table per type of quirk.

This is a preparation patch for adding support for multiple regulators,
where not all regulators might be shared between sensors.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/Makefile   |  3 +-
 .../x86/intel/int3472/clk_and_regulator.c     | 28 ++-----------------
 drivers/platform/x86/intel/int3472/common.h   | 13 ++++++++-
 drivers/platform/x86/intel/int3472/discrete.c | 13 ++++++++-
 .../x86/intel/int3472/discrete_quirks.c       | 22 +++++++++++++++
 5 files changed, 50 insertions(+), 29 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int3472/discrete_quirks.c

diff --git a/drivers/platform/x86/intel/int3472/Makefile b/drivers/platform/x86/intel/int3472/Makefile
index a8aba07bf1dc..103661e6685d 100644
--- a/drivers/platform/x86/intel/int3472/Makefile
+++ b/drivers/platform/x86/intel/int3472/Makefile
@@ -1,7 +1,8 @@
 obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472_discrete.o \
 					   intel_skl_int3472_tps68470.o \
 					   intel_skl_int3472_common.o
-intel_skl_int3472_discrete-y		:= discrete.o clk_and_regulator.o led.o
+intel_skl_int3472_discrete-y		:= discrete.o discrete_quirks.o \
+					   clk_and_regulator.o led.o
 intel_skl_int3472_tps68470-y		:= tps68470.o tps68470_board_data.o
 
 intel_skl_int3472_common-y		+= common.o
diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 5f6c66215f63..374a99dea7d1 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -5,7 +5,6 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
-#include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/driver.h>
 #include <linux/slab.h>
@@ -205,37 +204,14 @@ static const char * const skl_int3472_regulator_map_supplies[] = {
 static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
 	      GPIO_REGULATOR_SUPPLY_MAP_COUNT);
 
-/*
- * On some models there is a single GPIO regulator which is shared between
- * sensors and only listed in the ACPI resources of one sensor.
- * This DMI table contains the name of the second sensor. This is used to add
- * entries for the second sensor to the supply_map.
- */
-static const struct dmi_system_id skl_int3472_regulator_second_sensor[] = {
-	{
-		/* Lenovo Miix 510-12IKB */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 510-12IKB"),
-		},
-		.driver_data = "i2c-OVTI2680:00",
-	},
-	{ }
-};
-
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
-				   struct gpio_desc *gpio)
+				   struct gpio_desc *gpio,
+				   const char *second_sensor)
 {
 	struct regulator_init_data init_data = { };
 	struct regulator_config cfg = { };
-	const char *second_sensor = NULL;
-	const struct dmi_system_id *id;
 	int i, j;
 
-	id = dmi_first_match(skl_int3472_regulator_second_sensor);
-	if (id)
-		second_sensor = id->driver_data;
-
 	for (i = 0, j = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
 		int3472->regulator.supply_map[j].supply = skl_int3472_regulator_map_supplies[i];
 		int3472->regulator.supply_map[j].dev_name = int3472->sensor_name;
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index e0fa34be8a07..3728f3864a84 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -48,6 +48,7 @@
 	container_of(clk, struct int3472_discrete_device, clock)
 
 struct acpi_device;
+struct dmi_system_id;
 struct i2c_client;
 struct platform_device;
 
@@ -68,6 +69,11 @@ struct int3472_cldb {
 	u8 reserved2[17];
 };
 
+struct int3472_discrete_quirks {
+	/* For models where AVDD GPIO is shared between sensors */
+	const char *avdd_second_sensor;
+};
+
 struct int3472_discrete_device {
 	struct acpi_device *adev;
 	struct device *dev;
@@ -100,11 +106,15 @@ struct int3472_discrete_device {
 		struct gpio_desc *gpio;
 	} pled;
 
+	struct int3472_discrete_quirks quirks;
+
 	unsigned int ngpios; /* how many GPIOs have we seen */
 	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
 	struct gpiod_lookup_table gpios;
 };
 
+extern const struct dmi_system_id skl_int3472_discrete_quirks[];
+
 union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev,
 					       char *id);
 int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb);
@@ -118,7 +128,8 @@ int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472);
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
-				   struct gpio_desc *gpio);
+				   struct gpio_desc *gpio,
+				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 30ff8f3ea1f5..cbf39459bdf0 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -5,6 +5,7 @@
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/i2c.h>
@@ -310,7 +311,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			ret = skl_int3472_register_regulator(int3472, gpio);
+			ret = skl_int3472_register_regulator(int3472, gpio,
+							     int3472->quirks.avdd_second_sensor);
 			if (ret)
 				err_msg = "Failed to map regulator to sensor\n";
 
@@ -378,13 +380,19 @@ static void skl_int3472_discrete_remove(struct platform_device *pdev)
 static int skl_int3472_discrete_probe(struct platform_device *pdev)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
+	const struct int3472_discrete_quirks *quirks = NULL;
 	struct int3472_discrete_device *int3472;
+	const struct dmi_system_id *id;
 	struct int3472_cldb cldb;
 	int ret;
 
 	if (!adev)
 		return -ENODEV;
 
+	id = dmi_first_match(skl_int3472_discrete_quirks);
+	if (id)
+		quirks = id->driver_data;
+
 	ret = skl_int3472_fill_cldb(adev, &cldb);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't fill CLDB structure\n");
@@ -408,6 +416,9 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, int3472);
 	int3472->clock.imgclk_index = cldb.clock_source;
 
+	if (quirks)
+		int3472->quirks = *quirks;
+
 	ret = skl_int3472_get_sensor_adev_and_name(&pdev->dev, &int3472->sensor,
 						   &int3472->sensor_name);
 	if (ret)
diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
new file mode 100644
index 000000000000..bf88863803b2
--- /dev/null
+++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Author: Hans de Goede <hansg@kernel.org> */
+
+#include <linux/dmi.h>
+
+#include "common.h"
+
+static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
+	.avdd_second_sensor = "i2c-OVTI2680:00",
+};
+
+const struct dmi_system_id skl_int3472_discrete_quirks[] = {
+	{
+		/* Lenovo Miix 510-12IKB */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "MIIX 510-12IKB"),
+		},
+		.driver_data = (void *)&lenovo_miix_510_quirks,
+	},
+	{ }
+};
-- 
2.49.0


