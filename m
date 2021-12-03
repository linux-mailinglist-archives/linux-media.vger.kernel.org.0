Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21049467502
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 11:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379971AbhLCKeM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 05:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26174 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1379977AbhLCKeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Dec 2021 05:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638527447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s9Jiw9tWZMbKgdcgj9+nkWC0SuutzAQiiienqGWCsZ8=;
        b=WrtQXXzcez6ML/XsQZ9gxymxxEBN/mDgyspCtEBtu/+U2xVeyl5ooZFLXDBrpfABCFSUGQ
        ApPQ/vKdwL6eUh+Tvp+baQmQRiWxSvJjF4YhPr33qy0LmH8Bg+JE4BBqOter2c+/mnJ1WW
        VGtztCAcEYfyNKZd/Gr1ipHe6d/Kvzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-234-tlWq4O6DPz2hmGtDefNrLA-1; Fri, 03 Dec 2021 05:30:46 -0500
X-MC-Unique: tlWq4O6DPz2hmGtDefNrLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98F8B2F26;
        Fri,  3 Dec 2021 10:30:43 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9111D60843;
        Fri,  3 Dec 2021 10:30:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v7 10/14] platform/x86: int3472: Pass tps68470_regulator_platform_data to the tps68470-regulator MFD-cell
Date:   Fri,  3 Dec 2021 11:28:53 +0100
Message-Id: <20211203102857.44539-11-hdegoede@redhat.com>
In-Reply-To: <20211203102857.44539-1-hdegoede@redhat.com>
References: <20211203102857.44539-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pass tps68470_regulator_platform_data to the tps68470-regulator
MFD-cell, specifying the voltages of the various regulators and
tying the regulators to the sensor supplies so that sensors which use
the TPS68470 can find their regulators.

Since the voltages and supply connections are board-specific, this
introduces a DMI matches int3472_tps68470_board_data struct which
contains the necessary per-board info.

This per-board info also includes GPIO lookup information for the
sensor IO lines which may be connected to the tps68470 GPIOs.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v6:
- Also list the VCM module as VSIO regulator consumer
- Add constraints for VIO, it MUST have the same voltage configured as
  VSIO and mark it as always-on (it is always on there is no on/off
  control for it in the PMIC, as the PMIC uses it internally)
- Fix logic error in int3472_tps68470_get_board_data() (thank you Andy)

Changes in v5:
- Also pass regulator_init_data for the regulator used for the VCM
  (Voice Coil Motor) used for the focus of the back-camera lens
---
 drivers/platform/x86/intel/int3472/Makefile   |   2 +-
 drivers/platform/x86/intel/int3472/tps68470.c |  28 ++++
 drivers/platform/x86/intel/int3472/tps68470.h |  25 +++
 .../x86/intel/int3472/tps68470_board_data.c   | 145 ++++++++++++++++++
 4 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/intel/int3472/tps68470.h
 create mode 100644 drivers/platform/x86/intel/int3472/tps68470_board_data.c

diff --git a/drivers/platform/x86/intel/int3472/Makefile b/drivers/platform/x86/intel/int3472/Makefile
index 771e720528a0..cfec7784c5c9 100644
--- a/drivers/platform/x86/intel/int3472/Makefile
+++ b/drivers/platform/x86/intel/int3472/Makefile
@@ -1,4 +1,4 @@
 obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472_discrete.o \
 					   intel_skl_int3472_tps68470.o
 intel_skl_int3472_discrete-y		:= discrete.o clk_and_regulator.o common.o
-intel_skl_int3472_tps68470-y		:= tps68470.o common.o
+intel_skl_int3472_tps68470-y		:= tps68470.o tps68470_board_data.o common.o
diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index d0a3659a34ea..64b961fe628c 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -2,13 +2,16 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/i2c.h>
+#include <linux/kernel.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps68470.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/tps68470.h>
 #include <linux/regmap.h>
+#include <linux/string.h>
 
 #include "common.h"
+#include "tps68470.h"
 
 #define DESIGNED_FOR_CHROMEOS		1
 #define DESIGNED_FOR_WINDOWS		2
@@ -95,6 +98,7 @@ static int skl_int3472_tps68470_calc_type(struct acpi_device *adev)
 static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
+	const struct int3472_tps68470_board_data *board_data;
 	struct tps68470_clk_platform_data clk_pdata = {};
 	struct mfd_cell *cells;
 	struct regmap *regmap;
@@ -123,6 +127,10 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	device_type = skl_int3472_tps68470_calc_type(adev);
 	switch (device_type) {
 	case DESIGNED_FOR_WINDOWS:
+		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
+		if (!board_data)
+			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
+
 		cells = kcalloc(TPS68470_WIN_MFD_CELL_COUNT, sizeof(*cells), GFP_KERNEL);
 		if (!cells)
 			return -ENOMEM;
@@ -137,12 +145,20 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 		cells[0].platform_data = &clk_pdata;
 		cells[0].pdata_size = sizeof(clk_pdata);
 		cells[1].name = "tps68470-regulator";
+		cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
+		cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
 		cells[2].name = "tps68470-gpio";
 
+		gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_table);
+
 		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
 					   cells, TPS68470_WIN_MFD_CELL_COUNT,
 					   NULL, 0, NULL);
 		kfree(cells);
+
+		if (ret)
+			gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_table);
+
 		break;
 	case DESIGNED_FOR_CHROMEOS:
 		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
@@ -157,6 +173,17 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	return ret;
 }
 
