Return-Path: <linux-media+bounces-31998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B735FAAE9BD
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 20:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7B3C1C41E00
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 18:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60F6216E01;
	Wed,  7 May 2025 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S0NLnvWq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4BA20B7FD
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 18:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643681; cv=none; b=cUPAkHeN8RfXN4vAUG0jpRMojs/U0KN/+izZGhYU08ttQUr1xQg6HYf5AQy6NxW2NR6XZvhEOKs4xTA+KIVr32Ky6iStyo0rCwGxXUU9iYQ/EDDrRx1OS4zSUuOWTlV4FYqaGtnG8pCVBZMxaYiuvD99KR+h3TssQb/XCq6YNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643681; c=relaxed/simple;
	bh=NYt1XuUxye3ybcm8aeoZzco2ZxBa8mn0u+sr8weSncs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHBIzGEy3Wn/eLB3Gx5b8t1xNmdCNavUSFnO8Q4Rj4bPGS1Dez/QiRxkGPZoG7uSF60lOWe5DcEuie7OSvoSj31TdRZ79qhqe6ffOHCj5d8SVQWYN7dVxUf4goCKk/iG6zQpD26CEIIQHn6WAaYo60Hwvbqyo/q1vcYR1JWP53I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S0NLnvWq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746643678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wblfYFMzUnrHUHVWLA300fjqB5upGDHJN15JL1TdKS0=;
	b=S0NLnvWqEG/hQNWXpereWAsNTxWEF21bm1k95M+C4un7MC0dc6TNrhaQx3aA/7m58BSecf
	+HD44WE5Xs5CCGCtpWiJqPJ9mlM7xGxsJeRICIzao9vakidIHOpd5WWUjWyTaGyQCvC2iN
	USWNAoJg5aVyZDb8vUskqDLvyKiEzNI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-d7lDvgCwMrSMyToOo6-L4Q-1; Wed,
 07 May 2025 14:47:55 -0400
X-MC-Unique: d7lDvgCwMrSMyToOo6-L4Q-1
X-Mimecast-MFC-AGG-ID: d7lDvgCwMrSMyToOo6-L4Q_1746643673
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 288CF18004AD;
	Wed,  7 May 2025 18:47:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 68E5530001A1;
	Wed,  7 May 2025 18:47:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/6] platform/x86: int3472: Move common.h to public includes, symbols to INTEL_INT3472
Date: Wed,  7 May 2025 20:47:32 +0200
Message-ID: <20250507184737.154747-2-hdegoede@redhat.com>
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

Move the common.h header file to include/linux/platform_data/x86/int3472.h
and add a "INTEL_INT3472" kernel-symbol-namespace to the exported symbols.

