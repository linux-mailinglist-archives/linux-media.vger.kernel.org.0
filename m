Return-Path: <linux-media+bounces-25809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B01A2C3ED
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 14:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28DD5163894
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 13:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8FC1F7095;
	Fri,  7 Feb 2025 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X71wAeTg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8141F4E56;
	Fri,  7 Feb 2025 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935696; cv=none; b=eWN1gNjMFt3ZZDJWe9BmydQe4f4+Xrt5iRqtCDY0qVKH/SHdxab7n3z5cZ02fCH+o1TF5uCsDjgUpPxgZw13Se6IcgOvcRu2dnLK85mrpy1VLGguXq758Q6ZAUqS+wvrclvmkF2R96nBeXW/dBJCzUMUjWzZ65cuW6+HcvkFtdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935696; c=relaxed/simple;
	bh=hh2vB2oTc6QdNdGdNld74kREG1WM+LtGa+1Nv/43T+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G4OOYkIcyDlVPx2Pv7MKfoST4jdEIYVBrUI1H1Vt3ZbkGKFvGqlZEEQxePKt+hu0kJ8/3DOiZb7vWaK38/FilbYgwWSL4S/qu+0a4lfwwBrf8OmOI0D2U46cHqLgo4yXNHa9pbHSY7N1uNgb6z/0VuqhhHr+EUns/WbY+R7S0Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X71wAeTg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738935695; x=1770471695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hh2vB2oTc6QdNdGdNld74kREG1WM+LtGa+1Nv/43T+Y=;
  b=X71wAeTgCegXhfoOIlIgca2bnYA9se2xlIvnJUyPV3YilwAcZZm4UI1p
   6AfiRJx+CyVUmfYA+hy7jF8bMexx0MH4cnmPrKAlfCUOEyA8/JjeZKLqk
   AEvwi/NfyQ2aEzuvKreoC23zPZ1tWS4PCQ95rjAJMBiPLfqas4w6O0+TK
   o40h7oQRfP0Bwx8SGosyzhFM4ynZuWUr9m7O29sscTB1FqOYBGs79Oh4Y
   tTEq4lReyi1JqMsa2VYmz60XbbAEsL1pagbjMJgHBCetdbMaJ/FiqJYyw
   rwS0XqDYI846/3Mvtx5BI63ppILG3TlVaU+5ZltQQSOJ1QSsyvVjI+Fb3
   g==;
X-CSE-ConnectionGUID: EwXOEfuUQa6/gTkapIWpDw==
X-CSE-MsgGUID: eq4yq5qsQTKUj5nxomqE4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42416940"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42416940"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:41:33 -0800
X-CSE-ConnectionGUID: GtjKKVO0QJWG722KDfjTsA==
X-CSE-MsgGUID: soJwnzHgTvCvgafBzP3HXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="112040290"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:41:31 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3CB2312066B;
	Fri,  7 Feb 2025 15:41:28 +0200 (EET)
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
Subject: [PATCH v6 1/3] platform/x86: int3472: Use correct type for "polarity", call it gpio_flags
Date: Fri,  7 Feb 2025 15:41:24 +0200
Message-Id: <20250207134126.1769183-2-sakari.ailus@linux.intel.com>
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

