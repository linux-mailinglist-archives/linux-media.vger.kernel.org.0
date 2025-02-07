Return-Path: <linux-media+bounces-25811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7EBA2C3F0
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 14:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6351162748
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 13:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290421F76B3;
	Fri,  7 Feb 2025 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+n0qpZX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C4F1F63E8;
	Fri,  7 Feb 2025 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935698; cv=none; b=ejJF5VNDD0CCaRBujLX+BKQenL7EEYrpuRX35wO1R6hZ0M9f8QmY+N4Kk5M11dIBPM2xZPWWcXeTBB7S3U1eiG3FcfE54kOs+dH+bkTyz6rqRb9Wj17HTjvVTp9TYopSnZOJYgUoKnl5S641meuZ0UAV/WJ6X8uIjT5g3mgZN+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935698; c=relaxed/simple;
	bh=NsqrcwD6zf3b9J/KcRFAqi6l1etTflCzjclBCU4uVA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/VDFIwNG97iVWwt5k0jE5KfAH9auWQxoPgKRyIyxcqM1vhnMQmROBT2UN+GjBL/hcSDnN4QjV/VLspHEDjRO2lMCkdxerkuGkkj+0H5k1jtG9M0eaCkMNhTU40nkBbVbQWsWTm1q8ByIq6rjmbG1hvrNh+hJmiy3tmn/fT5CnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+n0qpZX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738935697; x=1770471697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NsqrcwD6zf3b9J/KcRFAqi6l1etTflCzjclBCU4uVA8=;
  b=l+n0qpZXJsNYEz0hKrRvcmogPeIyqxovTpwsoKkJZNO78SmWrKutWJEI
   ZFIIAMZBlgqdnBmRnnavRU2MCqoe+iZdpXVfWrU9ZXxov8UolBmv/VmUb
   vs8WD1lqqukOHNkLTz7bIXTuE8elfnCqxH1wHirjGO6lKVhXmo+07bKZH
   bbwEozL5bNk9cO7+if372LufSTgxNbR008mzOZw3Z5e/cFS6enbvSPq0r
   ROqjWbTsdZl+TCW3mgx9PnNr08ErKxA56ITQvSHWq+MKhoCPToBhhxdJ4
   rBc32/TesJU79kYtemoMBgyOToHi5k2dMNk2Ylcq1oZaYbUYeCcU3zY7D
   A==;
X-CSE-ConnectionGUID: 5KPX/BJCQHm4ieg0Gt4W4A==
X-CSE-MsgGUID: EvdUeAYFQ5GcqHmdmj76Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42416952"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42416952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:41:36 -0800
X-CSE-ConnectionGUID: IdcMmjC6SgKPYXGkYQrz6A==
X-CSE-MsgGUID: 2bUPtsqOTHS9f7qsG5i3bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112040306"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:41:34 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E1006120867;
	Fri,  7 Feb 2025 15:41:30 +0200 (EET)
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
Subject: [PATCH v6 3/3] platform/x86: int3472: Call "func" "con_id" instead
Date: Fri,  7 Feb 2025 15:41:26 +0200
Message-Id: <20250207134126.1769183-4-sakari.ailus@linux.intel.com>
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

"con_id" is an established variable name for the GPIO naming for drivers.
Use it instead of "func" in the int3472 driver, too.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 48 +++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index c70404afefc0..826687c597b8 100644
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


