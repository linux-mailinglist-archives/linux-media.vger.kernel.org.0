Return-Path: <linux-media+bounces-28402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B6EA670C9
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 996054204D3
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 10:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D04207DF5;
	Tue, 18 Mar 2025 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mecIlYJU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FE0207670
	for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 10:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292648; cv=none; b=JaavDqHiKIQzS4mfZnhqPyOqJ3oLlmBalZCKdlhKHvBSuLm+N+9xFZLiiMoBh4R39YFw8C3+yH+Bx0hoYLGVUFG2CAwU2yZSs3kFQy3m9a2kY8s7VB/46UgtUWt1Df6OZbnjQfm2FdrwpQx9lFPNfVdGESuhealnMhaW3fXJ1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292648; c=relaxed/simple;
	bh=NdOXlQY6LSxWk1LYo10E/kXzqa2q06qeotqWrI9rn+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oh9Jx5rSZyznM08+BNcS80PzlgeaomCWLl6U9dqMvOnjg5LJWpEIc9pPeF7+MfvFd0ZzEEZUppe/bZShbR1Wy0AIIikgbCVXv58dmOCt2OJO9OnFfD12CLNdC56l1cYzrSntYzeT2RqVIb5offrAihQ2+veoteH/YbXYGsxmvlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mecIlYJU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742292646; x=1773828646;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NdOXlQY6LSxWk1LYo10E/kXzqa2q06qeotqWrI9rn+I=;
  b=mecIlYJU0YftVApeqOIE39s2YOftwsJLKlSJyCla6jQN7Qj5SV9QKgV/
   WZlm/rpmKthX/t7H7xlcNiPd6m2JghNI+UW0oOJGLx/E/a21Davhwpp7f
   44FNvIR6UypE34MrSL2vDSV2/8cykeqxRW31AdDmiyuT0wpVE7JYXR1HW
   Bd0GrlppNyDFNjEOrbKdqD84bly1PDB6lCxBTlI8sJoIIObCfVJ8yOEFB
   5j9aF5y025f4A52j51BSjgFUUqNEmNcsvghm1rpYsR4WnhEosd+F35s7s
   lxotjudqFxuqn+6W4V9ZbLcH+gZv24aBXw4oAZwpmSRz/85DyXojClRDN
   w==;
X-CSE-ConnectionGUID: kd1gU6wwRCeYy4VUvg08Jg==
X-CSE-MsgGUID: 1ZTuPWX4TYaglP3I2p8X2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60817149"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="60817149"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:10:45 -0700
X-CSE-ConnectionGUID: YIfUjykRS0G6i1+39LA79Q==
X-CSE-MsgGUID: O2B6gmp6TGePTSuPEgsE+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="122713412"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com) ([10.190.238.72])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 03:10:43 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: christian.koenig@amd.com
Cc: intel-gfx@lists.freedesktop.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	chris.p.wilson@intel.com,
	andi.shyti@intel.com,
	nitin.r.gote@intel.com
Subject: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Date: Tue, 18 Mar 2025 16:04:08 +0530
Message-Id: <20250318103408.3566010-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give the scheduler a chance to breathe by calling cond_resched()
as some of the loops may take some time on old machines (apl/bsw/pnv), and
so catch the attention of the watchdogs.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Cc: Christian Konig <christian.koenig@amd.com>

Hi Konig,

This is not a functional issue in test. We wish to prevent softlock and allow the
dma-fence-chain test run to completion to verify it's functional correctness.

The performance issue takes about 5ms for the dma-fence-chain to be signalled on
older hardware which is an orthogonal issue and to be debugged separately for
which the test has to run to completion.

So, reverting to cond_resched() which fixes the issue instead of
delay functions.

- Nitin

 drivers/dma-buf/st-dma-fence-chain.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index ed4b323886e4..328a66ed59e5 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -505,6 +505,7 @@ static int signal_forward(void *arg)
 
 	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
 
 		if (!dma_fence_is_signaled(fc.chains[i])) {
 			pr_err("chain[%d] not signaled!\n", i);
@@ -537,6 +538,7 @@ static int signal_backward(void *arg)
 
 	for (i = fc.chain_length; i--; ) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
 
 		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
 			pr_err("chain[%d] is signaled!\n", i);
@@ -587,8 +589,10 @@ static int wait_forward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = 0; i < fc.chain_length; i++)
+	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
+	}
 
 	err = kthread_stop_put(tsk);
 
@@ -616,8 +620,10 @@ static int wait_backward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = fc.chain_length; i--; )
+	for (i = fc.chain_length; i--; ) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
+	}
 
 	err = kthread_stop_put(tsk);
 
@@ -663,8 +669,10 @@ static int wait_random(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = 0; i < fc.chain_length; i++)
+	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		cond_resched();
+	}
 
 	err = kthread_stop_put(tsk);
 
-- 
2.25.1


