Return-Path: <linux-media+bounces-18666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D22987CEE
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 04:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E171F24117
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 02:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE9641C79;
	Fri, 27 Sep 2024 02:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0HS6BkJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB63B1A1
	for <linux-media@vger.kernel.org>; Fri, 27 Sep 2024 02:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727403378; cv=none; b=kw0bRyU8O3hB1d87wDJl8KlBMD1399lkMRqeZqj9HbgRljO8IQYjCOc6YX71akE8/18nKrcj50J1aWlM4mMPP2e+JiO5OQg3iWwG8nARiXMz8kHPNfqr1ebkOTLekOugCEk4rzHa+i98XefufNyC1VOmMzbh7S9u/NUFjZGkWTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727403378; c=relaxed/simple;
	bh=RPUnhrWKkGrwcSLUUagmN1X+E8MTsP2KDIVRz11lmAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=InWUVuyjdhkehS7ACPO5VCqlE1X/T6ZwrWGTOxbUYgYXqI7x2A4pisvC3Tg4EM4Y+DHtS3t6OZa5eMPoJIg7Y1vQS79E0cp3NrrZEmEB3x509EA9igAIHe/RLUfK2XHuXMZPkLsjnnnVUeqyNkoIYz9zc/+Hm36yfFnIS93dnSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0HS6BkJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727403377; x=1758939377;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RPUnhrWKkGrwcSLUUagmN1X+E8MTsP2KDIVRz11lmAQ=;
  b=A0HS6BkJF/r6LvxMs9lqnzkh0Fjnc8nSs4Kh4XuYE7Umq0OTAEs7jFXM
   c6v+r+FQ2LXiUrK57kkS/8ThNveOkF4nN89RGZvR6CQHW+0lfhxb3eFNB
   YW/aC1pZ0XDdPehGGu2A3bHIXHcS1JtZ1WXbj87e4Se18ms3qAs5lx5sm
   xh3nqkOC4zB+Q/0LQOJd4UKl+sGGe5BtNHLVf2Dfy7OBetDuA0LQoT/hL
   /8LeKAf152/Mid/ZkXuxQDFVOW5CxfugHxun95ZqiHFgWiuu0k+l+ENST
   YZRQuW86usuKUqQMc2Z2datUJ2uYwYdbVG4nJCjGFiAg0Hmoi759GGi0a
   w==;
X-CSE-ConnectionGUID: w3FaIWFSSDmTSueXTrKN4w==
X-CSE-MsgGUID: 6cUNvBMRTkedUtrKK4c92Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26703993"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26703993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 19:16:16 -0700
X-CSE-ConnectionGUID: 8IfLyTRfS8m00BdF6kZsrQ==
X-CSE-MsgGUID: 0sTEQ1auR0q/YfUVmZUGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76728339"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa005.fm.intel.com with ESMTP; 26 Sep 2024 19:16:14 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	andriy.shevchenko@intel.com,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH] media: ipu6: remove redundant dependency in Kconfig
Date: Fri, 27 Sep 2024 10:16:12 +0800
Message-Id: <20240927021613.2158020-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
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


