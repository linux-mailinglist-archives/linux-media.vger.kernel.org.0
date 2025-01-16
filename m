Return-Path: <linux-media+bounces-24838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A9A13958
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 12:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 997467A3312
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 11:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7381DE3C3;
	Thu, 16 Jan 2025 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHYRo3WA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E148224D4
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737028037; cv=none; b=jyVcHKuV1lLGPb4LF82t1DQDy3hN7MzH5mFt6jxvwWPq8uS2Bvnl2pwNdBnK8dMk2TnwG2r3+sQlMtZxVJX7PV/9cVEDj03dNfmn1bKf7d0bp4b0xkx+M0F7IaspqncCCkRJuaxrDufNUXLX8goJTl1U+gmlodDO4s1csvASwBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737028037; c=relaxed/simple;
	bh=oNrHqhgi5KnTS4LhwmFFjcyITMN+v52E/7PG16hlkEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ERNhP2JqrxSH80A7woNrnHgEUrgJysb6O1s85rGd6cJKvlkDbWVk1+Qt4u0bwhUBx7/WaoO5rQIHDHrSOZPSyRVfzQane6RwAfd+AQPxlXEYsLQD42lX7nh7SDxAotE+wTBQnqTuS3ar+0mhiUTfbY3olspjW1F9gI6DSRKKQcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHYRo3WA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737028035; x=1768564035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oNrHqhgi5KnTS4LhwmFFjcyITMN+v52E/7PG16hlkEU=;
  b=kHYRo3WAYRsbdvs7yzlBKSSFuRUUA58UTj9vM4c3c0YSpAN8PaadZeTD
   oygthcGekFAysU0zr8AXQwyUf9JIHBlmspt0cXLDjIYUl30Y/VkPOZ/H2
   anOVtye1LMmSuH8Gb3tF0E2wryaVayXH9skz3ib9QEbG8mtTtpjqKDaSM
   qJ+hamssLi5B7z1YZTP8s8+EPvYLqf4jwM/rDz82+XPQ7GEUGLBBiPe4m
   mKPrIIodrVYOH23016p9dy5xTLQ7Laa+UhnuwW5w+tAXqIf31eQCUlFPd
   ybAh+6c9kh+sivbMULS06bfTGf/JNL0RIo76wy06ez/q7pryJBTmz+ob7
   w==;
X-CSE-ConnectionGUID: q9712N9TSvu8B8rXjHajbQ==
X-CSE-MsgGUID: 9/3VYZxdQciFxTc2KvrNAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36686962"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="36686962"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:47:14 -0800
X-CSE-ConnectionGUID: VHm0UffhSve7+tkJ0UWaCA==
X-CSE-MsgGUID: svrO78wMTfa1NIi83KVkYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="136313635"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:47:13 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1F68A11F964;
	Thu, 16 Jan 2025 13:47:10 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1tYOL8-000HYX-0H;
	Thu, 16 Jan 2025 13:47:10 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH 1/2] Revert "media: imx214: Fix the error handling in imx214_probe()"
Date: Thu, 16 Jan 2025 13:46:59 +0200
Message-Id: <20250116114700.67468-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
References: <20250116114700.67468-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 9bc92332cc3f06fda3c6e2423995ca2da0a7ec9a.

Revert this "fix" as it's not really helpful but makes backporting a
proper fix harder.

Fixes: 9bc92332cc3f ("media: imx214: Fix the error handling in imx214_probe()")
Cc: stable@vger.kernel.org # for >= v6.12
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx214.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4962cfe7c83d..10b6ad66d126 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -1114,7 +1114,6 @@ static int imx214_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(&imx214->ctrls);
 error_power_off:
 	pm_runtime_disable(imx214->dev);
-	regulator_bulk_disable(IMX214_NUM_SUPPLIES, imx214->supplies);
 
 	return ret;
 }
-- 
2.39.5


