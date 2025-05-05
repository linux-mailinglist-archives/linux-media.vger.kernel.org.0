Return-Path: <linux-media+bounces-31764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A047FAAA7F6
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 02:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AC527AEBB1
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 00:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D38345D4E;
	Mon,  5 May 2025 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjVWBrcG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE97345D5E;
	Mon,  5 May 2025 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484723; cv=none; b=ew+rCDUV/Zxi4VJ4eWs+W+caVuHKFvF2R5bgUs8jEYEpxAkdDZ/NvfKl1a8kbW1KUaRQ0wePnLsxU7/QQaZrisIVG1sSPL3NlJspaPOtk1ZHsXVW8HrveTWZHkNWuCbAiAM83E6lCr5Y4MtOXaC9VNU33Js4Yyc1Hw/SASm3EuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484723; c=relaxed/simple;
	bh=UCniFifRyOgWkiIOjJhH5XF41uttbGOwqSC2QXJWxvg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O51koJ1bHeoMUWLpn8d9s0ABipPj2DIpmDBpltBG5Dlg3I3/63yPN2OkJfIcsLawwdUlbQKSgLgnUCszA3i0Cih5C5Hh+hOUiqlmVxdSaqZX819kH7A/T8nccbRrPsyiKJDMw078GHGW5M+EIzJrblbZtcssAFd6JEhqDLxXcVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjVWBrcG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8C3C4CEEE;
	Mon,  5 May 2025 22:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484723;
	bh=UCniFifRyOgWkiIOjJhH5XF41uttbGOwqSC2QXJWxvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TjVWBrcGazZLdJIIdnAORgzYGg7Pa70h3jVsoftIwO2YddFeBC76F3q0Tg0Ofb2Oz
	 hdBwBIxixQQrgvBK31HPSBW2a200iwlbj7ALbD2tRRVohuG+3tv5TQMpO5dfMTC/hk
	 iBFLyqrSeI4z2UlRBZ7fgDa3IKvy8jE8TCla6ZsFSpuyZ6/pQcm6ZDmfzZXpspHtn7
	 M+mDYinDkLllpXUS9ohn9UE2wrfCSHg81E/ljqb5GpqEKZm7CQf60CBuj54bP/tDVD
	 lWXdP7haBM329A101vd5kiQ/3XyPiOIGsptA8IK2CU7StKURjDmxSbRFV9BBnr8nyV
	 AabMod9vUxQ1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Andy Yan <andyshrk@163.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.14 628/642] drm/gem: Internally test import_attach for imported objects
Date: Mon,  5 May 2025 18:14:04 -0400
Message-Id: <20250505221419.2672473-628-sashal@kernel.org>
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

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 8260731ccad0451207b45844bb66eb161a209218 ]

Test struct drm_gem_object.import_attach to detect imported objects.

During object clenanup, the dma_buf field might be NULL. Testing it in
an object's free callback then incorrectly does a cleanup as for native
objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
clears the dma_buf field in drm_gem_object_exported_dma_buf_free().

v3:
- only test for import_attach (Boris)
v2:
- use import_attach.dmabuf instead of dma_buf (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
Reported-by: Andy Yan <andyshrk@163.com>
Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
Tested-by: Andy Yan <andyshrk@163.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://lore.kernel.org/r/20250416065820.26076-1-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/drm/drm_gem.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 2bf893eabb4b2..bcd54020d6ba5 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -585,8 +585,7 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
  */
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
-	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	return !!obj->import_attach;
 }
 
 #ifdef CONFIG_LOCKDEP
-- 
2.39.5


