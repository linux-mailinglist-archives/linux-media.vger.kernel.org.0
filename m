Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C842B0D2F
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 20:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgKLTBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 14:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgKLTBQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 14:01:16 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4074C0613D4
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:01:15 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id d12so7120320wrr.13
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 11:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hhsEbZipFbCQyWEf6kSd5rkhfQthKzQFAcVlOpcfKHs=;
        b=x2xTWxmBKxpzw79Z8Dl07NQPgFw6vX/pS35IT/jc/XqcFHa5S4GFTwnoeqTH6QLjJq
         VsMsyTKLYqKjxOyxfhPYjBvq2ekaTGmLEKWg4G4cVMK+dmlpJOccH0D2FPjVUZSg/eEC
         VeSSyWzW9Hw8HKc9D9URvmYQlxQcRIv9qUifxbhCr6436+W5fGBfzfkF0le68pE8neCl
         OT9YrIuyA0o6NBUulYbv+ie6ApC1gw03ZEpXadmnrqMOqAYsDLMJXITPh9+xWCMM1G0f
         myTnnPmkjTfvvTgpdYSbm9zQSClky7g6i9oWgqG+ywUCxCn0qlnvZUJ2fKnVf3zstTdW
         XDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hhsEbZipFbCQyWEf6kSd5rkhfQthKzQFAcVlOpcfKHs=;
        b=eYy431LhLI3tpdsBxtugXi2cvWW1sxDao/+d+0qkR4Htf157mH3EoN/dvW8hzIbeWm
         y+H2g0vHbn1J5uxPQvYYo2hItGPFhSuO0e6C/62dxcuu2EYe8Ee6aMgJUuOGRusPYTgQ
         oo0qLTxxpPwrNCdEV4UUts5hYXrYFTGbZ7rxUENcFE3cqdfeld5Bq/ovK0DGdnutV0iY
         jwV5WMOCwQNr50RUTzDh6uNLSdy4uIRVZIdAF/f0XVhn28uRV/jNFAY9OF01HzcXeMMZ
         lFk3dZH1unq1GKeGx5Kr9JXaKfEjrKV4lqA9prsPI8tmKOxpyAK2gsMBv3SrJEPMwH5J
         IA+w==
X-Gm-Message-State: AOAM532rPYVlwAbCdMdrEQBEeNli+54z1eCuga9EyKozuQVqvu1vpNUq
        IxT25n6rb1AQDop4lmsJhOcdFQ==
X-Google-Smtp-Source: ABdhPJzKwiYK7uX+MgLgwTlW7l1uP6DHfZyaNVtbub1QBw/x9NXjbYuMB01YgoP1IACbU1SGLzdq1Q==
X-Received: by 2002:adf:df86:: with SMTP id z6mr1138297wrl.57.1605207668896;
        Thu, 12 Nov 2020 11:01:08 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:01:07 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Glisse <glisse@freedesktop.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 12/30] drm/amd/amdgpu/amdgpu_ttm: Demote non-conformant kernel-doc headers, fix slightly lacking ones
