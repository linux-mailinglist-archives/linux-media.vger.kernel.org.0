Return-Path: <linux-media+bounces-39897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD76B2618A
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 11:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEDC95A6DC0
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755642F530B;
	Thu, 14 Aug 2025 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPWhRV9C"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549F2F3C32;
	Thu, 14 Aug 2025 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164942; cv=none; b=e1+rje8n7UCx+Q/koxDXy3SYtMfBxnouHAVy3CLDkXWofmEq6hBmazm4MtIB46BhOsxzxoYkTVqLwLPWO0FjcSPIdc8TQq6/FFjioYzVt1/GJxmlURBA7cL3EZWOd+fNmFXjypfUcy3DbHptb84oMLka4OPoKg3O8q3GAgFkX1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164942; c=relaxed/simple;
	bh=9H3qdfmrHoH0j64nmvr5Ic6+tT8BMGk7389BUcrVgFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShxIFTFw0Pmb99iGxJph88xqkxrQ/oLjqUSHkh+aiXs+3g5wnYOqg14BFGpO+MhNzARdhQhrx7pH3mBK6w5V9ltE8IvuI6fxALRktENce0swwyUr28mhBGlkx4DIpOVv1lnaTTTnP+K160FS/9d8Q4300jir7igIw6Sw9mg714s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPWhRV9C; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755164941; x=1786700941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9H3qdfmrHoH0j64nmvr5Ic6+tT8BMGk7389BUcrVgFU=;
  b=QPWhRV9CsBxAjw+mMuYzmQpLVdQrnNWwnToBItKy5oX0w3u2x9/WUuw/
   rajvXB6UzlRxO31S9FjKvE8QBZ+2s/caio5vRBcpNzm4ED7R4rqFnhyrM
   lYKGLkRkBG925zFKwTystQQUAxuKu2QNRamfpMa70ltPq+nM6KV00Uifn
   Xx63JCtD6phfOE7ZLlwfvgx8JvhTO1s5SsWmpe0tEIjXd8a0CownCRyfG
   yVQYcMgqbnMGuS7G0WuLKzzuQovVE97E1d/DOkJLBdxqsaQVPQ6zaopOt
   gEZGswe4iOisl80QdOn75dwdEjXs9OqbbuEnWiFc2Fh3w3HAWC1IW7dUA
   Q==;
X-CSE-ConnectionGUID: wKsRwhK3SL6pYTqZDsqdlQ==
X-CSE-MsgGUID: gokvXmNOSn227NpWobMEkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67746964"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="67746964"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 02:49:01 -0700
X-CSE-ConnectionGUID: 4Of09AkvQHqarNvX/65yoQ==
X-CSE-MsgGUID: JplX0PE3SDiTnAP8zoJ52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166980954"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.150])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 02:48:57 -0700
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
Subject: [PATCH 2/4] dma-buf/fence-chain: Let test cases decide which fence to wait on
Date: Thu, 14 Aug 2025 10:16:13 +0200
Message-ID: <20250814094824.217142-8-janusz.krzysztofik@linux.intel.com>
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

Test cases that create threads around __wait_fence_chains() function now
pass info about the whole chain to those threads as an argument, with no
hint on which fence of the chain to wait on.  That decision is hard coded
into the __wait_fence_chains() function which always selects the tail of
the chain.

Since future test cases may decide to spawn threads that wait on arbitrary
links of the chain, pass a single fence as the thread argument instead.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/dma-buf/st-dma-fence-chain.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index 80598da9237af..bff4192420d8b 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -560,9 +560,9 @@ static int signal_backward(void *arg)
 
 static int __wait_fence_chains(void *arg)
 {
-	struct fence_chains *fc = arg;
+	struct dma_fence *f = arg;
 
-	if (dma_fence_wait(fc->tail, false))
+	if (dma_fence_wait(f, false))
 		return -EIO;
 
 	return 0;
@@ -580,7 +580,7 @@ static int wait_forward(void *arg)
 	if (err)
 		return err;
 
-	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
+	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
 		err = PTR_ERR(tsk);
 		goto err;
@@ -614,7 +614,7 @@ static int wait_backward(void *arg)
 	if (err)
 		return err;
 
-	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
+	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
 		err = PTR_ERR(tsk);
 		goto err;
@@ -666,7 +666,7 @@ static int wait_random(void *arg)
 
 	randomise_fences(&fc);
 
-	tsk = kthread_run(__wait_fence_chains, &fc, "dmabuf/wait");
+	tsk = kthread_run(__wait_fence_chains, fc.tail, "dmabuf/wait");
 	if (IS_ERR(tsk)) {
 		err = PTR_ERR(tsk);
 		goto err;
-- 
2.50.1


