Return-Path: <linux-media+bounces-28730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A85A70685
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 661D5189CA04
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1617C25D209;
	Tue, 25 Mar 2025 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z21dQGhG"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCAF19D891
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 16:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919279; cv=none; b=tN8rW2wKgRUkSvop5BHz29N3Zowo6jWkfKeyDc6ZxwxuCT4HIO57x4RI9Th6Q/FVaFfIipimLYRShdZ2yFBR6KDBg/leifv5JIj1nPFOhUKQ/ILxtbTKIzOdl9mXcpWgqH2xyU2B+n9NLLoidmy3dCGwA4372E//bTe4fDY0vWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919279; c=relaxed/simple;
	bh=mzvhOUmmE2pyBLgW5xvRMFECzoUoqJynh1Jjw8cZTNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uzx87GuUMUjRSArwxE+Q+PVZ0Qu50wH2zngoYDDxvJrRGfHqQyTDmPMY9zL6FTB6Z7wMcl7EcHYrU1MOnP3rKpUDvPtUh0DvJfV1OZzfrfQKYC1ZnYA/OMl48XoFmiZvjtIN8DpRZcp0sOdHKz1yNzv93jWlTBZFdPKqKEoUeWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z21dQGhG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742919276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EvxcSvlhaoI/aJ/JRIflfzhxtUoaJJl02+txOymeBJw=;
	b=Z21dQGhG4Ian+4XKhxA+Roykr53e+L2BOZ8r4t/yK9qSORMcN5y91GLCqafL/fIuvY7Itx
	ZqH2Yl2getvpCgWfdygdeg2zjH47XDl62lrbXydDBBoEWoXRB+8aC+mwocpbpzw28+Z48x
	KCOYjhx6VAzkcvkf7lYd1sl/9k3OB20=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-qqdXB-CkPIODdV2Qu2zOcA-1; Tue,
 25 Mar 2025 12:14:32 -0400
X-MC-Unique: qqdXB-CkPIODdV2Qu2zOcA-1
X-Mimecast-MFC-AGG-ID: qqdXB-CkPIODdV2Qu2zOcA_1742919270
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94CD0183054F;
	Tue, 25 Mar 2025 16:14:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.136])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7723D180A802;
	Tue, 25 Mar 2025 16:14:13 +0000 (UTC)
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
Subject: [PATCH 7/8] platform/x86: int3472: Add handshake pin support
Date: Tue, 25 Mar 2025 17:13:39 +0100
Message-ID: <20250325161340.342192-8-hdegoede@redhat.com>
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

New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
pin defined in the INT3472 sensor companion device which describes
the sensor's GPIOs.

This pin is primarily used on designs with a Lattice FPGA chip which is
capable of running the sensor independently of the main CPU for features
like presence detection. This pin needs to be driven high to make the FPGA
run the power-on sequence of the sensor. After driving the pin high
the FPGA "firmware" needs 25ms to comlpete the power-on sequence.

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
 .../x86/intel/int3472/clk_and_regulator.c        |  2 ++
 drivers/platform/x86/intel/int3472/common.h      |  2 ++
 drivers/platform/x86/intel/int3472/discrete.c    | 16 +++++++++++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 93033ced8633..f9d4328c61b5 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -187,6 +187,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   unsigned int enable_time,
 				   const char *supply_name,
 				   const char *second_sensor)
 {
@@ -223,6 +224,7 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	}
 
 	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
+	init_data.constraints.enable_time = enable_time;
 	init_data.consumer_supplies = regulator->supply_map;
 	init_data.num_consumer_supplies = j;
 
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 9f995028137b..e1ffc0f6ffe1 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -22,6 +22,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
@@ -136,6 +137,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct gpio_desc *gpio,
+				   unsigned int enable_time,
 				   const char *supply_name,
 				   const char *second_sensor);
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index f6dae82739e5..903b35f999d0 100644
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
@@ -311,11 +316,20 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 			break;
 		case INT3472_GPIO_TYPE_POWER_ENABLE:
-			ret = skl_int3472_register_regulator(int3472, gpio, con_id,
+			ret = skl_int3472_register_regulator(int3472, gpio, 0, con_id,
 							     int3472->quirks.avdd_second_sensor);
 			if (ret)
 				err_msg = "Failed to map regulator to sensor\n";
 
+			break;
+		case INT3472_GPIO_TYPE_HANDSHAKE:
+			/* Setups using a handshake pin need 25 ms delay */
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