Date:   Thu, 12 Nov 2020 19:00:21 +0000
Message-Id: <20201112190039.2785914-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:464: warning: Function parameter or member 'bo' not described in 'amdgpu_move_blit'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:464: warning: Function parameter or member 'evict' not described in 'amdgpu_move_blit'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:464: warning: Function parameter or member 'new_mem' not described in 'amdgpu_move_blit'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:464: warning: Function parameter or member 'old_mem' not described in 'amdgpu_move_blit'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:522: warning: Function parameter or member 'adev' not described in 'amdgpu_mem_visible'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:522: warning: Function parameter or member 'mem' not described in 'amdgpu_mem_visible'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter or member 'bo' not described in 'amdgpu_bo_move'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter or member 'evict' not described in 'amdgpu_bo_move'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter or member 'ctx' not described in 'amdgpu_bo_move'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter or member 'new_mem' not described in 'amdgpu_bo_move'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:548: warning: Function parameter or member 'hop' not described in 'amdgpu_bo_move'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:658: warning: Function parameter or member 'bdev' not described in 'amdgpu_ttm_io_mem_reserve'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:658: warning: Function parameter or member 'mem' not described in 'amdgpu_ttm_io_mem_reserve'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:751: warning: Function parameter or member 'bo' not described in 'amdgpu_ttm_tt_get_user_pages'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:751: warning: Function parameter or member 'pages' not described in 'amdgpu_ttm_tt_get_user_pages'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:855: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_get_user_pages_done'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:892: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_set_user_pages'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:892: warning: Function parameter or member 'pages' not described in 'amdgpu_ttm_tt_set_user_pages'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:906: warning: Function parameter or member 'bdev' not described in 'amdgpu_ttm_tt_pin_userptr'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:906: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_pin_userptr'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:944: warning: Function parameter or member 'bdev' not described in 'amdgpu_ttm_tt_unpin_userptr'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:944: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_unpin_userptr'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1029: warning: Function parameter or member 'bdev' not described in 'amdgpu_ttm_backend_bind'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1029: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_backend_bind'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1029: warning: Function parameter or member 'bo_mem' not described in 'amdgpu_ttm_backend_bind'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1087: warning: Function parameter or member 'bo' not described in 'amdgpu_ttm_alloc_gart'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1146: warning: Function parameter or member 'tbo' not described in 'amdgpu_ttm_recover_gart'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1168: warning: Function parameter or member 'bdev' not described in 'amdgpu_ttm_backend_unbind'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1168: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_backend_unbind'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1214: warning: Function parameter or member 'page_flags' not described in 'amdgpu_ttm_tt_create'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1247: warning: Function parameter or member 'bdev' not described in 'amdgpu_ttm_tt_populate'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1247: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_populate'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1247: warning: Function parameter or member 'ctx' not described in 'amdgpu_ttm_tt_populate'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1291: warning: Function parameter or member 'bdev' not described in 'amdgpu_ttm_tt_unpopulate'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1291: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_unpopulate'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1357: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_get_usermm'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1376: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_affect_userptr'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1376: warning: Function parameter or member 'start' not described in 'amdgpu_ttm_tt_affect_userptr'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1376: warning: Function parameter or member 'end' not described in 'amdgpu_ttm_tt_affect_userptr'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1397: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_is_userptr'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1410: warning: Function parameter or member 'ttm' not described in 'amdgpu_ttm_tt_is_readonly'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1449: warning: bad line:
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1454: warning: Function parameter or member 'adev' not described in 'amdgpu_ttm_tt_pte_flags'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1477: warning: Function parameter or member 'bo' not described in 'amdgpu_ttm_bo_eviction_valuable'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1477: warning: Function parameter or member 'place' not described in 'amdgpu_ttm_bo_eviction_valuable'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1787: warning: Function parameter or member 'adev' not described in 'amdgpu_ttm_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1915: warning: Function parameter or member 'adev' not described in 'amdgpu_ttm_late_init'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:1926: warning: Function parameter or member 'adev' not described in 'amdgpu_ttm_fini'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2250: warning: Function parameter or member 'f' not described in 'amdgpu_ttm_vram_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2250: warning: Function parameter or member 'buf' not described in 'amdgpu_ttm_vram_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2250: warning: Function parameter or member 'size' not described in 'amdgpu_ttm_vram_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2250: warning: Function parameter or member 'pos' not described in 'amdgpu_ttm_vram_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2285: warning: Function parameter or member 'f' not described in 'amdgpu_ttm_vram_write'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2285: warning: Function parameter or member 'buf' not described in 'amdgpu_ttm_vram_write'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2285: warning: Function parameter or member 'size' not described in 'amdgpu_ttm_vram_write'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2285: warning: Function parameter or member 'pos' not described in 'amdgpu_ttm_vram_write'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2336: warning: Function parameter or member 'f' not described in 'amdgpu_ttm_gtt_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2336: warning: Function parameter or member 'buf' not described in 'amdgpu_ttm_gtt_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2336: warning: Function parameter or member 'size' not described in 'amdgpu_ttm_gtt_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2336: warning: Function parameter or member 'pos' not described in 'amdgpu_ttm_gtt_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2390: warning: Function parameter or member 'f' not described in 'amdgpu_iomem_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2390: warning: Function parameter or member 'buf' not described in 'amdgpu_iomem_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2390: warning: Function parameter or member 'size' not described in 'amdgpu_iomem_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2390: warning: Function parameter or member 'pos' not described in 'amdgpu_iomem_read'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2446: warning: Function parameter or member 'f' not described in 'amdgpu_iomem_write'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2446: warning: Function parameter or member 'buf' not described in 'amdgpu_iomem_write'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2446: warning: Function parameter or member 'size' not described in 'amdgpu_iomem_write'
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2446: warning: Function parameter or member 'pos' not described in 'amdgpu_iomem_write'

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Jerome Glisse <glisse@freedesktop.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 60 +++++++++++++------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 676fb520e0449..b473b13f34f76 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -451,7 +451,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	return r;
 }
 
