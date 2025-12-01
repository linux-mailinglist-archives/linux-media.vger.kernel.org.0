Return-Path: <linux-media+bounces-47940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B76C96BF2
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A31C3A47B8
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE9F306D3F;
	Mon,  1 Dec 2025 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cztmh2b1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604B305067;
	Mon,  1 Dec 2025 10:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586263; cv=none; b=MM64PQrPQIUrj5atwLDB5qYNU3GWnUCEfCOsO/9ms+2kzJb4kC0qtrPja65tdPb7dZNi7jsKvyY/T3kCxbAr4sWIEr+m6rXUz+BQA82DVAyuM+gi5re6qBOhUbu7gmM13cCJUcgx08E2ULL68JejcG4FqcThzKnDlOMcWLLQoUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586263; c=relaxed/simple;
	bh=weqR/k6bdbRE4AndEp4LhhGi2UzLYefCKJre4wdO4eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r3nW65jJlFqATTvKI3TRVI5OLmypmhe6Kq1OoJ7u41558QiZlDytg6qQDLidWgqQrEDDeuNo+WrxmyiIfxgPcUjRJ90VFTAbiD3KrtJwArGRW3JMfp+p4C+JJvJdJIrqkS3eFEKWh+UzKMy0aNkndPwBjjuKlANl1jr6W4Cs/cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cztmh2b1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A2FC4CEF1;
	Mon,  1 Dec 2025 10:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764586262;
	bh=weqR/k6bdbRE4AndEp4LhhGi2UzLYefCKJre4wdO4eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cztmh2b1+F4gfiasJbMsWE/qSkS82JpFMlm/0WEWAQq4MkG0cQ5prUks+WOxnrC+I
	 EnkNe36MccmTR7x1s738D9S1JOP/mYuReRRAR4Lh1nqZdbhUUOupxxY/0+TjxbiqzU
	 vPUSzr9Kxop6wOaxnR08AutarKfwoYuqMm37sLUxuoPy4bjbM7UnOTqqpItCtPnpUd
	 tIUm/S9EOpvMIVoVdbNIlwRP8H0vypQ8MJx1eIijrxjGXnc5KpM60zT3NBE7WG5rgX
	 yMUp16KlA+vQHzzy2Gz57WZLYDVj5ZxYl7B3DTLLRevpjF4hU9rORH199i2rKYGBKT
	 0xLO9jmc9Tn9w==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 6/8] drm/ttm: Use dma_fence_check_and_signal()
Date: Mon,  1 Dec 2025 11:50:10 +0100
Message-ID: <20251201105011.19386-8-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251201105011.19386-2-phasta@kernel.org>
References: <20251201105011.19386-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The return code of dma_fence_signal() is not useful and shall be removed
from the kernel. To do so, the few users who rely on the return code
must be ported.

Use dma_fence_check_and_signal() and mapp its boolean return code to
dma_fence_signal()'s former value for already-signaled fences.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 1bcc67977f48..eaf2e91f8e97 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -692,7 +692,7 @@ static int threaded_fence_signal(void *arg)
 
 	msleep(20);
 
-	return dma_fence_signal(fence);
+	return dma_fence_check_and_signal(fence) ? -EINVAL : 0;
 }
 
 static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
-- 
2.49.0


