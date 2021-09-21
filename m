Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87188413893
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhIURjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhIURiw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:52 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F90EC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:23 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id q26so41521404wrc.7
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
        b=Fky4pf4ngQguMJBw1bj6vYQCTyG249/SrogqIKPRbmf5GRnkG5Fd8rGoJAbHx4UJva
         GlDBpCf21MvVefbquWTEGm1LEqqPX4SOD3D+WPpJPtd1DoDACKV6/VHDn8WeAXDhspia
         9RApRTJljhGb7ldXlRsVnNiXe7hxzc0SdNkpdNSAhUkE1XAbPf8Ft680BZH3UNcfRr0/
         MMIks68SCcCU5hpihva7eobNBM+NunbzBK8500je4cbZbxaNJ+xT91XOpqJXReXLqTqF
         EmBr8gzM9mMuIlHfQnavQSqhQMwCdt8zLpwSSa2gg92VdGVMpZiQDdWhzVP1/SFmicQt
         kxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
        b=C77OXwp66y85a9EORsWG/ToZswgVokn7k5eUVV5IPaXMd3zS9GQAweTacGS7FhRCKf
         Awd60GnkyUWrzsILnZPKUMIxlTX5zt/N3z1wl9nQVITjXRvtL8fzcONL/n6XXNiqfjyq
         DP+R/FRNQkaH66y49EGPVqTu7+y1n7HzI9+xTuCrOWoru8dtnXpRKKTwouELYxGwnqiO
         eSXrJwugR4h1q+QIjREBW1sNXkOQyyYJWykzoVWcpXD2rZ01HLBbIXSmSVGzTN/yV2jc
         Cl/GvBQMrFyMglsvm48/MFuHCZSvGuAMqLfEjfaWqYzPPbdMOB6jt65CE+TQ6qcO48gl
         4msw==
X-Gm-Message-State: AOAM532iZ1P1qiI9F2rEtWkIebYHNJ7sI0ZBF2/CZqUz/86DmAcDlZ51
        VvnVh66B5QUh3lmCR9E4CsXTVwKAa5o=
X-Google-Smtp-Source: ABdhPJzJ0hUrY2I6QXHaNYOd04kPKO6ECbWkuoehbNz9R6rGxkvX88xzbhI9KtrqoxK9t7M2cxSz5g==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr24548370wrp.157.1632245842138;
        Tue, 21 Sep 2021 10:37:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:21 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/26] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date:   Tue, 21 Sep 2021 19:36:54 +0200
Message-Id: <20210921173659.246165-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..21ed930042b8 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_fence_get(fence);
+		dma_resv_iter_end(&cursor);
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	dma_resv_iter_end(&cursor);
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