-/**
+/*
  * amdgpu_move_blit - Copy an entire buffer to another buffer
  *
  * This is a helper called by amdgpu_bo_move() and amdgpu_move_vram_ram() to
@@ -512,7 +512,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	return r;
 }
 
-/**
+/*
  * amdgpu_mem_visible - Check that memory can be accessed by ttm_bo_move_memcpy
  *
  * Called by amdgpu_bo_move()
@@ -536,7 +536,7 @@ static bool amdgpu_mem_visible(struct amdgpu_device *adev,
 		<= adev->gmc.visible_vram_size;
 }
 
-/**
+/*
  * amdgpu_bo_move - Move a buffer object to a new memory location
  *
  * Called by ttm_bo_handle_move_mem()
@@ -649,7 +649,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 	return r;
 }
 
-/**
+/*
  * amdgpu_ttm_io_mem_reserve - Reserve a block of memory during a fault
  *
  * Called by ttm_mem_io_reserve() ultimately via ttm_bo_vm_fault()
@@ -740,7 +740,7 @@ struct amdgpu_ttm_tt {
 };
 
 #ifdef CONFIG_DRM_AMDGPU_USERPTR
-/**
+/*
  * amdgpu_ttm_tt_get_user_pages - get device accessible pages that back user
  * memory and start HMM tracking CPU page table update
  *
@@ -845,7 +845,7 @@ int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo, struct page **pages)
 	return r;
 }
 
-/**
+/*
  * amdgpu_ttm_tt_userptr_range_done - stop HMM track the CPU page table change
  * Check if the pages backing this ttm range have been invalidated
  *
@@ -881,7 +881,7 @@ bool amdgpu_ttm_tt_get_user_pages_done(struct ttm_tt *ttm)
 }
 #endif
 
-/**
+/*
  * amdgpu_ttm_tt_set_user_pages - Copy pages in, putting old pages as necessary.
  *
  * Called by amdgpu_cs_list_validate(). This creates the page list
@@ -896,7 +896,7 @@ void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct page **pages)
 		ttm->pages[i] = pages ? pages[i] : NULL;
 }
 
-/**
+/*
  * amdgpu_ttm_tt_pin_userptr - prepare the sg table with the user pages
  *
  * Called by amdgpu_ttm_backend_bind()
@@ -936,7 +936,7 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
 	return r;
 }
 
-/**
+/*
  * amdgpu_ttm_tt_unpin_userptr - Unpin and unmap userptr pages
  */
 static void amdgpu_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev,
@@ -1017,7 +1017,7 @@ static int amdgpu_ttm_gart_bind(struct amdgpu_device *adev,
 	return r;
 }
 
-/**
+/*
  * amdgpu_ttm_backend_bind - Bind GTT memory
  *
  * Called by ttm_tt_bind() on behalf of ttm_bo_handle_move_mem().
@@ -1075,7 +1075,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
 	return r;
 }
 
-/**
+/*
  * amdgpu_ttm_alloc_gart - Make sure buffer object is accessible either
  * through AGP or GART aperture.
  *
@@ -1136,7 +1136,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	return 0;
 }
 
-/**
+/*
  * amdgpu_ttm_recover_gart - Rebind GTT pages
  *
  * Called by amdgpu_gtt_mgr_recover() from amdgpu_device_reset() to
@@ -1157,7 +1157,7 @@ int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo)
 	return r;
 }
 
-/**
+/*
  * amdgpu_ttm_backend_unbind - Unbind GTT mapped pages
  *
  * Called by ttm_tt_unbind() on behalf of ttm_bo_move_ttm() and
@@ -1206,6 +1206,7 @@ static void amdgpu_ttm_backend_destroy(struct ttm_bo_device *bdev,
  * amdgpu_ttm_tt_create - Create a ttm_tt object for a given BO
  *
  * @bo: The buffer object to create a GTT ttm_tt object around
+ * @page_flags: flags to request SG or DMA page directory
  *
  * Called by ttm_tt_create().
  */
@@ -1235,7 +1236,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
 	return &gtt->ttm;
 }
 
-/**
+/*
  * amdgpu_ttm_tt_populate - Map GTT pages visible to the device
  *
  * Map the pages of a ttm_tt object to an address space visible
@@ -1280,7 +1281,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 	return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
 }
 
-/**
+/*
  * amdgpu_ttm_tt_unpopulate - unmap GTT pages and unpopulate page arrays
  *
  * Unmaps pages of a ttm_tt object from the device address space and
@@ -1350,7 +1351,7 @@ int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_object *bo,
 	return 0;
 }
 
-/**
+/*
  * amdgpu_ttm_tt_get_usermm - Return memory manager for ttm_tt object
  */
 struct mm_struct *amdgpu_ttm_tt_get_usermm(struct ttm_tt *ttm)
