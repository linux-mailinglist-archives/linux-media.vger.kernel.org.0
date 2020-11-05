Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17712A817E
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 15:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731472AbgKEOw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 09:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731443AbgKEOw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 09:52:28 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC0AC061A4A
        for <linux-media@vger.kernel.org>; Thu,  5 Nov 2020 06:52:28 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id x7so2105247wrl.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2020 06:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CiwuaHU0ZHFg8OQhxx1cJ0dSvWM+0RzNg9gjhgk/WPA=;
        b=dduQNHED/EB0aCtpEb6ZPI3Ygd/DXzxcM6AtONVZiYH8oOWysFV+SV32BXj7CRawn8
         3qPDx42rbOXx3GO70oulyAVbyR2HuKGl8RXT08Cum9UEJAzaBP1FnUZSSWqRwEliQcMG
         7APPDUIFphi1rufMhTfciYQOCmVo//x1tN69RM3fTfdGHw4xQf2o4ZoDpYJ8Ac+9oO7M
         f4JjmzCn5PLS9anQBkW3NK6Qa5ihhhyARqji7LRN742P39PzfEyRybjH33AIuve1EPSz
         12K4QAR9lXYH+qh9QIDJR7F58wDmqFRQ4cfd2yM2AWfB/b2zvVkHWRmiqt3imMKyOaNg
         USoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CiwuaHU0ZHFg8OQhxx1cJ0dSvWM+0RzNg9gjhgk/WPA=;
        b=RtNJn2rhsyn+7f9p2snQ1GO5I5/M50djSm6Sk4Cy7PMQkKXrGhip2LZ+pYR8Ux96cQ
         Q1hUypWvXJUNwFYEv3YQz/KttdgygxwfgwwL0VmG/x6M4x/ywM46mFiBD/CHjFU+MAQx
         rElUxiIa2V0fGGSL0cmGNOfemA9pjCnTbIAZTPWl/iLnuMdAxZuX9qY2qX03uIYGbIQE
         yuTUvskbzIHfsSzuLn50AbfePes4V5PBOzdD9bDWHFw6XmvjImsks/+Yo5diFTFKiBEZ
         hMssruIkD2HI64A8lWpIacxt5YjaBMwaeswtSlkEmZtEy8wNh+IrFJPI1ggt45ktOqdp
         ReMw==
X-Gm-Message-State: AOAM53142TaxU4e+72xSoEaAo+pyePXQXwCwbXrhTej2d9k/0AqBgxWa
        5FIY3L/ou6KbDRipiFjaslk5iA==
X-Google-Smtp-Source: ABdhPJx8+Xyxk3R3buvDFYahFOdmnHso41DjA+AdBII2gmx00vBAFsKsMfNfZ8R2RRVHTR/ZSpXreA==
X-Received: by 2002:adf:e386:: with SMTP id e6mr3301874wrm.330.1604587947150;
        Thu, 05 Nov 2020 06:52:27 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 06:52:26 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/19] gpu: drm: ttm: ttm_bo: Fix one function header - demote lots of kernel-doc abuses
Date:   Thu,  5 Nov 2020 14:45:08 +0000
Message-Id: <20201105144517.1826692-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
index c63b7ea1cd5d0..2b69c959d7f4d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -45,7 +45,7 @@
 
 static void ttm_bo_global_kobj_release(struct kobject *kobj);
 
-/**
+/*
  * ttm_global_mutex - protecting the global BO state
  */
 DEFINE_MUTEX(ttm_global_mutex);
@@ -274,7 +274,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	return ret;
 }
 
-/**
+/*
  * Call bo::reserved.
  * Will release GPU memory type usage on destruction.
  * This is the place to put in driver specific hooks to release
@@ -348,9 +348,10 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
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
@@ -416,7 +417,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
  * encountered buffers.
  */
@@ -620,7 +621,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_eviction_valuable);
 
-/**
+/*
  * Check the target bo is allowable to be evicted or swapout, including cases:
  *
  * a. if share same reservation object with ctx->resv, have assumption
@@ -759,7 +760,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
 	return ret;
 }
 
-/**
+/*
  * Add the last move fence to the BO and reserve a new shared slot.
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
@@ -795,7 +796,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Repeatedly evict memory from the LRU for @mem_type until we create enough
  * space, or we've evicted everything and there isn't enough space.
  */
@@ -857,7 +858,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * Creates space for memory region @mem according to its type.
  *
  * This function first searches for free space in compatible memory types in
@@ -1379,7 +1380,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_wait);
 
-/**
+/*
  * A buffer object shrink method that tries to swap out the first
  * buffer object on the bo_global::swap_lru list.
  */
-- 
2.25.1

