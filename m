Return-Path: <linux-media+bounces-25466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8FCA23D71
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 13:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAEE87A1C3A
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 12:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3593E1B87D1;
	Fri, 31 Jan 2025 12:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RZM8Pbsq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526B1C3BF9;
	Fri, 31 Jan 2025 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738324925; cv=none; b=tFCbiEaazSWgPo/f5/rZwYd/TtqO66FWdaSIdFereT0UBOdocIbOG0+vIZ+uAl34ZZRM28bfI8EkpkMOd3XMTNRwMN6FT0dUFZxVF5obah+RMdF0tRRt4HL2CXzBJpzSTPiLrSGBsFMdDBBJcEQ08gfFdkFRtUUpsuvXSVniQls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738324925; c=relaxed/simple;
	bh=ePv2ijIqqa0tiFR/reaDpDHPKAhQmC8tDDnAnhr19M0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N1//BMj+f9zSHEpr3BeTipggdxCk26A9PCNqoPz1I4k3N06JfQVTyz42FXnOEhNNfLbuMydkbLRSNqSbf61jweIWVtqLxxTq6qGKQSYe5s2Nt7wMe4yPM7ZTHtgxFmAvVXOzbIOTGzIPMh19itg8RTICGu0tbQx3CEUPxy59JEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RZM8Pbsq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738324924; x=1769860924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ePv2ijIqqa0tiFR/reaDpDHPKAhQmC8tDDnAnhr19M0=;
  b=RZM8Pbsq+WvBo2HGOnIqlxCnE6Xih8iOCDkHl2Snzmy4JbC+6lv4V1xt
   Ua2lvaR+psucSl6kY6jycOsS39oP5J7ZGMzOeNP8NIsdqL/axbTco2NPv
   VK3d2+zlHpGlYh+Wq8L7KLPDfK/Cui3jrLcXLJwTxv1+L9KM7rFoTDodu
   91owpjHU6t8hr60qGMJoAUxqlhQqYKfGAfzsy3nFamjFUdFXA2a44CSZQ
   bYAKSEu3Itgaf/NLf7CSLfvZ6y1xu8QYLE7o685fSGYsGE+c08Qpn06zm
   e+27e+4SMwB4ZPF7TEI38wX8CMKqwcWMLgWBipOZV0pGk2Vr+ZePWi/4v
   g==;
X-CSE-ConnectionGUID: 7NLqA4FlRfunjAG2pghPkQ==
X-CSE-MsgGUID: bEpPG17pSGekBmoE+zq/Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39050281"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="39050281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:02:04 -0800
X-CSE-ConnectionGUID: VNeHQA8XQiOtiCa2MZos+w==
X-CSE-MsgGUID: PcHoFnUDRQ+2BJkQ6NOT6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="140498453"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 04:02:02 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6946E1202AB;
	Fri, 31 Jan 2025 14:01:58 +0200 (EET)
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
Subject: [PATCH v5 3/3] platform/x86: int3472: Call "func" "con_id" instead
Date: Fri, 31 Jan 2025 14:01:52 +0200
Message-Id: <20250131120152.1109476-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250131120152.1109476-1-sakari.ailus@linux.intel.com>
References: <20250131120152.1109476-1-sakari.ailus@linux.intel.com>
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
index 529ea2d08a21..0820a66c72fe 100644
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
 
@@ -160,33 +160,33 @@ static void int3472_get_func_and_polarity(struct acpi_device *adev, u8 *type,
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
@@ -233,7 +233,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	union acpi_object *obj;
 	struct gpio_desc *gpio;
 	const char *err_msg;
-	const char *func;
+	const char *con_id;
 	unsigned long gpio_flags;
 	int ret;
 
@@ -257,26 +257,26 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_func_and_polarity(int3472->sensor, &type, &func, &gpio_flags);
+	int3472_get_con_id_and_polarity(int3472->sensor, &type, &con_id, &gpio_flags);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	if (pin != agpio->pin_table[0])
 		dev_warn(int3472->dev, "%s %s pin number mismatch _DSM %d resource %d\n",
-			 func, agpio->resource_source.string_ptr, pin,
+			 con_id, agpio->resource_source.string_ptr, pin,
 			 agpio->pin_table[0]);
 
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
 
@@ -284,7 +284,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
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


