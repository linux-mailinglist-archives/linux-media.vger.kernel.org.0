Return-Path: <linux-media+bounces-35872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 906CFAE8506
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2680F189102C
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 13:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D9C26529E;
	Wed, 25 Jun 2025 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuyY1bco"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476B264634
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858971; cv=none; b=hPreOYENsVQYiZjJggya2CmfJ0DdFIeZ6OQq9j4ptFO0E92g3qGopmex38+QL3AQZY0Pb849cH6TfIWHshMgkSEkGbSbcycDwd+oxA30GyxWq2+y+0vS+5jibS+a6m0pqskpy/w6mFgKzBY6SKSOVlE9B4wi9YknJf5t177SWRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858971; c=relaxed/simple;
	bh=pTs98oZthV9/n0BLQ75YBurHtU/4wSRdhwPJWVb7ifg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uEe92UWQaBVesMdiwcCefHwRPHAqRZHSQQmdMfITGUsnBJxLKl2A00vUGtUs+BLdmcZ9ZM+9yzh4FTHyhVaD50NCb8WPFahp8w7zjO8y5bYiGg9XU4+N0OV+Nz0flPX4R/MYemhukBQP2WQXeNaYEyh2nKs9vUQZbGyZDP6fr3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuyY1bco; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750858969; x=1782394969;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pTs98oZthV9/n0BLQ75YBurHtU/4wSRdhwPJWVb7ifg=;
  b=iuyY1bcoo2bn1b7+684PLpjWOg0QuSyJatl1771vZdOklckFI7fWZQXy
   7uD4dg6+D/ytNSmC/lloTtRry339LGqkftvQJch2CoiZzDeZEliA6InKW
   LX81xukBzj4lgXuKp5TtKwRv0xFCSSKHWfjRoCAW4xMJSr+SQxdrDpWvM
   vbCo5P/BLieIl8AoLTd6MGkSvtdTbwLQDrs5au1zYJMSb6M8xWqstQGyI
   n7039MnZ614tX+R5UoV6y7UreVwvYlimQiXyOqDiQfDWv+390+hbIAGWX
   K9R1PIwX2KojtKFPzeHc/Il3kjEc8cqwIza1xzmWHZfMI1AqIE15xOhQL
   w==;
X-CSE-ConnectionGUID: 2tdAHK55SIKCp3U9tNLgWA==
X-CSE-MsgGUID: VxGG1qtjTr+vutL23BWvZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40748518"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="40748518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:42:48 -0700
X-CSE-ConnectionGUID: /2yC2pabQEacaQ1Opuh1zA==
X-CSE-MsgGUID: 17RWk4WcToieFlo99AS6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152354054"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.155])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:42:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9AA1711F9DF;
	Wed, 25 Jun 2025 16:42:43 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uUQOh-00BS7k-1n;
	Wed, 25 Jun 2025 16:42:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	stanislaw.gruszka@intel.comjoe
Subject: [PATCH 1/1] media: staging: ipu7: Include missing linux/export.h
Date: Wed, 25 Jun 2025 16:42:43 +0300
Message-Id: <20250625134243.2729708-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include missing linux/export.h in IPU7 buttress, DMA, MMU and base PCI
drivers.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu7/ipu7-buttress.c | 1 +
 drivers/staging/media/ipu7/ipu7-dma.c      | 1 +
 drivers/staging/media/ipu7/ipu7-mmu.c      | 1 +
 drivers/staging/media/ipu7/ipu7.c          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
index e5707f5e300b..37f1d659ded4 100644
--- a/drivers/staging/media/ipu7/ipu7-buttress.c
+++ b/drivers/staging/media/ipu7/ipu7-buttress.c
@@ -9,6 +9,7 @@
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
diff --git a/drivers/staging/media/ipu7/ipu7-dma.c b/drivers/staging/media/ipu7/ipu7-dma.c
index a118b41b2f34..fdd4d7f5bc35 100644
--- a/drivers/staging/media/ipu7/ipu7-dma.c
+++ b/drivers/staging/media/ipu7/ipu7-dma.c
@@ -5,6 +5,7 @@
 
 #include <linux/cacheflush.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/iova.h>
 #include <linux/list.h>
 #include <linux/mm.h>
diff --git a/drivers/staging/media/ipu7/ipu7-mmu.c b/drivers/staging/media/ipu7/ipu7-mmu.c
index ded1986eb8ba..7c2695bb3723 100644
--- a/drivers/staging/media/ipu7/ipu7-mmu.c
+++ b/drivers/staging/media/ipu7/ipu7-mmu.c
@@ -14,6 +14,7 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/gfp.h>
 #include <linux/iopoll.h>
 #include <linux/iova.h>
diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 4a70d3527cb7..48e9f4aa3cc8 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/firmware.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
-- 
2.39.5


