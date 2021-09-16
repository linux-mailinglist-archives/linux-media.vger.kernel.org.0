Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBBAA40D8BB
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238256AbhIPLc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238223AbhIPLc0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:26 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A058C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x6so8879906wrv.13
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kyOleDVWOJBAX5Al9bzCsD71zDRQwDAxTJRFXlsx32E=;
        b=nH6Fv1srD6vAMImVhu4qkDwJ1DeJ6EHRkTvSHSAiPq1DizBUmg4INVBj7TmvQfN1wk
         s7JN6sTZIm9dz1n5q79HkQJgPRvUic/5SWooR9JTzKPBxkDlM4Vu2E0wd7EDNJkKmJ98
         /M06J8x2kU/X6HhpeOZSK0dF3w7YFWt8WWEhC4a5m4CTDdw7rQ+PzbYLb3TURDnZVYWj
         SXCw6wK6rWrnT1EsKBXe/c6HbppvFPKhPqIgS7EC50/Vy/0lcQW+ToemKTfL2OTQMGO2
         55aVzZQxbqGneo9E5u/wZv2butWkkQeDIumjyOWFVcIzxmesLz+XSneo4DPscDGkAtT4
         o7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kyOleDVWOJBAX5Al9bzCsD71zDRQwDAxTJRFXlsx32E=;
        b=hFBWteKGjNxOTbAaMEjx50IQPB/BENJSMEPqiQEc6nJJ2YoE5jb5MSIJxkJNdgxwaY
         AI3AVdhrwm1L0KLXS/VkosOVQ4wt73tWDnLZ3Mewu/5M44tlpKGClW+cUkXFT8g7e/dT
         oArlxB0Bg8yUPe8uAdF1TEVYPxjViDXIERyFw1ZUujg0OiOthPbRzvcyai/N/WMp/8TV
         pqf46VPWkQMEVh+tUZ8QqUHcRLzkQNB2MoQEsTHf2ZwGOaTIBq1GL3YJKd0uF80Rn17R
         zLjIX8jrrCfaUraftqbmIoAFNGYK6bVNeJ6PUFF7UdcfdetqKxozyfFYDF+sJuKGJLKm
         YvuQ==
X-Gm-Message-State: AOAM532JC0Y5QV+ET3bhJD9dw5can1Pav1RgnpuDpkqiUdhL0nmdNB3M
        aYVcG4XcSAxkwshodrTy2/k=
X-Google-Smtp-Source: ABdhPJy866PHT8ShEH7QsAqiVUda4amf1rPNdv5LwqdkBFidDrfgrIhuDY1ULhqtsFASvUk9b2bsHg==
X-Received: by 2002:adf:e406:: with SMTP id g6mr5582396wrm.172.1631791864748;
        Thu, 16 Sep 2021 04:31:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/26] drm: use new iterator in drm_gem_plane_helper_prepare_fb v2
Date:   Thu, 16 Sep 2021 13:30:37 +0200
Message-Id: <20210916113042.3631-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..86df75b2f8eb 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,16 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, false, fence) {
+		rcu_read_unlock();
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	rcu_read_unlock();
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

