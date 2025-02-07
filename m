Return-Path: <linux-media+bounces-25810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5D0A2C3F2
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 14:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DE6F7A5801
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 13:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875B41F754C;
	Fri,  7 Feb 2025 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVClJbEv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE9A1F560D;
	Fri,  7 Feb 2025 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935697; cv=none; b=kKu+UMGED3gKx+TzwJb3y/aa/NUibe/vbN4Rmio8Q4UV/v846g7PIvf/0Xy7B6TIa7w1ibCgVqyGZ3J7Jtuxt/GOD8CTpS0KvSvzUfY69UTr0tps9aWSj4JMZ2S/K0xVKpQeO+0XxAyfhQkazZA7A/Xy5eRaOdoD2E3DhqoTU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935697; c=relaxed/simple;
	bh=jW0Ni2tS8oDjzCWwB5VZDTlJgaw0T0P2l5a8efLKcAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P5oS5HYyrebVkbTsFuu4zWoU/7ksmtXilvGeQ6Ki3FvwS0EXnTwKHpGnlOwwWEgEaDjtS42r2mHoiavAcdlNBHEfjG4VvNw+hIQ3+dRJmLe8Fpmqf5v7je6Y2pWJUwYHVdTUIBm4pQ0+EWuliGBYcxabQS+FkJhPQOC552BV9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVClJbEv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738935695; x=1770471695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jW0Ni2tS8oDjzCWwB5VZDTlJgaw0T0P2l5a8efLKcAI=;
  b=CVClJbEvlJ+28uWhxIjOu4M1IZFLOOUzvdZtaunAU37HB+EDL2GKTHnJ
   cDqU+cchnL0luwTb84QybciWogtAoy4sOGHvsyZWQ1B1Cvp3rc5xIZpyH
   jEAemooXY9ZLSeiVWRTJ63pkY3JEn8JTPX+OI8B87s8W8Rcu8kdLGxOn3
   hhuU2THjkneIrlHpbhV6kire59hia0E+sjjswQ9NSzbXaqWnoLnIhukwK
   bS1CMbqHWWXdrBP62NmZUq3i6D1xq2uA1YRKD4D/Ob9TeO95mWM6BjkhL
   arFq3z0GFuw7zmMi/gYSNuwhFXdxHa6+MgRpV4QtOe1mZjFnqA8iD9J/p
   A==;
X-CSE-ConnectionGUID: z0taKmJuT6Sgehr+cCLlew==
X-CSE-MsgGUID: 0RvCODWvT9KSt9CUvn9Wlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42416946"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42416946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:41:34 -0800
X-CSE-ConnectionGUID: cO62DyT2RRmcV5y0xarT7g==
X-CSE-MsgGUID: QdXTvnV2STyFP17EeG2RTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112040297"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:41:33 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7882E12074D;
	Fri,  7 Feb 2025 15:41:29 +0200 (EET)
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
Subject: [PATCH v6 2/3] platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
Date: Fri,  7 Feb 2025 15:41:25 +0200
Message-Id: <20250207134126.1769183-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207134126.1769183-1-sakari.ailus@linux.intel.com>
References: <20250207134126.1769183-1-sakari.ailus@linux.intel.com>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 52 +++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b891b064fbf7..c70404afefc0 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -2,6 +2,7 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
@@ -122,10 +123,53 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 	return desc;
 }
 
-static void int3472_get_func_and_polarity(u8 type, const char **func,
-					  unsigned long *gpio_flags)
+/**
+ * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
+ * sensor driver (as in DT bindings)
+ * @hid: The ACPI HID of the device without the instance number e.g. INT347E
+ * @type_from: The GPIO type from ACPI ?SDT
+ * @type_to: The assigned GPIO type, typically same as @type_from
+ * @func: The function, e.g. "enable"
+ * @polarity_low: GPIO_ACTIVE_LOW true if the @polarity_low is true,
+ * GPIO_ACTIVE_HIGH otherwise
+ */
+struct int3472_gpio_map {
+	const char *hid;
+	u8 type_from;
+	u8 type_to;
+	bool polarity_low;
+	const char *func;
+};
+
+static const struct int3472_gpio_map int3472_gpio_map[] = {
+	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
+};
+
+static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
+					  const char **func, unsigned long *gpio_flags)
 {
-	switch (type) {
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
+		/*
+		 * Map the firmware-provided GPIO to whatever a driver expects
+		 * (as in DT bindings). First check if the requested GPIO name
+		 * matches the GPIO map, then see that the device _HID matches.
+		 */
+		if (*type != int3472_gpio_map[i].type_from)
+			continue;
+
+		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
+			continue;
+
+		*type = int3472_gpio_map[i].type_to;
+		*gpio_flags = int3472_gpio_map[i].polarity_low ?
+			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
+		*func = int3472_gpio_map[i].func;
+		return;
+	}
+
+	switch (*type) {
 	case INT3472_GPIO_TYPE_RESET:
 		*func = "reset";
 		*gpio_flags = GPIO_ACTIVE_LOW;
@@ -218,7 +262,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_func_and_polarity(type, &func, &gpio_flags);
+	int3472_get_func_and_polarity(int3472->sensor, &type, &func, &gpio_flags);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	/* Pin field is not really used under Windows and wraps around at 8 bits */
-- 
2.39.5


