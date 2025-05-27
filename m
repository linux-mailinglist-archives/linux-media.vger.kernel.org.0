Return-Path: <linux-media+bounces-33482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31743AC560D
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 19:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9F41885042
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 17:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0065427FB10;
	Tue, 27 May 2025 17:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NNg+bJxU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594811E89C;
	Tue, 27 May 2025 17:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366220; cv=none; b=dWkzfBI8q/mj/ukPUO0KVDg6DHwwW5rdUaHwAEBKMJRDLDJMfOWJuswmNEOingIanmq9qCqg8RivJK6NIIBzlZdssxpC+vEw61L+Vo6k+CFmAsQmIK+tu77PotbDDnHjxP8K7AjJJtiiZJj++X+G0qss1bw3Ea0jYEJwFoxGRPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366220; c=relaxed/simple;
	bh=rXR+j7SzkBphvPCQmVf0AQbUzKSDcaE0HgfxPMuKOsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOfM+hjqDIoR5aSkgI1xwq4tQ1LEjfGXbqP89wgyWbOsGs6NNgqySmR5zrYKxxJDPM7zxPasySHYKTwe+hhgh+9uBZvRKumLNbnGpXdxnwd9m7Su7iHB/fUnfwvTSTLjb5ImhIB858UW3OhT8MAPhMqnhPCrrfkB7wRbzWv7K10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NNg+bJxU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D13EC4CEEB;
	Tue, 27 May 2025 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748366220;
	bh=rXR+j7SzkBphvPCQmVf0AQbUzKSDcaE0HgfxPMuKOsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NNg+bJxUOAt/PcwQYa/noEn0OWxych4EvIChVQ67RktpCrXiU09rgXyZgKCMj61/B
	 yB7URlKSEYR/BqFJNXFZ0BkmIDjn55P+414KAhI5N8sX02Ml1CKg1L5TajXRO9is+A
	 z5PoTN4te78iJMdKFp+qNmsBU8Hy9AhV69ZeEIvI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH 6.12 626/626] drm/gem: Internally test import_attach for imported objects
Date: Tue, 27 May 2025 18:28:39 +0200
Message-ID: <20250527162510.435633025@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527162445.028718347@linuxfoundation.org>
References: <20250527162445.028718347@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 8260731ccad0451207b45844bb66eb161a209218 upstream.

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/drm/drm_gem.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -580,8 +580,7 @@ static inline bool drm_gem_object_is_sha
  */
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
-	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	return !!obj->import_attach;
 }
 
 #ifdef CONFIG_LOCKDEP



