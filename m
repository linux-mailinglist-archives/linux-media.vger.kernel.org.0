Return-Path: <linux-media+bounces-30447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E88A91A53
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A456A7AA703
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3A2238C00;
	Thu, 17 Apr 2025 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SozNbEwB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272BA2356D3
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888469; cv=none; b=aWqtRmNeZGX0FIf7vphA2oQt/dPb3NkNPrubcT8NLHejTCv0R9lI5ADsGi6xzq/jvO1o0Y0S1VUtECTH3POS0bhC9LifIQtmfRAWKSa2VPWvwQdC3wDuOsmWmUuSKssZPfxwXvnHpVeHL9K5B6XuLsgNuDAI/0IlHIfT4h2ZIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888469; c=relaxed/simple;
	bh=w/Mt7SlvyV3QchjI7CrSK4cbdrSwtJE1ru3BETF5cdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8EKmFaXaUBQJQlH9kZigdaMQZZyMnYrB6XHyzm8En/FfWibhbq9VJxIaLyRdbRfnAhm79ThNdOrTF1Z5IGbmEBUR9dhInTVQnDvQ4lX+1ltVzk+O7iMut8hE6RofKBOA/uaeAuXQtIB/IFlP8M83janaLGW4zUvEXw8QlCIelc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SozNbEwB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744888463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWcTrlTsyHs4yeQjujJcs6sZtOp6mXv0zqpJY40ampc=;
	b=SozNbEwB6KQ/F0PsNd91Py5BbPVna/Z1gYC1kpItucJComQs1AGnsBmFkNcXsUs0xvat08
	ZD/1ILKyUFh0HPNE5RZ/mZx9P5aK1bY66JYVWeHo8qLTxIfwJY/jrgldmMK/po+6Cqqz62
	zdiqtaCWOh5myLaTYL/btfZRqk32650=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-249-Q1lbvebFNcKePRL2Bf0EBw-1; Thu,
 17 Apr 2025 07:14:18 -0400
X-MC-Unique: Q1lbvebFNcKePRL2Bf0EBw-1
X-Mimecast-MFC-AGG-ID: Q1lbvebFNcKePRL2Bf0EBw_1744888457
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD670195608E;
	Thu, 17 Apr 2025 11:14:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.7])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 499EB180045C;
	Thu, 17 Apr 2025 11:14:13 +0000 (UTC)
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
Subject: [PATCH v4 7/9] platform/x86: int3472: Prepare for registering more than 1 GPIO regulator
Date: Thu, 17 Apr 2025 13:13:35 +0200
Message-ID: <20250417111337.38142-8-hdegoede@redhat.com>
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

Prepare the discrete code for registering more than 1 GPIO regulator.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- s/n_regulators/n_regulator_gpios/
---
 .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++-------
 drivers/platform/x86/intel/int3472/common.h   | 20 +++++++++++-------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 9f9f2c52e026..33319404f266 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -196,12 +196,17 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	struct regulator_config cfg = { };
 	int i, j;
 
+	if (int3472->n_regulator_gpios >= INT3472_MAX_REGULATORS) {
+		dev_err(int3472->dev, "Too many regulators mapped\n");
+		return -EINVAL;
+	}
+
 	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {
 		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);
 		return -E2BIG;
 	}
 
-	regulator = &int3472->regulator;
+	regulator = &int3472->regulators[int3472->n_regulator_gpios];
 	string_upper(regulator->supply_name_upper, supply_name);
 
 	/* The below code assume that map-count is 2 (upper- and lower-case) */
@@ -222,7 +227,7 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	}
 
 	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
-	init_data.consumer_supplies = int3472->regulator.supply_map;
+	init_data.consumer_supplies = regulator->supply_map;
 	init_data.num_consumer_supplies = j;
 
 	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
@@ -236,14 +241,16 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	cfg.init_data = &init_data;
 	cfg.ena_gpiod = gpio;
 
-	int3472->regulator.rdev = regulator_register(int3472->dev,
-						     &int3472->regulator.rdesc,
-						     &cfg);
+	regulator->rdev = regulator_register(int3472->dev, &regulator->rdesc, &cfg);
+	if (IS_ERR(regulator->rdev))
+		return PTR_ERR(regulator->rdev);
 
-	return PTR_ERR_OR_ZERO(int3472->regulator.rdev);
+	int3472->n_regulator_gpios++;
+	return 0;
 }
 
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472)
 {
-	regulator_unregister(int3472->regulator.rdev);
+	for (int i = 0; i < int3472->n_regulator_gpios; i++)
+		regulator_unregister(int3472->regulators[i].rdev);
 }
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index c3b28424af6e..e88a22a6f81b 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -25,6 +25,7 @@
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
+#define INT3472_MAX_REGULATORS					3
 
 /* E.g. "avdd\0" */
 #define GPIO_SUPPPLY_NAME_LENGTH				5
@@ -88,6 +89,15 @@ struct int3472_discrete_quirks {
 	const char *avdd_second_sensor;
 };
 
+struct int3472_gpio_regulator {
+	/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
+	struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
+	char supply_name_upper[GPIO_SUPPPLY_NAME_LENGTH];
+	char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
+	struct regulator_dev *rdev;
+	struct regulator_desc rdesc;
+};
+
 struct int3472_discrete_device {
 	struct acpi_device *adev;
 	struct device *dev;
@@ -96,14 +106,7 @@ struct int3472_discrete_device {
 
 	const struct int3472_sensor_config *sensor_config;
 
-	struct int3472_gpio_regulator {
-		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
-		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
-		char supply_name_upper[GPIO_SUPPPLY_NAME_LENGTH];
-		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
-		struct regulator_dev *rdev;
-		struct regulator_desc rdesc;
-	} regulator;
+	struct int3472_gpio_regulator regulators[INT3472_MAX_REGULATORS];
 
 	struct int3472_clock {
 		struct clk *clk;
@@ -125,6 +128,7 @@ struct int3472_discrete_device {
 
 	unsigned int ngpios; /* how many GPIOs have we seen */
 	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
+	unsigned int n_regulator_gpios; /* how many have we mapped to a regulator */
 	struct gpiod_lookup_table gpios;
 };
 
-- 
2.49.0


