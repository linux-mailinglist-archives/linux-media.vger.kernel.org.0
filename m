Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34D92178C6
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 22:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgGGUNC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 16:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbgGGUNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 16:13:01 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9131BC061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 13:13:01 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id j4so44181461wrp.10
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 13:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y1VbY5ZB/L6W9r0Bvi97djdXHD1/JVCuEPc3nxQDtTg=;
        b=LR4PlS7gyq2GSGWIRhk4IPyybwdSoLRvHe+WFW+jhPBv5lNTmi6seJwHISY0CmTie7
         1i/ph6/DDjBC8Qsa6egY5ZnqeTfFNDNk3kLXXj9T1G31UXZUU+e/4yj4fR4u4tVxqUCf
         7zSzmWfrfWk92EDswnhtEzhq2gyUqgAQQxH1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y1VbY5ZB/L6W9r0Bvi97djdXHD1/JVCuEPc3nxQDtTg=;
        b=kprG+wZEy7RZ452yAYsaWh/9X2qkypArf07HtvQ252hg82MynwU3CDmwW1GgAFZ2+z
         YH5hZ4KgScO2rUpVqynItodh/ZxDG5DsNxJM25uLEqwIliP6uHT3iKPR+5TXqI7FmObQ
         K/bxw763ilOesyr5PmqHQr1f01R0ECUdfvqXGwsarZf1Z75mFsDKCoEh7fmIYKv0a5XU
         N3CtjgEcmcFFrueZJxPF7UCC/CiAQ1HbnO8clsbmmmUboDvExTmajVXJHtBKIXkXPVR4
         6HoZszHRF5Gu5ZLUzDMLD0NMBAMbrXyRqUPLa2USTpjkwuL+pbFygYpc0CFRAgNoclRk
         /+Qw==
X-Gm-Message-State: AOAM530arWcc3eXpJFXRQiAiMy6JFiFveNKIzCXv7atwnUGWkUNm/+WS
        hn3NqW/V13BleDLIzLWIY2nwlw==
X-Google-Smtp-Source: ABdhPJzGrQ2RgMrK/l+05vdZJ29xKjThN5zLPU4hxr+GDdUU7CiSnj5b5zHZxNDIQZnGaFx+fLeNvQ==
X-Received: by 2002:a5d:4051:: with SMTP id w17mr53069228wrp.183.1594152780339;
        Tue, 07 Jul 2020 13:13:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:12:59 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 16/25] drm/atomic-helper: Add dma-fence annotations
Date:   Tue,  7 Jul 2020 22:12:20 +0200
Message-Id: <20200707201229.472834-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a bit disappointing since we need to split the annotations
over all the different parts.

I was considering just leaking the critical section into the
->atomic_commit_tail callback of each driver. But that would mean we
need to pass the fence_cookie into each driver (there's a total of 13
implementations of this hook right now), so bad flag day. And also a
bit leaky abstraction.

Hence just do it function-by-function.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c6bf9722b51b..f67ee513a7cc 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1550,6 +1550,7 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
@@ -1561,6 +1562,8 @@ void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_commit_hw_done(old_state);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	drm_atomic_helper_wait_for_vblanks(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
@@ -1580,6 +1583,7 @@ EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
 void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
@@ -1592,6 +1596,8 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_commit_hw_done(old_state);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	drm_atomic_helper_wait_for_vblanks(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
@@ -1607,6 +1613,9 @@ static void commit_tail(struct drm_atomic_state *old_state)
 	ktime_t start;
 	s64 commit_time_ms;
 	unsigned int i, new_self_refresh_mask = 0;
+	bool fence_cookie;
+
+	fence_cookie = dma_fence_begin_signalling();
 
 	funcs = dev->mode_config.helper_private;
 
@@ -1635,6 +1644,8 @@ static void commit_tail(struct drm_atomic_state *old_state)
 		if (new_crtc_state->self_refresh_active)
 			new_self_refresh_mask |= BIT(i);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	if (funcs && funcs->atomic_commit_tail)
 		funcs->atomic_commit_tail(old_state);
 	else
@@ -1790,6 +1801,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 			     bool nonblock)
 {
 	int ret;
+	bool fence_cookie;
 
 	if (state->async_update) {
 		ret = drm_atomic_helper_prepare_planes(dev, state);
@@ -1812,6 +1824,8 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	fence_cookie = dma_fence_begin_signalling();
+
 	if (!nonblock) {
 		ret = drm_atomic_helper_wait_for_fences(dev, state, true);
 		if (ret)
@@ -1849,6 +1863,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	 */
 
 	drm_atomic_state_get(state);
+	dma_fence_end_signalling(fence_cookie);
 	if (nonblock)
 		queue_work(system_unbound_wq, &state->commit_work);
 	else
@@ -1857,6 +1872,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	return 0;
 
 err:
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_cleanup_planes(dev, state);
 	return ret;
 }
-- 
2.27.0

