Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6759940F7BF
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244157AbhIQMg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244052AbhIQMg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:57 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BB4C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:35 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso6789170wmc.1
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ibIrVYeDdndjRxY0zDZkaJhUSUXFhvWWL8GzRn7VBN0=;
        b=nTpCSrxBWqRflD7TltRYtMBxjZX8oKi2IfhO13ZCBM2qt4GQXfVswJjDOlUmCP/mgA
         plaBw1Bdhb01gWkBwiCI/ZkLJmNMg0cOADZis0pl3cKZ89M+LDa5Wgsq74d5U5lLTes4
         R7N4C+UMo88xEXk5VplBMOtug+/L6kvPIjDa7PPLfETO0K7xaKVSeQB9MfqZtQd+kpfd
         Wv0YzDPkI5pIkjFriR66hqR8W5uJ3w2GB+I011kxPnT5/59ek4+gHHpGx7MDpA7yrbFI
         BAzZ533uV6YXtkP+88k6UJ6g6iBn8SXC5Hnus14t+2M+1QoKlqhIFYLxQXJXruX2vaCd
         WF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ibIrVYeDdndjRxY0zDZkaJhUSUXFhvWWL8GzRn7VBN0=;
        b=Kufh+sX1/b0g32x6SewmfwEL0fEdFVjs5tj4+AEP/Tqzhd+U106y4vdnXB8AnLHy5M
         28ti/oZaWLGdXd8yTJ6Z/jwTkAg8IVszSdWugUG2N+cQnWSJpb6/fqPho8mW96kUnbRw
         DqcSbQwYHPWl3BPKy7fo9zQnvPl8uCi/vkOKY5JGTd5cfsiQnYgDfk/cFnztVe6imyo7
         9kXlW/ReJ6tY8TTyC0xfuAyrowBZxSFq1o+VndRCBFdM5alHd8WPDOhv9ASZ8wfdHnET
         vZPsrF+QD53pTJRIX3P+dak3ZbdSV5PcP+etrm8D+Jeh+QejvVMKGzI1CZvBQdo5KhH0
         qMDg==
X-Gm-Message-State: AOAM5310Gx6ru1tofNA6ZOAouWTvAdGIN/0O0017cdHngc9D99s2/66U
        eHa3YnYJ6yMIupgeSWf2cFY=
X-Google-Smtp-Source: ABdhPJxaaMctBBBSc/yluqiL4tEsEQ0z0EM7vwHWdMAeiTkXSi1P8pCp+SZzIrt68qrV1FTEXvFuPg==
X-Received: by 2002:a05:600c:414d:: with SMTP id h13mr14900043wmm.121.1631882133974;
        Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 21/26] drm: use new iterator in drm_gem_plane_helper_prepare_fb v2
Date:   Fri, 17 Sep 2021 14:35:08 +0200
Message-Id: <20210917123513.1106-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..d8f9c6432544 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,18 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		rcu_read_unlock();
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

