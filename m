Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837054144BF
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbhIVJNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234321AbhIVJMi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:38 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A188C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q11so4617992wrr.9
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
        b=F49lYkFnegWrd3qlgnPML+3pWBFlCxQi8hPaL3IkY/T2Pu5Uk48yZxjGan3ZATjgup
         C5QHTbAIRs6YBAYc5r+6aCxI6MlQd7EoU6PCUc1gWbKrwZGdNgIXh0k3NQY/6eRyP/L9
         p+P5/V8ruIZgg+g3JbYRDaqsT5mnV+cO72Y9jRWnJQErZFwER5hxnwlSdyEcO5pNXPAo
         NzrWk8jy4KYGg42GWQb4iEMnMcxFUzTTs+QaE7e1czoM2oziMOMAzK2q9Y0rHgKcjncy
         54enIupRT4JkkAKl5i9mWHFyExSYKKv6xTS244XoWaAzZbtHlupuZGVtqQ31O+ai1Gh9
         e+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
        b=UxRvaYNMINRqbKA5CwDhpaJf0iA3hjHprdo3VQhg92+W3MxHxfmwkixwJK5mLyOzCB
         IDUDDkzaF50P2diiS/L/ZfQZvMSaVg6WAzAEfnQ26o1Vc6kVRZQk/+Dn95/dVeFtmVhs
         8lW3w2ENFntIXmNKU8bF5GST4r28PXX1ywmKE3e+NyZtCij/4e9bHF9H/zIBB9I5QAiX
         zosgQGERohkVd6gZHAODjjMAuTsV2wq77Qpnb/SVk9S0GRelwFDiQPGQqM7mDyZg3Jyr
         2K1o9TXsnR7VSnB45NuT4QcjCd/ZuceMgQFf4TZJ9lWYMxmpeul45ZUUFzmXWV0q66Dl
         aDjw==
X-Gm-Message-State: AOAM532yNZFoZrqiQZIZF1aJKxQUYW52b04uVVMkUZOmoZnz0sbp9KlD
        UWMRBk0CmSTrugy1JvOfWVY=
X-Google-Smtp-Source: ABdhPJxij0X4NLln6Bo5kmljRQhXFJ9MHnIUuxMtJ74eTJreF8hiz8KXvjUOfJEZ57PoSPjj7S6XKg==
X-Received: by 2002:adf:dc43:: with SMTP id m3mr22345425wrj.66.1632301867335;
        Wed, 22 Sep 2021 02:11:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/26] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date:   Wed, 22 Sep 2021 11:10:39 +0200
Message-Id: <20210922091044.2612-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..21ed930042b8 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_fence_get(fence);
+		dma_resv_iter_end(&cursor);
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	dma_resv_iter_end(&cursor);
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

