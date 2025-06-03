Return-Path: <linux-media+bounces-33973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C91ACC16A
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 09:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F7BF188F5E2
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 07:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFC627F16A;
	Tue,  3 Jun 2025 07:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZT1rGPpW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7762C3240
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936960; cv=none; b=ooJuM/RC2oQdNtqvpWFw9UYWIaJehEQd+ibZdO8G9kx9eQRHqnmCJMotSPrDXUdh0HX14JsQ++5bHIhcy+U4cjSFeIXEvlXSC1sQy31TRDXhPrbEGHutQO1y/wIj4t1EQEAoxSJ3qLxS1LDGsK6QhlLLTNnz/4WFa9xysb0czjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936960; c=relaxed/simple;
	bh=KA71A+S7LoVaWZrj9VfrkkqD/Qv97LDfSBWN6Xzl4LE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sLSS8i1wRbzQ1laShyW87KWa8RzqfiV/TmmjVdAejOeZjVU4cPjUy1uyFiSAfqgzcrbzgvwQKmm26oIgbHKjagkg6t4y7SiAl+MGAl3OAx/UfLL6NHPir1fW/caS49+qPnYlzDdOSSf/8FfZdqDOy+lq5w7Zukkd8KUvzqR+0VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZT1rGPpW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748936959; x=1780472959;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KA71A+S7LoVaWZrj9VfrkkqD/Qv97LDfSBWN6Xzl4LE=;
  b=ZT1rGPpWliQwYXuHi7jYbHvrYiALSzcsoD+QsN7oSTvwTp4XIXXx8P1W
   kWygxR4JqDuhHn52KnWeuOlaFMPtFmtsNdqWntAafC5AsfYIHzrWnAFlL
   HrZ2CT+1ohKXCxaFSShej/84Zgl/ockf2oINdFOx3IDf1JzsekBiaMtX1
   PS44g+l9ykwNUj8/8g9Kcle8iYbH7RnfZrnCUKJ8HuR5GZbW+qr/Kcxrd
   3pyn9u9sjoOx5ja0RtNxINvpbfBEHqJTCYHTseysYQ4kcE6+Mf4KwwP6O
   7BoYhQ7v4KWTk1v6Wa+Of0ZHlXZCtVqLlVeM6M5FdSGWc5vV2CwZjXpEO
   Q==;
X-CSE-ConnectionGUID: Hv1MAUR6TZ+LVvdBeA/Xkg==
X-CSE-MsgGUID: IoXtgc30TcC6WPHaurH44Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50659770"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="50659770"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:49:17 -0700
X-CSE-ConnectionGUID: ODZPJw8dSNORS4vPi6ED9w==
X-CSE-MsgGUID: kdv7QEOkRHS4r116yna15Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="144671262"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa006.jf.intel.com with ESMTP; 03 Jun 2025 00:49:15 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	stanislaw.gruszka@linux.intel.com
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH 1/3] media: staging/ipu7: add register definitions cleanup in TODO
Date: Tue,  3 Jun 2025 15:49:12 +0800
Message-Id: <20250603074914.2494111-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Some register definitions need a cleanup, so add a new item
in TODO.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/staging/media/ipu7/TODO | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/ipu7/TODO b/drivers/staging/media/ipu7/TODO
index 7031d0179c7d..3351720125f8 100644
--- a/drivers/staging/media/ipu7/TODO
+++ b/drivers/staging/media/ipu7/TODO
@@ -17,3 +17,7 @@ staging directory.
 - Work with the common IPU module
   Sakari commented much of the driver code is the same than the IPU6 driver.
   IPU7 driver is expected to work with the common IPU module in future.
+
+- Register definition cleanup
+  Cleanup the register definitions, remove some unnecessary macros
+  and 'U' suffix.
\ No newline at end of file
-- 
2.34.1


