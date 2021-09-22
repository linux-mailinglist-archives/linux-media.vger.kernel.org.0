Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEC874144B0
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234302AbhIVJM6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbhIVJMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:36 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E7DC061762
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:05 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u18so4699673wrg.5
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hCpA+E2br43WJP4Y9CGTvHgISqNC0oMJe7QwHdjU6w8=;
        b=Y/kS/NftrpX0ijLcmSu6hcExyAyMR56qikqNimworP2eqSrP/qu8NCC29oax1MpWOU
         40oXjnsAR4Gwjl4BBJppo1OZIgBwsrGT7f9MwqCMeBANA6zntFEDap3cQNF9VEns6VnQ
         n/Y6KazzHP/Q+BsSFgUrvrLGQnb9zzYo6E5Z5+pM3jftNQqnZHxuvVdqJb3R0vgpRNLV
         LG+lW9FFwRH7+Jc4OhcwUJ4tHPBCizp/iqPanI9z43tUL9AMDDJiqaWuEcE8u81MldGW
         G8Qk+BL4XGSga0oCJT8e2qv/JgBV/wRAhh8mE76/Ryti0wgTZ0k3UA1E0gildRpXzZ3R
         Po7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hCpA+E2br43WJP4Y9CGTvHgISqNC0oMJe7QwHdjU6w8=;
        b=7VeuwKkg9JuUXMqDIHteq3VmUkE57z2mqA1X0t1gmgMkNkcAbX25AebvP3VSHRzGU2
         UqAMLWhnZIrwjruPuHW8bu37kEm7CHryFpYppt/FEyXdiyHHExRinYyrX0qTVuHE5TjM
         Kdycf+Wiu6l/+qz2OiUuzlPuWwFfgvw6bp45VBjcbMA1OIHNpybPzRzRh712UzmJHzjc
         +yr2+BUG9J0CpYnbTJs5+ZJRdoWp2RhkS+1S66t2zYG+RK8JuuYW479fqMs4HjEtb0rc
         pBkJKqMj/mJxhj+QXCNPGkqIgdaKB19zvy55JA+e1JTny70DQB3nK6LJ0HGlm9q8Qa16
         Ta4w==
X-Gm-Message-State: AOAM531a9Hs5lg/oiQPNiaK7bDPf8yhqGf/TPQ38z2NLWK/eZjoTwaM9
        2nKVLVFWOoenOjbbRlf+Pr22zyRnn8E=
X-Google-Smtp-Source: ABdhPJx9as+sEsCUrBNh/QCRLWGDtkLVpXctd0qhCAydZwgnZ5oFMKcX6dtRLBYNG54ifj4UEUNUzg==
X-Received: by 2002:a5d:510b:: with SMTP id s11mr39364292wrt.79.1632301864519;
        Wed, 22 Sep 2021 02:11:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/26] drm/i915: use new iterator in i915_gem_object_last_write_engine
Date:   Wed, 22 Sep 2021 11:10:36 +0200
Message-Id: <20210922091044.2612-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is maybe even a fix since the RCU usage here looks incorrect.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..e20efffce3a9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -507,16 +507,16 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
-	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
+	dma_resv_iter_begin(&cursor, obj->base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
+	dma_resv_iter_end(&cursor);
 	return engine;
 }
 
-- 
2.25.1

