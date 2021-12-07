Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C01046BB35
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236414AbhLGMiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236437AbhLGMiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:38:04 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEACFC061746
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:33 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u17so21838807wrt.3
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
        b=NyRHc2dOyMR8UYFZOds4WJULS6HB3ElXGKZ69Du75Uu7X8lwJw2c6YS3Lqqq76LaSo
         5g6ZRF6UN306GmoUH+2742aTkbVh4r/vdQkJ/GoIJ6d0HxpzBKH2FvxpborgKrRgsnis
         +en0SrdQGibK0Muu/NinBnCEBdqIvrBy5RthG7C/nwoGVP2FT7rjDk/9sjqnDGdES/Hk
         zYbsZH3yTb/6wjSXkDTkQKJMAJBt/aEyd5UnbR7jc+sUE7ySksV+2a8M7HH1K47RG6zA
         V+g/WWigMHFMNG7jdv0gJIt23gBLif/PjFswpFdWWYr9m7vkL7371FvkYilGiWQDYj1D
         Uw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
        b=UbTRCC82Ow+ZSi3Niz+z5jkOzfyzsULhlasrrAWGp0QFzrGykVI8aRlNR870UnJeqD
         2y7ViG0SGCwB1trcjnkd0wl4kLz2wYog6C9tIvbPOBRl9FYCzrBYkJDR/ITiG2MBy8IX
         1hrXSNpuApcIzbchb6rUP+VQX9b5Sh3t1S9BZsrfzmPkgqALl86H2EgTb/GHsHSx+DKC
         NEI9uBrmSVqnDGa72/lSP1NHhtk20eOcTiqzXK5/gzZZ5WcCgkevmSQUfjYNvnSF+12e
         6n0dMTpy/A89gHzy4DcfW2Jb9zPV4bXZkOxLwSXmOJP3WjS4bxAcrKgNZy1mgG4FTuBu
         ckqA==
X-Gm-Message-State: AOAM531YQCkmS7G1+nF1r9qp5POzvLNpKb4rKkbHX47UV0nsEgaMp4I6
        5fsvzDJuM8keqrwvff649vI=
X-Google-Smtp-Source: ABdhPJy4tl8FIQpZCC9417zbGijuKU9nqOQh49XTjL+wYdTPclCUj4l3tT+GEq1uPihLl6SujlSYbQ==
X-Received: by 2002:adf:cc91:: with SMTP id p17mr51127729wrj.589.1638880472551;
        Tue, 07 Dec 2021 04:34:32 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:32 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 15/24] drm: support more than one write fence in drm_gem_plane_helper_prepare_fb
Date:   Tue,  7 Dec 2021 13:34:02 +0100
Message-Id: <20211207123411.167006-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index c3189afe10cb..9338ddb7edff 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,25 +143,21 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
-	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	dma_resv_iter_begin(&cursor, obj->resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: Currently there should be only one write fence, so this
-		 * here works fine. But drm_atomic_set_fence_for_plane() should
-		 * be changed to be able to handle more fences in general for
-		 * multiple BOs per fb anyway. */
-		dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(obj->resv, false, &fence);
+	if (ret)
+		return ret;
 
+	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
+	 * to handle more fences in general for multiple BOs per fb.
+	 */
 	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
-- 
2.25.1

