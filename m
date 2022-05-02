Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C61B51749A
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386325AbiEBQld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386389AbiEBQlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:18 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B212EB86A
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:47 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id r1-20020a1c2b01000000b00394398c5d51so1819352wmr.2
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JJ3syRLZRf5cDZllRXn7Ii6fAdy4TAhne+oUq4LR8JM=;
        b=EJuFYyX/onL0HJ4JSG09ScoRSS3raya0MlgJRdQTgbH3rpOwp1ndohsJQHAJ6vQKFk
         uJ/DryMLrBrEgbCEvYEL2tZvd1i2sCSFCUGQFW5CAyUM0bavc3zeOKOUnCQsvVGyUcO9
         yWXrJmVXaxLV+Tqqg6PYxhaWB3inavH2X6ocugBjq/Vspv1DB+XzoV8vtJg7ZbcjBkLf
         WnCHUyKoZVrkAR6WdIki9mb7GjswsNdFEa4m0612subrl2ukwHVtqP1Upjs87+NW5aUs
         saU9wTuWvQjwqY6pVnlNsN0Q7jvICgBmsVa3FCWbHqSLvmfnFfJEIP2+9bKSZTfPwQii
         1cTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JJ3syRLZRf5cDZllRXn7Ii6fAdy4TAhne+oUq4LR8JM=;
        b=qjt0e3vg+XomWYHhD4JZYISqH3S+PgFl6BjCLQBw/x+DnoZGU0DL4QohK2rcGZb7LV
         HT+4WaAT9ziRCFFjXqqet9BqHs56uVQb6fxbgdIS1FE/EdCvNYOt++xUio+duIcm3f1A
         fs1pswdZ45vtcvDsSba6jEVzcyrWqk2Q0cxk4nv5FJpzhVk+cyv4y+lJPwk8UWXD/fTl
         easHUh2zOk1u+Iw0Yws5Dl6AHbFUaNr4tyjGhINzZbhUmLBUWuAouUTPATdH1as4Qgf5
         7U02amwH/VEhl1NUIFABQBZFrqRA08M+pguQ2ZaHAhxDfrvFFQbpKQe10F7+BnlYonJr
         8lCA==
X-Gm-Message-State: AOAM5329yrdYe9Og6w20Hl3ol2gclrKv8WXq/0YzevvO0jnIsRVPZyJF
        miMF59yGLiwQFBxSqW1yVmA=
X-Google-Smtp-Source: ABdhPJxYRvcNEnBAIcm2IwUgbnbX3g7RWLKbs5dcfFuCkBVefhGVaJWd+oqaJeeDM2lCNNoP6SCyMg==
X-Received: by 2002:a05:600c:190d:b0:393:ee55:5686 with SMTP id j13-20020a05600c190d00b00393ee555686mr2328wmq.126.1651509466306;
        Mon, 02 May 2022 09:37:46 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:45 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 13/15] drm: add user fence support to drm_syncobj
Date:   Mon,  2 May 2022 18:37:20 +0200
Message-Id: <20220502163722.3957-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For now just filter or wait for user fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_syncobj.c | 15 ++++++++++++---
 include/drm/drm_syncobj.h     | 25 +++++++++++++++++++++----
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 5a961ea90a35..8d25a2dd107b 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -386,7 +386,7 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 	struct drm_syncobj *syncobj = drm_syncobj_find(file_private, handle);
 	struct syncobj_wait_entry wait;
 	u64 timeout = nsecs_to_jiffies64(DRM_SYNCOBJ_WAIT_FOR_SUBMIT_TIMEOUT);
-	int ret;
+	long ret;
 
 	if (!syncobj)
 		return -ENOENT;
@@ -398,10 +398,19 @@ int drm_syncobj_find_fence(struct drm_file *file_private,
 	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
 		might_sleep();
 		lockdep_assert_none_held_once();
+		*fence = drm_syncobj_user_fence_get(syncobj);
+		if (*fence) {
+			ret = dma_fence_wait_user(*fence, timeout);
+			if (ret < 0)
+				return ret;
+			if (ret == 0)
+				return -ETIME;
+			timeout = ret;
+		}
+	} else {
+		*fence = drm_syncobj_fence_get(syncobj);
 	}
 
-	*fence = drm_syncobj_fence_get(syncobj);
-
 	if (*fence) {
 		ret = dma_fence_chain_find_seqno(fence, point);
 		if (!ret) {
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index 6cf7243a1dc5..acc3979815eb 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -28,6 +28,7 @@
 
 #include <linux/dma-fence.h>
 #include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-unwrap.h>
 
 struct drm_file;
 
@@ -89,18 +90,18 @@ drm_syncobj_put(struct drm_syncobj *obj)
 }
 
 /**
- * drm_syncobj_fence_get - get a reference to a fence in a sync object
+ * drm_syncobj_user_fence_get - get an user fence from a sync object
  * @syncobj: sync object.
  *
  * This acquires additional reference to &drm_syncobj.fence contained in @obj,
- * if not NULL. It is illegal to call this without already holding a reference.
- * No locks required.
+ * if not NULL. It is illegal to call this without holding a reference to the
+ * syncobj. No locks required.
  *
  * Returns:
  * Either the fence of @obj or NULL if there's none.
  */
 static inline struct dma_fence *
-drm_syncobj_fence_get(struct drm_syncobj *syncobj)
+drm_syncobj_user_fence_get(struct drm_syncobj *syncobj)
 {
 	struct dma_fence *fence;
 
@@ -111,6 +112,22 @@ drm_syncobj_fence_get(struct drm_syncobj *syncobj)
 	return fence;
 }
 
+/**
+ * drm_syncobj_fence_get - get a reference to a fence in a sync object
+ * @syncobj: sync object.
+ *
+ * Same functionality as drm_syncobj_user_fence_get(), but user fences are
+ * filtered out.
+ *
+ * Returns:
+ * Either the fence of @obj or NULL if there's none.
+ */
+static inline struct dma_fence *
+drm_syncobj_fence_get(struct drm_syncobj *syncobj)
+{
+	return dma_fence_filter_user(drm_syncobj_user_fence_get(syncobj));
+}
+
 struct drm_syncobj *drm_syncobj_find(struct drm_file *file_private,
 				     u32 handle);
 void drm_syncobj_add_point(struct drm_syncobj *syncobj,
-- 
2.25.1

