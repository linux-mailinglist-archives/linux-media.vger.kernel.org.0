Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB5836BC5E
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 01:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbhDZXul (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 19:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhDZXul (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 19:50:41 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0872FC061574;
        Mon, 26 Apr 2021 16:49:59 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id w6so25571908pfc.8;
        Mon, 26 Apr 2021 16:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Kj0SXA9vsOtoPJRmbl9kO6maA5cV9sB7CgScAwXMzI=;
        b=PFvUwvqW69maGIZ5IE53RvvUM+/kvn8XSEdtYOjbhbPlzT0Riuw8w7Ts1JFVxIDqpQ
         hkN+WE+9gKJKaxtoiRgHMpvs9sljBPxeoFTD8nkotwJ/goVrvSwQUvwMUdX0MB/hLWnu
         MHDlhhg8N/JbcQAJZ2Db5qaoK6tdTEf1BouwU/gi3Jg6UZCryIRDm9+uZZRvWjQ+QUb2
         +OMRwFtjC+RQpFVbk6gyUexFskpIjmkRZODzFO+vpHsN+PWjGIOYxdVwKcYgAWrvOR92
         EyGQlT0paeIxMRnpQ59hRd6/qHmCbR/KDJxaMA02Q6ibFopq2uKIiC6xQzJoLcSwHQ+0
         bIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Kj0SXA9vsOtoPJRmbl9kO6maA5cV9sB7CgScAwXMzI=;
        b=qEzWEhmda9UHg/Ot595huQAWu/MH2ieyK2OdLNZtxjj219A/SNzyKYNDiCt8uh94/i
         12HBXr2MmOwwZmSSoFtTCVbTxPvBjrNsBuBIWP5kmZEyXKK/m4DzxWcSahTKMOi1UCCc
         rpF2W+SwZtiuy61pBEi1wEW0mpwG6vAm8Lz+B6qr+uoeyAEfLxJnhRFcW4hsOWfb+gX9
         ZnFc+3zNA6Ak1cihOT8VTm3pKaWm0BYlBGIWzIvQvQCPuPi438+vY00VfW25YPHtQR9U
         BPZyT5JSnGAZHioa8N3rNebQSAKWdyuaiQXqCP8qAwWLH6WBVtqNvU8AyoOGb7MWrg3M
         fMPA==
X-Gm-Message-State: AOAM532+hbRN7STcip4CfnF8QteAnc3u/bI4BiVl8sBaFc6XPCz7Mv0W
        r40nmLXo7ewWnlDfc37UNRM=
X-Google-Smtp-Source: ABdhPJzlJCZjMw1AMpMrqCCtVcFtp5ga8BJTa2+1W/jHgDQCNHWITvuZXAkIlz5HiSTjiD6+Kb+v/A==
X-Received: by 2002:a63:eb46:: with SMTP id b6mr4060320pgk.199.1619480998570;
        Mon, 26 Apr 2021 16:49:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id w189sm646315pfc.31.2021.04.26.16.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 16:49:57 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK)
Subject: [PATCH] drm/msm: Do not unpin/evict exported dma-buf's
Date:   Mon, 26 Apr 2021 16:53:25 -0700
Message-Id: <20210426235326.1230125-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Our initial logic for excluding dma-bufs was not quite right.  In
particular we want msm_gem_get/put_pages() path used for exported
dma-bufs to increment/decrement the pin-count.

Also, in case the importer is vmap'ing the dma-buf, we need to be
sure to update the object's status, because it is now no longer
potentially evictable.

Fixes: 63f17ef83428 drm/msm: Support evicting GEM objects to swap
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++++++++++-
 drivers/gpu/drm/msm/msm_gem.h |  4 ++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 09ef4ec6eb34..17f85d2f23ab 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -190,13 +190,25 @@ struct page **msm_gem_get_pages(struct drm_gem_object *obj)
 	}
 
 	p = get_pages(obj);
+
+	if (!IS_ERR(p)) {
+		msm_obj->pin_count++;
+		update_inactive(msm_obj);
+	}
+
 	msm_gem_unlock(obj);
 	return p;
 }
 
 void msm_gem_put_pages(struct drm_gem_object *obj)
 {
-	/* when we start tracking the pin count, then do something here */
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	msm_gem_lock(obj);
+	msm_obj->pin_count--;
+	GEM_WARN_ON(msm_obj->pin_count < 0);
+	update_inactive(msm_obj);
+	msm_gem_unlock(obj);
 }
 
 int msm_gem_mmap_obj(struct drm_gem_object *obj,
@@ -646,6 +658,8 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 			ret = -ENOMEM;
 			goto fail;
 		}
+
+		update_inactive(msm_obj);
 	}
 
 	return msm_obj->vaddr;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1b519fcd8418..66fb40b87122 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -228,7 +228,7 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 /* imported/exported objects are not purgeable: */
 static inline bool is_unpurgeable(struct msm_gem_object *msm_obj)
 {
-	return msm_obj->base.dma_buf && msm_obj->base.import_attach;
+	return msm_obj->base.import_attach || msm_obj->pin_count;
 }
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
@@ -278,7 +278,7 @@ static inline void mark_unpurgeable(struct msm_gem_object *msm_obj)
 
 static inline bool is_unevictable(struct msm_gem_object *msm_obj)
 {
-	return is_unpurgeable(msm_obj) || msm_obj->pin_count || msm_obj->vaddr;
+	return is_unpurgeable(msm_obj) || msm_obj->vaddr;
 }
 
 static inline void mark_evictable(struct msm_gem_object *msm_obj)
-- 
2.30.2

