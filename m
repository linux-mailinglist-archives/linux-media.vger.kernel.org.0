Return-Path: <linux-media+bounces-31699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B674AA917B
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 13:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 057787A4FB1
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 10:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0AC1FA85A;
	Mon,  5 May 2025 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA+ffE2A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891E33E4
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746442861; cv=none; b=krzsYo/FfcW1hwr2qXQGxhaZTXf54gt5WmgVPCeqZnLhEZJTKWr+fWkso1KTAR1sa8E3k4vBGVKK5gsbvWQt4zQszoJBS78UVXZt/jHoM7NKz9UfmkwQ2X5YNvolNyWZkD3o7mQYuWNoJ64ULhARjEdFvBr6XTa+GO/wciy8M/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746442861; c=relaxed/simple;
	bh=hbIrQc2nACBXtm1rDJajTMbeivn8nB0igiLFdJfibRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ot57fn4fz+BnGLAHyQV9PtrAjo6zw2jxba6lXRqksP3BvbmMthzJhKIrG9cCJ/gHALAKdPf7bp1tSy8qH3DQJxHWNRDQ2ihpfMM6UTMD9+5PoRwY1tHYur7+nS5DHEBZkM7fTI2NDsmCffSbEHbjS2GHT8niYZZPFv2D40YIc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LA+ffE2A; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746442860; x=1777978860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hbIrQc2nACBXtm1rDJajTMbeivn8nB0igiLFdJfibRI=;
  b=LA+ffE2AIIst3IAMSvo6HCbQRkTkRVN47oCg2h2fMpFCK5EOfg9XiqQD
   INY11Fhyh2Qu8QcwS4myhS3eZgHIDs78HlK2/W+H01PUhKWPKimS2/Clb
   JXz/vJSgAl46GQqAA1gkh/vPVllzOWi8xOz2w6lKYGLN6dsr0eisBeBb1
   jhnLnDKSHnPKH/kwiVLp8JqEKfsngzg+aMoAS32xYk6G4Bz/+RuhUepyW
   9y52xacO3Qv5h9gLo8Yp1XcH7wNoy3YK8lnCSRKtpxqgr112v+LOykX82
   XXimzCNFXbykQTk2Ovxih8zUeBF3iPmw6Xk+af1WrTDdkp9oLjJvRRSUJ
   w==;
X-CSE-ConnectionGUID: e/sPAyjxSda53nLFMhTCkg==
X-CSE-MsgGUID: LKh4TCWIT3SGXin97ktfmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="58707827"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="58707827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 04:00:59 -0700
X-CSE-ConnectionGUID: 05XqObVFTzaBNOyHwYYoFw==
X-CSE-MsgGUID: QHWB5FP0ROivLeEuZLteqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="136199751"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.252])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 04:00:58 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 341B61201E4;
	Mon,  5 May 2025 14:00:55 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uBtZ9-0002Du-0H;
	Mon, 05 May 2025 14:00:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dongcheng Yan <dongcheng.yan@intel.com>
Subject: [PATCH 1/1] media: lt6911uxe: Depend on I2C
Date: Mon,  5 May 2025 14:00:54 +0300
Message-Id: <20250505110054.8538-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V4L2_CCI_I2C only depends on I2C, it does not select it and neither does
REGMAP_I2C. Make this driver depend on I2C as V4L2_CCI_I2C requires it and
selecting it isn't enough.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 597c23616b6c..5b4067bdafda 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1160,7 +1160,7 @@ config VIDEO_ISL7998X
 
 config VIDEO_LT6911UXE
 	tristate "Lontium LT6911UXE decoder"
-	depends on ACPI && VIDEO_DEV
+	depends on ACPI && VIDEO_DEV && I2C
 	select V4L2_FWNODE
 	select V4L2_CCI_I2C
 	help
-- 
2.39.5


