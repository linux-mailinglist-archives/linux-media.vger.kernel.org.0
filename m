Return-Path: <linux-media+bounces-23509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CD9F3CB4
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 22:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02E3018900A9
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 21:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31511DE2D0;
	Mon, 16 Dec 2024 21:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GJPwkgNF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C24B1DB958
	for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383855; cv=none; b=HSYv9PQBiCcjgVcACtEl1gukA9ZL9cOONqMoLPzAgmRd1SINrMbE7jguyTyQCPgjtB55vrdeMeOWkEGcrrt06Tkm1iank/+VS33wyrLFQcKGoMpjmjeDrxliXOPTV/SeH1P9wY0OR8JfTnkUQhLuYf0pvtXZVs8c4D+H54cuUaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383855; c=relaxed/simple;
	bh=IKB58y4snq/gqAR94o4C+T0eqQtkn7ecDZk3e6CYE68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4W9mwy76o+BG53LF+qWbJ2ezqfnBAA3YAI/AhJNFQ+SnnvBXnp1m4Px4ladfuvN1LsEKY3XzLHUf5/v2X1LBOvWKMMdsnDuIMK97ekjBDpuUjTZDNEWno9VQF2R1qIJr/it9zu3vwQHfn/HTXqTcbI/LwZ6aWJI4yrqaoJoUgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GJPwkgNF; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467918c360aso55124831cf.0
        for <linux-media@vger.kernel.org>; Mon, 16 Dec 2024 13:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383852; x=1734988652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSt2f8yebuqnlO+DsTFByKH2G3GRiRhWURC3O1KFqeY=;
        b=GJPwkgNFlEuz0Eo+vpfVsbPktf5ec6XKKDuEt1RQ1hOB+pdMWdEJCIRPeOOXTVeD+w
         r8i5ieBBTYy7w/lHAIqLfHDnPQYyxUZjRmC9ayjDAy0tNczRtAvk9T6UpMazzqA33S8W
         Z3PJNYgbgNXTLQ9SEwXsnkjyRnLP7pAENC8LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383852; x=1734988652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSt2f8yebuqnlO+DsTFByKH2G3GRiRhWURC3O1KFqeY=;
        b=YDmyw2Ku01klQuD3P90alo9oMitKp2/sVagugxBXkIhRgiXL7FRbOUVHih+oZAfWNF
         p2gEKoZ+fytUxhUFGfw17IznxUm4VNTizAbvCCqzWjTL3tJDlkXuxMm3waf5RYAsG4zT
         d0qxD/GAfO26G0N/QSL8xka1Yj6mVF2vvYq9bac+nwY+RlZT3bJZGh6WUs4VMxjuyeCE
         keEsEAJKjjdO0Cb/UcX5SbkMdRkGM1mxh8a3BhQ0H/1Qd9/HC8uFfR0dsf1Y/BbfLKhE
         q4u40y8IyGs8gZjzz9FCMR2hP268dS4yghQiLvVfQqT+guBYGH9GmDhADFuQD+tuk+/2
         54dA==
X-Forwarded-Encrypted: i=1; AJvYcCXoS+0CWwg6cvz2ZHIdPOrzG2I8JGYTYRsawEHP9d7MAO7TzUup6VghO4ZMCewh6N5NecswNVYFigmVFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPiixVr15MixHZp6opp4CSQSjAMEa4OOtGZL769ePLBiDTlAjO
	QV/JLpvXqjQm3eYai0FODdgpm/ku/SwyomWLuK5gQ1B01kA+SLQu7sGC411Y4Q==
X-Gm-Gg: ASbGnctAQB8xjtiRNNN3n073wMmHrH6C9Z/zaT6znb0w49EhHOOMyn8pzh4MG0XHsHN
	7jwo7eoS3GYHF5aAAcNnRiywUIErHCr86cag12nx7QbHu6SoCDi3jiIE/uWBNHhmdItCl3bhOAa
	fHecRCcE+Tw8jXM6v+oCIurlj50WmCZQMKmUvZt0kY2TWYAkFBak7Mb8dKNBp9XWgt3QwJgEOBJ
	gXC7yCTJpxbuuE2rYW68cyB/VEZcbIH9gP2CJ4tuQBjnSjjxjQhcRl8TbV1xlNjfNvcWWINDoqr
	H5aJlb+J+CkWva4kKVXWtmNoATfc6EM=
X-Google-Smtp-Source: AGHT+IGA7OE2/+AFr8NJQp1+beNCjHTix5HDCvzlrGBd1KJenMxv6YV5fSV7uyPrfaZdLlcoEJkjrQ==
X-Received: by 2002:ac8:5a93:0:b0:466:a983:a15a with SMTP id d75a77b69052e-467a581d253mr223743851cf.42.1734383852093;
        Mon, 16 Dec 2024 13:17:32 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:21 +0000
Subject: [PATCH v5 7/7] media: ipu-bridge: Remove unneeded conditional
 compilations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-7-3d6b35ddce7b@chromium.org>
References: <20241216-fix-ipu-v5-0-3d6b35ddce7b@chromium.org>
In-Reply-To: <20241216-fix-ipu-v5-0-3d6b35ddce7b@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.13.0

The ACPI headers have introduced implementations for some of their
functions when the kernel is not configured with ACPI.

Let's use them instead of our conditional compilation. It is easier to
maintain and less prone to errors.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 6cc2614b8f86..be84c100d732 100644
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
@@ -259,12 +253,8 @@ static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_dev
 {
 	enum v4l2_fwnode_orientation orientation;
 	struct acpi_pld_info *pld = NULL;
-	bool status = false;
 
-#if IS_ENABLED(CONFIG_ACPI)
-	status = acpi_get_physical_device_location(adev->handle, &pld);
-#endif
-	if (!status) {
+	if (!acpi_get_physical_device_location(ACPI_PTR(adev->handle), &pld)) {
 		dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
 	}
@@ -498,9 +488,7 @@ static void ipu_bridge_create_connection_swnodes(struct ipu_bridge *bridge,
 	if (sensor->csi_dev) {
 		const char *device_hid = "";
 
-#if IS_ENABLED(CONFIG_ACPI)
 		device_hid = acpi_device_hid(sensor->ivsc_adev);
-#endif
 
 		snprintf(sensor->ivsc_name, sizeof(sensor->ivsc_name), "%s-%u",
 			 device_hid, sensor->link);
@@ -671,11 +659,7 @@ static int ipu_bridge_connect_sensor(const struct ipu_sensor_config *cfg,
 	struct acpi_device *adev = NULL;
 	int ret;
 
-#if IS_ENABLED(CONFIG_ACPI)
 	for_each_acpi_dev_match(adev, cfg->hid, NULL, -1) {
-#else
-	while (true) {
-#endif
 		if (!ACPI_PTR(adev->status.enabled))
 			continue;
 
@@ -768,15 +752,10 @@ static int ipu_bridge_ivsc_is_ready(void)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
-#if IS_ENABLED(CONFIG_ACPI)
 		const struct ipu_sensor_config *cfg =
 			&ipu_supported_sensors[i];
 
 		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
-#else
-		while (true) {
-			sensor_adev = NULL;
-#endif
 			if (!ACPI_PTR(sensor_adev->status.enabled))
 				continue;
 

-- 
2.47.1.613.gc27f4b7a9f-goog


