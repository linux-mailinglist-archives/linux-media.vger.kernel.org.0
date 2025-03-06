Return-Path: <linux-media+bounces-27712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95CA54B80
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C612B3B2814
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D39120B801;
	Thu,  6 Mar 2025 13:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nj6L8hWV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB96209F44
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266408; cv=none; b=Ko+oBIY0RTjfu2Msjrd0Qn5WzCYrqT5mnauumYLcbMYhabNQOQlzCwBYG5DD8oG4269AstJnBZSbt5cBsk5+PrD7TDab41FPmD1hq+CBh4lJXZKz5afS3e6qkVxNdoRH6vjPqfezr5tRd0Z18P7mKFQfNCMnrWkIZI3zQD2uxfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266408; c=relaxed/simple;
	bh=98KOmMIz08gVnyAo3vONXqIoR3Ek5v0Ssg5DpHBHBEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JGWTAbLbxDSdC0bvJBelm4Z4cQ0VY3Qc8mRWPXd+ZcsFZBNw1HCTYCFtYEuQYFpAb4PR0mMt3GdXtLg6TRQ/7PCKzczo8jD+LXmDjk77vcfHiiezYk8zsmN+68hlGAZgeuWDLcpoTWN0PQmPKwwFsrLRRUoKK3cprI/JluGz4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nj6L8hWV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741266407; x=1772802407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=98KOmMIz08gVnyAo3vONXqIoR3Ek5v0Ssg5DpHBHBEg=;
  b=Nj6L8hWVSGUpPL2DJhpuqMhFufffOJZ2NXYkztMY0bKGENxObXOSRo03
   UwphEqEUQOopG40fWXnDBCUB68BKf94rtHEsEHjkaHhE/CHbhW5rl0iX4
   Tg31xtAg7GHiaVm/DSgIEZgis+SiYRV528xpVle+7MRCmiJVOYfeslkN8
   3ujo+D11W/YlSmvydR+d0UbquMtk6MFNAnkVjE0CrhU8B3ME/QqYyVbYQ
   Hy//z1o3mRC4iE6zM9BJVYO+dnzXlsHQc10J299RCBUqcojB9rp7B8NY8
   TdQ0eTKJsn7wkKCZA1ogoeB49Va8WNqZ0bxSdyyWDcgBCTIVZ0YwQVXJ8
   Q==;
X-CSE-ConnectionGUID: sMoOVvqTRPiPt6Nfz+bOpA==
X-CSE-MsgGUID: x/Ilt6fMSt6GSRB/DCzYCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42131872"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42131872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:06:47 -0800
X-CSE-ConnectionGUID: ttrA1n9xSWCbAi1AtmqGcA==
X-CSE-MsgGUID: sklCHnWPSrCRwoEBF0RnzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="142241220"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.246.21.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 05:06:45 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: [PATCH v1 2/3] media: intel/ipu6: Remove ipu6_buttress_ctrl started field
Date: Thu,  6 Mar 2025 14:06:28 +0100
Message-Id: <20250306130629.885163-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We assign to ->started field but newer read back, the field can be removed.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-buttress.c | 2 --
 drivers/media/pci/intel/ipu6/ipu6-buttress.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index d8db5aa5d528..787fcbd1df09 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -478,8 +478,6 @@ int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
 		dev_err(&isp->pdev->dev,
 			"Change power status timeout with 0x%x\n", val);
 
-	ctrl->started = !ret && on;
-
 	mutex_unlock(&isp->buttress.power_mutex);
 
 	return ret;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.h b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
index 482978c2a09d..4b9763acdfdd 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.h
@@ -26,7 +26,6 @@ struct ipu6_buttress_ctrl {
 	u32 freq_ctl, pwr_sts_shift, pwr_sts_mask, pwr_sts_on, pwr_sts_off;
 	unsigned int ratio;
 	unsigned int qos_floor;
-	bool started;
 };
 
 struct ipu6_buttress_ipc {
-- 
2.34.1


