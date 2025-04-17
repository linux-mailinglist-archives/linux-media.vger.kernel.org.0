Return-Path: <linux-media+bounces-30423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49DA914AC
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D073AF28B
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9D7218EBA;
	Thu, 17 Apr 2025 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvxMGdh9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453619F13B
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873312; cv=none; b=WUG/ddJGnoLr3W0KXSHRDRa7J0dPkFn9Yk6O1Zc9Qyh/M+DFwpZ5uzmuwGEbRNtZr6zbX5lZCa76ronyr+wAeUvu/kxF2tp974c8SZdEqWZg1WUTHn6W6K6lzKj30pUhCLz+/V5x7SdjXPGu6i2fZqu8bGQDiktyJuvBkaxI0rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873312; c=relaxed/simple;
	bh=xMBFXODT0+G5/Cpby5US+ddx58p7eyZBYshVnynS/fw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cBkQcZwLrEr7z7cVOctOhHBFywbcKj1lvd8DmyA1rP8OOOBj0Ie4XcPwOxHTzqg6RnWrxFk8BqCOMLhqkHSruC0PAdXfoMUx+u6tEV6CPEKXPNuPCgcyCfA0TkGulssHXWuE1G74VXvg05oX1q53mVFbVVFkM/8Hw6h9j9QcbYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvxMGdh9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744873311; x=1776409311;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xMBFXODT0+G5/Cpby5US+ddx58p7eyZBYshVnynS/fw=;
  b=lvxMGdh9/6/9qqJ/mBD/1qkOMY1TrG+f3HEjnHwNCYtEUai0TDlQ/hTO
   0UfQRAR8NFbIL5tqTWRB9AOHlPZSLlB2AR9zm7CjAOssIN7x//EQkU59g
   vIoaw0nVYkPKPxozldYGlK/0vXYDDdFLik1V0U1PqC2/CpAwvYwJlVFKZ
   z3gif0k3fLEgdyU8IqVweGFUlpLc0avvfALPpKyyq6aHOdME6TOMLo7R4
   nQLvSSZSnIXoP5NrUmLNkZS1EzDKtY9PRXvXTTMwLjccoDlpHz1Ce9Uf6
   h5ph3Yxf5qj903M5Vcs3RSW6FZSey91u6g+xsC1xDwR8RJaU2BxsBlby4
   w==;
X-CSE-ConnectionGUID: 4+yEEVjyTMmIjulhlOI0xQ==
X-CSE-MsgGUID: 9SVtxd2/RN+dke4HFxLLbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45580980"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45580980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:49 -0700
X-CSE-ConnectionGUID: jYXyEN0ESKq55VSppm7qeQ==
X-CSE-MsgGUID: WhU8itroSv6XCcB1CBxzFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135883743"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:01:48 -0700
Received: from svinhufvud.lan (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CDC7C11F9D0
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 10:01:45 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: [PATCH 1/5] media: ccs: Don't complain about missing "clock-frequency" property
Date: Thu, 17 Apr 2025 10:01:40 +0300
Message-Id: <20250417070144.130199-2-sakari.ailus@linux.intel.com>
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

The clock frequency is often available via the clock itself and not read
by the driver from the "clock-frequency" property. Don't complain if the
property doesn't exist.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 004d28c33287..32ebc4477fc7 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3131,8 +3131,6 @@ static int ccs_get_hwconfig(struct ccs_sensor *sensor, struct device *dev)
 
 	rval = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 					&hwcfg->ext_clk);
-	if (rval)
-		dev_info(dev, "can't get clock-frequency\n");
 
 	dev_dbg(dev, "clk %u, mode %u\n", hwcfg->ext_clk,
 		hwcfg->csi_signalling_mode);
-- 
2.39.5


