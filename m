Return-Path: <linux-media+bounces-25985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48313A3047E
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E10C21666AC
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 07:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B2A1EB9F4;
	Tue, 11 Feb 2025 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YP/SP733"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24D1EC00B;
	Tue, 11 Feb 2025 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739258938; cv=none; b=ge3nYM6UYQ5s1JQCTVb0kKgLfLfoAitbNlGCZMoCyGREE7/vvzHNkq2yk4d+uPQZ0qzjGct1Zn1oM2MoWoqPFw22VOL7qh5NP/Wm+thV+F21gkBvp4gu/AE4V8KRgGovLIe2rTaqNyoogcDDCctPUxTlEoSRRZV9vbXI7jw3BwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739258938; c=relaxed/simple;
	bh=MNDf1Y65PaR7afnDQp+Khj0ZPczDBRJCAIcSt/0VX2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iKkRv2h8pwHIapaUkOK1M7J9DRfkGBGf0/wz23ePfJhP3xrkTylB5PoFzhXEel15PlsprEXzS9PKkSHOfbZg3iqmELXZCiMGZVbx0TgWb9BxH8cMgb3GeWXHMePKiC+T7smqjbvloU6HzmwLpquMV3gK0VomdIfqhvCaWrU7KzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YP/SP733; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739258937; x=1770794937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MNDf1Y65PaR7afnDQp+Khj0ZPczDBRJCAIcSt/0VX2I=;
  b=YP/SP7339QwDPh23B3gIgF3JbaTgmF2eJraVE5R3CcL7wysjqPB6Emzl
   UJtw3zMm1/2irx0ZwMhqmwn10rkUOs07yf9T6hkx3ONn3Rcutj5r28ETQ
   6wTE2TA9MUTsrRTvCI5gljJ5wxeRth2OimesvBBq10zi97SlTKoHfAadm
   TDI9NDPiDR4c2tPj1dHac27vvzM9JR3BlLnPhi7nvlFnD0rLge4Dpgj/Y
   4bOaZB1/MK6UR2PEFIW03aF24ZNSGYaBiuZvBd9LmsviMKCcZZXd60eUP
   PREEd5qcm/a4MGnYj+U3V6EY7pUJP9xeckB7kUiZFbBzM21eH+dn2GnDv
   g==;
X-CSE-ConnectionGUID: zrRpcw3hQtqz3ZOW5kudcQ==
X-CSE-MsgGUID: 175eslV4S+qSaW51QU/8yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50498312"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="50498312"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:28:56 -0800
X-CSE-ConnectionGUID: 0wMcz7K1RyaALvpI/3dY+Q==
X-CSE-MsgGUID: IQyE+KM+QESOXtxotXFHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="112193904"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:28:54 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DEC1D11F88A;
	Tue, 11 Feb 2025 09:28:49 +0200 (EET)
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
Subject: [PATCH v7 3/3] platform/x86: int3472: Call "func" "con_id" instead
Date: Tue, 11 Feb 2025 09:28:41 +0200
Message-Id: <20250211072841.7713-4-sakari.ailus@linux.intel.com>
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

"con_id" is an established variable name for the GPIO naming for drivers.
Use it instead of "func" in the int3472 driver, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 48 +++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 092252eb95a8..30ff8f3ea1f5 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -56,7 +56,7 @@ static void skl_int3472_log_sensor_module_name(struct int3472_discrete_device *i
 
 static int skl_int3472_fill_gpiod_lookup(struct gpiod_lookup *table_entry,
 					 struct acpi_resource_gpio *agpio,
-					 const char *func, unsigned long gpio_flags)
+					 const char *con_id, unsigned long gpio_flags)
 {
 	char *path = agpio->resource_source.string_ptr;
 	struct acpi_device *adev;
@@ -71,14 +71,14 @@ static int skl_int3472_fill_gpiod_lookup(struct gpiod_lookup *table_entry,
 	if (!adev)
 		return -ENODEV;
 
-	*table_entry = GPIO_LOOKUP(acpi_dev_name(adev), agpio->pin_table[0], func, gpio_flags);
+	*table_entry = GPIO_LOOKUP(acpi_dev_name(adev), agpio->pin_table[0], con_id, gpio_flags);
 
 	return 0;
 }
 
 static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int3472,
 					  struct acpi_resource_gpio *agpio,
-					  const char *func, unsigned long gpio_flags)
+					  const char *con_id, unsigned long gpio_flags)
 {
 	int ret;
 
@@ -88,7 +88,7 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 	}
 
 	ret = skl_int3472_fill_gpiod_lookup(&int3472->gpios.table[int3472->n_sensor_gpios],
-					    agpio, func, gpio_flags);
+					    agpio, con_id, gpio_flags);
 	if (ret)
 		return ret;
 
