Return-Path: <linux-media+bounces-21166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B209C1FA8
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90AC1B22F75
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDB81F4282;
	Fri,  8 Nov 2024 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L0wRjULW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549B1803A;
	Fri,  8 Nov 2024 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731077431; cv=none; b=S82sFfANuyKUCip1SHZBzyKKSAwCZyiPX//vX6MGI1Xwy1LuJMwfP05pPzppbjMTakZPXoKVKAAtyKYRfipQt8gJCrTMxOKHq1AzJnTAcq0VZFjiIvkeIY+RwN0Wv6MYYsHVQ9fL6eAAnuEOOQ0GDD3TEpH8XLk8F0uq4MazVJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731077431; c=relaxed/simple;
	bh=WB69xDzzfrDuMdKmcfw73F7bY7tywkvG6bjQxIqlu+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JIbh2XM6j5aujNn71qLMCta++lIxz9QOdTiPIhZqnetyi/3os3jL8OKbWC7wl5eZzgED4IMV+0e6mKFpaBjYx2T1ZC1G1AXbelELoFt27ge2ujJdh4+BU5eizPrAjd9obhSWj3X0/DRzrEJuo+JwJi1eU5QpoF5QwASeu6qFfeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L0wRjULW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731077430; x=1762613430;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WB69xDzzfrDuMdKmcfw73F7bY7tywkvG6bjQxIqlu+c=;
  b=L0wRjULWpZMEZEGKwlhgHqiZtNAoDa3m0KzOGYqc9vjbmbj468tq3Ucx
   1wb2ydL9zDLU72Y6OtXHtkpf/tzJ/6WfYwLoNKxqZol8XWTNOk0lDRcVQ
   +7l2OTUApDxwOcx+eCylQSgxJ6gb8dRJ7TYDykQWf0Z7UDwlJGWU7XVbc
   Lq11LrJcKE0c3dLgeDKbUOGoCI3e1u+nu1lgA33/58EgOdFYK2UMdoFMr
   Nxr8kRoAjMNekBZtPxtpUoGdHFsQk/twMcbystOmM/p6nSuZKA9hes0nC
   SJSqKHtqI3wgyH8OqstCDA0JBUH4i1uz/dhDHYl9M/zNF6LlE6CZdSE+o
   g==;
X-CSE-ConnectionGUID: M8/q7W8vQB6BwurvFZtD6A==
X-CSE-MsgGUID: rvxvbO1OR0y2HjS3xXmmdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30816070"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30816070"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 06:50:29 -0800
X-CSE-ConnectionGUID: 9rgauUe1SnahjGV4Feu1ZQ==
X-CSE-MsgGUID: S+pyx3y/SumsVVklPh5N1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="116422849"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 08 Nov 2024 06:50:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 054D043A; Fri, 08 Nov 2024 16:50:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 1/1] media: ov7251: Remap "reset" to "enable" for OV7251
Date: Fri,  8 Nov 2024 16:50:24 +0200
Message-ID: <20241108145024.1490536-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver of OmniVision OV7251 expects "enable" pin instead of "reset".
Remap "reset" to "enable" and update polarity.

In particular, the Linux kernel can't load the camera sensor
driver on Microsoft Surface Book without this change:

 ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
 ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
 ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
 ov7251 i2c-INT347E:00: cannot get enable gpio
 ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -2

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/i2c/ov7251.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 30f61e04ecaf..7b35add1e0ed 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1696,7 +1696,21 @@ static int ov7251_probe(struct i2c_client *client)
 		return PTR_ERR(ov7251->analog_regulator);
 	}
 
+	/*
+	 * The device-tree bindings call this pin "enable", but the
+	 * datasheet describes the pin as "reset (active low with internal
+	 * pull down resistor)". The ACPI tables describing this sensor
+	 * on, e.g., the Microsoft Surface Book use the ACPI equivalent of
+	 * "reset" as pin name, which ACPI glue code then maps to "reset".
+	 * Check for a "reset" pin if there is no "enable" pin.
+	 */
 	ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(ov7251->enable_gpio) &&
+	    PTR_ERR(ov7251->enable_gpio) != -EPROBE_DEFER) {
+		ov7251->enable_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+		if (!IS_ERR(ov7251->enable_gpio))
+			gpiod_toggle_active_low(ov7251->enable_gpio);
+	}
 	if (IS_ERR(ov7251->enable_gpio)) {
 		dev_err(dev, "cannot get enable gpio\n");
 		return PTR_ERR(ov7251->enable_gpio);
-- 
2.43.0.rc1.1336.g36b5255a03ac