This is a preparation patch for exporting some more symbols for re-use in
the atomisp driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS                                            |  1 +
 drivers/platform/x86/intel/int3472/clk_and_regulator.c |  3 +--
 drivers/platform/x86/intel/int3472/common.c            |  9 ++++-----
 drivers/platform/x86/intel/int3472/discrete.c          |  4 ++--
 drivers/platform/x86/intel/int3472/discrete_quirks.c   |  3 +--
 drivers/platform/x86/intel/int3472/led.c               |  2 +-
 drivers/platform/x86/intel/int3472/tps68470.c          |  3 ++-
 .../linux/platform_data/x86/int3472.h                  | 10 +++++++---
 8 files changed, 19 insertions(+), 16 deletions(-)
 rename drivers/platform/x86/intel/int3472/common.h => include/linux/platform_data/x86/int3472.h (96%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b2d4558d12d6..43a3d9afbb76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12261,6 +12261,7 @@ INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
 M:	Daniel Scally <djrscally@gmail.com>
 S:	Maintained
 F:	drivers/platform/x86/intel/int3472/
+F:	include/linux/platform_data/x86/int3472.h
 
 INTEL SPEED SELECT TECHNOLOGY
 M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index c85cbfbc16c1..4d00494a7670 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -6,11 +6,10 @@
 #include <linux/clk-provider.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/platform_data/x86/int3472.h>
 #include <linux/regulator/driver.h>
 #include <linux/slab.h>
 
-#include "common.h"
-
 /*
  * 82c0d13a-78c5-4244-9bb1-eb8b539a8d11
  * This _DSM GUID allows controlling the sensor clk when it is not controlled
diff --git a/drivers/platform/x86/intel/int3472/common.c b/drivers/platform/x86/intel/int3472/common.c
index 1638be8fa71e..6dc38d5cbd0b 100644
--- a/drivers/platform/x86/intel/int3472/common.c
+++ b/drivers/platform/x86/intel/int3472/common.c
@@ -2,10 +2,9 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
+#include <linux/platform_data/x86/int3472.h>
 #include <linux/slab.h>
 
-#include "common.h"
-
 union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *id)
 {
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -29,7 +28,7 @@ union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *i
 
 	return obj;
 }
-EXPORT_SYMBOL_GPL(skl_int3472_get_acpi_buffer);
+EXPORT_SYMBOL_NS_GPL(skl_int3472_get_acpi_buffer, "INTEL_INT3472");
 
 int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb)
 {
@@ -53,7 +52,7 @@ int skl_int3472_fill_cldb(struct acpi_device *adev, struct int3472_cldb *cldb)
 	kfree(obj);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(skl_int3472_fill_cldb);
+EXPORT_SYMBOL_NS_GPL(skl_int3472_fill_cldb, "INTEL_INT3472");
 
 /* sensor_adev_ret may be NULL, name_ret must not be NULL */
 int skl_int3472_get_sensor_adev_and_name(struct device *dev,
@@ -84,7 +83,7 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(skl_int3472_get_sensor_adev_and_name);
+EXPORT_SYMBOL_NS_GPL(skl_int3472_get_sensor_adev_and_name, "INTEL_INT3472");
 
 MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI Device Driver library");
 MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 394975f55d64..d0938da0a591 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -12,12 +12,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/platform_data/x86/int3472.h>
 #include <linux/platform_device.h>
 #include <linux/string_choices.h>
 #include <linux/uuid.h>
 
-#include "common.h"
-
 /*
  * 79234640-9e10-4fea-a5c1-b5aa8b19756f
  * This _DSM GUID returns information about the GPIO lines mapped to a
@@ -479,3 +478,4 @@ module_platform_driver(int3472_discrete);
 MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI Discrete Device Driver");
 MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("INTEL_INT3472");
diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
index bf88863803b2..552869ef91ab 100644
--- a/drivers/platform/x86/intel/int3472/discrete_quirks.c
+++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
@@ -2,8 +2,7 @@
 /* Author: Hans de Goede <hansg@kernel.org> */
 
 #include <linux/dmi.h>
-
-#include "common.h"
+#include <linux/platform_data/x86/int3472.h>
 
 static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
 	.avdd_second_sensor = "i2c-OVTI2680:00",
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index 9cbed694e2ca..c5588e143f7d 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -4,7 +4,7 @@
 #include <linux/acpi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/leds.h>
-#include "common.h"
+#include <linux/platform_data/x86/int3472.h>
 
 static int int3472_pled_set(struct led_classdev *led_cdev,
 				     enum led_brightness brightness)
diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index 81ac4c691963..0133405697dc 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -8,10 +8,10 @@
 #include <linux/mfd/tps68470.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/tps68470.h>
+#include <linux/platform_data/x86/int3472.h>
 #include <linux/regmap.h>
 #include <linux/string.h>
 
-#include "common.h"
 #include "tps68470.h"
 
 #define DESIGNED_FOR_CHROMEOS		1
@@ -261,4 +261,5 @@ module_i2c_driver(int3472_tps68470);
 MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI TPS68470 Device Driver");
 MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS("INTEL_INT3472");
 MODULE_SOFTDEP("pre: clk-tps68470 tps68470-regulator");
diff --git a/drivers/platform/x86/intel/int3472/common.h b/include/linux/platform_data/x86/int3472.h
similarity index 96%
rename from drivers/platform/x86/intel/int3472/common.h
rename to include/linux/platform_data/x86/int3472.h
index 51b818e62a25..4cf02df6f753 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -1,8 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Author: Dan Scally <djrscally@gmail.com> */
+/*
+ * Intel INT3472 ACPI camera sensor power-management support
+ *
+ * Author: Dan Scally <djrscally@gmail.com>
+ */
 
-#ifndef _INTEL_SKL_INT3472_H
-#define _INTEL_SKL_INT3472_H
+#ifndef __PLATFORM_DATA_X86_INT3472_H
+#define __PLATFORM_DATA_X86_INT3472_H
 
 #include <linux/clk-provider.h>
 #include <linux/gpio/machine.h>
-- 
2.49.0


