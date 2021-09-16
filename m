Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C3240D8AC
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238108AbhIPLcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbhIPLcP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:15 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7652FC0613CF
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:54 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso4230268wmd.5
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pfuQ70G8qZBcSy6i6jiB1XWyfMlicGj3imcgWE25C/A=;
        b=GXUnq4eCavRvuIAsIj7oteC1ah6Hq+BO23uIZ0VjvkSRl1dk49E+iJvuN/ogUxbjU/
         J7vaeKTbfZx4OeH7QIW3ZSNCK6IRA93Jj1ua4vjlDH5XfaiWqUHg1kqYREXprZY1GtGR
         9lCrPAV/AfMoogQ/HVuynYXxuFMKamgDv769H00vAAiohPYSwaNq4RIj1NXHaxhU4HLN
         pet/kNKzGXPfjiQc6pX9+mxu4CxpA4fxLlX7q2MzjZT/0z5Aoedra/osBcraVXnQYbdl
         28cXjzlqKe4UoZa5cbsFH3U/4ziP3xvZHZDK31YXCWc1hLBwucNj32k9Dh3tl95dUXy+
         5prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pfuQ70G8qZBcSy6i6jiB1XWyfMlicGj3imcgWE25C/A=;
        b=xXXt7O267JCgcldRX2FG8E6DutBgzZcln16gzXcye69mBsQCvNjj4eCxu1+W09q19x
         qq1P7IeK1zjhLRMVHrj760aJd2riOHNDexs9sQIYO5ciuwxHJwFSmBn5ixdQRrWB9oIy
         H77A37wncgU3PsA5jT58BHfjqRzkybwUzHzGbfTaWhtCiRpoTcHOODONX4TmFPODPm/y
         au46FSComtYMtcwZ/xnjOBlTDinQDOhnSh+D5BUE+ueSrCXuJgXbd7PaMKfzyJSNcu+4
         FnZJZHq0IhbsO3nqtXb4lTGg4pcllFGSdH6eO1zoU8h/YNlpqrO6U/YEhem4u0Tjee10
         9uFg==
X-Gm-Message-State: AOAM5308klKqeVcEEW+s72ChJqHJgSYG1LyQ+nwuDE6D6jkwacWA/7W4
        qwWt4YmS0Z/Z3xG1A1YKt0Q=
X-Google-Smtp-Source: ABdhPJxlBKNnYEhWH7vMm/DryGngoKWGeLHl+0nC7uWSV8U39RJo8QfsJZ73TAh5zjIKeo1P8tF34Q==
X-Received: by 2002:a05:600c:1c26:: with SMTP id j38mr7661642wms.12.1631791853035;
        Thu, 16 Sep 2021 04:30:53 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:52 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/26] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Thu, 16 Sep 2021 13:30:24 +0200
Message-Id: <20210916113042.3631-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 862eb3c1c4c5..e5d8bb11a14a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_iter cursor;
 	struct dma_fence *f;
-	unsigned i;
-	int r = 0;
+	int r;
 
 	if (resv == NULL)
 		return -EINVAL;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	dma_fence_chain_for_each(f, f) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(f);
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-					   chain->fence : f)) {
-			r = amdgpu_sync_fence(sync, f);
-			dma_fence_put(f);
-			if (r)
-				return r;
-			break;
-		}
-	}
-
-	flist = dma_resv_shared_list(resv);
-	if (!flist)
-		return 0;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
-			r = amdgpu_sync_fence(sync, f);
-			if (r)
-				return r;
+	dma_resv_for_each_fence(resv, &cursor, true, f) {
+		dma_fence_chain_for_each(f, f) {
+			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+
+			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
+						   chain->fence : f)) {
+				r = amdgpu_sync_fence(sync, f);
+				dma_fence_put(f);
+				if (r)
+					return r;
+				break;
+			}
 		}
 	}
 	return 0;
-- 
2.25.1

