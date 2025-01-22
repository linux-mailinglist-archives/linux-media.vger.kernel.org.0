Return-Path: <linux-media+bounces-25118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B64A19017
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 11:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 323C33ADE06
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 10:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39A8211288;
	Wed, 22 Jan 2025 10:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nALF3VLf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CC6211487;
	Wed, 22 Jan 2025 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542633; cv=none; b=ZTb6XIwwawVoJ54LRnK6iKi5TtaTaXydJ3Du0RB+YgMsJhhEsmGUCDCsymBRyniL3Jb078G7LK2ud/snCmvK/jxAlBLFLCYnEQW3EAbwAXa34/2jsQRkzbDmt7BGY8PAaQnqxOyNnreUtChsnix5t/MI5aek2DM5454vd9ptZSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542633; c=relaxed/simple;
	bh=WouqQ6wB42YojrijimDn9t6Qu/ycElgE8vlSKxh6OLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pqbc0wVg7mxHlJP1eazs7Kcd61VrPTbondCkoHVneD2bs0x9r2FqOvVjIJRa17G0uVLgYk/5/Pc/HzvOTQJZLRrAPnO4j7TP2FKHxK+9NJmZqbr4QpkzweJMaxcWZQX5SLS3+9PSvfXTOJv+3DSSuFMAKHcJ0LCEbyP4Y/kJVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nALF3VLf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737542632; x=1769078632;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WouqQ6wB42YojrijimDn9t6Qu/ycElgE8vlSKxh6OLY=;
  b=nALF3VLfE9MzWUWviGQLYRvf59obU27quQiBF98vCqkDJUYLcTThOFip
   HzzneTEMTjLZep47/Q500K1wYU2zclJH7gy1DTl/VC+QyUWoJTF9V67sq
   7RccGflywXUgtqMdi7ai1lUUP09HdFGYfBtf+Y+E7KmHFCFPk3AYIv9g1
   c94pAnBIrIIn9/ku6QD6HCTUvLWXj7V8owj0Hgw5/XKPoRugilaOKYwcv
   k/Kj0pg3BxuiaKiaDUjl4y+7Zlujh0drH2gmXljBoj9iJmwf7L975/yCQ
   n62YsAk0Ok7tvPnaaYAAx046qfd5qXzrpyE9onHpibjfPY4NbRY/wrvCb
   g==;
X-CSE-ConnectionGUID: 74LYCoaLR+2vQy3C/YftYQ==
X-CSE-MsgGUID: eHLdEgf+TfiRvXMu74CSzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37872222"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="37872222"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 02:43:51 -0800
X-CSE-ConnectionGUID: ix6MoF2NTxeMOcqRp5XecQ==
X-CSE-MsgGUID: 25+F+UHITJ+hHcxB+nqfDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107987432"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 02:43:48 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D705A11F944;
	Wed, 22 Jan 2025 12:43:44 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
Date: Wed, 22 Jan 2025 12:43:44 +0200
Message-Id: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
documentation) but the int3472 indiscriminately provides this as a "reset"
GPIO to sensor drivers. Take this into account by assigning it as "enable"
with active high polarity for INT347E devices, i.e. ov7251. "reset" with
active low polarity remains the default GPIO name for other devices.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v2:

- Implement a more generic GPIO mangling capability, as suggested by Hans
  de Goede.

- Include linux/array_size.h for ARRAY_SIZE().

 drivers/platform/x86/intel/int3472/discrete.c | 43 +++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index d881b2cfcdfc..181675e57c39 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -2,6 +2,7 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
@@ -122,9 +123,44 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 	return desc;
 }
 
-static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
+/**
+ * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
+ * sensor driver (as in DT bindings)
+ * @hid: The ACPI HID of the device without the instance number e.g. i2c-INT347E
+ * @type_from: The GPIO type from ACPI ?SDT
+ * @type_to: The assigned GPIO type, typically same as type_from
+ * @func: The function, e.g. "enable"
+ * @polarity: GPIO_ACTIVE_{HIGH,LOW}
+ */
+struct int3472_gpio_map {
+	const char *hid;
+	u8 type_from;
+	u8 type_to;
+	const char *func;
+	unsigned int polarity;
+};
+
+static const struct int3472_gpio_map int3472_gpio_map[] = {
+	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, "enable", GPIO_ACTIVE_HIGH },
+};
+
+static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
+					  const char **func, u32 *polarity)
 {
-	switch (type) {
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
+		if (*type != int3472_gpio_map[i].type_from ||
+		    !acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
+			continue;
+
+		*type = int3472_gpio_map[i].type_to;
+		*func = int3472_gpio_map[i].func;
+		*polarity = int3472_gpio_map[i].polarity;
+		return;
+	}
+
+	switch (*type) {
 	case INT3472_GPIO_TYPE_RESET:
 		*func = "reset";
 		*polarity = GPIO_ACTIVE_LOW;
@@ -217,7 +253,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_func_and_polarity(type, &func, &polarity);
+	int3472_get_func_and_polarity(int3472->sensor, &type, &func,
+				      &polarity);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	if (pin != agpio->pin_table[0])
-- 
2.39.5


