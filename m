Return-Path: <linux-media+bounces-30167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C4A88240
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 15:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A295A165059
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08D9274FDB;
	Mon, 14 Apr 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1JpGONG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BD2274FCD;
	Mon, 14 Apr 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637210; cv=none; b=dM1afe2aQND65d5UteBPSTYll30Tim7zPxK/icmqnsHC9RoHj8zczhV+5ERBnsaPrn9ZDD+fXyJl40Hs5MLhVEcgdhVYkYOMYRpxoc+s47TzlpWIaSz1muhtscTOYovwegJPW9FPZMhKTOj4xmVAT3EPv5fPFJ9Yl1Y3Pa544+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637210; c=relaxed/simple;
	bh=SdDfakErbtdXom8mNq43V5dM1oZ0WLZRyARK7WSfqzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxWnopow6nc6ow8c1q+8zH3j21/875I2Vyo/7sigZPSJ3rR4vHBDbqf0L0x5LSr+g8oQf1U4ANuraIRsg9aBLiuP8I32UmBrDq176kRKhuMMQpzqVQ1bIOeoJQGR1hitXX4wtKclomac5jXl2P7q0Raa8s8KjDu/WCthq/vOSts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1JpGONG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E6CC4CEE2;
	Mon, 14 Apr 2025 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637209;
	bh=SdDfakErbtdXom8mNq43V5dM1oZ0WLZRyARK7WSfqzw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l1JpGONG+RcbEWd30Kzz9TuwD+D5Cse5EIrCCnU0eH8twfL9GLfyjPnFlV3ji3nxP
	 SXyK09P72LVDmVFuBYQSxBdrqWJdJx3TWbGJvd7SJkOtkYkmweDpMxKctWdsnDg5HW
	 NeZKaGDTqEF1ic6gpQti55dpj8oKji7gt2918LgGUd8raoxYx4HcNlchiJq/HYghXr
	 Dc2ezFo3ecWsAjJLATzLVP0+6ichFcz4kwJvP4Adaeov8zOUbk/21bMiKYDK64LDSH
	 C9heVxRZnw7qKCJqYi/CBtX94k0IMpMyS1kG0zqJma7t0X80GyHZ/uPYKIuTswut+4
	 psdH+h1/XFxOQ==
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
	matthew.auld@intel.com,
	tvrtko.ursulin@igalia.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.14 15/34] drm/amdgpu: allow pinning DMA-bufs into VRAM if all importers can do P2P
Date: Mon, 14 Apr 2025 09:25:51 -0400
Message-Id: <20250414132610.677644-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132610.677644-1-sashal@kernel.org>
References: <20250414132610.677644-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.2
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
index 9f627caedc3f6..ee47f239c8c12 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -75,11 +75,25 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
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
@@ -134,9 +148,6 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
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


