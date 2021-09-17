Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8D7040F7BC
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244272AbhIQMg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244253AbhIQMgz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:55 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9151C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso9829417wme.4
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kXKjeGBADw7OkfdzhZSt4MyIYI/kiJUFDi8gqE27MEk=;
        b=XGeEkOBDKSxjLIr9h/2LXxg9b9Qp9nQ1jeAbxOHQ+Y2aKqPLBmAEgc5hv8ZllcOneH
         SXLXD4Mlufs09lr7ateqOtcrvkmEeRMotR+E4NhWQCyLAYRPsfbdDJ8QfQihjOVRtBb/
         xCd1cQ8thLx5ZidjLtsClZ4an9qRTn3z+LA+qfuFiJJKwZSMcLebr9doAJ8QSVJK5CHz
         ygSW/dgDvOCbV2ZTz9v5mgMlKmTm9mWcPKxCldkP9CEENogrstu9w/h1Qn7IC1T6zdFi
         OQhQVLbMuZCAhuj0EXJXdrqUBXxpexyAaR3qsYU9TGdqdQHnqbdisIfWYbgmHxzCrgBG
         0UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kXKjeGBADw7OkfdzhZSt4MyIYI/kiJUFDi8gqE27MEk=;
        b=c/KXdPkWZGpIZQ4pJrt3wb5CsPRc0F4ToTTmxCNre3SdbVjFYrrwUrOroluESjjP8A
         ZL4lsXM6XpL3ujv7YiY4MksfIVmv6WdTLWdF20HFYPxGM59nDoVwmm/LLz4AkUwE4C58
         zgwdd98fIE6fu2okwT4Ci9h/AvXA9W2zuwgLn3ofa7PX/vJGnsPDgWYdr7oVsClvq2km
         h3TkMR6xnWmzKH/d0syJpDd3nI0uthtssECGBA69MibPFT8/mD3UR7VeeZc6X9VTCPhh
         Rrv5/E5fwXhmRhXhu2lZlpwiKJwUCPdCadkDsQjBlQbXVWwFPjikUcrRh5oqiu9TlX/g
         MeNw==
X-Gm-Message-State: AOAM533nobld8ce8UiPdyZzu8aQdi7SjtBb+xVeLzx2RAv73RVExjq4p
        hhHjcCn56dccESS3RmRRxbU52GTEB5g=
X-Google-Smtp-Source: ABdhPJxnRPxEMk2FxBtoUnZidz/iVaBR9QM19ZzVdBgpzDZjd+/cY+u8xzzlOzFvnY7JyZ0eNQMvpQ==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr10074382wma.83.1631882132299;
        Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 19/26] drm/i915: use new cursor in intel_prepare_plane_fb v2
Date:   Fri, 17 Sep 2021 14:35:06 +0200
Message-Id: <20210917123513.1106-20-christian.koenig@amd.com>
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

v2: add rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 134a6acbd8fb..51e3df0de1ce 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11290,6 +11290,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_iter cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -11300,12 +11301,16 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		fence = dma_resv_get_excl_unlocked(obj->base.resv);
-		if (fence) {
+		rcu_read_lock();
+		dma_resv_iter_begin(&cursor, obj->base.resv, false);
+		dma_resv_for_each_fence_unlocked(&cursor, fence) {
+			rcu_read_unlock();
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
-			dma_fence_put(fence);
+			rcu_read_lock();
 		}
+		dma_resv_iter_end(&cursor);
+		rcu_read_unlock();
 	} else {
 		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 					   new_plane_state->uapi.fence);
-- 
2.25.1

