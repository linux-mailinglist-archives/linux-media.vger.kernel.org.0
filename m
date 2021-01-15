Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FAC2F83F8
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbhAOSTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387536AbhAOSRb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:17:31 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FC6C0617A0
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:16:20 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id q18so10227081wrn.1
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=klcbd1e9WNIfeT7Kw/V+fGmeHX8/YIMOVJeu6cqS6p8=;
        b=Jeva4W7b5GmkLma0e0Xq2LyelIdviMQ5Xtdc74BWOdiUZov1iTUGSs4RdBxLNmQI6C
         xZ9R5zA0dodI3/TxwKcWEepE4zEOvD40upf9vjbHymNQhp+QdNYGPJzgJIKkQbocLbc8
         cE32+iJI5yVLlTDqLJI9VzVuWhPNvOuhdmUMumzV9EXyb2S83X1nTD0CtHsod8AmpZYQ
         L6y8sevlrSKQa0OomUujlM4Vl0UDvZ7LIStc5x9v9qb62+xiBlnUDNgiirVMuLMGkv1d
         OTqR4QgreqpMCp2pOorq5hOFyE5Pklwlns+yu4dxl3V7HNxbLo/QgIRVxAW56aXa1zOs
         G0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=klcbd1e9WNIfeT7Kw/V+fGmeHX8/YIMOVJeu6cqS6p8=;
        b=dqTEIF6ieZVxtBnLtZQSaDl0VvmVbeqvTOduO+oOINyUR1TAzqfSIp6qUZ5CpanHrn
         y0zy4VvPcyXF0r5ghxe10ehv3eLIwe59Pwnb+yfK9ZpdPnvhMBHbTL2uq55emD+YJYy9
         /Eu2m0fdhlsojsPIae6MH9Py8zgCYo0/CpPdOla8bLlMisBIeZgcPZMUVFRakQTyd0Ec
         FsmYUCTqV8e6W743EfhVqzqptcmh423pUD7mx+WOqHjCz12fNrJWy5sBhSEGzxu27cv1
         dJMe35vHCf3rfQ8yC09AIYMuiL3kYeM34Q3hb9uh2IL9fPhwU5M7g/nLoVLMlIX51Z6m
         nCLw==
X-Gm-Message-State: AOAM53264d9xW+IduDoj+DVC9slME0KIi1td8FW1qb3iduZFUFATCI0C
        xwWVnigEFZtFx4gSQNS7UhLQgQ==
X-Google-Smtp-Source: ABdhPJySoMYDbbVCZgUWIxIqiX91GdBD0424m3xS2BiLVfk/hmUs+W5i3x0nPZ2KmzwAXV+nPvMwOw==
X-Received: by 2002:a05:6000:2cf:: with SMTP id o15mr14224637wry.184.1610734579303;
        Fri, 15 Jan 2021 10:16:19 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 10:16:18 -0800 (PST)
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
Subject: [PATCH 09/29] drm/vmwgfx/ttm_object: Demote half-assed headers and fix-up another
Date:   Fri, 15 Jan 2021 18:15:41 +0000
Message-Id: <20210115181601.3432599-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
2.25.1

