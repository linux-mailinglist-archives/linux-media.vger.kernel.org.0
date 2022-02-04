Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4F14A9768
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 11:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358143AbiBDKEq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 05:04:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358124AbiBDKEm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 05:04:42 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C642C06173D
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 02:04:42 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id d10so17784425eje.10
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 02:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rx5rKIs1h4pkPPx07vOixo6aKMAm9lXxnCcc7E9V7dU=;
        b=V4HxWMBwmSqyCzF0puYOm75Pg4LHlZZd73dPSvLtWqQfaGywaL9ENrwR6EEhNWIATA
         PAE0aikq8WPBTui6YjH5O9t3lZML+wi4Nv5h8iP+mWG7RG5Kh6MOBNXec5UsqlRNpntP
         qc34PH94usI9h2CCHb6VTnBY/Z8ZtG5+aQU5PPt6kv/RbHa2vNu1my44LwHUTx3OkK2H
         J3Zm8SwAGRLQRsUr0lBZdiOSg+oGsyPhfpzPgMAL0MR6K+fnuesYR+kLAsjeC1S40k2b
         PK5gW9WEIUq21kGYU2NPSkxpJA0SMDTafKYAeFKmWAwSxRV5aKYT31ijCHFY/memfmpw
         +VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rx5rKIs1h4pkPPx07vOixo6aKMAm9lXxnCcc7E9V7dU=;
        b=Xm9GVRjHFTirysT0IC4sCLO06LM0o/z92Bgp8YjtJuS6x9An8NdoYVZlmlmO2nBCm3
         pLvdrnMN2GRCy0OJNz+k6EvfNV0GjlKh1zhR/9Kt5dppHWVllQepIsnb1k1Csq6o3pZm
         vGrKoGxA1c8CmDGg+i4lMs43Jsre1IVVtj5Ep9VO4djo7qXq8KPyOoOXbPNTP0LZgFW8
         TQugjMW0Z0XSBTapGMZjq1wslvjOROZTD2+eyjUlvesDx2lqwC/+f8OoaeOC0kt+ZuoH
         iZHSTh+ShxS5PX8DkMnp6IBGIUnx6aCDMQ8HdW/2VxcfGUvd4AqcnF+hQysGn1Luiwle
         KX2A==
X-Gm-Message-State: AOAM533xNkXcnGHm07FmLwjPrUidnYU/xK6ENJ+Bhc5Z/884/Pp7wdyJ
        z2DtIJGM8say1OvxD+61prs=
X-Google-Smtp-Source: ABdhPJztBHmTGU6YkwToxZohDq0/Ut4O8GCLLrmJNsoENbA0aLh4NmlUkJR6QhSWUvCE7XuAmCh5IA==
X-Received: by 2002:a17:907:7f8f:: with SMTP id qk15mr1799850ejc.287.1643969081145;
        Fri, 04 Feb 2022 02:04:41 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 02:04:40 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] dma-buf: add dma_fence_chain_contained helper
Date:   Fri,  4 Feb 2022 11:04:28 +0100
Message-Id: <20220204100429.2049-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It's a reoccurring pattern that we need to extract the fence
from a dma_fence_chain object. Add a helper for this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-chain.c |  6 ++----
 include/linux/dma-fence-chain.h   | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index 084c6927b735..06f8ef97c6e8 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -148,8 +148,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 
 	dma_fence_get(&head->base);
 	dma_fence_chain_for_each(fence, &head->base) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
-		struct dma_fence *f = chain ? chain->fence : fence;
+		struct dma_fence *f = dma_fence_chain_contained(fence);
 
 		dma_fence_get(f);
 		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
@@ -165,8 +164,7 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
 static bool dma_fence_chain_signaled(struct dma_fence *fence)
 {
 	dma_fence_chain_for_each(fence, fence) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
-		struct dma_fence *f = chain ? chain->fence : fence;
+		struct dma_fence *f = dma_fence_chain_contained(fence);
 
 		if (!dma_fence_is_signaled(f)) {
 			dma_fence_put(fence);
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index ee906b659694..10d51bcdf7b7 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -66,6 +66,21 @@ to_dma_fence_chain(struct dma_fence *fence)
 	return container_of(fence, struct dma_fence_chain, base);
 }
 
+/**
+ * dma_fence_chain_contained - return the contained fence
+ * @fence: the fence to test
+ *
+ * If the fence is a dma_fence_chain the function returns the fence contained
+ * inside the chain object, otherwise it returns the fence itself.
+ */
+static inline struct dma_fence *
+dma_fence_chain_contained(struct dma_fence *fence)
+{
+	struct dma_fence_chain *chain = to_dma_fence_chain(fence);
+
+	return chain ? chain->fence : fence;
+}
+
 /**
  * dma_fence_chain_alloc
  *
-- 
2.25.1

