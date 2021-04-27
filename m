Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA13536C50F
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 13:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbhD0L3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 07:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhD0L3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 07:29:17 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F36BC061574;
        Tue, 27 Apr 2021 04:28:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id h10so69491717edt.13;
        Tue, 27 Apr 2021 04:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5e4pUnGmjwBjpM3egCyMiRzisI5IaXSt+bAblq6W2uU=;
        b=RnraFxqJkiPQMzJNr8t0w7mxcfm/3ssX/7lX7A+A3mKGCkLmIbugEFFBG+J4yzr3/P
         5fbLaGICgdjZlkuZAP8NUJciqcvzrkI46+rXQoQms2CAV3GF4l/tMYjukegnUHpJzGe+
         96hB0Fsbe6cOm/E+OBvFhgBml21+VbY+vYm5rptglsBZ+dTdFIbIbjm3U03DeXb3Jcv4
         qEbtTS+9YSYQoFjMy+O3CQ25judIuFr2ijRMyAc9HIsmNrqjF1mwcin5CIfBwyUJf6Ky
         cE0XySzy9Iy+HPKan/GbXauUv6qqmZJkNhA7kg9KVLAAvJc+vvL0XN/w/BVVJoCzoEPz
         +dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5e4pUnGmjwBjpM3egCyMiRzisI5IaXSt+bAblq6W2uU=;
        b=WXoK7YnHApKldMpZ09uTffb+vouL/4EnhYjQi32mFyeI0gIo9vZOeHtEUtaPUcNIWE
         199WairNmIYfKUKOfXF3puaHr6AWwo3CSvt2BCQx0afKLjiQBHBVtjIZJK/UELYJXhoA
         b0mkiCT9OyjvrDj9+DnPjnHdOcPSjWyuL18f4T0bT/8+4AxhpYBDPy+45l1qARiUb02e
         RRpNbIxzd2qUPRp+luFrzcq07xL4HfGoqYcs+m2KvnSbPQK5N1CopiedGeALA8c2hN67
         4ndXzaX4ofEXrXoWeW1wYj/uMn3ITr2k762LHlXZfevrKIaRCCl5mhiM1swQYvHIM6ro
         mJvQ==
X-Gm-Message-State: AOAM533AmXkgsB7sPsFon5nocNjzua/9rTvtkb+jf45Xo0pqZL7CPSU0
        hd77A8qdzYhdWurBW2HM/AE=
X-Google-Smtp-Source: ABdhPJwAlvAc83hkcmnnbDFZpe21+5I69oLRO+jNncyvzjqewAB2UplGV8Evt7hygV8STRi6HhCZgQ==
X-Received: by 2002:a05:6402:31b3:: with SMTP id dj19mr3679883edb.180.1619522911396;
        Tue, 27 Apr 2021 04:28:31 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id e11sm899479edq.76.2021.04.27.04.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 04:28:30 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org (open list:AMD KFD),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Cc:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] drm/amd/amdgpu: Fix errors in documentation of function parameters
