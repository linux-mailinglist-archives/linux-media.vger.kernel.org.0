Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFD341EA66
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353490AbhJAKIT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353483AbhJAKIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:13 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D73C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:29 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d6so14550041wrc.11
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9ue7puBcgohS+7D/zNLeUPSF3Sf1Ar8z9127abKsq3w=;
        b=ZsjIr/vefBbHHiUwrD7XJy6MswdJEEhiBaLuWXQmIOhOiycUXnK4K0Mr6yl3X/ZLXN
         01ZHFiF7Bcchgp+oaYJ6GzVkisSKo6t3pZKQuA1E4988bGs6bEeuPLIDTWv6oWbmD5AC
         YokBuiOn3ytUFAvyaZH6zfeVIRuI7sE0ZjbAEiT9tUi/VWmFAyYZIrIuUSCPNFwoSOk7
         knnoQIZICNp7V1xeCANmtyScQ3pL9y0AdIHstGD1+yFaUjG/KmQ6mbWLKDNR95opqfMI
         rVFjPTkPYXfVxv4pwgc96ORquSUQO2yvHhwsqn8AQQbBhT6+5PC6Nw9+Yki15qkSQDai
         P+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9ue7puBcgohS+7D/zNLeUPSF3Sf1Ar8z9127abKsq3w=;
        b=VprkX0l/oTWxMUdQ8AcnfYoruGimD1TXc2xmqy7CHiDgPAujn/84ERvkyiJAgUVkqq
         p5/acGGgDyV8O1CpyV5DY09xy+sphDOt/QP22QPkY2yVI3Pjr1pI5lQUCMgKShvyr63t
         fDJuaYaM8ZS46ELUyTFfbYoyqEdCgudr06zlplXC5JDAD2NtqvRbOYRDhvhyb371Fwgb
         I0zNcOfgoCFYzK2ujua+cT4Q7I3JKcnxgT1d1z9a9tYGEZtPRsG/Ef8U2yKSST+MN3PT
         KlWs30PvaG9qfXUQMnQ1ohAIih9qx/Fziyk8wKYY130oNydFvNFLC4rH4JznHKBTblcr
         CbSg==
X-Gm-Message-State: AOAM532N2d54d82zsPsqXodccSBXkFgOzhQoqjxYwCfk8FNXLeGPCOdw
        rhT2y80aqvHmE1D1f1klQik=
X-Google-Smtp-Source: ABdhPJzm+9VExwWXqnVNs6G8xbrEIBMs86W03GOK95wzmAH6ZIKsuQCZRsC1otcFgzk6whqQoGRC0Q==
X-Received: by 2002:adf:97d4:: with SMTP id t20mr4627990wrb.34.1633082788233;
        Fri, 01 Oct 2021 03:06:28 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:27 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/28] drm/i915: use the new iterator in i915_gem_busy_ioctl v2
Date:   Fri,  1 Oct 2021 12:05:59 +0200
Message-Id: <20211001100610.2899-18-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..dc72b36dae54 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
-retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
-
-	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy = busy_check_writer(dma_resv_excl_fence(obj->base.resv));
-
-	/* Translate shared fences to READ set of engines */
-	list = dma_resv_shared_list(obj->base.resv);
-	if (list) {
-		unsigned int shared_count = list->shared_count, i;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence =
-				rcu_dereference(list->shared[i]);
-
+	args->busy = 0;
+	dma_resv_iter_begin(&cursor, obj->base.resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (dma_resv_iter_is_restarted(&cursor))
+			args->busy = 0;
+
+		if (dma_resv_iter_is_exclusive(&cursor))
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy |= busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
-
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
+	dma_resv_iter_end(&cursor);
 
 	err = 0;
 out:
-- 
2.25.1

