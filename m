Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AFE4177A1
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347186AbhIXPdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347182AbhIXPdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:09 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F08C061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:36 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id t28so15275533wra.7
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
        b=iO4CmtdNAnL4uuv8xgnCB16BsxNVtl9ibKpLd6ayJybZbrebzBGngjD239pa1XN9vn
         RESwql8n+MLOmofxMqnr5ZJtbNSAjAp+LM1rba73yQYAR1d5zQk62rr2v+ZChdv+v2FW
         kXM2uIQd8P2iXiVKkNl5y2xUHltmfphvSXBvVHTeJT5fXvF5sIpXasUG3dj9Vmy65iyf
         U8FM+VLTayiyUbzxVG95NIo/rcX9u6mCgbf+aTdIM6NaghwdvhA2Qe7bm3HpjQ/3aKqY
         XtZZiHLMMT2B/EsfYvK+8RPtydU7Hu9eflzOgSMklpRKcaX7bf6c4qX5jQ3lwBpwOPtR
         Fi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
        b=k12KFHai45eC09mCw3Ve81I6NGVIpYSfxlLnMs1faMrq/fTeQQKAc7FUvJUkeOhG5u
         ejhkqG9YQ4lAg2Nh7mrl39Q4YWEGrG8ecK1gpwHJ9ckgo8KUCghfmT7+sEcyg4lBwS1g
         8xZqJZiqaLXa4550zCwhnzWHTVmCMIiDb/5ctP8OSv5MYjX/OYlaLNGT1m2YbmWx6N1T
         NYKaY+Gc0L4FcacFlcuI2EfqV6FJxKREIYGb5lSoASb6SlWKPa/GMwwdSDkIOrDOFu/L
         HvFNfwHphzpoubdHhzcSl6Wvoxjj9YgeqHAp1ixKQNzUovVS+aNv0Zi+jv+tPGqiIY83
         LPrw==
X-Gm-Message-State: AOAM530exq89D9SAkjbsCD/fSNmc5Rs44FOl8byMuawORy2HFQ4fRVNn
        ss8b8DphTn1y/E+QdbX1KrbzXc9yuJU=
X-Google-Smtp-Source: ABdhPJyxcD57OlJxWG3U4RdnHWzhMBXfGvx5jpnBs0+/4OjO0WJtsxhWnDdkItuAS//GCUb3gqE/Gg==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr12532920wrq.145.1632497495158;
        Fri, 24 Sep 2021 08:31:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/27] drm/i915: use the new iterator in i915_request_await_object v2
Date:   Fri, 24 Sep 2021 17:31:04 +0200
Message-Id: <20210924153113.2159-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: add missing rcu_read_lock()/rcu_read_unlock()
v3: use dma_resv_for_each_fence instead

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 34 +++++------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..3839712ebd23 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1509,38 +1509,14 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
+	dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
+		ret = i915_request_await_dma_fence(to, fence);
 		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
-
-	if (excl) {
-		if (ret == 0)
-			ret = i915_request_await_dma_fence(to, excl);
-
-		dma_fence_put(excl);
+			break;
 	}
 
 	return ret;
-- 
2.25.1

