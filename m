Return-Path: <linux-media+bounces-21808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C5E9D5C60
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 10:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4802CB22FF9
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499051DF723;
	Fri, 22 Nov 2024 09:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K4JcKc1e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F951DEFF7
	for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732268912; cv=none; b=XU8THN3T+nVAier2rZfYcD6xFYO2g+WCeRfkoCnkfTu86Sq5xEo9JhFjQOjXVFn6++QxeGDHC3SltPC+ZAbWaT8lzE7SLT9txuTYADukNjXMTTKYzKjK7OcF3Ak6qwG8m3LjpWbAyg0NFCEXsUsALlAG2lsF1arTrUlUpDqdDck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732268912; c=relaxed/simple;
	bh=/xyrOk13WfYwXnzGF1BEMgqEZvLsICd5gWhhYG2cImQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQnUkGdzyP5wxmsrzD6eXnOQrjSLPnSKyARPmFSS3cedYMbLbn9Oxsa4NBMJE5R2pIHn6NJbrCDx1SsU8O9a/d4m1VLn3YEmUYvGwSz+HGuxXGmNYxaOh26z8kySo1DPI4eNyr9u5KarvfOXM6c7h1Pefmhb8BgJ0aVUj0vFJZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K4JcKc1e; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-460b16d4534so11782621cf.3
        for <linux-media@vger.kernel.org>; Fri, 22 Nov 2024 01:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732268909; x=1732873709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKV0qKpenqq8YefMBn8axPBP/1pf6x8COWK/EGNLUhk=;
        b=K4JcKc1emtFZL8AasidnVN6IgGI894tWJKkBfVZw+HSi3ezVGLAwmrBzMWDkck6+iW
         pDdzQo5o7QbSRic9VOi/pDSh2Ds0S34oDo/CrG4pTvpaQ8fpk2yy1D7UonxKxXh9njAE
         OZCJpJ4o2hbYu1CN8gTr0RubqdaQQawl0rriQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268909; x=1732873709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKV0qKpenqq8YefMBn8axPBP/1pf6x8COWK/EGNLUhk=;
        b=bP9S7hUdsHkoM+X/iQzR6FcnWVlPY5xRjd61j4mekkX89ApptggJz7mTQaIgURW0EY
         V5eEgnOv985R1AgXnwzGLNcOoqcdXrWHGdftmMkov1Y0Om1s1pIye4ayvgXQ/VTRFWfw
         Nt1vU2to/GEz3iZWJk+VcXcWWpgoPca6JlYaldNe6xRoyTzmWtZ9t2sGXKTh9fxtQbkj
         IDly9jLkfmhMkyXWFCZLN1YLWIuwmi71/TnqpDUO2kaMPaXHi6ekRkyUJk3r3ngrofk6
         B8h9LtrSZeIKW7YAiQ7zmztSd9nHVD8uiGjZnwZk8XHu+UKRthr6v0gcCEt4pzOjJQeD
         AXKg==
X-Forwarded-Encrypted: i=1; AJvYcCXPfyctiMhYqZGryMCs/TZIa/liKpyUp981TgpJSxUbIzuaFzLxSpo7XmO6U/MvwWnn6iUSaKAoiuL+aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XvtV1wU3n4qSl7XjJMfXL3JZSwkfsGHg5ioXc0KqrlM7rzab
	T6qCTkbAWXna0kGUrvommelGSJv4cribC0b7KEXNuTR990+oI2wP34961OiQgQ==
X-Gm-Gg: ASbGncspDvwLMBL6cHnBUMUREENyPj808xGJG3Pp0aLywETPOwHagLsDR+08HeTn/f9
	J8vJfuEic5x5vbKlM0nWAx4sRjHkO511TYMJxZejX4xvNWcARDgBfIxvMC9Tpne0uQdtDGbkEb6
	fitmbJGELDblxNjdWmyR/FJkaKQ0BGE20jhCdP+1Qqnr5/FCp8FR7vFCLI5k7niXqvsTH3idXme
	hPH+6ZEcWxYjSvlQT00kig6ea2PrnCefVDuC9H0Cse+WXwd8UcDV0J93hhyvZlEGBJ0J+NASDKR
	tjgQUY+MNkme1SLtAO3t5vB5
X-Google-Smtp-Source: AGHT+IGkqqWnODk2xignRvaov7QmeTL3jw/lsAM7Pyz5eBZ/ng+3qbMNUUQf4HXvA77w2WK8NKWLDQ==
X-Received: by 2002:ac8:5ac6:0:b0:461:1532:d769 with SMTP id d75a77b69052e-4653d63aebamr22893621cf.54.1732268909452;
        Fri, 22 Nov 2024 01:48:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c47f124sm9282731cf.62.2024.11.22.01.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:48:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Nov 2024 09:48:04 +0000
Subject: [PATCH v2 7/7] media: ipu-bridge: Remove unneeded conditional
 compilations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-fix-ipu-v2-7-bba65856e9ff@chromium.org>
References: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
In-Reply-To: <20241122-fix-ipu-v2-0-bba65856e9ff@chromium.org>
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
 drivers/media/pci/intel/ipu-bridge.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index be82bc3e27d0..6bdf42f6769f 100644
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
@@ -131,7 +131,7 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
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
@@ -261,9 +255,7 @@ static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_dev
 	struct acpi_pld_info *pld = NULL;
 	acpi_status status = AE_ERROR;
 
-#if IS_ENABLED(CONFIG_ACPI)
 	status = acpi_get_physical_device_location(adev->handle, &pld);
-#endif
 	if (ACPI_FAILURE(status)) {
 		dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
@@ -498,9 +490,7 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 	if (sensor->csi_dev) {
 		const char *device_hid = "";
 
-#if IS_ENABLED(CONFIG_ACPI)
 		device_hid = acpi_device_hid(sensor->ivsc_adev);
-#endif
 
 		snprintf(sensor->ivsc_name, sizeof(sensor->ivsc_name), "%s-%u",
 			 device_hid, sensor->link);
@@ -671,11 +661,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 	struct acpi_device *adev = NULL;
 	int ret;
 
-#if IS_ENABLED(CONFIG_ACPI)
 	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-#else
-	while (true) {
-#endif
 		if (!ACPI_PTR(adev->status.enabled))
 			continue;
 
@@ -768,15 +754,10 @@ static int ipu_bridge_ivsc_is_ready(void)
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
2.47.0.371.ga323438b13-goog


