Return-Path: <linux-media+bounces-30445-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 609A9A91A4C
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 703F81651FB
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C71237718;
	Thu, 17 Apr 2025 11:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f0i9yZYt"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD627238C09
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888460; cv=none; b=jxi7UDqLMHbMGOTaO7r/wp1mlVL5h/c17j5NBCZ6kS6GS2SrPl3dUAxFIH7U5L2SelKoT/OHHgvywEDOYsEAyU7qEZpTLKaSwX0K5TMh3tynM76IFgeGOtqywyOZwnog9npoMlYef2KQNIArgd7IPta7SSNBZwmPCbD7eWBhNPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888460; c=relaxed/simple;
	bh=vQUQ3xWitcQfclEhWE+eK4nKYNxFHrBz8fWexvOXmtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHJbuMiw36H58j/PHvNxwA/Dt9GqbaXgiMpmiwNXfKNG8b+xXfFtL2R/M/EJ2cV8Hko4tE6SQ3xve7afcpkTss/sJyRLWzGk9TJA6pDvBpGppM6BJVQlXSgLqEsb9MDjEc9pSd3fIkVKIGUGEBQVdqjiy4XiUcZs7FCviCleyGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f0i9yZYt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744888453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Z80TVPQj2ImieAekdFiPa2qwodXN0cTReqBlA11yA=;
	b=f0i9yZYtD2bYrdGRYDtRr8O24WcebuolmjJEFHr/zJdd9RFRio2Q+1g8oXJUZIArj0/1Oj
	Gfmpn8M4arlep+4DMvlcH1vkveV7UYVOvwURVr0JTD1gECKC6CFo/j0FZO/sCa2N1AbMnR
	IMECSHJjSbr6SsogSirRT7xgg3j38eo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-VEYHXz5kPQan_hNdSOP5dw-1; Thu,
 17 Apr 2025 07:14:10 -0400
X-MC-Unique: VEYHXz5kPQan_hNdSOP5dw-1
X-Mimecast-MFC-AGG-ID: VEYHXz5kPQan_hNdSOP5dw_1744888448
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD6A618001CA;
	Thu, 17 Apr 2025 11:14:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.7])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 626CB18001EA;
	Thu, 17 Apr 2025 11:14:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 5/9] platform/x86: int3472: Make regulator supply name configurable
Date: Thu, 17 Apr 2025 13:13:33 +0200
Message-ID: <20250417111337.38142-6-hdegoede@redhat.com>
In-Reply-To: <20250417111337.38142-1-hdegoede@redhat.com>
References: <20250417111337.38142-1-hdegoede@redhat.com>
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

Since supply-name is a parameter now, drop the fixed
skl_int3472_regulator_map_supplies[] array and instead add lower- and
upper-case mappings of the passed-in supply-name to the regulator.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- At static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2) since the code
  assumes that

Changes in v3:
- Add comment explaining value of 12 in GPIO_REGULATOR_NAME_LENGTH
- Some other comment / commitmsg tweaks

Changes in v2:
- Use E2BIG instead of EOVERFLOW for too long supply-names
---
 .../x86/intel/int3472/clk_and_regulator.c     | 50 ++++++++-----------
 drivers/platform/x86/intel/int3472/common.h   |  8 ++-
 drivers/platform/x86/intel/int3472/discrete.c |  4 +-
 3 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 374a99dea7d1..b7a1abc2919c 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -185,42 +185,37 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
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
+		return -E2BIG;
+	}
+
+	regulator = &int3472->regulator;
+	string_upper(regulator->supply_name_upper, supply_name);
+
+	/* The below code assume that map-count is 2 (upper- and lower-case) */
+	static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2);
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
@@ -229,9 +224,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
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
index 3728f3864a84..b750a309ee16 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -26,7 +26,11 @@
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
 
-#define GPIO_REGULATOR_NAME_LENGTH				21
+/* E.g. "avdd\0" */
+#define GPIO_SUPPPLY_NAME_LENGTH				5
+/* 12 chars for acpi_dev_name() + "-", e.g. "ABCD1234:00-" */
+#define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPPLY_NAME_LENGTH)
+/* lower- and upper-case mapping */
 #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
 
 #define INT3472_LED_MAX_NAME_LEN				32
@@ -85,6 +89,7 @@ struct int3472_discrete_device {
 	struct int3472_gpio_regulator {
 		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
 		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
+		char supply_name_upper[GPIO_SUPPPLY_NAME_LENGTH];
 		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
 		struct regulator_dev *rdev;
 		struct regulator_desc rdesc;
@@ -129,6 +134,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
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


