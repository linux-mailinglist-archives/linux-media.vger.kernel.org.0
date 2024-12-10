Return-Path: <linux-media+bounces-23097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D874E9EBA7B
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A126283DA9
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954E922B598;
	Tue, 10 Dec 2024 19:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KOLGOKD/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B30022ACE9
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733860590; cv=none; b=bSIR55d6djcu5lGftPUFwICxoy5yTaaIiH0N7AB2SWih7PLcQbL4xc4ln51nMYS3ZA7VoDnxVK0Hki812OGoR1e/dJfq2Ce6oMqnJ9clpddbRsX40O9Fjk10mq3RH/gp3WDudE8oSsaiy4I4MbxfYxPucOLVu1NhMZdA1sQVth4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733860590; c=relaxed/simple;
	bh=ukuL0J/MKKzCt1mPhJR16PHXljadgzBKa2hSze0hLo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syPPgXZTX8cvK6MdHdyJ72ZEhw0ESXdJA0aMMidP7dgSXRdtUnwjgq12EvXNcy+TOdLDFBA4TzD+JT9aBrQVYxnWtgn4q+Xld+kggSlIrNSDs+LhfGbWo6BZBwjZ23K5pmOlvLB8z/BNy5iBl6fwiTF1l95DKt9CdZ34klJADKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KOLGOKD/; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afdd15db60so1147379137.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 11:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733860586; x=1734465386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dngrOjvFkokaO//xpC5ashvyb8OkGy64lo3N8QG5GXU=;
        b=KOLGOKD/qaXR7H25UZLEBaHjq2UOt9wZwomhp1XKtzKewScYKBofXHPpsnMJZe+ifA
         5HP4JV06jQ+vtM1+bAtWxWPG+JLWI7gypWpG2eAeQTrxFyFevK3jzn1/TO159zsY8Gsr
         Be/GAgMEljUWHJYqNzsNKhd1N0/gBjDWG1i20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733860586; x=1734465386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dngrOjvFkokaO//xpC5ashvyb8OkGy64lo3N8QG5GXU=;
        b=cjq5gtkvNOKb/i9RoMbjUp2ym464h9E4MnviZ4qiEzExHPQIFTYzMkIXIFDUXBzjqw
         h+fjVj4fHsDnwoF6koGKR1kUqA6OEaJQqLQwR8prgqHSrkJ24MGYpCY5iTrph9eEQ7x2
         CXUsV1SeyrJWdtfOvrh7yiob0KH7Xo92CJZi8LRXEyCUBTBzA202tx2H+8vsK5d9R4h4
         7Hus3FxQUkF83y2mpEHx13pf51oyGsKcxA7Crb49rJyjKnb9Rxn8KK72mV+N9iWmJm2P
         rWfdc1ZzG5xxpggP7Rn+b7SrA4oup6+TUEj+vcXtricQgar3f+o2cpIIVNywyC6Ked/7
         Ye/w==
X-Forwarded-Encrypted: i=1; AJvYcCXLS7j97DNzD8dILSgR1J3HhFA/aZ6g7DGjo7ABseEiG1J4Z62D2lF0dmIutVpzIbH87J0kpE6SrjoHmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFELRq0Gm3MXQ/pd8M3bxETgBsmT5XiftvqnGzzs8UwVcWS+Av
	uuOvMppe52jo+siaqpTjNrx2L400TIfj1Cq0ogxkJ1c7N8g2xEWUp/WTAy9ssw==
X-Gm-Gg: ASbGncsqF4a2wxitNubcP5zTMm42WCU8pahkZL9xIO914qIG8WT/z4zlXKFKdEOq01Y
	RiKNtQ1OPhX7tom2hi6P1MkdlN4w3BgUJLmaZ22rl7bsTD+LzQNx68BLM1933q+g4+ipVTa/Lis
	IVxX0O/EiSuaRuG1R+bpkneg+ROBX8lYJuNOOUDHE7ra4D7C/x+lbjO7JMvZGQeUQGnv1eMXg35
	SqiLnh7yKfEon1kTwX8zihebeOP6svcTD9DOz9L1gr+TZ/k1rlcf97sW5jMlQEHhmFYBIhcYyJK
	bZ7fQ+Yjj2IzIA/V55WkimbUkU5t
