Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B4F2178D7
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 22:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbgGGUNM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 16:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgGGUNK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 16:13:10 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916A8C061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 13:13:10 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g10so2449268wmc.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 13:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rXr2As7rh2rrJJ3ahJynDuHkNm4sNZ1+ixU/+yJ6OOk=;
        b=jCpkXGY5p769RIVb0rIEa9p0h9fBKQNebf/um2oaUcGoDwZigWKpNG4nfukkQHidFs
         E6lxceTU0TuvUe5FAj8xthM3oTWkjYklv3mDELPUV67jWfa1JuhnpuIRVXm8+h5SzPfO
         Ufhwy9N9nss079z/+kJ7Mrbm2U0wuBymlNZVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rXr2As7rh2rrJJ3ahJynDuHkNm4sNZ1+ixU/+yJ6OOk=;
        b=gzs+NuhFW4x4q58GF5G9Bck9ozG4FTCaZFx/znhEq6+i8dl+YiFYBe23z5esY7EO9B
         3avSXokssofSgP1LJLJ6o+Gl444crA9+1suna0uMcyY2hHe1CgKY8DWiQ9qQGNbkzYql
         xwA24Udr0EjgY9RBdCTnpZFdgbsmytTjANUob4wj/LVrp5WpMtNPqDSsBOIo9XLjuCsa
         8P1vyJtvW+vl/EqRU0FHf11ncLtyyDTMxK7hwaY0PRRRknjJ/+64j40pAlVZrHwCqBZc
         Q4wCWD217DvQlHW9O4c1nyb1jC+XnKPO9097Fju2AgaSRdRK73HF2u8S5mbOvyNcCvBq
         ILnA==
X-Gm-Message-State: AOAM530Z9GOAy/QayeMOP297XqDHzd4Z/RC4VVfwOndZhUcLQfyhHO1D
        sFRIWKcS18ZNvUzynNW4zep6dw==
X-Google-Smtp-Source: ABdhPJw0HizUzWXc4vdabJmS3Cgp6vG06A9p7AbsD/W0R1T8bAZ0kiaRqVn6YrSTgdWX5nrJ4Acaug==
X-Received: by 2002:a7b:c394:: with SMTP id s20mr6139458wmj.31.1594152789350;
        Tue, 07 Jul 2020 13:13:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:13:08 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 23/25] drm/amdgpu: use dma-fence annotations for gpu reset code
Date:   Tue,  7 Jul 2020 22:12:27 +0200
Message-Id: <20200707201229.472834-24-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To improve coverage also annotate the gpu reset code itself, since
that's called from other places than drm/scheduler (which is already
annotated). Annotations nests, so this doesn't break anything, and
allows easier testing.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a649e40fd96f..3a3bccd7f1c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4261,6 +4261,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		(amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) ?
 		true : false;
 	bool audio_suspended = false;
+	bool fence_cookie;
+
+	fence_cookie = dma_fence_begin_signalling();
 
 	/*
 	 * Flush RAM to disk so that after reboot
@@ -4289,6 +4292,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
 			  job ? job->base.id : -1, hive->hive_id);
 		mutex_unlock(&hive->hive_lock);
+		dma_fence_end_signalling(fence_cookie);
 		return 0;
 	}
 
@@ -4299,8 +4303,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 */
 	INIT_LIST_HEAD(&device_list);
 	if (adev->gmc.xgmi.num_physical_nodes > 1) {
-		if (!hive)
+		if (!hive) {
+			dma_fence_end_signalling(fence_cookie);
 			return -ENODEV;
+		}
 		if (!list_is_first(&adev->gmc.xgmi.head, &hive->device_list))
 			list_rotate_to_front(&adev->gmc.xgmi.head, &hive->device_list);
 		device_list_handle = &hive->device_list;
@@ -4315,6 +4321,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			DRM_INFO("Bailing on TDR for s_job:%llx, as another already in progress",
 				  job ? job->base.id : -1);
 			mutex_unlock(&hive->hive_lock);
+			dma_fence_end_signalling(fence_cookie);
 			return 0;
 		}
 
@@ -4455,6 +4462,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	if (r)
 		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
+	dma_fence_end_signalling(fence_cookie);
 	return r;
 }
 
-- 
2.27.0

