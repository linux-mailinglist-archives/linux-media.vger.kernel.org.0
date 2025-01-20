Return-Path: <linux-media+bounces-24937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC36A16A92
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 11:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FE1E7A3DAF
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 10:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709A01B0F32;
	Mon, 20 Jan 2025 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7fx2NnU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3876E3398B
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 10:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367890; cv=none; b=Nhc7LNKU70dwyff4IhD2ozthRgELHNpr0ZE+gYlWfLq4L6UxJ47cHVaYUsyFBNJuojyh+aPYKxdNvNLOO/OFSmtMsstnzsZAvnC67C1CMI7EWrBRpIbyhcu53rFgmWdM0tH/pcz4n4XqJs2kp/QdkSBLaiiVqfZPdy3fv47hnGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367890; c=relaxed/simple;
	bh=RMRVj5e8n/N8Nuk01tUbXC0gXaOMqQA/BuG4sRqe48U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jpgDiJW1TJR2DBmKge1PfP/Berp6PY+rG6Yk+tAeacA0cYRdzF7AOpnMu7+Njau2QbwFUI6s8vfax2iv4f9dqflwpJ5CWjhFZlP0TU4yg5hiivXcVTsPfgc/cVr3Furv5nXCuQF+CQ0D5VQ/V6E1GWNPQSM/Br/1VPVVqkgg+DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7fx2NnU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737367889; x=1768903889;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RMRVj5e8n/N8Nuk01tUbXC0gXaOMqQA/BuG4sRqe48U=;
  b=E7fx2NnU+5lr0uky8H5MqV+6ULhwdX68RBWxjbzFo5sBqRXjwH0UKTmu
   PychJLj4Jp4qDjhRCW+OBR3U2i/OwaPcXwy3kJhqYvDZjQe7hT0qtdMMY
   tfqy+/e+iGktoTGhvY6HOK//zHcLvhhuXpxFBe/UCFK8PKxSclquBqfVV
   YTJYIAUV0kEdVTKgD5ZDZANDCq1CAKF4MHJffdl485ovVIStFermaCvO9
   dRCc0bkd3+po8C+FOHKe3qln1dFzRGm1s7Zm2jmjTPASaxKGcyOKtZx0k
   MSkE2SiE5nPIKD1SSvRd+VyRu0MuuovEMb6cP30DW0ohdh5UOdlGrJAP6
   w==;
X-CSE-ConnectionGUID: nCYMvjt6SZW/uRhQv73R0g==
X-CSE-MsgGUID: g/+ZLjUWRNCJNEsP7SDLTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48740913"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="48740913"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:11:29 -0800
X-CSE-ConnectionGUID: XjycD8kyQmugXbi1fxVS2Q==
X-CSE-MsgGUID: ZivNLHrhR8G9h1K+uAQcPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137360844"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 02:11:27 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5CF4A11F94F;
	Mon, 20 Jan 2025 12:11:24 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Daniel Scally <djrscally@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] media: i2c: ov7251: Set enable GPIO low in probe
Date: Mon, 20 Jan 2025 12:11:22 +0200
Message-Id: <20250120101123.148482-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the enable GPIO low when acquiring it.

Fixes: d30bb512da3d ("media: Add a driver for the ov7251 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov7251.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 30f61e04ecaf..f3e2d26bb840 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1696,7 +1696,7 @@ static int ov7251_probe(struct i2c_client *client)
 		return PTR_ERR(ov7251->analog_regulator);
 	}
 
-	ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
+	ov7251->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(ov7251->enable_gpio)) {
 		dev_err(dev, "cannot get enable gpio\n");
 		return PTR_ERR(ov7251->enable_gpio);

base-commit: 5de275c450c9496031006e0fb3f7c96a8fcaaa55
-- 
2.39.5


