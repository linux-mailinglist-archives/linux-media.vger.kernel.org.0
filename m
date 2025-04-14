Return-Path: <linux-media+bounces-30169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773EA88287
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 15:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 989E17A4DA9
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519A12749CC;
	Mon, 14 Apr 2025 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixdHXDA1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BC28E61A;
	Mon, 14 Apr 2025 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637287; cv=none; b=eKaUfcN1iz63ww/shBtpyND+J1fvWl0uJdHlNsxEespRXLxB9rjsFHHTplWs8nefCLWoHFNLfx0WLGVGjDU7GJSwbC7FeYqQnYO2oJF8k/O2/C0toMvY7ZqDM4yPk6/5z8bcDD6qd+plcCubVe22yRdQGgrHMd1Z6I62eFUvoX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637287; c=relaxed/simple;
	bh=c4bb7948CzGoj3oK8R1FhfxFgh0zTsJGIPCWe8mgqO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SwWwrwMNdxBHhAimuUagUDNP5nTPiyxcnDW4cDYk7s5OjDkJ50ePxzT38r67YAy7Fm0Rz/uk05JyfREd57NgqGn72DOELtg5kZZZ3F9UA0SkeYJXsR1dM5Ey8mOT1rvN2AmerTlLzclWI6PTGtI3Clqy+pecLoGxMHcyb8NdohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixdHXDA1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D028C4CEEC;
	Mon, 14 Apr 2025 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637287;
	bh=c4bb7948CzGoj3oK8R1FhfxFgh0zTsJGIPCWe8mgqO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ixdHXDA1oaXbJ/ajJJx/tnZGSTWVfbw19e9orAdL7Oik1ZXGBOEtcZBxtTS0JnMbo
	 Yoa5S5s8606JbsHIbZB9b+SkLGk3TEnYNaSixzpjHYd6whDPzHhdWz5MEk3o/yyvcR
	 JDnGmUJxpA1vyTKGjbQMorGbrluD5mhbGI7XQWDM6/ZFUtVDWR/k4ItyPyW8xvYYmM
	 e+NEdtvKt5Wp1zTS3HWu3RTPYxrvUkqAUeOVmtsTqRQ6xrBsDBMwomele/SgzcYHFl
	 VXnNRgZcOoijVxknRrtSGMo1CD4wI8ek9sM2yHPweRLsXNGhRh9o0NC23CbjzMpRyx
	 sLVBQEN209/BQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Pak Nin Lui <pak.lui@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	Yunxiang.Li@amd.com,
	tvrtko.ursulin@igalia.com,
	matthew.auld@intel.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.13 15/34] drm/amdgpu: allow pinning DMA-bufs into VRAM if all importers can do P2P
Date: Mon, 14 Apr 2025 09:27:09 -0400
Message-Id: <20250414132729.679254-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132729.679254-1-sashal@kernel.org>
References: <20250414132729.679254-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.11
Content-Transfer-Encoding: 8bit

From: Christian König <christian.koenig@amd.com>

[ Upstream commit f5e7fabd1f5c65b2e077efcdb118cfa67eae7311 ]

Try pinning into VRAM to allow P2P with RDMA NICs without ODP
support if all attachments can do P2P. If any attachment can't do
P2P just pin into GTT instead.

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Tested-by: Pak Nin Lui <pak.lui@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 25 +++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 8e81a83d37d84..83390143c2e9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -72,11 +72,25 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
  */
 static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
 {
-	struct drm_gem_object *obj = attach->dmabuf->priv;
-	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct dma_buf *dmabuf = attach->dmabuf;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(dmabuf->priv);
+	u32 domains = bo->preferred_domains;
 
-	/* pin buffer into GTT */
-	return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
+	dma_resv_assert_held(dmabuf->resv);
+
+	/*
+	 * Try pinning into VRAM to allow P2P with RDMA NICs without ODP
+	 * support if all attachments can do P2P. If any attachment can't do
+	 * P2P just pin into GTT instead.
+	 */
+	list_for_each_entry(attach, &dmabuf->attachments, node)
+		if (!attach->peer2peer)
+			domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
+
+	if (domains & AMDGPU_GEM_DOMAIN_VRAM)
+		bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
+
+	return amdgpu_bo_pin(bo, domains);
 }
 
 /**
@@ -131,9 +145,6 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 		r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 		if (r)
 			return ERR_PTR(r);
-
-	} else if (bo->tbo.resource->mem_type != TTM_PL_TT) {
-		return ERR_PTR(-EBUSY);
 	}
 
 	switch (bo->tbo.resource->mem_type) {
-- 
2.39.5


