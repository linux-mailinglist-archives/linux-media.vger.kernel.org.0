Return-Path: <linux-media+bounces-29263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9BA7967E
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAAF8188EDE7
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5257E1F0E25;
	Wed,  2 Apr 2025 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUep1SOD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4531EFFA6
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 20:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625547; cv=none; b=lLo4T2ymERic8SAUSDMNyWvU0wPiuz80+Trk9tAA+NBnJqzl0hDTwErH8awOUS/SNeQf42131F/VCa4wA2G3l0QYNRjHVpABIO7iMvJBMmoQCKZyzUIJJlC+3sWb4zVufPGzKj0u5wsM8u0Oa0nhNEDDQ1bPDst641UHfxV5Eik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625547; c=relaxed/simple;
	bh=u8UWprpsdaPTalSgiWxzHJwMqy71xI6usXClkawwtpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DA90wYaLLCeb7BQAgyLyb207zUKWM08OZs/TNq9MTKHLH43WKMgcpWARWISPSDqWN+Dbd3C7MHG4gwSWsmmDcgmbKmldJPij5+VkF9MQHzGnIwq1iUCpBwX/YHPgom5TRBIUC1gt1sHewGmsG6GNFCikIfw6yoGrJrCC4zVsXck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUep1SOD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743625544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5ufhKn5QBN9m9M0Pk0RsYAaOR3uTuC+oqjYGr3KL70=;
	b=BUep1SODFQd66dE80uxKbRCbGtvCTpxaPwFBDV/J+m/8+OgJnDRHMTQYdO3kjI/AIFixDi
	8fJ/9kTpbkc0wzsT38w9M9z6QW1Ct1eZP53U6hvvdr5SUnFynjnXRGEjofrQ69Btl/O2t9
	Ok7LR9hX9ZebmmiHPU1si7sYkzFpmvA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-447-HQcwHMZAONmmJbh6s3p2IQ-1; Wed,
 02 Apr 2025 16:25:41 -0400
X-MC-Unique: HQcwHMZAONmmJbh6s3p2IQ-1
X-Mimecast-MFC-AGG-ID: HQcwHMZAONmmJbh6s3p2IQ_1743625540
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D4D51800258;
	Wed,  2 Apr 2025 20:25:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.44.32.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBB29180176C;
	Wed,  2 Apr 2025 20:25:36 +0000 (UTC)
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
Subject: [PATCH v2 6/9] platform/x86: int3472: Avoid GPIO regulator spikes
Date: Wed,  2 Apr 2025 22:25:07 +0200
Message-ID: <20250402202510.432888-7-hdegoede@redhat.com>
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

Avoid the GPIO controlling the avdd regulator being driven low or high
for a very short time leading to spikes by adding an enable delay of 2 ms
and a minimum off to on delay of also 2 ms.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 7 ++++---
 drivers/platform/x86/intel/int3472/common.h            | 8 +++++++-
 drivers/platform/x86/intel/int3472/discrete.c          | 4 +++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index a08b953b597a..b4af17e8dcaf 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -187,6 +187,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   unsigned int enable_time,
 				   const char *supply_name,
 				   const char *second_sensor)
 {
@@ -224,9 +225,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	snprintf(regulator->regulator_name, sizeof(regulator->regulator_name), "%s-%s",
 		 acpi_dev_name(int3472->adev), supply_name);
 
-	int3472->regulator.rdesc = INT3472_REGULATOR(
-						int3472->regulator.regulator_name,
-						&int3472_gpio_regulator_ops);
+	regulator->rdesc = INT3472_REGULATOR(regulator->regulator_name,
+					     &int3472_gpio_regulator_ops,
+					     enable_time, GPIO_REGULATOR_OFF_ON_DELAY);
 
 	cfg.dev = &int3472->adev->dev;
 	cfg.init_data = &init_data;
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index b0638c29d847..271c23adb8ab 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -30,17 +30,22 @@
 #define GPIO_REGULATOR_NAME_LENGTH				(12 + GPIO_SUPPPLY_NAME_LENGTH)
 /* lower- + upper-case mapping */
 #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
+/* Ensure the GPIO is driven low/high for at least 2 ms before changing */
+#define GPIO_REGULATOR_ENABLE_TIME				(2 * USEC_PER_MSEC)
+#define GPIO_REGULATOR_OFF_ON_DELAY				(2 * USEC_PER_MSEC)
 
 #define INT3472_LED_MAX_NAME_LEN				32
 
 #define CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET			86
 
-#define INT3472_REGULATOR(_name, _ops)				\
+#define INT3472_REGULATOR(_name, _ops, _enable_time, _off_on_delay) \
 	(const struct regulator_desc) {				\
 		.name = _name,					\
 		.type = REGULATOR_VOLTAGE,			\
 		.ops = _ops,					\
 		.owner = THIS_MODULE,				\
+		.enable_time = _enable_time,			\
+		.off_on_delay = _off_on_delay,			\
 	}
 
 #define to_int3472_clk(hw)					\
@@ -132,6 +137,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   unsigned int enable_time,
 				   const char *supply_name,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index f6dae82739e5..a2db4fae0e6d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -311,7 +311,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			ret = skl_int3472_register_regulator(int3472, gpio, con_id,
+			ret = skl_int3472_register_regulator(int3472, gpio,
+							     GPIO_REGULATOR_ENABLE_TIME,
+							     con_id,
 							     int3472->quirks.avdd_second_sensor);
 			if (ret)
 				err_msg = "Failed to map regulator to sensor\n";
-- 
2.49.0


