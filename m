Return-Path: <linux-media+bounces-29264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6DA79680
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C4E3B43FC
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B07A1F12F1;
	Wed,  2 Apr 2025 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MsZvSPCJ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A081F03EC
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 20:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625552; cv=none; b=Eb0Y1akbk6HQ7xn/PkoDi8ljqVbuDRljHtkyz9jueOtKy3KWTo/BWXc6d5ns8VBnF0ieJ4mrY53yma8E94orUaRCnKt6oYDKxJqhod2IXuUsf6d2N5LvV+UQ0YB690GI00wTNGy4IhTujaaBU/IRqC8DNiFop8lWxYiS/XQZ3wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625552; c=relaxed/simple;
	bh=SVD2w4QGVh4uJ0SVDyLK/lhxEyhaAXuPX/5EBwwu6GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWK8mjXCweWEW4qoQrQ/zQpVP4Y4dTUkBQg2OoSlDtOSBhzUQBDknpH2Xi4a8jK+imweuoigvlQseU6ma6ysjirGCk99FX5QrwJ78eox2J8o2OXMMOClj/LP4r1elX6sHiaki/4HgPgIolgBVIjPdjf9YzaMiDpQ0jM4v5qt3ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MsZvSPCJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743625549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w9TaAvPhQEZWFEAMQ2AMQ1wStg+meSTLXQAcrOf4rcw=;
	b=MsZvSPCJCD8dQ75WzAMxiDnS5ucGHSqW9XWrKUqMuFqDTIkcodylFWvbcvRVa6kyGzlQjg
	K9sKGOnkIMqhnuJ2jGOS0VRMlj6BkSRu+zkyuMLG7/Pa3BZl23QUTfxbeZ5hYDT7fMt1RQ
	RtmafCHIJu6KzJuaFzs2APkLLN6cEwk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-kTNdbE__P96-Xn8UzWDjHg-1; Wed,
 02 Apr 2025 16:25:45 -0400
X-MC-Unique: kTNdbE__P96-Xn8UzWDjHg-1
X-Mimecast-MFC-AGG-ID: kTNdbE__P96-Xn8UzWDjHg_1743625544
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D7FF180AB1C;
	Wed,  2 Apr 2025 20:25:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.44.32.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A95541801752;
	Wed,  2 Apr 2025 20:25:40 +0000 (UTC)
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
Subject: [PATCH v2 7/9] platform/x86: int3472: Prepare for registering more then 1 GPIO regulator
Date: Wed,  2 Apr 2025 22:25:08 +0200
Message-ID: <20250402202510.432888-8-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-1-hdegoede@redhat.com>
References: <20250402202510.432888-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Prepare the discrete code for registering more then 1 GPIO regulator.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 21 ++++++++++++-------
 drivers/platform/x86/intel/int3472/common.h   | 20 +++++++++++-------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index b4af17e8dcaf..e4bb93892104 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -196,12 +196,17 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	struct regulator_config cfg = { };
 	int i, j;
 
+	if (int3472->n_regulators >= INT3472_MAX_REGULATORS) {
+		dev_err(int3472->dev, "Too many regulators mapped\n");
+		return -EINVAL;
+	}
+
 	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {
 		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);
 		return -E2BIG;
 	}
 
-	regulator = &int3472->regulator;
+	regulator = &int3472->regulators[int3472->n_regulators];
 	string_upper(regulator->supply_name_upper, supply_name);
 
 	for (i = 0, j = 0; i < GPIO_REGULATOR_SUPPLY_MAP_COUNT; i++) {
@@ -219,7 +224,7 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	}
 
 	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
-	init_data.consumer_supplies = int3472->regulator.supply_map;
+	init_data.consumer_supplies = regulator->supply_map;
 	init_data.num_consumer_supplies = j;
 
 	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
@@ -233,14 +238,16 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	cfg.init_data = &init_data;
 	cfg.ena_gpiod = gpio;
 
-	int3472->regulator.rdev = regulator_register(int3472->dev,
-						     &int3472->regulator.rdesc,
-						     &cfg);
+	regulator->rdev = regulator_register(int3472->dev, &regulator->rdesc, &cfg);
+	if (IS_ERR(regulator->rdev))
+		return PTR_ERR(regulator->rdev);
 
-	return PTR_ERR_OR_ZERO(int3472->regulator.rdev);
+	int3472->n_regulators++;
+	return 0;
 }
 
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472)
 {
-	regulator_unregister(int3472->regulator.rdev);
+	for (int i = 0; i < int3472->n_regulators; i++)
+		regulator_unregister(int3472->regulators[i].rdev);
 }
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 271c23adb8ab..cd94346270c5 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -25,6 +25,7 @@
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
+#define INT3472_MAX_REGULATORS					3
 
 #define GPIO_SUPPPLY_NAME_LENGTH				5
 #define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPPLY_NAME_LENGTH)
@@ -81,6 +82,15 @@ struct int3472_discrete_quirks {
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
@@ -89,14 +99,7 @@ struct int3472_discrete_device {
 
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
@@ -118,6 +121,7 @@ struct int3472_discrete_device {
 
 	unsigned int ngpios; /* how many GPIOs have we seen */
 	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
+	unsigned int n_regulators; /* how many have we mapped to a regulator */
 	struct gpiod_lookup_table gpios;
 };
 
-- 
2.49.0