X-Google-Smtp-Source: AGHT+IFCnfB8ydByqooGet6PwgafKh6LnL27DqPrsLgjTnlJDdhRhasDusXRsUEK8BwIHAK84lpL7Q==
X-Received: by 2002:a05:6102:3714:b0:4b0:4d6:bff1 with SMTP id ada2fe7eead31-4b1290040cdmr739077137.14.1733860586240;
        Tue, 10 Dec 2024 11:56:26 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2ba7dc70sm1279522241.15.2024.12.10.11.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:56:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 19:56:04 +0000
Subject: [PATCH v3 7/7] media: ipu-bridge: Remove unneeded conditional
 compilations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-fix-ipu-v3-7-00e409c84a6c@chromium.org>
References: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
In-Reply-To: <20241210-fix-ipu-v3-0-00e409c84a6c@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The ACPI headers have introduced implementations for some of their
functions when the kernel is not configured with ACPI.

Let's use them instead of our conditional compilation. It is easier to
maintain and less prone to errors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index be82bc3e27d0..1db994338fdf 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -2,6 +2,7 @@
 /* Author: Dan Scally <djrscally@gmail.com> */
 
 #include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
@@ -107,7 +108,6 @@ static const char * const ipu_vcm_types[] = {
 	"lc898212axb",
 };
 
-#if IS_ENABLED(CONFIG_ACPI)
 /*
  * Used to figure out IVSC acpi device by ipu_bridge_get_ivsc_acpi_dev()
  * instead of device and driver match to probe IVSC device.
@@ -127,11 +127,11 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
 		const struct acpi_device_id *acpi_id = &ivsc_acpi_ids[i];
 		struct acpi_device *consumer, *ivsc_adev;
 
-		acpi_handle handle = acpi_device_handle(adev);
+		acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
 		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
 			/* camera sensor depends on IVSC in DSDT if exist */
 			for_each_acpi_consumer_dev(ivsc_adev, consumer)
-				if (consumer->handle == handle) {
+				if (ACPI_PTR(consumer->handle) == handle) {
 					acpi_dev_put(consumer);
 					return ivsc_adev;
 				}
@@ -139,12 +139,6 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
 
 	return NULL;
 }
-#else
-static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev)
-{
-	return NULL;
-}
-#endif
 
 static int ipu_bridge_match_ivsc_dev(struct device *dev, const void *adev)
 {
@@ -261,9 +255,8 @@ static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_dev
 	struct acpi_pld_info *pld = NULL;
 	acpi_status status = AE_ERROR;
 
-#if IS_ENABLED(CONFIG_ACPI)
-	status = acpi_get_physical_device_location(adev->handle, &pld);
-#endif
+	status = acpi_get_physical_device_location(ACPI_PTR(adev->handle),
+						   &pld);
 	if (ACPI_FAILURE(status)) {
 		dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
@@ -498,9 +491,7 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 	if (sensor->csi_dev) {
 		const char *device_hid = "";
 
-#if IS_ENABLED(CONFIG_ACPI)
 		device_hid = acpi_device_hid(sensor->ivsc_adev);
-#endif
 
 		snprintf(sensor->ivsc_name, sizeof(sensor->ivsc_name), "%s-%u",
 			 device_hid, sensor->link);
@@ -671,11 +662,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 	struct acpi_device *adev = NULL;
 	int ret;
 
-#if IS_ENABLED(CONFIG_ACPI)
 	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-#else
-	while (true) {
-#endif
 		if (!ACPI_PTR(adev->status.enabled))
 			continue;
 
@@ -768,15 +755,10 @@ static int ipu_bridge_ivsc_is_ready(void)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
-#if IS_ENABLED(CONFIG_ACPI)
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
 		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
-#else
-		while (false) {
-			sensor_adev = NULL;
-#endif
 			if (!ACPI_PTR(sensor_adev->status.enabled))
 				continue;
 

-- 
2.47.0.338.g60cca15819-goog


