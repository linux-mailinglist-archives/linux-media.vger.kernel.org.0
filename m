Return-Path: <linux-media+bounces-47937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A8C96BD7
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 11:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 350354E1874
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 10:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5DF305E31;
	Mon,  1 Dec 2025 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slheEfRM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD42304BB5;
	Mon,  1 Dec 2025 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586245; cv=none; b=JKUjPa8GVr6QgU5l55nnPz9MMrQ1B3BNfGKhzDJo+i8riDQaokdY/gyTNpKcKv2lduEupVWl0bmsh3mxVM0uNMbZB2YD53htsB1+4Fdev/R5hszPSxP22lfeRvgyzi13uSkq1Dnee8EzSLbNyMnFns8TXDO/n29EQauI+B7BJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586245; c=relaxed/simple;
	bh=soLLIRsbuDfyantBFZTK0Fok4YmEK6Tih/8wUoUvq3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q+dXGFC8093P7Xr0TTqdErJoyIugvRpAeK2Jbhm8snDD7hdrXq4Dk0vQmFK/ZBRx4wv+a4a30zlp94fqe0d2MEmI8raoP6NudgBvHTaESqFijqCDUsHiakhU8ra/lV8ZSaMl5t9zrpZsuHlBq8bbGXSrL9edINJrrdwJoSPRWOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slheEfRM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E21C113D0;
	Mon,  1 Dec 2025 10:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764586245;
	bh=soLLIRsbuDfyantBFZTK0Fok4YmEK6Tih/8wUoUvq3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=slheEfRM4qq4CBY706N9NiDZkoNhrtLL3LdJB3q+32lOQZN31j+ES1wWKUKQIZjMh
	 O/K1ln97Il8byeLhs+vJ+hNeGh6fn9oPvvd+S8fwyvw1XN41fLNHuEy8Rw2ptq5BIy
	 3EP5XlafFZUMbvVtGmZATm5tmVw9usBYsLFdXP57HcVGaC59EFEXlGib28hruszN2f
	 bGtjaF1xcCRi2nbyCN/n2hbmgPmfg5MDMZDWQ2K/20rA6Ba5BDbPGwUALNDDytAtLm
	 TbZbgiE5EP3tXtQq0LD5DTG3MQ0JjqN3QTts2r4CQDiUAaFaKdHWhnPGSynEO05c9i
	 YaHjWO07eZnFA==
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
Subject: [PATCH v2 3/8] amd/amdkfd: Use dma_fence_check_and_signal()
Date: Mon,  1 Dec 2025 11:50:07 +0100
Message-ID: <20251201105011.19386-5-phasta@kernel.org>
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

amdkfd is one of the few users which relies on the return code of
dma_fence_signal(), which, so far, informs the caller whether the fence
had already been signaled.

As there are barely any users, dma_fence signaling functions shall get
the return value void. To do so, the few users must be ported to a
function which preserves the old behavior.

Replace the call to dma_fence_signal() with one to
dma_fence_check_and_signal().

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index ddfe30c13e9d..4dc46ac6a65e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1983,10 +1983,10 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
 	return -EINVAL;
 }
 
-static int signal_eviction_fence(struct kfd_process *p)
+static bool signal_eviction_fence(struct kfd_process *p)
 {
 	struct dma_fence *ef;
-	int ret;
+	bool ret;
 
 	rcu_read_lock();
 	ef = dma_fence_get_rcu_safe(&p->ef);
@@ -1994,7 +1994,7 @@ static int signal_eviction_fence(struct kfd_process *p)
 	if (!ef)
 		return -EINVAL;
 
-	ret = dma_fence_signal(ef);
+	ret = dma_fence_check_and_signal(ef);
 	dma_fence_put(ef);
 
 	return ret;
-- 
2.49.0


