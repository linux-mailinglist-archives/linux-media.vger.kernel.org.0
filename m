Return-Path: <linux-media+bounces-30346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C7CA8B968
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50B6417292D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C3E13D62B;
	Wed, 16 Apr 2025 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWEsIw53"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B800713D51E
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807290; cv=none; b=qdWr99zMLLMh6WUORROGRbYZqiXr6lM2NMM6RUQirx+QY+glEu+EGJiviBBV3NvDMOjhVdg1axU/EB4GL6kaYJClxWxiwdnqXYu5Kvi76lVAhAr9DHsMCPuLWzQj2Yyw2ia1IfzMSL+DVUCYoGMK6cAHe9rhhx+BzcX3C5A48+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807290; c=relaxed/simple;
	bh=DVGNla1NwW0IMkCERrCbvQ1AC0PQRtmfbn0Q+WlnVhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gs5l/1bXWuK8ZRh+lHRvJen5uqbD4ac+ganCyQbTN8EPYsBmkK6z9ER5PrRtbcCJe75905PfK43Y3OlDXBxATJgx/lxDDMSQJupjn3Uv15cW8sQ64vyfKh4zGxjA2mtJWNrBf9mzRlfsR5HDaTR7NT7XAhdWJOkaseRPVQux50k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DWEsIw53; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xyf6kdT/eLhhDnTpA0OPLnywrrg3EkNunHicLOFgIfw=;
	b=DWEsIw53AwJ8TrXldlKMJjxvYjr60ne/ymmOQMWHR2y3LrTLBgKc56Ri+OOW6mVzoNQEvP
	lfw2T59xR2DkpE36NIOHVHsT0NRnzwsJJ02sLhtflgAj5uzQIDmltwa+dasoZJ4FwKpJeG
	WuIJhb61rdmQn0DXTk7/LjituQyP95U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-IjHZ7vlCMJGAcDWJWnsR8g-1; Wed,
 16 Apr 2025 08:41:23 -0400
X-MC-Unique: IjHZ7vlCMJGAcDWJWnsR8g-1
X-Mimecast-MFC-AGG-ID: IjHZ7vlCMJGAcDWJWnsR8g_1744807282
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0AAD81956086;
	Wed, 16 Apr 2025 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 105E2195608D;
	Wed, 16 Apr 2025 12:41:17 +0000 (UTC)
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
Subject: [PATCH v3 8/9] platform/x86: int3472: Add handshake pin support
Date: Wed, 16 Apr 2025 14:40:36 +0200
Message-ID: <20250416124037.90508-9-hdegoede@redhat.com>
In-Reply-To: <20250416124037.90508-1-hdegoede@redhat.com>
References: <20250416124037.90508-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
pin defined in the INT3472 sensor companion device which describes
the sensor's GPIOs.

This pin is primarily used on designs with a Lattice FPGA chip which is
capable of running the sensor independently of the main CPU for features
like presence detection. This pin needs to be driven high to make the FPGA
run the power-on sequence of the sensor. After driving the pin high,
the FPGA "firmware" needs 25ms to complete the power-on sequence.

Add support for this modelling the handshake pin as a GPIO driven "dvdd"
regulator with a 25 ms enable time. This model was chosen because:

1. Sensor chips don't have a handshake pin, so we need to abstract this
   in some way which does not require modification to the sensor drivers,
   sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
   is normal. So this will work to get the right value set to the handshake
   pin without requiring sensor driver modifications.

2. Sensors typically wait only a small time for the sensor to power-on
   after de-asserting reset. Not the 25ms the Lattice chip requires.
   Using the regulator framework's enable_time allows hiding the need for
   this delay from the sensor drivers.

Link: https://lore.kernel.org/platform-driver-x86/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/
Link: https://bugzilla.redhat.com/show_bug.cgi?id=2341731
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Small commitmsg improvements
---
 .../platform/x86/intel/int3472/clk_and_regulator.c |  1 +
 drivers/platform/x86/intel/int3472/common.h        |  1 +
 drivers/platform/x86/intel/int3472/discrete.c      | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 4f6e119394d7..143d4670d3a6 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -224,6 +224,7 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	}
 
 	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
+	init_data.constraints.enable_time = enable_time;
 	init_data.consumer_supplies = regulator->supply_map;
 	init_data.num_consumer_supplies = j;
 
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index e88a22a6f81b..56fb91dcc130 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -22,6 +22,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index a2db4fae0e6d..4dddba4e1fde 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -191,6 +191,10 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
 		*con_id = "avdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_HANDSHAKE:
+		*con_id = "dvdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	default:
 		*con_id = "unknown";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -290,6 +294,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
+	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio)) {
 			ret = PTR_ERR(gpio);
@@ -318,6 +323,15 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			if (ret)
 				err_msg = "Failed to map regulator to sensor\n";
 
+			break;
+		case INT3472_GPIO_TYPE_HANDSHAKE:
+			/* Setups using a handshake pin need 25 ms enable delay */
+			ret = skl_int3472_register_regulator(int3472, gpio,
+							     25 * USEC_PER_MSEC,
+							     con_id, NULL);
+			if (ret)
+				err_msg = "Failed to map regulator to sensor\n";
+
 			break;
 		default: /* Never reached */
 			ret = -EINVAL;
-- 
2.49.0