Date:   Tue, 27 Apr 2021 13:27:38 +0200
Message-Id: <20210427112738.15869-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the documentation of functions, removed excess parameters, described
undocumented ones, and fixed syntax errors.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: Cc'ed all the maintainers.

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c          | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |  4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |  8 ++++----
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 2e9b16fb3fcd..bf2939b6eb43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -76,7 +76,7 @@ struct amdgpu_atif {
 /**
  * amdgpu_atif_call - call an ATIF method
  *
- * @handle: acpi handle
+ * @atif: acpi handle
  * @function: the ATIF function to execute
  * @params: ATIF function params
  *
@@ -166,7 +166,6 @@ static void amdgpu_atif_parse_functions(struct amdgpu_atif_functions *f, u32 mas
 /**
  * amdgpu_atif_verify_interface - verify ATIF
  *
- * @handle: acpi handle
  * @atif: amdgpu atif struct
  *
  * Execute the ATIF_FUNCTION_VERIFY_INTERFACE ATIF function
@@ -240,8 +239,7 @@ static acpi_handle amdgpu_atif_probe_handle(acpi_handle dhandle)
 /**
  * amdgpu_atif_get_notification_params - determine notify configuration
  *
- * @handle: acpi handle
- * @n: atif notification configuration struct
+ * @atif: acpi handle
  *
  * Execute the ATIF_FUNCTION_GET_SYSTEM_PARAMETERS ATIF function
  * to determine if a notifier is used and if so which one
@@ -304,7 +302,7 @@ static int amdgpu_atif_get_notification_params(struct amdgpu_atif *atif)
 /**
  * amdgpu_atif_query_backlight_caps - get min and max backlight input signal
  *
- * @handle: acpi handle
+ * @atif: acpi handle
  *
  * Execute the QUERY_BRIGHTNESS_TRANSFER_CHARACTERISTICS ATIF function
  * to determine the acceptable range of backlight values
@@ -363,7 +361,7 @@ static int amdgpu_atif_query_backlight_caps(struct amdgpu_atif *atif)
 /**
  * amdgpu_atif_get_sbios_requests - get requested sbios event
  *
- * @handle: acpi handle
+ * @atif: acpi handle
  * @req: atif sbios request struct
  *
  * Execute the ATIF_FUNCTION_GET_SYSTEM_BIOS_REQUESTS ATIF function
@@ -899,6 +897,8 @@ void amdgpu_acpi_fini(struct amdgpu_device *adev)
 /**
  * amdgpu_acpi_is_s0ix_supported
  *
+ * @adev: amdgpu_device_pointer
+ *
  * returns true if supported, false if not.
  */
 bool amdgpu_acpi_is_s0ix_supported(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 5af464933976..98d31ebad9ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -111,6 +111,8 @@ static const char *amdkfd_fence_get_timeline_name(struct dma_fence *f)
  *  a KFD BO and schedules a job to move the BO.
  *  If fence is already signaled return true.
  *  If fence is not signaled schedule a evict KFD process work item.
+ *
+ *  @f: dma_fence
  */
 static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 {
@@ -131,7 +133,7 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 /**
  * amdkfd_fence_release - callback that fence can be freed
  *
- * @fence: fence
+ * @f: dma_fence
  *
  * This function is called when the reference count becomes zero.
  * Drops the mm_struct reference and RCU schedules freeing up the fence.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index b43e68fc1378..ed3014fbb563 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -719,7 +719,7 @@ static void unlock_spi_csq_mutexes(struct amdgpu_device *adev)
 }
 
 /**
- * @get_wave_count: Read device registers to get number of waves in flight for
+ * get_wave_count: Read device registers to get number of waves in flight for
  * a particular queue. The method also returns the VMID associated with the
  * queue.
  *
@@ -755,19 +755,19 @@ static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
 }
 
 /**
- * @kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
+ * kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
  * shader engine and aggregates the number of waves that are in flight for the
  * process whose pasid is provided as a parameter. The process could have ZERO
  * or more queues running and submitting waves to compute units.
  *
  * @kgd: Handle of device from which to get number of waves in flight
  * @pasid: Identifies the process for which this query call is invoked
- * @wave_cnt: Output parameter updated with number of waves in flight that
+ * @pasid_wave_cnt: Output parameter updated with number of waves in flight that
  * belong to process with given pasid
  * @max_waves_per_cu: Output parameter updated with maximum number of waves
  * possible per Compute Unit
  *
- * @note: It's possible that the device has too many queues (oversubscription)
+ * Note: It's possible that the device has too many queues (oversubscription)
  * in which case a VMID could be remapped to a different PASID. This could lead
  * to an iaccurate wave count. Following is a high-level sequence:
  *    Time T1: vmid = getVmid(); vmid is associated with Pasid P1
-- 
2.31.1

