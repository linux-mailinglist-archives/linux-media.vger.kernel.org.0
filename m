Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8C234177AE
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347207AbhIXPdQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347202AbhIXPdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:15 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517D1C061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:41 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id g16so28700366wrb.3
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
        b=gbdY/KA3GiigP6gfzDXQt0kMvxgGUf2PrYOU3yOPF9Kh8nJa9t1fKH9GDL9tktcv7i
         gKBby0cEHW216F0Q3ocIcvrj5fJPs1++oQEOdfDdKv4Bvlt+6tHlqahiQYtyXHBs82iu
         QA6YBMC60kODJvJLwsB2c+cOGwoEtRWfDkUHL0ZExuHvZ0YNmUEksOwXHtJqwFacYSNa
         zvL+YtxiqCgZRCNxqIC87FKyfkvmI+vCAoz5xsV445eo1QUFL0LypbJLbGIhUX/7u82Y
         QEeT+8HjaoFMoWgPJb3TA/UaTMp4SHLyCr43SnnnjC35G6QXBOV5dzhtpel9nPd36qCw
         R4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
        b=hb2cjxwC/2pRjXnidhGjwnV6JDJv0C+rSDBqD8p6D1ZXLZru/GzTclrg851AqAztbc
         vXM68AAspdZMdN6xhxb3S987zkb1XdnzD9NO78oV9bWAS55RXFfP1wRP6VUvNBHYXd55
         vQexYxLDutCmPksniSb8TlTsZmw30Vgd6obpAZjOF5kXokQAj83Db1mVqJNp/KBAKN8p
         fpRfv42Wo1uUem0gp1m6mfvcHVZvQ5gXxU3Z5KKxRAezGfn17JQLiAiuMu+rs+x5crRp
         rx10+voF7K22xw03gdyxZIF/bwRIm+tt6IkwBCk3TyDZyVo8CzNiEuIk/izmN22jvibQ
         pHzw==
X-Gm-Message-State: AOAM532YPpsQfAIN29O86Yvyh0JE8XlCMKjiuLFHftKqYv/DSynueMql
        WwYeNtiylSn2IKs5ra1WRjDditpVGO8=
X-Google-Smtp-Source: ABdhPJythMo56KnpHAm9/NvsZq86P+VwYHnzlv11F1l50InYobwErKrgQWC9UACBlTFYmZT6gOlsYQ==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr12094112wrw.381.1632497499953;
        Fri, 24 Sep 2021 08:31:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:39 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/27] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date:   Fri, 24 Sep 2021 17:31:09 +0200
Message-Id: <20210924153113.2159-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

