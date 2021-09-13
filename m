Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52A8408CA1
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240257AbhIMNUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239126AbhIMNUV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:20:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEABDC06179A
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:40 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d6so14633080wrc.11
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3dTnv0wZDKxkTKIX7G+9uQukAnU514pBLlNXg29d5fI=;
        b=Lgl8jFt56FEVABP4weWNvGk/OVvu10QCGLGUUofKJsRqFEbGhFfGR1qdVYJQvKSWWT
         nTAjH5rflOIuPro5rPslw3CLOKtWa1ZNMLOiwwT9gOgnTACex5+PlP3KWDyCggFjje7A
         Bbe+GMZq9MbwL2sQsiZTB8YcwWW9vBhWSCfSFK7X+12l3fYMDHuLKiZ++DMXsSrwkJr3
         qCMqaZYpcHHEcPIz0HCpzA/RGM8yJhiXdXEObIKr/fyyiW9DMa3RfvteN8NRzyOQuSRP
         ug8LiQq46fFt1Kk5caTZm+hLk8R1MVAVCXYVWzP0S7314Ra7SERyUcWGcRCJDm6mnZVM
         c4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3dTnv0wZDKxkTKIX7G+9uQukAnU514pBLlNXg29d5fI=;
        b=ZHcuEUUxL5rcXDm+wml6VIJ9EcT5cghLPDayEQPnC1ossnja/hRfcQyU7Ku04a4caa
         Rufgj2j2zclf0iKVKg25FdHPSZJ6YhwZZbIMpTfEa0UZBEjmD/MtZ/jRfhtWSmtNpPRn
         AKZXa+dTERKLBPw9he5BefOeHG0zcIFEyYE1ED2LAZm8xRgau0Bl1bXnOeiZ5v66xGD+
         KC+IP0ReTL0iijGeYr3QXiu3XTKcuM7VbybnAxdQ26AwN0WlnaEbCQRavcFFL3oJQ1k7
         HVcHL0IYvSTXZBjt7cnbMviuxKHeojJs8o57oEofwt5MGN6ZVqXmjnb5iS5WjwJlxA0G
         F9dg==
X-Gm-Message-State: AOAM5334xejVjnImwj/T1faM1+j/cZ4CCZjzu7Ugc+aRHTY8oach2gQI
        ArZnN8ZHFcC7X9xA5oC5HwZMfLgvA5nZjn6j
X-Google-Smtp-Source: ABdhPJzDYlRjaCjqMmgzMr0ONYoy8hQKmWyShaF7QubY5uWmm6+5jeTpCRHXkCQI288FNs6ni5jddg==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr7102371wru.110.1631539059525;
        Mon, 13 Sep 2021 06:17:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:38 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 21/26] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date:   Mon, 13 Sep 2021 15:17:02 +0200
Message-Id: <20210913131707.45639-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/drm_gem_atomic_helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..9f51fef82644 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_cursor cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,13 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, false, fence) {
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

