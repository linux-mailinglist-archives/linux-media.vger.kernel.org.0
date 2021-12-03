Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB264674F5
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 11:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357015AbhLCKds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 05:33:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43944 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237171AbhLCKdr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Dec 2021 05:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638527423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TDcCbNPnDvsJ+bUn+O1I64F2/UVE1qKLcgj6B95Cl8o=;
        b=gfT906AmtK0TsYrmGwOxgV/EzL1GSzGKnXwQIqpYJwOTW3zArz6C0PmbsroAFkjVW8dPX+
        k+Ui3mlKPdo5jOAuNQF9pvs+xF+3mIAc5rF4U8II85Ab1cHCCCSVZ9RS52gwfdFIpEvMsE
        SFc4ZfIacK4R4HGhOWnbYgHGHzopNWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-b5DjCDu2N3GO4ErDnyx_bg-1; Fri, 03 Dec 2021 05:30:18 -0500
X-MC-Unique: b5DjCDu2N3GO4ErDnyx_bg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABAB181CCB6;
        Fri,  3 Dec 2021 10:30:15 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9F01960843;
        Fri,  3 Dec 2021 10:29:59 +0000 (UTC)
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
Subject: [PATCH v7 07/14] platform/x86: int3472: Split into 2 drivers
Date:   Fri,  3 Dec 2021 11:28:50 +0100
Message-Id: <20211203102857.44539-8-hdegoede@redhat.com>
In-Reply-To: <20211203102857.44539-1-hdegoede@redhat.com>
References: <20211203102857.44539-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The intel_skl_int3472.ko module contains 2 separate drivers,
the int3472_discrete platform driver and the int3472_tps68470
I2C-driver.

These 2 drivers contain very little shared code, only
skl_int3472_get_acpi_buffer() and skl_int3472_fill_cldb() are
shared.

Split the module into 2 drivers, linking the little shared code
directly into both.

This will allow us to add soft-module dependencies for the
tps68470 clk, gpio and regulator drivers to the new
intel_skl_int3472_tps68470.ko to help with probe ordering issues
without causing these modules to get loaded on boards which only
use the int3472_discrete platform driver.

While at it also rename the .c and .h files to remove the
cumbersome intel_skl_int3472_ prefix.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note git rename detection is failing for the new common.c but this is
just the old intel_skl_int3472_common.c with the driver registering
bits removed.
---
 drivers/platform/x86/intel/int3472/Makefile   |   9 +-
 ...lk_and_regulator.c => clk_and_regulator.c} |   2 +-
 drivers/platform/x86/intel/int3472/common.c   |  54 +++++++++
 .../{intel_skl_int3472_common.h => common.h}  |   3 -
 ...ntel_skl_int3472_discrete.c => discrete.c} |  28 ++++-
 .../intel/int3472/intel_skl_int3472_common.c  | 106 ------------------
 ...ntel_skl_int3472_tps68470.c => tps68470.c} |  23 +++-
 7 files changed, 105 insertions(+), 120 deletions(-)
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_clk_and_regulator.c => clk_and_regulator.c} (99%)
 create mode 100644 drivers/platform/x86/intel/int3472/common.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_common.h => common.h} (94%)
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_discrete.c => discrete.c} (93%)
 delete mode 100644 drivers/platform/x86/intel/int3472/intel_skl_int3472_common.c
 rename drivers/platform/x86/intel/int3472/{intel_skl_int3472_tps68470.c => tps68470.c} (85%)

diff --git a/drivers/platform/x86/intel/int3472/Makefile b/drivers/platform/x86/intel/int3472/Makefile
index 2362e04db18d..771e720528a0 100644
--- a/drivers/platform/x86/intel/int3472/Makefile
+++ b/drivers/platform/x86/intel/int3472/Makefile
@@ -1,5 +1,4 @@
-obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472.o
-intel_skl_int3472-y			:= intel_skl_int3472_common.o \
-					   intel_skl_int3472_discrete.o \
-					   intel_skl_int3472_tps68470.o \
-					   intel_skl_int3472_clk_and_regulator.o
+obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472_discrete.o \
+					   intel_skl_int3472_tps68470.o
+intel_skl_int3472_discrete-y		:= discrete.o clk_and_regulator.o common.o
+intel_skl_int3472_tps68470-y		:= tps68470.o common.o
diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
similarity index 99%
rename from drivers/platform/x86/intel/int3472/intel_skl_int3472_clk_and_regulator.c
rename to drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 1700e7557a82..1cf958983e86 100644
--- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -9,7 +9,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/slab.h>
 
