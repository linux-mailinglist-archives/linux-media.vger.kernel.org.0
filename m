Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79EDE49805C
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 14:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242915AbiAXNDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 08:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242893AbiAXNDo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 08:03:44 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4576C06173D
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:43 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c66so22837166wma.5
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 05:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZOOWkC73PSVhRT0FPLika7h1bqOJ9nqV8+v2bYOzvlk=;
        b=BN4G1G1uZmHVPUdddjzKNuL0BBo7JYTZkQQyIvk63C2H72ryniGJxuuRifcQLLoCcm
         hQwVCCkXY/wNaT8Z1LaA+v4ExIHN3M2+LZG+Ug8dM2uWX854BnKbbn68p/3FS2OroLOb
         xU7JiItwucYfKwsJ9Hn1ShkWz9e21axei8cwYaT+zsIxR1gHW1Un4Wf+iQTjGKG/E+Wi
         afnlSkLzpvjkp8rMGslR8XUxIXdZoNpKmak7xl9EwIMJy6OE+3pLF9L2trntd29LJy93
         UzUH+l1iyBU3yjh+Fy/gUyccrfa8UFM1UapXbIlsUQnUvBNQpK37fm9gCMyYjn58wLqU
         6RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZOOWkC73PSVhRT0FPLika7h1bqOJ9nqV8+v2bYOzvlk=;
        b=ea203a8fMBNhgZjmx9b+JDo2rvv5ZjdU8Arx5UUIMiTckFb9Nym2m9N6W0DrdA2f4F
         yYgvtE68NFKJt8miRYMZkK6dZNqbbY8nmQBpE8Aezspfv6XT4qvllg1Bv5e0E4YP0XA+
         7yJXIGLgTLMAKxPZ87fOjyOi1B2iT3aS76h0JpyQ+pT/q3/6CuIzJE0JM12YvYaXL0lP
         tg14Ogredpix5/MoXTjMRAyZorMrByd4MBGjodAWJFY52XlRBnrDCjNPt5DaV/0evp3y
         0L02bQ4V6Jbtsi8HmKpdjGX7aLO2yHb+1/XuET+whvmrUUEqTE7ngMXUrN8hr/piYyca
         Zh4Q==
X-Gm-Message-State: AOAM531Vbhp9nyd7SYY+YpNS8vxY+HfRLEqlDjLaYOWoB/+A4ZtPWjRD
        uJS6oRMRDUYq/BnT9rTvCt0=
X-Google-Smtp-Source: ABdhPJyM1SO5I7sGhctwpaezFuuegLgqLtmxJh+6i7GsHrfxCcvi0BoPrElxd8RWOVOT+IekzQ33ow==
X-Received: by 2002:a1c:e913:: with SMTP id q19mr1753907wmc.87.1643029422366;
        Mon, 24 Jan 2022 05:03:42 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id g4sm16543554wrd.12.2022.01.24.05.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 05:03:42 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     thomas.hellstrom@linux.intel.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, daniel.vetter@ffwll.ch, zackr@vmware.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/11] drm/vmwgfx: remove vmw_wait_dma_fence
Date:   Mon, 24 Jan 2022 14:03:28 +0100
Message-Id: <20220124130328.2376-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124130328.2376-1-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
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