@@ -101,7 +101,7 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 static struct gpio_desc *
 skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 				       struct acpi_resource_gpio *agpio,
-				       const char *func, unsigned long gpio_flags)
+				       const char *con_id, unsigned long gpio_flags)
 {
 	struct gpio_desc *desc;
 	int ret;
@@ -112,12 +112,12 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 		return ERR_PTR(-ENOMEM);
 
 	lookup->dev_id = dev_name(int3472->dev);
-	ret = skl_int3472_fill_gpiod_lookup(&lookup->table[0], agpio, func, gpio_flags);
+	ret = skl_int3472_fill_gpiod_lookup(&lookup->table[0], agpio, con_id, gpio_flags);
 	if (ret)
 		return ERR_PTR(ret);
 
 	gpiod_add_lookup_table(lookup);
-	desc = devm_gpiod_get(int3472->dev, func, GPIOD_OUT_LOW);
+	desc = devm_gpiod_get(int3472->dev, con_id, GPIOD_OUT_LOW);
 	gpiod_remove_lookup_table(lookup);
 
 	return desc;
@@ -129,7 +129,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
  * @hid: The ACPI HID of the device without the instance number e.g. INT347E
  * @type_from: The GPIO type from ACPI ?SDT
  * @type_to: The assigned GPIO type, typically same as @type_from
- * @func: The function, e.g. "enable"
+ * @con_id: The name of the GPIO for the device
  * @polarity_low: GPIO_ACTIVE_LOW true if the @polarity_low is true,
  * GPIO_ACTIVE_HIGH otherwise
  */
@@ -138,15 +138,15 @@ struct int3472_gpio_map {
 	u8 type_from;
 	u8 type_to;
 	bool polarity_low;
-	const char *func;
+	const char *con_id;
 };
 
 static const struct int3472_gpio_map int3472_gpio_map[] = {
 	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
 };
 
-static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
-					  const char **func, unsigned long *gpio_flags)
+static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
+					    const char **con_id, unsigned long *gpio_flags)
 {
 	unsigned int i;
 
@@ -165,33 +165,33 @@ static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
 		*type = int3472_gpio_map[i].type_to;
 		*gpio_flags = int3472_gpio_map[i].polarity_low ?
 			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
-		*func = int3472_gpio_map[i].func;
+		*con_id = int3472_gpio_map[i].con_id;
 		return;
 	}
 
 	switch (*type) {
 	case INT3472_GPIO_TYPE_RESET:
-		*func = "reset";
+		*con_id = "reset";
 		*gpio_flags = GPIO_ACTIVE_LOW;
 		break;
 	case INT3472_GPIO_TYPE_POWERDOWN:
-		*func = "powerdown";
+		*con_id = "powerdown";
 		*gpio_flags = GPIO_ACTIVE_LOW;
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
-		*func = "clk-enable";
+		*con_id = "clk-enable";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
-		*func = "privacy-led";
+		*con_id = "privacy-led";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
-		*func = "power-enable";
+		*con_id = "power-enable";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	default:
-		*func = "unknown";
+		*con_id = "unknown";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	}
@@ -238,7 +238,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	union acpi_object *obj;
 	struct gpio_desc *gpio;
 	const char *err_msg;
-	const char *func;
+	const char *con_id;
 	unsigned long gpio_flags;
 	int ret;
 
@@ -262,26 +262,26 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_func_and_polarity(int3472->sensor, &type, &func, &gpio_flags);
+	int3472_get_con_id_and_polarity(int3472->sensor, &type, &con_id, &gpio_flags);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	/* Pin field is not really used under Windows and wraps around at 8 bits */
 	if (pin != (agpio->pin_table[0] & 0xff))
 		dev_dbg(int3472->dev, FW_BUG "%s %s pin number mismatch _DSM %d resource %d\n",
-			func, agpio->resource_source.string_ptr, pin, agpio->pin_table[0]);
+			con_id, agpio->resource_source.string_ptr, pin, agpio->pin_table[0]);
 
 	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
 	if (!active_value)
 		gpio_flags ^= GPIO_ACTIVE_LOW;
 
-	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
+	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", con_id,
 		agpio->resource_source.string_ptr, agpio->pin_table[0],
 		str_high_low(gpio_flags == GPIO_ACTIVE_HIGH));
 
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
-		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, gpio_flags);
+		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id, gpio_flags);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";
 
@@ -289,7 +289,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
-		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, func, gpio_flags);
+		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio)) {
 			ret = PTR_ERR(gpio);
 			err_msg = "Failed to get GPIO\n";
-- 
2.39.5


