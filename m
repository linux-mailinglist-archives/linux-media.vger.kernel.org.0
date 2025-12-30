Return-Path: <linux-media+bounces-49721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD64CE9BF7
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 302F630319A5
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CB021767D;
	Tue, 30 Dec 2025 13:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOz+1gP9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7B212FB3
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100214; cv=none; b=ZninR86SzV5oWuSPIPvUZXXoJgftChkuc3LQq4vriBq0MuLC/YtRrPV4UkaL0fm/27Qiqkhr+ZOGCbFt8N6eIPOFidXImr4qEOERrsQr3czjKmvdIliP/2dcw+6dhE9YeMhTsqzTzddQZWz83DKpOYcUuGAzMvDNWS/U3O6fZ78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100214; c=relaxed/simple;
	bh=lakatMwLuiUGM/200WhL8SUhz6xRcSamUgWk1KEoGeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKJtIta3z6qSIeRpKv0RT6rZKIr5WD6C6mtISUKY2FpDWpkxEorzZveK7AkjAgpuWOAu4yzm2oYZd2a7o9McIOjuQ/PQP1LZo26/PR4IQEv79mK2cwjlLgP1JmNSUKUhMMHM/enBNPztZ//MT25Yx4+M6CtL4n6g5EzoTqMAZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOz+1gP9; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767100213; x=1798636213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lakatMwLuiUGM/200WhL8SUhz6xRcSamUgWk1KEoGeo=;
  b=kOz+1gP9Nw0nHeT+bUiSGZnbdurPWFNHQRjLHpyml2EqGvamnhHxRTtZ
   8ZYxu6aASKTRsqABhPgr+tmv2T6qjU2wbPjztfAMclFlfAJlQ0IJn+KcG
   27kQpKeC8LrelH2GVzhYicMZu3Omi1M6vZCqmgfcqrpsy/cFjlryaDfVW
   kui/isIAg+/7ZdRIWbwti5EjXxGY1uV8qovFDCvbAV7FQ3bKszlL2P0wo
   uMGjHWrrzy/XBN3ciSHuXfw+rD/yaojwvX/N+36YlS4sJHaNWFMEH62tf
   XfvDCMVuuN7BAwLsAERxEbwp2jTSJPrVPAlAOE2q3VbZMJYVxZycP7rKs
   g==;
X-CSE-ConnectionGUID: P/HZM1vuR2G8QdtVyTxgzQ==
X-CSE-MsgGUID: XznfxNjsQ422RLl3TwkfYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79808039"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79808039"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:08 -0800
X-CSE-ConnectionGUID: mHfBfgemSHq+U6K74+U/cA==
X-CSE-MsgGUID: l9eH/hoASym1OkfTeUkXrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="224710700"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 05:10:06 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 93CC611F8E7;
	Tue, 30 Dec 2025 15:10:14 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vaZUL-00000000Jbv-1C35;
	Tue, 30 Dec 2025 15:10:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v3 03/13] media: ipu6: Remove redundant driver data checks
Date: Tue, 30 Dec 2025 15:10:03 +0200
Message-ID: <20251230131013.75338-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
References: <20251230131013.75338-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both runtime PM resume and suspend callbacks check whether the driver's
data is set for the device. This is done in probe(); drop the redundant
checks.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index eb45544a9f05..4855eeb24980 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -857,9 +857,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	unsigned long flags;
 	int ret;
 
-	if (!isys)
-		return 0;
-
 	ret = ipu6_mmu_hw_init(adev->mmu);
 	if (ret)
 		return ret;
@@ -884,13 +881,9 @@ static int isys_runtime_pm_resume(struct device *dev)
 static int isys_runtime_pm_suspend(struct device *dev)
 {
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
-	struct ipu6_isys *isys;
+	struct ipu6_isys *isys = dev_get_drvdata(dev);
 	unsigned long flags;
 
-	isys = dev_get_drvdata(dev);
-	if (!isys)
-		return 0;
-
 	spin_lock_irqsave(&isys->power_lock, flags);
 	isys->power = 0;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
-- 
2.47.3


