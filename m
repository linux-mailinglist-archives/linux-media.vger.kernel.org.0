Return-Path: <linux-media+bounces-31743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0549AA9FED
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 00:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10C703BB118
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 22:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B746028C5B1;
	Mon,  5 May 2025 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIwrei4S"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1730A28BA87;
	Mon,  5 May 2025 22:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483375; cv=none; b=FA13bsqw9J01kW4KnsNtt03H+Tj/xghqnlnnUXDLoMDXGoLs2Jag/d1xonIEQQRBOrm/e7JmrMfMERZZtLRJ5qZN1QiyFHGHcnggo/qDkOtbfWTGqv+IxzgeSyK7Yi0rUKlJhoM2zF9/qWG+Htvk8xfqanlwLrWs55dhTHchuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483375; c=relaxed/simple;
	bh=ZEVyxOgkW7odVCol3qzWQcuns9JCN+tQHNj3sRiHBFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jwhqV6/EMuHZugs/224miKhummJ/hZHM5B5z9mStLZ194eWQ8YXBvo7bVTskK6oGWQa7Cs/5WE7Woe9dtD4AumuVuxI/fH5b/fp0Kcu/GaV/HXwZEFObpKQNOr4Zq4/klhDIbdhSR+Dbs9eXQ9mACmAY/HiBCQoxpfiYBJAuYn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIwrei4S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8D4C4CEE4;
	Mon,  5 May 2025 22:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483373;
	bh=ZEVyxOgkW7odVCol3qzWQcuns9JCN+tQHNj3sRiHBFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cIwrei4SUWePiZVbR6ta/ZrNf7ElXXAYzVqtK+yOJJUbGdMlnIkEz5sS4Vdlt+aIQ
	 KYJ8TgOE7Mju6j7EKDvC6Zc0F5YK9oMVLdyt95OE/e9nmIS6XClAs4XnX3GrQfH1Ek
	 Dt2YARQCVGEFkU6rLdpgx+ADCm34bAKUUhraqoUEVo/6J2xnnlmFOfoyp+WX5c9H1R
	 mHh+neWsbwZ76gcocFdwlXU8eamzAheWw3v+Pg0JNQ4TXYLUSaR4VmJ2obzMN2MvF9
	 M94HUA+nL2vDKCVk8fbSurs6IzprTeCBcxAopZ85ci1ket5dpRePio/dK7X7grJIWZ
	 U6XB4xYmdWSTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	airlied@gmail.com,
	simona@ffwll.ch,
	sumit.semwal@linaro.org,
	tvrtko.ursulin@igalia.com,
	xiaogang.chen@amd.com,
	mdaenzer@redhat.com,
	Yunxiang.Li@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.14 059/642] drm/amdgpu: rework how the cleaner shader is emitted v3
Date: Mon,  5 May 2025 18:04:35 -0400
Message-Id: <20250505221419.2672473-59-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Christian König <christian.koenig@amd.com>

[ Upstream commit b7fbcd77bb467d09ba14cb4ec3b121dc85bb3100 ]

Instead of emitting the cleaner shader for every job which has the
enforce_isolation flag set only emit it for the first submission from
every client.

v2: add missing NULL check
v3: fix another NULL pointer deref

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 27 ++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 22aa4a8f11891..f0d675c0fc69c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -754,6 +754,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 		    bool need_pipe_sync)
 {
 	struct amdgpu_device *adev = ring->adev;
+	struct amdgpu_isolation *isolation = &adev->isolation[ring->xcp_id];
 	unsigned vmhub = ring->vm_hub;
 	struct amdgpu_vmid_mgr *id_mgr = &adev->vm_manager.id_mgr[vmhub];
 	struct amdgpu_vmid *id = &id_mgr->ids[job->vmid];
@@ -761,8 +762,9 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 	bool gds_switch_needed = ring->funcs->emit_gds_switch &&
 		job->gds_switch_needed;
 	bool vm_flush_needed = job->vm_needs_flush;
-	struct dma_fence *fence = NULL;
+	bool cleaner_shader_needed = false;
 	bool pasid_mapping_needed = false;
+	struct dma_fence *fence = NULL;
 	unsigned int patch;
 	int r;
 
@@ -785,8 +787,12 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 	pasid_mapping_needed &= adev->gmc.gmc_funcs->emit_pasid_mapping &&
 		ring->funcs->emit_wreg;
 
+	cleaner_shader_needed = adev->gfx.enable_cleaner_shader &&
+		ring->funcs->emit_cleaner_shader && job->base.s_fence &&
+		&job->base.s_fence->scheduled == isolation->spearhead;
+
 	if (!vm_flush_needed && !gds_switch_needed && !need_pipe_sync &&
-	    !(job->enforce_isolation && !job->vmid))
+	    !cleaner_shader_needed)
 		return 0;
 
 	amdgpu_ring_ib_begin(ring);
@@ -797,9 +803,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 	if (need_pipe_sync)
 		amdgpu_ring_emit_pipeline_sync(ring);
 
-	if (adev->gfx.enable_cleaner_shader &&
-	    ring->funcs->emit_cleaner_shader &&
-	    job->enforce_isolation)
+	if (cleaner_shader_needed)
 		ring->funcs->emit_cleaner_shader(ring);
 
 	if (vm_flush_needed) {
@@ -821,7 +825,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 					    job->oa_size);
 	}
 
-	if (vm_flush_needed || pasid_mapping_needed) {
+	if (vm_flush_needed || pasid_mapping_needed || cleaner_shader_needed) {
 		r = amdgpu_fence_emit(ring, &fence, NULL, 0);
 		if (r)
 			return r;
@@ -843,6 +847,17 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 		id->pasid_mapping = dma_fence_get(fence);
 		mutex_unlock(&id_mgr->lock);
 	}
+
+	/*
+	 * Make sure that all other submissions wait for the cleaner shader to
+	 * finish before we push them to the HW.
+	 */
+	if (cleaner_shader_needed) {
+		mutex_lock(&adev->enforce_isolation_mutex);
+		dma_fence_put(isolation->spearhead);
+		isolation->spearhead = dma_fence_get(fence);
+		mutex_unlock(&adev->enforce_isolation_mutex);
+	}
 	dma_fence_put(fence);
 
 	amdgpu_ring_patch_cond_exec(ring, patch);
-- 
2.39.5