-#include "intel_skl_int3472_common.h"
+#include "common.h"
 
 /*
  * The regulators have to have .ops to be valid, but the only ops we actually
diff --git a/drivers/platform/x86/intel/int3472/common.c b/drivers/platform/x86/intel/int3472/common.c
new file mode 100644
index 000000000000..350655a9515b
--- /dev/null
+++ b/drivers/platform/x86/intel/int3472/common.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Author: Dan Scally <djrscally@gmail.com> */
+
+#include <linux/acpi.h>
+#include <linux/slab.h>
+
+#include "common.h"
+
+union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *id)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_handle handle = adev->handle;
+	union acpi_object *obj;
+	acpi_status status;
+
+	status = acpi_evaluate_object(handle, id, NULL, &buffer);
+	if (ACPI_FAILURE(status))
+		return ERR_PTR(-ENODEV);
+
+	obj = buffer.pointer;
+	if (!obj)
+		return ERR_PTR(-ENODEV);
+
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		acpi_handle_err(handle, "%s object is not an ACPI buffer\n", id);
+		kfree(obj);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return obj;
+}
+
+int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb)
+{
+	union acpi_object *obj;
+	int ret;
+
+	obj = skl_int3472_get_acpi_buffer(adev, "CLDB");
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
+
+	if (obj->buffer.length > sizeof(*cldb)) {
+		acpi_handle_err(adev->handle, "The CLDB buffer is too large\n");
+		ret = -EINVAL;
+		goto out_free_obj;
+	}
+
+	memcpy(cldb, obj->buffer.pointer, obj->buffer.length);
+	ret = 0;
+
+out_free_obj:
+	kfree(obj);
+	return ret;
+}
diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_common.h b/drivers/platform/x86/intel/int3472/common.h
similarity index 94%
rename from drivers/platform/x86/intel/int3472/intel_skl_int3472_common.h
rename to drivers/platform/x86/intel/int3472/common.h
index 714fde73b524..d14944ee8586 100644
--- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -105,9 +105,6 @@ struct int3472_discrete_device {
 	struct gpiod_lookup_table gpios;
 };
 
-int skl_int3472_discrete_probe(struct platform_device *pdev);
-int skl_int3472_discrete_remove(struct platform_device *pdev);
-int skl_int3472_tps68470_probe(struct i2c_client *client);
 union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev,
 					       char *id);
 int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb);
diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
similarity index 93%
rename from drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
rename to drivers/platform/x86/intel/int3472/discrete.c
index e59d79c7e82f..d2e8a87a077e 100644
--- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -14,7 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/uuid.h>
 
