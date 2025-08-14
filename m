Return-Path: <linux-media+bounces-39896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14594B26188
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 11:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 564DC1B6433E
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0A32F2912;
	Thu, 14 Aug 2025 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GszPgjYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E052F0682;
	Thu, 14 Aug 2025 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164938; cv=none; b=aCitffIrzKcWADPjWYnPRy4OU+nmiIeuToxyLZ5t/oFjq5uR94pZBlWU2ImhUMkJ/yCEOnN7q8RMuhQmxTXg9hyS/sIk1V6rcJbUDwqkO/C+x2JCstqBk+oWfZd2Ch1p8x+pl9iL0j4h7m4UlV7RAx5/zqjsdz9NtXL31B64SNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164938; c=relaxed/simple;
	bh=3HvWywzk/74wUW75FRjyiFEfmGATLSwPr1U5TNMV5n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/dMNC+2Ja2ybY69DzQNVfn3TqL91aEypxx/TR84D4WKwb0YgrtU1Azv5+B2pGn7mo0HILl0qYH6UWBwe2+tNmkQxUOlOTKCqWBKdJjOAhLVBApS+IJ2xf9vEAamGzwSeRM8xy1wY3CJxxu5kADCnVPX3nLRceb/D7JjJcDxvks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GszPgjYn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755164937; x=1786700937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3HvWywzk/74wUW75FRjyiFEfmGATLSwPr1U5TNMV5n0=;
  b=GszPgjYn+Mc47NZuh+kPUd32qE7V9LwWcLCEX0IMyBIbLUUJMeV2+I+4
   NAIrmZcCsWVo+D+LFPIXOR9D7zO0KRDB3rsHAvhObMhIe/drDF7o0kxHr
   DLN8CaP8SbRq1UhSsB/kq+VQgYEwaIDVGUKmufJX2viPxNxI7w9gCOY+1
   B+A2b4F7X2c1nePUlvUFJmO9Riukl3vUaibGMNXw7RUVl0++WEMOscd6M
   38FWleM1oHDVux1T2KjvFRANoIWZLnLYsw7GrLOszba238mYIupRfavxb
   K8RIO1xIUwGILfmSiAqMuvFUCCNGFAZfpzJBkDUMLn13tf5jZpAU/E23k
   w==;
X-CSE-ConnectionGUID: 3JiURt27S6qSsirEOPiEUg==
X-CSE-MsgGUID: Ccih2psrSNys3FQf5F2jDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67746949"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="67746949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 02:48:57 -0700
X-CSE-ConnectionGUID: P0zOSWwDSN23cudyqTm5/g==
X-CSE-MsgGUID: WVaXgAKtSlmIHh6TIzcekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166980945"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.150])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 02:48:53 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Chris Wilson <chris.p.wilson@linux.intel.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 1/4] dma-buf/fence-chain: Report time spent in wait_* test cases
Date: Thu, 14 Aug 2025 10:16:12 +0200
Message-ID: <20250814094824.217142-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CI results indicate excessive time spent on processing of wait_backward
selftest.  For easy comparison, report processing time of each wait_* test
case.

Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/dma-buf/st-dma-fence-chain.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index ed4b323886e43..80598da9237af 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -572,6 +572,7 @@ static int wait_forward(void *arg)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
+	ktime_t dt;
 	int err;
 	int i;
 
@@ -587,8 +588,12 @@ static int wait_forward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
+	dt = -ktime_get();
 	for (i = 0; i < fc.chain_length; i++)
 		dma_fence_signal(fc.fences[i]);
+	dt += ktime_get();
+
+	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
 	err = kthread_stop_put(tsk);
 
@@ -601,6 +606,7 @@ static int wait_backward(void *arg)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
+	ktime_t dt;
 	int err;
 	int i;
 
@@ -616,8 +622,12 @@ static int wait_backward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
+	dt = -ktime_get();
 	for (i = fc.chain_length; i--; )
 		dma_fence_signal(fc.fences[i]);
+	dt += ktime_get();
+
+	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
 	err = kthread_stop_put(tsk);
 
@@ -646,6 +656,7 @@ static int wait_random(void *arg)
 {
 	struct fence_chains fc;
 	struct task_struct *tsk;
+	ktime_t dt;
 	int err;
 	int i;
 
@@ -663,8 +674,12 @@ static int wait_random(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
+	dt = -ktime_get();
 	for (i = 0; i < fc.chain_length; i++)
 		dma_fence_signal(fc.fences[i]);
+	dt += ktime_get();
+
+	pr_info("%s: %d signals in %llu ns\n", __func__, fc.chain_length, ktime_to_ns(dt));
 
 	err = kthread_stop_put(tsk);
 
-- 
2.50.1