Struct gpiod_lookup flags field's type is unsigned long. Thus use unsigned
long for values to be assigned to that field. Similarly, also call the
field gpio_flags which it really is.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 39 ++++++++++---------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 31015ebe20d8..b891b064fbf7 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -55,7 +55,7 @@ static void skl_int3472_log_sensor_module_name(struct int3472_discrete_device *i
 
 static int skl_int3472_fill_gpiod_lookup(struct gpiod_lookup *table_entry,
 					 struct acpi_resource_gpio *agpio,
-					 const char *func, u32 polarity)
+					 const char *func, unsigned long gpio_flags)
 {
 	char *path = agpio->resource_source.string_ptr;
 	struct acpi_device *adev;
@@ -70,14 +70,14 @@ static int skl_int3472_fill_gpiod_lookup(struct gpiod_lookup *table_entry,
 	if (!adev)
 		return -ENODEV;
 
-	*table_entry = GPIO_LOOKUP(acpi_dev_name(adev), agpio->pin_table[0], func, polarity);
+	*table_entry = GPIO_LOOKUP(acpi_dev_name(adev), agpio->pin_table[0], func, gpio_flags);
 
 	return 0;
 }
 
 static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int3472,
 					  struct acpi_resource_gpio *agpio,
-					  const char *func, u32 polarity)
+					  const char *func, unsigned long gpio_flags)
 {
 	int ret;
 
@@ -87,7 +87,7 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 	}
 
 	ret = skl_int3472_fill_gpiod_lookup(&int3472->gpios.table[int3472->n_sensor_gpios],
-					    agpio, func, polarity);
+					    agpio, func, gpio_flags);
 	if (ret)
 		return ret;
 
@@ -100,7 +100,7 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 static struct gpio_desc *
 skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 				       struct acpi_resource_gpio *agpio,
-				       const char *func, u32 polarity)
+				       const char *func, unsigned long gpio_flags)
 {
 	struct gpio_desc *desc;
 	int ret;
@@ -111,7 +111,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 		return ERR_PTR(-ENOMEM);
 
 	lookup->dev_id = dev_name(int3472->dev);
-	ret = skl_int3472_fill_gpiod_lookup(&lookup->table[0], agpio, func, polarity);
+	ret = skl_int3472_fill_gpiod_lookup(&lookup->table[0], agpio, func, gpio_flags);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -122,32 +122,33 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 	return desc;
 }
 
-static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
+static void int3472_get_func_and_polarity(u8 type, const char **func,
+					  unsigned long *gpio_flags)
 {
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 		*func = "reset";
-		*polarity = GPIO_ACTIVE_LOW;
+		*gpio_flags = GPIO_ACTIVE_LOW;
 		break;
 	case INT3472_GPIO_TYPE_POWERDOWN:
 		*func = "powerdown";
-		*polarity = GPIO_ACTIVE_LOW;
+		*gpio_flags = GPIO_ACTIVE_LOW;
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 		*func = "clk-enable";
-		*polarity = GPIO_ACTIVE_HIGH;
+		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 		*func = "privacy-led";
-		*polarity = GPIO_ACTIVE_HIGH;
+		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 		*func = "power-enable";
-		*polarity = GPIO_ACTIVE_HIGH;
+		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	default:
 		*func = "unknown";
-		*polarity = GPIO_ACTIVE_HIGH;
+		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	}
 }
@@ -194,7 +195,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	struct gpio_desc *gpio;
 	const char *err_msg;
 	const char *func;
-	u32 polarity;
+	unsigned long gpio_flags;
 	int ret;
 
 	if (!acpi_gpio_get_io_resource(ares, &agpio))
@@ -217,7 +218,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_func_and_polarity(type, &func, &polarity);
+	int3472_get_func_and_polarity(type, &func, &gpio_flags);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	/* Pin field is not really used under Windows and wraps around at 8 bits */
@@ -227,16 +228,16 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	active_value = FIELD_GET(INT3472_GPIO_DSM_SENSOR_ON_VAL, obj->integer.value);
 	if (!active_value)
-		polarity ^= GPIO_ACTIVE_LOW;
+		gpio_flags ^= GPIO_ACTIVE_LOW;
 
 	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
 		agpio->resource_source.string_ptr, agpio->pin_table[0],
-		str_high_low(polarity == GPIO_ACTIVE_HIGH));
+		str_high_low(gpio_flags == GPIO_ACTIVE_HIGH));
 
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
-		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
+		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, gpio_flags);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";
 
@@ -244,7 +245,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
-		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, func, polarity);
+		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, func, gpio_flags);
 		if (IS_ERR(gpio)) {
 			ret = PTR_ERR(gpio);
 			err_msg = "Failed to get GPIO\n";
-- 
2.39.5


