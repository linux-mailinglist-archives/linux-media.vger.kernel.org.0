Return-Path: <linux-media+bounces-18667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4566987CEF
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 04:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFA6B1C22C2E
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 02:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6635D16BE2D;
	Fri, 27 Sep 2024 02:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afcqCyij"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCAA37160
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 02:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727403379; cv=none; b=lmvpkC5pMoNmYqmFFVmLTYIW4CnhjhXoNlOEHRIiaXoVrHFXuvEYUJw2sRuGr8PB9G46soSShJO1kj5RxF+eLG/FNzVUSmruMH+R4ptvhfl2xUOYSBq8tKBmUfpok5sRHgAMdv70qA8l0SpTaLXQEh/bziEMiqm0vgo/mXGjeOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727403379; c=relaxed/simple;
	bh=RPUnhrWKkGrwcSLUUagmN1X+E8MTsP2KDIVRz11lmAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q4ttXJM33Rvz6dVoUrTpdNxFsituoV6rsvoqsDACxxlTsBfL8IMBosG+EMXVhbCvq/NUhlvFwChzjUkMRKE9wj7h9G/vRN3qu2rpgc5s8AY4eG8u7s+OLNJ5JU/bPIe/0Q81HwIKPw5lZjyCAIeeipciG9E3gU09Uze2SDch6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afcqCyij; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727403378; x=1758939378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RPUnhrWKkGrwcSLUUagmN1X+E8MTsP2KDIVRz11lmAQ=;
  b=afcqCyij8H9B/6ZDS+HvPHiVVCi209xozu3CHkMrEzPhMmdcgy0G/Yeo
   8Z/2eVOne4h2nCoKhoeIuhO1a4H1S1l9MH9fH8XYE+SUKG90mnK8Dq8U2
   ugx6unsrvjxaqld760wCZcx3dMjqbUBwNZeY1AHB9Ur9E5ynO4HrjFBJN
   OSv9Y1k0wZDLGhlEvw2B7yx1P+lA/K+yV80ws1YYehJWmmo/gMXmFzAXX
   rFbMDO1/jN23gDr3eS1CcD5SRJo3e0jAIhkw0RATDGiViLZT5GCpQposK
   E0TegvFMeXxXNgHWc1SXKBaCyp4lAgkx6TZWByRBm+epON5Q4zQkGEuWT
   A==;
X-CSE-ConnectionGUID: nJEclbLMTIOePIKkCHiQtA==
X-CSE-MsgGUID: zOp6kZiKSxGV6hKFpIgAjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26703997"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26703997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 19:16:18 -0700
X-CSE-ConnectionGUID: ctuNAKUST8+fGmoNo6W1pA==
X-CSE-MsgGUID: gke8eTfWTGGECDg+qnJI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76728347"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2024 19:16:16 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	andriy.shevchenko@intel.com,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH] media: ipu6: remove redundant dependency in Kconfig
Date: Fri, 27 Sep 2024 10:16:13 +0800
Message-Id: <20240927021613.2158020-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927021613.2158020-1-bingbu.cao@intel.com>
References: <20240927021613.2158020-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

IPU6 driver simply depends on X86, X86 and 64BIT cover the
X86_64, redundant X86_64 dependency in Kconfig could be removed.

Fixes: c70281cc83d6 ("media: intel/ipu6: add Kconfig and Makefile")
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
index 49e4fb696573..624d8e44c53b 100644
--- a/drivers/media/pci/intel/ipu6/Kconfig
+++ b/drivers/media/pci/intel/ipu6/Kconfig
@@ -2,7 +2,7 @@ config VIDEO_INTEL_IPU6
 	tristate "Intel IPU6 driver"
 	depends on ACPI || COMPILE_TEST
 	depends on VIDEO_DEV
-	depends on X86 && X86_64 && HAS_DMA
+	depends on X86 && HAS_DMA
 	depends on IPU_BRIDGE || !IPU_BRIDGE
 	#
 	# This driver incorrectly tries to override the dma_ops.  It should
-- 
2.34.1