-#include "intel_skl_int3472_common.h"
+#include "common.h"
 
 /*
  * 79234640-9e10-4fea-a5c1-b5aa8b19756f
@@ -332,7 +332,9 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 	return 0;
 }
 
-int skl_int3472_discrete_probe(struct platform_device *pdev)
+static int skl_int3472_discrete_remove(struct platform_device *pdev);
+
+static int skl_int3472_discrete_probe(struct platform_device *pdev)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
 	struct int3472_discrete_device *int3472;
@@ -395,7 +397,7 @@ int skl_int3472_discrete_probe(struct platform_device *pdev)
 	return ret;
 }
 
-int skl_int3472_discrete_remove(struct platform_device *pdev)
+static int skl_int3472_discrete_remove(struct platform_device *pdev)
 {
 	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
 
@@ -411,3 +413,23 @@ int skl_int3472_discrete_remove(struct platform_device *pdev)
 
 	return 0;
 }
+
+static const struct acpi_device_id int3472_device_id[] = {
+	{ "INT3472", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, int3472_device_id);
+
+static struct platform_driver int3472_discrete = {
+	.driver = {
+		.name = "int3472-discrete",
+		.acpi_match_table = int3472_device_id,
+	},
+	.probe = skl_int3472_discrete_probe,
+	.remove = skl_int3472_discrete_remove,
+};
+module_platform_driver(int3472_discrete);
+
+MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI Discrete Device Driver");
+MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_common.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_common.c
deleted file mode 100644
index 497e74fba75f..000000000000
--- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_common.c
+++ /dev/null
@@ -1,106 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Author: Dan Scally <djrscally@gmail.com> */
-
-#include <linux/acpi.h>
-#include <linux/i2c.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include "intel_skl_int3472_common.h"
-
-union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *id)
-{
-	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	acpi_handle handle = adev->handle;
-	union acpi_object *obj;
-	acpi_status status;
-
-	status = acpi_evaluate_object(handle, id, NULL, &buffer);
-	if (ACPI_FAILURE(status))
-		return ERR_PTR(-ENODEV);
-
-	obj = buffer.pointer;
-	if (!obj)
-		return ERR_PTR(-ENODEV);
-
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		acpi_handle_err(handle, "%s object is not an ACPI buffer\n", id);
-		kfree(obj);
-		return ERR_PTR(-EINVAL);
-	}
-
-	return obj;
-}
-
-int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb)
-{
-	union acpi_object *obj;
-	int ret;
-
-	obj = skl_int3472_get_acpi_buffer(adev, "CLDB");
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
-
-	if (obj->buffer.length > sizeof(*cldb)) {
-		acpi_handle_err(adev->handle, "The CLDB buffer is too large\n");
-		ret = -EINVAL;
-		goto out_free_obj;
-	}
-
-	memcpy(cldb, obj->buffer.pointer, obj->buffer.length);
-	ret = 0;
-
-out_free_obj:
-	kfree(obj);
-	return ret;
-}
-
-static const struct acpi_device_id int3472_device_id[] = {
-	{ "INT3472", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, int3472_device_id);
-
-static struct platform_driver int3472_discrete = {
-	.driver = {
-		.name = "int3472-discrete",
-		.acpi_match_table = int3472_device_id,
-	},
-	.probe = skl_int3472_discrete_probe,
-	.remove = skl_int3472_discrete_remove,
-};
-
-static struct i2c_driver int3472_tps68470 = {
-	.driver = {
-		.name = "int3472-tps68470",
-		.acpi_match_table = int3472_device_id,
-	},
-	.probe_new = skl_int3472_tps68470_probe,
-};
-
-static int skl_int3472_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&int3472_discrete);
-	if (ret)
-		return ret;
-
-	ret = i2c_register_driver(THIS_MODULE, &int3472_tps68470);
-	if (ret)
-		platform_driver_unregister(&int3472_discrete);
-
-	return ret;
-}
-module_init(skl_int3472_init);
-
-static void skl_int3472_exit(void)
-{
-	platform_driver_unregister(&int3472_discrete);
-	i2c_del_driver(&int3472_tps68470);
-}
-module_exit(skl_int3472_exit);
-
-MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI Device Driver");
-MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
similarity index 85%
rename from drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
rename to drivers/platform/x86/intel/int3472/tps68470.c
index c05b4cf502fe..fd3bef449137 100644
--- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -7,7 +7,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include "intel_skl_int3472_common.h"
+#include "common.h"
 
 #define DESIGNED_FOR_CHROMEOS		1
 #define DESIGNED_FOR_WINDOWS		2
@@ -95,7 +95,7 @@ static int skl_int3472_tps68470_calc_type(struct acpi_device *adev)
 	return DESIGNED_FOR_WINDOWS;
 }
 
-int skl_int3472_tps68470_probe(struct i2c_client *client)
+static int skl_int3472_tps68470_probe(struct i2c_client *client)
 {
 	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
 	struct regmap *regmap;
@@ -135,3 +135,22 @@ int skl_int3472_tps68470_probe(struct i2c_client *client)
 
 	return ret;
 }
+
+static const struct acpi_device_id int3472_device_id[] = {
+	{ "INT3472", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, int3472_device_id);
+
+static struct i2c_driver int3472_tps68470 = {
+	.driver = {
+		.name = "int3472-tps68470",
+		.acpi_match_table = int3472_device_id,
+	},
+	.probe_new = skl_int3472_tps68470_probe,
+};
+module_i2c_driver(int3472_tps68470);
+
+MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI TPS68470 Device Driver");
+MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.33.1

