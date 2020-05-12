Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15ACE1CF01F
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729520AbgELJAr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729438AbgELJAM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:00:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AA6C05BD0A
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id v12so14305955wrp.12
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U6eMxQ6gGsP+PGOv8CvoIWRRS5TJUyI8UxMjiqc47Mo=;
        b=PnuV7xflEjOlvfaUhZ+KpylEZ6B+nAuxnCL/fVvuzcQE1nkl8ut88s1ez31P+4ljF4
         iSgH127tca2DU8l3HJWyuwwLmSRVfbD3QBzO1HejgP3sc52tGIzmsdHjyMsMiHc5wDaC
         KKhsrvU1VK5jPM+f5/epbuW0a2Bm2UKTZqW0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U6eMxQ6gGsP+PGOv8CvoIWRRS5TJUyI8UxMjiqc47Mo=;
        b=OyRYPwZuUCKPo3+bmpw4t75BkLIf7rqOtJBTfV0VcQAwmsNi68ae4LLdOa37vFDwzV
         LFYGpKa5CCx91mtLV8kp5dS4feessd3IfoAH697c7xbpSr5UjU2yxIyPHfeyZmEr+7jL
         54hAWH8HaDxsvSU47/kkLOl6Y+kfMbffIHXz0WRv2ekBtaAnIUyCuGaqBApfy8g25amB
         sd+GRa8D6za3OuPXDOw5+W8pEWjkq8kbNZNtE/8cUIwAyxmFx9vgDg1aH4OVNLyK1U+h
         Slxdz2K69Ehm7C1mNIZHL7qhdhu/J5JsVEQxMDjpgTS+9/LZ2aGHga5MpVKRFohSDe2v
         khWQ==
X-Gm-Message-State: AGi0PuYWdfXlRe/l7EmwfA8JPMG482E/SK1MQ6tCZaSNAJ9X6l51Up5V
        grFZsmcO7v/lmApjbYJIFOMpVg==
X-Google-Smtp-Source: APiQypLQNaARhwh4BlYnWAU5WfsoUDeU0pdENYNXKn3KrAt4Qe7dKmRwhwnGgQvcs+0sUHauBpwL7w==
X-Received: by 2002:adf:e751:: with SMTP id c17mr25218165wrn.351.1589274009683;
        Tue, 12 May 2020 02:00:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 02:00:09 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [RFC 12/17] drm/amdgpu/dc: Stop dma_resv_lock inversion in commit_tail
Date:   Tue, 12 May 2020 10:59:39 +0200
Message-Id: <20200512085944.222637-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Trying to grab dma_resv_lock while in commit_tail before we've done
all the code that leads to the eventual signalling of the vblank event
(which can be a dma_fence) is deadlock-y. Don't do that.

Here the solution is easy because just grabbing locks to read
something races anyway. We don't need to bother, READ_ONCE is
equivalent. And avoids the locking issue.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9bfaa4cad483..28e1af9f823c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6699,7 +6699,11 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * explicitly on fences instead
 		 * and in general should be called for
 		 * blocking commit to as per framework helpers
+		 *
+		 * Yes, this deadlocks, since you're calling dma_resv_lock in a
+		 * path that leads to a dma_fence_signal(). Don't do that.
 		 */
+#if 0
 		r = amdgpu_bo_reserve(abo, true);
 		if (unlikely(r != 0))
 			DRM_ERROR("failed to reserve buffer before flip\n");
@@ -6709,6 +6713,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		tmz_surface = amdgpu_bo_encrypted(abo);
 
 		amdgpu_bo_unreserve(abo);
+#endif
+		/*
+		 * this races anyway, so READ_ONCE isn't any better or worse
+		 * than the stuff above. Except the stuff above can deadlock.
+		 */
+		tiling_flags = READ_ONCE(abo->tiling_flags);
 
 		fill_dc_plane_info_and_addr(
 			dm->adev, new_plane_state, tiling_flags,
-- 
2.26.2