+static int skl_int3472_tps68470_remove(struct i2c_client *client)
+{
+	const struct int3472_tps68470_board_data *board_data;
+
+	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
+	if (board_data)
+		gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_table);
+
+	return 0;
+}
+
 static const struct acpi_device_id int3472_device_id[] = {
 	{ "INT3472", 0 },
 	{ }
@@ -169,6 +196,7 @@ static struct i2c_driver int3472_tps68470 = {
 		.acpi_match_table = int3472_device_id,
 	},
 	.probe_new = skl_int3472_tps68470_probe,
+	.remove = skl_int3472_tps68470_remove,
 };
 module_i2c_driver(int3472_tps68470);
 
diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
new file mode 100644
index 000000000000..cfd33eb62740
--- /dev/null
+++ b/drivers/platform/x86/intel/int3472/tps68470.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * TI TPS68470 PMIC platform data definition.
+ *
+ * Copyright (c) 2021 Red Hat Inc.
+ *
+ * Red Hat authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ */
+
+#ifndef _INTEL_SKL_INT3472_TPS68470_H
+#define _INTEL_SKL_INT3472_TPS68470_H
+
+struct gpiod_lookup_table;
+struct tps68470_regulator_platform_data;
+
+struct int3472_tps68470_board_data {
+	const char *dev_name;
+	struct gpiod_lookup_table *tps68470_gpio_lookup_table;
+	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
+};
+
+const struct int3472_tps68470_board_data *int3472_tps68470_get_board_data(const char *dev_name);
+
+#endif
diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
new file mode 100644
index 000000000000..faa5570f6e6b
--- /dev/null
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI TPS68470 PMIC platform data definition.
+ *
+ * Copyright (c) 2021 Dan Scally <djrscally@gmail.com>
+ * Copyright (c) 2021 Red Hat Inc.
+ *
+ * Red Hat authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/dmi.h>
+#include <linux/gpio/machine.h>
+#include <linux/platform_data/tps68470.h>
+#include <linux/regulator/machine.h>
+#include "tps68470.h"
+
+static struct regulator_consumer_supply int347a_core_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dvdd", "i2c-INT347A:00"),
+};
+
+static struct regulator_consumer_supply int347a_ana_consumer_supplies[] = {
+	REGULATOR_SUPPLY("avdd", "i2c-INT347A:00"),
+};
+
+static struct regulator_consumer_supply int347a_vcm_consumer_supplies[] = {
+	REGULATOR_SUPPLY("vdd", "i2c-INT347A:00-VCM"),
+};
+
+static struct regulator_consumer_supply int347a_vsio_consumer_supplies[] = {
+	REGULATOR_SUPPLY("dovdd", "i2c-INT347A:00"),
+	REGULATOR_SUPPLY("vsio", "i2c-INT347A:00-VCM"),
+};
+
+static const struct regulator_init_data surface_go_tps68470_core_reg_init_data = {
+	.constraints = {
+		.min_uV = 1200000,
+		.max_uV = 1200000,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int347a_core_consumer_supplies),
+	.consumer_supplies = int347a_core_consumer_supplies,
+};
+
+static const struct regulator_init_data surface_go_tps68470_ana_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int347a_ana_consumer_supplies),
+	.consumer_supplies = int347a_ana_consumer_supplies,
+};
+
+static const struct regulator_init_data surface_go_tps68470_vcm_reg_init_data = {
+	.constraints = {
+		.min_uV = 2815200,
+		.max_uV = 2815200,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int347a_vcm_consumer_supplies),
+	.consumer_supplies = int347a_vcm_consumer_supplies,
+};
+
+/* Ensure the always-on VIO regulator has the same voltage as VSIO */
+static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = true,
+		.always_on = true,
+	},
+};
+
+static const struct regulator_init_data surface_go_tps68470_vsio_reg_init_data = {
+	.constraints = {
+		.min_uV = 1800600,
+		.max_uV = 1800600,
+		.apply_uV = true,
+		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
+	},
+	.num_consumer_supplies = ARRAY_SIZE(int347a_vsio_consumer_supplies),
+	.consumer_supplies = int347a_vsio_consumer_supplies,
+};
+
+static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata = {
+	.reg_init_data = {
+		[TPS68470_CORE] = &surface_go_tps68470_core_reg_init_data,
+		[TPS68470_ANA]  = &surface_go_tps68470_ana_reg_init_data,
+		[TPS68470_VCM]  = &surface_go_tps68470_vcm_reg_init_data,
+		[TPS68470_VIO] = &surface_go_tps68470_vio_reg_init_data,
+		[TPS68470_VSIO] = &surface_go_tps68470_vsio_reg_init_data,
+	},
+};
+
+static struct gpiod_lookup_table surface_go_tps68470_gpios = {
+	.dev_id = "i2c-INT347A:00",
+	.table = {
+		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("tps68470-gpio", 7, "powerdown", GPIO_ACTIVE_LOW)
+	}
+};
+
+static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
+	.dev_name = "i2c-INT3472:05",
+	.tps68470_gpio_lookup_table = &surface_go_tps68470_gpios,
+	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
+};
+
+static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Go"),
+		},
+		.driver_data = (void *)&surface_go_tps68470_board_data,
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Go 2"),
+		},
+		.driver_data = (void *)&surface_go_tps68470_board_data,
+	},
+	{ }
+};
+
+const struct int3472_tps68470_board_data *int3472_tps68470_get_board_data(const char *dev_name)
+{
+	const struct int3472_tps68470_board_data *board_data;
+	const struct dmi_system_id *match;
+
+	for (match = dmi_first_match(int3472_tps68470_board_data_table);
+	     match;
+	     match = dmi_first_match(match + 1)) {
+		board_data = match->driver_data;
+		if (strcmp(board_data->dev_name, dev_name) == 0)
+			return board_data;
+	}
+
+	return NULL;
+}
-- 
2.33.1

