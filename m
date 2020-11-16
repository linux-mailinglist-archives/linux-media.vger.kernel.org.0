Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA5C2B4E4A
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733203AbgKPRnt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387816AbgKPRmF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:42:05 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB68C0613D1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:42:05 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id b6so19669955wrt.4
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B656eLYjE1FZlTbAcLYHtkBSzMjn1Kq22EcK7SpZuzI=;
        b=cqmrXntlw3DQnt5lF1CYf3WMXHIXS25fxnTj07nOs1OnCw5c1rVANuO5n2oIQyYQHT
         4Kt98XLHFVjJBheC9Pq5A3zK2E3iwNZTZW8CdMKt9h6k280mVzldBX0aBJU82KOHJNZC
         K4troDtjJnBrA+vQSFbOol2J/naEt2ssUlg13Qi7VjG/pkYNnTOzYXXp7Lm8orIEbBCi
         jUKtESeFbIhzclHqmUqIvYiMsRq5s0pj4xPEIgzIY+rs4PEQcxcSV2MODdody8XeS5vb
         cSeQFWCIMzTqv0c9fI8pl12oKO06x1Cyskqe0LzQ2u+ZBjSrbR5ps1YitxXAG/GrnkoQ
         4p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B656eLYjE1FZlTbAcLYHtkBSzMjn1Kq22EcK7SpZuzI=;
        b=Il0ijuqc0j41TrIdIvBLsbz7BDmPt8DVt2cpo7vx3mcMbmCo3Hcnv5mT6x3VikhXuf
         ESKam3EjWeRED1J000bZ0N14hI9LZv2Aj1FO7E9Y84LvxMnzUDbrTZ1ZXALXYhAziJy0
         MGUqZgGO3CtDw/pdo/9fAdJ0vwdIqvs6JhqEKrqQKx9pK7YZn+KxWzh/w/46AH6zjo8x
         9v53WCnjr/CSYgB47xyaaHkUyUlGP5gNEOTI/YeMMQeFCuQRhbLlM9uza89sOpaOaiPh
         v+0Q7fYEFJ7nQpsmtYmFeAG5ljVBEA3Gp7OyFxu1pFigkw14WF94iV2AgX9VqOp+zGYm
         SK4w==
X-Gm-Message-State: AOAM532v0RQ87EoBV+wdE2cnYNQ5lhWgBNXo8q6Om+c5GvHoKubXhPbN
        xbugBEPN3dLbNb35xqvHJu9WJA==
X-Google-Smtp-Source: ABdhPJwRo58jenu80k77aCwl2EeoUJqluDWvFSt2FOgVWWwXQC9e4UWksYqVOBVC3xnFTVOmp3u+zA==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr20291446wrm.414.1605548524179;
        Mon, 16 Nov 2020 09:42:04 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:42:03 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 31/42] drm/ttm/ttm_bo: Fix one function header - demote lots of kernel-doc abuses
Date:   Mon, 16 Nov 2020 17:41:01 +0000
Message-Id: <20201116174112.1833368-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_bo.c:51: warning: Function parameter or member 'ttm_global_mutex' not described in 'DEFINE_MUTEX'
 drivers/gpu/drm/ttm/ttm_bo.c:286: warning: Function parameter or member 'bo' not described in 'ttm_bo_cleanup_memtype_use'
 drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'bo' not described in 'ttm_bo_cleanup_refs'
 drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'interruptible' not described in 'ttm_bo_cleanup_refs'
 drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'no_wait_gpu' not described in 'ttm_bo_cleanup_refs'
 drivers/gpu/drm/ttm/ttm_bo.c:359: warning: Function parameter or member 'unlock_resv' not described in 'ttm_bo_cleanup_refs'
 drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or member 'bdev' not described in 'ttm_bo_delayed_delete'
 drivers/gpu/drm/ttm/ttm_bo.c:424: warning: Function parameter or member 'remove_all' not described in 'ttm_bo_delayed_delete'
 drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'bo' not described in 'ttm_bo_evict_swapout_allowable'
 drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'ctx' not described in 'ttm_bo_evict_swapout_allowable'
 drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'locked' not described in 'ttm_bo_evict_swapout_allowable'
 drivers/gpu/drm/ttm/ttm_bo.c:635: warning: Function parameter or member 'busy' not described in 'ttm_bo_evict_swapout_allowable'
 drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'bo' not described in 'ttm_bo_add_move_fence'
 drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'man' not described in 'ttm_bo_add_move_fence'
 drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'mem' not described in 'ttm_bo_add_move_fence'
 drivers/gpu/drm/ttm/ttm_bo.c:769: warning: Function parameter or member 'no_wait_gpu' not described in 'ttm_bo_add_move_fence'
 drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'bo' not described in 'ttm_bo_mem_force_space'
 drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'place' not described in 'ttm_bo_mem_force_space'
 drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'mem' not described in 'ttm_bo_mem_force_space'
 drivers/gpu/drm/ttm/ttm_bo.c:806: warning: Function parameter or member 'ctx' not described in 'ttm_bo_mem_force_space'
 drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'bo' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'placement' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'mem' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:872: warning: Function parameter or member 'ctx' not described in 'ttm_bo_mem_space'
 drivers/gpu/drm/ttm/ttm_bo.c:1387: warning: Function parameter or member 'ctx' not described in 'ttm_bo_swapout'

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e6bcbfe530ecc..9a03c7834b1ed 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -45,7 +45,7 @@
 
 static void ttm_bo_global_kobj_release(struct kobject *kobj);
 
-/**
+/*
  * ttm_global_mutex - protecting the global BO state
  */
 DEFINE_MUTEX(ttm_global_mutex);
@@ -278,7 +278,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	return ret;
 }
 
-/**
+/*
  * Call bo::reserved.
  * Will release GPU memory type usage on destruction.
  * This is the place to put in driver specific hooks to release
@@ -352,9 +352,10 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
  * Must be called with lru_lock and reservation held, this function
  * will drop the lru lock and optionally the reservation lock before returning.
  *
- * @interruptible         Any sleeps should occur interruptibly.
- * @no_wait_gpu           Never wait for gpu. Return -EBUSY instead.
- * @unlock_resv           Unlock the reservation lock as well.
+ * @bo:                    The buffer object to clean-up
+ * @interruptible:         Any sleeps should occur interruptibly.
+ * @no_wait_gpu:           Never wait for gpu. Return -EBUSY instead.
+ * @unlock_resv:           Unlock the reservation lock as well.
  */
 
 static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
@@ -420,7 +421,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
  * encountered buffers.
  */
@@ -628,7 +629,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
-/**
+/*
  * Check the target bo is allowable to be evicted or swapout, including cases:
  *
  * a. if share same reservation object with ctx->resv, have assumption
@@ -767,7 +768,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
 	return ret;
 }
 
-/**
+/*
  * Add the last move fence to the BO and reserve a new shared slot.
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
@@ -803,7 +804,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Repeatedly evict memory from the LRU for @mem_type until we create enough
  * space, or we've evicted everything and there isn't enough space.
  */
@@ -865,7 +866,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Creates space for memory region @mem according to its type.
  *
  * This function first searches for free space in compatible memory types in
@@ -1430,7 +1431,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_wait);
 
-/**
+/*
  * A buffer object shrink method that tries to swap out the first
  * buffer object on the bo_global::swap_lru list.
  */
-- 
2.25.1

