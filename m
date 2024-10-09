Return-Path: <linux-media+bounces-19299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FD3995EE9
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 07:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FD161C21C27
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 05:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36545155A2F;
	Wed,  9 Oct 2024 05:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOihuNs7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A6155744
	for <linux-media@vger.kernel.org>; Wed,  9 Oct 2024 05:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728451238; cv=none; b=I1VdslYZpYuJYaHQry9/gHSRCk7MvA/eYwi4bhr4Tv5bUzRlDIIq1aMuzOF2XlU9sRQXcL5vz60+SFST1YahSfoV2TvgLqwdF5FTxDLOjfK1FtDIyHK1r6Gr2wInwG0X6fP8zlV1orrcUPxtH5PUXRQrWYN8PSg6yZ7UOWpIuZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728451238; c=relaxed/simple;
	bh=onGQk8xQr/JGgO11C5CbCd940iP6HZZbFkwiWiD3S7U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nniC3EIjQQWvZE1yiNKXCfhapRaUB7xE12cRbZQfV6CrBwCHIiBYWHHHgHexsMcKiEoKESw3ClSTFZ7EjDeu8RC/p84e/cvDqLao/Myv6onlJDS0YxfS71IIEibAqrxHipYyHGfg2E/Z0lleUCJN/CXBAvrKsdxZw99Js8TiRjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOihuNs7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728451237; x=1759987237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=onGQk8xQr/JGgO11C5CbCd940iP6HZZbFkwiWiD3S7U=;
  b=TOihuNs7qJ0F+bcZc0PFggJ6lnGc2Q2SdZ8k2Pr69RL7MW4dLQmxDT0F
   glndqmhBS0h6IerCuThRjKFU1O1RGS0B2yw4Yeb5cZL3bnslkPZ59Gtre
   CAR5u8AwJv1d2NNNiiI3uhQkZIIIBa5O3/fPFeN1K4rpJDFQTAmjy/hT5
   ZuNsGZHWEaKDnuiJdpVC6OFtXD0wWc6q4NHYb3llfnovkpjhbREE1ooyO
   kEtisgYQ84WTd4Tj71DXKI2mo5C9guyruHjM/xXPVLdlyL5Y1adn+StL+
   Cs7BfspZQB2l73ZmGVdwlUEzpCjF750NWo/03jQ+OFgJ6YjFlOYrOoKTz
   Q==;
X-CSE-ConnectionGUID: SERfp5sBTWqGxQjN5Liyww==
X-CSE-MsgGUID: v6PqxtDhTeGy6XR4qyrXOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38315004"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38315004"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 22:20:36 -0700
X-CSE-ConnectionGUID: fj4vlQg3TXm72nmZsmkWsA==
X-CSE-MsgGUID: gzM8iEvCRFWqSX4aF5/jUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76441384"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 22:20:34 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	sakari.ailus@linux.intel.com
Cc: andriy.shevchenko@intel.com,
	bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH v2 2/2] media: ipu6: remove redundant dependency in Kconfig
Date: Wed,  9 Oct 2024 13:20:31 +0800
Message-Id: <20241009052031.2798618-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009052031.2798618-1-bingbu.cao@intel.com>
References: <20241009052031.2798618-1-bingbu.cao@intel.com>
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
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


