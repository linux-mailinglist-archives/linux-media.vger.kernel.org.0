Return-Path: <linux-media+bounces-32146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE405AB18BD
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 17:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 124FE1894FE3
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F3F22FAF4;
	Fri,  9 May 2025 15:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="G+LbfAUF"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85BB22D9E6
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 15:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804864; cv=none; b=Pgl4Xlg3jvJPIBItxR6oFgALadmcu3tDWOsXzt1GeJNHpprKQtKqTAh0qBX9S3VLmU4Hl4P4/ux3qHDXPeNI50lp0m9h+z8H4YuEXkrp7t+xmKWzX3VvgUkzFLp+ndAzlBobyW27CYPuPXn0+3zhzlYYb1m4MABmma1Gby38cPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804864; c=relaxed/simple;
	bh=k2gqgz17D8vqHDzwuGe5tgZBK5wK6UJ8ZAtjloIJkT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIwtM7XootXS1vmwibl0Jhdf38fARpodQbmgc4K6BDXDIcqOlkJybNXooC7CvU+yeMhH3yU9by9LMhl3f2cU3eQxBD4qIUsv3+ZSEl3CT/LP7wwcLs1Zb2IgjhmxA6V3M6w4CF8XSPP6yZVe4MeHDZpR57yjmTo4iX0Cx1142iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=G+LbfAUF; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=i8jRFnIq9RZiI6xIiwGtLjLgR0pFQSVqfW1cJxWzgkQ=; b=G+LbfAUFWZXGnLgeei0utpfcyQ
	vP3psuRmZwLr3FroWrvGzejaLfBDXhT0iRiVcg0IWHs/mflVb0mmQNw8WL4Yh69rz8Y+WiXWxAeGM
	lfxx9lM/6PUCziua6m4vqnx1iBCo3/B/otPomyZpPOk30AJxBhCp1dO4T3KvSj3BsvIDrzo12TrON
	SS8gLSA+AcoFUYDE+nO7HXVmw+NKndzvAfJ+D7Po5/HYmilY2sQZ7XVhPrvWfMyW7UADaYK1Jc7KR
	uOTqzJcvRxfu68s4p7D97RdP3ZBpC7ZUW60i0A2aAL3KUTFCWBmITsG0hrVXxuK5n50GfKZ2BglJo
	x3dhm7Jg==;
Received: from [81.79.92.254] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uDPfG-005oEK-Iz; Fri, 09 May 2025 17:34:07 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC v2 01/13] drm/i915: Use provided dma_fence_is_chain
Date: Fri,  9 May 2025 16:33:40 +0100
Message-ID: <20250509153352.7187-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded helper with the subsystem one.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 7127e90c1a8f..991666fd9f85 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -106,11 +106,6 @@ static void fence_set_priority(struct dma_fence *fence,
 	rcu_read_unlock();
 }
 
-static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
-{
-	return fence->ops == &dma_fence_chain_ops;
-}
-
 void i915_gem_fence_wait_priority(struct dma_fence *fence,
 				  const struct i915_sched_attr *attr)
 {
@@ -126,7 +121,7 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
 
 		for (i = 0; i < array->num_fences; i++)
 			fence_set_priority(array->fences[i], attr);
-	} else if (__dma_fence_is_chain(fence)) {
+	} else if (dma_fence_is_chain(fence)) {
 		struct dma_fence *iter;
 
 		/* The chain is ordered; if we boost the last, we boost all */
-- 
2.48.0


