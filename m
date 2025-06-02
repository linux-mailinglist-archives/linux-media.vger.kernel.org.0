Return-Path: <linux-media+bounces-33934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB7DACB330
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 16:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 269F61942709
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 14:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAA22253B0;
	Mon,  2 Jun 2025 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nb9MNeYX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFAB2C327E;
	Mon,  2 Jun 2025 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748874202; cv=none; b=m7B+sqQi7EY4AI8CF1dlwmgjp0OoX6qo0eDIs/8ix/zudrWDr0eGOzeaQsEpQx11VqUIMzPL1ZKeY2qukbrkBnpbjBcZnoHWEUB+AKyHqD09fxwIQnZ6m5Eg4vmHMMm5d0eNE2Y433dfH6JKxR5WO7ub7U9s91GPLpP2C86BeV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748874202; c=relaxed/simple;
	bh=iUzlmyuE3KzGN6EwcgbeLBTuduXBTYp2vKPAEfXyhYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dky2ehreBilNrXgieMDtHjhyI8ww+zgg6idXmGXBbWBQ4zHnq2JyeOyYCsE1nGR5DnzHH1qnMSQZutRmYyLhqwmgzkL2ui4la7YNVCCWqduhKC3eNQMvhRIIvO5wX1fA0ThVKa7SdEf3Ifm4ilX0aO8Ewt2VDvheH5CAl6jyO1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nb9MNeYX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4782AC4CEEB;
	Mon,  2 Jun 2025 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748874202;
	bh=iUzlmyuE3KzGN6EwcgbeLBTuduXBTYp2vKPAEfXyhYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nb9MNeYXH3litdvJnm8HXo7tl6aQBXO6/iQiTbcxGmDKnkaAU0GQOeDL6OPuDD8yt
	 kZXkY2/XWMX2MkUj53VwQCBs5QMbr9H+OFTRr39zOMOtMV9Ae42Cp4R9VFrsxkP0mk
	 gXC+jJMoT5kcbDOv5o2PtI0Fx61caSVhLs3t0UOs=
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
Subject: [PATCH 6.6 391/444] drm/gem: Internally test import_attach for imported objects
Date: Mon,  2 Jun 2025 15:47:35 +0200
Message-ID: <20250602134356.780212081@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602134340.906731340@linuxfoundation.org>
References: <20250602134340.906731340@linuxfoundation.org>
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

6.6-stable review patch.  If anyone has any objections, please let me know.

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
@@ -567,8 +567,7 @@ static inline bool drm_gem_object_is_sha
  */
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
-	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	return !!obj->import_attach;
 }
 
 #ifdef CONFIG_LOCKDEP



