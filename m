Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E930343DD45
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 10:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhJ1JBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 05:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhJ1JBC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 05:01:02 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A891C061570;
        Thu, 28 Oct 2021 01:58:34 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id b194-20020a1c1bcb000000b0032cd7b47853so3304751wmb.5;
        Thu, 28 Oct 2021 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6i0TILSChMzKedgIRlQxmjqUOkHsjq/nCVlt/Lvwgi8=;
        b=QygpYOhUkudEJ5eF+BqP+MPdtid8Z5JegqUKDJoG3b4Gzc9Jwd6mGsg1KsEr4hEEU3
         IcGwxgniQNWU5VObJumOOAVCwPXdfrZ4Ldd/00nQ/fikfjzW9ULVfKFzTJDoyIt1otp8
         wNWZ4M+sZP0c5wZJrOzxg4UkHJHSNxLMVCbZrt+tu9DEzQw5J+Ol83c3es73Dwgt90Oq
         bIHGttyt8S1p3gU3dwdqjp9kYAFVzQLWSDMw+ITwnrlq746rG9+DhDAniVG8OS/HCQDH
         CVV+o6S1apv5JRlWf9JW7nXOGkOG8Y2hGKhoqTX3xGD7eeaqiEAcmqFD/H2A5g37zyl5
         iJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6i0TILSChMzKedgIRlQxmjqUOkHsjq/nCVlt/Lvwgi8=;
        b=ZSRd3L16bCA6s/Jz1lQ7oe2dTw0xrY7Z+KPswdoLVJ1MDVyQICakipcapL7YaONdQQ
         o6mMzLkF3ud4Q880Y2YIMwKUxnyj9oNZfJazIiqfRE4O45HpvAna4L/DyqKhaQqzIrIX
         mLOq+BvWdlmukpS2C2Vg+STo6HYv+TkpRx77vq7frleqHv9z/ZKXZGR2vskKdZl//zJh
         9ljyzJVhnup4CR7S30dLbfOG+QPjWmpgZGJtslHjqPxTaeZRtO03c9HftKwrkHoAm+K+
         poAVFysBk0CoQHlLJijlRJJZeMyuGoRvdWn+EKJfuMxW5Lc7LGPOQ/B19txlYmlwxBfn
         KVDA==
X-Gm-Message-State: AOAM533M37TmYjgkZoZwcC65rv6cTOYkFcgpyLW+JNpbmi/YIb4W0wjy
        BdHBWpwrNTutuLIhshqlQ9mJm8ONqbc=
X-Google-Smtp-Source: ABdhPJyunwbQl67vWAeCOZxuApaRU12OkPj/DV3QTXOhqgjUkwXU/oANthE3I1spKyH9PmmyBFthJg==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr11139378wmc.126.1635411513115;
        Thu, 28 Oct 2021 01:58:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id k22sm2412143wrd.59.2021.10.28.01.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 01:58:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/etnaviv: use dma_resv_describe
Date:   Thu, 28 Oct 2021 10:58:28 +0200
Message-Id: <20211028085829.1726-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028085829.1726-1-christian.koenig@amd.com>
References: <20211028085829.1726-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of dumping the fence info manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b018693e3877..d5314aa28ff7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -424,36 +424,24 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 }
 
 #ifdef CONFIG_DEBUG_FS
-static void etnaviv_gem_describe_fence(struct dma_fence *fence,
-	const char *type, struct seq_file *m)
-{
-	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
-		   fence->ops->get_driver_name(fence),
-		   fence->ops->get_timeline_name(fence),
-		   fence->seqno);
-}
-
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
+	int r;
 
 	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
 			etnaviv_obj->flags, is_active(etnaviv_obj) ? 'A' : 'I',
 			obj->name, kref_read(&obj->refcount),
 			off, etnaviv_obj->vaddr, obj->size);
 
-	dma_resv_iter_begin(&cursor, robj, true);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		if (dma_resv_iter_is_exclusive(&cursor))
-			etnaviv_gem_describe_fence(fence, "Exclusive", m);
-		else
-			etnaviv_gem_describe_fence(fence, "Shared", m);
-	}
-	dma_resv_iter_end(&cursor);
+	r = dma_resv_lock(robj, NULL);
+	if (r)
+		return;
+
+	dma_resv_describe(robj, m);
+	dma_resv_unlock(robj);
 }
 
 void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
-- 
2.25.1

