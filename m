Return-Path: <linux-media+bounces-35862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9214CAE7F01
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 12:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE4C3B0E65
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 10:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B9A27E059;
	Wed, 25 Jun 2025 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOp4Ur0Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA0C29AAF7
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846902; cv=none; b=AZ9ZuDLAiTs2GvqOIM09rSorUWyOEUl+IcoE3gwhT9Uavmtkw/5YjqW2kWAKUCmliiIO8WJCO+TPwm15wVO5TRq5heyQBaCR+CViHKWv5nzVIkiv7DmHjvpHhh/sWJDP97XyB04YHvEJ0NZl2y0EdmPzVvlc1CRis7S72J5vbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846902; c=relaxed/simple;
	bh=Z6FhskCoDkkgwCI/q33sxtcC1fFDcDjFGC15X5JKJS4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lv9QN21so2GYudjNJImEEnjHJzahisOWK34LVjyIUp/9r9Zhrw40pNUp2hNRv3EScfVnAhfrE7tM4bHVpduqNg/dZc+3x7M7cM/+zxR+zfBlAsp5v3IydEU9HJm4Kkcs+4rPbbGkEyPdapaqp7OFiGX6/0kGtbU6lhdcCARhD6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOp4Ur0Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750846901; x=1782382901;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z6FhskCoDkkgwCI/q33sxtcC1fFDcDjFGC15X5JKJS4=;
  b=HOp4Ur0ZvICIW5vKEJtBqHnNI6Lz6xDiJq/5pWr5yLLNlb6OkSTjIF0M
   7qwKneUPs4oAHZLF3ZJOnK/DS+zAxYP6A3qT0plAJj+EkZGd936HcwUxl
   M5CZ6X4EeucP00gjMpJgIZYPuuHhdimvOpPyF8AvxU34bbhmoXSEbep9N
   3drJMn5s+sJqGKzgKXkmRzLjmzmoXzhIHYJ1COmVmvH7XHBzYYIlvljwH
   MSWVuzoP91eD+Dri2+iJEaLPeIGDETxxGu6G4zWjwICGBYCwlToQ7OXJl
   eQFgdZduxfaIAevffZK3LwSwCxeYoAejTR3sOoKME7VxElIEaub4KJU41
   w==;
X-CSE-ConnectionGUID: WfTv5PV0QuGukI4GQWvXiA==
X-CSE-MsgGUID: H8CTDmIZR3uMT8MDyi9Alw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52341327"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52341327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:21:41 -0700
X-CSE-ConnectionGUID: 5fM2+QqPTK+mHNn1kFzHHw==
X-CSE-MsgGUID: Em7NFhFfSSCh9GJ2HkEsgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152353686"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.155])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:21:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 09A6B11F9DF;
	Wed, 25 Jun 2025 13:21:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uUNG4-00A1pd-3B;
	Wed, 25 Jun 2025 13:21:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	stanislaw.gruszka@intel.com
Subject: [PATCH 1/1] media: staging: ipu7: Drop total_queue_size variable
Date: Wed, 25 Jun 2025 13:21:36 +0300
Message-Id: <20250625102136.2390313-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable total_queue_size in ipu7_boot_init_boot_config() is redundant.
Remove it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi folks,

I'll squash these to the ipu7 set.

 drivers/staging/media/ipu7/ipu7-boot.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
index 666cede396f9..d7901ff78b38 100644
--- a/drivers/staging/media/ipu7/ipu7-boot.c
+++ b/drivers/staging/media/ipu7/ipu7-boot.c
@@ -209,7 +209,7 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 			       int num_queues, u32 uc_freq,
 			       dma_addr_t subsys_config, u8 major)
 {
-	u32 total_queue_size = 0, total_queue_size_aligned = 0;
+	u32 total_queue_size_aligned = 0;
 	struct ipu7_syscom_context *syscom = adev->syscom;
 	struct ia_gofo_boot_config *boot_config;
 	struct syscom_queue_params_config *cfgs;
@@ -252,7 +252,6 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 		u32 queue_size = qconfigs[i].max_capacity *
 			qconfigs[i].token_size_in_bytes;
 
-		total_queue_size += queue_size;
 		queue_size = ALIGN(queue_size, 64U);
 		total_queue_size_aligned += queue_size;
 		qconfigs[i].queue_size = queue_size;
-- 
2.39.5


