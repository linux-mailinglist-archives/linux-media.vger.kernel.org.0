Return-Path: <linux-media+bounces-30424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BA8A914A7
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C8D67AE065
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379FA21930B;
	Thu, 17 Apr 2025 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtmVsBwQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F92153DA
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873312; cv=none; b=QjmyVKSqcUuDu0YOtqG+3fDJXV9s2eTWQsU2yX9Qs3yQYdqHq9Yn0V+Vljxo2xQoUGbLzBxkNsQbpxVoq97H3StCB87NrVN3SHGd88DRtapDj9M6NpeHW3kOORyQgw0gM7p7mzEQPTTiDxNWXLVaQ1z6U9xatDuIZicum+Y4060=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873312; c=relaxed/simple;
	bh=cmgUhxWvsEmZMKyVkXWYbOw23A81V6zybyGzeaoH1Pg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pI+IJonW/Pc618008Ro/9xOnXSG4d2ZDeh70wkiwhDpE+CDwEUtIIIAQmKXsaktY4TwOYhL8k4nET7xsyUVPnX4j7kKYyjTFZfygcLUmQ4DNPxZ9MKSMGQ1LTMAiU/sMiwPZ45WsIgmyOSO6xHb9Ovcx1ic1jKsswPf+N5B+lfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtmVsBwQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744873311; x=1776409311;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cmgUhxWvsEmZMKyVkXWYbOw23A81V6zybyGzeaoH1Pg=;
  b=EtmVsBwQdCY+VF3ZTh8F3uawQXA9VH4sk+qZAq1K7u/Qk7v6IGtB1S/o
   6HaUiEbjN+vtyQWuKrkvUeJQTFNA/IAYy495mFBf5cu8GYI/56oau2zEB
   Hdscrn09LA7sDkPHNPz0/YnOiO0w7uubwiQ6hshoIRuCvL9CEYG2Q1hUG
   5rMYVWEd86zr3cjYueyntlKImG8dnrSjUN8XFFRSAOd16xgj5beDlJkfl
   ED3tF0siFmUgG9+ynF57+p4FO395HSFt8N4VCTuCSM01473cjVOgmDlR5
   YA1aEL7lUsUGH7qHZ3jCjmC4uPPfH6J3bfuxaZu4f+s5JoywGIIZmXf9t
   A==;
X-CSE-ConnectionGUID: hSIb4JvORSCa/yijUkiQnQ==
X-CSE-MsgGUID: fKL3cd4fTZq24CEXP1lRgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45580982"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45580982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:50 -0700
X-CSE-ConnectionGUID: SXogawnPQZ2yOJkZn2dV4A==
X-CSE-MsgGUID: 0HFFgWAVQ0eZ9rFBeur/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135883746"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:49 -0700
Received: from svinhufvud.lan (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 83D9A1202AB
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 10:01:46 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 2/5] media: ccs: Try a little longer to access the sensor before giving up
Date: Thu, 17 Apr 2025 10:01:41 +0300
Message-Id: <20250417070144.130199-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417070144.130199-1-sakari.ailus@linux.intel.com>
References: <20250417070144.130199-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some sensors take longer to respond after reset than the spec-required
time. Try up to 1 s for the sensor to become accessible.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 26 +++++++++++++-------------
 drivers/media/i2c/ccs/ccs.h      |  2 ++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 32ebc4477fc7..aeda286a7607 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1354,8 +1354,10 @@ static int ccs_change_cci_addr(struct ccs_sensor *sensor)
 
 	client->addr = sensor->hwcfg.i2c_addr_dfl;
 
-	rval = ccs_write(sensor, CCI_ADDRESS_CTRL,
-			 sensor->hwcfg.i2c_addr_alt << 1);
+	rval = read_poll_timeout(ccs_write, rval, !rval, CCS_RESET_DELAY_US,
+				 CCS_RESET_TIMEOUT_US, false, sensor,
+				 CCI_ADDRESS_CTRL,
+				 sensor->hwcfg.i2c_addr_alt << 1);
 	if (rval)
 		return rval;
 
@@ -1575,27 +1577,25 @@ static int ccs_power_on(struct device *dev)
 		if (ccsdev->flags & CCS_DEVICE_FLAG_IS_SMIA)
 			sleep = SMIAPP_RESET_DELAY(sensor->hwcfg.ext_clk);
 		else
-			sleep = 5000;
+			sleep = CCS_RESET_DELAY_US;
 
 		usleep_range(sleep, sleep);
 	}
 
 	/*
-	 * Failures to respond to the address change command have been noticed.
-	 * Those failures seem to be caused by the sensor requiring a longer
-	 * boot time than advertised. An additional 10ms delay seems to work
-	 * around the issue, but the SMIA++ I2C write retry hack makes the delay
-	 * unnecessary. The failures need to be investigated to find a proper
-	 * fix, and a delay will likely need to be added here if the I2C write
-	 * retry hack is reverted before the root cause of the boot time issue
-	 * is found.
+	 * Some devices take longer than the spec-defined time to respond
+	 * after reset. Try until some time has passed before flagging it
+	 * an error.
 	 */
-
 	if (!sensor->reset && !sensor->xshutdown) {
 		u8 retry = 100;
 		u32 reset;
 
-		rval = ccs_write(sensor, SOFTWARE_RESET, CCS_SOFTWARE_RESET_ON);
+		rval = read_poll_timeout(ccs_write, rval, !rval,
+					 CCS_RESET_DELAY_US,
+					 CCS_RESET_TIMEOUT_US,
+					 false, sensor, SOFTWARE_RESET,
+					 CCS_SOFTWARE_RESET_ON);
 		if (rval < 0) {
 			dev_err(dev, "software reset failed\n");
 			goto out_cci_addr_fail;
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 096573845a10..0726c4687f0f 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -43,6 +43,8 @@
 #define SMIAPP_RESET_DELAY(clk)				\
 	(1000 +	(SMIAPP_RESET_DELAY_CLOCKS * 1000	\
 		 + (clk) / 1000 - 1) / ((clk) / 1000))
+#define CCS_RESET_DELAY_US		5000
+#define CCS_RESET_TIMEOUT_US		1000000
 
 #define CCS_COLOUR_COMPONENTS		4
 
-- 
2.39.5


