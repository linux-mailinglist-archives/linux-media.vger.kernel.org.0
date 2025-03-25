Return-Path: <linux-media+bounces-28732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD87DA70692
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61952177AA7
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C32019E971;
	Tue, 25 Mar 2025 16:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HskKvAxM"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25187273FE
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919321; cv=none; b=JT7ap0KGmYkyBSw5CnphulQivFZYYL0Zo9zOl4DugomAdSJJiodGVSvq+0LQT18llnDmS9yil93tgXgvbRfPNhPd7lDZthLjMPSQOsnpTjDVvPnpA4mfUJBiRSV+iVj7P01il0ciQTxsJF+oTuH1Q5HK6Jn6/aYvslpg2fF7Xn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919321; c=relaxed/simple;
	bh=SxDiAaAMzmXiNThNF4EyR/pyrVxK3p3l0b1u3Jbd+E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDBShkU01iJhujwIUq8EFiXRGjC9JuHY5SWZ3eLIKtbwPpZRqUvC5SjhxrpptmW81ixkXX6D5YuplzFEHEMeENMQyxwG+6QU4nlpVtEnVhuCu1K4MNF1R4foJigQdQFY3SRObLtiQk2td1HQ3w32sUsKZu3r6RyyPsuX2stLoUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HskKvAxM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742919318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j0xzOEd+drn9e60PT1zNNoKj4qQiQBrzWzIpiu7Pjd0=;
	b=HskKvAxMTW8wzcTFsXqgqzZG9/YnI2vI+W6PruUUnBbapd8tb6sAFx98FzfsvF9zrKZKCl
	JdzrMOhs4QusJOhXzVtIxGsI5Tj0lS+xAIqu5GTSLcWrEz3GzYyj3GFbS9DD/iUgttNLFb
	Y3d6nGAJhQ3Q+UHZQtOIAx2GW0UGGDU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-6-g3srJmQWNsiTW4HN5sAD4w-1; Tue,
 25 Mar 2025 12:14:35 -0400
X-MC-Unique: g3srJmQWNsiTW4HN5sAD4w-1
X-Mimecast-MFC-AGG-ID: g3srJmQWNsiTW4HN5sAD4w_1742919273
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5325418C4470;
	Tue, 25 Mar 2025 16:14:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.136])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 32E94180A803;
	Tue, 25 Mar 2025 16:14:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 5/8] platform/x86: int3472: Make regulator supply name configurable
Date: Tue, 25 Mar 2025 17:13:37 +0100
Message-ID: <20250325161340.342192-6-hdegoede@redhat.com>
In-Reply-To: <20250325161340.342192-1-hdegoede@redhat.com>
References: <20250325161340.342192-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This is a preparation patch for registering multiple regulators, which
requires a different supply-name for each regulator. Make supply-name
a parameter to skl_int3472_register_regulator() and use con-id to set it
so that the existing int3472_gpio_map remapping can be used with it.

Since supply-name now is a parameter, drop the fixed
skl_int3472_regulator_map_supplies[] array and instead add lower- +
upper-case mappings of the passed in supply-name to the regulator.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 47 ++++++++-----------
 drivers/platform/x86/intel/int3472/common.h   |  6 ++-
 drivers/platform/x86/intel/int3472/discrete.c |  4 +-
 3 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 374a99dea7d1..459dbb2cd68a 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -185,42 +185,34 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 	clk_unregister(int3472->clock.clk);
 }
 
-/*
- * The INT3472 device is going to be the only supplier of a regulator for
- * the sensor device. But unlike the clk framework the regulator framework
- * does not allow matching by consumer-device-name only.
- *
- * Ideally all sensor drivers would use "avdd" as supply-id. But for drivers
- * where this cannot be changed because another supply-id is already used in
- * e.g. DeviceTree files an alias for the other supply-id can be added here.
- *
- * Do not forget to update GPIO_REGULATOR_SUPPLY_MAP_COUNT when changing this.
- */
-static const char * const skl_int3472_regulator_map_supplies[] = {
-	"avdd",
-	"AVDD",
-};
-
-static_assert(ARRAY_SIZE(skl_int3472_regulator_map_supplies) ==
-	      GPIO_REGULATOR_SUPPLY_MAP_COUNT);
-
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   const char *supply_name,
 				   const char *second_sensor)
 {
 	struct regulator_init_data init_data = { };
+	struct int3472_gpio_regulator *regulator;
 	struct regulator_config cfg = { };
 	int i, j;
 
-	for (i = 0, j = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
-		int3472->regulator.supply_map[j].supply = skl_int3472_regulator_map_supplies[i];
-		int3472->regulator.supply_map[j].dev_name = int3472->sensor_name;
+	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {
+		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);
+		return -EOVERFLOW;
+	}
+
+	regulator = &int3472->regulator;
+	string_upper(regulator->supply_name_upper, supply_name);
+
+	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
+		const char *supply = i ? regulator->supply_name_upper : supply_name;
+
+		regulator->supply_map[j].supply = supply;
+		regulator->supply_map[j].dev_name = int3472->sensor_name;
 		j++;
 
 		if (second_sensor) {
-			int3472->regulator.supply_map[j].supply =
-				skl_int3472_regulator_map_supplies[i];
-			int3472->regulator.supply_map[j].dev_name = second_sensor;
+			regulator->supply_map[j].supply = supply;
+			regulator->supply_map[j].dev_name = second_sensor;
 			j++;
 		}
 	}
@@ -229,9 +221,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	init_data.consumer_supplies = int3472->regulator.supply_map;
 	init_data.num_consumer_supplies = j;
 
-	snprintf(int3472->regulator.regulator_name,
-		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
-		 acpi_dev_name(int3472->adev));
+	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
+		 acpi_dev_name(int3472->adev), supply_name);
 
 	int3472->regulator.rdesc = INT3472_REGULATOR(
 						int3472->regulator.regulator_name,
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 3728f3864a84..b0638c29d847 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -26,7 +26,9 @@
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
 
-#define GPIO_REGULATOR_NAME_LENGTH				21
+#define GPIO_SUPPPLY_NAME_LENGTH				5
+#define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPPLY_NAME_LENGTH)
+/* lower- + upper-case mapping */
 #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
 
 #define INT3472_LED_MAX_NAME_LEN				32
@@ -85,6 +87,7 @@ struct int3472_discrete_device {
 	struct int3472_gpio_regulator {
 		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
 		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
+		char supply_name_upper[GPIO_SUPPPLY_NAME_LENGTH];
 		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
 		struct regulator_dev *rdev;
 		struct regulator_desc rdesc;
@@ -129,6 +132,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   const char *supply_name,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
 
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index cbf39459bdf0..f6dae82739e5 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -188,7 +188,7 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
-		*con_id = "power-enable";
+		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
 	default:
@@ -311,7 +311,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			ret = skl_int3472_register_regulator(int3472, gpio,
+			ret = skl_int3472_register_regulator(int3472, gpio, con_id,
 							     int3472->quirks.avdd_second_sensor);
 			if (ret)
 				err_msg = "Failed to map regulator to sensor\n";
-- 
2.49.0