@@ -1366,7 +1367,7 @@ struct mm_struct *amdgpu_ttm_tt_get_usermm(struct ttm_tt *ttm)
 	return gtt->usertask->mm;
 }
 
-/**
+/*
  * amdgpu_ttm_tt_affect_userptr - Determine if a ttm_tt object lays inside an
  * address range for the current task.
  *
@@ -1390,7 +1391,7 @@ bool amdgpu_ttm_tt_affect_userptr(struct ttm_tt *ttm, unsigned long start,
 	return true;
 }
 
-/**
+/*
  * amdgpu_ttm_tt_is_userptr - Have the pages backing by userptr?
  */
 bool amdgpu_ttm_tt_is_userptr(struct ttm_tt *ttm)
@@ -1403,7 +1404,7 @@ bool amdgpu_ttm_tt_is_userptr(struct ttm_tt *ttm)
 	return true;
 }
 
-/**
+/*
  * amdgpu_ttm_tt_is_readonly - Is the ttm_tt object read only?
  */
 bool amdgpu_ttm_tt_is_readonly(struct ttm_tt *ttm)
@@ -1444,9 +1445,10 @@ uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_resource *mem)
 /**
  * amdgpu_ttm_tt_pte_flags - Compute PTE flags for ttm_tt object
  *
+ * @adev: amdgpu_device pointer
  * @ttm: The ttm_tt object to compute the flags for
  * @mem: The memory registry backing this ttm_tt object
-
+ *
  * Figure out the flags to use for a VM PTE (Page Table Entry).
  */
 uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
@@ -1463,7 +1465,7 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
 	return flags;
 }
 
-/**
+/*
  * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
  * object.
  *
@@ -1774,7 +1776,7 @@ static int amdgpu_ttm_reserve_tmr(struct amdgpu_device *adev)
 	return 0;
 }
 
-/**
+/*
  * amdgpu_ttm_init - Init the memory management (ttm) as well as various
  * gtt/vram related fields.
  *
@@ -1908,7 +1910,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-/**
+/*
  * amdgpu_ttm_late_init - Handle any late initialization for amdgpu_ttm
  */
 void amdgpu_ttm_late_init(struct amdgpu_device *adev)
@@ -1919,7 +1921,7 @@ void amdgpu_ttm_late_init(struct amdgpu_device *adev)
 	amdgpu_bo_free_kernel(&adev->mman.stolen_extended_memory, NULL, NULL);
 }
 
-/**
+/*
  * amdgpu_ttm_fini - De-initialize the TTM memory pools
  */
 void amdgpu_ttm_fini(struct amdgpu_device *adev)
@@ -2240,7 +2242,7 @@ static const struct drm_info_list amdgpu_ttm_debugfs_list[] = {
 	{"ttm_page_pool", amdgpu_ttm_pool_debugfs, 0, NULL},
 };
 
-/**
+/*
  * amdgpu_ttm_vram_read - Linear read access to VRAM
  *
  * Accesses VRAM via MMIO for debugging purposes.
@@ -2275,7 +2277,7 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f, char __user *buf,
 	return result;
 }
 
-/**
+/*
  * amdgpu_ttm_vram_write - Linear write access to VRAM
  *
  * Accesses VRAM via MMIO for debugging purposes.
@@ -2328,7 +2330,7 @@ static const struct file_operations amdgpu_ttm_vram_fops = {
 
 #ifdef CONFIG_DRM_AMDGPU_GART_DEBUGFS
 
-/**
+/*
  * amdgpu_ttm_gtt_read - Linear read access to GTT memory
  */
 static ssize_t amdgpu_ttm_gtt_read(struct file *f, char __user *buf,
@@ -2378,7 +2380,7 @@ static const struct file_operations amdgpu_ttm_gtt_fops = {
 
 #endif
 
-/**
+/*
  * amdgpu_iomem_read - Virtual read access to GPU mapped memory
  *
  * This function is used to read memory that has been mapped to the
@@ -2434,7 +2436,7 @@ static ssize_t amdgpu_iomem_read(struct file *f, char __user *buf,
 	return result;
 }
 
-/**
+/*
  * amdgpu_iomem_write - Virtual write access to GPU mapped memory
  *
  * This function is used to write memory that has been mapped to the
-- 
2.25.1

