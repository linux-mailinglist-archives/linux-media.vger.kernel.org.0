Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9169341EA6E
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353461AbhJAKIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353465AbhJAKIT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:19 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6057C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:35 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id t8so14656244wri.1
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
        b=Q5fsXjqZacYAaNCcYSLJtyR71stnzbiX9gtPzj7ceKIeRysoqMaOtUNllAvvgd2ZoQ
         Sc5D057EX2p+NDRuTem2faYmnkbO43kWuIuS+RbsMlLREQ+P22kmAFgGUaFzNec5ugqD
         OLcj30xorhSLnNJLon3PdbY0boGcwnhVrvYCH2+GauY5bybmqLL9cylzhgca4EhRe7hh
         f+Ko3Dix7MvOGdih49HSBRBf8jlQIzNadjJ63NOeUnw/DcptLjx6EvXSlvHWyyGq4jac
         ze1k0PdHgLhw1ssuJI6N5O89xBmMlrlY1L4Tcr8UXVl2/OLehgJE25IVdX+WbI9UVv2A
         pOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
        b=1xYHI8iN4CQh3s82CH9bhTUTcUgtBgGLjXeycG28IwzNPpc0jzVw82SF8MgHiS1Rng
         UR0R5QIQxLf7MmxMJoO9i3td6LDNe9IlLwWOkyDY+1f3gzCGhFbOSF9eOy/3vVHBOU2o
         Kv+NgFeRIfDh4WRZWvq4gGHdTCLrIVGzw8VvvEk+oEzxbvFgWdZFamV2j6iwu8E7bGbL
         RyryC0Rzc9Tt+/bH4wxxixWmBO3Lju7j51L8f26kXCvbfLsz1l4LZa7WCbioLrUHk3xe
         MEKljwrEi6u27c7y4mje93uIy4CDminXgg7IEo/2hz7fadyhiDrnrPn6SyDbI60L/RSY
         mMjg==
X-Gm-Message-State: AOAM532MXXcNH72zu+GWIVL3xKh48gPGv7CEVp4F58svMNBo/ZcXFbRR
        2QkiXQPe1gFF/IDHw/Nu24U=
X-Google-Smtp-Source: ABdhPJyyVqiekh0Qo/9t/1Ebo4yekIFwSNoQ4xwKqMx7ARLoWIBrbcftHj6Gp3duatEx2cQ8mnEMNQ==
X-Received: by 2002:a05:6000:2cd:: with SMTP id o13mr11033052wry.193.1633082794324;
        Fri, 01 Oct 2021 03:06:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/28] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date:   Fri,  1 Oct 2021 12:06:06 +0200
Message-Id: <20211001100610.2899-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..21ed930042b8 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_fence_get(fence);
+		dma_resv_iter_end(&cursor);
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	dma_resv_iter_end(&cursor);
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

