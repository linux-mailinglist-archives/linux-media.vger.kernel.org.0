Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC3D32C71A
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355572AbhCDAbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245191AbhCCNwF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 08:52:05 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC7CC0698CE
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 05:44:29 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id v15so23749150wrx.4
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 05:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9a8uG82AXGJJSEoRJJovLig/Ib2BpsFPbqufrjPoPFE=;
        b=HffZHJVgQU5P83AadrIRV6kXhbhGJisP4W7b8otP0l/09h8RopTD8AL57+IPoMuxWH
         js+ROx/MDvMANLCUB9CyNR/x2FKJwnDELJQnh4+ac0bXc31jeBOfT3ewtZg/8yvpnmDp
         qIE4t59LPglLuXZo0+53Y3BK7gkBowNzY8yiDgfrBlnm91X9JixLzZFxO9uFBR1I/kj5
         OvOsE1aUyrTuj4+Amvtt+mc8m6dfwxBPwty2SEvO6mACifZA+bcWDtAPiHK9hKVipUrs
         HzzmA9SYmLPC2T+qee/iCGuZNUkVVyeADeW1TA86UxlHyJ5EOoQLVC2KdYPFG7Whf7td
         inwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9a8uG82AXGJJSEoRJJovLig/Ib2BpsFPbqufrjPoPFE=;
        b=lpSvRsCiVi+uuxxxnZ7D15G2ZUG/ylrkj1tY+kZzLNCxVBP+Kc2r9+r91dFC70h+oj
         L7Ay6Ghm4+d7esF9vahKLa+j4Oi0zj7DBFTHmKzFm6aE2DsA2xboN5D6Xpz57I2RbmSz
         +ifbepI1gJVhJM21hB96x4cHM69wJMw758rVYanjnUSkKXHlm9NDMpX+Rq2oqUmNXKo1
         5lFSZvuuGJVDxAbkGcOup2Mw4GNqRtOxl+LTCOCitOsENXYiaXG7VCFh+6+jk3U7PoSS
         bEIlHembjm9IhKTuA9KOVIu+iNikil7lKj89f66Vit0gAe8My1gbXyoTrM2BFAuwEAkI
         mS4w==
X-Gm-Message-State: AOAM530dOVkyEcQ5Utem4CAx+JXeQvuFJKpD0htqsOePkpnhsfzYwaCg
        3j18rPe3NStngktqN/qB2hS4Lg==
X-Google-Smtp-Source: ABdhPJzonK3MB46SdxZ8jVQFWi3OAvLxvQxNMnEt1RFxnv9c3LrkIa/7bpy0cvq/azCvtaXzAfKT4g==
X-Received: by 2002:adf:9bcf:: with SMTP id e15mr26672762wrc.276.1614779067956;
        Wed, 03 Mar 2021 05:44:27 -0800 (PST)
Received: from dell.default ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:44:27 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dave Airlie <airlied@redhat.com>,
        Rob Clark <rob.clark@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 51/53] drm/vmwgfx/ttm_object: Demote half-assed headers and fix-up another
Date:   Wed,  3 Mar 2021 13:43:17 +0000
Message-Id: <20210303134319.3160762-52-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/ttm_object.c:60: error: Cannot parse struct or union!
 drivers/gpu/drm/vmwgfx/ttm_object.c:97: warning: Function parameter or member 'mem_glob' not described in 'ttm_object_device'
 drivers/gpu/drm/vmwgfx/ttm_object.c:97: warning: Function parameter or member 'ops' not described in 'ttm_object_device'
 drivers/gpu/drm/vmwgfx/ttm_object.c:97: warning: Function parameter or member 'dmabuf_release' not described in 'ttm_object_device'
 drivers/gpu/drm/vmwgfx/ttm_object.c:97: warning: Function parameter or member 'dma_buf_size' not described in 'ttm_object_device'
 drivers/gpu/drm/vmwgfx/ttm_object.c:97: warning: Function parameter or member 'idr' not described in 'ttm_object_device'
 drivers/gpu/drm/vmwgfx/ttm_object.c:128: warning: Function parameter or member 'rcu_head' not described in 'ttm_ref_object'
 drivers/gpu/drm/vmwgfx/ttm_object.c:128: warning: Function parameter or member 'tfile' not described in 'ttm_ref_object'
 drivers/gpu/drm/vmwgfx/ttm_object.c:582: warning: Function parameter or member 'dmabuf' not described in 'get_dma_buf_unless_doomed'
 drivers/gpu/drm/vmwgfx/ttm_object.c:582: warning: Excess function parameter 'dma_buf' description in 'get_dma_buf_unless_doomed'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Rob Clark <rob.clark@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-10-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/ttm_object.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 0fe869d0fad12..b3fdc630497cb 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -73,7 +73,7 @@ struct ttm_object_file {
 	struct kref refcount;
 };
 
-/**
+/*
  * struct ttm_object_device
  *
  * @object_lock: lock that protects the object_hash hash table.
@@ -96,7 +96,7 @@ struct ttm_object_device {
 	struct idr idr;
 };
 
-/**
+/*
  * struct ttm_ref_object
  *
  * @hash: Hash entry for the per-file object reference hash.
@@ -568,7 +568,7 @@ void ttm_object_device_release(struct ttm_object_device **p_tdev)
 /**
  * get_dma_buf_unless_doomed - get a dma_buf reference if possible.
  *
- * @dma_buf: Non-refcounted pointer to a struct dma-buf.
+ * @dmabuf: Non-refcounted pointer to a struct dma-buf.
  *
  * Obtain a file reference from a lookup structure that doesn't refcount
  * the file, but synchronizes with its release method to make sure it has
-- 
2.27.0

