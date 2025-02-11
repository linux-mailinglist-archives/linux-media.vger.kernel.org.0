Return-Path: <linux-media+bounces-25984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D976A3047D
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A99D13A7D52
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 07:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F211EDA08;
	Tue, 11 Feb 2025 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpQ2lGRA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11161EB9F4;
	Tue, 11 Feb 2025 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739258938; cv=none; b=KpRzRx+ACGrlcdX1qqK/Lqbm0H0dOblGr8cI8qzJVICbiZgzXmuAc0LfNSvzRq0RiGTjbDfYv3ucmZSs+ATvRHy5+SR73DxyV1BWB7Enlnc0tGrZ0Vut9g1tTe6EEBddmtWEjAbE1DSSz0O9rHmmpxkm+FMemmh09Vs5ZrsmqVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739258938; c=relaxed/simple;
	bh=sW1qRB6/7Ach21rnrQVwKnlsr7STTfsk5iProj5sqLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WHxAsgh040JQa13tkmh5vRxFaoEgRKEJKFJC0LFqIu65EHxa91HfMHUBZA+IrWGHMNVJx3OfR9oauD6oHK0Chy4hrQPnI7UVsRlYvsi/kUpYAF6p1dYtp00+kR3m4PCmAI6hU81aCJhd6peMrp3xd3bPPjGVsSI7taBMf2U/cQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpQ2lGRA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739258937; x=1770794937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sW1qRB6/7Ach21rnrQVwKnlsr7STTfsk5iProj5sqLM=;
  b=MpQ2lGRANdhXamToo71TANSE9y4yK6VCZlvPVpTEL26O/zrlukXT+NF7
   Lnj4xeD0Dmo88STsa6rOVFgmDLGto0mlLdfc81yWTBMLwbnZqV5NYRylu
   FN/snWteEr9cLtHexqqNiJLXrYZcHC711LTx8j8QbGLO4VKRlCPyP610f
   u/cc9IEpNbbHNFFfD/aDf7AdTPCNMynlluOTAP9fJJGJzHWbSDZ+aTXZa
   7DIko7KQWdnebeZZLOOcZJbISsn0eGQMFoXtSIXExoOXI495mHrjF07zd
   6kysRhztEEesoKU653aQzcXqfAtEqeA5pVoDdlrAz8oT/NEfcVK2GXAj5
   A==;
X-CSE-ConnectionGUID: xR/W1yJDQVOfGwlSHE6vWg==
X-CSE-MsgGUID: NFydSI0qQIGzOFNdpZQ/SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50498307"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="50498307"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:28:55 -0800
X-CSE-ConnectionGUID: iNmf0CKOQASgIxooeYlnVA==
X-CSE-MsgGUID: h1eRll71Q22r2ZeH3GydOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="112193900"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:28:53 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4617B11F828;
	Tue, 11 Feb 2025 09:28:48 +0200 (EET)
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
Subject: [PATCH v7 2/3] platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
Date: Tue, 11 Feb 2025 09:28:40 +0200
Message-Id: <20250211072841.7713-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
References: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
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
index b891b064fbf7..092252eb95a8 100644
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
+		 * (as in DT bindings). First check if the type matches with the
+		 * GPIO map, then further check that the device _HID matches.
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


