Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB9940685A
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhIJI2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbhIJI2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FD3C061757
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:07 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso819209wme.4
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hvNXqtq5mdZJpJK7jpCUZ+hsh9G2TDoGYYpRx9Mul74=;
        b=A0kUPdgAC5+TWncOXFWh9Qfoaz4FqK6InBydLkzZ2x7lLAs7i9QFOntRXj7yX9qarp
         cUBcMzhKvr9jHJpHtBm+wJjchNGcL6IoCyzu9L483z8pzFqYV3B0KTH+6m9hAHIGKKtu
         0sgckvdf0Yj9lszW2BU2mwHEI+scDEg6bsDzdWehB+mB3EzrE6VcbsHrBHxYq4VFwR7v
         mYGnlldEKj2n5a/+SMQYOW/vloLUldESANOPycvU0UV/EFyvTlRYWZQqkEfmEORntF/m
         yXgusF9ccePSbKyYDC8ZP02wrj3GXK5P4bKvgooD7j9adhlK2j3q9aRhJUsWMqnKJ3Ph
         RHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvNXqtq5mdZJpJK7jpCUZ+hsh9G2TDoGYYpRx9Mul74=;
        b=CMw76YMPRvOdoMk50VN4yszYuCmqU7DxgWxX0zHTex6vA0kquU1inLx7hav6WAeK3K
         zyDl1JIrPw5IdVz4YfC1XjhRXZgwwosoWWJ9I/yDs1TD5cMJSjsay85z/8Dbme0Vv7+o
         L3zxt+hFAf4DRQYUYJKe+7qHvLdGu8K1tpW2524vEmhLLHTlq68NsYgzr0fvO3bXCaEG
         UVAjxsK3gkagZsWkpuT33CIisNl4//SRORUJ9a1XHzM1lyKD2K1+ecQ1/Bl06nYdOGDe
         rfiyEf1Y+/K4We4yeihOsc5odkK6uvxgjntD5wuTsGiw6q8VyNad8sHezCME6iKY5u/b
         RGSw==
X-Gm-Message-State: AOAM531UJOMFgToRl6OIO70YyWDXgS4vzaQCMzrPzqeBVjEOp94cQSx5
        8rxcWCVPlWIihqaip2xwiFg=
X-Google-Smtp-Source: ABdhPJzCx/DlccM/dfWL6V5U0asbK2EJmgwOciOgRAKzlNGULrLLN3jCgvQVAzCAfYglVTL5xpoYmw==
X-Received: by 2002:a1c:cc16:: with SMTP id h22mr7144408wmb.117.1631262426227;
        Fri, 10 Sep 2021 01:27:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:05 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 10/14] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Fri, 10 Sep 2021 10:26:51 +0200
Message-Id: <20210910082655.82168-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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
index 862eb3c1c4c5..031ba20debb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_cursor cursor;
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

