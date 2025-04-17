Return-Path: <linux-media+bounces-30427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC38CA914AA
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98A2C1627DC
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF92921A45B;
	Thu, 17 Apr 2025 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCZXUkBt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E4521ABC2
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873316; cv=none; b=Cf0qCiFe5n2mm57oRh0NYSHme4GMRNOKUdyK4Vwm7LoC6UfNr2lxcT4Onxfgn7/Ho9T1ZbxXdqGWwK3vq2lcb+HAaW4CpZk5rCdMvcTVuhtVyeKI6PqwJYKX388MItLueGD+IIL6xCVpkhE9SUUP6CVKnPT1Vi4zQzEx1p/GiQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873316; c=relaxed/simple;
	bh=8L8cybTbeEl2m2JRovyt7ZIU6E49n2ugAkmtKxaYWfw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F1WL/MTsEl9CzriYY2JH+/QwEcpsucL82V91I+NC7E8XYbvmYcNiZQZxelEc3APpKWIqSQvhTIPRi3nuQYRYCnQuMvozyRUvlekvrTtNTK7HzdHuRE61/QQSqV8oLLDRCRuuoPe7mwwZTj72XRiPu83AtIdTdHE0FFEfpm37u1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCZXUkBt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744873315; x=1776409315;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8L8cybTbeEl2m2JRovyt7ZIU6E49n2ugAkmtKxaYWfw=;
  b=UCZXUkBtVH1qT5AxsSlsVYaS69J03q+xtpr9SSTC3/611i7fSbvotUK8
   sfFuSbFKsvpHpuX6Poy9B3Pqpwlx7BG+FAZ61xm862Q9vH+zhtJiwsWXH
   56lNVqtbUkiAzOZ7IP+4OmxXFTCaEaugbhY5r5iZf2ViqQ/5MlUlnyyDI
   sfhLc3YS9zy/WDOLCcKkNncyhibPA83z6CGPtgddpKn/Wb/CbMTdx+B9d
   r05PtyXKzvsTxPtvTmladUtM0axKDZeu/f4cXUNg6v5wOUCIZpceWJfQ/
   IQ05i9JMKzmtds+n4F5sxXBEPxs1rCZkl8P7kl+mfxhj2mIxKxZxSTuJI
   w==;
X-CSE-ConnectionGUID: hH3mBGz3RtWL0Bafd2R1Ww==
X-CSE-MsgGUID: Z9RURf2uTu65F5zOM91geQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45580983"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45580983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:50 -0700
X-CSE-ConnectionGUID: MF/iEYyNSU6GXkSugLdK5g==
X-CSE-MsgGUID: YnXKIQDRReGMN8E++T9h1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135883747"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:49 -0700
Received: from svinhufvud.lan (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0E3131203B9
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 10:01:46 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 3/5] media: ccs: Use read_poll_timeout() in reset polling
Date: Thu, 17 Apr 2025 10:01:42 +0300
Message-Id: <20250417070144.130199-4-sakari.ailus@linux.intel.com>
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

Use read_poll_timeout() in polling the device after a reset, either hard
or soft. While at it, improve the related error message.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index aeda286a7607..d5c369bbb1b6 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1588,7 +1588,6 @@ static int ccs_power_on(struct device *dev)
 	 * an error.
 	 */
 	if (!sensor->reset && !sensor->xshutdown) {
-		u8 retry = 100;
 		u32 reset;
 
 		rval = read_poll_timeout(ccs_write, rval, !rval,
@@ -1601,18 +1600,15 @@ static int ccs_power_on(struct device *dev)
 			goto out_cci_addr_fail;
 		}
 
-		do {
-			rval = ccs_read(sensor, SOFTWARE_RESET, &reset);
-			reset = !rval && reset == CCS_SOFTWARE_RESET_OFF;
-			if (reset)
-				break;
-
-			usleep_range(1000, 2000);
-		} while (--retry);
-
-		if (!reset) {
-			dev_err(dev, "software reset failed\n");
-			rval = -EIO;
+		rval = read_poll_timeout(ccs_read, rval,
+					 !rval &&
+						reset == CCS_SOFTWARE_RESET_OFF,
+					 CCS_RESET_DELAY_US,
+					 CCS_RESET_TIMEOUT_US, false, sensor,
+					 SOFTWARE_RESET, &reset);
+		if (rval < 0) {
+			dev_err_probe(dev, rval,
+				      "failed to respond after reset\n");
 			goto out_cci_addr_fail;
 		}
 	}
-- 
2.39.5


