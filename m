Return-Path: <linux-media+bounces-31999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9829FAAE9C5
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 20:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F242E506903
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 18:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8F9211A2A;
	Wed,  7 May 2025 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gOIRx76o"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F4202C2B
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643684; cv=none; b=CHwmyYFpwv2DEXKqGx6dV5uica20m/QmDtmipqdgjbr6UeSeeJy/xAlyQEqFTLTEvYw0Xaq/KWHBAJrbzeBPGLSnhBpuAvHXh4G/wzzIqz4coJ9Mto10HxLvT0jC4iBjhxIPSkxWnAstyvdQwPbJFUJKZzLahxKxGSifW0riPLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643684; c=relaxed/simple;
	bh=bUGrkoB1KT8Fyd7hJR6GlcpqnFzEmLpwKDu+VbjGzaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFmTeXmaF2kQs3HMPi4X2n09ekYUq2o5c1UuPJ8r9Nn08xiucdghPBictZWDx9qw9ESPMoxbv9aO8gsJfm72mcTItJGtaH9mk8sIUJlU1jB68NXfDeUiVbg4yxsZT/pX+Eoa2lQPMkxCjesL9Pfx1FKlDDa0XbtI2YchEc6sXcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gOIRx76o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746643681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nTAkh4Y/usTv7/ERCK0lI6Kf4eu7qh2L/JGLOoVAtc=;
	b=gOIRx76oa6iMfkr/crwjp8iNHEQOLf5g7599f5GBuTKUOipnIrEh25cakDtkPdlprA2CqE
	RWkPNVpPq0baBZbDI96Qt1NtUe2Dpc1aF9RYwLuqfCYmTXHxQre48ZMsnmHylHdN67H4LM
	MngqD9WeN6yvnWBo4zk3WFwyifnR03A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-34-Cn7QM_2tPOGRMzV41XdabA-1; Wed,
 07 May 2025 14:47:58 -0400
X-MC-Unique: Cn7QM_2tPOGRMzV41XdabA-1
X-Mimecast-MFC-AGG-ID: Cn7QM_2tPOGRMzV41XdabA_1746643677
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E4DFF1800446;
	Wed,  7 May 2025 18:47:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA9F530001B0;
	Wed,  7 May 2025 18:47:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/6] platform/x86: int3472: Stop using devm_gpiod_get()
Date: Wed,  7 May 2025 20:47:33 +0200
Message-ID: <20250507184737.154747-3-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
References: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The intent is to re-use the INT3472 code for parsing Intel camera sensor
GPIOs and mapping them to the sensor for the atomisp driver, which
currently has duplicate code.

On atomisp devices there is no special INT3472 ACPI device, instead
the Intel _DSM to get the GPIO type is part of the ACPI device for
the sensor itself.

To deal with this the mapping is done from ipu_bridge_init() instead of
from a platform-device probe() function, there is no device to tie
the lifetime of the gpiod_get() calls done by the INT3472 code to.

Switch from devm_gpiod_get() to plain gpiod_get() + explicit gpiod_put()
calls, to prepare for the code being re-used in the atomisp driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 6 +++++-
 drivers/platform/x86/intel/int3472/discrete.c          | 6 +++++-
 drivers/platform/x86/intel/int3472/led.c               | 1 +
 include/linux/platform_data/x86/int3472.h              | 1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 4d00494a7670..476ec24d3702 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -182,6 +182,7 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 
 	clkdev_drop(int3472->clock.cl);
 	clk_unregister(int3472->clock.clk);
+	gpiod_put(int3472->clock.ena_gpio);
 }
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
@@ -244,12 +245,15 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	if (IS_ERR(regulator->rdev))
 		return PTR_ERR(regulator->rdev);
 
+	int3472->regulators[int3472->n_regulator_gpios].ena_gpio = gpio;
 	int3472->n_regulator_gpios++;
 	return 0;
 }
 
 void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472)
 {
-	for (int i = 0; i < int3472->n_regulator_gpios; i++)
+	for (int i = 0; i < int3472->n_regulator_gpios; i++) {
 		regulator_unregister(int3472->regulators[i].rdev);
+		gpiod_put(int3472->regulators[i].ena_gpio);
+	}
 }
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index d0938da0a591..808d75e8deda 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -117,7 +117,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 		return ERR_PTR(ret);
 
 	gpiod_add_lookup_table(lookup);
-	desc = devm_gpiod_get(int3472->dev, con_id, GPIOD_OUT_LOW);
+	desc = gpiod_get(int3472->dev, con_id, GPIOD_OUT_LOW);
 	gpiod_remove_lookup_table(lookup);
 
 	return desc;
@@ -340,6 +340,10 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			ret = -EINVAL;
 			break;
 		}
+
+		if (ret)
+			gpiod_put(gpio);
+
 		break;
 	default:
 		dev_warn(int3472->dev,
diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index c5588e143f7d..f1d6d7b0cb75 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -56,4 +56,5 @@ void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
 
 	led_remove_lookup(&int3472->pled.lookup);
 	led_classdev_unregister(&int3472->pled.classdev);
+	gpiod_put(int3472->pled.gpio);
 }
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 4cf02df6f753..0a835cc85c67 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -99,6 +99,7 @@ struct int3472_gpio_regulator {
 	struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
 	char supply_name_upper[GPIO_SUPPLY_NAME_LENGTH];
 	char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
+	struct gpio_desc *ena_gpio;
 	struct regulator_dev *rdev;
 	struct regulator_desc rdesc;
 };
-- 
2.49.0


