Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D714979A6
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 08:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241923AbiAXHk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 02:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241892AbiAXHk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 02:40:56 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2529C061401
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:55 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v123so22289062wme.2
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 23:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZOOWkC73PSVhRT0FPLika7h1bqOJ9nqV8+v2bYOzvlk=;
        b=TnBh+fIYWftha2w3/naklVERd4+PeVS6nK+c/kdOAJnA4MgoECHm/VhS7+dPvxxPJ/
         xa4o/3zukPV2ZuRciIjCrLeRjpFq1oWSPIfIoNSuC8q0x8S89LFrva0n24JLVNC94c63
         i5tl/FGmYut9jTBwlUY8IeIlrBhTBc94TNdFrWXcOpVhCYMuxggdQqdmEzHBMMVMotIN
         u6SOjTEzTrrrt6xLtfShEIK4nW2nlCCiCVY3AiqioxwBK8kiKfmlv59XjIpmgAP439pU
         YMoQDe8OzFWHXQhUsGzt9qZcb4LMO5J32SCWQ+dLMxURUr9/YZfU3/0rSMmnk2RYGyjB
         OajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZOOWkC73PSVhRT0FPLika7h1bqOJ9nqV8+v2bYOzvlk=;
        b=RUMwcKZXlHZ657bnM2Ux19+yg9w9GvuTunYGTNjTCRGKP8THMZNi1FF6qCdg95hPiW
         KpzzdtecyVSUMQmQz8psv/HMUIer/G3jv0d7qIp+6D7slEyoOfICS+2Le9P4sxN32Csl
         UWbXHG71rrzTXR3rs/6mCT309Nmot2d87QLQZ6LcNrlXIM+5ueBh0NE6Wdb/saVrtu6c
         AAF3IWm+/uMCzczCq/k0f7LO6aPIiVURxGLY1/vgT63Eg8kC6RUnE3tY3FLxPdCHZc+B
         EnTLzLY60eHsdZwmti7st9rEo05ciGs5Sr8u4tb5ravqXxCLHjyN2LdMmXQ8SjhYudAB
         YmRw==
X-Gm-Message-State: AOAM533RqibyQtarT2As4oY0csCzRtyPOTv6BH17+km6VxVWSMu/OGrd
        OJoQnG6QHH/JDCfw1x6jr+Y=
X-Google-Smtp-Source: ABdhPJxLKgXz1O9g3pJlePgtBPG5KpWlMynNepWzLwMTxgMkVdNR45ard+HWfBWT5Sxvx7h09sy7Nw==
X-Received: by 2002:a05:600c:1d21:: with SMTP id l33mr637157wms.134.1643010054627;
        Sun, 23 Jan 2022 23:40:54 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id u15sm516370wrs.17.2022.01.23.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 23:40:54 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 9/9] drm/vmwgfx: remove vmw_wait_dma_fence
Date:   Mon, 24 Jan 2022 08:40:46 +0100
Message-Id: <20220124074046.4865-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124074046.4865-1-christian.koenig@amd.com>
References: <20220124074046.4865-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Decomposing fence containers don't seem to make any sense here.

So just remove the function entirely and call dma_fence_wait() directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c   | 46 -------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.h   |  3 --
 3 files changed, 1 insertion(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 44ca23b0ea4e..0ff28f0e3eb4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -4500,7 +4500,7 @@ int vmw_execbuf_ioctl(struct drm_device *dev, void *data,
 			goto mksstats_out;
 		}
 
-		ret = vmw_wait_dma_fence(dev_priv->fman, in_fence);
+		ret = dma_fence_wait(in_fence, true);
 		if (ret)
 			goto out;
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index c60d395f9e2e..430f83a1847c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -621,52 +621,6 @@ int vmw_user_fence_create(struct drm_file *file_priv,
 	return ret;
 }
 
-
-/**
- * vmw_wait_dma_fence - Wait for a dma fence
- *
- * @fman: pointer to a fence manager
- * @fence: DMA fence to wait on
- *
- * This function handles the case when the fence is actually a fence
- * array.  If that's the case, it'll wait on each of the child fence
- */
-int vmw_wait_dma_fence(struct vmw_fence_manager *fman,
-		       struct dma_fence *fence)
-{
-	struct dma_fence_array *fence_array;
-	int ret = 0;
-	int i;
-
-
-	if (dma_fence_is_signaled(fence))
-		return 0;
-
-	if (!dma_fence_is_array(fence))
-		return dma_fence_wait(fence, true);
-
-	/* From i915: Note that if the fence-array was created in
-	 * signal-on-any mode, we should *not* decompose it into its individual
-	 * fences. However, we don't currently store which mode the fence-array
-	 * is operating in. Fortunately, the only user of signal-on-any is
-	 * private to amdgpu and we should not see any incoming fence-array
-	 * from sync-file being in signal-on-any mode.
-	 */
-
-	fence_array = to_dma_fence_array(fence);
-	for (i = 0; i < fence_array->num_fences; i++) {
-		struct dma_fence *child = fence_array->fences[i];
-
-		ret = dma_fence_wait(child, true);
-
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-
 /*
  * vmw_fence_fifo_down - signal all unsignaled fence objects.
  */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
index 079ab4f3ba51..a7eee579c76a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.h
@@ -104,9 +104,6 @@ extern int vmw_user_fence_create(struct drm_file *file_priv,
 				 struct vmw_fence_obj **p_fence,
 				 uint32_t *p_handle);
 
-extern int vmw_wait_dma_fence(struct vmw_fence_manager *fman,
-			      struct dma_fence *fence);
-
 extern void vmw_fence_fifo_up(struct vmw_fence_manager *fman);
 
 extern void vmw_fence_fifo_down(struct vmw_fence_manager *fman);
-- 
2.25.1

