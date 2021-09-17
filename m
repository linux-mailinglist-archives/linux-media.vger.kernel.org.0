Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C6240F7B7
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244238AbhIQMgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244220AbhIQMgw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:52 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59373C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:30 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id f62-20020a1c1f41000000b0030b42643f72so1776849wmf.3
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lPdZK7BIOkQEWY2TG92V49o75qXMdIlfGURkWq4Gvi0=;
        b=PxG28CRq7SfLj/CUTWydHmk4006k5rR2IcS9TrqiJsXEYfqf0xRqgYbOeW61NOovrv
         TT+d2LzxSF+ISst7yiR14Ik1DX+RUFzk4hPUgnow2ooP8xHIGy9oZi+r0N3wCnfi9Z0u
         eiddWPTKbHGqQJ29/9ocVpZI/qq/0Xg+ZaYRJjLfjUwfY2IeRb9gbQQat6SKPVfph3m7
         jXqA/NmXccNQ98ql6Aqjpi8JrfqtJle+nhYoo7/m/eIX1t4jfTr+/Xo0pOt4wW82SSvp
         xbpVhyDrY5kZzBIgOJfaSLP/EJncnSc0KGjo/CQnWtDK32674h6MrGnN0Fi/vaa6FvDT
         fk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lPdZK7BIOkQEWY2TG92V49o75qXMdIlfGURkWq4Gvi0=;
        b=rdi6cUDYpaGuRKbgemfMO8HhGp/R5GyPR99jtncAInptWAD9AT+tkWzW1c/I5vXSLu
         sZVPzAnExDNXSnETYmf/MhUpTzIbzlDoE+ONjZ66QPQJq+7hq6E+Y+egYhVqKpfO4JNn
         QsfH2oN09iGtL9HM9wKsezRXfo30/1Hglf6gFMJBpnyxsIAqWu26oPudnVKWwO/0qcX1
         GFblH0MmDJxJh7TzWciKaHF4cfMwLYvV6DIKAvZw2H07yLIOF033OtXaVDVbtVRUkJjB
         g/xROAzJ5fmYlf/NOQHKlETGFa5d9wU1BO/67UL8ag6Ep/B+OcTuKbXaxDrEqo/lQUK4
         olxg==
X-Gm-Message-State: AOAM532W30z6+twUtFo5oH15MmdtnwWJT7w0Rjzv6SwA9wc+ueqcObM+
        vWMIdkuOBdq7WJ+VcsuUAwHspFe7lsI=
X-Google-Smtp-Source: ABdhPJysDKC6VyP5ngCiTm1WvJqQsy1dzDim5DxuE39e6K262Xtj1qJmz5tuTO2Pa0VzjGCm33oxGg==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr14845111wmi.113.1631882128987;
        Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 15/26] drm/i915: use the new iterator in i915_request_await_object v2
Date:   Fri, 17 Sep 2021 14:35:02 +0200
Message-Id: <20210917123513.1106-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

