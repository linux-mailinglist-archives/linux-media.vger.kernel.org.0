Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D3F417794
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347167AbhIXPdA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347141AbhIXPc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:32:59 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F2DC061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:26 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d21so28559688wra.12
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=p+wRc1sNylAta5gGLWOUxoq4SRD+JVK/ZYiTsuz4StmBHX2gqnBSyF0cIZt0XSm5rx
         DBA/zVuCE4eV/hEfaMIng0NhgwNc4Ipch7MUp1rAgBi9kDMbxrl1d4Ovl1qGgolW5N7J
         kZTzQlAbBeQYTBgR9BinnpIF0H8Vh3b2w9LMsD2UVVT6IeUMsTMbx4B3z3SuWHl3v5R6
         xE9bU93IMBzFpUZQhMb8rYI8QyFH0rf/njQcRp63LD5uS5EvS9vV6HeDKg8ClnGGvSuw
         pod3BMBnO2iZeurdTVQuoUDWyk7lhEFMzUXBnoQAPaRFhzINiCJtW6eeBKE+YnAjr9i0
         BIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=rZfRshy/IR1HielmVwgAU2IGbSq/DYcnSMyxrhN60kc2P6gmSD0Up/JAE1dzi91hRM
         JFChMVvrpmG60EwCBzqdP0oEJGRPaEPQJOuVfm6NLbtOlmRrNWwb/5i1S2omTRUIZz/r
         yd/Cz4MPs18tustS5Art7cQU5KS2y7cdP3B59mNULphF4qQzDzlLIzK6anKr2dZeYOEv
         vrPL9ItKhgxd6JTH1TQddk/vgARSY9GYpJhC5ZuSfMKKiyq/yQ2gkrsaciLNnx6/ELIh
         fsgBbU6iXTBNGQOOB/rpI/1WUBCvtfPQwS75hiGvhtw9SNxwthX3PY6pXvUj1zdAFE0h
         9cEA==
X-Gm-Message-State: AOAM5324I/5x6LEDxPe7xEMmd5pgVoRuT39O8JwJf2CSSUCkVxmtATnR
        WFbpR8tHsQ0Vi3CSk4Lc8QY=
X-Google-Smtp-Source: ABdhPJyIPRl3nUImaPEHX0dkGNVZKX1295/miUAmR2Ra/obAIqq4uDr+3k9Cv1zNDrgVO/uuS5OSVA==
X-Received: by 2002:a1c:22c3:: with SMTP id i186mr2743462wmi.145.1632497484999;
        Fri, 24 Sep 2021 08:31:24 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:24 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/27] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Fri, 24 Sep 2021 17:30:56 +0200
Message-Id: <20210924153113.2159-10-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 862eb3c1c4c5..f7d8487799b2 100644
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
+	dma_resv_for_each_fence(&cursor, resv, true, f) {
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

