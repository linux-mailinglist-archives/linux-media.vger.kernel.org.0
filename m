Return-Path: <linux-media+bounces-19199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3681993EBB
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 08:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98D8EB226B1
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 06:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F742187876;
	Tue,  8 Oct 2024 06:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGu2UhLY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1088317C7C6
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368362; cv=none; b=XVqFPLojmRAx+lvnUdlQouMfb2kU/S1Ae4pINvP84dxkVInW5ZuE5h4CiNUKDR5V9Je+fGlsrPGOlrFOhCVe8eBF9q50b9bpC5vDArH4yIv4on87AmwOnfzy6bZaEOGFhAF2JKIo5Iw5bV8av4GuyZmGLcSL9SLLUUQ4CTUZtoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368362; c=relaxed/simple;
	bh=RPUnhrWKkGrwcSLUUagmN1X+E8MTsP2KDIVRz11lmAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tQBE746qyAjjADK57r0kOlTtlIxdMSU/yy3p1tKIvFciL7jPT7tFJLesLDauEjJy0nlccwu7DJfOPUUC41JRjT0ygJzlJAx/nJUdk2pG6XNiLlMe6DyIi5do/fRQEkIa2vkcvs1cuorqQuoWzYK/LT8v4hQEqyvtcpo6laQ7XRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TGu2UhLY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728368362; x=1759904362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RPUnhrWKkGrwcSLUUagmN1X+E8MTsP2KDIVRz11lmAQ=;
  b=TGu2UhLYZMnztzhL9GZnr6g0vAnvifJBJjbuPUhpQD9z4MnyI/sE+vCS
   quLQzkRtpSPjyjkMewAf52ukUzKPKkw26frSybG5mrb3bhOPukilNUSQU
   xWcP8YKYeOyPHBDO2KypLXbB81QkJrV182uAah3DWcqbNbt+27liVV6aK
   lAya9T9NKk89UdhEYOpjlB8A5nBQfyEwnP58DIgAizJ16SszspI1JtB/3
   sGhMbK/YVfENYNccn36nfHAbCVlHny+gccPI3ESa5p8I6GC8kxwVt7S12
   kNQe0Hk0kP5c86MD/gPokZdgI1/4FeDLFtrSJ+iKleHamOl9/lW1Y5QtW
   g==;
X-CSE-ConnectionGUID: /Bu4fCAxQjCoJoqV37cnyQ==
X-CSE-MsgGUID: hz8d8UndTZuJHr/BJVj5YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="50068171"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="50068171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 23:19:21 -0700
X-CSE-ConnectionGUID: 985KsIwmSR6n7udpJg3L8g==
X-CSE-MsgGUID: noPOkYJ4TKGM2ACXoVtrTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76555655"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa008.jf.intel.com with ESMTP; 07 Oct 2024 23:19:19 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	andriy.shevchenko@intel.com,
	sakari.ailus@linux.intel.com
Cc: bingbu.cao@linux.intel.com,
	bingbu.cao@intel.com
Subject: [PATCH 2/2] media: ipu6: remove redundant dependency in Kconfig
Date: Tue,  8 Oct 2024 14:19:16 +0800
Message-Id: <20241008061916.313517-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008061916.313517-1-bingbu.cao@intel.com>
References: <20241008061916.313517-1-bingbu.cao@intel.com>
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


