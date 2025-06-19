Return-Path: <linux-media+bounces-35231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C65ADFF86
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86DB97ADF06
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C6A25A2D8;
	Thu, 19 Jun 2025 08:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZkapqWYK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B8C219302
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320954; cv=none; b=Vyunv1EArQbd4qrmXP4Uez0+ixGMgpuixnm4bGOMiOByDSNbyv+UcuiGclyEohh2wRLxNovCdEnI8pxlivmn/og/pFlYC5dUyaYc5T4EiQ9cBgpLPrYL/X5LFkL0Zm32adIUnPpuQEEozS29dS3Aay69ovKMegT7FsSoULQBeV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320954; c=relaxed/simple;
	bh=HWVxmnSzT5omX2UIIn5d9TQxfmi6Q8PkurfVk9I/UCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mXhL69IQJmcAR1vm4aja6RCJMJDOBSw0ObpMIQ9BvhZ9OTBY6Ngxp6QC0Tfwq9hihNcpxJdSOKvJi5CjdlyzVc7/VZMxUip7qmIeK8kK6m9k+GBi2qu89blydO/6IcHqcmR2bfAUDBiisVJmFG0OktzRn1uAY1hCOOlE2GKhUwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZkapqWYK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750320953; x=1781856953;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HWVxmnSzT5omX2UIIn5d9TQxfmi6Q8PkurfVk9I/UCA=;
  b=ZkapqWYKcxwZUQ0fnpmCvhbRXCO1hh5a2n+4gg8cd3K3xCMF+gB1mg5x
   UZzniyCFjVnCh/z68B8j3l/eltvlm1ycXUvQCPjevpgt4tzzZpJSQpOuA
   iutIgQhfWOon++wdxLeBPB1kpMdtucwKXx7KjPDxZW9lU3bbCHSze+6DR
   biynW5PkKAjqrTYJdFopAhnRkwpK3il7RzM/8lTf9v5vzdsbAAvRnC+o5
   Yz3x+/11+4PYpeoRitSshAaQ1e5J9dxpdOd7SqdQxWEldAUIvGgTWNTeM
   am4vbOr1V0FlACiKq/zcGwutLK1/GSpOlpQF0++9ae+6Cm0B1yhSB9cim
   g==;
X-CSE-ConnectionGUID: y8ONaIttQI2omLX4atwh/Q==
X-CSE-MsgGUID: y672ZSESQZeZ4vvhnehzmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52716672"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52716672"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:50 -0700
X-CSE-ConnectionGUID: mx35gCB2SYOeHGjwB5UrGg==
X-CSE-MsgGUID: lPWubMgUToGG7LUiGcSxoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="150640619"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:15:49 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 87FCE120339;
	Thu, 19 Jun 2025 11:15:46 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSAR0-006doU-1g;
	Thu, 19 Jun 2025 11:15:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com,
	tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 02/13] media: ipu6: Set minimum height to 1
Date: Thu, 19 Jun 2025 11:15:35 +0300
Message-Id: <20250619081546.1582969-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For image data generally 2 seems like a minimum height that surely won't
cause any issues, but some sensors have metadata the height of which is
just one line. Set the minimum height to 1.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index f488e782c26e..0e2c8b71edfc 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -40,7 +40,7 @@ struct ipu6_bus_device;
 #define IPU6_ISYS_NUM_RECV_QUEUE 1
 
 #define IPU6_ISYS_MIN_WIDTH		2U
-#define IPU6_ISYS_MIN_HEIGHT		2U
+#define IPU6_ISYS_MIN_HEIGHT		1U
 #define IPU6_ISYS_MAX_WIDTH		4672U
 #define IPU6_ISYS_MAX_HEIGHT		3416U
 
-- 
2.39.5


