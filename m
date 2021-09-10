Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886DF406858
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbhIJI2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhIJI2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:15 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F01C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:04 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id u16so1449747wrn.5
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
        b=M1RjKlSJECx4MS0DsZ1oArWcYKVcShptg1wsRAotmw1sniqngIJqtiAE3qMaCmkPLX
         lEG/vaQf3P4qw3rCZbxGt2y8/sIT539y5GkEQhbx/ui7Ao/GlSSvixm2fN7a9mJMoG/+
         01Gqs805XQAF/rJFxdViLwn3FBTNqb8d1BEP32pqLh187NRgc91uKspSGsjRasIbusy7
         xH9UK/jcaGUslitEmn3CuvD/FNeYb5ZP6uIpXNbGSaA/fBj+waWwo4rGG2r5Gg3cQwxY
         vMxnCGBhwrWq9f2+Lkf2R6xBkcpzqSpk25ce5oQ4ssN+anqUm1qMLZWDAqxrBKF6Iq46
         fxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
        b=4g5zYOZ2h0LAcSK15JcM3rd7GtOFuYNMJvoLVrrSxdKePCNP7qnM7gDH5TcDFTTCKq
         tcZOVhDnljpWGFRF5dL9qPvIruBmS9uS+3ur1nd89cgV1LG2Zhc0HgV863hZmPx570PK
         cyyiE5U55AO931yjaGXFIKlo9ow4MBReFvu53Z/75a7Yje+AzE1cr+jDLC/4EW8cN28l
         U6wFat1crBF5ZRogH2vFMEWTHrgw/mw3V6KIDk7EWSODxSFg/Jzh8/4/qvCYVGJI1PBg
         PbEKQNnI6O/CictBjzYjBq3n+rhP3vdGYVlE2suNdQA5KpfpXG8kW1sKjrjG7SOjtNG/
         WL7w==
X-Gm-Message-State: AOAM531V7r0FzVu5LOzgNmO+iXTFkxPQM6FYZ/S7M0Hxb0Ven5TebgiG
        018oeLNz3YtmwkUJSXDay16A0f0cTpwGbF9n
X-Google-Smtp-Source: ABdhPJwti/PivNUxcntiq+mV5bRnvy3fWoun3RXdVSzz/jtT7J7GtASJ96xhTkxgTdJNYJ6YimSHEQ==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr8260877wrt.308.1631262423353;
        Fri, 10 Sep 2021 01:27:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 07/14] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date:   Fri, 10 Sep 2021 10:26:48 +0200
Message-Id: <20210910082655.82168-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 30 +++++++-----------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..c6c6d747b33e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,28 +109,16 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
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
+	args->busy = false;
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy = busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
 
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
-
 	err = 0;
 out:
 	rcu_read_unlock();
-- 
2.25.1

